DELIMITER ;;
use db_clfutu;;

# 事务_清算期货_清算_转入持仓记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_AddPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_AddPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_pre_settle_price decimal(16,9),
    IN p_curr_qty decimal(18,2),
    IN p_contrc_unit int,
    IN p_comb_code varchar(6),
    IN p_open_amount decimal(18,4),
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
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_pre_settle_price decimal(16,9);
    declare v_curr_qty decimal(18,2);
    declare v_contrc_unit int;
    declare v_comb_code varchar(6);
    declare v_open_amount decimal(18,4);
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
    SET v_row_id = p_row_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_curr_qty = p_curr_qty;
    SET v_contrc_unit = p_contrc_unit;
    SET v_comb_code = p_comb_code;
    SET v_open_amount = p_open_amount;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_清算_转入持仓记录】*/
        call db_clfutu.pra_clfucl_AddPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_row_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_crncy_type,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_lngsht_type,
            v_hedge_type,
            v_pre_settle_price,
            v_curr_qty,
            v_contrc_unit,
            v_comb_code,
            v_open_amount,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.2.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_转入持仓记录出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_清算_清算准备
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_Prepare;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_Prepare(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_deal_info varchar(255)
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
    declare v_record_count int;
    declare v_deal_info varchar(255);

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
    SET v_record_count = 0;
    SET v_deal_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_清算期货_清算_清算准备】*/
    call db_clfutu.pra_clfucl_Prepare(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_record_count,
        v_deal_info);
    if v_error_code = "1" then
        SET v_error_code = "clfutuT.2.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_清算准备出现错误！',v_mysql_message);
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
    SET p_deal_info = v_deal_info;

END;;


DELIMITER ;;
use db_clfutu;;

# 事务_清算期货_清算_转入订单记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_AddOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_AddOrder(
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
    IN p_exch_rate decimal(18,12),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_comm_id bigint,
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_no int,
    IN p_order_batch_no int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_qty decimal(18,2),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_comm_id bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_order_status varchar(2);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_comm_id = p_comm_id;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_no = p_order_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_qty = p_strike_qty;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_order_status = p_order_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_清算_转入订单记录】*/
        call db_clfutu.pra_clfucl_AddOrder(
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
            v_exch_crncy_type,
            v_exch_rate,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_contrc_unit,
            v_comm_id,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_batch_no,
            v_order_dir,
            v_contrc_dir,
            v_hedge_type,
            v_order_price,
            v_order_qty,
            v_wtdraw_qty,
            v_strike_amt,
            v_strike_qty,
            v_report_fee,
            v_wtdraw_fee,
            v_order_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.2.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_转入订单记录出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_清算_查询订单记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_QueryOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_QueryOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_order_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_order_dir_str varchar(1024),
    IN p_contrc_dir_str varchar(64),
    IN p_hedge_type int,
    IN p_order_status varchar(2),
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
    declare v_order_date int;
    declare v_order_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_order_dir_str varchar(1024);
    declare v_contrc_dir_str varchar(64);
    declare v_hedge_type int;
    declare v_order_status varchar(2);
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
    SET v_order_date = p_order_date;
    SET v_order_no = p_order_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_contrc_dir_str = p_contrc_dir_str;
    SET v_hedge_type = p_hedge_type;
    SET v_order_status = p_order_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";",@市场编号串#,";"); */
        set v_exch_no_str=concat(";",v_exch_no_str,";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";",@订单方向串#,";"); */
        set v_order_dir_str=concat(";",v_order_dir_str,";");
    end if;

    /* if @开平方向串# <> " " then */
    if v_contrc_dir_str <> " " then

        /* set @开平方向串#=concat(";",@开平方向串#,";"); */
        set v_contrc_dir_str=concat(";",v_contrc_dir_str,";");
    end if;

    /* 调用【原子_清算期货_清算_查询订单记录】*/
    call db_clfutu.pra_clfucl_QueryOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_date,
        v_order_no,
        v_pass_no,
        v_out_acco,
        v_exch_no_str,
        v_futu_acco_no,
        v_contrc_code_no,
        v_order_dir_str,
        v_contrc_dir_str,
        v_hedge_type,
        v_order_status,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clfutuT.2.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_查询订单记录出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_清算_设置订单记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_UpdateOrderClearFlag;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_UpdateOrderClearFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_deal_flag int,
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
    declare v_deal_flag int;
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
    SET v_deal_flag = p_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_清算_设置订单记录处理标志】*/
        call db_clfutu.pra_clfucl_UpdateOrderClearFlag(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_deal_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.2.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_设置订单记录处理标志出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_清算_转入成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_AddOutBusi;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_AddOutBusi(
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
    IN p_exch_rate decimal(18,12),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_no int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_rece_margin decimal(18,4),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
    IN p_deli_fee decimal(18,4),
    IN p_service_fee decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_out_report_fee decimal(18,4),
    IN p_out_cancel_fee decimal(18,4),
    IN p_out_deli_fee decimal(18,4),
    IN p_out_service_fee decimal(18,4),
    IN p_out_other_fee decimal(18,4),
    IN p_out_brkage_commis decimal(18,4),
    IN p_out_other_commis decimal(18,4),
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_clear_entry_type int,
    IN p_comb_code varchar(6),
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
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_clear_entry_type int;
    declare v_comb_code varchar(6);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_no = p_order_no;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_rece_margin = p_rece_margin;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_deli_fee = p_deli_fee;
    SET v_service_fee = p_service_fee;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_out_report_fee = p_out_report_fee;
    SET v_out_cancel_fee = p_out_cancel_fee;
    SET v_out_deli_fee = p_out_deli_fee;
    SET v_out_service_fee = p_out_service_fee;
    SET v_out_other_fee = p_out_other_fee;
    SET v_out_brkage_commis = p_out_brkage_commis;
    SET v_out_other_commis = p_out_other_commis;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_clear_entry_type = p_clear_entry_type;
    SET v_comb_code = p_comb_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_清算_转入成交记录】*/
        call db_clfutu.pra_clfucl_AddOutBusi(
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
            v_exch_crncy_type,
            v_exch_rate,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_code,
            v_contrc_type,
            v_contrc_unit,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_contrc_dir,
            v_hedge_type,
            v_order_price,
            v_order_qty,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_rece_margin,
            v_report_fee,
            v_wtdraw_fee,
            v_deli_fee,
            v_service_fee,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_out_report_fee,
            v_out_cancel_fee,
            v_out_deli_fee,
            v_out_service_fee,
            v_out_other_fee,
            v_out_brkage_commis,
            v_out_other_commis,
            v_capit_reback_days,
            v_posi_reback_days,
            v_clear_entry_type,
            v_comb_code,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.2.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_转入成交记录出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_清算_查询成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_QueryOutBusi;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_QueryOutBusi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_strike_date int,
    IN p_strike_no varchar(64),
    IN p_out_acco varchar(32),
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_order_dir_str varchar(1024),
    IN p_contrc_dir_str varchar(64),
    IN p_hedge_type int,
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
    declare v_pass_no int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_out_acco varchar(32);
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_order_dir_str varchar(1024);
    declare v_contrc_dir_str varchar(64);
    declare v_hedge_type int;
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
    SET v_pass_no = p_pass_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_no = p_strike_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_order_dir_str = p_order_dir_str;
    SET v_contrc_dir_str = p_contrc_dir_str;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";",@市场编号串#,";"); */
        set v_exch_no_str=concat(";",v_exch_no_str,";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";",@订单方向串#,";"); */
        set v_order_dir_str=concat(";",v_order_dir_str,";");
    end if;

    /* if @开平方向串# <> " " then */
    if v_contrc_dir_str <> " " then

        /* set @开平方向串#=concat(";",@开平方向串#,";"); */
        set v_contrc_dir_str=concat(";",v_contrc_dir_str,";");
    end if;

    /* 调用【原子_清算期货_清算_查询成交记录】*/
    call db_clfutu.pra_clfucl_QueryOutBusi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_strike_date,
        v_strike_no,
        v_pass_no,
        v_out_acco,
        v_exch_no_str,
        v_futu_acco,
        v_contrc_code,
        v_order_dir_str,
        v_contrc_dir_str,
        v_hedge_type,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clfutuT.2.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_查询成交记录出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_清算_设置成交记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_UpdateBusiClearFlag;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_UpdateBusiClearFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_deal_flag int,
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
    declare v_deal_flag int;
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
    SET v_deal_flag = p_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_清算_设置成交记录处理标志】*/
        call db_clfutu.pra_clfucl_UpdateBusiClearFlag(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_deal_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.2.26.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_设置成交记录处理标志出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_清算_清算处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_DealClear;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_DealClear(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_row_id bigint
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
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_sett_price decimal(16,9);
    declare v_pre_settle_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_clear_entry_type int;
    declare v_comb_code varchar(6);
    declare v_deal_flag int;
    declare v_split_strike_flag int;
    declare v_busi_flag int;
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_entry_jour_no bigint;
    declare v_deal_info varchar(255);

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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_sett_price = 0;
    SET v_pre_settle_price = 0;
    SET v_rece_margin = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_service_fee = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_out_report_fee = 0;
    SET v_out_cancel_fee = 0;
    SET v_out_deli_fee = 0;
    SET v_out_service_fee = 0;
    SET v_out_other_fee = 0;
    SET v_out_brkage_commis = 0;
    SET v_out_other_commis = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_clear_entry_type = 0;
    SET v_comb_code = " ";
    SET v_deal_flag = 0;
    SET v_split_strike_flag = 0;
    SET v_busi_flag = 0;
    SET v_pre_entry_amt = 0;
    SET v_pre_entry_qty = 0;
    SET v_entry_jour_no = 0;
    SET v_deal_info = " ";

    
    label_pro:BEGIN
    
    loop_label:loop

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_清算_更新获取成交记录】*/
        call db_clfutu.pra_clfucl_UpdateGetOutBusi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_qry_no,
            v_error_code,
            v_error_info,
            v_record_count,
            v_row_id,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_crncy_type,
            v_exch_crncy_type,
            v_exch_rate,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_contrc_unit,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_contrc_dir,
            v_hedge_type,
            v_order_price,
            v_order_qty,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_sett_price,
            v_pre_settle_price,
            v_rece_margin,
            v_report_fee,
            v_wtdraw_fee,
            v_deli_fee,
            v_service_fee,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_out_report_fee,
            v_out_cancel_fee,
            v_out_deli_fee,
            v_out_service_fee,
            v_out_other_fee,
            v_out_brkage_commis,
            v_out_other_commis,
            v_capit_reback_days,
            v_posi_reback_days,
            v_clear_entry_type,
            v_comb_code,
            v_deal_flag);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.2.37.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_更新获取成交记录出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @记录个数# = 0 then */
        if v_record_count = 0 then

            /* set @错误编码# = "0"; */
            set v_error_code = "0";

            /* set @错误信息# = " "; */
            set v_error_info = " ";
            leave label_pro;
        end if;
        #分笔成交标志，清算表中记录为分笔'0'，合并清算表为合笔'1'

        /* set @分笔成交标志# = 《分笔成交标志-单笔成交》; */
        set v_split_strike_flag = 1;

        /* if @订单数量#<>@成交数量# then */
        if v_order_qty<>v_strike_qty then

            /* set @分笔成交标志# = 《分笔成交标志-多笔成交》; */
            set v_split_strike_flag = 2;
        end if;
        #确定业务标志，业务标志由2位业务大类，2位业务类型（合约类型），3位业务编码组成

        /* set @业务标志# = 3000000; */
        set v_busi_flag = 3000000;
        #合约类型 1股指期货 2商品期货, 暂时不区分合约类型

        /* set @业务标志# = @业务标志# + 1000; */
        set v_busi_flag = v_busi_flag + 1000;
        #订单方向、开平方向

        /* if @订单方向# = 《订单方向-买入》 and @开平方向# = 《开平方向-开仓》 then */
        if v_order_dir = 1 and v_contrc_dir = 1 then

            /* set @业务标志# = @业务标志# + 1; */
            set v_busi_flag = v_busi_flag + 1;

        /* elseif @订单方向# = 《订单方向-卖出》  and @开平方向# = 《开平方向-开仓》 then */
        elseif v_order_dir = 2  and v_contrc_dir = 1 then

            /* set @业务标志# = @业务标志# + 2; */
            set v_busi_flag = v_busi_flag + 2;

        /* elseif @订单方向# = 《订单方向-买入》 and @开平方向# = 《开平方向-平仓》 then */
        elseif v_order_dir = 1 and v_contrc_dir = 2 then

            /* set @业务标志# = @业务标志# + 3; */
            set v_busi_flag = v_busi_flag + 3;

        /* elseif @订单方向# = 《订单方向-卖出》  and @开平方向# = 《开平方向-平仓》 then */
        elseif v_order_dir = 2  and v_contrc_dir = 2 then

            /* set @业务标志# = @业务标志# + 4; */
            set v_busi_flag = v_busi_flag + 4;

        /* elseif @订单方向# = 《订单方向-买入》 and @开平方向# = 《开平方向-平今仓》 then */
        elseif v_order_dir = 1 and v_contrc_dir = 3 then

            /* set @业务标志# = @业务标志# + 5; */
            set v_busi_flag = v_busi_flag + 5;

        /* elseif @订单方向# = 《订单方向-卖出》  and @开平方向# = 《开平方向-平今仓》 then */
        elseif v_order_dir = 2  and v_contrc_dir = 3 then

            /* set @业务标志# = @业务标志# + 6; */
            set v_busi_flag = v_busi_flag + 6;
        end if;
        #本次清算金额，为-所有费用，此处不需要加入申报费用、撤单费用、交割费用

        /* set @申报费用# = 0; */
        set v_report_fee = 0;

        /* set @撤单费用# = 0; */
        set v_wtdraw_fee = 0;

        /* set @交割费用# = 0; */
        set v_deli_fee = 0;

        /* set @待入账金额# = - (@申报费用# + @撤单费用# + @交割费用# + @手续费用# + @其他费用# + @交易佣金# + @其他佣金#); */
        set v_pre_entry_amt = - (v_report_fee + v_wtdraw_fee + v_deli_fee + v_service_fee + v_other_fee + v_trade_commis + v_other_commis);
        #置待入账数量，与开平方向相关

        /* if @开平方向# = 《开平方向-开仓》 then */
        if v_contrc_dir = 1 then
            #本次清算数量为待入账数量，即成交数量

            /* set @待入账数量# = @成交数量#; */
            set v_pre_entry_qty = v_strike_qty;

        /* elseif @开平方向# = 《开平方向-平仓》 or @开平方向# = 《开平方向-平今仓》 then */
        elseif v_contrc_dir = 2 or v_contrc_dir = 3 then
            #本次清算数量为待入账数量，即负的成交数量（卖出为负）

            /* set @待入账数量# = -@成交数量#; */
            set v_pre_entry_qty = -v_strike_qty;
        end if;

        /* 调用【原子_清算期货_清算_清算处理】*/
        call db_clfutu.pra_clfucl_DealClear(
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
            v_exch_crncy_type,
            v_exch_rate,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_contrc_unit,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_contrc_dir,
            v_hedge_type,
            v_order_price,
            v_order_qty,
            v_sett_price,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_pre_entry_amt,
            v_pre_entry_qty,
            v_rece_margin,
            v_report_fee,
            v_wtdraw_fee,
            v_deli_fee,
            v_service_fee,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_out_report_fee,
            v_out_cancel_fee,
            v_out_deli_fee,
            v_out_service_fee,
            v_out_other_fee,
            v_out_brkage_commis,
            v_out_other_commis,
            v_clear_entry_type,
            v_split_strike_flag,
            v_busi_flag,
            v_comb_code,
            v_error_code,
            v_error_info,
            v_entry_jour_no);

        /* if @错误编码# <> '0' then */
        if v_error_code <> '0' then

            /* set @处理信息# = concat("清算处理原子错误: 错误编码=", @错误编码#,"错误信息=", @错误信息#); */
            set v_deal_info = concat("清算处理原子错误: 错误编码=", v_error_code,"错误信息=", v_error_info);

            /* 调用【事务_清算期货_清算_记录处理信息】*/
            call db_clfutu.prt_clfucl_DealException(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_deal_info,
                v_error_code,
                v_error_info);

            /* set @错误编码# = "0"; */
            set v_error_code = "0";

            /* set @错误信息# = " "; */
            set v_error_info = " ";
        end if;

    /* [事务结束] */
    COMMIT;

    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_clfutu;;

# 事务_清算期货_清算_订单费用处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_DealOrderFare;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_DealOrderFare(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_row_id bigint
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
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_comm_id bigint;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_batch_no int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_order_status varchar(2);
    declare v_busi_flag int;
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_entry_jour_no bigint;

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
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_comm_id = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_batch_no = 0;
    SET v_order_dir = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_order_status = "0";
    SET v_busi_flag = 0;
    SET v_pre_entry_amt = 0;
    SET v_pre_entry_qty = 0;
    SET v_entry_jour_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;

        #订单费用处理处理委托申报费用和撤单费用，根据订单状态来处理；

        /* 调用【原子_清算期货_清算_更新获取订单记录】*/
        call db_clfutu.pra_clfucl_UpdateGetOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info,
            v_record_count,
            v_row_id,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_crncy_type,
            v_exch_crncy_type,
            v_exch_rate,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_contrc_unit,
            v_comm_id,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_batch_no,
            v_order_dir,
            v_contrc_dir,
            v_hedge_type,
            v_order_price,
            v_order_qty,
            v_wtdraw_qty,
            v_strike_amt,
            v_strike_qty,
            v_report_fee,
            v_wtdraw_fee,
            v_order_status);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.2.38.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_更新获取订单记录出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if (@申报费用# <> 0) or (@撤单费用# <> 0) then */
        if (v_report_fee <> 0) or (v_wtdraw_fee <> 0) then
            #业务标志

            /* set @业务标志# = 《期货费用入账》; */
            set v_busi_flag = 期货费用入账;

            /* set @待入账金额#=-(@申报费用# + @撤单费用#); */
            set v_pre_entry_amt=-(v_report_fee + v_wtdraw_fee);

            /* set @待入账数量#=0; */
            set v_pre_entry_qty=0;

            /* 调用【原子_清算期货_清算_订单费用处理】*/
            call db_clfutu.pra_clfucl_DealOrderFare(
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
                v_exch_crncy_type,
                v_exch_rate,
                v_exch_no,
                v_futu_acco_no,
                v_contrc_code_no,
                v_contrc_type,
                v_contrc_unit,
                v_report_date,
                v_report_time,
                v_report_no,
                v_order_date,
                v_order_time,
                v_order_no,
                v_order_dir,
                v_contrc_dir,
                v_hedge_type,
                v_order_price,
                v_order_qty,
                v_pre_entry_amt,
                v_pre_entry_qty,
                v_report_fee,
                v_wtdraw_fee,
                v_busi_flag,
                v_error_code,
                v_error_info,
                v_entry_jour_no);
            if v_error_code = "1" then
                SET v_error_code = "clfutuT.2.38.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_订单费用处理出现错误！',v_mysql_message);
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
    SET p_record_count = v_record_count;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_clfutu;;

# 事务_清算期货_清算_更新待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_UpdatePreEntry;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_UpdatePreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_entry_money_jour_no bigint,
    IN p_entry_exgp_posi_jour_no bigint,
    IN p_entry_asac_posi_jour_no bigint,
    IN p_entry_status varchar(2),
    IN p_undo_status varchar(2),
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
    declare v_row_id bigint;
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
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
    SET v_row_id = p_row_id;
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_exgp_posi_jour_no = p_entry_exgp_posi_jour_no;
    SET v_entry_asac_posi_jour_no = p_entry_asac_posi_jour_no;
    SET v_entry_status = p_entry_status;
    SET v_undo_status = p_undo_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_清算_更新待入账记录】*/
        call db_clfutu.pra_clfucl_UpdatePreEntry(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_row_id,
            v_entry_money_jour_no,
            v_entry_exgp_posi_jour_no,
            v_entry_asac_posi_jour_no,
            v_entry_status,
            v_undo_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.2.57.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_更新待入账记录出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_清算_查询待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_QueryPreEntry;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_QueryPreEntry(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_crncy_type_str varchar(2048),
    IN p_entry_status varchar(2),
    IN p_undo_status varchar(2),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_crncy_type_str varchar(2048);
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_entry_status = p_entry_status;
    SET v_undo_status = p_undo_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";",@市场编号串#,";"); */
        set v_exch_no_str=concat(";",v_exch_no_str,";");
    end if;

    /* if @本币币种串# <> " " then */
    if v_crncy_type_str <> " " then

        /* set @本币币种串#=concat(";",@本币币种串#,";"); */
        set v_crncy_type_str=concat(";",v_crncy_type_str,";");
    end if;

    /* 调用【原子_清算期货_清算_查询待入账记录】*/
    call db_clfutu.pra_clfucl_QueryPreEntry(
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
        v_exch_no_str,
        v_futu_acco_no,
        v_contrc_code_no,
        v_crncy_type_str,
        v_entry_status,
        v_undo_status,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clfutuT.2.58.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_查询待入账记录出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_清算_更新获取待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_GetPreEntry;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_GetPreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12),
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_no int,
    OUT p_order_dir int,
    OUT p_contrc_dir int,
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_sett_price decimal(16,9),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_num int,
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_long_hold_margin decimal(18,4),
    OUT p_short_hold_margin decimal(18,4),
    OUT p_sett_capt_margin decimal(18,4),
    OUT p_sett_close_pandl decimal(18,4),
    OUT p_sett_marked_pandl decimal(18,4),
    OUT p_sett_close_pandl_today decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_deli_fee decimal(18,4),
    OUT p_service_fee decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_out_all_fee decimal(18,4),
    OUT p_out_report_fee decimal(18,4),
    OUT p_out_cancel_fee decimal(18,4),
    OUT p_out_deli_fee decimal(18,4),
    OUT p_out_service_fee decimal(18,4),
    OUT p_out_other_fee decimal(18,4),
    OUT p_out_brkage_commis decimal(18,4),
    OUT p_out_other_commis decimal(18,4),
    OUT p_busi_flag int,
    OUT p_entry_status varchar(2),
    OUT p_undo_status varchar(2),
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_posi_jour_no bigint,
    OUT p_deli_jour_no bigint,
    OUT p_open_amount decimal(18,4)
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
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_sett_capt_margin decimal(18,4);
    declare v_sett_close_pandl decimal(18,4);
    declare v_sett_marked_pandl decimal(18,4);
    declare v_sett_close_pandl_today decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_open_amount decimal(18,4);

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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_contrc_dir = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_pre_settle_price = 0;
    SET v_sett_price = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_num = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_rece_margin = 0;
    SET v_comb_code = " ";
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_sett_capt_margin = 0;
    SET v_sett_close_pandl = 0;
    SET v_sett_marked_pandl = 0;
    SET v_sett_close_pandl_today = 0;
    SET v_all_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_service_fee = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_out_all_fee = 0;
    SET v_out_report_fee = 0;
    SET v_out_cancel_fee = 0;
    SET v_out_deli_fee = 0;
    SET v_out_service_fee = 0;
    SET v_out_other_fee = 0;
    SET v_out_brkage_commis = 0;
    SET v_out_other_commis = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_entry_money_jour_no = 0;
    SET v_entry_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_open_amount = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_清算_更新获取待入账记录】*/
        call db_clfutu.pra_clfucl_UpdateGetPreEntry(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_qry_no,
            v_error_code,
            v_error_info,
            v_record_count,
            v_row_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_crncy_type,
            v_exch_crncy_type,
            v_exch_rate,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_contrc_unit,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_contrc_dir,
            v_lngsht_type,
            v_hedge_type,
            v_order_price,
            v_order_qty,
            v_pre_settle_price,
            v_sett_price,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_strike_num,
            v_pre_entry_qty,
            v_pre_entry_amt,
            v_rece_margin,
            v_comb_code,
            v_long_hold_margin,
            v_short_hold_margin,
            v_sett_capt_margin,
            v_sett_close_pandl,
            v_sett_marked_pandl,
            v_sett_close_pandl_today,
            v_all_fee,
            v_report_fee,
            v_wtdraw_fee,
            v_deli_fee,
            v_service_fee,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_out_all_fee,
            v_out_report_fee,
            v_out_cancel_fee,
            v_out_deli_fee,
            v_out_service_fee,
            v_out_other_fee,
            v_out_brkage_commis,
            v_out_other_commis,
            v_busi_flag,
            v_entry_status,
            v_undo_status,
            v_entry_money_jour_no,
            v_entry_posi_jour_no,
            v_deli_jour_no,
            v_open_amount);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.2.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_更新获取待入账记录出现错误！',v_mysql_message);
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
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_no = v_order_no;
    SET p_order_dir = v_order_dir;
    SET p_contrc_dir = v_contrc_dir;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_sett_price = v_sett_price;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_num = v_strike_num;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_rece_margin = v_rece_margin;
    SET p_comb_code = v_comb_code;
    SET p_long_hold_margin = v_long_hold_margin;
    SET p_short_hold_margin = v_short_hold_margin;
    SET p_sett_capt_margin = v_sett_capt_margin;
    SET p_sett_close_pandl = v_sett_close_pandl;
    SET p_sett_marked_pandl = v_sett_marked_pandl;
    SET p_sett_close_pandl_today = v_sett_close_pandl_today;
    SET p_all_fee = v_all_fee;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_deli_fee = v_deli_fee;
    SET p_service_fee = v_service_fee;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_out_all_fee = v_out_all_fee;
    SET p_out_report_fee = v_out_report_fee;
    SET p_out_cancel_fee = v_out_cancel_fee;
    SET p_out_deli_fee = v_out_deli_fee;
    SET p_out_service_fee = v_out_service_fee;
    SET p_out_other_fee = v_out_other_fee;
    SET p_out_brkage_commis = v_out_brkage_commis;
    SET p_out_other_commis = v_out_other_commis;
    SET p_busi_flag = v_busi_flag;
    SET p_entry_status = v_entry_status;
    SET p_undo_status = v_undo_status;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_posi_jour_no = v_entry_posi_jour_no;
    SET p_deli_jour_no = v_deli_jour_no;
    SET p_open_amount = v_open_amount;

END;;


DELIMITER ;;
use db_clfutu;;

# 事务_清算期货_清算_更新获取回滚待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_UpdateGetPreEntryUndo;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_UpdateGetPreEntryUndo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12),
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_no int,
    OUT p_order_dir int,
    OUT p_contrc_dir int,
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_sett_price decimal(16,9),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_num int,
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_long_hold_margin decimal(18,4),
    OUT p_short_hold_margin decimal(18,4),
    OUT p_sett_capt_margin decimal(18,4),
    OUT p_sett_close_pandl decimal(18,4),
    OUT p_sett_marked_pandl decimal(18,4),
    OUT p_sett_close_pandl_today decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_deli_fee decimal(18,4),
    OUT p_service_fee decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_out_all_fee decimal(18,4),
    OUT p_out_report_fee decimal(18,4),
    OUT p_out_cancel_fee decimal(18,4),
    OUT p_out_deli_fee decimal(18,4),
    OUT p_out_service_fee decimal(18,4),
    OUT p_out_other_fee decimal(18,4),
    OUT p_out_brkage_commis decimal(18,4),
    OUT p_out_other_commis decimal(18,4),
    OUT p_busi_flag int,
    OUT p_entry_status varchar(2),
    OUT p_undo_status varchar(2),
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_exgp_posi_jour_no bigint,
    OUT p_entry_asac_posi_jour_no bigint,
    OUT p_deli_jour_no bigint
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
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_sett_capt_margin decimal(18,4);
    declare v_sett_close_pandl decimal(18,4);
    declare v_sett_marked_pandl decimal(18,4);
    declare v_sett_close_pandl_today decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_deli_jour_no bigint;

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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_contrc_dir = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_pre_settle_price = 0;
    SET v_sett_price = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_num = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_rece_margin = 0;
    SET v_comb_code = " ";
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_sett_capt_margin = 0;
    SET v_sett_close_pandl = 0;
    SET v_sett_marked_pandl = 0;
    SET v_sett_close_pandl_today = 0;
    SET v_all_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_service_fee = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_out_all_fee = 0;
    SET v_out_report_fee = 0;
    SET v_out_cancel_fee = 0;
    SET v_out_deli_fee = 0;
    SET v_out_service_fee = 0;
    SET v_out_other_fee = 0;
    SET v_out_brkage_commis = 0;
    SET v_out_other_commis = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_deli_jour_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_清算_更新获取回滚待入账记录】*/
        call db_clfutu.pra_clfucl_UpdateGetPreEntryUndo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_qry_no,
            v_error_code,
            v_error_info,
            v_record_count,
            v_row_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_crncy_type,
            v_exch_crncy_type,
            v_exch_rate,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_contrc_unit,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_contrc_dir,
            v_lngsht_type,
            v_hedge_type,
            v_order_price,
            v_order_qty,
            v_pre_settle_price,
            v_sett_price,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_strike_num,
            v_pre_entry_qty,
            v_pre_entry_amt,
            v_rece_margin,
            v_comb_code,
            v_long_hold_margin,
            v_short_hold_margin,
            v_sett_capt_margin,
            v_sett_close_pandl,
            v_sett_marked_pandl,
            v_sett_close_pandl_today,
            v_all_fee,
            v_report_fee,
            v_wtdraw_fee,
            v_deli_fee,
            v_service_fee,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_out_all_fee,
            v_out_report_fee,
            v_out_cancel_fee,
            v_out_deli_fee,
            v_out_service_fee,
            v_out_other_fee,
            v_out_brkage_commis,
            v_out_other_commis,
            v_busi_flag,
            v_entry_status,
            v_undo_status,
            v_entry_money_jour_no,
            v_entry_exgp_posi_jour_no,
            v_entry_asac_posi_jour_no,
            v_deli_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.2.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_更新获取回滚待入账记录出现错误！',v_mysql_message);
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
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_no = v_order_no;
    SET p_order_dir = v_order_dir;
    SET p_contrc_dir = v_contrc_dir;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_sett_price = v_sett_price;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_num = v_strike_num;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_rece_margin = v_rece_margin;
    SET p_comb_code = v_comb_code;
    SET p_long_hold_margin = v_long_hold_margin;
    SET p_short_hold_margin = v_short_hold_margin;
    SET p_sett_capt_margin = v_sett_capt_margin;
    SET p_sett_close_pandl = v_sett_close_pandl;
    SET p_sett_marked_pandl = v_sett_marked_pandl;
    SET p_sett_close_pandl_today = v_sett_close_pandl_today;
    SET p_all_fee = v_all_fee;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_deli_fee = v_deli_fee;
    SET p_service_fee = v_service_fee;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_out_all_fee = v_out_all_fee;
    SET p_out_report_fee = v_out_report_fee;
    SET p_out_cancel_fee = v_out_cancel_fee;
    SET p_out_deli_fee = v_out_deli_fee;
    SET p_out_service_fee = v_out_service_fee;
    SET p_out_other_fee = v_out_other_fee;
    SET p_out_brkage_commis = v_out_brkage_commis;
    SET p_out_other_commis = v_out_other_commis;
    SET p_busi_flag = v_busi_flag;
    SET p_entry_status = v_entry_status;
    SET p_undo_status = v_undo_status;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no;
    SET p_entry_asac_posi_jour_no = v_entry_asac_posi_jour_no;
    SET p_deli_jour_no = v_deli_jour_no;

END;;


DELIMITER ;;
use db_clfutu;;

# 事务_清算期货_清算_入账异常处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_DealEntryError;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_DealEntryError(
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
    IN p_exch_rate decimal(18,12),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_no int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_pre_settle_price decimal(16,9),
    IN p_sett_price decimal(16,9),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_num int,
    IN p_pre_entry_qty decimal(18,2),
    IN p_pre_entry_amt decimal(18,4),
    IN p_rece_margin decimal(18,4),
    IN p_comb_code varchar(6),
    IN p_comb_type int,
    IN p_comb_name varchar(64),
    IN p_long_hold_margin decimal(18,4),
    IN p_short_hold_margin decimal(18,4),
    IN p_sett_capt_margin decimal(18,4),
    IN p_sett_close_pandl decimal(18,4),
    IN p_sett_marked_pandl decimal(18,4),
    IN p_sett_close_pandl_today decimal(18,4),
    IN p_all_fee decimal(18,4),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
    IN p_deli_fee decimal(18,4),
    IN p_service_fee decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_out_all_fee decimal(18,4),
    IN p_out_report_fee decimal(18,4),
    IN p_out_cancel_fee decimal(18,4),
    IN p_out_deli_fee decimal(18,4),
    IN p_out_service_fee decimal(18,4),
    IN p_out_other_fee decimal(18,4),
    IN p_out_brkage_commis decimal(18,4),
    IN p_out_other_commis decimal(18,4),
    IN p_busi_flag int,
    IN p_undo_error_no int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_comb_type int;
    declare v_comb_name varchar(64);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_sett_capt_margin decimal(18,4);
    declare v_sett_close_pandl decimal(18,4);
    declare v_sett_marked_pandl decimal(18,4);
    declare v_sett_close_pandl_today decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_busi_flag int;
    declare v_undo_error_no int;
    declare v_remark_info varchar(255);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_no = p_order_no;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_sett_price = p_sett_price;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_num = p_strike_num;
    SET v_pre_entry_qty = p_pre_entry_qty;
    SET v_pre_entry_amt = p_pre_entry_amt;
    SET v_rece_margin = p_rece_margin;
    SET v_comb_code = p_comb_code;
    SET v_comb_type = p_comb_type;
    SET v_comb_name = p_comb_name;
    SET v_long_hold_margin = p_long_hold_margin;
    SET v_short_hold_margin = p_short_hold_margin;
    SET v_sett_capt_margin = p_sett_capt_margin;
    SET v_sett_close_pandl = p_sett_close_pandl;
    SET v_sett_marked_pandl = p_sett_marked_pandl;
    SET v_sett_close_pandl_today = p_sett_close_pandl_today;
    SET v_all_fee = p_all_fee;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_deli_fee = p_deli_fee;
    SET v_service_fee = p_service_fee;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_out_all_fee = p_out_all_fee;
    SET v_out_report_fee = p_out_report_fee;
    SET v_out_cancel_fee = p_out_cancel_fee;
    SET v_out_deli_fee = p_out_deli_fee;
    SET v_out_service_fee = p_out_service_fee;
    SET v_out_other_fee = p_out_other_fee;
    SET v_out_brkage_commis = p_out_brkage_commis;
    SET v_out_other_commis = p_out_other_commis;
    SET v_busi_flag = p_busi_flag;
    SET v_undo_error_no = p_undo_error_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_清算_入账异常处理】*/
        call db_clfutu.pra_clfucl_DealEntryError(
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
            v_exch_crncy_type,
            v_exch_rate,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_contrc_unit,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_contrc_dir,
            v_lngsht_type,
            v_hedge_type,
            v_order_price,
            v_order_qty,
            v_pre_settle_price,
            v_sett_price,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_strike_num,
            v_pre_entry_qty,
            v_pre_entry_amt,
            v_rece_margin,
            v_comb_code,
            v_comb_type,
            v_comb_name,
            v_long_hold_margin,
            v_short_hold_margin,
            v_sett_capt_margin,
            v_sett_close_pandl,
            v_sett_marked_pandl,
            v_sett_close_pandl_today,
            v_all_fee,
            v_report_fee,
            v_wtdraw_fee,
            v_deli_fee,
            v_service_fee,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_out_all_fee,
            v_out_report_fee,
            v_out_cancel_fee,
            v_out_deli_fee,
            v_out_service_fee,
            v_out_other_fee,
            v_out_brkage_commis,
            v_out_other_commis,
            v_busi_flag,
            v_undo_error_no,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.2.63.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_入账异常处理出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_清算_获取清算处理统计值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_GetClrTotalData;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_GetClrTotalData(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pre_clr_strike_qty decimal(18,2),
    OUT p_alr_clr_strike_qty decimal(18,2),
    OUT p_pre_entry_record_qty decimal(18,2),
    OUT p_alr_entry_record_qty decimal(18,2)
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
    declare v_pre_clr_strike_qty decimal(18,2);
    declare v_alr_clr_strike_qty decimal(18,2);
    declare v_pre_entry_record_qty decimal(18,2);
    declare v_alr_entry_record_qty decimal(18,2);

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
    SET v_pre_clr_strike_qty = 0;
    SET v_alr_clr_strike_qty = 0;
    SET v_pre_entry_record_qty = 0;
    SET v_alr_entry_record_qty = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_清算期货_清算_获取清算处理统计值】*/
    call db_clfutu.pra_clfucl_GetClrTotalData(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_error_code,
        v_error_info,
        v_pre_clr_strike_qty,
        v_alr_clr_strike_qty,
        v_pre_entry_record_qty,
        v_alr_entry_record_qty);
    if v_error_code = "1" then
        SET v_error_code = "clfutuT.2.72.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_获取清算处理统计值出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pre_clr_strike_qty = v_pre_clr_strike_qty;
    SET p_alr_clr_strike_qty = v_alr_clr_strike_qty;
    SET p_pre_entry_record_qty = v_pre_entry_record_qty;
    SET p_alr_entry_record_qty = v_alr_entry_record_qty;

END;;


DELIMITER ;;
use db_clfutu;;

# 事务_清算期货_清算_记录处理信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_DealException;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_DealException(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_deal_info varchar(255),
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
    declare v_deal_info varchar(255);
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
    SET v_deal_info = p_deal_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_清算_记录处理信息】*/
        call db_clfutu.pra_clfucl_DealException(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_deal_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.2.81.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_记录处理信息出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_清算_回写入账流水号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_UpdateEntryJour;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_UpdateEntryJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_entry_money_jour_no bigint,
    IN p_entry_exgp_posi_jour_no bigint,
    IN p_entry_asac_posi_jour_no bigint,
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
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
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
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_exgp_posi_jour_no = p_entry_exgp_posi_jour_no;
    SET v_entry_asac_posi_jour_no = p_entry_asac_posi_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_清算_回写入账流水号】*/
        call db_clfutu.pra_clfucl_UpdateEntryJour(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_entry_money_jour_no,
            v_entry_exgp_posi_jour_no,
            v_entry_asac_posi_jour_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.2.83.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_回写入账流水号出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_清算_查询成交序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_QueryStrikeId;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_QueryStrikeId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
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
    declare v_qry_no int;
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
    SET v_qry_no = p_qry_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_清算期货_清算_查询成交序号】*/
    call db_clfutu.pra_clfucl_QueryStrikeId(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_no,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clfutuT.2.84.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_查询成交序号出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_清算_查询待入账记录序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_QueryPreEntryId;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_QueryPreEntryId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
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
    declare v_qry_no int;
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
    SET v_qry_no = p_qry_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_清算期货_清算_查询待入账记录序号】*/
    call db_clfutu.pra_clfucl_QueryPreEntryId(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_no,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clfutuT.2.85.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_查询待入账记录序号出现错误！',v_mysql_message);
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
use db_clfutu;;

# 事务_清算期货_清算_自动更新获取待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clfucl_AutoGetPreEntry;;
DELIMITER ;;
CREATE PROCEDURE prt_clfucl_AutoGetPreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12),
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_no int,
    OUT p_order_dir int,
    OUT p_contrc_dir int,
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_sett_price decimal(16,9),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_num int,
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_long_hold_margin decimal(18,4),
    OUT p_short_hold_margin decimal(18,4),
    OUT p_sett_capt_margin decimal(18,4),
    OUT p_sett_close_pandl decimal(18,4),
    OUT p_sett_marked_pandl decimal(18,4),
    OUT p_sett_close_pandl_today decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_deli_fee decimal(18,4),
    OUT p_service_fee decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_out_all_fee decimal(18,4),
    OUT p_out_report_fee decimal(18,4),
    OUT p_out_cancel_fee decimal(18,4),
    OUT p_out_deli_fee decimal(18,4),
    OUT p_out_service_fee decimal(18,4),
    OUT p_out_other_fee decimal(18,4),
    OUT p_out_brkage_commis decimal(18,4),
    OUT p_out_other_commis decimal(18,4),
    OUT p_busi_flag int,
    OUT p_entry_status varchar(2),
    OUT p_undo_status varchar(2),
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_posi_jour_no bigint,
    OUT p_deli_jour_no bigint,
    OUT p_open_amount decimal(18,4)
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
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_sett_capt_margin decimal(18,4);
    declare v_sett_close_pandl decimal(18,4);
    declare v_sett_marked_pandl decimal(18,4);
    declare v_sett_close_pandl_today decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_open_amount decimal(18,4);

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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_contrc_dir = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_pre_settle_price = 0;
    SET v_sett_price = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_num = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_rece_margin = 0;
    SET v_comb_code = " ";
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_sett_capt_margin = 0;
    SET v_sett_close_pandl = 0;
    SET v_sett_marked_pandl = 0;
    SET v_sett_close_pandl_today = 0;
    SET v_all_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_service_fee = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_out_all_fee = 0;
    SET v_out_report_fee = 0;
    SET v_out_cancel_fee = 0;
    SET v_out_deli_fee = 0;
    SET v_out_service_fee = 0;
    SET v_out_other_fee = 0;
    SET v_out_brkage_commis = 0;
    SET v_out_other_commis = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_entry_money_jour_no = 0;
    SET v_entry_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_open_amount = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_清算期货_清算_自动更新获取待入账记录】*/
        call db_clfutu.pra_clfucl_AutoUpdateGetPreEntry(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_qry_no,
            v_error_code,
            v_error_info,
            v_record_count,
            v_row_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_crncy_type,
            v_exch_crncy_type,
            v_exch_rate,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_contrc_unit,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_contrc_dir,
            v_lngsht_type,
            v_hedge_type,
            v_order_price,
            v_order_qty,
            v_pre_settle_price,
            v_sett_price,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_strike_num,
            v_pre_entry_qty,
            v_pre_entry_amt,
            v_rece_margin,
            v_comb_code,
            v_long_hold_margin,
            v_short_hold_margin,
            v_sett_capt_margin,
            v_sett_close_pandl,
            v_sett_marked_pandl,
            v_sett_close_pandl_today,
            v_all_fee,
            v_report_fee,
            v_wtdraw_fee,
            v_deli_fee,
            v_service_fee,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_out_all_fee,
            v_out_report_fee,
            v_out_cancel_fee,
            v_out_deli_fee,
            v_out_service_fee,
            v_out_other_fee,
            v_out_brkage_commis,
            v_out_other_commis,
            v_busi_flag,
            v_entry_status,
            v_undo_status,
            v_entry_money_jour_no,
            v_entry_posi_jour_no,
            v_deli_jour_no,
            v_open_amount);
        if v_error_code = "1" then
            SET v_error_code = "clfutuT.2.86.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算期货_清算_自动更新获取待入账记录出现错误！',v_mysql_message);
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
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_no = v_order_no;
    SET p_order_dir = v_order_dir;
    SET p_contrc_dir = v_contrc_dir;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_sett_price = v_sett_price;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_num = v_strike_num;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_rece_margin = v_rece_margin;
    SET p_comb_code = v_comb_code;
    SET p_long_hold_margin = v_long_hold_margin;
    SET p_short_hold_margin = v_short_hold_margin;
    SET p_sett_capt_margin = v_sett_capt_margin;
    SET p_sett_close_pandl = v_sett_close_pandl;
    SET p_sett_marked_pandl = v_sett_marked_pandl;
    SET p_sett_close_pandl_today = v_sett_close_pandl_today;
    SET p_all_fee = v_all_fee;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_deli_fee = v_deli_fee;
    SET p_service_fee = v_service_fee;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_out_all_fee = v_out_all_fee;
    SET p_out_report_fee = v_out_report_fee;
    SET p_out_cancel_fee = v_out_cancel_fee;
    SET p_out_deli_fee = v_out_deli_fee;
    SET p_out_service_fee = v_out_service_fee;
    SET p_out_other_fee = v_out_other_fee;
    SET p_out_brkage_commis = v_out_brkage_commis;
    SET p_out_other_commis = v_out_other_commis;
    SET p_busi_flag = v_busi_flag;
    SET p_entry_status = v_entry_status;
    SET p_undo_status = v_undo_status;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_posi_jour_no = v_entry_posi_jour_no;
    SET p_deli_jour_no = v_deli_jour_no;
    SET p_open_amount = v_open_amount;

END;;


