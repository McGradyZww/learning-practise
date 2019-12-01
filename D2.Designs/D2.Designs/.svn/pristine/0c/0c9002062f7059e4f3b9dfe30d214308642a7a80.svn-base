DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_T0_券源持仓查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_QueryT0SourceStockHoldingPosition;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_QueryT0SourceStockHoldingPosition(
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
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_co_busi_config_str varchar(64),
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
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_co_busi_config_str varchar(64);
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
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_券源持仓查询】*/
    call db_tdsecu.pra_tdset0_QueryT0SourceStockHoldingPosition(
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
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_stock_code,
        v_exch_no,
        v_co_busi_config_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_券源持仓查询出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_券源持仓历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_QueryHisT0SourceStockHoldingPosition;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_QueryHisT0SourceStockHoldingPosition(
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
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_co_busi_config_str varchar(64),
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
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_co_busi_config_str varchar(64);
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
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_券源持仓历史查询】*/
    call db_tdsecu.pra_tdset0_QueryHisT0SourceStockHoldingPosition(
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
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_stock_code,
        v_exch_no,
        v_begin_date,
        v_end_date,
        v_co_busi_config_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.111.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_券源持仓历史查询出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_持仓分笔查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_tdset0_QueryPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_tdset0_QueryPosiDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_opor_no_str varchar(2048),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_posi_status varchar(2),
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
    declare v_opor_no_str varchar(2048);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_posi_status varchar(2);
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
    SET v_opor_no_str = p_opor_no_str;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_posi_status = p_posi_status;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@操作员编号串#] */
    set v_opor_no_str = concat(";", v_opor_no_str,";");


    /* 调用【原子_交易证券_T0_持仓分笔查询】*/
    call db_tdsecu.pra_tdset0_QueryPosiDetail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_no_str,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_posi_status,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_持仓分笔查询出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_持仓分笔历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_tdset0_QueryPosiDetailHis;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_tdset0_QueryPosiDetailHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_opor_no_str varchar(2048),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_posi_status varchar(2),
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_opor_no_str varchar(2048);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_posi_status varchar(2);
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_opor_no_str = p_opor_no_str;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_posi_status = p_posi_status;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@操作员编号串#] */
    set v_opor_no_str = concat(";", v_opor_no_str,";");


    /* 调用【原子_交易证券_T0_持仓分笔历史查询】*/
    call db_tdsecu.pra_tdset0_QueryPosiDetailHis(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_no_str,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_posi_status,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_begin_date,
        v_end_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.201.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_持仓分笔历史查询出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_持仓合笔查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_tdset0_QueryPosiCombi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_tdset0_QueryPosiCombi(
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
    IN p_init_date int,
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
    declare v_asset_acco_no int;
    declare v_init_date int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_init_date = p_init_date;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_持仓合笔查询】*/
    call db_tdsecu.pra_tdset0_QueryPosiCombi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_init_date,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_持仓合笔查询出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_账户汇总信息查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_QueryAccTotalInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_QueryAccTotalInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_co_busi_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_amt decimal(18,4),
    OUT p_trade_qty decimal(18,2),
    OUT p_realize_pandl decimal(18,4),
    OUT p_yield_rate decimal(18,12),
    OUT p_all_fee decimal(18,4),
    OUT p_avail_amt decimal(18,4),
    OUT p_over_night_pandl decimal(18,4),
    OUT p_sum_realize_pandl decimal(18,4),
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
    declare v_co_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_amt decimal(18,4);
    declare v_trade_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_yield_rate decimal(18,12);
    declare v_all_fee decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_over_night_pandl decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_amt = 0;
    SET v_trade_qty = 0;
    SET v_realize_pandl = 0;
    SET v_yield_rate = 0;
    SET v_all_fee = 0;
    SET v_avail_amt = 0;
    SET v_over_night_pandl = 0;
    SET v_sum_realize_pandl = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_账户汇总信息查询】*/
    call db_tdsecu.pra_tdset0_QueryAccTotalInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_co_busi_config_str,
        v_error_code,
        v_error_info,
        v_trade_amt,
        v_trade_qty,
        v_realize_pandl,
        v_yield_rate,
        v_all_fee,
        v_avail_amt,
        v_over_night_pandl,
        v_sum_realize_pandl,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_账户汇总信息查询出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_amt = v_trade_amt;
    SET p_trade_qty = v_trade_qty;
    SET p_realize_pandl = v_realize_pandl;
    SET p_yield_rate = v_yield_rate;
    SET p_all_fee = v_all_fee;
    SET p_avail_amt = v_avail_amt;
    SET p_over_night_pandl = v_over_night_pandl;
    SET p_sum_realize_pandl = v_sum_realize_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_T0_持仓盈亏查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_QueryPosiPandL;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_QueryPosiPandL(
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_init_date int;
    declare v_query_opor_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_init_date = p_init_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_持仓盈亏查询】*/
    call db_tdsecu.pra_tdset0_QueryPosiPandL(
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
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_持仓盈亏查询出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_持仓盈亏历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_QueryHisPosiPandL;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_QueryHisPosiPandL(
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
    IN p_stock_code varchar(6),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_query_opor_no int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_begin_date int;
    declare v_end_date int;
    declare v_query_opor_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_持仓盈亏历史查询】*/
    call db_tdsecu.pra_tdset0_QueryHisPosiPandL(
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
        v_stock_code,
        v_begin_date,
        v_end_date,
        v_query_opor_no,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_持仓盈亏历史查询出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_操作员阈值设置查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_QueryOporTsholdSet;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_QueryOporTsholdSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
    IN p_co_busi_config_str varchar(64),
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
    declare v_query_opor_no int;
    declare v_co_busi_config_str varchar(64);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_操作员阈值设置查询】*/
    call db_tdsecu.pra_tdset0_QueryOporTsholdSet(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_query_opor_no,
        v_co_busi_config_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_操作员阈值设置查询出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_操作员阈值设置更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_UpdateOporTsholdSet;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_UpdateOporTsholdSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_curr_amt decimal(18,4),
    IN p_frozen_amt decimal(18,4),
    IN p_opor_warn_tshold decimal(18,4),
    IN p_opor_stop_tshold decimal(18,4),
    IN p_order_limit_time int,
    IN p_per_secu_posi_ratio decimal(18,12),
    IN p_posi_limit_time int,
    IN p_order_ctrl_qty decimal(18,2),
    IN p_order_ctrl_amt decimal(18,4),
    IN p_stock_warn_ratio decimal(18,12),
    IN p_stock_stop_ratio decimal(18,12),
    IN p_stock_warn_amt decimal(18,4),
    IN p_stock_stop_amt decimal(18,4),
    IN p_trig_oper_type int,
    IN p_open_close_permission int,
    IN p_risk_oper int,
    IN p_fee_calc_type int,
    IN p_permit_margin_trade int,
    IN p_buy_fee_ratio decimal(18,12),
    IN p_sell_fee_ratio decimal(18,12),
    IN p_buy_min_fee decimal(18,4),
    IN p_sell_min_fee decimal(18,4),
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
    declare v_busi_opor_no int;
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_order_limit_time int;
    declare v_per_secu_posi_ratio decimal(18,12);
    declare v_posi_limit_time int;
    declare v_order_ctrl_qty decimal(18,2);
    declare v_order_ctrl_amt decimal(18,4);
    declare v_stock_warn_ratio decimal(18,12);
    declare v_stock_stop_ratio decimal(18,12);
    declare v_stock_warn_amt decimal(18,4);
    declare v_stock_stop_amt decimal(18,4);
    declare v_trig_oper_type int;
    declare v_open_close_permission int;
    declare v_risk_oper int;
    declare v_fee_calc_type int;
    declare v_permit_margin_trade int;
    declare v_buy_fee_ratio decimal(18,12);
    declare v_sell_fee_ratio decimal(18,12);
    declare v_buy_min_fee decimal(18,4);
    declare v_sell_min_fee decimal(18,4);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_curr_amt = p_curr_amt;
    SET v_frozen_amt = p_frozen_amt;
    SET v_opor_warn_tshold = p_opor_warn_tshold;
    SET v_opor_stop_tshold = p_opor_stop_tshold;
    SET v_order_limit_time = p_order_limit_time;
    SET v_per_secu_posi_ratio = p_per_secu_posi_ratio;
    SET v_posi_limit_time = p_posi_limit_time;
    SET v_order_ctrl_qty = p_order_ctrl_qty;
    SET v_order_ctrl_amt = p_order_ctrl_amt;
    SET v_stock_warn_ratio = p_stock_warn_ratio;
    SET v_stock_stop_ratio = p_stock_stop_ratio;
    SET v_stock_warn_amt = p_stock_warn_amt;
    SET v_stock_stop_amt = p_stock_stop_amt;
    SET v_trig_oper_type = p_trig_oper_type;
    SET v_open_close_permission = p_open_close_permission;
    SET v_risk_oper = p_risk_oper;
    SET v_fee_calc_type = p_fee_calc_type;
    SET v_permit_margin_trade = p_permit_margin_trade;
    SET v_buy_fee_ratio = p_buy_fee_ratio;
    SET v_sell_fee_ratio = p_sell_fee_ratio;
    SET v_buy_min_fee = p_buy_min_fee;
    SET v_sell_min_fee = p_sell_min_fee;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易证券_T0_操作员阈值设置更新】*/
    call db_tdsecu.pra_tdset0_UpdateOporTsholdSet(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_busi_opor_no,
        v_opor_warn_tshold,
        v_opor_stop_tshold,
        v_curr_amt,
        v_frozen_amt,
        v_order_limit_time,
        v_per_secu_posi_ratio,
        v_posi_limit_time,
        v_order_ctrl_qty,
        v_order_ctrl_amt,
        v_stock_warn_ratio,
        v_stock_stop_ratio,
        v_stock_warn_amt,
        v_stock_stop_amt,
        v_trig_oper_type,
        v_open_close_permission,
        v_risk_oper,
        v_fee_calc_type,
        v_permit_margin_trade,
        v_buy_fee_ratio,
        v_sell_fee_ratio,
        v_buy_min_fee,
        v_sell_min_fee,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_操作员阈值设置更新出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_交易员开平仓明细查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_QueryOporOpenClosePosiDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_QueryOporOpenClosePosiDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_allow_opor_no_str varchar(2048);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_交易员开平仓明细查询】*/
    call db_tdsecu.pra_tdset0_QueryOporOpenClosePosiDetail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_exch_no,
        v_stock_code_no,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_allow_opor_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_交易员开平仓明细查询出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_操作员阈值信息初始化
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_InitOporTshold;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_InitOporTshold(
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
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易证券_T0_操作员阈值信息初始化】*/
    call db_tdsecu.pra_tdset0_InitOporTshold(
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
        SET v_error_code = "tdsecuT.6.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_操作员阈值信息初始化出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_交易员开平仓明细历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_QueryHisOporPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_QueryHisOporPosiDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_allow_opor_no_str varchar(2048);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_交易员开平仓明细历史查询】*/
    call db_tdsecu.pra_tdset0_QueryHisOporPosiDetail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_exch_no,
        v_stock_code_no,
        v_begin_date,
        v_end_date,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_allow_opor_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_交易员开平仓明细历史查询出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_操作员券源限额设置更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_UpdateOporStockLimit;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_UpdateOporStockLimit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_source_stock_qty decimal(18,2),
    IN p_single_limit_qty decimal(18,2),
    IN p_t0_buy_type int,
    IN p_menu_no int,
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
    declare v_busi_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_source_stock_qty decimal(18,2);
    declare v_single_limit_qty decimal(18,2);
    declare v_t0_buy_type int;
    declare v_menu_no int;
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_source_stock_qty = p_source_stock_qty;
    SET v_single_limit_qty = p_single_limit_qty;
    SET v_t0_buy_type = p_t0_buy_type;
    SET v_menu_no = p_menu_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易证券_T0_操作员券源限额设置更新】*/
    call db_tdsecu.pra_tdset0_UpdateOporStockLimit(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_busi_opor_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_code,
        v_exch_no,
        v_source_stock_qty,
        v_single_limit_qty,
        v_t0_buy_type,
        v_menu_no,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_操作员券源限额设置更新出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_操作员券源限额设置查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_QueryOporStockLimit;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_QueryOporStockLimit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_co_busi_config_str varchar(64),
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
    declare v_query_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_co_busi_config_str varchar(64);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_操作员券源限额设置查询】*/
    call db_tdsecu.pra_tdset0_QueryOporStockLimit(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_query_opor_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_stock_code,
        v_exch_no,
        v_row_id,
        v_row_count,
        v_co_no_str,
        v_pd_no_str,
        v_exch_group_no_str,
        v_co_busi_config_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.15.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_操作员券源限额设置查询出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_删除操作员券源限额设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_DeleteOporStockLimit;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_DeleteOporStockLimit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_row_id bigint,
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_source_stock_occur_qty decimal(18,2),
    OUT p_row_id_str varchar(2048)
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
    declare v_row_id bigint;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_source_stock_occur_qty decimal(18,2);
    declare v_row_id_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_id = p_row_id;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_source_stock_occur_qty = 0;
    SET v_row_id_str = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_删除操作员券源限额设置】*/
        call db_tdsecu.pra_tdset0_DeleteOporStockLimit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_row_id,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_source_stock_occur_qty,
            v_row_id_str);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_删除操作员券源限额设置出现错误！',v_mysql_message);
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
    SET p_source_stock_occur_qty = v_source_stock_occur_qty;
    SET p_row_id_str = v_row_id_str;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_T0_启用操作员券源限额设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_StartOporStockLimit;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_StartOporStockLimit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    declare v_co_no int;
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_limit_set_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_limit_set_status = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* set @限额设置状态# = 《限额设置状态-启用》; */
    set v_limit_set_status = "1";

    /* 调用【原子_交易证券_T0_更新操作员券源限额设置状态】*/
    call db_tdsecu.pra_tdset0_UpdateOporStockLimitStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_row_id,
        v_limit_set_status,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.17.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_更新操作员券源限额设置状态出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_暂停操作员券源限额设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_PauseOporStockLimit;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_PauseOporStockLimit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    declare v_co_no int;
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_limit_set_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_limit_set_status = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @限额设置状态# = 《限额设置状态-暂停》; */
        set v_limit_set_status = "2";

        /* 调用【原子_交易证券_T0_更新操作员券源限额设置状态】*/
        call db_tdsecu.pra_tdset0_UpdateOporStockLimitStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_row_id,
            v_limit_set_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.18.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_更新操作员券源限额设置状态出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_停止操作员券源限额设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_StopOporStockLimit;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_StopOporStockLimit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    declare v_co_no int;
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_limit_set_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_limit_set_status = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @限额设置状态# = 《限额设置状态-停止》; */
        set v_limit_set_status = "3";

        /* 调用【原子_交易证券_T0_更新操作员券源限额设置状态】*/
        call db_tdsecu.pra_tdset0_UpdateOporStockLimitStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_row_id,
            v_limit_set_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.19.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_更新操作员券源限额设置状态出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_操作员参数设置查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_QueryOporParamSet;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_QueryOporParamSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
    IN p_config_no bigint,
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
    declare v_query_opor_no int;
    declare v_config_no bigint;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_config_no = p_config_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_操作员参数设置查询】*/
    call db_tdsecu.pra_tdset0_QueryOporParamSet(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_query_opor_no,
        v_config_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_操作员参数设置查询出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_操作员参数设置更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_UpdateOporParamSet;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_UpdateOporParamSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_config_no bigint,
    IN p_config_value varchar(2048),
    IN p_config_name varchar(64),
    IN p_config_memo varchar(255),
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
    declare v_config_no bigint;
    declare v_config_value varchar(2048);
    declare v_config_name varchar(64);
    declare v_config_memo varchar(255);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_config_no = p_config_no;
    SET v_config_value = p_config_value;
    SET v_config_name = p_config_name;
    SET v_config_memo = p_config_memo;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_操作员参数设置更新】*/
        call db_tdsecu.pra_tdset0_UpdateOporParamSet(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_busi_opor_no,
            v_config_no,
            v_config_value,
            v_config_name,
            v_config_memo,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_操作员参数设置更新出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_删除操作员参数设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_DeleteOporParamSet;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_DeleteOporParamSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_config_no bigint,
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
    declare v_config_no bigint;
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_config_no = p_config_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_删除操作员参数设置】*/
        call db_tdsecu.pra_tdset0_DeleteOporParamSet(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_busi_opor_no,
            v_config_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_删除操作员参数设置出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_操作员券源限额设置批量更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_BatchUpdateOporStock;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_BatchUpdateOporStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_asset_acco_no_str varchar(2048),
    IN p_stock_acco_no_str varchar(4096),
    IN p_stock_code_str varchar(4096),
    IN p_exch_no_str varchar(2048),
    IN p_source_stock_qty_str varchar(4096),
    IN p_single_limit_qty_str varchar(4096),
    IN p_stock_code_no_str varchar(4096),
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
    declare v_co_no int;
    declare v_busi_opor_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_asset_acco_no_str varchar(2048);
    declare v_stock_acco_no_str varchar(4096);
    declare v_stock_code_str varchar(4096);
    declare v_exch_no_str varchar(2048);
    declare v_source_stock_qty_str varchar(4096);
    declare v_single_limit_qty_str varchar(4096);
    declare v_stock_code_no_str varchar(4096);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_split_str varchar(4);
    declare v_remark_info varchar(255);
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_source_stock_qty decimal(18,2);
    declare v_single_limit_qty decimal(18,2);
    declare v_t0_buy_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_stock_acco_no_str = p_stock_acco_no_str;
    SET v_stock_code_str = p_stock_code_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_source_stock_qty_str = p_source_stock_qty_str;
    SET v_single_limit_qty_str = p_single_limit_qty_str;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_split_str = " ";
    SET v_remark_info = " ";
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_exch_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_source_stock_qty = 0;
    SET v_single_limit_qty = 0;
    SET v_t0_buy_type = 0;

    
    label_pro:BEGIN
    
    #[事务开始]

    /* set @分隔符# = ";"; */
    set v_split_str = ";";

    /* set @备注信息# = ""; */
    set v_remark_info = "";

    /* while LOCATE(@分隔符#,@证券代码串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_str)<>0   do
        #截取前面每一位

        /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
        set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

        /* set @证券代码编号#=cast(substring(@证券代码编号串#,1,LOCATE(@分隔符#,@证券代码编号串#)-1) as SIGNED); */
        set v_stock_code_no=cast(substring(v_stock_code_no_str,1,LOCATE(v_split_str,v_stock_code_no_str)-1) as SIGNED);

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @产品编号#=cast(substring(@产品编号串#,1,LOCATE(@分隔符#,@产品编号串#)-1) as SIGNED); */
        set v_pd_no=cast(substring(v_pd_no_str,1,LOCATE(v_split_str,v_pd_no_str)-1) as SIGNED);

        /* set @交易组编号#=cast(substring(@交易组编号串#,1,LOCATE(@分隔符#,@交易组编号串#)-1) as SIGNED); */
        set v_exch_group_no=cast(substring(v_exch_group_no_str,1,LOCATE(v_split_str,v_exch_group_no_str)-1) as SIGNED);

        /* set @资产账户编号#=cast(substring(@资产账户编号串#,1,LOCATE(@分隔符#,@资产账户编号串#)-1) as SIGNED); */
        set v_asset_acco_no=cast(substring(v_asset_acco_no_str,1,LOCATE(v_split_str,v_asset_acco_no_str)-1) as SIGNED);

        /* set @股东代码编号#=cast(substring(@股东代码编号串#,1,LOCATE(@分隔符#,@股东代码编号串#)-1) as SIGNED); */
        set v_stock_acco_no=cast(substring(v_stock_acco_no_str,1,LOCATE(v_split_str,v_stock_acco_no_str)-1) as SIGNED);

        /* set @券源数量# = cast(substring(@券源数量串#,1,LOCATE(@分隔符#,@券源数量串#)-1) as decimal(18,2)); */
        set v_source_stock_qty = cast(substring(v_source_stock_qty_str,1,LOCATE(v_split_str,v_source_stock_qty_str)-1) as decimal(18,2));

        /* set @单笔限额数量# = cast(substring(@单笔限额数量串#,1,LOCATE(@分隔符#,@单笔限额数量串#)-1) as decimal(18,2)); */
        set v_single_limit_qty = cast(substring(v_single_limit_qty_str,1,LOCATE(v_split_str,v_single_limit_qty_str)-1) as decimal(18,2));

        /* [事务开始] */
        START TRANSACTION;


        /* set @T0买入方式# = 《T0买入方式-普通买入》; */
        set v_t0_buy_type = 0;

            /* 调用【原子_交易证券_T0_操作员券源限额设置更新】*/
            call db_tdsecu.pra_tdset0_UpdateOporStockLimit(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_co_no,
                v_busi_opor_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_stock_code,
                v_exch_no,
                v_source_stock_qty,
                v_single_limit_qty,
                v_t0_buy_type,
                v_menu_no,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.6.23.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_操作员券源限额设置更新出现错误！',v_mysql_message);
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

        /* set @证券代码编号串#=substring(@证券代码编号串#,LOCATE(@分隔符#,@证券代码编号串#)+1); */
        set v_stock_code_no_str=substring(v_stock_code_no_str,LOCATE(v_split_str,v_stock_code_no_str)+1);

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @产品编号串#=substring(@产品编号串#,LOCATE(@分隔符#,@产品编号串#)+1); */
        set v_pd_no_str=substring(v_pd_no_str,LOCATE(v_split_str,v_pd_no_str)+1);

        /* set @交易组编号串#=substring(@交易组编号串#,LOCATE(@分隔符#,@交易组编号串#)+1); */
        set v_exch_group_no_str=substring(v_exch_group_no_str,LOCATE(v_split_str,v_exch_group_no_str)+1);

        /* set @资产账户编号串#=substring(@资产账户编号串#,LOCATE(@分隔符#,@资产账户编号串#)+1); */
        set v_asset_acco_no_str=substring(v_asset_acco_no_str,LOCATE(v_split_str,v_asset_acco_no_str)+1);

        /* set @股东代码编号串#=substring(@股东代码编号串#,LOCATE(@分隔符#,@股东代码编号串#)+1); */
        set v_stock_acco_no_str=substring(v_stock_acco_no_str,LOCATE(v_split_str,v_stock_acco_no_str)+1);

        /* set @券源数量串#=substring(@券源数量串#,LOCATE(@分隔符#,@券源数量串#)+1); */
        set v_source_stock_qty_str=substring(v_source_stock_qty_str,LOCATE(v_split_str,v_source_stock_qty_str)+1);

        /* set @单笔限额数量串#=substring(@单笔限额数量串#,LOCATE(@分隔符#,@单笔限额数量串#)+1); */
        set v_single_limit_qty_str=substring(v_single_limit_qty_str,LOCATE(v_split_str,v_single_limit_qty_str)+1);
    end while;
    #[事务结束]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_T0_操作员阈值信息计算更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_CalcuOporTsholdInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_CalcuOporTsholdInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_detail_posi_id bigint,
    IN p_busi_opor_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_lngsht_type int,
    IN p_curr_qty decimal(18,2),
    IN p_open_posi_date int,
    IN p_open_posi_time int,
    IN p_open_posi_price decimal(16,9),
    IN p_open_posi_value decimal(18,4),
    IN p_open_posi_fee decimal(18,4),
    IN p_close_posi_qty decimal(18,2),
    IN p_close_posi_market_value decimal(18,4),
    IN p_close_posi_fee decimal(18,4),
    IN p_strike_no varchar(64),
    IN p_realize_pandl decimal(18,4),
    IN p_posi_status varchar(2),
    IN p_last_price decimal(16,9),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
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
    declare v_detail_posi_id bigint;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_lngsht_type int;
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_strike_no varchar(64);
    declare v_realize_pandl decimal(18,4);
    declare v_posi_status varchar(2);
    declare v_last_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_order_limit_time int;
    declare v_per_secu_posi_ratio decimal(18,12);
    declare v_posi_limit_time int;
    declare v_order_ctrl_qty decimal(18,2);
    declare v_order_ctrl_amt decimal(18,4);
    declare v_stock_warn_ratio decimal(18,12);
    declare v_stock_stop_ratio decimal(18,12);
    declare v_stock_warn_amt decimal(18,4);
    declare v_stock_stop_amt decimal(18,4);
    declare v_trig_oper_type int;
    declare v_open_close_permission int;
    declare v_risk_oper int;
    declare v_fee_calc_type int;
    declare v_permit_margin_trade int;
    declare v_buy_fee_ratio decimal(18,12);
    declare v_sell_fee_ratio decimal(18,12);
    declare v_buy_min_fee decimal(18,4);
    declare v_sell_min_fee decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_detail_posi_id = p_detail_posi_id;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_curr_qty = p_curr_qty;
    SET v_open_posi_date = p_open_posi_date;
    SET v_open_posi_time = p_open_posi_time;
    SET v_open_posi_price = p_open_posi_price;
    SET v_open_posi_value = p_open_posi_value;
    SET v_open_posi_fee = p_open_posi_fee;
    SET v_close_posi_qty = p_close_posi_qty;
    SET v_close_posi_market_value = p_close_posi_market_value;
    SET v_close_posi_fee = p_close_posi_fee;
    SET v_strike_no = p_strike_no;
    SET v_realize_pandl = p_realize_pandl;
    SET v_posi_status = p_posi_status;
    SET v_last_price = p_last_price;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_opor_warn_tshold = 0;
    SET v_opor_stop_tshold = 0;
    SET v_order_limit_time = 0;
    SET v_per_secu_posi_ratio = 0;
    SET v_posi_limit_time = 5;
    SET v_order_ctrl_qty = 0;
    SET v_order_ctrl_amt = 0;
    SET v_stock_warn_ratio = 0;
    SET v_stock_stop_ratio = 0;
    SET v_stock_warn_amt = 0;
    SET v_stock_stop_amt = 0;
    SET v_trig_oper_type = 0;
    SET v_open_close_permission = 0;
    SET v_risk_oper = 0;
    SET v_fee_calc_type = 0;
    SET v_permit_margin_trade = 0;
    SET v_buy_fee_ratio = 0;
    SET v_sell_fee_ratio = 0;
    SET v_buy_min_fee = 0;
    SET v_sell_min_fee = 0;
    SET v_remark_info = " ";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_获取操作员阈值信息】*/
    call db_tdsecu.pra_tdset0_GetOporTsholdSet(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_curr_amt,
        v_frozen_amt,
        v_opor_warn_tshold,
        v_opor_stop_tshold,
        v_order_limit_time,
        v_per_secu_posi_ratio,
        v_posi_limit_time,
        v_order_ctrl_qty,
        v_order_ctrl_amt,
        v_stock_warn_ratio,
        v_stock_stop_ratio,
        v_stock_warn_amt,
        v_stock_stop_amt,
        v_trig_oper_type,
        v_open_close_permission,
        v_risk_oper,
        v_fee_calc_type,
        v_permit_margin_trade,
        v_buy_fee_ratio,
        v_sell_fee_ratio,
        v_buy_min_fee,
        v_sell_min_fee,
        v_remark_info,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.90.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_获取操作员阈值信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_操作员阈值信息计算更新】*/
        call db_tdsecu.pra_tdset0_CalcuOporTsholdInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_detail_posi_id,
            v_busi_opor_no,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_no,
            v_stock_code,
            v_stock_acco_no,
            v_stock_code_no,
            v_lngsht_type,
            v_curr_qty,
            v_open_posi_date,
            v_open_posi_time,
            v_open_posi_price,
            v_open_posi_value,
            v_open_posi_fee,
            v_close_posi_qty,
            v_close_posi_market_value,
            v_close_posi_fee,
            v_strike_no,
            v_realize_pandl,
            v_posi_status,
            v_last_price,
            v_up_limit_price,
            v_down_limit_price,
            v_posi_limit_time,
            v_opor_warn_tshold,
            v_opor_stop_tshold,
            v_stock_warn_ratio,
            v_stock_stop_ratio,
            v_buy_fee_ratio,
            v_sell_fee_ratio,
            v_buy_min_fee,
            v_sell_min_fee,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.90.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_操作员阈值信息计算更新出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_获取证券持仓明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_GetPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_GetPosiDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_detail_posi_id bigint,
    OUT p_busi_opor_no int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_lngsht_type int,
    OUT p_curr_qty decimal(18,2),
    OUT p_open_posi_date int,
    OUT p_open_posi_time int,
    OUT p_open_posi_price decimal(16,9),
    OUT p_open_posi_value decimal(18,4),
    OUT p_open_posi_fee decimal(18,4),
    OUT p_close_posi_qty decimal(18,2),
    OUT p_close_posi_date int,
    OUT p_close_posi_time int,
    OUT p_close_posi_market_value decimal(18,4),
    OUT p_close_posi_fee decimal(18,4),
    OUT p_strike_no varchar(64),
    OUT p_realize_pandl decimal(18,4),
    OUT p_over_night_pandl decimal(18,4),
    OUT p_posi_status varchar(2),
    OUT p_remark_info varchar(255),
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_detail_posi_id bigint;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_lngsht_type int;
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_date int;
    declare v_close_posi_time int;
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_strike_no varchar(64);
    declare v_realize_pandl decimal(18,4);
    declare v_over_night_pandl decimal(18,4);
    declare v_posi_status varchar(2);
    declare v_remark_info varchar(255);
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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_detail_posi_id = 0;
    SET v_busi_opor_no = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_lngsht_type = 0;
    SET v_curr_qty = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_open_posi_time = date_format(curtime(),'%H%i%s');
    SET v_open_posi_price = 0;
    SET v_open_posi_value = 0;
    SET v_open_posi_fee = 0;
    SET v_close_posi_qty = 0;
    SET v_close_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_close_posi_time = date_format(curtime(),'%H%i%s');
    SET v_close_posi_market_value = 0;
    SET v_close_posi_fee = 0;
    SET v_strike_no = " ";
    SET v_realize_pandl = 0;
    SET v_over_night_pandl = 0;
    SET v_posi_status = "0";
    SET v_remark_info = " ";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_获取证券持仓明细】*/
    call db_tdsecu.pra_tdset0_GetPosiDetail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_row_id,
        v_error_code,
        v_error_info,
        v_row_id,
        v_detail_posi_id,
        v_busi_opor_no,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code,
        v_stock_acco_no,
        v_stock_code_no,
        v_lngsht_type,
        v_curr_qty,
        v_open_posi_date,
        v_open_posi_time,
        v_open_posi_price,
        v_open_posi_value,
        v_open_posi_fee,
        v_close_posi_qty,
        v_close_posi_date,
        v_close_posi_time,
        v_close_posi_market_value,
        v_close_posi_fee,
        v_strike_no,
        v_realize_pandl,
        v_over_night_pandl,
        v_posi_status,
        v_remark_info,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.91.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_获取证券持仓明细出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_detail_posi_id = v_detail_posi_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_lngsht_type = v_lngsht_type;
    SET p_curr_qty = v_curr_qty;
    SET p_open_posi_date = v_open_posi_date;
    SET p_open_posi_time = v_open_posi_time;
    SET p_open_posi_price = v_open_posi_price;
    SET p_open_posi_value = v_open_posi_value;
    SET p_open_posi_fee = v_open_posi_fee;
    SET p_close_posi_qty = v_close_posi_qty;
    SET p_close_posi_date = v_close_posi_date;
    SET p_close_posi_time = v_close_posi_time;
    SET p_close_posi_market_value = v_close_posi_market_value;
    SET p_close_posi_fee = v_close_posi_fee;
    SET p_strike_no = v_strike_no;
    SET p_realize_pandl = v_realize_pandl;
    SET p_over_night_pandl = v_over_night_pandl;
    SET p_posi_status = v_posi_status;
    SET p_remark_info = v_remark_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_T0_操作员阈值汇总信息计算更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_CalcuOporSumTsholdInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_CalcuOporSumTsholdInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_busi_opor_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_total_long_curr_qty decimal(18,2),
    IN p_total_short_curr_qty decimal(18,2),
    IN p_total_long_open_posi_value decimal(18,4),
    IN p_total_short_open_posi_value decimal(18,4),
    IN p_total_long_open_posi_fee decimal(18,4),
    IN p_total_short_open_posi_fee decimal(18,4),
    IN p_total_long_close_posi_value decimal(18,4),
    IN p_total_short_close_posi_value decimal(18,4),
    IN p_total_long_close_posi_qty decimal(18,2),
    IN p_total_short_close_posi_qty decimal(18,2),
    IN p_total_long_close_posi_fee decimal(18,4),
    IN p_total_short_close_posi_fee decimal(18,4),
    IN p_total_realize_pandl decimal(18,4),
    IN p_open_posi_date int,
    IN p_open_posi_time int,
    IN p_long_curr_qty decimal(18,2),
    IN p_short_curr_qty decimal(18,2),
    IN p_long_open_posi_value decimal(18,4),
    IN p_short_open_posi_value decimal(18,4),
    IN p_long_open_posi_fee decimal(18,4),
    IN p_short_open_posi_fee decimal(18,4),
    IN p_long_close_posi_qty decimal(18,2),
    IN p_short_close_posi_qty decimal(18,2),
    IN p_long_close_posi_value decimal(18,4),
    IN p_short_close_posi_value decimal(18,4),
    IN p_long_close_posi_fee decimal(18,4),
    IN p_short_close_posi_fee decimal(18,4),
    IN p_realize_pandl decimal(18,4),
    IN p_last_price decimal(16,9),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_last_update_time int,
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
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_total_long_curr_qty decimal(18,2);
    declare v_total_short_curr_qty decimal(18,2);
    declare v_total_long_open_posi_value decimal(18,4);
    declare v_total_short_open_posi_value decimal(18,4);
    declare v_total_long_open_posi_fee decimal(18,4);
    declare v_total_short_open_posi_fee decimal(18,4);
    declare v_total_long_close_posi_value decimal(18,4);
    declare v_total_short_close_posi_value decimal(18,4);
    declare v_total_long_close_posi_qty decimal(18,2);
    declare v_total_short_close_posi_qty decimal(18,2);
    declare v_total_long_close_posi_fee decimal(18,4);
    declare v_total_short_close_posi_fee decimal(18,4);
    declare v_total_realize_pandl decimal(18,4);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_long_curr_qty decimal(18,2);
    declare v_short_curr_qty decimal(18,2);
    declare v_long_open_posi_value decimal(18,4);
    declare v_short_open_posi_value decimal(18,4);
    declare v_long_open_posi_fee decimal(18,4);
    declare v_short_open_posi_fee decimal(18,4);
    declare v_long_close_posi_qty decimal(18,2);
    declare v_short_close_posi_qty decimal(18,2);
    declare v_long_close_posi_value decimal(18,4);
    declare v_short_close_posi_value decimal(18,4);
    declare v_long_close_posi_fee decimal(18,4);
    declare v_short_close_posi_fee decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_last_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_update_time int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_order_limit_time int;
    declare v_per_secu_posi_ratio decimal(18,12);
    declare v_posi_limit_time int;
    declare v_order_ctrl_qty decimal(18,2);
    declare v_order_ctrl_amt decimal(18,4);
    declare v_stock_warn_ratio decimal(18,12);
    declare v_stock_stop_ratio decimal(18,12);
    declare v_stock_warn_amt decimal(18,4);
    declare v_stock_stop_amt decimal(18,4);
    declare v_trig_oper_type int;
    declare v_open_close_permission int;
    declare v_risk_oper int;
    declare v_fee_calc_type int;
    declare v_permit_margin_trade int;
    declare v_buy_fee_ratio decimal(18,12);
    declare v_sell_fee_ratio decimal(18,12);
    declare v_buy_min_fee decimal(18,4);
    declare v_sell_min_fee decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_total_long_curr_qty = p_total_long_curr_qty;
    SET v_total_short_curr_qty = p_total_short_curr_qty;
    SET v_total_long_open_posi_value = p_total_long_open_posi_value;
    SET v_total_short_open_posi_value = p_total_short_open_posi_value;
    SET v_total_long_open_posi_fee = p_total_long_open_posi_fee;
    SET v_total_short_open_posi_fee = p_total_short_open_posi_fee;
    SET v_total_long_close_posi_value = p_total_long_close_posi_value;
    SET v_total_short_close_posi_value = p_total_short_close_posi_value;
    SET v_total_long_close_posi_qty = p_total_long_close_posi_qty;
    SET v_total_short_close_posi_qty = p_total_short_close_posi_qty;
    SET v_total_long_close_posi_fee = p_total_long_close_posi_fee;
    SET v_total_short_close_posi_fee = p_total_short_close_posi_fee;
    SET v_total_realize_pandl = p_total_realize_pandl;
    SET v_open_posi_date = p_open_posi_date;
    SET v_open_posi_time = p_open_posi_time;
    SET v_long_curr_qty = p_long_curr_qty;
    SET v_short_curr_qty = p_short_curr_qty;
    SET v_long_open_posi_value = p_long_open_posi_value;
    SET v_short_open_posi_value = p_short_open_posi_value;
    SET v_long_open_posi_fee = p_long_open_posi_fee;
    SET v_short_open_posi_fee = p_short_open_posi_fee;
    SET v_long_close_posi_qty = p_long_close_posi_qty;
    SET v_short_close_posi_qty = p_short_close_posi_qty;
    SET v_long_close_posi_value = p_long_close_posi_value;
    SET v_short_close_posi_value = p_short_close_posi_value;
    SET v_long_close_posi_fee = p_long_close_posi_fee;
    SET v_short_close_posi_fee = p_short_close_posi_fee;
    SET v_realize_pandl = p_realize_pandl;
    SET v_last_price = p_last_price;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_last_update_time = p_last_update_time;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_opor_warn_tshold = 0;
    SET v_opor_stop_tshold = 0;
    SET v_order_limit_time = 0;
    SET v_per_secu_posi_ratio = 0;
    SET v_posi_limit_time = 5;
    SET v_order_ctrl_qty = 0;
    SET v_order_ctrl_amt = 0;
    SET v_stock_warn_ratio = 0;
    SET v_stock_stop_ratio = 0;
    SET v_stock_warn_amt = 0;
    SET v_stock_stop_amt = 0;
    SET v_trig_oper_type = 0;
    SET v_open_close_permission = 0;
    SET v_risk_oper = 0;
    SET v_fee_calc_type = 0;
    SET v_permit_margin_trade = 0;
    SET v_buy_fee_ratio = 0;
    SET v_sell_fee_ratio = 0;
    SET v_buy_min_fee = 0;
    SET v_sell_min_fee = 0;
    SET v_remark_info = " ";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_获取操作员阈值信息】*/
    call db_tdsecu.pra_tdset0_GetOporTsholdSet(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_curr_amt,
        v_frozen_amt,
        v_opor_warn_tshold,
        v_opor_stop_tshold,
        v_order_limit_time,
        v_per_secu_posi_ratio,
        v_posi_limit_time,
        v_order_ctrl_qty,
        v_order_ctrl_amt,
        v_stock_warn_ratio,
        v_stock_stop_ratio,
        v_stock_warn_amt,
        v_stock_stop_amt,
        v_trig_oper_type,
        v_open_close_permission,
        v_risk_oper,
        v_fee_calc_type,
        v_permit_margin_trade,
        v_buy_fee_ratio,
        v_sell_fee_ratio,
        v_buy_min_fee,
        v_sell_min_fee,
        v_remark_info,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.92.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_获取操作员阈值信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_操作员阈值汇总信息计算更新】*/
        call db_tdsecu.pra_tdset0_CalcuOporSumTsholdInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_busi_opor_no,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_total_long_curr_qty,
            v_total_short_curr_qty,
            v_total_long_open_posi_value,
            v_total_short_open_posi_value,
            v_total_long_open_posi_fee,
            v_total_short_open_posi_fee,
            v_total_long_close_posi_value,
            v_total_short_close_posi_value,
            v_total_long_close_posi_qty,
            v_total_short_close_posi_qty,
            v_total_long_close_posi_fee,
            v_total_short_close_posi_fee,
            v_total_realize_pandl,
            v_open_posi_date,
            v_open_posi_time,
            v_long_curr_qty,
            v_short_curr_qty,
            v_long_open_posi_value,
            v_short_open_posi_value,
            v_long_open_posi_fee,
            v_short_open_posi_fee,
            v_long_close_posi_qty,
            v_short_close_posi_qty,
            v_long_close_posi_value,
            v_short_close_posi_value,
            v_long_close_posi_fee,
            v_short_close_posi_fee,
            v_realize_pandl,
            v_last_price,
            v_up_limit_price,
            v_down_limit_price,
            v_posi_limit_time,
            v_opor_warn_tshold,
            v_opor_stop_tshold,
            v_stock_warn_ratio,
            v_stock_stop_ratio,
            v_buy_fee_ratio,
            v_sell_fee_ratio,
            v_buy_min_fee,
            v_sell_min_fee,
            v_last_update_time,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.92.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_操作员阈值汇总信息计算更新出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_获取证券持仓汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_GetSingleSumPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_GetSingleSumPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_busi_opor_no int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_total_long_curr_qty decimal(18,2),
    OUT p_total_short_curr_qty decimal(18,2),
    OUT p_total_long_open_posi_value decimal(18,4),
    OUT p_total_short_open_posi_value decimal(18,4),
    OUT p_total_long_open_posi_fee decimal(18,4),
    OUT p_total_short_open_posi_fee decimal(18,4),
    OUT p_total_long_close_posi_value decimal(18,4),
    OUT p_total_short_close_posi_value decimal(18,4),
    OUT p_total_long_close_posi_qty decimal(18,2),
    OUT p_total_short_close_posi_qty decimal(18,2),
    OUT p_total_long_close_posi_fee decimal(18,4),
    OUT p_total_short_close_posi_fee decimal(18,4),
    OUT p_total_realize_pandl decimal(18,4),
    OUT p_open_posi_date int,
    OUT p_open_posi_time int,
    OUT p_long_curr_qty decimal(18,2),
    OUT p_short_curr_qty decimal(18,2),
    OUT p_long_open_posi_value decimal(18,4),
    OUT p_short_open_posi_value decimal(18,4),
    OUT p_long_open_posi_fee decimal(18,4),
    OUT p_short_open_posi_fee decimal(18,4),
    OUT p_long_close_posi_qty decimal(18,2),
    OUT p_short_close_posi_qty decimal(18,2),
    OUT p_long_close_posi_value decimal(18,4),
    OUT p_short_close_posi_value decimal(18,4),
    OUT p_long_close_posi_fee decimal(18,4),
    OUT p_short_close_posi_fee decimal(18,4),
    OUT p_realize_pandl decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_total_long_curr_qty decimal(18,2);
    declare v_total_short_curr_qty decimal(18,2);
    declare v_total_long_open_posi_value decimal(18,4);
    declare v_total_short_open_posi_value decimal(18,4);
    declare v_total_long_open_posi_fee decimal(18,4);
    declare v_total_short_open_posi_fee decimal(18,4);
    declare v_total_long_close_posi_value decimal(18,4);
    declare v_total_short_close_posi_value decimal(18,4);
    declare v_total_long_close_posi_qty decimal(18,2);
    declare v_total_short_close_posi_qty decimal(18,2);
    declare v_total_long_close_posi_fee decimal(18,4);
    declare v_total_short_close_posi_fee decimal(18,4);
    declare v_total_realize_pandl decimal(18,4);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_long_curr_qty decimal(18,2);
    declare v_short_curr_qty decimal(18,2);
    declare v_long_open_posi_value decimal(18,4);
    declare v_short_open_posi_value decimal(18,4);
    declare v_long_open_posi_fee decimal(18,4);
    declare v_short_open_posi_fee decimal(18,4);
    declare v_long_close_posi_qty decimal(18,2);
    declare v_short_close_posi_qty decimal(18,2);
    declare v_long_close_posi_value decimal(18,4);
    declare v_short_close_posi_value decimal(18,4);
    declare v_long_close_posi_fee decimal(18,4);
    declare v_short_close_posi_fee decimal(18,4);
    declare v_realize_pandl decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_busi_opor_no = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_total_long_curr_qty = 0;
    SET v_total_short_curr_qty = 0;
    SET v_total_long_open_posi_value = 0;
    SET v_total_short_open_posi_value = 0;
    SET v_total_long_open_posi_fee = 0;
    SET v_total_short_open_posi_fee = 0;
    SET v_total_long_close_posi_value = 0;
    SET v_total_short_close_posi_value = 0;
    SET v_total_long_close_posi_qty = 0;
    SET v_total_short_close_posi_qty = 0;
    SET v_total_long_close_posi_fee = 0;
    SET v_total_short_close_posi_fee = 0;
    SET v_total_realize_pandl = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_open_posi_time = date_format(curtime(),'%H%i%s');
    SET v_long_curr_qty = 0;
    SET v_short_curr_qty = 0;
    SET v_long_open_posi_value = 0;
    SET v_short_open_posi_value = 0;
    SET v_long_open_posi_fee = 0;
    SET v_short_open_posi_fee = 0;
    SET v_long_close_posi_qty = 0;
    SET v_short_close_posi_qty = 0;
    SET v_long_close_posi_value = 0;
    SET v_short_close_posi_value = 0;
    SET v_long_close_posi_fee = 0;
    SET v_short_close_posi_fee = 0;
    SET v_realize_pandl = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_获取证券持仓汇总】*/
    call db_tdsecu.pra_tdset0_GetSingleSumPosi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_row_id,
        v_error_code,
        v_error_info,
        v_row_id,
        v_busi_opor_no,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_total_long_curr_qty,
        v_total_short_curr_qty,
        v_total_long_open_posi_value,
        v_total_short_open_posi_value,
        v_total_long_open_posi_fee,
        v_total_short_open_posi_fee,
        v_total_long_close_posi_value,
        v_total_short_close_posi_value,
        v_total_long_close_posi_qty,
        v_total_short_close_posi_qty,
        v_total_long_close_posi_fee,
        v_total_short_close_posi_fee,
        v_total_realize_pandl,
        v_open_posi_date,
        v_open_posi_time,
        v_long_curr_qty,
        v_short_curr_qty,
        v_long_open_posi_value,
        v_short_open_posi_value,
        v_long_open_posi_fee,
        v_short_open_posi_fee,
        v_long_close_posi_qty,
        v_short_close_posi_qty,
        v_long_close_posi_value,
        v_short_close_posi_value,
        v_long_close_posi_fee,
        v_short_close_posi_fee,
        v_realize_pandl);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.93.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_获取证券持仓汇总出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_total_long_curr_qty = v_total_long_curr_qty;
    SET p_total_short_curr_qty = v_total_short_curr_qty;
    SET p_total_long_open_posi_value = v_total_long_open_posi_value;
    SET p_total_short_open_posi_value = v_total_short_open_posi_value;
    SET p_total_long_open_posi_fee = v_total_long_open_posi_fee;
    SET p_total_short_open_posi_fee = v_total_short_open_posi_fee;
    SET p_total_long_close_posi_value = v_total_long_close_posi_value;
    SET p_total_short_close_posi_value = v_total_short_close_posi_value;
    SET p_total_long_close_posi_qty = v_total_long_close_posi_qty;
    SET p_total_short_close_posi_qty = v_total_short_close_posi_qty;
    SET p_total_long_close_posi_fee = v_total_long_close_posi_fee;
    SET p_total_short_close_posi_fee = v_total_short_close_posi_fee;
    SET p_total_realize_pandl = v_total_realize_pandl;
    SET p_open_posi_date = v_open_posi_date;
    SET p_open_posi_time = v_open_posi_time;
    SET p_long_curr_qty = v_long_curr_qty;
    SET p_short_curr_qty = v_short_curr_qty;
    SET p_long_open_posi_value = v_long_open_posi_value;
    SET p_short_open_posi_value = v_short_open_posi_value;
    SET p_long_open_posi_fee = v_long_open_posi_fee;
    SET p_short_open_posi_fee = v_short_open_posi_fee;
    SET p_long_close_posi_qty = v_long_close_posi_qty;
    SET p_short_close_posi_qty = v_short_close_posi_qty;
    SET p_long_close_posi_value = v_long_close_posi_value;
    SET p_short_close_posi_value = v_short_close_posi_value;
    SET p_long_close_posi_fee = v_long_close_posi_fee;
    SET p_short_close_posi_fee = v_short_close_posi_fee;
    SET p_realize_pandl = v_realize_pandl;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_T0_操作员阈值设置调整资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_OporTsholdSetAdjustCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_OporTsholdSetAdjustCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_curr_amt decimal(18,4),
    IN p_frozen_amt decimal(18,4),
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
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
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
    SET v_curr_amt = p_curr_amt;
    SET v_frozen_amt = p_frozen_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_操作员阈值设置调整资金】*/
        call db_tdsecu.pra_tdset0_OporTsholdSetAdjustCapital(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_busi_opor_no,
            v_curr_amt,
            v_frozen_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.94.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_操作员阈值设置调整资金出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_隔夜仓查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_tdset0_QueryOvernightStockPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_tdset0_QueryOvernightStockPosi(
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
    IN p_busi_opor_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_asset_acco_no int;
    declare v_busi_opor_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_隔夜仓查询】*/
    call db_tdsecu.pra_tdset0_QueryOvernightStockPosi(
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
        v_busi_opor_no,
        v_exch_no,
        v_stock_code,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.95.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_隔夜仓查询出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_持仓明细作废
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_WasteT0UnitEquitiesPositionDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_WasteT0UnitEquitiesPositionDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_co_busi_config_str varchar(64),
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
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
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
    SET v_init_date = p_init_date;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_持仓明细作废】*/
        call db_tdsecu.pra_tdset0_WasteT0UnitEquitiesPositionDetail(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_init_date,
            v_co_busi_config_str,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.96.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_持仓明细作废出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_设置开平仓权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_SetOpenClosePermission;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_SetOpenClosePermission(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_open_close_permission int,
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
    declare v_open_close_permission int;
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_open_close_permission = p_open_close_permission;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_设置开平仓权限】*/
        call db_tdsecu.pra_tdset0_SetOpenClosePermission(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_busi_opor_no,
            v_open_close_permission,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.97.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_设置开平仓权限出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_获取操作员阈值信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_GetOporTsholdSet;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_GetOporTsholdSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_curr_amt decimal(18,4),
    OUT p_frozen_amt decimal(18,4),
    OUT p_opor_warn_tshold decimal(18,4),
    OUT p_opor_stop_tshold decimal(18,4),
    OUT p_order_limit_time int,
    OUT p_per_secu_posi_ratio decimal(18,12),
    OUT p_posi_limit_time int,
    OUT p_order_ctrl_qty decimal(18,2),
    OUT p_order_ctrl_amt decimal(18,4),
    OUT p_stock_warn_ratio decimal(18,12),
    OUT p_stock_stop_ratio decimal(18,12),
    OUT p_stock_warn_amt decimal(18,4),
    OUT p_stock_stop_amt decimal(18,4),
    OUT p_trig_oper_type int,
    OUT p_open_close_permission int,
    OUT p_risk_oper int,
    OUT p_fee_calc_type int,
    OUT p_permit_margin_trade int,
    OUT p_buy_fee_ratio decimal(18,12),
    OUT p_sell_fee_ratio decimal(18,12),
    OUT p_buy_min_fee decimal(18,4),
    OUT p_sell_min_fee decimal(18,4),
    OUT p_remark_info varchar(255),
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
    declare v_busi_opor_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_order_limit_time int;
    declare v_per_secu_posi_ratio decimal(18,12);
    declare v_posi_limit_time int;
    declare v_order_ctrl_qty decimal(18,2);
    declare v_order_ctrl_amt decimal(18,4);
    declare v_stock_warn_ratio decimal(18,12);
    declare v_stock_stop_ratio decimal(18,12);
    declare v_stock_warn_amt decimal(18,4);
    declare v_stock_stop_amt decimal(18,4);
    declare v_trig_oper_type int;
    declare v_open_close_permission int;
    declare v_risk_oper int;
    declare v_fee_calc_type int;
    declare v_permit_margin_trade int;
    declare v_buy_fee_ratio decimal(18,12);
    declare v_sell_fee_ratio decimal(18,12);
    declare v_buy_min_fee decimal(18,4);
    declare v_sell_min_fee decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_update_times int;
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_opor_warn_tshold = 0;
    SET v_opor_stop_tshold = 0;
    SET v_order_limit_time = 0;
    SET v_per_secu_posi_ratio = 0;
    SET v_posi_limit_time = 5;
    SET v_order_ctrl_qty = 0;
    SET v_order_ctrl_amt = 0;
    SET v_stock_warn_ratio = 0;
    SET v_stock_stop_ratio = 0;
    SET v_stock_warn_amt = 0;
    SET v_stock_stop_amt = 0;
    SET v_trig_oper_type = 0;
    SET v_open_close_permission = 0;
    SET v_risk_oper = 0;
    SET v_fee_calc_type = 0;
    SET v_permit_margin_trade = 0;
    SET v_buy_fee_ratio = 0;
    SET v_sell_fee_ratio = 0;
    SET v_buy_min_fee = 0;
    SET v_sell_min_fee = 0;
    SET v_remark_info = " ";
    SET v_update_times = 1;
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_获取操作员阈值信息】*/
    call db_tdsecu.pra_tdset0_GetOporTsholdSet(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_curr_amt,
        v_frozen_amt,
        v_opor_warn_tshold,
        v_opor_stop_tshold,
        v_order_limit_time,
        v_per_secu_posi_ratio,
        v_posi_limit_time,
        v_order_ctrl_qty,
        v_order_ctrl_amt,
        v_stock_warn_ratio,
        v_stock_stop_ratio,
        v_stock_warn_amt,
        v_stock_stop_amt,
        v_trig_oper_type,
        v_open_close_permission,
        v_risk_oper,
        v_fee_calc_type,
        v_permit_margin_trade,
        v_buy_fee_ratio,
        v_sell_fee_ratio,
        v_buy_min_fee,
        v_sell_min_fee,
        v_remark_info,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.98.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_获取操作员阈值信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_curr_amt = v_curr_amt;
    SET p_frozen_amt = v_frozen_amt;
    SET p_opor_warn_tshold = v_opor_warn_tshold;
    SET p_opor_stop_tshold = v_opor_stop_tshold;
    SET p_order_limit_time = v_order_limit_time;
    SET p_per_secu_posi_ratio = v_per_secu_posi_ratio;
    SET p_posi_limit_time = v_posi_limit_time;
    SET p_order_ctrl_qty = v_order_ctrl_qty;
    SET p_order_ctrl_amt = v_order_ctrl_amt;
    SET p_stock_warn_ratio = v_stock_warn_ratio;
    SET p_stock_stop_ratio = v_stock_stop_ratio;
    SET p_stock_warn_amt = v_stock_warn_amt;
    SET p_stock_stop_amt = v_stock_stop_amt;
    SET p_trig_oper_type = v_trig_oper_type;
    SET p_open_close_permission = v_open_close_permission;
    SET p_risk_oper = v_risk_oper;
    SET p_fee_calc_type = v_fee_calc_type;
    SET p_permit_margin_trade = v_permit_margin_trade;
    SET p_buy_fee_ratio = v_buy_fee_ratio;
    SET p_sell_fee_ratio = v_sell_fee_ratio;
    SET p_buy_min_fee = v_buy_min_fee;
    SET p_sell_min_fee = v_sell_min_fee;
    SET p_remark_info = v_remark_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_T0_操作员交易费用计算
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_OperatorTradeFeeCacl;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_OperatorTradeFeeCacl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_dir int,
    IN p_buy_min_fee decimal(18,4),
    IN p_sell_min_fee decimal(18,4),
    IN p_order_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    IN p_buy_fee_ratio decimal(18,12),
    IN p_sell_fee_ratio decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_all_fee decimal(18,4)
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
    declare v_buy_min_fee decimal(18,4);
    declare v_sell_min_fee decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_buy_fee_ratio decimal(18,12);
    declare v_sell_fee_ratio decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_all_fee decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_buy_min_fee = p_buy_min_fee;
    SET v_sell_min_fee = p_sell_min_fee;
    SET v_order_qty = p_order_qty;
    SET v_order_price = p_order_price;
    SET v_buy_fee_ratio = p_buy_fee_ratio;
    SET v_sell_fee_ratio = p_sell_fee_ratio;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_all_fee = 0;

    
    label_pro:BEGIN
    

    /* if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-融资买入》 then */
    if v_order_dir = 1 or v_order_dir = 5 then

        /* set @全部费用# = round(GREATEST(@订单数量# * @订单价格# * @买费率#,@买最低费用#),2); */
        set v_all_fee = round(GREATEST(v_order_qty * v_order_price * v_buy_fee_ratio,v_buy_min_fee),2);

    /* elseif @订单方向# = 《订单方向-卖出》 then */
    elseif v_order_dir = 2 then

        /* set @全部费用# = round(GREATEST(@订单数量# * @订单价格# * @卖费率#,@卖最低费用#),2); */
        set v_all_fee = round(GREATEST(v_order_qty * v_order_price * v_sell_fee_ratio,v_sell_min_fee),2);
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_all_fee = v_all_fee;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_T0_操作员成交费用计算
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_OperatorStrikeFeeCacl;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_OperatorStrikeFeeCacl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_dir int,
    IN p_buy_min_fee decimal(18,4),
    IN p_sell_min_fee decimal(18,4),
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_buy_fee_ratio decimal(18,12),
    IN p_sell_fee_ratio decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_all_fee decimal(18,4)
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
    declare v_buy_min_fee decimal(18,4);
    declare v_sell_min_fee decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_buy_fee_ratio decimal(18,12);
    declare v_sell_fee_ratio decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_all_fee decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_buy_min_fee = p_buy_min_fee;
    SET v_sell_min_fee = p_sell_min_fee;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_buy_fee_ratio = p_buy_fee_ratio;
    SET v_sell_fee_ratio = p_sell_fee_ratio;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_all_fee = 0;

    
    label_pro:BEGIN
    

    /* if @订单方向# = 《订单方向-买入》  or @订单方向# = 《订单方向-融资买入》 then */
    if v_order_dir = 1  or v_order_dir = 5 then

        /* set @全部费用# = round(GREATEST(@成交数量# * @成交价格# * @买费率#,@买最低费用#),2); */
        set v_all_fee = round(GREATEST(v_strike_qty * v_strike_price * v_buy_fee_ratio,v_buy_min_fee),2);

    /* elseif @订单方向# = 《订单方向-卖出》 then */
    elseif v_order_dir = 2 then

        /* set @全部费用# = round(GREATEST(@成交数量# * @成交价格# * @卖费率#,@卖最低费用#),2); */
        set v_all_fee = round(GREATEST(v_strike_qty * v_strike_price * v_sell_fee_ratio,v_sell_min_fee),2);
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_all_fee = v_all_fee;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_T0_查询所有持仓汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_tdset0_QueryAllSumPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_tdset0_QueryAllSumPosi(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_查询所有持仓汇总】*/
    call db_tdsecu.pra_tdset0_QueryAllSumPosi(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.102.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_查询所有持仓汇总出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_获取机构级操作员费用设置标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_GetCoOperatorFeeFlag;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_GetCoOperatorFeeFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_busi_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_T0_opor_fee_set_flag int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_T0_opor_fee_set_flag int;
    declare v_oper_mark varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_T0_opor_fee_set_flag = 0;
    SET v_oper_mark = " ";

    
    label_pro:BEGIN
    

    /* set @操作标志# = substring(@机构业务控制配置串#,17,1); */
    set v_oper_mark = substring(v_co_busi_config_str,17,1);

    /* if @操作标志# = '1' then */
    if v_oper_mark = '1' then

        /* set @T0操作员费用设置标志# = 1; */
        set v_T0_opor_fee_set_flag = 1;
    else

        /* set @T0操作员费用设置标志# = 0; */
        set v_T0_opor_fee_set_flag = 0;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_T0_opor_fee_set_flag = v_T0_opor_fee_set_flag;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_T0_计算设置开平仓权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_CalcSetOpenClosePermission;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_CalcSetOpenClosePermission(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_open_close_permission int,
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
    declare v_open_close_permission int;
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_open_close_permission = p_open_close_permission;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_计算设置开平仓权限】*/
        call db_tdsecu.pra_tdset0_CalcSetOpenClosePermission(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_busi_opor_no,
            v_open_close_permission,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_计算设置开平仓权限出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_券源划转
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_StockSourceTransfer;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_StockSourceTransfer(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_target_opor_no int,
    IN p_occur_qty decimal(18,2),
    IN p_co_busi_config_str varchar(64),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_acco_no int,
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
    declare v_row_id bigint;
    declare v_target_opor_no int;
    declare v_occur_qty decimal(18,2);
    declare v_co_busi_config_str varchar(64);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
    declare v_busi_opor_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_occur_qty = p_occur_qty;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_acco_no = 0;
    SET v_busi_opor_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_券源划转】*/
        call db_tdsecu.pra_tdset0_StockSourceTransfer(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_row_id,
            v_target_opor_no,
            v_occur_qty,
            v_co_busi_config_str,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_exch_group_no,
            v_asset_acco_no,
            v_stock_code_no,
            v_stock_acco_no,
            v_busi_opor_no);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.105.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_券源划转出现错误！',v_mysql_message);
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
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_busi_opor_no = v_busi_opor_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_T0_根据成交表处理持仓明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_Deal;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_Deal(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_busi_opor_no int,
    IN p_order_oper_way varchar(2),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_stock_acco_no int,
    IN p_asset_acco_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_stock_code_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_strike_no varchar(64),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_fee decimal(18,4),
    IN p_trade_occur_qty decimal(18,2),
    IN p_strike_occur_qty decimal(18,2),
    IN p_trade_occur_amt decimal(18,4),
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
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_stock_acco_no int;
    declare v_asset_acco_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_stock_code_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_strike_no varchar(64);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_strike_occur_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_order_oper_way = p_order_oper_way;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_stock_code_no = p_stock_code_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_strike_no = p_strike_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_fee = p_strike_fee;
    SET v_trade_occur_qty = p_trade_occur_qty;
    SET v_strike_occur_qty = p_strike_occur_qty;
    SET v_trade_occur_amt = p_trade_occur_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @本币币种# = "CNY"; */
    set v_crncy_type = "CNY";

    /* set @交易币种# = "CNY" ; */
    set v_exch_crncy_type = "CNY" ;

    /* set @交易变动数量# = 0; */
    set v_trade_occur_qty = 0;

    /* set @交易变动金额# =0 ; */
    set v_trade_occur_amt =0 ;

    /* [事务开始] */
    START TRANSACTION;


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
            SET v_error_code = "tdsecuT.6.106.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_成交证券持仓明细变化出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_查询操作员券源限额设置流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_QueryOporStockLimitJour;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_QueryOporStockLimitJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_query_opor_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_query_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_allow_opor_no_str varchar(2048);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_查询操作员券源限额设置流水】*/
    call db_tdsecu.pra_tdset0_QueryOporStockLimitJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_query_opor_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_stock_code,
        v_exch_no,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_row_id,
        v_row_count,
        v_allow_opor_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.107.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_查询操作员券源限额设置流水出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_查询操作员券源限额设置流水历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_QueryOporStockLimitJourHis;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_QueryOporStockLimitJourHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_query_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_allow_opor_no_str varchar(2048);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdsecuT.6.108.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@开始日期#>@结束日期#][254][@开始日期#,@结束日期#] */
    if v_begin_date>v_end_date then
        
        SET v_error_code = "tdsecuT.6.108.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][concat("查询日期间隔不允许超过三个月!",@开始日期#,@结束日期#)] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdsecuT.6.108.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询日期间隔不允许超过三个月!",v_begin_date,v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询日期间隔不允许超过三个月!",v_begin_date,v_end_date);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_交易证券_T0_查询操作员券源限额设置流水历史】*/
    call db_tdsecu.pra_tdset0_QueryOporStockLimitJourHis(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_query_opor_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_stock_code,
        v_exch_no,
        v_begin_date,
        v_end_date,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_row_id,
        v_row_count,
        v_allow_opor_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.108.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_查询操作员券源限额设置流水历史出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_持仓反向平仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_PosiReverseClose;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_PosiReverseClose(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_close_posi_price decimal(16,9),
    IN p_close_posi_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
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
    declare v_row_id bigint;
    declare v_close_posi_price decimal(16,9);
    declare v_close_posi_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
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
    SET v_row_id = p_row_id;
    SET v_close_posi_price = p_close_posi_price;
    SET v_close_posi_qty = p_close_posi_qty;
    SET v_all_fee = p_all_fee;
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_持仓反向平仓】*/
        call db_tdsecu.pra_tdset0_PosiReverseClose(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_close_posi_price,
            v_close_posi_qty,
            v_all_fee,
            v_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.30.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_持仓反向平仓出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_更新操作员可用交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_UpdateOporAllowExchGroupCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_UpdateOporAllowExchGroupCapit(
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
    IN p_busi_opor_no int,
    IN p_exch_crncy_type varchar(3),
    IN p_curr_amt decimal(18,4),
    IN p_frozen_amt decimal(18,4),
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
    declare v_busi_opor_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_curr_amt = p_curr_amt;
    SET v_frozen_amt = p_frozen_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_更新操作员可用交易组资金】*/
        call db_tdsecu.pra_tdset0_UpdateOporAllowExchGroupCapit(
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
            v_busi_opor_no,
            v_exch_crncy_type,
            v_curr_amt,
            v_frozen_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.31.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_更新操作员可用交易组资金出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_删除操作员可用交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_DeleteOporAllowExchGroupCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_DeleteOporAllowExchGroupCapit(
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
    IN p_busi_opor_no int,
    IN p_exch_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_busi_opor_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_删除操作员可用交易组资金】*/
        call db_tdsecu.pra_tdset0_DeleteOporAllowExchGroupCapit(
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
            v_busi_opor_no,
            v_exch_crncy_type,
            v_error_code,
            v_error_info,
            v_row_id,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.32.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_删除操作员可用交易组资金出现错误！',v_mysql_message);
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
    SET p_row_id = v_row_id;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_T0_查询操作员可用交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_QueryOporAllowExchGroupCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_QueryOporAllowExchGroupCapit(
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
    IN p_busi_opor_no int,
    IN p_exch_crncy_type varchar(3),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_busi_opor_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_allow_opor_no_str varchar(2048);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

        /* 调用【原子_交易证券_T0_查询操作员可用交易组资金】*/
        call db_tdsecu.pra_tdset0_QueryOporAllowExchGroupCapit(
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
            v_busi_opor_no,
            v_exch_crncy_type,
            v_row_id,
            v_row_count,
            v_allow_opor_no_str,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.33.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_查询操作员可用交易组资金出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_查询持仓作废流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_QueryPosiCancelJour;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_QueryPosiCancelJour(
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
    IN p_query_opor_no int,
    IN p_busi_opor_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_waste_date int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
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
    declare v_query_opor_no int;
    declare v_busi_opor_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_waste_date int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_waste_date = p_waste_date;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_查询持仓作废流水】*/
    call db_tdsecu.pra_tdset0_QueryPosiCancelJour(
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
        v_query_opor_no,
        v_busi_opor_no,
        v_exch_no,
        v_stock_code,
        v_waste_date,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_查询持仓作废流水出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_查询历史持仓作废流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_QueryPosiCancelJourHis;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_QueryPosiCancelJourHis(
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
    IN p_query_opor_no int,
    IN p_busi_opor_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_waste_date int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
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
    declare v_query_opor_no int;
    declare v_busi_opor_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_waste_date int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_waste_date = p_waste_date;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdsecuT.6.35.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@开始日期#>@结束日期#][254][@开始日期#,@结束日期#] */
    if v_begin_date>v_end_date then
        
        SET v_error_code = "tdsecuT.6.35.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][concat("查询日期间隔不允许超过三个月!",@开始日期#,@结束日期#)] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdsecuT.6.35.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询日期间隔不允许超过三个月!",v_begin_date,v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询日期间隔不允许超过三个月!",v_begin_date,v_end_date);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_交易证券_T0_查询历史持仓作废流水】*/
    call db_tdsecu.pra_tdset0_QueryPosiCancelJourHis(
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
        v_query_opor_no,
        v_busi_opor_no,
        v_exch_no,
        v_stock_code,
        v_waste_date,
        v_begin_date,
        v_end_date,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.35.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_查询历史持仓作废流水出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_设置操作员持仓市值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_SetOporPosiMarketValue;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_SetOporPosiMarketValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_max_posi_market_value decimal(18,4),
    IN p_remark_info varchar(255),
    IN p_allow_opor_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
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
    declare v_co_no int;
    declare v_busi_opor_no int;
    declare v_max_posi_market_value decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_allow_opor_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
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
    SET v_co_no = p_co_no;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_max_posi_market_value = p_max_posi_market_value;
    SET v_remark_info = p_remark_info;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [检查报错返回][ instr(@可操作操作员编号串#, concat(";",@业务操作员编号#,";"))=0][4][concat("不具有该操作员的操作权限!",@业务操作员编号#)] */
    if  instr(v_allow_opor_no_str, concat(";",v_busi_opor_no,";"))=0 then
        
        SET v_error_code = "tdsecuT.6.36.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("不具有该操作员的操作权限!",v_busi_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("不具有该操作员的操作权限!",v_busi_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


          /* 调用【原子_交易证券_T0_设置操作员持仓市值】*/
          call db_tdsecu.pra_tdset0_SetOporPosiMarketValue(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_co_no,
              v_busi_opor_no,
              v_max_posi_market_value,
              v_remark_info,
              v_error_code,
              v_error_info,
              v_row_id,
              v_update_times);
          if v_error_code = "1" then
              SET v_error_code = "tdsecuT.6.36.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_设置操作员持仓市值出现错误！',v_mysql_message);
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
    SET p_row_id = v_row_id;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_T0_删除操作员持仓市值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_DelOporPosiMarketValue;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_DelOporPosiMarketValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_busi_opor_no int,
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
    declare v_row_id bigint;
    declare v_busi_opor_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_删除操作员持仓市值】*/
        call db_tdsecu.pra_tdset0_DelOporPosiMarketValue(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_busi_opor_no,
            v_error_code,
            v_error_info,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.37.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_删除操作员持仓市值出现错误！',v_mysql_message);
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_T0_查询操作员持仓市值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_QueryOporPosiMarketValue;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_QueryOporPosiMarketValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_allow_opor_no_str varchar(2048);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_T0_查询操作员持仓市值】*/
    call db_tdsecu.pra_tdset0_QueryOporPosiMarketValue(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_busi_opor_no,
        v_row_id,
        v_row_count,
        v_allow_opor_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.6.38.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_查询操作员持仓市值出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_操作员券源变化更新已分配数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_OporStockOccurUpdateAssignedQty;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_OporStockOccurUpdateAssignedQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_source_stock_occur_qty decimal(18,2),
    IN p_row_id_str varchar(2048),
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
    declare v_source_stock_occur_qty decimal(18,2);
    declare v_row_id_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_split_str varchar(4);
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
    SET v_source_stock_occur_qty = p_source_stock_occur_qty;
    SET v_row_id_str = p_row_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_split_str = " ";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* set @分隔符# = ";"; */
    set v_split_str = ";";

    /* while LOCATE(@分隔符#,@记录序号串#)<>0   do */
    while LOCATE(v_split_str,v_row_id_str)<>0   do

        /* set @记录序号#=cast(substring(@记录序号串#,1,LOCATE(@分隔符#,@记录序号串#)-1) as SIGNED); */
        set v_row_id=cast(substring(v_row_id_str,1,LOCATE(v_split_str,v_row_id_str)-1) as SIGNED);

        /* [事务开始] */
        START TRANSACTION;


              /* 调用【原子_交易证券_T0_操作员券源变化更新已分配数量】*/
              call db_tdsecu.pra_tdset0_OporStockOccurUpdateAssignedQty(
                  v_opor_co_no,
                  v_opor_no,
                  v_oper_mac,
                  v_oper_ip_addr,
                  v_oper_info,
                  v_oper_way,
                  v_func_code,
                  v_source_stock_occur_qty,
                  v_row_id,
                  v_error_code,
                  v_error_info);
              if v_error_code = "1" then
                  SET v_error_code = "tdsecuT.6.39.999";
                  if v_mysql_message <> "" then
                       SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_操作员券源变化更新已分配数量出现错误！',v_mysql_message);
                  end if;
                  ROLLBACK;
                  leave label_pro;
              elseif v_error_code <> "0" then
                  ROLLBACK;
                  leave label_pro;
              end if;


        /* [事务结束] */
        COMMIT;


        /* set @记录序号串#=substring(@记录序号串#,LOCATE(@分隔符#,@记录序号串#)+1); */
        set v_row_id_str=substring(v_row_id_str,LOCATE(v_split_str,v_row_id_str)+1);
    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_T0_操作员阈值累计盈亏更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_UpdateOporTsholdSumPandl;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_UpdateOporTsholdSumPandl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_sum_realize_pandl decimal(18,4),
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
    declare v_sum_realize_pandl decimal(18,4);
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
    SET v_sum_realize_pandl = p_sum_realize_pandl;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_操作员阈值累计盈亏更新】*/
        call db_tdsecu.pra_tdset0_UpdateOporTsholdSumPandl(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_busi_opor_no,
            v_sum_realize_pandl,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.6.40.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_操作员阈值累计盈亏更新出现错误！',v_mysql_message);
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

# 事务_交易证券_T0_修改操作员券源T0买入方式
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdset0_ModiOporStockT0BuyType;;
DELIMITER ;;
CREATE PROCEDURE prt_tdset0_ModiOporStockT0BuyType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_t0_buy_type int,
    IN p_menu_no int,
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
    declare v_busi_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_t0_buy_type int;
    declare v_menu_no int;
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_t0_buy_type = p_t0_buy_type;
    SET v_menu_no = p_menu_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


         /* 调用【原子_交易证券_T0_修改操作员券源T0买入方式】*/
         call db_tdsecu.pra_tdset0_ModiOporStockT0BuyType(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_init_date,
             v_co_no,
             v_busi_opor_no,
             v_pd_no,
             v_exch_group_no,
             v_asset_acco_no,
             v_stock_acco_no,
             v_stock_code_no,
             v_t0_buy_type,
             v_menu_no,
             v_remark_info,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "tdsecuT.6.41.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_修改操作员券源T0买入方式出现错误！',v_mysql_message);
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


