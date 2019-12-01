DELIMITER ;;
use db_rpts;;

# 事务_报表_资管报表_T+0持仓盈亏查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryT0HoldingPandL;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryT0HoldingPandL(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_init_date int,
    IN p_query_opor_no int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_init_date int;
    declare v_query_opor_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_init_date = p_init_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_T+0持仓盈亏查询】*/
    call db_rpts.pra_rptasset_QueryT0HoldingPandL(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code_no,
        v_init_date,
        v_query_opor_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0持仓盈亏查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0券源持仓报表查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryT0SourceStockHoldingPositionReport;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryT0SourceStockHoldingPositionReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_init_date int,
    IN p_query_opor_no int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_init_date int;
    declare v_query_opor_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_init_date = p_init_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_T+0券源持仓报表查询】*/
    call db_rpts.pra_rptasset_QueryT0SourceStockHoldingPositionReport(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code_no,
        v_init_date,
        v_query_opor_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0券源持仓报表查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0账户交易汇总查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryT0UnitTradeTotalInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryT0UnitTradeTotalInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_exch_group_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_co_no_str varchar(2048),
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
    declare v_asset_acco_no int;
    declare v_exch_group_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_co_no_str varchar(2048);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_co_no_str = p_co_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_T+0账户交易汇总查询】*/
    call db_rpts.pra_rptasset_QueryT0UnitTradeTotalInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_asset_acco_no,
        v_exch_group_no_str,
        v_pd_no_str,
        v_co_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0账户交易汇总查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0持仓盈亏历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryHisT0HoldingPandL;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryHisT0HoldingPandL(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_query_opor_no int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_query_opor_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_T+0持仓盈亏历史查询】*/
    call db_rpts.pra_rptasset_QueryHisT0HoldingPandL(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code_no,
        v_begin_date,
        v_end_date,
        v_query_opor_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0持仓盈亏历史查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0券源持仓报表历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryHisT0SourceStockHoldingPositionReport;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryHisT0SourceStockHoldingPositionReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_query_opor_no int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_query_opor_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_T+0券源持仓报表历史查询】*/
    call db_rpts.pra_rptasset_QueryHisT0SourceStockHoldingPositionReport(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code_no,
        v_begin_date,
        v_end_date,
        v_query_opor_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0券源持仓报表历史查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0账户交易汇总历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryHisT0UnitTradeTotalInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryHisT0UnitTradeTotalInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_query_opor_no int,
    IN p_exch_group_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_co_no_str varchar(2048),
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
    declare v_asset_acco_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_query_opor_no int;
    declare v_exch_group_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_co_no_str varchar(2048);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_co_no_str = p_co_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_T+0账户交易汇总历史查询】*/
    call db_rpts.pra_rptasset_QueryHisT0UnitTradeTotalInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_asset_acco_no,
        v_begin_date,
        v_end_date,
        v_query_opor_no,
        v_exch_group_no_str,
        v_pd_no_str,
        v_co_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0账户交易汇总历史查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_报表产品持仓汇总查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_ReportProductPositionQuery;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_ReportProductPositionQuery(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
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
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_报表产品持仓汇总查询】*/
    call db_rpts.pra_rptasset_ReportProductPositionQuery(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_no,
        v_stock_code_no,
        v_stock_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_报表产品持仓汇总查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_报表机构持仓汇总查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_ReportCompanyPositionQuery;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_ReportCompanyPositionQuery(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
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
    declare v_stock_code_no int;
    declare v_stock_type int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_报表机构持仓汇总查询】*/
    call db_rpts.pra_rptasset_ReportCompanyPositionQuery(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code_no,
        v_stock_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_报表机构持仓汇总查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_报表产品持仓交易汇总查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_ReportProductPositionTradeQuery;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_ReportProductPositionTradeQuery(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_type int,
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
    declare v_pd_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_报表产品持仓交易汇总查询】*/
    call db_rpts.pra_rptasset_ReportProductPositionTradeQuery(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_stock_code_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_报表产品持仓交易汇总查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_产品账户证券重仓股持仓查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryProductPositionTop;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryProductPositionTop(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_row_count int,
    IN p_config_value varchar(2048),
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
    declare v_row_count int;
    declare v_config_value varchar(2048);
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
    SET v_row_count = p_row_count;
    SET v_config_value = p_config_value;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_产品账户证券重仓股持仓查询】*/
    call db_rpts.pra_rptasset_QueryProductPositionTop(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_row_count,
        v_config_value,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_产品账户证券重仓股持仓查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_交易单元证券重仓股持仓查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryUniteQuitiesPositionTop;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryUniteQuitiesPositionTop(
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
    IN p_row_count int,
    IN p_config_value varchar(2048),
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
    declare v_row_count int;
    declare v_config_value varchar(2048);
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
    SET v_row_count = p_row_count;
    SET v_config_value = p_config_value;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_交易单元证券重仓股持仓查询】*/
    call db_rpts.pra_rptasset_QueryUniteQuitiesPositionTop(
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
        v_row_count,
        v_config_value,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_交易单元证券重仓股持仓查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_证券持仓汇总查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_EquitiesPositionSummary;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_EquitiesPositionSummary(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_type int,
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
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_type int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_证券持仓汇总查询】*/
    call db_rpts.pra_rptasset_EquitiesPositionSummary(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_stock_code_no,
        v_exch_no,
        v_stock_type,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_证券持仓汇总查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_历史证券持仓汇总查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_EquitiesPositionSummary_His;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_EquitiesPositionSummary_His(
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
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_type int,
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
    declare v_co_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_type int;
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
    SET v_co_no = p_co_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_历史证券持仓汇总查询】*/
    call db_rpts.pra_rptasset_EquitiesPositionSummary_His(
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
        v_stock_code_no,
        v_exch_no,
        v_stock_type,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_历史证券持仓汇总查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0账户盈亏报表查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryT0UnitPandlReport;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryT0UnitPandlReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_query_opor_no int,
    IN p_sum_type int,
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_query_opor_no int;
    declare v_sum_type int;
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_sum_type = p_sum_type;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_T+0账户盈亏报表查询】*/
    call db_rpts.pra_rptasset_QueryT0UnitPandlReport(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code_no,
        v_query_opor_no,
        v_sum_type,
        v_qry_begin_date,
        v_qry_end_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0账户盈亏报表查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0账户盈亏报表历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryHisT0UnitPandlReport;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryHisT0UnitPandlReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_query_opor_no int,
    IN p_sum_type int,
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_query_opor_no int;
    declare v_sum_type int;
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_sum_type = p_sum_type;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_T+0账户盈亏报表历史查询】*/
    call db_rpts.pra_rptasset_QueryHisT0UnitPandlReport(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code_no,
        v_query_opor_no,
        v_sum_type,
        v_qry_begin_date,
        v_qry_end_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.15.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0账户盈亏报表历史查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0账户敞口报表查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryT0UnitExposureReport;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryT0UnitExposureReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_query_opor_no int,
    IN p_sum_type int,
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_query_opor_no int;
    declare v_sum_type int;
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_sum_type = p_sum_type;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_T+0账户敞口报表查询】*/
    call db_rpts.pra_rptasset_QueryT0UnitExposureReport(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code_no,
        v_query_opor_no,
        v_sum_type,
        v_qry_begin_date,
        v_qry_end_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.16.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0账户敞口报表查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0账户敞口报表历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryHisT0UnitExposureReport;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryHisT0UnitExposureReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_query_opor_no int,
    IN p_sum_type int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_query_opor_no int;
    declare v_sum_type int;
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_sum_type = p_sum_type;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_T+0账户敞口报表历史查询】*/
    call db_rpts.pra_rptasset_QueryHisT0UnitExposureReport(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code_no,
        v_query_opor_no,
        v_sum_type,
        v_begin_date,
        v_end_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.17.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0账户敞口报表历史查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_证券成交流水明细查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_trd_secu_execution_query;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_trd_secu_execution_query(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_pd_no int,
    IN p_stock_type_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_order_dir_str varchar(1024),
    IN p_query_type int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_comm_id bigint,
    IN p_sort_type int,
    IN p_client_oper_kind varchar(2),
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_exter_comm_flag int,
    IN p_record_valid_flag int,
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
    declare v_busi_opor_no int;
    declare v_pd_no int;
    declare v_stock_type_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_order_dir_str varchar(1024);
    declare v_query_type int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_comm_id bigint;
    declare v_sort_type int;
    declare v_client_oper_kind varchar(2);
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_cond varchar(2048);
    declare v_exch_group_no int;
    declare v_stock_code varchar(6);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_pd_no = p_pd_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_query_type = p_query_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_comm_id = p_comm_id;
    SET v_sort_type = p_sort_type;
    SET v_client_oper_kind = p_client_oper_kind;
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_record_valid_flag = p_record_valid_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_cond = "1=1";
    SET v_exch_group_no = 0;
    SET v_stock_code = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数# > 500 then */
    if v_row_count > 500 then

      /* set @指定行数# = 500; */
      set v_row_count = 500;
    end if;

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* [检查正常赋值][isnull(@机构编号串#)][@机构编号串#]["-1"] */
    if isnull(v_co_no_str) then
        SET v_co_no_str="-1";
    end if;


    /* [检查正常赋值][isnull(@产品编号串#)][@产品编号串#]["-1"] */
    if isnull(v_pd_no_str) then
        SET v_pd_no_str="-1";
    end if;


    /* [检查正常赋值][isnull(@交易组编号串#)][@交易组编号串#]["-1"] */
    if isnull(v_exch_group_no_str) then
        SET v_exch_group_no_str="-1";
    end if;


    /* set @查询条件# = "1<>1"; */
    set v_query_cond = "1<>1";

    /* set @查询条件# = concat('(', @查询条件#); */
    set v_query_cond = concat('(', v_query_cond);
    # [按条件拼字符串][@查询条件#][@机构编号串#<>"0" and @机构编号串#<>"-1"][' or {机构编号} in (',@机构编号串#,')']
    # [按条件拼字符串][@查询条件#][@产品编号串#<>"0" and @产品编号串#<>"-1"][' or {产品编号} in (',@产品编号串#,')']

    /* [按条件拼字符串][@查询条件#][@交易组编号串#<>"0" and @交易组编号串#<>"-1"][' or ({产品编号}, {交易组编号}) in (select {产品编号},{交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ where {操作员编号} = ', @操作员编号#,')'] */
    if v_exch_group_no_str<>"0" and v_exch_group_no_str<>"-1" then
        SET v_query_cond = CONCAT(v_query_cond,' or (pd_no, exch_group_no) in (select pd_no,exch_group_no from db_rpts.vi_user_opor_exch_group where opor_no = ', v_opor_no,')');
    end if;


    /* set @查询条件# = concat(@查询条件#, ')'); */
    set v_query_cond = concat(v_query_cond, ')');

    /* if @查询条件# = "(1<>1)" then */
    if v_query_cond = "(1<>1)" then

      /* set @查询条件# = "1=1"; */
      set v_query_cond = "1=1";
    end if;

    /* [按条件拼字符串][@查询条件#][1=1][' and {机构编号} = ',@机构编号#] */
    if 1=1 then
        SET v_query_cond = CONCAT(v_query_cond,' and co_no = ',v_co_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@业务操作员编号#<>0][' and {操作员编号} = ',@业务操作员编号#] */
    if v_busi_opor_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and opor_no = ',v_busi_opor_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@指令序号#<>0][' and {指令序号} = ',@指令序号#] */
    if v_comm_id<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and comm_id = ',v_comm_id);
    end if;


    /* [按条件拼字符串][@查询条件#][@产品编号#<>" "][' and {产品编号} = "',@产品编号#,'"'] */
    if v_pd_no<>" " then
        SET v_query_cond = CONCAT(v_query_cond,' and pd_no = "',v_pd_no,'"');
    end if;


    /* [按条件拼字符串][@查询条件#][@交易组编号#<>" "][' and {交易组编号} = "',@交易组编号#,'"'] */
    if v_exch_group_no<>" " then
        SET v_query_cond = CONCAT(v_query_cond,' and exch_group_no = "',v_exch_group_no,'"');
    end if;


    /* [按条件拼字符串][@查询条件#][@证券代码#<>" "][' and {证券代码} = "',@证券代码#,'"'] */
    if v_stock_code<>" " then
        SET v_query_cond = CONCAT(v_query_cond,' and stock_code = "',v_stock_code,'"');
    end if;


    /* [按条件拼字符串][@查询条件#][@市场编号串#<>' '][' and {市场编号} in (',replace(@市场编号串#,';',','),')'] */
    if v_exch_no_str<>' ' then
        SET v_query_cond = CONCAT(v_query_cond,' and exch_no in (',replace(v_exch_no_str,';',','),')');
    end if;


    /* [按条件拼字符串][@查询条件#][@证券类型串#<>' '][' and {证券类型} in (',replace(@证券类型串#,';',','),')'] */
    if v_stock_type_str<>' ' then
        SET v_query_cond = CONCAT(v_query_cond,' and stock_type in (',replace(v_stock_type_str,';',','),')');
    end if;


    /* [按条件拼字符串][@查询条件#][@订单方向串#<>' '][' and {订单方向} in (',replace(@订单方向串#,';',','),')'] */
    if v_order_dir_str<>' ' then
        SET v_query_cond = CONCAT(v_query_cond,' and order_dir in (',replace(v_order_dir_str,';',','),')');
    end if;

    #[按条件拼字符串][@查询条件#][@客户端操作方式#<>" "][' and {操作方式} = "',@客户端操作方式#,'"']

    /* [按条件拼字符串][@查询条件#][@体外指令标志#<>0][' and {体外指令标志} = ',@体外指令标志#] */
    if v_exter_comm_flag<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and exter_comm_flag = ',v_exter_comm_flag);
    end if;


    /* [按条件拼字符串][@查询条件#][@记录有效标志#<>0][' and {记录有效标志} = ',@记录有效标志#] */
    if v_record_valid_flag<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and record_valid_flag = ',v_record_valid_flag);
    end if;


    /* if @排序方式# <> 2 then */
    if v_sort_type <> 2 then

      /* [按条件拼字符串][@查询条件#][@记录序号#<>0][' and {记录序号} > ',@记录序号#] */
      if v_row_id<>0 then
          SET v_query_cond = CONCAT(v_query_cond,' and row_id > ',v_row_id);
      end if;

    end if;

    /* if @排序方式# = 2 then */
    if v_sort_type = 2 then

      /* [按条件拼字符串][@查询条件#][@记录序号#<>0][' and {记录序号} < ',@记录序号#] */
      if v_row_id<>0 then
          SET v_query_cond = CONCAT(v_query_cond,' and row_id < ',v_row_id);
      end if;

    end if;

    /* if @查询方式# = 2 then */
    if v_query_type = 2 then

      /* set @查询条件# = concat(@查询条件#,' group by {机构编号}, {产品编号}, {交易组编号}, {资产账户编号}, {市场编号}, {证券代码编号}, {订单方向} '); */
      set v_query_cond = concat(v_query_cond,' group by co_no, pd_no, exch_group_no, asset_acco_no, exch_no, stock_code_no, order_dir ');

    /* elseif @查询方式# = 3 then */
    elseif v_query_type = 3 then

      /* set @查询条件# = concat(@查询条件#,' group by {机构编号}, {产品编号}, {市场编号}, {证券代码编号}, {订单方向} '); */
      set v_query_cond = concat(v_query_cond,' group by co_no, pd_no, exch_no, stock_code_no, order_dir ');

    /* elseif @查询方式# = 4 then */
    elseif v_query_type = 4 then

      /* set @查询条件# = concat(@查询条件#,' group by {机构编号}, {操作员编号}, {产品编号}, {市场编号}, {证券代码编号}, {订单方向} '); */
      set v_query_cond = concat(v_query_cond,' group by co_no, opor_no, pd_no, exch_no, stock_code_no, order_dir ');

    /* elseif @查询方式# = 5 then */
    elseif v_query_type = 5 then

      /* set @查询条件# = concat(@查询条件#,' group by {机构编号}, {市场编号}, {证券代码}, {订单方向} '); */
      set v_query_cond = concat(v_query_cond,' group by co_no, exch_no, stock_code, order_dir ');
    end if;

    /* [按条件拼字符串][@查询条件#][@排序方式# <> 2][' order by {记录序号}'] */
    if v_sort_type <> 2 then
        SET v_query_cond = CONCAT(v_query_cond,' order by row_id');
    end if;


    /* [按条件拼字符串][@查询条件#][@排序方式# = 2][' order by {记录序号} desc'] */
    if v_sort_type = 2 then
        SET v_query_cond = CONCAT(v_query_cond,' order by row_id desc');
    end if;


    /* 调用【原子_报表_资管报表_证券成交流水明细查询】*/
    call db_rpts.pra_rptasset_trd_secu_execution_query(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_type,
        v_row_count,
        v_query_cond,
        v_sort_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.18.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_证券成交流水明细查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_证券成交流水历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_trd_secu_HisExecutionQuery;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_trd_secu_HisExecutionQuery(
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
    IN p_busi_opor_no int,
    IN p_stock_type_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_order_dir_str varchar(1024),
    IN p_query_type int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_comm_id bigint,
    IN p_sort_type int,
    IN p_client_oper_kind varchar(2),
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_exter_comm_flag int,
    IN p_record_valid_flag int,
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
    declare v_busi_opor_no int;
    declare v_stock_type_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_order_dir_str varchar(1024);
    declare v_query_type int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_comm_id bigint;
    declare v_sort_type int;
    declare v_client_oper_kind varchar(2);
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_cond varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_query_type = p_query_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_comm_id = p_comm_id;
    SET v_sort_type = p_sort_type;
    SET v_client_oper_kind = p_client_oper_kind;
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_record_valid_flag = p_record_valid_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_cond = "1=1";

    
    label_pro:BEGIN
    

    /* if @指定行数# > 500 then */
    if v_row_count > 500 then

      /* set @指定行数# = 500; */
      set v_row_count = 500;
    end if;

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* [检查正常赋值][isnull(@机构编号串#)][@机构编号串#]["-1"] */
    if isnull(v_co_no_str) then
        SET v_co_no_str="-1";
    end if;


    /* [检查正常赋值][isnull(@产品编号串#)][@产品编号串#]["-1"] */
    if isnull(v_pd_no_str) then
        SET v_pd_no_str="-1";
    end if;


    /* [检查正常赋值][isnull(@交易组编号串#)][@交易组编号串#]["-1"] */
    if isnull(v_exch_group_no_str) then
        SET v_exch_group_no_str="-1";
    end if;


    /* set @查询条件# = "1<>1"; */
    set v_query_cond = "1<>1";

    /* set @查询条件# = concat('(', @查询条件#); */
    set v_query_cond = concat('(', v_query_cond);
    # [按条件拼字符串][@查询条件#][@机构编号串#<>"0" and @机构编号串#<>"-1"][' or {机构编号} in (',@机构编号串#,')']
    # [按条件拼字符串][@查询条件#][@产品编号串#<>"0" and @产品编号串#<>"-1"][' or {产品编号} in (',@产品编号串#,')']

    /* [按条件拼字符串][@查询条件#][@交易组编号串#<>"0" and @交易组编号串#<>"-1"][' or ({产品编号}, {交易组编号}) in (select {产品编号},{交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ where {操作员编号} = ', @操作员编号#,')'] */
    if v_exch_group_no_str<>"0" and v_exch_group_no_str<>"-1" then
        SET v_query_cond = CONCAT(v_query_cond,' or (pd_no, exch_group_no) in (select pd_no,exch_group_no from db_rpts.vi_user_opor_exch_group where opor_no = ', v_opor_no,')');
    end if;


    /* set @查询条件# = concat(@查询条件#, ')'); */
    set v_query_cond = concat(v_query_cond, ')');

    /* if @查询条件# = "(1<>1)" then */
    if v_query_cond = "(1<>1)" then

      /* set @查询条件# = "1=1"; */
      set v_query_cond = "1=1";
    end if;

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][1][concat("请指定查询起止日期, 开始日期 = ", @开始日期#, ", 结束日期", @结束日期#)] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "rptT.4.19.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("请指定查询起止日期, 开始日期 = ", v_begin_date, ", 结束日期", v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("请指定查询起止日期, 开始日期 = ", v_begin_date, ", 结束日期", v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][2][concat("查询起始日期不能大于结束日期, 开始日期 = ", @开始日期#, ", 结束日期", @结束日期#)] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "rptT.4.19.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询起始日期不能大于结束日期, 开始日期 = ", v_begin_date, ", 结束日期", v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询起始日期不能大于结束日期, 开始日期 = ", v_begin_date, ", 结束日期", v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [按条件拼字符串][@查询条件#][@开始日期#<>0][' and {成交日期} >= ',@开始日期#] */
    if v_begin_date<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and strike_date >= ',v_begin_date);
    end if;


    /* [按条件拼字符串][@查询条件#][@结束日期#<>0][' and {成交日期} <= ',@结束日期#] */
    if v_end_date<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and strike_date <= ',v_end_date);
    end if;


    /* [按条件拼字符串][@查询条件#][1=1][' and {机构编号} = ',@机构编号#] */
    if 1=1 then
        SET v_query_cond = CONCAT(v_query_cond,' and co_no = ',v_co_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@指令序号#<>0][' and {指令序号} = ',@指令序号#] */
    if v_comm_id<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and comm_id = ',v_comm_id);
    end if;


    /* [按条件拼字符串][@查询条件#][@业务操作员编号#<>0][' and {操作员编号} = ',@业务操作员编号#] */
    if v_busi_opor_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and opor_no = ',v_busi_opor_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@证券代码编号#<>" "][' and {证券代码编号} = "',@证券代码编号#,'"'] */
    if v_stock_code_no<>" " then
        SET v_query_cond = CONCAT(v_query_cond,' and stock_code_no = "',v_stock_code_no,'"');
    end if;


    /* [按条件拼字符串][@查询条件#][@市场编号串#<>' '][' and {市场编号} in (',replace(@市场编号串#,';',','),')'] */
    if v_exch_no_str<>' ' then
        SET v_query_cond = CONCAT(v_query_cond,' and exch_no in (',replace(v_exch_no_str,';',','),')');
    end if;


    /* [按条件拼字符串][@查询条件#][@证券类型串#<>' '][' and {证券类型} in (',replace(@证券类型串#,';',','),')'] */
    if v_stock_type_str<>' ' then
        SET v_query_cond = CONCAT(v_query_cond,' and stock_type in (',replace(v_stock_type_str,';',','),')');
    end if;


    /* [按条件拼字符串][@查询条件#][@订单方向串#<>' '][' and {订单方向} in (',replace(@订单方向串#,';',','),')'] */
    if v_order_dir_str<>' ' then
        SET v_query_cond = CONCAT(v_query_cond,' and order_dir in (',replace(v_order_dir_str,';',','),')');
    end if;

    #[按条件拼字符串][@查询条件#][@客户端操作方式#<>" "][' and {操作方式} = "',@客户端操作方式#,'"']

    /* [按条件拼字符串][@查询条件#][@体外指令标志#<>0][' and {体外指令标志} = ',@体外指令标志#] */
    if v_exter_comm_flag<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and exter_comm_flag = ',v_exter_comm_flag);
    end if;


    /* [按条件拼字符串][@查询条件#][@记录有效标志#<>0][' and {记录有效标志} = ',@记录有效标志#] */
    if v_record_valid_flag<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and record_valid_flag = ',v_record_valid_flag);
    end if;


    /* if @排序方式# <> 2 then */
    if v_sort_type <> 2 then

      /* [按条件拼字符串][@查询条件#][@记录序号#<>0][' and {记录序号} > ',@记录序号#] */
      if v_row_id<>0 then
          SET v_query_cond = CONCAT(v_query_cond,' and row_id > ',v_row_id);
      end if;

    end if;

    /* if @排序方式# = 2 then */
    if v_sort_type = 2 then

      /* [按条件拼字符串][@查询条件#][@记录序号#<>0][' and {记录序号} < ',@记录序号#] */
      if v_row_id<>0 then
          SET v_query_cond = CONCAT(v_query_cond,' and row_id < ',v_row_id);
      end if;

    end if;

    /* if @查询方式# = 2 then */
    if v_query_type = 2 then

      /* set @查询条件# = concat(@查询条件#,' group by {成交日期}, {机构编号}, {资产账户编号}, {市场编号}, {证券代码编号}, {订单方向} '); */
      set v_query_cond = concat(v_query_cond,' group by strike_date, co_no, asset_acco_no, exch_no, stock_code_no, order_dir ');

    /* elseif @查询方式# = 3 then */
    elseif v_query_type = 3 then

      /* set @查询条件# = concat(@查询条件#,' group by {成交日期}, {机构编号}, {市场编号}, {证券代码编号}, {订单方向} '); */
      set v_query_cond = concat(v_query_cond,' group by strike_date, co_no, exch_no, stock_code_no, order_dir ');

    /* elseif @查询方式# = 4 then */
    elseif v_query_type = 4 then

      /* set @查询条件# = concat(@查询条件#,' group by {成交日期}, {机构编号}, {操作员编号}, {市场编号}, {证券代码编号}, {订单方向} '); */
      set v_query_cond = concat(v_query_cond,' group by strike_date, co_no, opor_no, exch_no, stock_code_no, order_dir ');

    /* elseif @查询方式# = 5 then */
    elseif v_query_type = 5 then

      /* set @查询条件# = concat(@查询条件#,' group by {成交日期}, {机构编号}, {市场编号}, {证券代码编号}, {订单方向} '); */
      set v_query_cond = concat(v_query_cond,' group by strike_date, co_no, exch_no, stock_code_no, order_dir ');
    end if;

    /* [按条件拼字符串][@查询条件#][@排序方式# <> 2][' order by {记录序号}'] */
    if v_sort_type <> 2 then
        SET v_query_cond = CONCAT(v_query_cond,' order by row_id');
    end if;


    /* [按条件拼字符串][@查询条件#][@排序方式# = 2][' order by {记录序号} desc'] */
    if v_sort_type = 2 then
        SET v_query_cond = CONCAT(v_query_cond,' order by row_id desc');
    end if;


    /* 调用【原子_报表_资管报表_证券成交流水历史查询】*/
    call db_rpts.pra_rptasset_trd_secu_HisExecutionQuery(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_type,
        v_row_count,
        v_query_cond,
        v_sort_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.19.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_证券成交流水历史查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0账户月盈亏报表查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Month_QueryT0UnitPandlReport;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Month_QueryT0UnitPandlReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_busi_opor_no int,
    IN p_sum_type int,
    IN p_exch_group_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_co_no_str varchar(2048),
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_busi_opor_no int;
    declare v_sum_type int;
    declare v_exch_group_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_co_no_str varchar(2048);
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_sum_type = p_sum_type;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_co_no_str = p_co_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @机构编号串# =trim(ifnull(@机构编号串#,"")); */
    set v_co_no_str =trim(ifnull(v_co_no_str,""));

    /* set @机构编号串# = if(@机构编号串# = "",@操作员机构编号#,@机构编号串#); */
    set v_co_no_str = if(v_co_no_str = "",v_opor_co_no,v_co_no_str);

    /* 调用【原子_报表_资管报表_T+0账户月盈亏报表查询】*/
    call db_rpts.pra_rptasset_Month_QueryT0UnitPandlReport(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_busi_opor_no,
        v_sum_type,
        v_exch_group_no_str,
        v_pd_no_str,
        v_co_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0账户月盈亏报表查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0账户月盈亏报表历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Month_QueryHisT0UnitPandlReport;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Month_QueryHisT0UnitPandlReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_busi_opor_no int,
    IN p_sum_type int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_exch_group_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_co_no_str varchar(2048),
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_busi_opor_no int;
    declare v_sum_type int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_exch_group_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_co_no_str varchar(2048);
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_sum_type = p_sum_type;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_co_no_str = p_co_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @机构编号串# =trim(ifnull(@机构编号串#,"")); */
    set v_co_no_str =trim(ifnull(v_co_no_str,""));

    /* set @机构编号串# = if(@机构编号串# = "",@操作员机构编号#,@机构编号串#); */
    set v_co_no_str = if(v_co_no_str = "",v_opor_co_no,v_co_no_str);

    /* 调用【原子_报表_资管报表_T+0账户月盈亏报表历史查询】*/
    call db_rpts.pra_rptasset_Month_QueryHisT0UnitPandlReport(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_busi_opor_no,
        v_sum_type,
        v_begin_date,
        v_end_date,
        v_exch_group_no_str,
        v_pd_no_str,
        v_co_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0账户月盈亏报表历史查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0账户盈亏专用报表查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_QueryT0UnitPandlSpecialReport;;
DELIMITER ;;
CREATE PROCEDURE prt_QueryT0UnitPandlSpecialReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_query_opor_no int,
    IN p_sum_type int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_query_opor_no int;
    declare v_sum_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_sum_type = p_sum_type;
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_T+0账户盈亏专用报表查询】*/
    call db_rpts.pra_QueryT0UnitPandlSpecialReport(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code_no,
        v_query_opor_no,
        v_sum_type,
        v_init_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.27.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0账户盈亏专用报表查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0账户盈亏专用报表历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_QueryHisT0UnitPandlSpecialReport;;
DELIMITER ;;
CREATE PROCEDURE prt_QueryHisT0UnitPandlSpecialReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_query_opor_no int,
    IN p_sum_type int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_query_opor_no int;
    declare v_sum_type int;
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_sum_type = p_sum_type;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_T+0账户盈亏专用报表历史查询】*/
    call db_rpts.pra_QueryHisT0UnitPandlSpecialReport(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code_no,
        v_query_opor_no,
        v_sum_type,
        v_begin_date,
        v_end_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.28.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0账户盈亏专用报表历史查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询产品资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_Pd_Asset;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_Pd_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_pd_no_str varchar(2048),
    IN p_crncy_type varchar(3),
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
    declare v_pd_no int;
    declare v_pd_no_str varchar(2048);
    declare v_crncy_type varchar(3);
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
    SET v_pd_no = p_pd_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_查询产品资产】*/
    call db_rpts.pra_rptasset_Qry_Pd_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_no_str,
        v_crncy_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询产品资产出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询交易组资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_ExGrp_Asset;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_ExGrp_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no int,
    IN p_exch_group_no_str varchar(2048),
    IN p_crncy_type varchar(3),
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
    declare v_pd_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no int;
    declare v_exch_group_no_str varchar(2048);
    declare v_crncy_type varchar(3);
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
    SET v_pd_no = p_pd_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_查询交易组资产】*/
    call db_rpts.pra_rptasset_Qry_ExGrp_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_no_str,
        v_exch_group_no,
        v_exch_group_no_str,
        v_crncy_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.32.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询交易组资产出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询产品资产_历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_Pd_Asset_His;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_Pd_Asset_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_pd_no_str varchar(2048),
    IN p_crncy_type varchar(3),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_pd_no int;
    declare v_pd_no_str varchar(2048);
    declare v_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询产品资产_历史】*/
    call db_rpts.pra_rptasset_Qry_Pd_Asset_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_no_str,
        v_crncy_type,
        v_row_id,
        v_row_count,
        v_begin_date,
        v_end_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.33.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询产品资产_历史出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询交易组资产_历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_ExGrp_Asset_His;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_ExGrp_Asset_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no int,
    IN p_exch_group_no_str varchar(2048),
    IN p_crncy_type varchar(3),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_pd_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no int;
    declare v_exch_group_no_str varchar(2048);
    declare v_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询交易组资产_历史】*/
    call db_rpts.pra_rptasset_Qry_ExGrp_Asset_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_no_str,
        v_exch_group_no,
        v_exch_group_no_str,
        v_crncy_type,
        v_row_id,
        v_row_count,
        v_begin_date,
        v_end_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询交易组资产_历史出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询_产品_证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_Pd_Posi;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_Pd_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type int,
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
    declare v_pd_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询_产品_证券持仓】*/
    call db_rpts.pra_rptasset_Qry_Pd_Posi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.35.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询_产品_证券持仓出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询_交易组_证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_ExGrp_Posi;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_ExGrp_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_exch_group_no int,
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
    declare v_pd_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_exch_group_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_exch_group_no = p_exch_group_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询_交易组_证券持仓】*/
    call db_rpts.pra_rptasset_Qry_ExGrp_Posi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type,
        v_exch_group_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.36.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询_交易组_证券持仓出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询_产品_证券持仓_历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_Pd_Posi_His;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_Pd_Posi_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_pd_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询_产品_证券持仓_历史】*/
    call db_rpts.pra_rptasset_Qry_Pd_Posi_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type,
        v_row_id,
        v_row_count,
        v_begin_date,
        v_end_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.37.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询_产品_证券持仓_历史出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询_交易组_证券持仓_历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_ExGrp_Posi_His;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_ExGrp_Posi_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_exch_group_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_pd_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_exch_group_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_exch_group_no = p_exch_group_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询_交易组_证券持仓_历史】*/
    call db_rpts.pra_rptasset_Qry_ExGrp_Posi_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type,
        v_exch_group_no,
        v_row_id,
        v_row_count,
        v_begin_date,
        v_end_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.38.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询_交易组_证券持仓_历史出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询_产品_期货持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_Pdfutu_Posi;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_Pdfutu_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_contrc_code_no int,
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
    declare v_pd_no int;
    declare v_contrc_code_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询_产品_期货持仓】*/
    call db_rpts.pra_rptasset_Qry_Pdfutu_Posi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_contrc_code_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.41.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询_产品_期货持仓出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询_产品_期货持仓_历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_Pdfutu_Posi_his;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_Pdfutu_Posi_his(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_contrc_code_no int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_pd_no int;
    declare v_contrc_code_no int;
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询_产品_期货持仓_历史】*/
    call db_rpts.pra_rptasset_Qry_Pdfutu_Posi_his(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_contrc_code_no,
        v_begin_date,
        v_end_date,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.42.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询_产品_期货持仓_历史出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询_交易组_期货持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_Grpfutu_Posi;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_Grpfutu_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_contrc_code_no int,
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
    declare v_pd_no int;
    declare v_contrc_code_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询_交易组_期货持仓】*/
    call db_rpts.pra_rptasset_Qry_Grpfutu_Posi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_contrc_code_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.43.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询_交易组_期货持仓出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询_交易组_期货持仓_历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_Grpfutu_Posi_his;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_Grpfutu_Posi_his(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_contrc_code_no int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_pd_no int;
    declare v_contrc_code_no int;
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询_交易组_期货持仓_历史】*/
    call db_rpts.pra_rptasset_Qry_Grpfutu_Posi_his(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_contrc_code_no,
        v_begin_date,
        v_end_date,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.44.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询_交易组_期货持仓_历史出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询_交易组_期货持仓明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_Grpfutu_Posi_detail;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_Grpfutu_Posi_detail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_contrc_code_no int,
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
    declare v_pd_no int;
    declare v_contrc_code_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询_交易组_期货持仓明细】*/
    call db_rpts.pra_rptasset_Qry_Grpfutu_Posi_detail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_contrc_code_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.45.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询_交易组_期货持仓明细出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询T0交易员开平仓明细历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QryHis_T0OporPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QryHis_T0OporPosiDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_query_opor_no int,
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_query_opor_no int;
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_查询T0交易员开平仓明细历史】*/
    call db_rpts.pra_rptasset_QryHis_T0OporPosiDetail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code_no,
        v_query_opor_no,
        v_qry_begin_date,
        v_qry_end_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.46.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询T0交易员开平仓明细历史出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询成交明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QryStrikeDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QryStrikeDetail(
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
    IN p_combo_code varchar(32),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
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
    declare v_combo_code varchar(32);
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
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
    SET v_combo_code = p_combo_code;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询成交明细】*/
    call db_rpts.pra_rptasset_QryStrikeDetail(
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
        v_order_batch_no,
        v_order_dir_str,
        v_exter_comm_flag,
        v_record_valid_flag,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_combo_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.47.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询成交明细出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0券源持仓查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryT0SourceStockHoldingPosition;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryT0SourceStockHoldingPosition(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_init_date int,
    IN p_query_opor_no int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_init_date int;
    declare v_query_opor_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_init_date = p_init_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_T+0券源持仓查询】*/
    call db_rpts.pra_rptasset_QueryT0SourceStockHoldingPosition(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code_no,
        v_init_date,
        v_query_opor_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.51.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0券源持仓查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0持仓分笔查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryT0HoldingPositionDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryT0HoldingPositionDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_init_date int,
    IN p_exch_group_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_co_no_str varchar(2048),
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
    declare v_asset_acco_no int;
    declare v_init_date int;
    declare v_exch_group_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_co_no_str varchar(2048);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_init_date = p_init_date;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_co_no_str = p_co_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_T+0持仓分笔查询】*/
    call db_rpts.pra_rptasset_QueryT0HoldingPositionDetail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_asset_acco_no,
        v_init_date,
        v_exch_group_no_str,
        v_pd_no_str,
        v_co_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.52.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0持仓分笔查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0持仓合笔查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryT0HoldingPositionCombi;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryT0HoldingPositionCombi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_co_no_str varchar(2048),
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
    declare v_asset_acco_no int;
    declare v_exch_group_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_co_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_co_no_str = p_co_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @初始化日期# = 0; */
    set v_init_date = 0;

    /* 调用【原子_报表_资管报表_T+0持仓合笔查询】*/
    call db_rpts.pra_rptasset_QueryT0HoldingPositionCombi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_asset_acco_no,
        v_exch_group_no_str,
        v_pd_no_str,
        v_co_no_str,
        v_init_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.53.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0持仓合笔查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_T+0账户汇总信息查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryT0UnitTradeInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryT0UnitTradeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_init_date int,
    IN p_exch_group_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_co_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_amt decimal(18,4),
    OUT p_trade_qty decimal(18,2),
    OUT p_realize_pandl decimal(18,4),
    OUT p_yield_rate decimal(18,12),
    OUT p_all_fee decimal(18,4),
    OUT p_avail_amt decimal(18,4)
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
    declare v_asset_acco_no int;
    declare v_init_date int;
    declare v_exch_group_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_co_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_amt decimal(18,4);
    declare v_trade_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_yield_rate decimal(18,12);
    declare v_all_fee decimal(18,4);
    declare v_avail_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_init_date = p_init_date;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_co_no_str = p_co_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_amt = 0;
    SET v_trade_qty = 0;
    SET v_realize_pandl = 0;
    SET v_yield_rate = 0;
    SET v_all_fee = 0;
    SET v_avail_amt = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_报表_资管报表_T+0账户汇总信息查询】*/
    call db_rpts.pra_rptasset_QueryT0UnitTradeInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_asset_acco_no,
        v_init_date,
        v_exch_group_no_str,
        v_pd_no_str,
        v_co_no_str,
        v_error_code,
        v_error_info,
        v_trade_amt,
        v_trade_qty,
        v_realize_pandl,
        v_yield_rate,
        v_all_fee,
        v_avail_amt);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.54.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_T+0账户汇总信息查询出现错误！',v_mysql_message);
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
    SET p_trade_amt = v_trade_amt;
    SET p_trade_qty = v_trade_qty;
    SET p_realize_pandl = v_realize_pandl;
    SET p_yield_rate = v_yield_rate;
    SET p_all_fee = v_all_fee;
    SET p_avail_amt = v_avail_amt;

END;;


DELIMITER ;;
use db_rpts;;

# 事务_报表_资管报表_查询全部交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryAllExchGroup;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryAllExchGroup(
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
    IN p_exch_group_status varchar(2),
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
    declare v_exch_group_status varchar(2);
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
    SET v_exch_group_status = p_exch_group_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_查询全部交易组】*/
    call db_rpts.pra_rptasset_QueryAllExchGroup(
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
        v_exch_group_status,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.101.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询全部交易组出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询全部操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QueryAllOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QueryAllOperatorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_co_no int,
    IN p_is_trader int,
    IN p_opor_status_str varchar(64),
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
    declare v_query_opor_no int;
    declare v_co_no int;
    declare v_is_trader int;
    declare v_opor_status_str varchar(64);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_co_no = p_co_no;
    SET v_is_trader = p_is_trader;
    SET v_opor_status_str = p_opor_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* if @操作员状态串# <> " " then */
    if v_opor_status_str <> " " then

        /* set @操作员状态串# = concat(";", @操作员状态串#, ";"); */
        set v_opor_status_str = concat(";", v_opor_status_str, ";");
    end if;

    /* 调用【原子_报表_资管报表_查询全部操作员信息】*/
    call db_rpts.pra_rptasset_QueryAllOperatorInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_co_no,
        v_is_trader,
        v_opor_status_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.102.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询全部操作员信息出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询产品上日资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_Pd_Pre_Asset;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_Pd_Pre_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询产品上日资产】*/
    call db_rpts.pra_rptasset_Qry_Pd_Pre_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_row_id,
        v_row_count,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.103.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询产品上日资产出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询产品汇总成交证券类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_Pd_Sum_Strike_StockType;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_Pd_Sum_Strike_StockType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no int,
    IN p_stock_type int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no int;
    declare v_stock_type int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no = p_pd_no;
    SET v_stock_type = p_stock_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询产品汇总成交证券类型】*/
    call db_rpts.pra_rptasset_Qry_Pd_Sum_Strike_StockType(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_row_id,
        v_row_count,
        v_pd_no,
        v_stock_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.104.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询产品汇总成交证券类型出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_Stock_Quot;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_Stock_Quot(
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
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
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
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
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
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询证券行情】*/
    call db_rpts.pra_rptasset_Qry_Stock_Quot(
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
        v_stock_type,
        v_asset_type,
        v_qry_begin_date,
        v_qry_end_date,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.106.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询证券行情出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询产品指令统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_Pd_Stat_Command;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_Pd_Stat_Command(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
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
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询产品指令统计】*/
    call db_rpts.pra_rptasset_Qry_Pd_Stat_Command(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_stock_code_no,
        v_stock_code,
        v_exch_no,
        v_stock_type,
        v_asset_type,
        v_qry_begin_date,
        v_qry_end_date,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.107.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询产品指令统计出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询产品交易操作效率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_Pd_Stat_Trade_Oper;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_Pd_Stat_Trade_Oper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询产品交易操作效率】*/
    call db_rpts.pra_rptasset_Qry_Pd_Stat_Trade_Oper(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_qry_begin_date,
        v_qry_end_date,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.108.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询产品交易操作效率出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询产品汇总持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_Pd_Sum_Posi;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_Pd_Sum_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no int,
    IN p_exch_no_str varchar(2048),
    IN p_exch_no int,
    IN p_stock_type int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no int;
    declare v_exch_no_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_type int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no = p_pd_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询产品汇总持仓】*/
    call db_rpts.pra_rptasset_Qry_Pd_Sum_Posi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_row_id,
        v_row_count,
        v_pd_no,
        v_exch_no_str,
        v_exch_no,
        v_stock_type,
        v_stock_code_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.111.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询产品汇总持仓出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询产品佣金统计报表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QryPdCommisSum;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QryPdCommisSum(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询产品佣金统计报表】*/
    call db_rpts.pra_rptasset_QryPdCommisSum(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_row_id,
        v_row_count,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.112.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询产品佣金统计报表出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_产品当日成交统计查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QryPdCurStrikeSum;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QryPdCurStrikeSum(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
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
    declare v_pd_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_产品当日成交统计查询】*/
    call db_rpts.pra_rptasset_QryPdCurStrikeSum(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.113.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_产品当日成交统计查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_产品持仓汇总统计查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QryPdPosiSum;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QryPdPosiSum(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_posi_market_value decimal(18,4),
    OUT p_cost_amt decimal(18,4),
    OUT p_holder_profit decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_posi_market_value decimal(18,4);
    declare v_cost_amt decimal(18,4);
    declare v_holder_profit decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_posi_market_value = 0;
    SET v_cost_amt = 0;
    SET v_holder_profit = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_产品持仓汇总统计查询】*/
    call db_rpts.pra_rptasset_QryPdPosiSum(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_posi_market_value,
        v_cost_amt,
        v_holder_profit);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.114.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_产品持仓汇总统计查询出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_posi_market_value = v_posi_market_value;
    SET p_cost_amt = v_cost_amt;
    SET p_holder_profit = v_holder_profit;

END;;


DELIMITER ;;
use db_rpts;;

# 事务_报表_资管报表_证券代码映射查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QryStockInfoMap;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QryStockInfoMap(
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
    

    /* 调用【原子_报表_资管报表_证券代码映射查询】*/
    call db_rpts.pra_rptasset_QryStockInfoMap(
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
        SET v_error_code = "rptT.4.115.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_证券代码映射查询出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_查询_交易组_新证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_Qry_ExGrp_PosiNew;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_Qry_ExGrp_PosiNew(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_exch_group_no int,
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
    declare v_pd_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_exch_group_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_exch_group_no = p_exch_group_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数#>65535 or @指定行数#<1 then */
    if v_row_count>65535 or v_row_count<1 then

      /* set @指定行数#=65535; */
      set v_row_count=65535;
    end if;

    /* 调用【原子_报表_资管报表_查询_交易组_新证券持仓】*/
    call db_rpts.pra_rptasset_Qry_ExGrp_PosiNew(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type,
        v_exch_group_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.116.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_查询_交易组_新证券持仓出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_更新期货行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_UpdateFutuQuote;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_UpdateFutuQuote(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    IN p_last_price decimal(16,9),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_pre_settle_price decimal(16,9),
    IN p_sett_price decimal(16,9),
    IN p_today_close_price decimal(16,9),
    IN p_pre_close_price decimal(16,9),
    IN p_hold_qty decimal(18,2),
    IN p_buy_price_1 decimal(16,9),
    IN p_sell_price_1 decimal(16,9),
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
    declare v_contrc_code varchar(6);
    declare v_last_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_today_close_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_hold_qty decimal(18,2);
    declare v_buy_price_1 decimal(16,9);
    declare v_sell_price_1 decimal(16,9);
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
    SET v_contrc_code = p_contrc_code;
    SET v_last_price = p_last_price;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_sett_price = p_sett_price;
    SET v_today_close_price = p_today_close_price;
    SET v_pre_close_price = p_pre_close_price;
    SET v_hold_qty = p_hold_qty;
    SET v_buy_price_1 = p_buy_price_1;
    SET v_sell_price_1 = p_sell_price_1;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_报表_资管报表_更新期货行情】*/
        call db_rpts.pra_rptasset_UpdateFutuQuote(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_contrc_code,
            v_last_price,
            v_up_limit_price,
            v_down_limit_price,
            v_pre_settle_price,
            v_sett_price,
            v_today_close_price,
            v_pre_close_price,
            v_buy_price_1,
            v_sell_price_1,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rptT.4.117.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_更新期货行情出现错误！',v_mysql_message);
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
use db_rpts;;

# 事务_报表_资管报表_交易组当日成交统计查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptasset_QryExgpCurStrikeSum;;
DELIMITER ;;
CREATE PROCEDURE prt_rptasset_QryExgpCurStrikeSum(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_capt_amt decimal(18,4),
    OUT p_strike_releas_amt decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_资管报表_交易组当日成交统计查询】*/
    call db_rpts.pra_rptasset_QryExgpCurStrikeSum(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_exch_group_no,
        v_error_code,
        v_error_info,
        v_strike_capt_amt,
        v_strike_releas_amt);
    if v_error_code = "1" then
        SET v_error_code = "rptT.4.118.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_资管报表_交易组当日成交统计查询出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_capt_amt = v_strike_capt_amt;
    SET p_strike_releas_amt = v_strike_releas_amt;

END;;


