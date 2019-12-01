DELIMITER ;;
use db_pub;;

# 事务_公共_基础数据同步_查询新股信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_QueryNewStockTable;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_QueryNewStockTable(
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
    

    /* 调用【原子_公共_基础数据同步_查询新股信息表】*/
    call db_pub.pra_basesync_QueryNewStockTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.101.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_查询新股信息表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_更新新股信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_UpdateNewStockTable;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_UpdateNewStockTable(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_trade_code varchar(6),
    IN p_target_code varchar(6),
    IN p_stock_code_no int,
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_apply_date int,
    IN p_apply_limit decimal(18,2),
    IN p_begin_trade_date int,
    IN p_issue_price decimal(16,9),
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);
    declare v_stock_code_no int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_apply_date int;
    declare v_apply_limit decimal(18,2);
    declare v_begin_trade_date int;
    declare v_issue_price decimal(16,9);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_trade_code = p_trade_code;
    SET v_target_code = p_target_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_apply_date = p_apply_date;
    SET v_apply_limit = p_apply_limit;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_issue_price = p_issue_price;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_公共_基础数据同步_更新新股信息表】*/
    call db_pub.pra_basesync_UpdateNewStockTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_stock_name,
        v_trade_code,
        v_target_code,
        v_stock_code_no,
        v_trade_code_no,
        v_target_code_no,
        v_apply_date,
        v_apply_limit,
        v_begin_trade_date,
        v_issue_price,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.102.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新新股信息表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_查询证券代码信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_QueryStockCodeTable;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_QueryStockCodeTable(
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
    

    /* 调用【原子_公共_基础数据同步_查询证券代码信息表】*/
    call db_pub.pra_basesync_QueryStockCodeTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.111.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_查询证券代码信息表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_更新证券代码信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_UpdateStockCodeTable;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_UpdateStockCodeTable(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_pinyin_short varchar(16),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_par_value decimal(16,9),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_total_stock_issue decimal(18,2),
    IN p_circl_stock_capit decimal(18,2),
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_type_unit int,
    IN p_report_unit int,
    IN p_min_unit int,
    IN p_max_qty decimal(18,2),
    IN p_min_qty decimal(18,2),
    IN p_is_order_dir_flag int,
    IN p_price_up decimal(16,9),
    IN p_price_down decimal(16,9),
    IN p_step_price decimal(16,9),
    IN p_fair_price decimal(16,9),
    IN p_stop_status varchar(2),
    IN p_hk_stock_flag int,
    IN p_time_stamp int,
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
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_pinyin_short varchar(16);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_total_stock_issue decimal(18,2);
    declare v_circl_stock_capit decimal(18,2);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_type_unit int;
    declare v_report_unit int;
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_is_order_dir_flag int;
    declare v_price_up decimal(16,9);
    declare v_price_down decimal(16,9);
    declare v_step_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_stop_status varchar(2);
    declare v_hk_stock_flag int;
    declare v_time_stamp int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_pinyin_short = p_pinyin_short;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_par_value = p_par_value;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_total_stock_issue = p_total_stock_issue;
    SET v_circl_stock_capit = p_circl_stock_capit;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_type_unit = p_type_unit;
    SET v_report_unit = p_report_unit;
    SET v_min_unit = p_min_unit;
    SET v_max_qty = p_max_qty;
    SET v_min_qty = p_min_qty;
    SET v_is_order_dir_flag = p_is_order_dir_flag;
    SET v_price_up = p_price_up;
    SET v_price_down = p_price_down;
    SET v_step_price = p_step_price;
    SET v_fair_price = p_fair_price;
    SET v_stop_status = p_stop_status;
    SET v_hk_stock_flag = p_hk_stock_flag;
    SET v_time_stamp = p_time_stamp;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_公共_基础数据同步_更新证券代码信息表】*/
    call db_pub.pra_basesync_UpdateStockCodeTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_exch_no,
        v_stock_code,
        v_stock_name,
        v_pinyin_short,
        v_stock_type,
        v_asset_type,
        v_par_value,
        v_crncy_type,
        v_exch_crncy_type,
        v_total_stock_issue,
        v_circl_stock_capit,
        v_capit_reback_days,
        v_posi_reback_days,
        v_type_unit,
        v_report_unit,
        v_min_unit,
        v_max_qty,
        v_min_qty,
        v_is_order_dir_flag,
        v_price_up,
        v_price_down,
        v_step_price,
        v_fair_price,
        v_stop_status,
        v_hk_stock_flag,
        v_time_stamp,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.112.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新证券代码信息表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_查询债券属性信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_QueryBondInfoTable;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_QueryBondInfoTable(
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
    

    /* 调用【原子_公共_基础数据同步_查询债券属性信息表】*/
    call db_pub.pra_basesync_QueryBondInfoTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.121.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_查询债券属性信息表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_更新债券属性信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_UpdateBondInfoTable;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_UpdateBondInfoTable(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_trade_code varchar(6),
    IN p_target_code varchar(6),
    IN p_stock_code_no int,
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_stock_name varchar(64),
    IN p_issue_date int,
    IN p_end_date int,
    IN p_value_date int,
    IN p_next_value_date int,
    IN p_begin_trade_date int,
    IN p_bond_limit decimal(18,2),
    IN p_issue_price decimal(16,9),
    IN p_par_value decimal(16,9),
    IN p_intrst_ratio decimal(18,12),
    IN p_intrst_days int,
    IN p_pay_inteval int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_inteval_days int,
    IN p_net_price_flag int,
    IN p_last_trade_date int,
    IN p_rights_type int,
    IN p_trans_begin_date int,
    IN p_trans_end_date int,
    IN p_exec_begin_date int,
    IN p_exec_end_date int,
    IN p_impawn_ratio decimal(18,12),
    IN p_pay_intrst_flag int,
    IN p_time_stamp int,
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);
    declare v_stock_code_no int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_name varchar(64);
    declare v_issue_date int;
    declare v_end_date int;
    declare v_value_date int;
    declare v_next_value_date int;
    declare v_begin_trade_date int;
    declare v_bond_limit decimal(18,2);
    declare v_issue_price decimal(16,9);
    declare v_par_value decimal(16,9);
    declare v_intrst_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_pay_inteval int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_inteval_days int;
    declare v_net_price_flag int;
    declare v_last_trade_date int;
    declare v_rights_type int;
    declare v_trans_begin_date int;
    declare v_trans_end_date int;
    declare v_exec_begin_date int;
    declare v_exec_end_date int;
    declare v_impawn_ratio decimal(18,12);
    declare v_pay_intrst_flag int;
    declare v_time_stamp int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_trade_code = p_trade_code;
    SET v_target_code = p_target_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_name = p_stock_name;
    SET v_issue_date = p_issue_date;
    SET v_end_date = p_end_date;
    SET v_value_date = p_value_date;
    SET v_next_value_date = p_next_value_date;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_bond_limit = p_bond_limit;
    SET v_issue_price = p_issue_price;
    SET v_par_value = p_par_value;
    SET v_intrst_ratio = p_intrst_ratio;
    SET v_intrst_days = p_intrst_days;
    SET v_pay_inteval = p_pay_inteval;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_inteval_days = p_inteval_days;
    SET v_net_price_flag = p_net_price_flag;
    SET v_last_trade_date = p_last_trade_date;
    SET v_rights_type = p_rights_type;
    SET v_trans_begin_date = p_trans_begin_date;
    SET v_trans_end_date = p_trans_end_date;
    SET v_exec_begin_date = p_exec_begin_date;
    SET v_exec_end_date = p_exec_end_date;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_pay_intrst_flag = p_pay_intrst_flag;
    SET v_time_stamp = p_time_stamp;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_公共_基础数据同步_更新债券属性信息表】*/
    call db_pub.pra_basesync_UpdateBondInfoTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_trade_code,
        v_target_code,
        v_stock_code_no,
        v_trade_code_no,
        v_target_code_no,
        v_stock_name,
        v_issue_date,
        v_end_date,
        v_value_date,
        v_next_value_date,
        v_begin_trade_date,
        v_bond_limit,
        v_issue_price,
        v_par_value,
        v_intrst_ratio,
        v_intrst_days,
        v_pay_inteval,
        v_bond_accr_intrst,
        v_bond_rate_type,
        v_inteval_days,
        v_net_price_flag,
        v_last_trade_date,
        v_rights_type,
        v_trans_begin_date,
        v_trans_end_date,
        v_exec_begin_date,
        v_exec_end_date,
        v_impawn_ratio,
        v_pay_intrst_flag,
        v_time_stamp,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.122.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新债券属性信息表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_查询证券行情表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_QueryStockQuotTable;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_QueryStockQuotTable(
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
    

    /* 调用【原子_公共_基础数据同步_查询证券行情表】*/
    call db_pub.pra_basesync_QueryStockQuotTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.131.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_查询证券行情表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_更新证券行情表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_UpdateStockQuotTable;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_UpdateStockQuotTable(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_last_price decimal(16,9),
    IN p_pre_close_price decimal(16,9),
    IN p_today_open_price decimal(16,9),
    IN p_today_close_price decimal(16,9),
    IN p_today_max_price decimal(16,9),
    IN p_today_min_price decimal(16,9),
    IN p_buy_price_1 decimal(16,9),
    IN p_buy_qty_1 decimal(18,2),
    IN p_buy_price_2 decimal(16,9),
    IN p_buy_qty_2 decimal(18,2),
    IN p_buy_price_3 decimal(16,9),
    IN p_buy_qty_3 decimal(18,2),
    IN p_buy_price_4 decimal(16,9),
    IN p_buy_qty_4 decimal(18,2),
    IN p_buy_price_5 decimal(16,9),
    IN p_buy_qty_5 decimal(18,2),
    IN p_sell_price_1 decimal(16,9),
    IN p_sell_qty_1 decimal(18,2),
    IN p_sell_price_2 decimal(16,9),
    IN p_sell_qty_2 decimal(18,2),
    IN p_sell_price_3 decimal(16,9),
    IN p_sell_qty_3 decimal(18,2),
    IN p_sell_price_4 decimal(16,9),
    IN p_sell_qty_4 decimal(18,2),
    IN p_sell_price_5 decimal(16,9),
    IN p_sell_qty_5 decimal(18,2),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_pe_ratio decimal(18,12),
    IN p_time_stamp int,
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
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_today_open_price decimal(16,9);
    declare v_today_close_price decimal(16,9);
    declare v_today_max_price decimal(16,9);
    declare v_today_min_price decimal(16,9);
    declare v_buy_price_1 decimal(16,9);
    declare v_buy_qty_1 decimal(18,2);
    declare v_buy_price_2 decimal(16,9);
    declare v_buy_qty_2 decimal(18,2);
    declare v_buy_price_3 decimal(16,9);
    declare v_buy_qty_3 decimal(18,2);
    declare v_buy_price_4 decimal(16,9);
    declare v_buy_qty_4 decimal(18,2);
    declare v_buy_price_5 decimal(16,9);
    declare v_buy_qty_5 decimal(18,2);
    declare v_sell_price_1 decimal(16,9);
    declare v_sell_qty_1 decimal(18,2);
    declare v_sell_price_2 decimal(16,9);
    declare v_sell_qty_2 decimal(18,2);
    declare v_sell_price_3 decimal(16,9);
    declare v_sell_qty_3 decimal(18,2);
    declare v_sell_price_4 decimal(16,9);
    declare v_sell_qty_4 decimal(18,2);
    declare v_sell_price_5 decimal(16,9);
    declare v_sell_qty_5 decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_pe_ratio decimal(18,12);
    declare v_time_stamp int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_last_price = p_last_price;
    SET v_pre_close_price = p_pre_close_price;
    SET v_today_open_price = p_today_open_price;
    SET v_today_close_price = p_today_close_price;
    SET v_today_max_price = p_today_max_price;
    SET v_today_min_price = p_today_min_price;
    SET v_buy_price_1 = p_buy_price_1;
    SET v_buy_qty_1 = p_buy_qty_1;
    SET v_buy_price_2 = p_buy_price_2;
    SET v_buy_qty_2 = p_buy_qty_2;
    SET v_buy_price_3 = p_buy_price_3;
    SET v_buy_qty_3 = p_buy_qty_3;
    SET v_buy_price_4 = p_buy_price_4;
    SET v_buy_qty_4 = p_buy_qty_4;
    SET v_buy_price_5 = p_buy_price_5;
    SET v_buy_qty_5 = p_buy_qty_5;
    SET v_sell_price_1 = p_sell_price_1;
    SET v_sell_qty_1 = p_sell_qty_1;
    SET v_sell_price_2 = p_sell_price_2;
    SET v_sell_qty_2 = p_sell_qty_2;
    SET v_sell_price_3 = p_sell_price_3;
    SET v_sell_qty_3 = p_sell_qty_3;
    SET v_sell_price_4 = p_sell_price_4;
    SET v_sell_qty_4 = p_sell_qty_4;
    SET v_sell_price_5 = p_sell_price_5;
    SET v_sell_qty_5 = p_sell_qty_5;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_pe_ratio = p_pe_ratio;
    SET v_time_stamp = p_time_stamp;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_公共_基础数据同步_更新证券行情表】*/
    call db_pub.pra_basesync_UpdateStockQuotTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_exch_no,
        v_stock_code,
        v_stock_name,
        v_up_limit_price,
        v_down_limit_price,
        v_last_price,
        v_pre_close_price,
        v_today_open_price,
        v_today_close_price,
        v_today_max_price,
        v_today_min_price,
        v_buy_price_1,
        v_buy_qty_1,
        v_buy_price_2,
        v_buy_qty_2,
        v_buy_price_3,
        v_buy_qty_3,
        v_buy_price_4,
        v_buy_qty_4,
        v_buy_price_5,
        v_buy_qty_5,
        v_sell_price_1,
        v_sell_qty_1,
        v_sell_price_2,
        v_sell_qty_2,
        v_sell_price_3,
        v_sell_qty_3,
        v_sell_price_4,
        v_sell_qty_4,
        v_sell_price_5,
        v_sell_qty_5,
        v_strike_qty,
        v_strike_amt,
        v_pe_ratio,
        v_time_stamp,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.132.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新证券行情表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_查询代码映射表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_QueryCodeMapTable;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_QueryCodeMapTable(
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
    

    /* 调用【原子_公共_基础数据同步_查询代码映射表】*/
    call db_pub.pra_basesync_QueryCodeMapTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.141.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_查询代码映射表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_更新代码映射表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_UpdateCodeMapTable;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_UpdateCodeMapTable(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_trade_code varchar(6),
    IN p_target_code varchar(6),
    IN p_time_stamp int,
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
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);
    declare v_time_stamp int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_trade_code = p_trade_code;
    SET v_target_code = p_target_code;
    SET v_time_stamp = p_time_stamp;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_公共_基础数据同步_更新代码映射表】*/
    call db_pub.pra_basesync_UpdateCodeMapTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_stock_code,
        v_exch_no,
        v_trade_code,
        v_target_code,
        v_time_stamp,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.142.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新代码映射表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_查询证券代码订单方向表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_QueryStockCodeOrderDirTable;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_QueryStockCodeOrderDirTable(
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
    

    /* 调用【原子_公共_基础数据同步_查询证券代码订单方向表】*/
    call db_pub.pra_basesync_QueryStockCodeOrderDirTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.151.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_查询证券代码订单方向表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_更新证券代码订单方向表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_UpdateStockCodeOrderDirTable;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_UpdateStockCodeOrderDirTable(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_cash_frozen_type int,
    IN p_order_split_flag int,
    IN p_min_unit int,
    IN p_max_qty decimal(18,2),
    IN p_min_qty decimal(18,2),
    IN p_time_stamp int,
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
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_cash_frozen_type int;
    declare v_order_split_flag int;
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_time_stamp int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_cash_frozen_type = p_cash_frozen_type;
    SET v_order_split_flag = p_order_split_flag;
    SET v_min_unit = p_min_unit;
    SET v_max_qty = p_max_qty;
    SET v_min_qty = p_min_qty;
    SET v_time_stamp = p_time_stamp;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_公共_基础数据同步_更新证券代码订单方向表】*/
    call db_pub.pra_basesync_UpdateStockCodeOrderDirTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_exch_no,
        v_stock_code,
        v_order_dir,
        v_cash_frozen_type,
        v_order_split_flag,
        v_min_unit,
        v_max_qty,
        v_min_qty,
        v_time_stamp,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.152.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新证券代码订单方向表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_查询港股通汇率表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_QueryHkExchRateTable;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_QueryHkExchRateTable(
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
    

    /* 调用【原子_公共_基础数据同步_查询港股通汇率表】*/
    call db_pub.pra_basesync_QueryHkExchRateTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.161.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_查询港股通汇率表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_更新港股通汇率表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_UpdateHkExchRateTable;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_UpdateHkExchRateTable(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_for_crncy_type varchar(3),
    IN p_crncy_type varchar(3),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_settle_buy_rate decimal(18,12),
    IN p_settle_sell_rate decimal(18,12),
    IN p_pboc_rate decimal(18,12),
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
    declare v_exch_no int;
    declare v_for_crncy_type varchar(3);
    declare v_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
    declare v_pboc_rate decimal(18,12);
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
    SET v_exch_no = p_exch_no;
    SET v_for_crncy_type = p_for_crncy_type;
    SET v_crncy_type = p_crncy_type;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_settle_buy_rate = p_settle_buy_rate;
    SET v_settle_sell_rate = p_settle_sell_rate;
    SET v_pboc_rate = p_pboc_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_公共_基础数据同步_更新港股通汇率表】*/
    call db_pub.pra_basesync_UpdateHkExchRateTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_exch_no,
        v_for_crncy_type,
        v_crncy_type,
        v_buy_ref_rate,
        v_sell_ref_rate,
        v_settle_buy_rate,
        v_settle_sell_rate,
        v_pboc_rate,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.162.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新港股通汇率表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_更新A股股本信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_UpdateAShareCapitalInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_UpdateAShareCapitalInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_str varchar(4096),
    IN p_stock_name_str varchar(2048),
    IN p_total_stock_issue_str varchar(4096),
    IN p_circl_stock_capit_str varchar(4096),
    IN p_split_str varchar(4),
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
    declare v_stock_code_str varchar(4096);
    declare v_stock_name_str varchar(2048);
    declare v_total_stock_issue_str varchar(4096);
    declare v_circl_stock_capit_str varchar(4096);
    declare v_split_str varchar(4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_name varchar(64);
    declare v_total_stock_issue decimal(18,2);
    declare v_circl_stock_capit decimal(18,2);

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
    SET v_stock_code_str = p_stock_code_str;
    SET v_stock_name_str = p_stock_name_str;
    SET v_total_stock_issue_str = p_total_stock_issue_str;
    SET v_circl_stock_capit_str = p_circl_stock_capit_str;
    SET v_split_str = p_split_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_stock_name = " ";
    SET v_total_stock_issue = 0;
    SET v_circl_stock_capit = 0;

    
    label_pro:BEGIN
    

    /* while LOCATE(@分隔符#,@证券代码串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_str)<>0   do

          /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
          set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

          /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
          set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

          /* set @证券名称#=substring(@证券名称串#,1,LOCATE(@分隔符#,@证券名称串#)-1); */
          set v_stock_name=substring(v_stock_name_str,1,LOCATE(v_split_str,v_stock_name_str)-1);

          /* set @总股本#=cast(substring(@总股本串#,1,LOCATE(@分隔符#,@总股本串#)-1) as decimal(18,2)); */
          set v_total_stock_issue=cast(substring(v_total_stock_issue_str,1,LOCATE(v_split_str,v_total_stock_issue_str)-1) as decimal(18,2));

          /* set @流通股本#=cast(substring(@流通股本串#,1,LOCATE(@分隔符#,@流通股本串#)-1) as decimal(18,2)); */
          set v_circl_stock_capit=cast(substring(v_circl_stock_capit_str,1,LOCATE(v_split_str,v_circl_stock_capit_str)-1) as decimal(18,2));

          /* [事务开始] */
          START TRANSACTION;


          /* 调用【原子_公共_基础数据同步_更新A股股本信息】*/
          call db_pub.pra_basesync_UpdateAShareCapitalInfo(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_exch_no,
              v_stock_code,
              v_stock_name,
              v_total_stock_issue,
              v_circl_stock_capit,
              v_error_code,
              v_error_info);
          if v_error_code = "1" then
              SET v_error_code = "pubT.28.171.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新A股股本信息出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;


          /* [事务结束] */
          COMMIT;


          /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
          set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);

          /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
          set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

          /* set @证券名称串#=substring(@证券名称串#,LOCATE(@分隔符#,@证券名称串#)+1); */
          set v_stock_name_str=substring(v_stock_name_str,LOCATE(v_split_str,v_stock_name_str)+1);

          /* set @总股本串#=substring(@总股本串#,LOCATE(@分隔符#,@总股本串#)+1); */
          set v_total_stock_issue_str=substring(v_total_stock_issue_str,LOCATE(v_split_str,v_total_stock_issue_str)+1);

          /* set @流通股本串#=substring(@流通股本串#,LOCATE(@分隔符#,@流通股本串#)+1); */
          set v_circl_stock_capit_str=substring(v_circl_stock_capit_str,LOCATE(v_split_str,v_circl_stock_capit_str)+1);
    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_基础数据同步_更新新股信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_UpdateNewStockInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_UpdateNewStockInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_str varchar(4096),
    IN p_stock_name_str varchar(2048),
    IN p_pinyin_short_str varchar(4096),
    IN p_apply_code_str varchar(4096),
    IN p_apply_date_str varchar(4096),
    IN p_apply_limit_str varchar(4096),
    IN p_begin_trade_date_str varchar(4096),
    IN p_issue_price_str varchar(4096),
    IN p_total_stock_issue_str varchar(4096),
    IN p_split_str varchar(4),
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
    declare v_stock_code_str varchar(4096);
    declare v_stock_name_str varchar(2048);
    declare v_pinyin_short_str varchar(4096);
    declare v_apply_code_str varchar(4096);
    declare v_apply_date_str varchar(4096);
    declare v_apply_limit_str varchar(4096);
    declare v_begin_trade_date_str varchar(4096);
    declare v_issue_price_str varchar(4096);
    declare v_total_stock_issue_str varchar(4096);
    declare v_split_str varchar(4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_name varchar(64);
    declare v_pinyin_short varchar(16);
    declare v_apply_code varchar(4096);
    declare v_apply_date int;
    declare v_apply_limit decimal(18,2);
    declare v_begin_trade_date int;
    declare v_issue_price decimal(16,9);
    declare v_total_stock_issue decimal(18,2);
    declare v_tmp_stock_code varchar(6);
    declare v_par_value decimal(16,9);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_circl_stock_capit decimal(18,2);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_type_unit int;
    declare v_report_unit int;
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_is_order_dir_flag int;
    declare v_price_up decimal(16,9);
    declare v_price_down decimal(16,9);
    declare v_step_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_stop_status varchar(2);
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_hk_stock_flag int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_last_price decimal(16,9);

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
    SET v_stock_code_str = p_stock_code_str;
    SET v_stock_name_str = p_stock_name_str;
    SET v_pinyin_short_str = p_pinyin_short_str;
    SET v_apply_code_str = p_apply_code_str;
    SET v_apply_date_str = p_apply_date_str;
    SET v_apply_limit_str = p_apply_limit_str;
    SET v_begin_trade_date_str = p_begin_trade_date_str;
    SET v_issue_price_str = p_issue_price_str;
    SET v_total_stock_issue_str = p_total_stock_issue_str;
    SET v_split_str = p_split_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_stock_name = " ";
    SET v_pinyin_short = " ";
    SET v_apply_code = " ";
    SET v_apply_date = 0;
    SET v_apply_limit = 0;
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_issue_price = 0;
    SET v_total_stock_issue = 0;
    SET v_tmp_stock_code = " ";
    SET v_par_value = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_circl_stock_capit = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_type_unit = 0;
    SET v_report_unit = 0;
    SET v_min_unit = 0;
    SET v_max_qty = 0;
    SET v_min_qty = 0;
    SET v_is_order_dir_flag = 0;
    SET v_price_up = 0;
    SET v_price_down = 0;
    SET v_step_price = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_pre_close_price = 0;
    SET v_fair_price = 0;
    SET v_stop_status = "0";
    SET v_trade_code = " ";
    SET v_target_code = " ";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_hk_stock_flag = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_last_price = 0;

    
    label_pro:BEGIN
    

    /* while LOCATE(@分隔符#,@证券代码串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_str)<>0   do

          /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
          set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

          /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
          set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

          /* set @证券名称#=substring(@证券名称串#,1,LOCATE(@分隔符#,@证券名称串#)-1); */
          set v_stock_name=substring(v_stock_name_str,1,LOCATE(v_split_str,v_stock_name_str)-1);

          /* set @拼音简称#=substring(@拼音简称串#,1,LOCATE(@分隔符#,@拼音简称串#)-1); */
          set v_pinyin_short=substring(v_pinyin_short_str,1,LOCATE(v_split_str,v_pinyin_short_str)-1);

          /* set @申购代码#=substring(@申购代码串#,1,LOCATE(@分隔符#,@申购代码串#)-1); */
          set v_apply_code=substring(v_apply_code_str,1,LOCATE(v_split_str,v_apply_code_str)-1);

          /* set @申购日期#=cast(substring(@申购日期串#,1,LOCATE(@分隔符#,@申购日期串#)-1) as SIGNED); */
          set v_apply_date=cast(substring(v_apply_date_str,1,LOCATE(v_split_str,v_apply_date_str)-1) as SIGNED);

          /* set @申购上限#=cast(substring(@申购上限串#,1,LOCATE(@分隔符#,@申购上限串#)-1) as decimal(18,2)); */
          set v_apply_limit=cast(substring(v_apply_limit_str,1,LOCATE(v_split_str,v_apply_limit_str)-1) as decimal(18,2));

          /* set @上市日期#=cast(substring(@上市日期串#,1,LOCATE(@分隔符#,@上市日期串#)-1) as SIGNED); */
          set v_begin_trade_date=cast(substring(v_begin_trade_date_str,1,LOCATE(v_split_str,v_begin_trade_date_str)-1) as SIGNED);

          /* set @发行价#=cast(substring(@发行价串#,1,LOCATE(@分隔符#,@发行价串#)-1) as decimal(16,9)); */
          set v_issue_price=cast(substring(v_issue_price_str,1,LOCATE(v_split_str,v_issue_price_str)-1) as decimal(16,9));

          /* set @总股本#=cast(substring(@总股本串#,1,LOCATE(@分隔符#,@总股本串#)-1) as decimal(18,2)); */
          set v_total_stock_issue=cast(substring(v_total_stock_issue_str,1,LOCATE(v_split_str,v_total_stock_issue_str)-1) as decimal(18,2));

          /* set @临时_证券代码# = @证券代码#; */
          set v_tmp_stock_code = v_stock_code;

          /* set @上市日期# = if(ifnull(@上市日期#,0)=0,0,@上市日期#); */
          set v_begin_trade_date = if(ifnull(v_begin_trade_date,0)=0,0,v_begin_trade_date);

          /* set @票面面值# = 1; */
          set v_par_value = 1;

          /* set @本币币种# = 'CNY'; */
          set v_crncy_type = 'CNY';

          /* set @交易币种# = 'CNY'; */
          set v_exch_crncy_type = 'CNY';

          /* set @流通股本# = 0; */
          set v_circl_stock_capit = 0;

          /* set @资金回转天数# = 1; */
          set v_capit_reback_days = 1;

          /* set @持仓回转天数# = 1; */
          set v_posi_reback_days = 1;

          /* set @类型单位# = 1; */
          set v_type_unit = 1;

          /* set @申报单位# = 1; */
          set v_report_unit = 1;

          /* set @最小单位# = 1000; */
          set v_min_unit = 1000;

          /* set @最大数量# = 1000000; */
          set v_max_qty = 1000000;

          /* set @最小数量# = 1000; */
          set v_min_qty = 1000;

          /* set @区分订单方向标志# = 《区分订单方向标志-否》; */
          set v_is_order_dir_flag = 2;

          /* set @价格上限# = 0; */
          set v_price_up = 0;

          /* set @价格下限# = 0; */
          set v_price_down = 0;

          /* set @最小价差# = 0.01; */
          set v_step_price = 0.01;

          /* set @涨停价# = 0; */
          set v_up_limit_price = 0;

          /* set @跌停价# = 0; */
          set v_down_limit_price = 0;

          /* set @昨收盘价# = 0; */
          set v_pre_close_price = 0;

          /* set @公允价格# = 0; */
          set v_fair_price = 0;

          /* set @停牌标志# = 《停牌标志-正常》; */
          set v_stop_status = "1";

          /* set @交易代码# = @证券代码#; */
          set v_trade_code = v_stock_code;

          /* set @标的代码# = @证券代码#; */
          set v_target_code = v_stock_code;

          /* set @交易代码编号# = 0; */
          set v_trade_code_no = 0;

          /* set @标的代码编号# = 0; */
          set v_target_code_no = 0;

          /* set @港股通标的# = 《港股通标的-不是》; */
          set v_hk_stock_flag = 2;
    #上海要插入申购代码和证券代码

          /* if @市场编号#=《市场编号-上海证券交易所》 then */
          if v_exch_no=1 then

                 /* set @证券代码# = @申购代码#; */
                 set v_stock_code = v_apply_code;

                 /* set @证券类型# = 《证券类型-申购》; */
                 set v_stock_type = 2;

                 /* set @资产类型# = 《资产类型-股票》; */
                 set v_asset_type = 11;

                 /* [事务开始] */
                 START TRANSACTION;


                 /* 调用【原子_公共_基础数据同步_更新新股信息】*/
                 call db_pub.pra_basesync_UpdateNewStockInfo(
                     v_opor_co_no,
                     v_opor_no,
                     v_oper_mac,
                     v_oper_ip_addr,
                     v_oper_info,
                     v_oper_way,
                     v_func_code,
                     v_exch_no,
                     v_stock_code,
                     v_stock_name,
                     v_pinyin_short,
                     v_stock_type,
                     v_asset_type,
                     v_par_value,
                     v_crncy_type,
                     v_exch_crncy_type,
                     v_total_stock_issue,
                     v_circl_stock_capit,
                     v_capit_reback_days,
                     v_posi_reback_days,
                     v_type_unit,
                     v_report_unit,
                     v_min_unit,
                     v_max_qty,
                     v_min_qty,
                     v_is_order_dir_flag,
                     v_price_up,
                     v_price_down,
                     v_step_price,
                     v_fair_price,
                     v_stop_status,
                     v_hk_stock_flag,
                     v_trade_code,
                     v_target_code,
                     v_trade_code_no,
                     v_target_code_no,
                     v_apply_date,
                     v_apply_limit,
                     v_begin_trade_date,
                     v_issue_price,
                     v_error_code,
                     v_error_info);
                 if v_error_code = "1" then
                     SET v_error_code = "pubT.28.172.999";
                     if v_mysql_message <> "" then
                          SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新新股信息出现错误！',v_mysql_message);
                     end if;
                     ROLLBACK;
                     leave label_pro;
                 elseif v_error_code <> "0" then
                     ROLLBACK;
                     leave label_pro;
                 end if;


                 /* [事务结束] */
                 COMMIT;


                 /* set @证券代码# = @临时_证券代码#; */
                 set v_stock_code = v_tmp_stock_code;

                 /* set @证券类型# = 《证券类型-股票》; */
                 set v_stock_type = 1;

                 /* set @资产类型# = 《资产类型-股票》; */
                 set v_asset_type = 11;

                 /* set @最小单位# = 100; */
                 set v_min_unit = 100;

                 /* set @最小数量# = 100; */
                 set v_min_qty = 100;

                 /* set @区分订单方向标志# = 《区分订单方向标志-是》; */
                 set v_is_order_dir_flag = 1;

                 /* [事务开始] */
                 START TRANSACTION;


                 /* 调用【原子_公共_基础数据同步_更新新股信息】*/
                 call db_pub.pra_basesync_UpdateNewStockInfo(
                     v_opor_co_no,
                     v_opor_no,
                     v_oper_mac,
                     v_oper_ip_addr,
                     v_oper_info,
                     v_oper_way,
                     v_func_code,
                     v_exch_no,
                     v_stock_code,
                     v_stock_name,
                     v_pinyin_short,
                     v_stock_type,
                     v_asset_type,
                     v_par_value,
                     v_crncy_type,
                     v_exch_crncy_type,
                     v_total_stock_issue,
                     v_circl_stock_capit,
                     v_capit_reback_days,
                     v_posi_reback_days,
                     v_type_unit,
                     v_report_unit,
                     v_min_unit,
                     v_max_qty,
                     v_min_qty,
                     v_is_order_dir_flag,
                     v_price_up,
                     v_price_down,
                     v_step_price,
                     v_fair_price,
                     v_stop_status,
                     v_hk_stock_flag,
                     v_trade_code,
                     v_target_code,
                     v_trade_code_no,
                     v_target_code_no,
                     v_apply_date,
                     v_apply_limit,
                     v_begin_trade_date,
                     v_issue_price,
                     v_error_code,
                     v_error_info);
                 if v_error_code = "1" then
                     SET v_error_code = "pubT.28.172.999";
                     if v_mysql_message <> "" then
                          SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新新股信息出现错误！',v_mysql_message);
                     end if;
                     ROLLBACK;
                     leave label_pro;
                 elseif v_error_code <> "0" then
                     ROLLBACK;
                     leave label_pro;
                 end if;


                 /* [事务结束] */
                 COMMIT;

    #插入行情表    插入2次，申购代码和 证券代码

                 /* set @证券代码# = @临时_证券代码#; */
                 set v_stock_code = v_tmp_stock_code;

                 /* set @最新价#=@发行价#; */
                 set v_last_price=v_issue_price;

                 /* set @涨停价#=@发行价#; */
                 set v_up_limit_price=v_issue_price;

                 /* set @跌停价#=@发行价#; */
                 set v_down_limit_price=v_issue_price;

                 /* [事务开始] */
                 START TRANSACTION;


                 /* 调用【原子_公共_基础数据同步_新增证券行情信息】*/
                 call db_pub.pra_basesync_AddStockQuotInfo(
                     v_opor_co_no,
                     v_opor_no,
                     v_oper_mac,
                     v_oper_ip_addr,
                     v_oper_info,
                     v_oper_way,
                     v_func_code,
                     v_exch_no,
                     v_stock_code,
                     v_stock_name,
                     v_issue_price,
                     v_up_limit_price,
                     v_down_limit_price,
                     v_last_price,
                     v_error_code,
                     v_error_info);
                 if v_error_code = "1" then
                     SET v_error_code = "pubT.28.172.999";
                     if v_mysql_message <> "" then
                          SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_新增证券行情信息出现错误！',v_mysql_message);
                     end if;
                     ROLLBACK;
                     leave label_pro;
                 elseif v_error_code <> "0" then
                     ROLLBACK;
                     leave label_pro;
                 end if;


                 /* [事务结束] */
                 COMMIT;


                 /* set @证券代码# = @申购代码#; */
                 set v_stock_code = v_apply_code;

                 /* [事务开始] */
                 START TRANSACTION;


                  /* 调用【原子_公共_基础数据同步_新增证券行情信息】*/
                  call db_pub.pra_basesync_AddStockQuotInfo(
                      v_opor_co_no,
                      v_opor_no,
                      v_oper_mac,
                      v_oper_ip_addr,
                      v_oper_info,
                      v_oper_way,
                      v_func_code,
                      v_exch_no,
                      v_stock_code,
                      v_stock_name,
                      v_issue_price,
                      v_up_limit_price,
                      v_down_limit_price,
                      v_last_price,
                      v_error_code,
                      v_error_info);
                  if v_error_code = "1" then
                      SET v_error_code = "pubT.28.172.999";
                      if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_新增证券行情信息出现错误！',v_mysql_message);
                      end if;
                      ROLLBACK;
                      leave label_pro;
                  elseif v_error_code <> "0" then
                      ROLLBACK;
                      leave label_pro;
                  end if;


                 /* [事务结束] */
                 COMMIT;

    #深圳的行情拿得到，不用新增

          /* elseif @市场编号#=《市场编号-深圳证券交易所》 then */
          elseif v_exch_no=2 then

                 /* set @证券代码# = @申购代码#; */
                 set v_stock_code = v_apply_code;

                 /* set @证券代码# = @临时_证券代码#; */
                 set v_stock_code = v_tmp_stock_code;

                 /* set @证券类型# = 《证券类型-股票》; */
                 set v_stock_type = 1;

                 /* set @资产类型# = 《资产类型-股票》; */
                 set v_asset_type = 11;

                 /* set @最小单位# = 100; */
                 set v_min_unit = 100;

                 /* set @最小数量# = 100; */
                 set v_min_qty = 100;

                 /* set @区分订单方向标志# = 《区分订单方向标志-是》; */
                 set v_is_order_dir_flag = 1;

                 /* [事务开始] */
                 START TRANSACTION;


                 /* 调用【原子_公共_基础数据同步_更新新股信息】*/
                 call db_pub.pra_basesync_UpdateNewStockInfo(
                     v_opor_co_no,
                     v_opor_no,
                     v_oper_mac,
                     v_oper_ip_addr,
                     v_oper_info,
                     v_oper_way,
                     v_func_code,
                     v_exch_no,
                     v_stock_code,
                     v_stock_name,
                     v_pinyin_short,
                     v_stock_type,
                     v_asset_type,
                     v_par_value,
                     v_crncy_type,
                     v_exch_crncy_type,
                     v_total_stock_issue,
                     v_circl_stock_capit,
                     v_capit_reback_days,
                     v_posi_reback_days,
                     v_type_unit,
                     v_report_unit,
                     v_min_unit,
                     v_max_qty,
                     v_min_qty,
                     v_is_order_dir_flag,
                     v_price_up,
                     v_price_down,
                     v_step_price,
                     v_fair_price,
                     v_stop_status,
                     v_hk_stock_flag,
                     v_trade_code,
                     v_target_code,
                     v_trade_code_no,
                     v_target_code_no,
                     v_apply_date,
                     v_apply_limit,
                     v_begin_trade_date,
                     v_issue_price,
                     v_error_code,
                     v_error_info);
                 if v_error_code = "1" then
                     SET v_error_code = "pubT.28.172.999";
                     if v_mysql_message <> "" then
                          SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新新股信息出现错误！',v_mysql_message);
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

          /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
          set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);

          /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
          set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

          /* set @证券名称串#=substring(@证券名称串#,LOCATE(@分隔符#,@证券名称串#)+1); */
          set v_stock_name_str=substring(v_stock_name_str,LOCATE(v_split_str,v_stock_name_str)+1);

          /* set @拼音简称串#=substring(@拼音简称串#,LOCATE(@分隔符#,@拼音简称串#)+1); */
          set v_pinyin_short_str=substring(v_pinyin_short_str,LOCATE(v_split_str,v_pinyin_short_str)+1);

          /* set @申购代码串#=substring(@申购代码串#,LOCATE(@分隔符#,@申购代码串#)+1); */
          set v_apply_code_str=substring(v_apply_code_str,LOCATE(v_split_str,v_apply_code_str)+1);

          /* set @申购日期串#=substring(@申购日期串#,LOCATE(@分隔符#,@申购日期串#)+1); */
          set v_apply_date_str=substring(v_apply_date_str,LOCATE(v_split_str,v_apply_date_str)+1);

          /* set @申购上限串#=substring(@申购上限串#,LOCATE(@分隔符#,@申购上限串#)+1); */
          set v_apply_limit_str=substring(v_apply_limit_str,LOCATE(v_split_str,v_apply_limit_str)+1);

          /* set @上市日期串#=substring(@上市日期串#,LOCATE(@分隔符#,@上市日期串#)+1); */
          set v_begin_trade_date_str=substring(v_begin_trade_date_str,LOCATE(v_split_str,v_begin_trade_date_str)+1);

          /* set @发行价串#=substring(@发行价串#,LOCATE(@分隔符#,@发行价串#)+1); */
          set v_issue_price_str=substring(v_issue_price_str,LOCATE(v_split_str,v_issue_price_str)+1);

          /* set @总股本串#=substring(@总股本串#,LOCATE(@分隔符#,@总股本串#)+1); */
          set v_total_stock_issue_str=substring(v_total_stock_issue_str,LOCATE(v_split_str,v_total_stock_issue_str)+1);
    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_基础数据同步_更新可转债发行信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_UpdateConvertibleBondIssueInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_UpdateConvertibleBondIssueInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_str varchar(4096),
    IN p_stock_name_str varchar(2048),
    IN p_pinyin_short_str varchar(4096),
    IN p_bond_type_str varchar(4096),
    IN p_apply_code_str varchar(4096),
    IN p_apply_limit_str varchar(4096),
    IN p_apply_date_str varchar(4096),
    IN p_issue_price_str varchar(4096),
    IN p_par_value_str varchar(4096),
    IN p_split_str varchar(4),
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
    declare v_stock_code_str varchar(4096);
    declare v_stock_name_str varchar(2048);
    declare v_pinyin_short_str varchar(4096);
    declare v_bond_type_str varchar(4096);
    declare v_apply_code_str varchar(4096);
    declare v_apply_limit_str varchar(4096);
    declare v_apply_date_str varchar(4096);
    declare v_issue_price_str varchar(4096);
    declare v_par_value_str varchar(4096);
    declare v_split_str varchar(4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_name varchar(64);
    declare v_pinyin_short varchar(16);
    declare v_bond_type int;
    declare v_apply_code varchar(4096);
    declare v_apply_limit decimal(18,2);
    declare v_apply_date int;
    declare v_issue_price decimal(16,9);
    declare v_par_value decimal(16,9);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_tmp_stock_code varchar(6);
    declare v_tmp_apply_limit decimal(18,2);
    declare v_tmp_issue_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_total_stock_issue decimal(18,2);
    declare v_circl_stock_capit decimal(18,2);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_type_unit int;
    declare v_report_unit int;
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_is_order_dir_flag int;
    declare v_price_up decimal(16,9);
    declare v_price_down decimal(16,9);
    declare v_step_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_stop_status varchar(2);
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_begin_trade_date int;
    declare v_hk_stock_flag int;
    declare v_last_price decimal(16,9);

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
    SET v_stock_code_str = p_stock_code_str;
    SET v_stock_name_str = p_stock_name_str;
    SET v_pinyin_short_str = p_pinyin_short_str;
    SET v_bond_type_str = p_bond_type_str;
    SET v_apply_code_str = p_apply_code_str;
    SET v_apply_limit_str = p_apply_limit_str;
    SET v_apply_date_str = p_apply_date_str;
    SET v_issue_price_str = p_issue_price_str;
    SET v_par_value_str = p_par_value_str;
    SET v_split_str = p_split_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_stock_name = " ";
    SET v_pinyin_short = " ";
    SET v_bond_type = 0;
    SET v_apply_code = " ";
    SET v_apply_limit = 0;
    SET v_apply_date = 0;
    SET v_issue_price = 0;
    SET v_par_value = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_tmp_stock_code = " ";
    SET v_tmp_apply_limit = 0;
    SET v_tmp_issue_price = 0;
    SET v_fair_price = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_total_stock_issue = 0;
    SET v_circl_stock_capit = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_type_unit = 0;
    SET v_report_unit = 0;
    SET v_min_unit = 0;
    SET v_max_qty = 0;
    SET v_min_qty = 0;
    SET v_is_order_dir_flag = 0;
    SET v_price_up = 0;
    SET v_price_down = 0;
    SET v_step_price = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_pre_close_price = 0;
    SET v_stop_status = "0";
    SET v_trade_code = " ";
    SET v_target_code = " ";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_hk_stock_flag = 0;
    SET v_last_price = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* while LOCATE(@分隔符#,@证券代码串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_str)<>0   do

          /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
          set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

          /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
          set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

          /* set @证券名称#=substring(@证券名称串#,1,LOCATE(@分隔符#,@证券名称串#)-1); */
          set v_stock_name=substring(v_stock_name_str,1,LOCATE(v_split_str,v_stock_name_str)-1);

          /* set @拼音简称#=substring(@拼音简称串#,1,LOCATE(@分隔符#,@拼音简称串#)-1); */
          set v_pinyin_short=substring(v_pinyin_short_str,1,LOCATE(v_split_str,v_pinyin_short_str)-1);

          /* set @债券类型#=cast(substring(@债券类型串#,1,LOCATE(@分隔符#,@债券类型串#)-1) as SIGNED); */
          set v_bond_type=cast(substring(v_bond_type_str,1,LOCATE(v_split_str,v_bond_type_str)-1) as SIGNED);

          /* set @申购代码#=substring(@申购代码串#,1,LOCATE(@分隔符#,@申购代码串#)-1); */
          set v_apply_code=substring(v_apply_code_str,1,LOCATE(v_split_str,v_apply_code_str)-1);

          /* set @申购上限#=cast(substring(@申购上限串#,1,LOCATE(@分隔符#,@申购上限串#)-1) as decimal(18,2)); */
          set v_apply_limit=cast(substring(v_apply_limit_str,1,LOCATE(v_split_str,v_apply_limit_str)-1) as decimal(18,2));

          /* set @申购日期#=cast(substring(@申购日期串#,1,LOCATE(@分隔符#,@申购日期串#)-1) as SIGNED); */
          set v_apply_date=cast(substring(v_apply_date_str,1,LOCATE(v_split_str,v_apply_date_str)-1) as SIGNED);

          /* set @发行价#=cast(substring(@发行价串#,1,LOCATE(@分隔符#,@发行价串#)-1) as decimal(16,9)); */
          set v_issue_price=cast(substring(v_issue_price_str,1,LOCATE(v_split_str,v_issue_price_str)-1) as decimal(16,9));

          /* set @票面面值#=cast(substring(@票面面值串#,1,LOCATE(@分隔符#,@票面面值串#)-1) as decimal(16,9)); */
          set v_par_value=cast(substring(v_par_value_str,1,LOCATE(v_split_str,v_par_value_str)-1) as decimal(16,9));
    #将聚源的债券类型转换为 系统内的证券类型

          /* if (@债券类型#=1600 or @债券类型#=1900 or @债券类型#=2100) then */
          if (v_bond_type=1600 or v_bond_type=1900 or v_bond_type=2100) then

                 /* set @证券类型# = 24; */
                 set v_stock_type = 24;

                 /* set @资产类型# = 22; */
                 set v_asset_type = 22;

          /* elseif @债券类型#=2300 then */
          elseif v_bond_type=2300 then

                 /* set @证券类型# = 40; */
                 set v_stock_type = 40;

                 /* set @资产类型# = 22; */
                 set v_asset_type = 22;

          /* elseif (@债券类型#=3000 or @债券类型#=3500) then */
          elseif (v_bond_type=3000 or v_bond_type=3500) then

                 /* set @证券类型# = 41; */
                 set v_stock_type = 41;

                 /* set @资产类型# = 23; */
                 set v_asset_type = 23;
          else

                 /* set @证券类型# = 24; */
                 set v_stock_type = 24;

                 /* set @资产类型# = 22; */
                 set v_asset_type = 22;
          end if;

          /* set @临时_证券代码#=@证券代码#; */
          set v_tmp_stock_code=v_stock_code;

          /* set @临时_申购上限#=ifnull(@申购上限#,0); */
          set v_tmp_apply_limit=ifnull(v_apply_limit,0);

          /* set @申购上限#=@临时_申购上限#; */
          set v_apply_limit=v_tmp_apply_limit;

          /* set @临时_发行价#=ifnull(@发行价#,0); */
          set v_tmp_issue_price=ifnull(v_issue_price,0);

          /* set @公允价格#=@临时_发行价#; */
          set v_fair_price=v_tmp_issue_price;

          /* set @发行价#=@临时_发行价#; */
          set v_issue_price=v_tmp_issue_price;

          /* set @本币币种# = 'CNY'; */
          set v_crncy_type = 'CNY';

          /* set @交易币种# = 'CNY'; */
          set v_exch_crncy_type = 'CNY';

          /* set @总股本#= 0; */
          set v_total_stock_issue= 0;

          /* set @流通股本# = 0; */
          set v_circl_stock_capit = 0;

          /* set @资金回转天数# = 0; */
          set v_capit_reback_days = 0;

          /* set @持仓回转天数# = 0; */
          set v_posi_reback_days = 0;

          /* set @类型单位# = 2; */
          set v_type_unit = 2;

          /* set @申报单位# = 1; */
          set v_report_unit = 1;

          /* set @最小单位# = 10; */
          set v_min_unit = 10;

          /* set @最大数量# = 1000000; */
          set v_max_qty = 1000000;

          /* set @最小数量# = 10; */
          set v_min_qty = 10;

          /* set @区分订单方向标志# = 《区分订单方向标志-否》; */
          set v_is_order_dir_flag = 2;

          /* set @价格上限# = 0; */
          set v_price_up = 0;

          /* set @价格下限# = 0; */
          set v_price_down = 0;

          /* if @市场编号#=《市场编号-上海证券交易所》 then */
          if v_exch_no=1 then

                /* set @最小价差# = 0.01; */
                set v_step_price = 0.01;

          /* elseif @市场编号#=《市场编号-深圳证券交易所》 then */
          elseif v_exch_no=2 then

                 /* set @最小价差# = 0.001; */
                 set v_step_price = 0.001;
         end if;

          /* set @涨停价# = 0; */
          set v_up_limit_price = 0;

          /* set @跌停价# = 0; */
          set v_down_limit_price = 0;

          /* set @昨收盘价# = 0; */
          set v_pre_close_price = 0;

          /* set @公允价格# = 0; */
          set v_fair_price = 0;

          /* set @停牌标志# = 《停牌标志-正常》; */
          set v_stop_status = "1";

          /* set @交易代码# = @证券代码#; */
          set v_trade_code = v_stock_code;

          /* set @标的代码# = @证券代码#; */
          set v_target_code = v_stock_code;

          /* set @交易代码编号# = 0; */
          set v_trade_code_no = 0;

          /* set @标的代码编号# = 0; */
          set v_target_code_no = 0;

          /* set @上市日期#=0; */
          set v_begin_trade_date=0;

          /* set @港股通标的# = 《港股通标的-不是》; */
          set v_hk_stock_flag = 2;
    #新增可转债的债券代码

          /* 调用【原子_公共_基础数据同步_更新新股信息】*/
          call db_pub.pra_basesync_UpdateNewStockInfo(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_exch_no,
              v_stock_code,
              v_stock_name,
              v_pinyin_short,
              v_stock_type,
              v_asset_type,
              v_par_value,
              v_crncy_type,
              v_exch_crncy_type,
              v_total_stock_issue,
              v_circl_stock_capit,
              v_capit_reback_days,
              v_posi_reback_days,
              v_type_unit,
              v_report_unit,
              v_min_unit,
              v_max_qty,
              v_min_qty,
              v_is_order_dir_flag,
              v_price_up,
              v_price_down,
              v_step_price,
              v_fair_price,
              v_stop_status,
              v_hk_stock_flag,
              v_trade_code,
              v_target_code,
              v_trade_code_no,
              v_target_code_no,
              v_apply_date,
              v_apply_limit,
              v_begin_trade_date,
              v_issue_price,
              v_error_code,
              v_error_info);
          if v_error_code = "1" then
              SET v_error_code = "pubT.28.173.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新新股信息出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;

    #新增可转债的申购代码对应的数据

          /* set @证券类型#=《证券类型-债券申购》; */
          set v_stock_type=32;

          /* set @证券代码#=@申购代码#; */
          set v_stock_code=v_apply_code;

          /* set @交易代码#=@临时_证券代码#; */
          set v_trade_code=v_tmp_stock_code;

          /* set @标的代码#=@临时_证券代码#; */
          set v_target_code=v_tmp_stock_code;

          /* 调用【原子_公共_基础数据同步_更新新股信息】*/
          call db_pub.pra_basesync_UpdateNewStockInfo(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_exch_no,
              v_stock_code,
              v_stock_name,
              v_pinyin_short,
              v_stock_type,
              v_asset_type,
              v_par_value,
              v_crncy_type,
              v_exch_crncy_type,
              v_total_stock_issue,
              v_circl_stock_capit,
              v_capit_reback_days,
              v_posi_reback_days,
              v_type_unit,
              v_report_unit,
              v_min_unit,
              v_max_qty,
              v_min_qty,
              v_is_order_dir_flag,
              v_price_up,
              v_price_down,
              v_step_price,
              v_fair_price,
              v_stop_status,
              v_hk_stock_flag,
              v_trade_code,
              v_target_code,
              v_trade_code_no,
              v_target_code_no,
              v_apply_date,
              v_apply_limit,
              v_begin_trade_date,
              v_issue_price,
              v_error_code,
              v_error_info);
          if v_error_code = "1" then
              SET v_error_code = "pubT.28.173.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新新股信息出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;

    #插入行情表    插入2次，申购代码和 证券代码

          /* set @最新价#= @票面面值#; */
          set v_last_price= v_par_value;

          /* set @证券代码# = @临时_证券代码#; */
          set v_stock_code = v_tmp_stock_code;

          /* 调用【原子_公共_基础数据同步_新增证券行情信息】*/
          call db_pub.pra_basesync_AddStockQuotInfo(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_exch_no,
              v_stock_code,
              v_stock_name,
              v_issue_price,
              v_up_limit_price,
              v_down_limit_price,
              v_last_price,
              v_error_code,
              v_error_info);
          if v_error_code = "1" then
              SET v_error_code = "pubT.28.173.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_新增证券行情信息出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;


          /* set @证券代码# = @申购代码#; */
          set v_stock_code = v_apply_code;

          /* 调用【原子_公共_基础数据同步_新增证券行情信息】*/
          call db_pub.pra_basesync_AddStockQuotInfo(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_exch_no,
              v_stock_code,
              v_stock_name,
              v_issue_price,
              v_up_limit_price,
              v_down_limit_price,
              v_last_price,
              v_error_code,
              v_error_info);
          if v_error_code = "1" then
              SET v_error_code = "pubT.28.173.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_新增证券行情信息出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;


          /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
          set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);

          /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
          set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

          /* set @证券名称串#=substring(@证券名称串#,LOCATE(@分隔符#,@证券名称串#)+1); */
          set v_stock_name_str=substring(v_stock_name_str,LOCATE(v_split_str,v_stock_name_str)+1);

          /* set @拼音简称串#=substring(@拼音简称串#,LOCATE(@分隔符#,@拼音简称串#)+1); */
          set v_pinyin_short_str=substring(v_pinyin_short_str,LOCATE(v_split_str,v_pinyin_short_str)+1);

          /* set @债券类型串#=substring(@债券类型串#,LOCATE(@分隔符#,@债券类型串#)+1); */
          set v_bond_type_str=substring(v_bond_type_str,LOCATE(v_split_str,v_bond_type_str)+1);

          /* set @申购代码串#=substring(@申购代码串#,LOCATE(@分隔符#,@申购代码串#)+1); */
          set v_apply_code_str=substring(v_apply_code_str,LOCATE(v_split_str,v_apply_code_str)+1);

          /* set @申购上限串#=substring(@申购上限串#,LOCATE(@分隔符#,@申购上限串#)+1); */
          set v_apply_limit_str=substring(v_apply_limit_str,LOCATE(v_split_str,v_apply_limit_str)+1);

          /* set @申购日期串#=substring(@申购日期串#,LOCATE(@分隔符#,@申购日期串#)+1); */
          set v_apply_date_str=substring(v_apply_date_str,LOCATE(v_split_str,v_apply_date_str)+1);

          /* set @发行价串#=substring(@发行价串#,LOCATE(@分隔符#,@发行价串#)+1); */
          set v_issue_price_str=substring(v_issue_price_str,LOCATE(v_split_str,v_issue_price_str)+1);

          /* set @票面面值串#=substring(@票面面值串#,LOCATE(@分隔符#,@票面面值串#)+1); */
          set v_par_value_str=substring(v_par_value_str,LOCATE(v_split_str,v_par_value_str)+1);
    end while;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_基础数据同步_更新基金信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_UpdateFundInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_UpdateFundInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_str varchar(4096),
    IN p_stock_name_str varchar(2048),
    IN p_pinyin_short_str varchar(4096),
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
    IN p_fund_invest_type_str varchar(4096),
    IN p_fund_type_str varchar(4096),
    IN p_fund_share_str varchar(4096),
    IN p_market_share_str varchar(4096),
    IN p_circl_stock_capit_str varchar(4096),
    IN p_total_stock_issue_str varchar(4096),
    IN p_split_str varchar(4),
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
    declare v_stock_code_str varchar(4096);
    declare v_stock_name_str varchar(2048);
    declare v_pinyin_short_str varchar(4096);
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_fund_invest_type_str varchar(4096);
    declare v_fund_type_str varchar(4096);
    declare v_fund_share_str varchar(4096);
    declare v_market_share_str varchar(4096);
    declare v_circl_stock_capit_str varchar(4096);
    declare v_total_stock_issue_str varchar(4096);
    declare v_split_str varchar(4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_name varchar(64);
    declare v_pinyin_short varchar(16);
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_tmp_circl_stock_capit decimal(18,2);
    declare v_tmp_total_stock_issue decimal(18,2);
    declare v_circl_stock_capit decimal(18,2);
    declare v_total_stock_issue decimal(18,2);
    declare v_par_value decimal(16,9);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_type_unit int;
    declare v_report_unit int;
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_is_order_dir_flag int;
    declare v_price_up decimal(16,9);
    declare v_price_down decimal(16,9);
    declare v_step_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_stop_status varchar(2);
    declare v_hk_stock_flag int;

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
    SET v_stock_code_str = p_stock_code_str;
    SET v_stock_name_str = p_stock_name_str;
    SET v_pinyin_short_str = p_pinyin_short_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_fund_invest_type_str = p_fund_invest_type_str;
    SET v_fund_type_str = p_fund_type_str;
    SET v_fund_share_str = p_fund_share_str;
    SET v_market_share_str = p_market_share_str;
    SET v_circl_stock_capit_str = p_circl_stock_capit_str;
    SET v_total_stock_issue_str = p_total_stock_issue_str;
    SET v_split_str = p_split_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_stock_name = " ";
    SET v_pinyin_short = " ";
    SET v_asset_type = 0;
    SET v_stock_type = 0;
    SET v_tmp_circl_stock_capit = 0;
    SET v_tmp_total_stock_issue = 0;
    SET v_circl_stock_capit = 0;
    SET v_total_stock_issue = 0;
    SET v_par_value = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_type_unit = 0;
    SET v_report_unit = 0;
    SET v_min_unit = 0;
    SET v_max_qty = 0;
    SET v_min_qty = 0;
    SET v_is_order_dir_flag = 0;
    SET v_price_up = 0;
    SET v_price_down = 0;
    SET v_step_price = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_pre_close_price = 0;
    SET v_fair_price = 0;
    SET v_stop_status = "0";
    SET v_hk_stock_flag = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* while LOCATE(@分隔符#,@证券代码串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_str)<>0   do

          /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
          set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

          /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
          set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

          /* set @证券名称#=substring(@证券名称串#,1,LOCATE(@分隔符#,@证券名称串#)-1); */
          set v_stock_name=substring(v_stock_name_str,1,LOCATE(v_split_str,v_stock_name_str)-1);

          /* set @拼音简称#=substring(@拼音简称串#,1,LOCATE(@分隔符#,@拼音简称串#)-1); */
          set v_pinyin_short=substring(v_pinyin_short_str,1,LOCATE(v_split_str,v_pinyin_short_str)-1);

          /* set @资产类型#=cast(substring(@资产类型串#,1,LOCATE(@分隔符#,@资产类型串#)-1) as SIGNED); */
          set v_asset_type=cast(substring(v_asset_type_str,1,LOCATE(v_split_str,v_asset_type_str)-1) as SIGNED);

          /* set @证券类型#=cast(substring(@证券类型串#,1,LOCATE(@分隔符#,@证券类型串#)-1) as SIGNED); */
          set v_stock_type=cast(substring(v_stock_type_str,1,LOCATE(v_split_str,v_stock_type_str)-1) as SIGNED);

          /* set @临时_流通股本#=cast(substring(@流通股本串#,1,LOCATE(@分隔符#,@流通股本串#)-1) as decimal(18,2)); */
          set v_tmp_circl_stock_capit=cast(substring(v_circl_stock_capit_str,1,LOCATE(v_split_str,v_circl_stock_capit_str)-1) as decimal(18,2));

          /* set @临时_总股本#=cast(substring(@总股本串#,1,LOCATE(@分隔符#,@总股本串#)-1) as decimal(18,2)); */
          set v_tmp_total_stock_issue=cast(substring(v_total_stock_issue_str,1,LOCATE(v_split_str,v_total_stock_issue_str)-1) as decimal(18,2));

          /* set @流通股本#=ifnull(@临时_流通股本#,0); */
          set v_circl_stock_capit=ifnull(v_tmp_circl_stock_capit,0);

          /* set @总股本#=ifnull(@临时_总股本#,@流通股本#); */
          set v_total_stock_issue=ifnull(v_tmp_total_stock_issue,v_circl_stock_capit);

          /* set @票面面值#=1; */
          set v_par_value=1;

          /* set @本币币种# = 'CNY'; */
          set v_crncy_type = 'CNY';

          /* set @交易币种# = 'CNY'; */
          set v_exch_crncy_type = 'CNY';

          /* set @资金回转天数# = 0; */
          set v_capit_reback_days = 0;
    #货币ETF、跨境ETF、跨境LOF基金、黄金ETF基金、债券ETF基金

          /* if (@证券类型#=57 or @证券类型#=58 or @证券类型#=59 or @证券类型#=60 or @证券类型#=64) then */
          if (v_stock_type=57 or v_stock_type=58 or v_stock_type=59 or v_stock_type=60 or v_stock_type=64) then

               /* set @持仓回转天数# = 0; */
               set v_posi_reback_days = 0;
          else

               /* set @持仓回转天数# = 1; */
               set v_posi_reback_days = 1;
          end if;

          /* set @类型单位# = 3; */
          set v_type_unit = 3;

          /* set @申报单位# = 1; */
          set v_report_unit = 1;

          /* set @最小单位# = 100; */
          set v_min_unit = 100;

          /* set @最大数量# = 1000000; */
          set v_max_qty = 1000000;

          /* set @最小数量# = 100; */
          set v_min_qty = 100;

          /* set @区分订单方向标志# = 《区分订单方向标志-是》; */
          set v_is_order_dir_flag = 1;

          /* set @价格上限# = 0; */
          set v_price_up = 0;

          /* set @价格下限# = 0; */
          set v_price_down = 0;

          /* set @最小价差# = 0.001; */
          set v_step_price = 0.001;

          /* set @涨停价# = 0; */
          set v_up_limit_price = 0;

          /* set @跌停价# = 0; */
          set v_down_limit_price = 0;

          /* set @昨收盘价# = 0; */
          set v_pre_close_price = 0;

          /* set @公允价格# = 0; */
          set v_fair_price = 0;

          /* set @停牌标志# = 《停牌标志-正常》; */
          set v_stop_status = "1";

          /* set @港股通标的# = 《港股通标的-不是》; */
          set v_hk_stock_flag = 2;

          /* 调用【原子_公共_基础数据同步_更新基金信息】*/
          call db_pub.pra_basesync_UpdateFundInfo(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_exch_no,
              v_stock_code,
              v_stock_name,
              v_pinyin_short,
              v_stock_type,
              v_asset_type,
              v_par_value,
              v_crncy_type,
              v_exch_crncy_type,
              v_total_stock_issue,
              v_circl_stock_capit,
              v_capit_reback_days,
              v_posi_reback_days,
              v_type_unit,
              v_report_unit,
              v_min_unit,
              v_max_qty,
              v_min_qty,
              v_is_order_dir_flag,
              v_price_up,
              v_price_down,
              v_step_price,
              v_up_limit_price,
              v_down_limit_price,
              v_pre_close_price,
              v_fair_price,
              v_stop_status,
              v_hk_stock_flag,
              v_error_code,
              v_error_info);
          if v_error_code = "1" then
              SET v_error_code = "pubT.28.174.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新基金信息出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;


          /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
          set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);

          /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
          set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

          /* set @证券名称串#=substring(@证券名称串#,LOCATE(@分隔符#,@证券名称串#)+1); */
          set v_stock_name_str=substring(v_stock_name_str,LOCATE(v_split_str,v_stock_name_str)+1);

          /* set @拼音简称串#=substring(@拼音简称串#,LOCATE(@分隔符#,@拼音简称串#)+1); */
          set v_pinyin_short_str=substring(v_pinyin_short_str,LOCATE(v_split_str,v_pinyin_short_str)+1);

          /* set @资产类型串#=substring(@资产类型串#,LOCATE(@分隔符#,@资产类型串#)+1); */
          set v_asset_type_str=substring(v_asset_type_str,LOCATE(v_split_str,v_asset_type_str)+1);

          /* set @证券类型串#=substring(@证券类型串#,LOCATE(@分隔符#,@证券类型串#)+1); */
          set v_stock_type_str=substring(v_stock_type_str,LOCATE(v_split_str,v_stock_type_str)+1);

          /* set @流通股本串#=substring(@流通股本串#,LOCATE(@分隔符#,@流通股本串#)+1); */
          set v_circl_stock_capit_str=substring(v_circl_stock_capit_str,LOCATE(v_split_str,v_circl_stock_capit_str)+1);

          /* set @总股本串#=substring(@总股本串#,LOCATE(@分隔符#,@总股本#)+1); */
          set v_total_stock_issue_str=substring(v_total_stock_issue_str,LOCATE(v_split_str,v_total_stock_issue)+1);
    end while;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_基础数据同步_更新债券信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_UpdateBondInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_UpdateBondInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_str varchar(4096),
    IN p_stock_name_str varchar(2048),
    IN p_pinyin_short_str varchar(4096),
    IN p_bond_type_str varchar(4096),
    IN p_bond_class_str varchar(4096),
    IN p_begin_trade_date_str varchar(4096),
    IN p_total_scale_str varchar(4096),
    IN p_impawn_code_str varchar(4096),
    IN p_issue_date_str varchar(4096),
    IN p_end_date_str varchar(4096),
    IN p_value_date_str varchar(4096),
    IN p_bond_limit_str varchar(4096),
    IN p_issue_price_str varchar(4096),
    IN p_intrst_ratio_str varchar(4096),
    IN p_early_expire_date varchar(4096),
    IN p_intrst_type_str varchar(4096),
    IN p_pay_intrst_type_str varchar(4096),
    IN p_bond_accr_intrst_str varchar(4096),
    IN p_std_stock_discount_str varchar(4096),
    IN p_split_str varchar(4),
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
    declare v_stock_code_str varchar(4096);
    declare v_stock_name_str varchar(2048);
    declare v_pinyin_short_str varchar(4096);
    declare v_bond_type_str varchar(4096);
    declare v_bond_class_str varchar(4096);
    declare v_begin_trade_date_str varchar(4096);
    declare v_total_scale_str varchar(4096);
    declare v_impawn_code_str varchar(4096);
    declare v_issue_date_str varchar(4096);
    declare v_end_date_str varchar(4096);
    declare v_value_date_str varchar(4096);
    declare v_bond_limit_str varchar(4096);
    declare v_issue_price_str varchar(4096);
    declare v_intrst_ratio_str varchar(4096);
    declare v_early_expire_date varchar(4096);
    declare v_intrst_type_str varchar(4096);
    declare v_pay_intrst_type_str varchar(4096);
    declare v_bond_accr_intrst_str varchar(4096);
    declare v_std_stock_discount_str varchar(4096);
    declare v_split_str varchar(4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_name varchar(64);
    declare v_pinyin_short varchar(16);
    declare v_bond_type int;
    declare v_tmp_stock_type int;
    declare v_tmp_begin_trade_date int;
    declare v_tmp_total_stock_issue decimal(18,2);
    declare v_tmp_issue_date int;
    declare v_tmp_end_date int;
    declare v_tmp_value_date int;
    declare v_bond_limit decimal(18,2);
    declare v_tmp_issue_price decimal(16,9);
    declare v_tmp_intrst_ratio decimal(18,12);
    declare v_tmp_last_trade_date int;
    declare v_tmp_bond_rate_type int;
    declare v_tmp_pay_inteval int;
    declare v_tmp_bond_accr_intrst decimal(18,12);
    declare v_tmp_impawn_ratio decimal(18,12);
    declare v_impawn_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_stock_code varchar(6);
    declare v_value_date int;
    declare v_begin_trade_date int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_total_stock_issue decimal(18,2);
    declare v_circl_stock_capit decimal(18,2);
    declare v_par_value decimal(16,9);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_type_unit int;
    declare v_report_unit int;
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_is_order_dir_flag int;
    declare v_price_up decimal(16,9);
    declare v_price_down decimal(16,9);
    declare v_step_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_stop_status varchar(2);
    declare v_hk_stock_flag int;
    declare v_issue_date int;
    declare v_end_date int;
    declare v_next_value_date int;
    declare v_issue_price decimal(16,9);
    declare v_intrst_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_pay_inteval int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_inteval_days int;
    declare v_net_price_flag int;
    declare v_last_trade_date int;
    declare v_rights_type int;
    declare v_trans_begin_date int;
    declare v_trans_end_date int;
    declare v_exec_begin_date int;
    declare v_exec_end_date int;
    declare v_impawn_ratio decimal(18,12);
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;

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
    SET v_stock_code_str = p_stock_code_str;
    SET v_stock_name_str = p_stock_name_str;
    SET v_pinyin_short_str = p_pinyin_short_str;
    SET v_bond_type_str = p_bond_type_str;
    SET v_bond_class_str = p_bond_class_str;
    SET v_begin_trade_date_str = p_begin_trade_date_str;
    SET v_total_scale_str = p_total_scale_str;
    SET v_impawn_code_str = p_impawn_code_str;
    SET v_issue_date_str = p_issue_date_str;
    SET v_end_date_str = p_end_date_str;
    SET v_value_date_str = p_value_date_str;
    SET v_bond_limit_str = p_bond_limit_str;
    SET v_issue_price_str = p_issue_price_str;
    SET v_intrst_ratio_str = p_intrst_ratio_str;
    SET v_early_expire_date = p_early_expire_date;
    SET v_intrst_type_str = p_intrst_type_str;
    SET v_pay_intrst_type_str = p_pay_intrst_type_str;
    SET v_bond_accr_intrst_str = p_bond_accr_intrst_str;
    SET v_std_stock_discount_str = p_std_stock_discount_str;
    SET v_split_str = p_split_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_stock_code = " ";
    SET v_exch_no = 0;
    SET v_stock_name = " ";
    SET v_pinyin_short = " ";
    SET v_bond_type = 0;
    SET v_tmp_stock_type = 0;
    SET v_tmp_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_total_stock_issue = 0;
    SET v_tmp_issue_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_end_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_value_date = date_format(curdate(),'%Y%m%d');
    SET v_bond_limit = 0;
    SET v_tmp_issue_price = 0;
    SET v_tmp_intrst_ratio = 0;
    SET v_tmp_last_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_bond_rate_type = 0;
    SET v_tmp_pay_inteval = 0;
    SET v_tmp_bond_accr_intrst = 0;
    SET v_tmp_impawn_ratio = 0;
    SET v_impawn_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_stock_code = " ";
    SET v_value_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_total_stock_issue = 0;
    SET v_circl_stock_capit = 0;
    SET v_par_value = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_type_unit = 0;
    SET v_report_unit = 0;
    SET v_min_unit = 0;
    SET v_max_qty = 0;
    SET v_min_qty = 0;
    SET v_is_order_dir_flag = 0;
    SET v_price_up = 0;
    SET v_price_down = 0;
    SET v_step_price = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_pre_close_price = 0;
    SET v_fair_price = 0;
    SET v_stop_status = "0";
    SET v_hk_stock_flag = 0;
    SET v_issue_date = date_format(curdate(),'%Y%m%d');
    SET v_end_date = date_format(curdate(),'%Y%m%d');
    SET v_next_value_date = date_format(curdate(),'%Y%m%d');
    SET v_issue_price = 0;
    SET v_intrst_ratio = 0;
    SET v_intrst_days = 0;
    SET v_pay_inteval = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_inteval_days = 0;
    SET v_net_price_flag = 0;
    SET v_last_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_rights_type = 0;
    SET v_trans_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_trans_end_date = date_format(curdate(),'%Y%m%d');
    SET v_exec_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_exec_end_date = date_format(curdate(),'%Y%m%d');
    SET v_impawn_ratio = 0;
    SET v_trade_code = " ";
    SET v_target_code = " ";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* while LOCATE(@分隔符#,@证券代码串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_str)<>0   do

          /* set @临时_证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
          set v_tmp_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

          /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
          set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

          /* set @证券名称#=substring(@证券名称串#,1,LOCATE(@分隔符#,@证券名称串#)-1); */
          set v_stock_name=substring(v_stock_name_str,1,LOCATE(v_split_str,v_stock_name_str)-1);

          /* set @拼音简称#=substring(@拼音简称串#,1,LOCATE(@分隔符#,@拼音简称串#)-1); */
          set v_pinyin_short=substring(v_pinyin_short_str,1,LOCATE(v_split_str,v_pinyin_short_str)-1);

          /* set @债券类型#=cast(substring(@债券类型串#,1,LOCATE(@分隔符#,@债券类型串#)-1) as SIGNED); */
          set v_bond_type=cast(substring(v_bond_type_str,1,LOCATE(v_split_str,v_bond_type_str)-1) as SIGNED);

          /* set @临时_证券类型#=cast(substring(@债券分类串#,1,LOCATE(@分隔符#,@债券分类串#)-1) as SIGNED); */
          set v_tmp_stock_type=cast(substring(v_bond_class_str,1,LOCATE(v_split_str,v_bond_class_str)-1) as SIGNED);

          /* set @临时_上市日期#=cast(substring(@上市日期串#,1,LOCATE(@分隔符#,@上市日期串#)-1) as SIGNED); */
          set v_tmp_begin_trade_date=cast(substring(v_begin_trade_date_str,1,LOCATE(v_split_str,v_begin_trade_date_str)-1) as SIGNED);

          /* set @临时_总股本#=cast(substring(@总规模串#,1,LOCATE(@分隔符#,@总规模串#)-1) as decimal(18,2)); */
          set v_tmp_total_stock_issue=cast(substring(v_total_scale_str,1,LOCATE(v_split_str,v_total_scale_str)-1) as decimal(18,2));

          /* set @临时_发行日期#=cast(substring(@发行日期串#,1,LOCATE(@分隔符#,@发行日期串#)-1) as SIGNED); */
          set v_tmp_issue_date=cast(substring(v_issue_date_str,1,LOCATE(v_split_str,v_issue_date_str)-1) as SIGNED);

          /* set @临时_结束日期#=cast(substring(@结束日期串#,1,LOCATE(@分隔符#,@结束日期串#)-1) as SIGNED); */
          set v_tmp_end_date=cast(substring(v_end_date_str,1,LOCATE(v_split_str,v_end_date_str)-1) as SIGNED);

          /* set @临时_起息日期#=cast(substring(@起息日期串#,1,LOCATE(@分隔符#,@起息日期串#)-1) as SIGNED); */
          set v_tmp_value_date=cast(substring(v_value_date_str,1,LOCATE(v_split_str,v_value_date_str)-1) as SIGNED);

          /* set @债券期限#=cast(substring(@债券期限串#,1,LOCATE(@分隔符#,@债券期限串#)-1) as decimal(18,2)); */
          set v_bond_limit=cast(substring(v_bond_limit_str,1,LOCATE(v_split_str,v_bond_limit_str)-1) as decimal(18,2));

          /* set @临时_发行价#=cast(substring(@发行价串#,1,LOCATE(@分隔符#,@发行价串#)-1) as decimal(16,9)); */
          set v_tmp_issue_price=cast(substring(v_issue_price_str,1,LOCATE(v_split_str,v_issue_price_str)-1) as decimal(16,9));

          /* set @临时_年利率#=cast(substring(@年利率串#,1,LOCATE(@分隔符#,@年利率串#)-1) as decimal(18,12)); */
          set v_tmp_intrst_ratio=cast(substring(v_intrst_ratio_str,1,LOCATE(v_split_str,v_intrst_ratio_str)-1) as decimal(18,12));

          /* set @临时_最后交易日#=cast(substring(@提前到期日串#,1,LOCATE(@分隔符#,@提前到期日串#)-1) as SIGNED); */
          set v_tmp_last_trade_date=cast(substring(v_early_expire_date,1,LOCATE(v_split_str,v_early_expire_date)-1) as SIGNED);

          /* set @临时_债券利率类型#=cast(substring(@计息方式串#,1,LOCATE(@分隔符#,@计息方式串#)-1) as SIGNED); */
          set v_tmp_bond_rate_type=cast(substring(v_intrst_type_str,1,LOCATE(v_split_str,v_intrst_type_str)-1) as SIGNED);

          /* set @临时_付息间隔#=cast(substring(@付息方式串#,1,LOCATE(@分隔符#,@付息方式串#)-1) as SIGNED); */
          set v_tmp_pay_inteval=cast(substring(v_pay_intrst_type_str,1,LOCATE(v_split_str,v_pay_intrst_type_str)-1) as SIGNED);

          /* set @临时_债券计提利息#=cast(substring(@债券计提利息串#,1,LOCATE(@分隔符#,@债券计提利息串#)-1) as decimal(18,12)); */
          set v_tmp_bond_accr_intrst=cast(substring(v_bond_accr_intrst_str,1,LOCATE(v_split_str,v_bond_accr_intrst_str)-1) as decimal(18,12));

          /* set @临时_质押比例#=cast(substring(@发行价串#,1,LOCATE(@分隔符#,@标准券折算率串#)-1) as decimal(18,12)); */
          set v_tmp_impawn_ratio=cast(substring(v_issue_price_str,1,LOCATE(v_split_str,v_std_stock_discount_str)-1) as decimal(18,12));

          /* set @质押代码#=substring(@质押代码串#,1,LOCATE(@分隔符#,@质押代码串#)-1); */
          set v_impawn_code=substring(v_impawn_code_str,1,LOCATE(v_split_str,v_impawn_code_str)-1);
    #将聚源的债券类型转换为 系统内的证券类型

          /* set @证券类型#= case when @临时_证券类型# in (1000,1100,1800) then 21 */
          set v_stock_type= case when v_tmp_stock_type in (1000,1100,1800) then 21

                                     /* when @临时_证券类型# in (1600,2100,1900) then 22 */
                                     when v_tmp_stock_type in (1600,2100,1900) then 22

                                     /* when @临时_证券类型#=1700  then 23 */
                                     when v_tmp_stock_type=1700  then 23

                                     /* when @临时_证券类型#=2200  then 24 */
                                     when v_tmp_stock_type=2200  then 24

                                     /* when @临时_证券类型# in (1200,1300,1400,1500,3400,3600) then case when @债券类型#=2 then 25 when @债券类型#=3 then 43 else 23 end */
                                     when v_tmp_stock_type in (1200,1300,1400,1500,3400,3600) then case when v_bond_type=2 then 25 when v_bond_type=3 then 43 else 23 end

                                     /* when @临时_证券类型#=2400  then 37 */
                                     when v_tmp_stock_type=2400  then 37

                                     /* when @临时_证券类型#=2300  then 40 */
                                     when v_tmp_stock_type=2300  then 40

                                     /* when @临时_证券类型# in (3000,3500) then 41 */
                                     when v_tmp_stock_type in (3000,3500) then 41

                                     /* when @临时_证券类型# in (2500,2600,2800,2900,3100,3200,3300,3700,9900) then 42 */
                                     when v_tmp_stock_type in (2500,2600,2800,2900,3100,3200,3300,3700,9900) then 42

                                     /* when @临时_证券类型#=2700  then 43 */
                                     when v_tmp_stock_type=2700  then 43

                                     /* when @临时_证券类型#=2000  then 44 */
                                     when v_tmp_stock_type=2000  then 44
                                     end;

          /* set @资产类型#= case when @临时_证券类型# in (1000,1100,1800) then 21 */
          set v_asset_type= case when v_tmp_stock_type in (1000,1100,1800) then 21

                                     /* when @临时_证券类型# in (1600,2100,1900) then 22 */
                                     when v_tmp_stock_type in (1600,2100,1900) then 22

                                     /* when @临时_证券类型#=1700  then 23 */
                                     when v_tmp_stock_type=1700  then 23

                                     /* when @临时_证券类型#=2200  then 22 */
                                     when v_tmp_stock_type=2200  then 22

                                     /* when @临时_证券类型# in (1200,1300,1400,1500,3400,3600) then case when @债券类型#=2 then 24 when @债券类型#=3 then 26 else 23 end */
                                     when v_tmp_stock_type in (1200,1300,1400,1500,3400,3600) then case when v_bond_type=2 then 24 when v_bond_type=3 then 26 else 23 end

                                     /* when @临时_证券类型#=2400  then 25 */
                                     when v_tmp_stock_type=2400  then 25

                                     /* when @临时_证券类型#=2300  then 22 */
                                     when v_tmp_stock_type=2300  then 22

                                     /* when @临时_证券类型# in (3000,3500) then 23 */
                                     when v_tmp_stock_type in (3000,3500) then 23

                                     /* when @临时_证券类型# in (2500,2600,2800,2900,3100,3200,3300,3700,9900) then 23 */
                                     when v_tmp_stock_type in (2500,2600,2800,2900,3100,3200,3300,3700,9900) then 23

                                     /* when @临时_证券类型#=2700  then 26 */
                                     when v_tmp_stock_type=2700  then 26

                                     /* when @临时_证券类型#=2000  then 27 */
                                     when v_tmp_stock_type=2000  then 27
                                     end;

          /* set @证券代码# = @临时_证券代码#; */
          set v_stock_code = v_tmp_stock_code;

          /* set @起息日期#=@临时_起息日期#; */
          set v_value_date=v_tmp_value_date;

          /* set @上市日期#=ifnull(DATE_FORMAT(@临时_上市日期#,"%Y%m%d"),0); */
          set v_begin_trade_date=ifnull(DATE_FORMAT(v_tmp_begin_trade_date,"%Y%m%d"),0);

          /* set @本币币种# = 'CNY'; */
          set v_crncy_type = 'CNY';

          /* set @交易币种# = 'CNY'; */
          set v_exch_crncy_type = 'CNY';
    #总规模单位(百万元)  *百万/100

          /* set @总股本#= @临时_总股本#*10000; */
          set v_total_stock_issue= v_tmp_total_stock_issue*10000;

          /* set @流通股本# = @总股本#; */
          set v_circl_stock_capit = v_total_stock_issue;

          /* set @票面面值#=100; */
          set v_par_value=100;

          /* set @资金回转天数# = 0; */
          set v_capit_reback_days = 0;

          /* set @持仓回转天数# = 0; */
          set v_posi_reback_days = 0;

          /* set @类型单位# = 2; */
          set v_type_unit = 2;

          /* set @申报单位# = 1; */
          set v_report_unit = 1;

          /* set @最小单位# = 10; */
          set v_min_unit = 10;

          /* set @最大数量# = 1000000; */
          set v_max_qty = 1000000;

          /* set @最小数量# = 10; */
          set v_min_qty = 10;

          /* set @区分订单方向标志# = 《区分订单方向标志-否》; */
          set v_is_order_dir_flag = 2;

          /* set @价格上限# = 0; */
          set v_price_up = 0;

          /* set @价格下限# = 0; */
          set v_price_down = 0;
    #区分可转债 沪市最小价差

          /* if @市场编号#=《市场编号-上海证券交易所》 then */
          if v_exch_no=1 then

                /* set @最小价差# = 0.005; */
                set v_step_price = 0.005;

          /* elseif @市场编号#=《市场编号-深圳证券交易所》 then */
          elseif v_exch_no=2 then

                 /* set @最小价差# = 0.001; */
                 set v_step_price = 0.001;
         end if;

          /* set @涨停价# = 0; */
          set v_up_limit_price = 0;

          /* set @跌停价# = 0; */
          set v_down_limit_price = 0;

          /* set @昨收盘价# = 0; */
          set v_pre_close_price = 0;

          /* set @公允价格# = 0; */
          set v_fair_price = 0;

          /* set @停牌标志# = 《停牌标志-正常》; */
          set v_stop_status = "1";

          /* set @港股通标的# = 《港股通标的-不是》; */
          set v_hk_stock_flag = 2;

          /* set @发行日期#=ifnull(DATE_FORMAT(@临时_发行日期#,"%Y%m%d"),0); */
          set v_issue_date=ifnull(DATE_FORMAT(v_tmp_issue_date,"%Y%m%d"),0);

          /* set @结束日期#=ifnull(DATE_FORMAT(@临时_结束日期#,"%Y%m%d"),0); */
          set v_end_date=ifnull(DATE_FORMAT(v_tmp_end_date,"%Y%m%d"),0);

          /* set @下一起息日期#=0; */
          set v_next_value_date=0;

          /* set @发行价#=ifnull(@临时_发行价#,0); */
          set v_issue_price=ifnull(v_tmp_issue_price,0);

          /* set @年利率#=ifnull(@临时_年利率#/100,0); */
          set v_intrst_ratio=ifnull(v_tmp_intrst_ratio/100,0);

          /* set @计息天数#=365; */
          set v_intrst_days=365;
    #聚源付息方式：1-每年付息，2-半年付息，3-到期一次还本付息，4-按季付息，5-按月付息

          /* set @付息间隔#= case when @临时_付息间隔#=1 then 4 */
          set v_pay_inteval= case when v_tmp_pay_inteval=1 then 4

                                    /* when @临时_付息间隔#=2 then 3 */
                                    when v_tmp_pay_inteval=2 then 3

                                    /* when @临时_付息间隔#=3 then 5 */
                                    when v_tmp_pay_inteval=3 then 5

                                    /* when @临时_付息间隔#=4 then 2 */
                                    when v_tmp_pay_inteval=4 then 2

                                    /* when @临时_付息间隔#=5 then 1 */
                                    when v_tmp_pay_inteval=5 then 1
                                    else  6
                                    end;

          /* set @债券计提利息#=ifnull(@临时_债券计提利息#,0); */
          set v_bond_accr_intrst=ifnull(v_tmp_bond_accr_intrst,0);
    #聚源计息方式：1-固定利率      3-浮动利率       4-累进利率       5-贴现        6-无序利率

          /* set @债券利率类型#= case when @临时_债券利率类型#=1 then 1 */
          set v_bond_rate_type= case when v_tmp_bond_rate_type=1 then 1

                                    /* when @临时_债券利率类型# in(3,4,6)  then 2 */
                                    when v_tmp_bond_rate_type in(3,4,6)  then 2
                                    else  3
                                    end;

          /* set @间隔天数#=0; */
          set v_inteval_days=0;

          /* set @净价标志#= case when @市场编号#=1 then 1 */
          set v_net_price_flag= case when v_exch_no=1 then 1

                                    /* else if(@临时_证券类型# in(2200,3000,3500),2,1) */
                                    else if(v_tmp_stock_type in(2200,3000,3500),2,1)
                                    end;

          /* set @最后交易日#=DATE_FORMAT(ifnull(@临时_最后交易日#,@结束日期#),"%Y%m%d"); */
          set v_last_trade_date=DATE_FORMAT(ifnull(v_tmp_last_trade_date,v_end_date),"%Y%m%d");

          /* set @权益类型#=0; */
          set v_rights_type=0;

          /* set @转股开始日期#=0; */
          set v_trans_begin_date=0;

          /* set @转股结束日期#=0; */
          set v_trans_end_date=0;

          /* set @行权开始日期#=0; */
          set v_exec_begin_date=0;

          /* set @行权结束日期#=0; */
          set v_exec_end_date=0;

          /* set @质押比例#=ifnull(@临时_质押比例#,0); */
          set v_impawn_ratio=ifnull(v_tmp_impawn_ratio,0);

          /* set @交易代码# = " "; */
          set v_trade_code = " ";

          /* set @标的代码# = " "; */
          set v_target_code = " ";

          /* set @交易代码编号# = 0; */
          set v_trade_code_no = 0;

          /* set @标的代码编号# = 0; */
          set v_target_code_no = 0;

          /* 调用【原子_公共_基础数据同步_更新债券信息】*/
          call db_pub.pra_basesync_UpdateBondInfo(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_exch_no,
              v_stock_code,
              v_stock_name,
              v_pinyin_short,
              v_stock_type,
              v_asset_type,
              v_par_value,
              v_crncy_type,
              v_exch_crncy_type,
              v_total_stock_issue,
              v_circl_stock_capit,
              v_capit_reback_days,
              v_posi_reback_days,
              v_type_unit,
              v_report_unit,
              v_min_unit,
              v_max_qty,
              v_min_qty,
              v_is_order_dir_flag,
              v_price_up,
              v_price_down,
              v_step_price,
              v_up_limit_price,
              v_down_limit_price,
              v_pre_close_price,
              v_fair_price,
              v_stop_status,
              v_hk_stock_flag,
              v_trade_code,
              v_target_code,
              v_trade_code_no,
              v_target_code_no,
              v_issue_date,
              v_end_date,
              v_value_date,
              v_next_value_date,
              v_begin_trade_date,
              v_bond_limit,
              v_issue_price,
              v_intrst_ratio,
              v_intrst_days,
              v_pay_inteval,
              v_bond_accr_intrst,
              v_bond_rate_type,
              v_inteval_days,
              v_net_price_flag,
              v_last_trade_date,
              v_rights_type,
              v_trans_begin_date,
              v_trans_end_date,
              v_exec_begin_date,
              v_exec_end_date,
              v_impawn_ratio,
              v_error_code,
              v_error_info);
          if v_error_code = "1" then
              SET v_error_code = "pubT.28.175.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新债券信息出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;

    #判断上交所债券是否有质押代码，有则需将 质押代码作为 证券代码，证券代码 作为 交易代码 插入

          /* if @市场编号#=1 and ifnull(@质押代码#,0)=0 and @临时_质押比例#<>0 then */
          if v_exch_no=1 and ifnull(v_impawn_code,0)=0 and v_tmp_impawn_ratio<>0 then

                  /* set @证券代码#=@质押代码#; */
                  set v_stock_code=v_impawn_code;

                  /* set @证券类型#=28; */
                  set v_stock_type=28;

                  /* set @资产类型#=0; */
                  set v_asset_type=0;

                  /* set @总股本#=0; */
                  set v_total_stock_issue=0;

                  /* set @流通股本#=0; */
                  set v_circl_stock_capit=0;

                  /* set @最小价差#=0; */
                  set v_step_price=0;

                  /* set @交易代码#=@临时_证券代码#; */
                  set v_trade_code=v_tmp_stock_code;

                  /* set @标的代码#="888880"; */
                  set v_target_code="888880";

                  /* set @发行日期#=0; */
                  set v_issue_date=0;

                  /* set @结束日期#=0; */
                  set v_end_date=0;

                  /* set @起息日期#=0; */
                  set v_value_date=0;

                  /* set @上市日期#=0; */
                  set v_begin_trade_date=0;

                  /* set @债券期限#=0; */
                  set v_bond_limit=0;

                  /* set @发行价#=0; */
                  set v_issue_price=0;

                  /* set @年利率#=0; */
                  set v_intrst_ratio=0;

                  /* set @计息天数#=0; */
                  set v_intrst_days=0;

                  /* set @付息间隔#=0; */
                  set v_pay_inteval=0;

                  /* set @债券计提利息#=0; */
                  set v_bond_accr_intrst=0;

                  /* set @债券利率类型#=0; */
                  set v_bond_rate_type=0;

                  /* set @年利率#=0; */
                  set v_intrst_ratio=0;

                  /* set @净价标志#=1; */
                  set v_net_price_flag=1;

                  /* set @最后交易日#=0; */
                  set v_last_trade_date=0;

                  /* set @质押比例#=ifnull(@临时_质押比例#,0); */
                  set v_impawn_ratio=ifnull(v_tmp_impawn_ratio,0);

                  /* 调用【原子_公共_基础数据同步_更新债券信息】*/
                  call db_pub.pra_basesync_UpdateBondInfo(
                      v_opor_co_no,
                      v_opor_no,
                      v_oper_mac,
                      v_oper_ip_addr,
                      v_oper_info,
                      v_oper_way,
                      v_func_code,
                      v_exch_no,
                      v_stock_code,
                      v_stock_name,
                      v_pinyin_short,
                      v_stock_type,
                      v_asset_type,
                      v_par_value,
                      v_crncy_type,
                      v_exch_crncy_type,
                      v_total_stock_issue,
                      v_circl_stock_capit,
                      v_capit_reback_days,
                      v_posi_reback_days,
                      v_type_unit,
                      v_report_unit,
                      v_min_unit,
                      v_max_qty,
                      v_min_qty,
                      v_is_order_dir_flag,
                      v_price_up,
                      v_price_down,
                      v_step_price,
                      v_up_limit_price,
                      v_down_limit_price,
                      v_pre_close_price,
                      v_fair_price,
                      v_stop_status,
                      v_hk_stock_flag,
                      v_trade_code,
                      v_target_code,
                      v_trade_code_no,
                      v_target_code_no,
                      v_issue_date,
                      v_end_date,
                      v_value_date,
                      v_next_value_date,
                      v_begin_trade_date,
                      v_bond_limit,
                      v_issue_price,
                      v_intrst_ratio,
                      v_intrst_days,
                      v_pay_inteval,
                      v_bond_accr_intrst,
                      v_bond_rate_type,
                      v_inteval_days,
                      v_net_price_flag,
                      v_last_trade_date,
                      v_rights_type,
                      v_trans_begin_date,
                      v_trans_end_date,
                      v_exec_begin_date,
                      v_exec_end_date,
                      v_impawn_ratio,
                      v_error_code,
                      v_error_info);
                  if v_error_code = "1" then
                      SET v_error_code = "pubT.28.175.999";
                      if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新债券信息出现错误！',v_mysql_message);
                      end if;
                      ROLLBACK;
                      leave label_pro;
                  elseif v_error_code <> "0" then
                      ROLLBACK;
                      leave label_pro;
                  end if;

          end if;

          /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
          set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);

          /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
          set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

          /* set @证券名称串#=substring(@证券名称串#,LOCATE(@分隔符#,@证券名称串#)+1); */
          set v_stock_name_str=substring(v_stock_name_str,LOCATE(v_split_str,v_stock_name_str)+1);

          /* set @拼音简称串#=substring(@拼音简称串#,LOCATE(@分隔符#,@拼音简称串#)+1); */
          set v_pinyin_short_str=substring(v_pinyin_short_str,LOCATE(v_split_str,v_pinyin_short_str)+1);

          /* set @债券类型串#=substring(@债券类型串#,LOCATE(@分隔符#,@债券类型串#)+1); */
          set v_bond_type_str=substring(v_bond_type_str,LOCATE(v_split_str,v_bond_type_str)+1);

          /* set @债券分类串#=substring(@债券分类串#,LOCATE(@分隔符#,@债券分类串#)+1); */
          set v_bond_class_str=substring(v_bond_class_str,LOCATE(v_split_str,v_bond_class_str)+1);

          /* set @上市日期串#=substring(@上市日期串#,LOCATE(@分隔符#,@上市日期串#)+1); */
          set v_begin_trade_date_str=substring(v_begin_trade_date_str,LOCATE(v_split_str,v_begin_trade_date_str)+1);

          /* set @总规模串#=substring(@总规模串#,LOCATE(@分隔符#,@总规模串#)+1); */
          set v_total_scale_str=substring(v_total_scale_str,LOCATE(v_split_str,v_total_scale_str)+1);

          /* set @发行日期串#=substring(@发行日期串#,LOCATE(@分隔符#,@发行日期串#)+1); */
          set v_issue_date_str=substring(v_issue_date_str,LOCATE(v_split_str,v_issue_date_str)+1);

          /* set @结束日期串#=substring(@结束日期串#,LOCATE(@分隔符#,@结束日期串#)+1); */
          set v_end_date_str=substring(v_end_date_str,LOCATE(v_split_str,v_end_date_str)+1);

          /* set @起息日期串#=substring(@起息日期串#,LOCATE(@分隔符#,@起息日期串#)+1); */
          set v_value_date_str=substring(v_value_date_str,LOCATE(v_split_str,v_value_date_str)+1);

          /* set @债券期限串#=substring(@债券期限串#,LOCATE(@分隔符#,@债券期限串#)+1); */
          set v_bond_limit_str=substring(v_bond_limit_str,LOCATE(v_split_str,v_bond_limit_str)+1);

          /* set @发行价串#=substring(@发行价串#,LOCATE(@分隔符#,@发行价串#)+1); */
          set v_issue_price_str=substring(v_issue_price_str,LOCATE(v_split_str,v_issue_price_str)+1);

          /* set @年利率串#=substring(@年利率串#,LOCATE(@分隔符#,@年利率串#)+1); */
          set v_intrst_ratio_str=substring(v_intrst_ratio_str,LOCATE(v_split_str,v_intrst_ratio_str)+1);

          /* set @提前到期日串#=substring(@提前到期日串#,LOCATE(@分隔符#,@提前到期日串#)+1); */
          set v_early_expire_date=substring(v_early_expire_date,LOCATE(v_split_str,v_early_expire_date)+1);

          /* set @计息方式串#=substring(@计息方式串#,LOCATE(@分隔符#,@计息方式串#)+1); */
          set v_intrst_type_str=substring(v_intrst_type_str,LOCATE(v_split_str,v_intrst_type_str)+1);

          /* set @付息方式串#=substring(@付息方式串#,LOCATE(@分隔符#,@付息方式串#)+1); */
          set v_pay_intrst_type_str=substring(v_pay_intrst_type_str,LOCATE(v_split_str,v_pay_intrst_type_str)+1);

          /* set @债券计提利息串#=substring(@债券计提利息串#,LOCATE(@分隔符#,@债券计提利息串#)+1); */
          set v_bond_accr_intrst_str=substring(v_bond_accr_intrst_str,LOCATE(v_split_str,v_bond_accr_intrst_str)+1);

          /* set @标准券折算率串#=substring(@标准券折算率串#,LOCATE(@分隔符#,@标准券折算率串#)+1); */
          set v_std_stock_discount_str=substring(v_std_stock_discount_str,LOCATE(v_split_str,v_std_stock_discount_str)+1);

          /* set @质押代码串#=substring(@质押代码串#,LOCATE(@分隔符#,@质押代码串#)+1); */
          set v_impawn_code_str=substring(v_impawn_code_str,LOCATE(v_split_str,v_impawn_code_str)+1);
    end while;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_基础数据同步_查询自动同步设置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_QueryAutoSyncSet;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_QueryAutoSyncSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_auto_sync_type int,
    IN p_sync_req_type int,
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
    declare v_auto_sync_type int;
    declare v_sync_req_type int;
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
    SET v_auto_sync_type = p_auto_sync_type;
    SET v_sync_req_type = p_sync_req_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础数据同步_查询自动同步设置表】*/
    call db_pub.pra_basesync_QueryAutoSyncSet(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_auto_sync_type,
        v_sync_req_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.201.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_查询自动同步设置表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_新增自动同步设置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_AddAutoSyncSet;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_AddAutoSyncSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_auto_sync_type int,
    IN p_capital_batch_deal_range int,
    IN p_posi_batch_deal_range int,
    IN p_begin_time int,
    IN p_end_time int,
    IN p_is_batch_deal int,
    IN p_is_inner_check int,
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
    declare v_co_no int;
    declare v_auto_sync_type int;
    declare v_capital_batch_deal_range int;
    declare v_posi_batch_deal_range int;
    declare v_begin_time int;
    declare v_end_time int;
    declare v_is_batch_deal int;
    declare v_is_inner_check int;
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
    SET v_co_no = p_co_no;
    SET v_auto_sync_type = p_auto_sync_type;
    SET v_capital_batch_deal_range = p_capital_batch_deal_range;
    SET v_posi_batch_deal_range = p_posi_batch_deal_range;
    SET v_begin_time = p_begin_time;
    SET v_end_time = p_end_time;
    SET v_is_batch_deal = p_is_batch_deal;
    SET v_is_inner_check = p_is_inner_check;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础数据同步_新增自动同步设置表】*/
    call db_pub.pra_basesync_AddAutoSyncSet(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_auto_sync_type,
        v_capital_batch_deal_range,
        v_posi_batch_deal_range,
        v_begin_time,
        v_end_time,
        v_is_batch_deal,
        v_is_inner_check,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.202.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_新增自动同步设置表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_修改自动同步设置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_EditAutoSyncSet;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_EditAutoSyncSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_capital_batch_deal_range int,
    IN p_posi_batch_deal_range int,
    IN p_begin_time int,
    IN p_end_time int,
    IN p_is_batch_deal int,
    IN p_is_inner_check int,
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
    declare v_row_id bigint;
    declare v_capital_batch_deal_range int;
    declare v_posi_batch_deal_range int;
    declare v_begin_time int;
    declare v_end_time int;
    declare v_is_batch_deal int;
    declare v_is_inner_check int;
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
    SET v_row_id = p_row_id;
    SET v_capital_batch_deal_range = p_capital_batch_deal_range;
    SET v_posi_batch_deal_range = p_posi_batch_deal_range;
    SET v_begin_time = p_begin_time;
    SET v_end_time = p_end_time;
    SET v_is_batch_deal = p_is_batch_deal;
    SET v_is_inner_check = p_is_inner_check;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础数据同步_修改自动同步设置表】*/
    call db_pub.pra_basesync_EditAutoSyncSet(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_capital_batch_deal_range,
        v_posi_batch_deal_range,
        v_begin_time,
        v_end_time,
        v_is_batch_deal,
        v_is_inner_check,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.203.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_修改自动同步设置表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_删除自动同步设置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_DeleteAutoSyncSet;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_DeleteAutoSyncSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础数据同步_删除自动同步设置表】*/
    call db_pub.pra_basesync_DeleteAutoSyncSet(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.204.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_删除自动同步设置表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_更新自动同步处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_UpdateDealFlag;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_UpdateDealFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_auto_sync_deal_flag int,
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
    declare v_auto_sync_deal_flag int;
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
    SET v_auto_sync_deal_flag = p_auto_sync_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础数据同步_更新自动同步处理标志】*/
    call db_pub.pra_basesync_UpdateDealFlag(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_auto_sync_deal_flag,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.205.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_更新自动同步处理标志出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_查询自动同步日志表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_QueryAutoSynclog;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_QueryAutoSynclog(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_process_type_name varchar(64),
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
    declare v_process_type_name varchar(64);
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
    SET v_process_type_name = p_process_type_name;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础数据同步_查询自动同步日志表】*/
    call db_pub.pra_basesync_QueryAutoSynclog(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_process_type_name,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.106.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_查询自动同步日志表出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_新增自动同步日志
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_AddAutoSyncLog;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_AddAutoSyncLog(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_process_type_name varchar(64),
    IN p_process_name varchar(64),
    IN p_event_msg_content varchar(4096),
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
    declare v_co_no int;
    declare v_process_type_name varchar(64);
    declare v_process_name varchar(64);
    declare v_event_msg_content varchar(4096);
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
    SET v_co_no = p_co_no;
    SET v_process_type_name = p_process_type_name;
    SET v_process_name = p_process_name;
    SET v_event_msg_content = p_event_msg_content;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础数据同步_新增自动同步日志】*/
    call db_pub.pra_basesync_AddAutoSyncLog(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_process_type_name,
        v_process_name,
        v_event_msg_content,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.107.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_新增自动同步日志出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_清空自动同步日志
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_ClearAutoSyncLog;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_ClearAutoSyncLog(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础数据同步_清空自动同步日志】*/
    call db_pub.pra_basesync_ClearAutoSyncLog(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.108.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_清空自动同步日志出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_基础数据同步_查询自动同步内部核对设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesync_QueryAutoSyncInnerCheck;;
DELIMITER ;;
CREATE PROCEDURE prt_basesync_QueryAutoSyncInnerCheck(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_total_fail_count int
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
    declare v_total_fail_count int;

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
    SET v_total_fail_count = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础数据同步_查询自动同步内部核对设置】*/
    call db_pub.pra_basesync_QueryAutoSyncInnerCheck(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_total_fail_count);
    if v_error_code = "1" then
        SET v_error_code = "pubT.28.109.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础数据同步_查询自动同步内部核对设置出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_total_fail_count = v_total_fail_count;

END;;


