DELIMITER ;;
use db_pub;;

# 事务_公共_证券基础数据_查询证券模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockTmplat;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_stock_code_feature varchar(16),
    IN p_stock_name_feature varchar(16),
    IN p_model_name varchar(64),
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_stock_code_feature varchar(16);
    declare v_stock_name_feature varchar(16);
    declare v_model_name varchar(64);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_stock_code_feature = p_stock_code_feature;
    SET v_stock_name_feature = p_stock_name_feature;
    SET v_model_name = p_model_name;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* [变量补分隔符][@证券类型串#] */
    set v_stock_type_str = concat(";", v_stock_type_str,";");


    /* 调用【原子_公共_证券基础数据_查询证券模板】*/
    call db_pub.pra_basesedt_QueryStockTmplat(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no_str,
        v_stock_type_str,
        v_stock_code_feature,
        v_stock_name_feature,
        v_model_name,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询证券模板出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_修改证券类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_ModiStockType;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_ModiStockType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_stock_type_name varchar(16),
    IN p_asset_type int,
    IN p_par_value decimal(16,9),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_type_unit int,
    IN p_report_unit int,
    IN p_min_unit int,
    IN p_max_qty decimal(18,2),
    IN p_min_qty decimal(18,2),
    IN p_is_order_dir_flag int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_type int;
    declare v_stock_type_name varchar(16);
    declare v_asset_type int;
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
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_stock_type = p_stock_type;
    SET v_stock_type_name = p_stock_type_name;
    SET v_asset_type = p_asset_type;
    SET v_par_value = p_par_value;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_type_unit = p_type_unit;
    SET v_report_unit = p_report_unit;
    SET v_min_unit = p_min_unit;
    SET v_max_qty = p_max_qty;
    SET v_min_qty = p_min_qty;
    SET v_is_order_dir_flag = p_is_order_dir_flag;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_修改证券类型】*/
        call db_pub.pra_basesedt_ModiStockType(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_no,
            v_stock_type,
            v_stock_type_name,
            v_asset_type,
            v_par_value,
            v_crncy_type,
            v_exch_crncy_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_type_unit,
            v_report_unit,
            v_min_unit,
            v_max_qty,
            v_min_qty,
            v_is_order_dir_flag,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_修改证券类型出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询证券类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockType;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
    IN p_time_stamp int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_time_stamp int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_time_stamp = p_time_stamp;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* [变量补分隔符][@证券类型串#] */
    set v_stock_type_str = concat(";", v_stock_type_str,";");


    /* [变量补分隔符][@资产类型串#] */
    set v_asset_type_str = concat(";", v_asset_type_str,";");


    /* 调用【原子_公共_证券基础数据_查询证券类型】*/
    call db_pub.pra_basesedt_QueryStockType(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no_str,
        v_stock_type_str,
        v_asset_type_str,
        v_time_stamp,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询证券类型出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询证券类型流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockTypeJour;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockTypeJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
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
    declare v_init_date int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
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
    SET v_init_date = p_init_date;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* [变量补分隔符][@证券类型串#] */
    set v_stock_type_str = concat(";", v_stock_type_str,";");


    /* 调用【原子_公共_证券基础数据_查询证券类型流水】*/
    call db_pub.pra_basesedt_QueryStockTypeJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_exch_no_str,
        v_stock_type_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.15.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询证券类型流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询历史证券类型流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockTypeJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockTypeJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* [变量补分隔符][@证券类型串#] */
    set v_stock_type_str = concat(";", v_stock_type_str,";");


    /* 调用【原子_公共_证券基础数据_查询历史证券类型流水】*/
    call db_pub.pra_basesedt_QueryStockTypeJour_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_exch_no_str,
        v_stock_type_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.16.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询历史证券类型流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询证券类型订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockTypeOrderDir;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockTypeOrderDir(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_order_dir_str varchar(1024),
    IN p_time_stamp int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_time_stamp int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_time_stamp = p_time_stamp;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* [变量补分隔符][@证券类型串#] */
    set v_stock_type_str = concat(";", v_stock_type_str,";");


    /* [变量补分隔符][@订单方向串#] */
    set v_order_dir_str = concat(";", v_order_dir_str,";");


    /* 调用【原子_公共_证券基础数据_查询证券类型订单方向】*/
    call db_pub.pra_basesedt_QueryStockTypeOrderDir(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no_str,
        v_stock_type_str,
        v_order_dir_str,
        v_time_stamp,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询证券类型订单方向出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_新增证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_AddStockCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_AddStockCodeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int
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
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_record_no_type int;
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
    SET v_init_date = p_init_date;
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
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;

    
    label_pro:BEGIN
    

    /* set @编号类型# = 《编号类型-证券代码编号》; */
    set v_record_no_type = 8;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础_获取市场业务记录编号】*/
        call db_pub.pra_base_GetMarketBusiRecordNo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_record_no_type,
            v_error_code,
            v_error_info,
            v_curr_no);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.41.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场业务记录编号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @证券代码编号# = @当前编号#; */
    set v_stock_code_no = v_curr_no;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_新增证券代码信息】*/
        call db_pub.pra_basesedt_AddStockCodeInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
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
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.41.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_新增证券代码信息出现错误！',v_mysql_message);
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
    SET p_stock_code_no = v_stock_code_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_证券基础数据_修改证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_ModiStockCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_ModiStockCodeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_修改证券代码信息】*/
        call db_pub.pra_basesedt_ModiStockCodeInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
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
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.42.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_修改证券代码信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询证券信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_pinyin_short varchar(16),
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_pinyin_short varchar(16);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_pinyin_short = p_pinyin_short;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @市场编号串# = concat(";",@市场编号串#,";"); */
    set v_exch_no_str = concat(";",v_exch_no_str,";");

    /* 调用【原子_公共_证券基础数据_查询证券信息】*/
    call db_pub.pra_basesedt_QueryStockInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no_str,
        v_stock_code,
        v_stock_name,
        v_pinyin_short,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.43.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询证券信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockCodeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code varchar(6),
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
    IN p_stop_status_str varchar(64),
    IN p_time_stamp int,
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
    declare v_stock_code_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code varchar(6);
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_stop_status_str varchar(64);
    declare v_time_stamp int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code = p_stock_code;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_stop_status_str = p_stop_status_str;
    SET v_time_stamp = p_time_stamp;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @市场编号串# = concat(";",@市场编号串#,";"); */
    set v_exch_no_str = concat(";",v_exch_no_str,";");

    /* set @证券类型串# = concat(";",@证券类型串#,";"); */
    set v_stock_type_str = concat(";",v_stock_type_str,";");

    /* set @资产类型串# = concat(";",@资产类型串#,";"); */
    set v_asset_type_str = concat(";",v_asset_type_str,";");

    /* set @停牌标志串# = concat(";",@停牌标志串#,";"); */
    set v_stop_status_str = concat(";",v_stop_status_str,";");

    /* 调用【原子_公共_证券基础数据_查询证券代码信息】*/
    call db_pub.pra_basesedt_QueryStockCodeInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_exch_no_str,
        v_stock_code,
        v_stock_type_str,
        v_asset_type_str,
        v_stop_status_str,
        v_time_stamp,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.44.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询证券代码信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询证券代码信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockCodeInfoJour;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockCodeInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
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
    declare v_init_date int;
    declare v_stock_code_no int;
    declare v_exch_no_str varchar(2048);
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
    SET v_init_date = p_init_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @市场编号串# = concat(";",@市场编号串#,";"); */
    set v_exch_no_str = concat(";",v_exch_no_str,";");

    /* 调用【原子_公共_证券基础数据_查询证券代码信息流水】*/
    call db_pub.pra_basesedt_QueryStockCodeInfoJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_stock_code_no,
        v_exch_no_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.45.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询证券代码信息流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询历史证券代码信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockCodeInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockCodeInfoJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_stock_code_no int;
    declare v_exch_no_str varchar(2048);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @市场编号串# = concat(";",@市场编号串#,";"); */
    set v_exch_no_str = concat(";",v_exch_no_str,";");

    /* 调用【原子_公共_证券基础数据_查询历史证券代码信息流水】*/
    call db_pub.pra_basesedt_QueryStockCodeInfoJour_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_stock_code_no,
        v_exch_no_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.46.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询历史证券代码信息流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询证券代码列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockCodeInfoList;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockCodeInfoList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_查询证券代码列表】*/
    call db_pub.pra_basesedt_QueryStockCodeInfoList(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.47.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询证券代码列表出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询客户端证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryClientStockCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryClientStockCodeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_load_range int,
    IN p_time_stamp int,
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
    declare v_stock_code_load_range int;
    declare v_time_stamp int;
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
    SET v_stock_code_load_range = p_stock_code_load_range;
    SET v_time_stamp = p_time_stamp;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_查询客户端证券代码信息】*/
    call db_pub.pra_basesedt_QueryClientStockCodeInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_load_range,
        v_time_stamp,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.49.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询客户端证券代码信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_新增证券代码订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_AddStockCodeOrderDir;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_AddStockCodeOrderDir(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_cash_frozen_type int,
    IN p_order_split_flag int,
    IN p_min_unit int,
    IN p_max_qty decimal(18,2),
    IN p_min_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_cash_frozen_type int;
    declare v_order_split_flag int;
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);

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
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_cash_frozen_type = p_cash_frozen_type;
    SET v_order_split_flag = p_order_split_flag;
    SET v_min_unit = p_min_unit;
    SET v_max_qty = p_max_qty;
    SET v_min_qty = p_min_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取证券代码编号】*/
    call db_pub.pra_basesedt_GetStockCodeNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_par_value);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.51.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_新增证券代码订单方向】*/
        call db_pub.pra_basesedt_AddStockCodeOrderDir(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_code_no,
            v_exch_no,
            v_order_dir,
            v_cash_frozen_type,
            v_order_split_flag,
            v_min_unit,
            v_max_qty,
            v_min_qty,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.51.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_新增证券代码订单方向出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_修改证券代码订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_ModiStockCodeOrderDir;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_ModiStockCodeOrderDir(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_order_dir int,
    IN p_cash_frozen_type int,
    IN p_order_split_flag int,
    IN p_min_unit int,
    IN p_max_qty decimal(18,2),
    IN p_min_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_order_dir int;
    declare v_cash_frozen_type int;
    declare v_order_split_flag int;
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_order_dir = p_order_dir;
    SET v_cash_frozen_type = p_cash_frozen_type;
    SET v_order_split_flag = p_order_split_flag;
    SET v_min_unit = p_min_unit;
    SET v_max_qty = p_max_qty;
    SET v_min_qty = p_min_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_修改证券代码订单方向】*/
        call db_pub.pra_basesedt_ModiStockCodeOrderDir(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_code_no,
            v_exch_no,
            v_order_dir,
            v_cash_frozen_type,
            v_order_split_flag,
            v_min_unit,
            v_max_qty,
            v_min_qty,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.52.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_修改证券代码订单方向出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_删除证券代码订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_DeleteStockCodeOrderDir;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_DeleteStockCodeOrderDir(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_order_dir int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_order_dir int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_order_dir = p_order_dir;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_删除证券代码订单方向】*/
        call db_pub.pra_basesedt_DeleteStockCodeOrderDir(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_code_no,
            v_exch_no,
            v_order_dir,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.53.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_删除证券代码订单方向出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询证券代码订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockCodeOrderDir;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockCodeOrderDir(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
    IN p_order_dir_str varchar(1024),
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_exch_no_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_time_stamp = p_time_stamp;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* [变量补分隔符][@订单方向串#] */
    set v_order_dir_str = concat(";", v_order_dir_str,";");


    /* 调用【原子_公共_证券基础数据_查询证券代码订单方向】*/
    call db_pub.pra_basesedt_QueryStockCodeOrderDir(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_exch_no_str,
        v_order_dir_str,
        v_row_id,
        v_row_count,
        v_time_stamp,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.54.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询证券代码订单方向出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询证券代码订单方向流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockCodeOrderDirJour;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockCodeOrderDirJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
    IN p_order_dir_str varchar(1024),
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
    declare v_init_date int;
    declare v_stock_code_no int;
    declare v_exch_no_str varchar(2048);
    declare v_order_dir_str varchar(1024);
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
    SET v_init_date = p_init_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* [变量补分隔符][@订单方向串#] */
    set v_order_dir_str = concat(";", v_order_dir_str,";");


    /* 调用【原子_公共_证券基础数据_查询证券代码订单方向流水】*/
    call db_pub.pra_basesedt_QueryStockCodeOrderDirJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_stock_code_no,
        v_exch_no_str,
        v_order_dir_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.55.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询证券代码订单方向流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询历史证券代码订单方向流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockCodeOrderDirJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockCodeOrderDirJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
    IN p_order_dir_str varchar(1024),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_stock_code_no int;
    declare v_exch_no_str varchar(2048);
    declare v_order_dir_str varchar(1024);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* [变量补分隔符][@订单方向串#] */
    set v_order_dir_str = concat(";", v_order_dir_str,";");


    /* 调用【原子_公共_证券基础数据_查询历史证券代码订单方向流水】*/
    call db_pub.pra_basesedt_QueryStockCodeOrderDirJour_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_stock_code_no,
        v_exch_no_str,
        v_order_dir_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.56.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询历史证券代码订单方向流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_新增证券代码映射
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_AddStockCodeMap;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_AddStockCodeMap(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_trade_code varchar(6),
    IN p_target_code varchar(6),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code varchar(6);
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);

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
    SET v_stock_code = p_stock_code;
    SET v_trade_code = p_trade_code;
    SET v_target_code = p_target_code;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取证券代码编号】*/
    call db_pub.pra_basesedt_GetStockCodeNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_par_value);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.61.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_新增证券代码映射】*/
        call db_pub.pra_basesedt_AddStockCodeMap(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_code_no,
            v_stock_code,
            v_exch_no,
            v_trade_code,
            v_target_code,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.61.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_新增证券代码映射出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_修改证券代码映射
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_ModiStockCodeMap;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_ModiStockCodeMap(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_trade_code varchar(6),
    IN p_target_code varchar(6),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_trade_code = p_trade_code;
    SET v_target_code = p_target_code;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_修改证券代码映射】*/
        call db_pub.pra_basesedt_ModiStockCodeMap(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_code_no,
            v_exch_no,
            v_trade_code,
            v_target_code,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.62.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_修改证券代码映射出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_删除证券代码映射
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_DeleteStockCodeMap;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_DeleteStockCodeMap(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_删除证券代码映射】*/
        call db_pub.pra_basesedt_DeleteStockCodeMap(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_code_no,
            v_exch_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.63.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_删除证券代码映射出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询证券代码映射
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockCodeMap;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockCodeMap(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
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
    declare v_exch_no_str varchar(2048);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询证券代码映射】*/
    call db_pub.pra_basesedt_QueryStockCodeMap(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_exch_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.64.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询证券代码映射出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询证券代码映射流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockCodeMapJour;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockCodeMapJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
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
    declare v_init_date int;
    declare v_stock_code_no int;
    declare v_exch_no_str varchar(2048);
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
    SET v_init_date = p_init_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询证券代码映射流水】*/
    call db_pub.pra_basesedt_QueryStockCodeMapJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_stock_code_no,
        v_exch_no_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.65.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询证券代码映射流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询历史证券代码映射流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockCodeMapJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockCodeMapJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_stock_code_no int;
    declare v_exch_no_str varchar(2048);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询历史证券代码映射流水】*/
    call db_pub.pra_basesedt_QueryStockCodeMapJour_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_stock_code_no,
        v_exch_no_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.66.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询历史证券代码映射流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询新股信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryNewStockCode;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryNewStockCode(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_查询新股信息】*/
    call db_pub.pra_basesedt_QueryNewStockCode(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询新股信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询当日新股信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryTodayNewStockCode;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryTodayNewStockCode(
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
    

    /* 调用【原子_公共_证券基础数据_查询当日新股信息】*/
    call db_pub.pra_basesedt_QueryTodayNewStockCode(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.35.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询当日新股信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询可转债信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryConvertibleBondInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryConvertibleBondInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_查询可转债信息】*/
    call db_pub.pra_basesedt_QueryConvertibleBondInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.36.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询可转债信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询当日可转债信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryTodayConvertibleBondInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryTodayConvertibleBondInfo(
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
    

    /* 调用【原子_公共_证券基础数据_查询当日可转债信息】*/
    call db_pub.pra_basesedt_QueryTodayConvertibleBondInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.37.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询当日可转债信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_新增证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_AddStockQuot;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_AddStockQuot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_last_price decimal(16,9),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int
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
    declare v_stock_code varchar(6);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);

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
    SET v_stock_code = p_stock_code;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_last_price = p_last_price;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取证券代码编号】*/
    call db_pub.pra_basesedt_GetStockCodeNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_par_value);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.71.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_新增证券行情】*/
        call db_pub.pra_basesedt_AddStockQuot(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_code_no,
            v_exch_no,
            v_stock_code,
            v_up_limit_price,
            v_down_limit_price,
            v_last_price,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.71.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_新增证券行情出现错误！',v_mysql_message);
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
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_证券基础数据_修改证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_ModiStockQuot;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_ModiStockQuot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_last_price decimal(16,9),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_update_times int;
    declare v_par_value decimal(16,9);

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
    SET v_stock_code = p_stock_code;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_last_price = p_last_price;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_update_times = 1;
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取证券代码编号】*/
    call db_pub.pra_basesedt_GetStockCodeNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_par_value);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.72.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_修改证券行情】*/
        call db_pub.pra_basesedt_ModiStockQuot(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_code_no,
            v_exch_no,
            v_stock_code,
            v_up_limit_price,
            v_down_limit_price,
            v_last_price,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.72.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_修改证券行情出现错误！',v_mysql_message);
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
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_证券基础数据_删除证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_DeleteStockQuot;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_DeleteStockQuot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_update_times int;
    declare v_par_value decimal(16,9);

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
    SET v_stock_code = p_stock_code;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_update_times = 1;
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取证券代码编号】*/
    call db_pub.pra_basesedt_GetStockCodeNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_par_value);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.73.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_删除证券行情】*/
        call db_pub.pra_basesedt_DeleteStockQuot(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_code_no,
            v_exch_no,
            v_stock_code,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.73.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_删除证券行情出现错误！',v_mysql_message);
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
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_证券基础数据_查询证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockQuot;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockQuot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_查询证券行情】*/
    call db_pub.pra_basesedt_QueryStockQuot(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.74.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询证券行情出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_批量获取证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_GetBatchStockQuot;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_GetBatchStockQuot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no_str varchar(4096),
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
    declare v_stock_code_no_str varchar(4096);
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
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@证券代码编号串#] */
    set v_stock_code_no_str = concat(";", v_stock_code_no_str,";");


    /* 调用【原子_公共_证券基础数据_批量获取证券行情】*/
    call db_pub.pra_basesedt_GetBatchStockQuot(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.77.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_批量获取证券行情出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_获取证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_GetStockQuot;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_GetStockQuot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_name varchar(64),
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9),
    OUT p_pre_close_price decimal(16,9)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_name varchar(64);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_name = " ";
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_pre_close_price = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取证券行情】*/
    call db_pub.pra_basesedt_GetStockQuot(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_stock_name,
        v_up_limit_price,
        v_down_limit_price,
        v_last_price,
        v_pre_close_price);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.78.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券行情出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_name = v_stock_name;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;
    SET p_pre_close_price = v_pre_close_price;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_证券基础数据_查询证券行情流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockQuotJour;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockQuotJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code varchar(6),
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
    declare v_init_date int;
    declare v_stock_code_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code varchar(6);
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
    SET v_init_date = p_init_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询证券行情流水】*/
    call db_pub.pra_basesedt_QueryStockQuotJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_stock_code_no,
        v_exch_no_str,
        v_stock_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.75.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询证券行情流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询历史证券行情流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockQuotJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockQuotJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code varchar(6),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_stock_code_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code varchar(6);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询历史证券行情流水】*/
    call db_pub.pra_basesedt_QueryStockQuotJour_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_stock_code_no,
        v_exch_no_str,
        v_stock_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.76.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询历史证券行情流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_证券行情归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_StockQuotBackup;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_StockQuotBackup(
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
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_证券行情归档】*/
        call db_pub.pra_basesedt_StockQuotBackup(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.79.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_证券行情归档出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_新增债券属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_AddBondInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_AddBondInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    IN p_trade_code varchar(6),
    IN p_target_code varchar(6),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code varchar(6);
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
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_stock_code = p_stock_code;
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
    SET v_trade_code = p_trade_code;
    SET v_target_code = p_target_code;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_新增债券属性信息】*/
        call db_pub.pra_basesedt_AddBondInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_no,
            v_stock_code,
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
            v_trade_code,
            v_target_code,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.81.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_新增债券属性信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_修改债券属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_ModiBondInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_ModiBondInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    IN p_trade_code varchar(6),
    IN p_target_code varchar(6),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code varchar(6);
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
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_stock_code = p_stock_code;
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
    SET v_trade_code = p_trade_code;
    SET v_target_code = p_target_code;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_修改债券属性信息】*/
        call db_pub.pra_basesedt_ModiBondInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_no,
            v_stock_code,
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
            v_trade_code,
            v_target_code,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.82.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_修改债券属性信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_删除债券属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_DeleteBondInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_DeleteBondInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code varchar(6);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_stock_code = p_stock_code;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_删除债券属性信息】*/
        call db_pub.pra_basesedt_DeleteBondInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_no,
            v_stock_code,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.83.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_删除债券属性信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询债券属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryBondInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryBondInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code varchar(6),
    IN p_time_stamp int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_code varchar(6);
    declare v_time_stamp int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code = p_stock_code;
    SET v_time_stamp = p_time_stamp;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询债券属性信息】*/
    call db_pub.pra_basesedt_QueryBondInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no_str,
        v_stock_code,
        v_time_stamp,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.84.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询债券属性信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_获取债券属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_GetBondInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_GetBondInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_name varchar(64),
    OUT p_issue_date int,
    OUT p_end_date int,
    OUT p_value_date int,
    OUT p_next_value_date int,
    OUT p_begin_trade_date int,
    OUT p_bond_limit decimal(18,2),
    OUT p_issue_price decimal(16,9),
    OUT p_par_value decimal(16,9),
    OUT p_intrst_ratio decimal(18,12),
    OUT p_intrst_days int,
    OUT p_pay_inteval int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_inteval_days int,
    OUT p_net_price_flag int,
    OUT p_last_trade_date int,
    OUT p_rights_type int,
    OUT p_trans_begin_date int,
    OUT p_trans_end_date int,
    OUT p_exec_begin_date int,
    OUT p_exec_end_date int,
    OUT p_impawn_ratio decimal(18,12),
    OUT p_trade_code varchar(6),
    OUT p_target_code varchar(6)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_name = " ";
    SET v_issue_date = date_format(curdate(),'%Y%m%d');
    SET v_end_date = date_format(curdate(),'%Y%m%d');
    SET v_value_date = date_format(curdate(),'%Y%m%d');
    SET v_next_value_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_bond_limit = 0;
    SET v_issue_price = 0;
    SET v_par_value = 0;
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

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取债券属性】*/
    call db_pub.pra_basesedt_GetBondInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
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
        v_trade_code,
        v_target_code);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.88.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取债券属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_name = v_stock_name;
    SET p_issue_date = v_issue_date;
    SET p_end_date = v_end_date;
    SET p_value_date = v_value_date;
    SET p_next_value_date = v_next_value_date;
    SET p_begin_trade_date = v_begin_trade_date;
    SET p_bond_limit = v_bond_limit;
    SET p_issue_price = v_issue_price;
    SET p_par_value = v_par_value;
    SET p_intrst_ratio = v_intrst_ratio;
    SET p_intrst_days = v_intrst_days;
    SET p_pay_inteval = v_pay_inteval;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_inteval_days = v_inteval_days;
    SET p_net_price_flag = v_net_price_flag;
    SET p_last_trade_date = v_last_trade_date;
    SET p_rights_type = v_rights_type;
    SET p_trans_begin_date = v_trans_begin_date;
    SET p_trans_end_date = v_trans_end_date;
    SET p_exec_begin_date = v_exec_begin_date;
    SET p_exec_end_date = v_exec_end_date;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_trade_code = v_trade_code;
    SET p_target_code = v_target_code;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_证券基础数据_查询债券属性流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryBondInfoJour;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryBondInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code varchar(6),
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
    declare v_init_date int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code varchar(6);
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
    SET v_init_date = p_init_date;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询债券属性流水】*/
    call db_pub.pra_basesedt_QueryBondInfoJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_exch_no_str,
        v_stock_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.85.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询债券属性流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询历史债券属性流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryBondInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryBondInfoJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code varchar(6),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code varchar(6);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询历史债券属性流水】*/
    call db_pub.pra_basesedt_QueryBondInfoJour_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_exch_no_str,
        v_stock_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.86.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询历史债券属性流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询债券质押信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryBondImpawnInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryBondImpawnInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_查询债券质押信息】*/
    call db_pub.pra_basesedt_QueryBondImpawnInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.87.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询债券质押信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_新增债券利率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_AddBondRate;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_AddBondRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_intrst_begin_date int,
    IN p_intrst_ratio decimal(18,12),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code varchar(6);
    declare v_intrst_begin_date int;
    declare v_intrst_ratio decimal(18,12);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);

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
    SET v_stock_code = p_stock_code;
    SET v_intrst_begin_date = p_intrst_begin_date;
    SET v_intrst_ratio = p_intrst_ratio;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取证券代码编号】*/
    call db_pub.pra_basesedt_GetStockCodeNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_par_value);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.91.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@证券类型#<21 or @证券类型#>50][257][@市场编号#,@证券代码#] */
    if v_stock_type<21 or v_stock_type>50 then
        
        SET v_error_code = "pubT.1.91.257";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_新增债券利率】*/
        call db_pub.pra_basesedt_AddBondRate(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_code_no,
            v_exch_no,
            v_intrst_begin_date,
            v_intrst_ratio,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.91.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_新增债券利率出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_修改债券利率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_ModiBondRate;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_ModiBondRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_intrst_begin_date int,
    IN p_intrst_ratio decimal(18,12),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_intrst_begin_date int;
    declare v_intrst_ratio decimal(18,12);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_intrst_begin_date = p_intrst_begin_date;
    SET v_intrst_ratio = p_intrst_ratio;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_修改债券利率】*/
        call db_pub.pra_basesedt_ModiBondRate(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_code_no,
            v_exch_no,
            v_intrst_begin_date,
            v_intrst_ratio,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.92.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_修改债券利率出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_删除债券利率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_DeleteBondRate;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_DeleteBondRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_intrst_begin_date int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_intrst_begin_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_intrst_begin_date = p_intrst_begin_date;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_删除债券利率】*/
        call db_pub.pra_basesedt_DeleteBondRate(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_code_no,
            v_intrst_begin_date,
            v_exch_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.93.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_删除债券利率出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询债券利率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryBondRate;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryBondRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
    IN p_time_stamp int,
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
    declare v_stock_code_no int;
    declare v_exch_no_str varchar(2048);
    declare v_time_stamp int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_time_stamp = p_time_stamp;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询债券利率】*/
    call db_pub.pra_basesedt_QueryBondRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_exch_no_str,
        v_time_stamp,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.94.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询债券利率出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询债券利率流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryBondRateJour;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryBondRateJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
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
    declare v_init_date int;
    declare v_stock_code_no int;
    declare v_exch_no_str varchar(2048);
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
    SET v_init_date = p_init_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询债券利率流水】*/
    call db_pub.pra_basesedt_QueryBondRateJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_stock_code_no,
        v_exch_no_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.95.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询债券利率流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询历史债券利率流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryBondRateJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryBondRateJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_stock_code_no int;
    declare v_exch_no_str varchar(2048);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询历史债券利率流水】*/
    call db_pub.pra_basesedt_QueryBondRateJour_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_stock_code_no,
        v_exch_no_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.96.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询历史债券利率流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_新增债券评级信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_AddBondRating;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_AddBondRating(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_rating_agency varchar(64),
    IN p_co_no int,
    IN p_bond_level int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code varchar(6);
    declare v_rating_agency varchar(64);
    declare v_co_no int;
    declare v_bond_level int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);

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
    SET v_stock_code = p_stock_code;
    SET v_rating_agency = p_rating_agency;
    SET v_co_no = p_co_no;
    SET v_bond_level = p_bond_level;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取证券代码编号】*/
    call db_pub.pra_basesedt_GetStockCodeNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_par_value);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.101.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@证券类型#<21 or @证券类型#>50][257][@市场编号#,@证券代码#] */
    if v_stock_type<21 or v_stock_type>50 then
        
        SET v_error_code = "pubT.1.101.257";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_新增债券评级信息】*/
        call db_pub.pra_basesedt_AddBondRating(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_code_no,
            v_exch_no,
            v_rating_agency,
            v_co_no,
            v_bond_level,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.101.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_新增债券评级信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_修改债券评级信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_ModiBondRating;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_ModiBondRating(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_rating_agency varchar(64),
    IN p_co_no int,
    IN p_bond_level int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_rating_agency varchar(64);
    declare v_co_no int;
    declare v_bond_level int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_rating_agency = p_rating_agency;
    SET v_co_no = p_co_no;
    SET v_bond_level = p_bond_level;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_修改债券评级信息】*/
        call db_pub.pra_basesedt_ModiBondRating(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_code_no,
            v_exch_no,
            v_rating_agency,
            v_co_no,
            v_bond_level,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.102.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_修改债券评级信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_删除债券评级信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_DeleteBondRating;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_DeleteBondRating(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
    IN p_rating_agency varchar(64),
    IN p_co_no int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code_no int;
    declare v_rating_agency varchar(64);
    declare v_co_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_rating_agency = p_rating_agency;
    SET v_co_no = p_co_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_删除债券评级信息】*/
        call db_pub.pra_basesedt_DeleteBondRating(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_stock_code_no,
            v_rating_agency,
            v_co_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_删除债券评级信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询债券评级信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryBondRating;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryBondRating(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
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
    declare v_stock_code_no int;
    declare v_exch_no_str varchar(2048);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询债券评级信息】*/
    call db_pub.pra_basesedt_QueryBondRating(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_exch_no_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.104.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询债券评级信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询债券评级流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryBondRatingJour;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryBondRatingJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
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
    declare v_init_date int;
    declare v_stock_code_no int;
    declare v_exch_no_str varchar(2048);
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
    SET v_init_date = p_init_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询债券评级流水】*/
    call db_pub.pra_basesedt_QueryBondRatingJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_stock_code_no,
        v_exch_no_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.105.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询债券评级流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询历史债券评级流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryBondRatingJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryBondRatingJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_stock_code_no int,
    IN p_exch_no_str varchar(2048),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_stock_code_no int;
    declare v_exch_no_str varchar(2048);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询历史债券评级流水】*/
    call db_pub.pra_basesedt_QueryBondRatingJour_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_stock_code_no,
        v_exch_no_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.106.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询历史债券评级流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询回购代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryRepoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryRepoInfo(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_查询回购代码信息】*/
    call db_pub.pra_basesedt_QueryRepoInfo(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.130.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询回购代码信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_逆回购获取代码费用信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_GetRepoStockFeeInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_GetRepoStockFeeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no_str varchar(4096),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_str varchar(4096),
    IN p_asset_acco_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_amt_ratio_str varchar(2048),
    OUT p_amt_value_str varchar(2048),
    OUT p_max_fee_str varchar(2048),
    OUT p_min_fee_str varchar(2048),
    OUT p_par_value decimal(16,9)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_code_no_str varchar(4096);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_str varchar(4096);
    declare v_asset_acco_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_amt_ratio_str varchar(2048);
    declare v_amt_value_str varchar(2048);
    declare v_max_fee_str varchar(2048);
    declare v_min_fee_str varchar(2048);
    declare v_par_value decimal(16,9);

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
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_str = p_stock_code_str;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_amt_ratio_str = " ";
    SET v_amt_value_str = " ";
    SET v_max_fee_str = " ";
    SET v_min_fee_str = " ";
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_逆回购获取代码费用信息】*/
    call db_pub.pra_basesedt_GetRepoStockFeeInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no_str,
        v_exch_no_str,
        v_stock_code_str,
        v_asset_acco_no_str,
        v_error_code,
        v_error_info,
        v_amt_ratio_str,
        v_amt_value_str,
        v_max_fee_str,
        v_min_fee_str,
        v_par_value);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.131.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_逆回购获取代码费用信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_amt_ratio_str = v_amt_ratio_str;
    SET p_amt_value_str = v_amt_value_str;
    SET p_max_fee_str = v_max_fee_str;
    SET p_min_fee_str = v_min_fee_str;
    SET p_par_value = v_par_value;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_证券基础数据_查询港股价位
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryHKStepPrice;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryHKStepPrice(
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
    

    /* 调用【原子_公共_证券基础数据_查询港股价位】*/
    call db_pub.pra_basesedt_QueryHKStepPrice(
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
        SET v_error_code = "pubT.1.140.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询港股价位出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_编号获取证券信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_NumberGetStockInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_NumberGetStockInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_编号获取证券信息】*/
    call db_pub.pra_basesedt_NumberGetStockInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.141.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_编号获取证券信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_新增基金属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_AddFundInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_AddFundInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_fund_kind int,
    IN p_fund_manager varchar(64),
    IN p_fund_trustee varchar(64),
    IN p_distribution_scale decimal(18,4),
    IN p_charging_method int,
    IN p_default_divide_type int,
    IN p_fund_found_date int,
    IN p_fund_expire_date int,
    IN p_subscription_trade_mark int,
    IN p_purchase_trade_mark int,
    IN p_rede_trade_mark int,
    IN p_first_minimum_amt decimal(18,4),
    IN p_minimum_subscription_amt decimal(18,4),
    IN p_minimum_purchase_amt decimal(18,4),
    IN p_minimum_rede_share decimal(18,2),
    IN p_minimum_holding_share decimal(18,2),
    IN p_minimum_turning_out_share decimal(18,2),
    IN p_rede_money_to_account_days int,
    IN p_registration_agency varchar(32),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_fund_kind int;
    declare v_fund_manager varchar(64);
    declare v_fund_trustee varchar(64);
    declare v_distribution_scale decimal(18,4);
    declare v_charging_method int;
    declare v_default_divide_type int;
    declare v_fund_found_date int;
    declare v_fund_expire_date int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_minimum_turning_out_share decimal(18,2);
    declare v_rede_money_to_account_days int;
    declare v_registration_agency varchar(32);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_fund_kind = p_fund_kind;
    SET v_fund_manager = p_fund_manager;
    SET v_fund_trustee = p_fund_trustee;
    SET v_distribution_scale = p_distribution_scale;
    SET v_charging_method = p_charging_method;
    SET v_default_divide_type = p_default_divide_type;
    SET v_fund_found_date = p_fund_found_date;
    SET v_fund_expire_date = p_fund_expire_date;
    SET v_subscription_trade_mark = p_subscription_trade_mark;
    SET v_purchase_trade_mark = p_purchase_trade_mark;
    SET v_rede_trade_mark = p_rede_trade_mark;
    SET v_first_minimum_amt = p_first_minimum_amt;
    SET v_minimum_subscription_amt = p_minimum_subscription_amt;
    SET v_minimum_purchase_amt = p_minimum_purchase_amt;
    SET v_minimum_rede_share = p_minimum_rede_share;
    SET v_minimum_holding_share = p_minimum_holding_share;
    SET v_minimum_turning_out_share = p_minimum_turning_out_share;
    SET v_rede_money_to_account_days = p_rede_money_to_account_days;
    SET v_registration_agency = p_registration_agency;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_新增基金属性信息】*/
        call db_pub.pra_basesedt_AddFundInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_no,
            v_stock_code,
            v_stock_name,
            v_fund_kind,
            v_fund_manager,
            v_fund_trustee,
            v_distribution_scale,
            v_charging_method,
            v_default_divide_type,
            v_fund_found_date,
            v_fund_expire_date,
            v_subscription_trade_mark,
            v_purchase_trade_mark,
            v_rede_trade_mark,
            v_first_minimum_amt,
            v_minimum_subscription_amt,
            v_minimum_purchase_amt,
            v_minimum_rede_share,
            v_minimum_holding_share,
            v_minimum_turning_out_share,
            v_rede_money_to_account_days,
            v_registration_agency,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.142.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_新增基金属性信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_修改基金属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_ModiFundInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_ModiFundInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_fund_kind int,
    IN p_fund_manager varchar(64),
    IN p_fund_trustee varchar(64),
    IN p_distribution_scale decimal(18,4),
    IN p_charging_method int,
    IN p_default_divide_type int,
    IN p_fund_found_date int,
    IN p_fund_expire_date int,
    IN p_subscription_trade_mark int,
    IN p_purchase_trade_mark int,
    IN p_rede_trade_mark int,
    IN p_first_minimum_amt decimal(18,4),
    IN p_minimum_subscription_amt decimal(18,4),
    IN p_minimum_purchase_amt decimal(18,4),
    IN p_minimum_rede_share decimal(18,2),
    IN p_minimum_holding_share decimal(18,2),
    IN p_minimum_turning_out_share decimal(18,2),
    IN p_rede_money_to_account_days int,
    IN p_registration_agency varchar(32),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_fund_kind int;
    declare v_fund_manager varchar(64);
    declare v_fund_trustee varchar(64);
    declare v_distribution_scale decimal(18,4);
    declare v_charging_method int;
    declare v_default_divide_type int;
    declare v_fund_found_date int;
    declare v_fund_expire_date int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_minimum_turning_out_share decimal(18,2);
    declare v_rede_money_to_account_days int;
    declare v_registration_agency varchar(32);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_fund_kind = p_fund_kind;
    SET v_fund_manager = p_fund_manager;
    SET v_fund_trustee = p_fund_trustee;
    SET v_distribution_scale = p_distribution_scale;
    SET v_charging_method = p_charging_method;
    SET v_default_divide_type = p_default_divide_type;
    SET v_fund_found_date = p_fund_found_date;
    SET v_fund_expire_date = p_fund_expire_date;
    SET v_subscription_trade_mark = p_subscription_trade_mark;
    SET v_purchase_trade_mark = p_purchase_trade_mark;
    SET v_rede_trade_mark = p_rede_trade_mark;
    SET v_first_minimum_amt = p_first_minimum_amt;
    SET v_minimum_subscription_amt = p_minimum_subscription_amt;
    SET v_minimum_purchase_amt = p_minimum_purchase_amt;
    SET v_minimum_rede_share = p_minimum_rede_share;
    SET v_minimum_holding_share = p_minimum_holding_share;
    SET v_minimum_turning_out_share = p_minimum_turning_out_share;
    SET v_rede_money_to_account_days = p_rede_money_to_account_days;
    SET v_registration_agency = p_registration_agency;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_修改基金属性信息】*/
        call db_pub.pra_basesedt_ModiFundInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_no,
            v_stock_code,
            v_stock_name,
            v_fund_kind,
            v_fund_manager,
            v_fund_trustee,
            v_distribution_scale,
            v_charging_method,
            v_default_divide_type,
            v_fund_found_date,
            v_fund_expire_date,
            v_subscription_trade_mark,
            v_purchase_trade_mark,
            v_rede_trade_mark,
            v_first_minimum_amt,
            v_minimum_subscription_amt,
            v_minimum_purchase_amt,
            v_minimum_rede_share,
            v_minimum_holding_share,
            v_minimum_turning_out_share,
            v_rede_money_to_account_days,
            v_registration_agency,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.143.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_修改基金属性信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_删除基金属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_DeleteFundInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_DeleteFundInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_stock_code varchar(6);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_stock_code = p_stock_code;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_删除基金属性信息】*/
        call db_pub.pra_basesedt_DeleteFundInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_no,
            v_stock_code,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.144.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_删除基金属性信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询基金属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryFundInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryFundInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code varchar(6),
    IN p_time_stamp int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_code varchar(6);
    declare v_time_stamp int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code = p_stock_code;
    SET v_time_stamp = p_time_stamp;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询基金属性信息】*/
    call db_pub.pra_basesedt_QueryFundInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no_str,
        v_stock_code,
        v_time_stamp,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.145.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询基金属性信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_获取基金属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_GetFundInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_GetFundInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_stock_name varchar(64),
    OUT p_fund_kind int,
    OUT p_fund_manager varchar(64),
    OUT p_fund_trustee varchar(64),
    OUT p_distribution_scale decimal(18,4),
    OUT p_charging_method int,
    OUT p_default_divide_type int,
    OUT p_fund_found_date int,
    OUT p_fund_expire_date int,
    OUT p_subscription_trade_mark int,
    OUT p_purchase_trade_mark int,
    OUT p_rede_trade_mark int,
    OUT p_first_minimum_amt decimal(18,4),
    OUT p_minimum_subscription_amt decimal(18,4),
    OUT p_minimum_purchase_amt decimal(18,4),
    OUT p_minimum_rede_share decimal(18,2),
    OUT p_minimum_holding_share decimal(18,2),
    OUT p_minimum_turning_out_share decimal(18,2),
    OUT p_rede_money_to_account_days int,
    OUT p_registration_agency varchar(32),
    OUT p_time_stamp int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_name varchar(64);
    declare v_fund_kind int;
    declare v_fund_manager varchar(64);
    declare v_fund_trustee varchar(64);
    declare v_distribution_scale decimal(18,4);
    declare v_charging_method int;
    declare v_default_divide_type int;
    declare v_fund_found_date int;
    declare v_fund_expire_date int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_minimum_turning_out_share decimal(18,2);
    declare v_rede_money_to_account_days int;
    declare v_registration_agency varchar(32);
    declare v_time_stamp int;

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_name = " ";
    SET v_fund_kind = 0;
    SET v_fund_manager = " ";
    SET v_fund_trustee = " ";
    SET v_distribution_scale = 0;
    SET v_charging_method = 0;
    SET v_default_divide_type = 0;
    SET v_fund_found_date = date_format(curdate(),'%Y%m%d');
    SET v_fund_expire_date = date_format(curdate(),'%Y%m%d');
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_minimum_turning_out_share = 0;
    SET v_rede_money_to_account_days = 0;
    SET v_registration_agency = " ";
    SET v_time_stamp = unix_timestamp();

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取基金属性】*/
    call db_pub.pra_basesedt_GetFundInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_name,
        v_fund_kind,
        v_fund_manager,
        v_fund_trustee,
        v_distribution_scale,
        v_charging_method,
        v_default_divide_type,
        v_fund_found_date,
        v_fund_expire_date,
        v_subscription_trade_mark,
        v_purchase_trade_mark,
        v_rede_trade_mark,
        v_first_minimum_amt,
        v_minimum_subscription_amt,
        v_minimum_purchase_amt,
        v_minimum_rede_share,
        v_minimum_holding_share,
        v_minimum_turning_out_share,
        v_rede_money_to_account_days,
        v_registration_agency,
        v_time_stamp);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.146.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取基金属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_name = v_stock_name;
    SET p_fund_kind = v_fund_kind;
    SET p_fund_manager = v_fund_manager;
    SET p_fund_trustee = v_fund_trustee;
    SET p_distribution_scale = v_distribution_scale;
    SET p_charging_method = v_charging_method;
    SET p_default_divide_type = v_default_divide_type;
    SET p_fund_found_date = v_fund_found_date;
    SET p_fund_expire_date = v_fund_expire_date;
    SET p_subscription_trade_mark = v_subscription_trade_mark;
    SET p_purchase_trade_mark = v_purchase_trade_mark;
    SET p_rede_trade_mark = v_rede_trade_mark;
    SET p_first_minimum_amt = v_first_minimum_amt;
    SET p_minimum_subscription_amt = v_minimum_subscription_amt;
    SET p_minimum_purchase_amt = v_minimum_purchase_amt;
    SET p_minimum_rede_share = v_minimum_rede_share;
    SET p_minimum_holding_share = v_minimum_holding_share;
    SET p_minimum_turning_out_share = v_minimum_turning_out_share;
    SET p_rede_money_to_account_days = v_rede_money_to_account_days;
    SET p_registration_agency = v_registration_agency;
    SET p_time_stamp = v_time_stamp;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_证券基础数据_查询基金属性流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryFundInfoJour;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryFundInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code varchar(6),
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
    declare v_init_date int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code varchar(6);
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
    SET v_init_date = p_init_date;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询基金属性流水】*/
    call db_pub.pra_basesedt_QueryFundInfoJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_exch_no_str,
        v_stock_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.147.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询基金属性流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询历史基金属性流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryFundInfoJourHis;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryFundInfoJourHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code varchar(6),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code varchar(6);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_公共_证券基础数据_查询历史基金属性流水】*/
    call db_pub.pra_basesedt_QueryFundInfoJourHis(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_exch_no_str,
        v_stock_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.148.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询历史基金属性流水出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询新股开板监控信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryNewStockMonitor;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryNewStockMonitor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_查询新股开板监控信息】*/
    call db_pub.pra_basesedt_QueryNewStockMonitor(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_stock_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.151.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询新股开板监控信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_新增新股开板监控信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_AddNewStockMonitor;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_AddNewStockMonitor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_warn_trade_amount decimal(18,2),
    IN p_warn_buy_amount decimal(18,2),
    IN p_warn_auto_sell int,
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
    declare v_warn_trade_amount decimal(18,2);
    declare v_warn_buy_amount decimal(18,2);
    declare v_warn_auto_sell int;
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
    SET v_warn_trade_amount = p_warn_trade_amount;
    SET v_warn_buy_amount = p_warn_buy_amount;
    SET v_warn_auto_sell = p_warn_auto_sell;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_新增新股开板监控信息】*/
        call db_pub.pra_basesedt_AddNewStockMonitor(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_warn_trade_amount,
            v_warn_buy_amount,
            v_warn_auto_sell,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.152.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_新增新股开板监控信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_修改新股开板监控信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_ModiNewStockMonitor;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_ModiNewStockMonitor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_warn_trade_amount decimal(18,2),
    IN p_warn_buy_amount decimal(18,2),
    IN p_warn_auto_sell int,
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
    declare v_warn_trade_amount decimal(18,2);
    declare v_warn_buy_amount decimal(18,2);
    declare v_warn_auto_sell int;
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
    SET v_warn_trade_amount = p_warn_trade_amount;
    SET v_warn_buy_amount = p_warn_buy_amount;
    SET v_warn_auto_sell = p_warn_auto_sell;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_修改新股开板监控信息】*/
        call db_pub.pra_basesedt_ModiNewStockMonitor(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_warn_trade_amount,
            v_warn_buy_amount,
            v_warn_auto_sell,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.153.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_修改新股开板监控信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_删除新股开板监控信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_DeleteNewStockMonitor;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_DeleteNewStockMonitor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_oper_remark_info varchar(255),
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
    declare v_oper_remark_info varchar(255);
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
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_删除新股开板监控信息】*/
        call db_pub.pra_basesedt_DeleteNewStockMonitor(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_oper_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.154.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_删除新股开板监控信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询触警新股信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryTriggerNewStock;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryTriggerNewStock(
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
    

    /* 调用【原子_公共_证券基础数据_查询触警新股信息】*/
    call db_pub.pra_basesedt_QueryTriggerNewStock(
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
        SET v_error_code = "pubT.1.155.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询触警新股信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_更新新股触警信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_updateMonitorInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_updateMonitorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_strike_qty decimal(18,2),
    IN p_buy_qty_1 decimal(18,2),
    IN p_up_limit_price decimal(16,9),
    IN p_last_price decimal(16,9),
    IN p_is_warn int,
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
    declare v_strike_qty decimal(18,2);
    declare v_buy_qty_1 decimal(18,2);
    declare v_up_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_is_warn int;
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
    SET v_strike_qty = p_strike_qty;
    SET v_buy_qty_1 = p_buy_qty_1;
    SET v_up_limit_price = p_up_limit_price;
    SET v_last_price = p_last_price;
    SET v_is_warn = p_is_warn;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_更新新股触警信息】*/
        call db_pub.pra_basesedt_updateMonitorInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_strike_qty,
            v_buy_qty_1,
            v_up_limit_price,
            v_last_price,
            v_is_warn,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.156.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_更新新股触警信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询所有新股信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryAllNewStock;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryAllNewStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_查询所有新股信息】*/
    call db_pub.pra_basesedt_QueryAllNewStock(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.157.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询所有新股信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_新增基金产品对照关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_AddFundPdCompRelation;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_AddFundPdCompRelation(
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
    IN p_pd_no int,
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_pd_no int;
    declare v_co_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_stock_code_no int;

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
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* [检查报错返回][@市场编号# <>《市场编号-场外交易市场》][1][concat("目前基金产品关系维护只支持场外交易市场！",@市场编号#,@证券代码#)] */
    if v_exch_no <>5 then
        ROLLBACK;
        SET v_error_code = "pubT.1.158.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目前基金产品关系维护只支持场外交易市场！",v_exch_no,v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("目前基金产品关系维护只支持场外交易市场！",v_exch_no,v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号# and @操作员机构编号#<>9999][1][concat("不能维护其他机构的基金产品对照关系！",@机构编号#,@操作员机构编号#)] */
    if v_co_no <> v_opor_co_no and v_opor_co_no<>9999 then
        ROLLBACK;
        SET v_error_code = "pubT.1.158.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("不能维护其他机构的基金产品对照关系！",v_co_no,v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("不能维护其他机构的基金产品对照关系！",v_co_no,v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录数量][公共_证券基础数据_基金产品对照表][@记录个数#][{市场编号}=@市场编号# and {证券代码}=@证券代码# ] */
    select count(1) into v_record_count from db_pub.tb_basesedt_fund_pd_comparision where exch_no=v_exch_no and stock_code=v_stock_code ;


    /* [检查报错返回][@记录个数# >0 ][1][concat("基金产品对照表已存在该证券代码！",@市场编号#,@证券代码#)] */
    if v_record_count >0  then
        ROLLBACK;
        SET v_error_code = "pubT.1.158.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("基金产品对照表已存在该证券代码！",v_exch_no,v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("基金产品对照表已存在该证券代码！",v_exch_no,v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select stock_code_no into v_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
        ROLLBACK;        
        SET v_error_code = "pubT.1.158.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_公共_证券基础数据_新增基金产品对照关系】*/
    call db_pub.pra_basesedt_AddFundPdCompRelation(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_stock_code_no,
        v_stock_name,
        v_pd_no,
        v_co_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.158.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_新增基金产品对照关系出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_修改基金产品对照关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_ModifyFundPdCompRelation;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_ModifyFundPdCompRelation(
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
    IN p_pd_no int,
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_pd_no int;
    declare v_co_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_stock_code_no int;

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
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* [检查报错返回][@市场编号# <>《市场编号-场外交易市场》][1][concat("目前基金产品关系维护只支持场外交易市场！",@市场编号#,@证券代码#)] */
    if v_exch_no <>5 then
        ROLLBACK;
        SET v_error_code = "pubT.1.159.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目前基金产品关系维护只支持场外交易市场！",v_exch_no,v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("目前基金产品关系维护只支持场外交易市场！",v_exch_no,v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号# and @操作员机构编号#<>9999][1][concat("不能维护其他机构的基金产品对照关系！",@机构编号#,@操作员机构编号#)] */
    if v_co_no <> v_opor_co_no and v_opor_co_no<>9999 then
        ROLLBACK;
        SET v_error_code = "pubT.1.159.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("不能维护其他机构的基金产品对照关系！",v_co_no,v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("不能维护其他机构的基金产品对照关系！",v_co_no,v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* set @编号类型# = 《编号类型-证券代码编号》; */
    set v_record_no_type = 8;

        /* 调用【原子_公共_基础_获取市场业务记录编号】*/
        call db_pub.pra_base_GetMarketBusiRecordNo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_record_no_type,
            v_error_code,
            v_error_info,
            v_curr_no);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.159.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场业务记录编号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* set @证券代码编号# = @当前编号#; */
    set v_stock_code_no = v_curr_no;

    /* 调用【原子_公共_证券基础数据_修改基金产品对照关系】*/
    call db_pub.pra_basesedt_ModifyFundPdCompRelation(
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
        v_pd_no,
        v_co_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.159.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_修改基金产品对照关系出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_查询基金产品对照关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryFundPdCompRelation;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryFundPdCompRelation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_查询基金产品对照关系】*/
    call db_pub.pra_basesedt_QueryFundPdCompRelation(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_co_no,
        v_pd_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.160.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询基金产品对照关系出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_更新基金产品行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_UpdateFundPdQuot;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_UpdateFundPdQuot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_last_price decimal(16,9),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_last_price decimal(16,9);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_update_times int;
    declare v_record_count int;
    declare v_stock_name varchar(64);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);

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
    SET v_stock_code = p_stock_code;
    SET v_last_price = p_last_price;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_update_times = 1;
    SET v_record_count = 0;
    SET v_stock_name = " ";
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;

    
    label_pro:BEGIN
    

    /* [检查报错返回][@市场编号# <>《市场编号-场外交易市场》][1][concat("目前只支持场外交易市场的行情更新！",@市场编号#,@证券代码#)] */
    if v_exch_no <>5 then
        
        SET v_error_code = "pubT.1.161.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目前只支持场外交易市场的行情更新！",v_exch_no,v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("目前只支持场外交易市场的行情更新！",v_exch_no,v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


    /* [获取表记录变量语句][公共_证券基础数据_基金产品对照表][count(1),{证券代码编号},{证券名称}][@记录个数#,@证券代码编号#,@证券名称#][{市场编号}=@市场编号# and {证券代码}=@证券代码#] */
    select count(1),stock_code_no,stock_name into v_record_count,v_stock_code_no,v_stock_name from db_pub.tb_basesedt_fund_pd_comparision where exch_no=v_exch_no and stock_code=v_stock_code limit 1;


    /* [检查报错返回][@记录个数# =0][1][concat("更新该证券代码的行情需先维护基金产品对照关系！",@市场编号#,@证券代码#)] */
    if v_record_count =0 then
        ROLLBACK;
        SET v_error_code = "pubT.1.161.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("更新该证券代码的行情需先维护基金产品对照关系！",v_exch_no,v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("更新该证券代码的行情需先维护基金产品对照关系！",v_exch_no,v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* set @涨停价#=0; */
    set v_up_limit_price=0;

    /* set @跌停价#=0; */
    set v_down_limit_price=0;

    /* 调用【原子_公共_证券基础数据_更新基金产品行情】*/
    call db_pub.pra_basesedt_UpdateFundPdQuot(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_stock_code_no,
        v_exch_no,
        v_stock_code,
        v_stock_name,
        v_up_limit_price,
        v_down_limit_price,
        v_last_price,
        v_oper_remark_info,
        v_menu_no,
        v_error_code,
        v_error_info,
        v_stock_type,
        v_asset_type,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.161.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_更新基金产品行情出现错误！',v_mysql_message);
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
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_证券基础数据_删除基金产品对照关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_DeleteFundPdCompRelation;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_DeleteFundPdCompRelation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_pd_no int,
    IN p_co_no int,
    IN p_menu_no int,
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
    declare v_pd_no int;
    declare v_co_no int;
    declare v_menu_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* [检查报错返回][@机构编号# <> @操作员机构编号# and @操作员机构编号#<>9999][1][concat("不能维护其他机构的基金产品对照关系！",@机构编号#,@操作员机构编号#)] */
    if v_co_no <> v_opor_co_no and v_opor_co_no<>9999 then
        ROLLBACK;
        SET v_error_code = "pubT.1.162.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("不能维护其他机构的基金产品对照关系！",v_co_no,v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("不能维护其他机构的基金产品对照关系！",v_co_no,v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_公共_证券基础数据_删除基金产品对照关系】*/
    call db_pub.pra_basesedt_DeleteFundPdCompRelation(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_row_id,
        v_pd_no,
        v_co_no,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.162.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_删除基金产品对照关系出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_同步场外基金属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_SyncOffSiteFundAttrInf;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_SyncOffSiteFundAttrInf(
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
    IN p_fund_kind int,
    IN p_first_minimum_amt decimal(18,4),
    IN p_minimum_subscription_amt decimal(18,4),
    IN p_minimum_purchase_amt decimal(18,4),
    IN p_minimum_rede_share decimal(18,2),
    IN p_minimum_holding_share decimal(18,2),
    IN p_minimum_turning_out_share decimal(18,2),
    IN p_rede_money_to_account_days int,
    IN p_fund_manager varchar(64),
    IN p_fund_trustee varchar(64),
    IN p_distribution_scale decimal(18,4),
    IN p_charging_method int,
    IN p_default_divide_type int,
    IN p_fund_found_date int,
    IN p_fund_expire_date int,
    IN p_subscription_trade_mark int,
    IN p_purchase_trade_mark int,
    IN p_rede_trade_mark int,
    IN p_registration_agency varchar(32),
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
    declare v_fund_kind int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_minimum_turning_out_share decimal(18,2);
    declare v_rede_money_to_account_days int;
    declare v_fund_manager varchar(64);
    declare v_fund_trustee varchar(64);
    declare v_distribution_scale decimal(18,4);
    declare v_charging_method int;
    declare v_default_divide_type int;
    declare v_fund_found_date int;
    declare v_fund_expire_date int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_registration_agency varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_stock_code_no int;

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
    SET v_fund_kind = p_fund_kind;
    SET v_first_minimum_amt = p_first_minimum_amt;
    SET v_minimum_subscription_amt = p_minimum_subscription_amt;
    SET v_minimum_purchase_amt = p_minimum_purchase_amt;
    SET v_minimum_rede_share = p_minimum_rede_share;
    SET v_minimum_holding_share = p_minimum_holding_share;
    SET v_minimum_turning_out_share = p_minimum_turning_out_share;
    SET v_rede_money_to_account_days = p_rede_money_to_account_days;
    SET v_fund_manager = p_fund_manager;
    SET v_fund_trustee = p_fund_trustee;
    SET v_distribution_scale = p_distribution_scale;
    SET v_charging_method = p_charging_method;
    SET v_default_divide_type = p_default_divide_type;
    SET v_fund_found_date = p_fund_found_date;
    SET v_fund_expire_date = p_fund_expire_date;
    SET v_subscription_trade_mark = p_subscription_trade_mark;
    SET v_purchase_trade_mark = p_purchase_trade_mark;
    SET v_rede_trade_mark = p_rede_trade_mark;
    SET v_registration_agency = p_registration_agency;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @编号类型# = 《编号类型-证券代码编号》; */
        set v_record_no_type = 8;

        /* 调用【原子_公共_基础_获取市场业务记录编号】*/
        call db_pub.pra_base_GetMarketBusiRecordNo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_record_no_type,
            v_error_code,
            v_error_info,
            v_curr_no);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.163.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场业务记录编号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @证券代码编号# = @当前编号#; */
        set v_stock_code_no = v_curr_no;

        /* 调用【原子_公共_证券基础数据_同步场外基金属性信息】*/
        call db_pub.pra_basesedt_SyncOffSiteFundAttrInf(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_stock_code_no,
            v_stock_name,
            v_fund_kind,
            v_first_minimum_amt,
            v_minimum_subscription_amt,
            v_minimum_purchase_amt,
            v_minimum_rede_share,
            v_minimum_holding_share,
            v_minimum_turning_out_share,
            v_rede_money_to_account_days,
            v_fund_manager,
            v_fund_trustee,
            v_distribution_scale,
            v_charging_method,
            v_default_divide_type,
            v_fund_found_date,
            v_fund_expire_date,
            v_subscription_trade_mark,
            v_purchase_trade_mark,
            v_rede_trade_mark,
            v_registration_agency,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.163.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_同步场外基金属性信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_获取产品基本信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_GetPdBasicInf;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_GetPdBasicInf(
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
    

    /* 调用【原子_公共_证券基础数据_获取产品基本信息】*/
    call db_pub.pra_basesedt_GetPdBasicInf(
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
        SET v_error_code = "pubT.1.164.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取产品基本信息出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_获取产品扩展信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_GetPdExpandInf;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_GetPdExpandInf(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_link_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_fund_trustee varchar(64),
    OUT p_distribution_scale decimal(18,4),
    OUT p_charging_method int,
    OUT p_default_divide_type int,
    OUT p_fund_found_date int,
    OUT p_fund_expire_date int,
    OUT p_subscription_trade_mark int,
    OUT p_purchase_trade_mark int,
    OUT p_rede_trade_mark int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_link_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_fund_trustee varchar(64);
    declare v_distribution_scale decimal(18,4);
    declare v_charging_method int;
    declare v_default_divide_type int;
    declare v_fund_found_date int;
    declare v_fund_expire_date int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;

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
    SET v_link_row_id = p_link_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_fund_trustee = " ";
    SET v_distribution_scale = 0;
    SET v_charging_method = 0;
    SET v_default_divide_type = 0;
    SET v_fund_found_date = date_format(curdate(),'%Y%m%d');
    SET v_fund_expire_date = date_format(curdate(),'%Y%m%d');
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取产品扩展信息】*/
    call db_pub.pra_basesedt_GetPdExpandInf(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_link_row_id,
        v_error_code,
        v_error_info,
        v_fund_trustee,
        v_distribution_scale,
        v_charging_method,
        v_default_divide_type,
        v_fund_found_date,
        v_fund_expire_date,
        v_subscription_trade_mark,
        v_purchase_trade_mark,
        v_rede_trade_mark);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.165.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取产品扩展信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_fund_trustee = v_fund_trustee;
    SET p_distribution_scale = v_distribution_scale;
    SET p_charging_method = v_charging_method;
    SET p_default_divide_type = v_default_divide_type;
    SET p_fund_found_date = v_fund_found_date;
    SET p_fund_expire_date = v_fund_expire_date;
    SET p_subscription_trade_mark = v_subscription_trade_mark;
    SET p_purchase_trade_mark = v_purchase_trade_mark;
    SET p_rede_trade_mark = v_rede_trade_mark;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_证券基础数据_查询特殊证券行情计算单位
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QuerySpecStockQuotCalcUnit;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QuerySpecStockQuotCalcUnit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_查询特殊证券行情计算单位】*/
    call db_pub.pra_basesedt_QuerySpecStockQuotCalcUnit(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_stock_code_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.166.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询特殊证券行情计算单位出现错误！',v_mysql_message);
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

# 事务_公共_证券基础数据_设置特殊证券行情计算单位
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_UpdateSpecStockQuotCalcUnit;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_UpdateSpecStockQuotCalcUnit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_quot_calc_unit decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
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
    declare v_stock_code varchar(6);
    declare v_quot_calc_unit decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_update_times int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);

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
    SET v_quot_calc_unit = p_quot_calc_unit;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_update_times = 1;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_获取证券代码编号】*/
        call db_pub.pra_basesedt_GetStockCodeNo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_error_code,
            v_error_info,
            v_stock_code_no,
            v_stock_type,
            v_asset_type,
            v_par_value);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.167.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码编号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_公共_证券基础数据_设置特殊证券行情计算单位】*/
        call db_pub.pra_basesedt_UpdateSpecStockQuotCalcUnit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_stock_code_no,
            v_quot_calc_unit,
            v_error_code,
            v_error_info,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.167.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_设置特殊证券行情计算单位出现错误！',v_mysql_message);
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
    SET p_stock_code_no = v_stock_code_no;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_证券基础数据_删除特殊证券行情计算单位
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_DeleteSpecStockQuotCalcUnit;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_DeleteSpecStockQuotCalcUnit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_no int,
    OUT p_stock_code varchar(6),
    OUT p_quot_calc_unit decimal(16,9),
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
    declare v_row_id bigint;
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_quot_calc_unit decimal(16,9);
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
    SET v_row_id = p_row_id;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_quot_calc_unit = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_删除特殊证券行情计算单位】*/
        call db_pub.pra_basesedt_DeleteSpecStockQuotCalcUnit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_stock_code_no,
            v_error_code,
            v_error_info,
            v_exch_no,
            v_stock_code,
            v_quot_calc_unit,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pubT.1.168.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_删除特殊证券行情计算单位出现错误！',v_mysql_message);
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
    SET p_exch_no = v_exch_no;
    SET p_stock_code = v_stock_code;
    SET p_quot_calc_unit = v_quot_calc_unit;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_证券基础数据_获取证券信息根据代码及市场
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_GetStockInfoByCodeAndExch;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_GetStockInfoByCodeAndExch(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_type int,
    OUT p_stock_code_no int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_type int;
    declare v_stock_code_no int;

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_type = 0;
    SET v_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取证券信息根据代码及市场】*/
    call db_pub.pra_basesedt_GetStockInfoByCodeAndExch(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_type,
        v_stock_code_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.169.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券信息根据代码及市场出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_type = v_stock_type;
    SET p_stock_code_no = v_stock_code_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_证券基础数据_查询证券收盘价
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_basesedt_QueryStockClosePrice;;
DELIMITER ;;
CREATE PROCEDURE prt_basesedt_QueryStockClosePrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type_str varchar(2048),
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type_str varchar(2048);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type_str = p_stock_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_查询证券收盘价】*/
    call db_pub.pra_basesedt_QueryStockClosePrice(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_stock_type_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.1.177.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询证券收盘价出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


