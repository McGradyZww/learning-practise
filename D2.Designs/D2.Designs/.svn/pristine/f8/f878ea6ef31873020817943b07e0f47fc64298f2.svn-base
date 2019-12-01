DELIMITER ;;
use db_rpts;;

# 事务_报表_报表数据_更新报表产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_UpdateReportProductinfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_UpdateReportProductinfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_input_date int;
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
    SET v_input_date = p_input_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


           /* 调用【原子_报表_报表数据_更新报表产品信息】*/
           call db_rpts.pra_rptdata_UpdateReportProductinfo(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_input_date,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "rptT.2.1.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_更新报表产品信息出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询报表产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_QueryReportProductinfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_QueryReportProductinfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_pd_type int,
    IN p_pd_status_str varchar(64),
    IN p_borker_no int,
    IN p_broker_my_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_type int;
    declare v_pd_status_str varchar(64);
    declare v_borker_no int;
    declare v_broker_my_type int;
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
    SET v_pd_type = p_pd_type;
    SET v_pd_status_str = p_pd_status_str;
    SET v_borker_no = p_borker_no;
    SET v_broker_my_type = p_broker_my_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询报表产品信息】*/
    call db_rpts.pra_rptdata_QueryReportProductinfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_type,
        v_pd_status_str,
        v_borker_no,
        v_broker_my_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询报表产品信息出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_修改报表产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_ModiReportProductinfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_ModiReportProductinfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_risk_free_interest_rate decimal(18,12),
    IN p_follow_share decimal(18,2),
    IN p_warn_value decimal(18,4),
    IN p_stop_value decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_code varchar(32);
    declare v_risk_free_interest_rate decimal(18,12);
    declare v_follow_share decimal(18,2);
    declare v_warn_value decimal(18,4);
    declare v_stop_value decimal(18,4);
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
    SET v_pd_code = p_pd_code;
    SET v_risk_free_interest_rate = p_risk_free_interest_rate;
    SET v_follow_share = p_follow_share;
    SET v_warn_value = p_warn_value;
    SET v_stop_value = p_stop_value;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


           /* 调用【原子_报表_报表数据_修改报表产品信息】*/
           call db_rpts.pra_rptdata_ModiReportProductinfo(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_co_no,
               v_pd_code,
               v_risk_free_interest_rate,
               v_follow_share,
               v_warn_value,
               v_stop_value,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "rptT.2.3.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_修改报表产品信息出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_更新报表产品资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_UpdateProductAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_UpdateProductAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_input_date int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
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
    SET v_input_date = p_input_date;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


           /* 调用【原子_报表_报表数据_更新报表产品资产】*/
           call db_rpts.pra_rptdata_UpdateProductAsset(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_input_date,
               v_co_no,
               v_pd_code,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "rptT.2.4.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_更新报表产品资产出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_更新报表产品持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_UpdateProductStockhold;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_UpdateProductStockhold(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_input_date int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
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
    SET v_input_date = p_input_date;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


           /* 调用【原子_报表_报表数据_更新报表产品持仓】*/
           call db_rpts.pra_rptdata_UpdateProductStockhold(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_input_date,
               v_co_no,
               v_pd_code,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "rptT.2.5.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_更新报表产品持仓出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_计算单产品收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_CalcSingleProductProfit;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_CalcSingleProductProfit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_input_date int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
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
    SET v_input_date = p_input_date;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


           /* 调用【原子_报表_报表数据_计算单产品收益率】*/
           call db_rpts.pra_rptdata_CalcSingleProductProfit(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_input_date,
               v_co_no,
               v_pd_code,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "rptT.2.6.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_计算单产品收益率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_计算产品收益率分析
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_CalctProductProfitAnalysis;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_CalctProductProfitAnalysis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_input_date int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
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
    SET v_input_date = p_input_date;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


           /* 调用【原子_报表_报表数据_计算产品收益率分析】*/
           call db_rpts.pra_rptdata_CalctProductProfitAnalysis(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_input_date,
               v_co_no,
               v_pd_code,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "rptT.2.7.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_计算产品收益率分析出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_增加交易周信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_AddRptWeekTradeday;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_AddRptWeekTradeday(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_code varchar(32);
    declare v_begin_date int;
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
    SET v_pd_code = p_pd_code;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 事务_报表_报表数据_同步资管产品账户表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_ProductInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_ProductInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_code varchar(32);
    declare v_begin_date int;
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
    SET v_pd_code = p_pd_code;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @产品编码# = 0; */
    set v_pd_code = 0;

    /* set @开始日期# = 0; */
    set v_begin_date = 0;

    /* 调用【原子_报表_报表数据_同步资管产品账户表】*/
    call db_rpts.pra_rptdata_ProductInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_code,
        v_begin_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_同步资管产品账户表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_同步资管历史产品账户表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_ProductInfoHis;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_ProductInfoHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_code varchar(32);
    declare v_begin_date int;
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
    SET v_pd_code = p_pd_code;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_同步资管历史产品账户表】*/
    call db_rpts.pra_rptdata_ProductInfoHis(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_code,
        v_begin_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_同步资管历史产品账户表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_同步资管产品持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_ProductPosition;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_ProductPosition(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_begin_date int;
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
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @开始日期# = 0; */
    set v_begin_date = 0;

    /* 调用【原子_报表_报表数据_同步资管产品持仓表】*/
    call db_rpts.pra_rptdata_ProductPosition(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_begin_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_同步资管产品持仓表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_同步资管历史产品持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_ProductPositionHis;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_ProductPositionHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_code varchar(32);
    declare v_begin_date int;
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
    SET v_pd_code = p_pd_code;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @开始日期# = 0; */
    set v_begin_date = 0;

    /* 调用【原子_报表_报表数据_同步资管历史产品持仓表】*/
    call db_rpts.pra_rptdata_ProductPositionHis(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_code,
        v_begin_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_同步资管历史产品持仓表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_同步资管产品单元资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_PdAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_PdAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_begin_date int;
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
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @开始日期# = 0; */
    set v_begin_date = 0;

    /* 调用【原子_报表_报表数据_同步资管产品单元资金表】*/
    call db_rpts.pra_rptdata_PdAsset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_begin_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_同步资管产品单元资金表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_同步资管历史产品单元资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_PdAssetHis;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_PdAssetHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_code varchar(32);
    declare v_begin_date int;
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
    SET v_pd_code = p_pd_code;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_同步资管历史产品单元资金表】*/
    call db_rpts.pra_rptdata_PdAssetHis(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_code,
        v_begin_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_同步资管历史产品单元资金表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_同步资管证券行情表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_StockQuotation;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_StockQuotation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_code varchar(32);
    declare v_begin_date int;
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
    SET v_pd_code = p_pd_code;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_同步资管证券行情表】*/
    call db_rpts.pra_rptdata_StockQuotation(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_code,
        v_begin_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.15.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_同步资管证券行情表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_同步资管历史证券行情表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_StockQuotationHis;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_StockQuotationHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_code varchar(32);
    declare v_begin_date int;
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
    SET v_pd_code = p_pd_code;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 事务_报表_报表数据_同步资管证券订单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_SecuOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_SecuOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_begin_date int;
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
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_同步资管证券订单表】*/
    call db_rpts.pra_rptdata_SecuOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_begin_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.17.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_同步资管证券订单表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_同步资管证券成交表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_SecuExecution;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_SecuExecution(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_begin_date int;
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
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_同步资管证券成交表】*/
    call db_rpts.pra_rptdata_SecuExecution(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_begin_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.18.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_同步资管证券成交表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_新增报表产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Add_Rpt_Pd_Info;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Add_Rpt_Pd_Info(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_pd_name varchar(64),
    IN p_pd_flname varchar(255),
    IN p_pd_manager varchar(32),
    IN p_found_date int,
    IN p_pd_type int,
    IN p_apply_currency varchar(3),
    IN p_crncy_type varchar(3),
    IN p_first_asset decimal(18,4),
    IN p_first_amt decimal(18,4),
    IN p_pd_all_share decimal(18,2),
    IN p_curr_share decimal(18,2),
    IN p_pre_share decimal(18,2),
    IN p_his_max_per_nav decimal(18,4),
    IN p_pre_nav decimal(18,4),
    IN p_coust_full_name varchar(255),
    IN p_coust_acco varchar(16),
    IN p_coust_acco_name varchar(64),
    IN p_pd_status varchar(2),
    IN p_remark_info varchar(255),
    IN p_cost_calc_type int,
    IN p_risk_free_interest_rate decimal(18,12),
    IN p_allow_exch varchar(64),
    IN p_sys_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_no int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
    declare v_pd_name varchar(64);
    declare v_pd_flname varchar(255);
    declare v_pd_manager varchar(32);
    declare v_found_date int;
    declare v_pd_type int;
    declare v_apply_currency varchar(3);
    declare v_crncy_type varchar(3);
    declare v_first_asset decimal(18,4);
    declare v_first_amt decimal(18,4);
    declare v_pd_all_share decimal(18,2);
    declare v_curr_share decimal(18,2);
    declare v_pre_share decimal(18,2);
    declare v_his_max_per_nav decimal(18,4);
    declare v_pre_nav decimal(18,4);
    declare v_coust_full_name varchar(255);
    declare v_coust_acco varchar(16);
    declare v_coust_acco_name varchar(64);
    declare v_pd_status varchar(2);
    declare v_remark_info varchar(255);
    declare v_cost_calc_type int;
    declare v_risk_free_interest_rate decimal(18,12);
    declare v_allow_exch varchar(64);
    declare v_sys_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_pd_name = p_pd_name;
    SET v_pd_flname = p_pd_flname;
    SET v_pd_manager = p_pd_manager;
    SET v_found_date = p_found_date;
    SET v_pd_type = p_pd_type;
    SET v_apply_currency = p_apply_currency;
    SET v_crncy_type = p_crncy_type;
    SET v_first_asset = p_first_asset;
    SET v_first_amt = p_first_amt;
    SET v_pd_all_share = p_pd_all_share;
    SET v_curr_share = p_curr_share;
    SET v_pre_share = p_pre_share;
    SET v_his_max_per_nav = p_his_max_per_nav;
    SET v_pre_nav = p_pre_nav;
    SET v_coust_full_name = p_coust_full_name;
    SET v_coust_acco = p_coust_acco;
    SET v_coust_acco_name = p_coust_acco_name;
    SET v_pd_status = p_pd_status;
    SET v_remark_info = p_remark_info;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_risk_free_interest_rate = p_risk_free_interest_rate;
    SET v_allow_exch = p_allow_exch;
    SET v_sys_no = p_sys_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_新增报表产品信息】*/
    call db_rpts.pra_rptdata_Add_Rpt_Pd_Info(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_pd_no,
        v_co_no,
        v_pd_code,
        v_pd_name,
        v_pd_flname,
        v_pd_manager,
        v_found_date,
        v_pd_type,
        v_apply_currency,
        v_crncy_type,
        v_first_asset,
        v_first_amt,
        v_pd_all_share,
        v_curr_share,
        v_pre_share,
        v_his_max_per_nav,
        v_pre_nav,
        v_coust_full_name,
        v_coust_acco,
        v_coust_acco_name,
        v_pd_status,
        v_remark_info,
        v_cost_calc_type,
        v_risk_free_interest_rate,
        v_allow_exch,
        v_sys_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.19.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_新增报表产品信息出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询行业类别表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Industry;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Industry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_industry_std int,
    IN p_industry_classification int,
    IN p_industry_id int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_industry_std int;
    declare v_industry_classification int;
    declare v_industry_id int;
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
    SET v_industry_std = p_industry_std;
    SET v_industry_classification = p_industry_classification;
    SET v_industry_id = p_industry_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询行业类别表】*/
    call db_rpts.pra_rptdata_Qry_Industry(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_industry_std,
        v_industry_classification,
        v_industry_id,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询行业类别表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询行业证券表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Industry_Stock;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Industry_Stock(
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
    IN p_asset_type int,
    IN p_industry_std int,
    IN p_industry_classification int,
    IN p_industry_id int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_asset_type int;
    declare v_industry_std int;
    declare v_industry_classification int;
    declare v_industry_id int;
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
    SET v_asset_type = p_asset_type;
    SET v_industry_std = p_industry_std;
    SET v_industry_classification = p_industry_classification;
    SET v_industry_id = p_industry_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询行业证券表】*/
    call db_rpts.pra_rptdata_Qry_Industry_Stock(
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
        v_asset_type,
        v_industry_std,
        v_industry_classification,
        v_industry_id,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询行业证券表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_初始化产品初始化
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_Pd;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_Pd(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_last_init_date int,
    IN p_init_date int,
    IN p_co_no int,
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
    declare v_last_init_date int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_next_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_last_init_date = p_last_init_date;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_next_init_date = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* set @上日初始化日期# = ifnull(@上日初始化日期#,0); */
    set v_last_init_date = ifnull(v_last_init_date,0);

    /* if (@上日初始化日期#=0) then */
    if (v_last_init_date=0) then

    /* 调用【原子_报表_报表基础_查询系统初始化日期】*/
    call db_rpts.pra_rpt_Qry_Sys_Initdate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date,
        v_last_init_date,
        v_next_init_date);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.50.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表基础_查询系统初始化日期出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;

    end if;

    /* 调用【原子_报表_报表数据_每日计算产品持仓市值】*/
    call db_rpts.pra_rptdata_Calc_Pd_StockValue(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.50.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_每日计算产品持仓市值出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* 调用【原子_报表_报表数据_备份数据产品资产表】*/
    call db_rpts.pra_rptdata_Backup_Pd_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_last_init_date,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.50.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_备份数据产品资产表出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* 调用【原子_报表_报表数据_备份数据产品持仓表】*/
    call db_rpts.pra_rptdata_Backup_Pd_Posi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_last_init_date,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.50.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_备份数据产品持仓表出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* 调用【原子_报表_报表数据_备份数据产品自定义资产】*/
    call db_rpts.pra_rptdata_Backup_Pd_Def_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_last_init_date,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.50.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_备份数据产品自定义资产出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* 调用【原子_报表_报表数据_初始化产品资产表】*/
    call db_rpts.pra_rptdata_Init_Pd_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_last_init_date,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.50.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_初始化产品资产表出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* 调用【原子_报表_报表数据_初始化产品持仓表】*/
    call db_rpts.pra_rptdata_Init_Pd_Posi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_last_init_date,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.50.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_初始化产品持仓表出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;

    #step4:初始化--更新日期

    /* 调用【原子_报表_报表数据_初始化产品自定义资产】*/
    call db_rpts.pra_rptdata_Init_Pd_Def_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_last_init_date,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.50.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_初始化产品自定义资产出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_备份数据产品资产表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Backup_Pd_Asset;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Backup_Pd_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_last_init_date int,
    IN p_init_date int,
    IN p_co_no int,
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
    declare v_last_init_date int;
    declare v_init_date int;
    declare v_co_no int;
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
    SET v_last_init_date = p_last_init_date;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_备份数据产品资产表】*/
    call db_rpts.pra_rptdata_Backup_Pd_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_last_init_date,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.51.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_备份数据产品资产表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_备份数据产品持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Backup_Pd_Posi;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Backup_Pd_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_last_init_date int,
    IN p_init_date int,
    IN p_co_no int,
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
    declare v_last_init_date int;
    declare v_init_date int;
    declare v_co_no int;
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
    SET v_last_init_date = p_last_init_date;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_备份数据产品持仓表】*/
    call db_rpts.pra_rptdata_Backup_Pd_Posi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_last_init_date,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.52.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_备份数据产品持仓表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_每日计算产品持仓市值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Calc_Pd_StockValue;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Calc_Pd_StockValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    declare v_co_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #part1: 计算持仓市值

    /* 调用【原子_报表_报表数据_每日计算产品持仓市值】*/
    call db_rpts.pra_rptdata_Calc_Pd_StockValue(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.53.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_每日计算产品持仓市值出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_备份数据产品订单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Backup_Pd_SecuOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Backup_Pd_SecuOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_last_init_date int,
    IN p_init_date int,
    IN p_co_no int,
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
    declare v_last_init_date int;
    declare v_init_date int;
    declare v_co_no int;
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
    SET v_last_init_date = p_last_init_date;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_备份数据产品订单表】*/
    call db_rpts.pra_rptdata_Backup_Pd_SecuOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_last_init_date,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.54.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_备份数据产品订单表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_备份数据产品成交表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Backup_Pd_SecuExecution;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Backup_Pd_SecuExecution(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_last_init_date int,
    IN p_init_date int,
    IN p_co_no int,
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
    declare v_last_init_date int;
    declare v_init_date int;
    declare v_co_no int;
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
    SET v_last_init_date = p_last_init_date;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_备份数据产品成交表】*/
    call db_rpts.pra_rptdata_Backup_Pd_SecuExecution(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_last_init_date,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.55.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_备份数据产品成交表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_备份数据产品自定义资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Backup_Pd_Def_Asset;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Backup_Pd_Def_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_last_init_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @上日初始化日期# = 0; */
    set v_last_init_date = 0;

    /* set @初始化日期# = 0; */
    set v_init_date = 0;

    /* 调用【原子_报表_报表数据_备份数据产品自定义资产】*/
    call db_rpts.pra_rptdata_Backup_Pd_Def_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_last_init_date,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.56.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_备份数据产品自定义资产出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_同步并计算产品所有信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_SyncAndCalc_Pd_All_Info;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_SyncAndCalc_Pd_All_Info(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_last_init_date int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_last_init_date int;
    declare v_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_code varchar(32);
    declare v_begin_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_last_init_date = p_last_init_date;
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_code = " ";
    SET v_begin_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @上日初始化日期# = 0; */
    set v_last_init_date = 0;

    /* set @产品编码# = " "; */
    set v_pd_code = " ";

    /* set @开始日期# = 0; */
    set v_begin_date = 0;

    /* [事务开始] */
    START TRANSACTION;


    /* set @机构编号# = if(ifnull(@机构编号#,0)=0,@操作员机构编号#,@机构编号#); */
    set v_co_no = if(ifnull(v_co_no,0)=0,v_opor_co_no,v_co_no);

    /* set @上日初始化日期# = ifnull(@上日初始化日期#,0); */
    set v_last_init_date = ifnull(v_last_init_date,0);

    /* 调用【原子_报表_报表数据_同步资管产品账户表】*/
    call db_rpts.pra_rptdata_ProductInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_code,
        v_begin_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.100.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_同步资管产品账户表出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* set @开始日期# = 0; */
    set v_begin_date = 0;

    /* 调用【原子_报表_报表数据_同步资管产品单元资金表】*/
    call db_rpts.pra_rptdata_PdAsset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_begin_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.100.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_同步资管产品单元资金表出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* set @开始日期# = 0; */
    set v_begin_date = 0;

    /* 调用【原子_报表_报表数据_同步资管产品持仓表】*/
    call db_rpts.pra_rptdata_ProductPosition(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_begin_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.100.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_同步资管产品持仓表出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* 调用【原子_报表_报表数据_每日计算产品持仓市值】*/
    call db_rpts.pra_rptdata_Calc_Pd_StockValue(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.100.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_每日计算产品持仓市值出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* 调用【原子_报表_报表数据_备份数据产品资产表】*/
    call db_rpts.pra_rptdata_Backup_Pd_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_last_init_date,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.100.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_备份数据产品资产表出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* 调用【原子_报表_报表数据_备份数据产品持仓表】*/
    call db_rpts.pra_rptdata_Backup_Pd_Posi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_last_init_date,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.100.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_备份数据产品持仓表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询机构自定义资产类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Co_Def_AssetType;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Co_Def_AssetType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_def_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_def_type int;
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
    SET v_def_type = p_def_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询机构自定义资产类型】*/
    call db_rpts.pra_rptdata_Qry_Co_Def_AssetType(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_def_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.61.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询机构自定义资产类型出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_修改产品自定义资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Modi_Pd_Def_Asset;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Modi_Pd_Def_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_def_asset_type int,
    IN p_def_type int,
    IN p_def_asset_field int,
    IN p_asset_value decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_input_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_def_asset_type int;
    declare v_def_type int;
    declare v_def_asset_field int;
    declare v_asset_value decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_last_init_date int;
    declare v_next_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_input_date = p_input_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_def_asset_type = p_def_asset_type;
    SET v_def_type = p_def_type;
    SET v_def_asset_field = p_def_asset_field;
    SET v_asset_value = p_asset_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');
    SET v_next_init_date = 0;

    
    label_pro:BEGIN
    

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* set @初始化日期# = 0; */
    set v_init_date = 0;

    /* 调用【原子_报表_报表基础_查询系统初始化日期】*/
    call db_rpts.pra_rpt_Qry_Sys_Initdate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date,
        v_last_init_date,
        v_next_init_date);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.62.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表基础_查询系统初始化日期出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_报表_报表数据_修改产品自定义资产】*/
    call db_rpts.pra_rptdata_Modi_Pd_Def_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_input_date,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_def_asset_type,
        v_def_asset_field,
        v_def_type,
        v_asset_value,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.62.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_修改产品自定义资产出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询产品自定义资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_Def_Asset;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_Def_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_pd_no int,
    IN p_def_asset_type int,
    IN p_def_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_input_date int;
    declare v_pd_no int;
    declare v_def_asset_type int;
    declare v_def_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_last_init_date int;
    declare v_next_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_input_date = p_input_date;
    SET v_pd_no = p_pd_no;
    SET v_def_asset_type = p_def_asset_type;
    SET v_def_type = p_def_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');
    SET v_next_init_date = 0;

    
    label_pro:BEGIN
    

    /* set @初始化日期# = 0; */
    set v_init_date = 0;

    /* 调用【原子_报表_报表基础_查询系统初始化日期】*/
    call db_rpts.pra_rpt_Qry_Sys_Initdate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date,
        v_last_init_date,
        v_next_init_date);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.63.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表基础_查询系统初始化日期出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @初始化日期# = 0; */
    set v_init_date = 0;

    /* 调用【原子_报表_报表数据_查询产品自定义资产】*/
    call db_rpts.pra_rptdata_Qry_Pd_Def_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_input_date,
        v_pd_no,
        v_def_asset_type,
        v_def_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.63.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询产品自定义资产出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_计算产品自定义资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Calc_Pd_Def_Asset;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Calc_Pd_Def_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_pd_no int,
    IN p_def_asset_type int,
    IN p_def_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_input_date int;
    declare v_pd_no int;
    declare v_def_asset_type int;
    declare v_def_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_last_init_date int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_calc_time int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_input_date = p_input_date;
    SET v_pd_no = p_pd_no;
    SET v_def_asset_type = p_def_asset_type;
    SET v_def_type = p_def_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_calc_time = 0;

    
    label_pro:BEGIN
    

    /* set @上日初始化日期# = 0; */
    set v_last_init_date = 0;

    /* set @初始化日期# = 0; */
    set v_init_date = 0;

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* set @定义类型# = 1; */
    set v_def_type = 1;
    #step1:归档前--计算

    /* set @计算时点# = 1; */
    set v_calc_time = 1;

    /* 调用【原子_报表_报表数据_计算产品自定义资产】*/
    call db_rpts.pra_rptdata_Calc_Pd_Def_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_input_date,
        v_co_no,
        v_pd_no,
        v_calc_time,
        v_def_asset_type,
        v_def_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.64.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_计算产品自定义资产出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #step2:归档

    /* 调用【原子_报表_报表数据_备份数据产品自定义资产】*/
    call db_rpts.pra_rptdata_Backup_Pd_Def_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_last_init_date,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.64.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_备份数据产品自定义资产出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #step3:归档后--计算｛20日均值，昨日净值｝

    /* set @计算时点# = 2; */
    set v_calc_time = 2;

    /* 调用【原子_报表_报表数据_计算产品自定义资产】*/
    call db_rpts.pra_rptdata_Calc_Pd_Def_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_input_date,
        v_co_no,
        v_pd_no,
        v_calc_time,
        v_def_asset_type,
        v_def_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.64.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_计算产品自定义资产出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_定时任务计算产品自定义资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Task_Calc_Pd_Def_Asset;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Task_Calc_Pd_Def_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_pd_no int,
    IN p_def_asset_type int,
    IN p_def_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_input_date int;
    declare v_pd_no int;
    declare v_def_asset_type int;
    declare v_def_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_last_init_date int;
    declare v_next_init_date int;
    declare v_co_no int;
    declare v_calc_time int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_input_date = p_input_date;
    SET v_pd_no = p_pd_no;
    SET v_def_asset_type = p_def_asset_type;
    SET v_def_type = p_def_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');
    SET v_next_init_date = 0;
    SET v_co_no = 0;
    SET v_calc_time = 0;

    
    label_pro:BEGIN
    

    /* set @初始化日期# = 0; */
    set v_init_date = 0;

    /* set @上日初始化日期# = 0; */
    set v_last_init_date = 0;
    #定时任务增加默认参数值

    /* set @传入日期# = ifnull(@传入日期#,0),@产品编号# = ifnull(@产品编号#,0),@资产定义类型# = ifnull(@资产定义类型#,0),@定义类型# = ifnull(@定义类型#,0); */
    set v_input_date = ifnull(v_input_date,0),v_pd_no = ifnull(v_pd_no,0),v_def_asset_type = ifnull(v_def_asset_type,0),v_def_type = ifnull(v_def_type,0);

    /* set @上日初始化日期# = ifnull(@上日初始化日期#,0); */
    set v_last_init_date = ifnull(v_last_init_date,0);

    /* if (@上日初始化日期#=0) then */
    if (v_last_init_date=0) then

    /* 调用【原子_报表_报表基础_查询系统初始化日期】*/
    call db_rpts.pra_rpt_Qry_Sys_Initdate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date,
        v_last_init_date,
        v_next_init_date);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.65.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表基础_查询系统初始化日期出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    end if;

    /* set @机构编号# =0; */
    set v_co_no =0;

    /* set @定义类型# = 1; */
    set v_def_type = 1;
    #step1:归档前--计算

    /* set @计算时点# = 1; */
    set v_calc_time = 1;

    /* 调用【原子_报表_报表数据_计算产品自定义资产】*/
    call db_rpts.pra_rptdata_Calc_Pd_Def_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_input_date,
        v_co_no,
        v_pd_no,
        v_calc_time,
        v_def_asset_type,
        v_def_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.65.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_计算产品自定义资产出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #step2:归档

    /* 调用【原子_报表_报表数据_备份数据产品自定义资产】*/
    call db_rpts.pra_rptdata_Backup_Pd_Def_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_last_init_date,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.65.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_备份数据产品自定义资产出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #step3:归档后--计算｛20日均值，昨日净值｝

    /* set @计算时点# = 2; */
    set v_calc_time = 2;

    /* 调用【原子_报表_报表数据_计算产品自定义资产】*/
    call db_rpts.pra_rptdata_Calc_Pd_Def_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_input_date,
        v_co_no,
        v_pd_no,
        v_calc_time,
        v_def_asset_type,
        v_def_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.65.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_计算产品自定义资产出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询机构自定义资产字段列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Co_Def_Asset_Fields;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Co_Def_Asset_Fields(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_def_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_def_type int;
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
    SET v_def_type = p_def_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询机构自定义资产字段列表】*/
    call db_rpts.pra_rptdata_Qry_Co_Def_Asset_Fields(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_def_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.66.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询机构自定义资产字段列表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_产品执行SQL
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Pd_Execute_Sql;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Pd_Execute_Sql(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_pd_no int,
    IN p_sql_grp_no_str varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_input_date int;
    declare v_pd_no int;
    declare v_sql_grp_no_str varchar(255);
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
    SET v_input_date = p_input_date;
    SET v_pd_no = p_pd_no;
    SET v_sql_grp_no_str = p_sql_grp_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_产品执行SQL】*/
    call db_rpts.pra_rptdata_Pd_Execute_Sql(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_input_date,
        v_pd_no,
        v_sql_grp_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.67.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_产品执行SQL出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询调用命令表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Basic_Cmd;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Basic_Cmd(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_cmd_id int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_cmd_id int;
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
    SET v_cmd_id = p_cmd_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_查询调用命令表】*/
    call db_rpts.pra_rptdata_Qry_Basic_Cmd(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_cmd_id,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.68.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询调用命令表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询同步状态表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Basic_SyncInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Basic_SyncInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_no int,
    IN p_sync_name varchar(64),
    IN p_target_db_name varchar(64),
    IN p_target_table_name varchar(64),
    IN p_source_db_name varchar(64),
    IN p_source_table_name varchar(64),
    IN p_sync_type int,
    IN p_sync_status int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_sync_no int;
    declare v_sync_name varchar(64);
    declare v_target_db_name varchar(64);
    declare v_target_table_name varchar(64);
    declare v_source_db_name varchar(64);
    declare v_source_table_name varchar(64);
    declare v_sync_type int;
    declare v_sync_status int;
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
    SET v_sync_no = p_sync_no;
    SET v_sync_name = p_sync_name;
    SET v_target_db_name = p_target_db_name;
    SET v_target_table_name = p_target_table_name;
    SET v_source_db_name = p_source_db_name;
    SET v_source_table_name = p_source_table_name;
    SET v_sync_type = p_sync_type;
    SET v_sync_status = p_sync_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_查询同步状态表】*/
    call db_rpts.pra_rptdata_Qry_Basic_SyncInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_sync_no,
        v_sync_name,
        v_target_db_name,
        v_target_table_name,
        v_source_db_name,
        v_source_table_name,
        v_sync_type,
        v_sync_status,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.69.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询同步状态表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_修改交易组附加属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Modi_Exgp_Ex_Info;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Modi_Exgp_Ex_Info(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_first_asset decimal(18,4),
    IN p_first_amt decimal(18,4),
    IN p_curr_share decimal(18,2),
    IN p_strategy_type int,
    IN p_total_pre_fee decimal(18,4),
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_first_asset decimal(18,4);
    declare v_first_amt decimal(18,4);
    declare v_curr_share decimal(18,2);
    declare v_strategy_type int;
    declare v_total_pre_fee decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_first_asset = p_first_asset;
    SET v_first_amt = p_first_amt;
    SET v_curr_share = p_curr_share;
    SET v_strategy_type = p_strategy_type;
    SET v_total_pre_fee = p_total_pre_fee;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* set @原始资产# = ifnull(@原始资产#,0); */
    set v_first_asset = ifnull(v_first_asset,0);

    /* set @原始金额# = ifnull(@原始金额#,0); */
    set v_first_amt = ifnull(v_first_amt,0);

    /* set @当前份额# = ifnull(@当前份额#,0); */
    set v_curr_share = ifnull(v_curr_share,0);

    /* set @累计计提费用# = ifnull(@累计计提费用#,0); */
    set v_total_pre_fee = ifnull(v_total_pre_fee,0);

    /* set @备注信息# = ifnull(@备注信息#," "); */
    set v_remark_info = ifnull(v_remark_info," ");

    /* 调用【原子_报表_报表数据_修改交易组附加属性】*/
    call db_rpts.pra_rptdata_Modi_Exgp_Ex_Info(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_co_no,
        v_exch_group_no,
        v_first_asset,
        v_first_amt,
        v_curr_share,
        v_strategy_type,
        v_total_pre_fee,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.101.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_修改交易组附加属性出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询产品区间统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_Region_Stat;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_Region_Stat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_curr_month int,
    IN p_region_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_curr_month int;
    declare v_region_type int;
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
    SET v_curr_month = p_curr_month;
    SET v_region_type = p_region_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询产品区间统计】*/
    call db_rpts.pra_rptdata_Qry_Pd_Region_Stat(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_curr_month,
        v_region_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.151.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询产品区间统计出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询指数区间统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Index_Region_Stat;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Index_Region_Stat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_indicator_id int,
    IN p_curr_month int,
    IN p_region_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_indicator_id int;
    declare v_curr_month int;
    declare v_region_type int;
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
    SET v_indicator_id = p_indicator_id;
    SET v_curr_month = p_curr_month;
    SET v_region_type = p_region_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询指数区间统计】*/
    call db_rpts.pra_rptdata_Qry_Index_Region_Stat(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_indicator_id,
        v_curr_month,
        v_region_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.152.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询指数区间统计出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询产品指数区间统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_Index_Region_Stat;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_Index_Region_Stat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_curr_month int,
    IN p_region_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_curr_month int;
    declare v_region_type int;
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
    SET v_curr_month = p_curr_month;
    SET v_region_type = p_region_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询产品指数区间统计】*/
    call db_rpts.pra_rptdata_Qry_Pd_Index_Region_Stat(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_curr_month,
        v_region_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.153.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询产品指数区间统计出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询产品区间指标
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_Region_Indicator;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_Region_Indicator(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_curr_month int,
    IN p_region_type int,
    IN p_indicator_id int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_curr_month int;
    declare v_region_type int;
    declare v_indicator_id int;
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
    SET v_curr_month = p_curr_month;
    SET v_region_type = p_region_type;
    SET v_indicator_id = p_indicator_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询产品区间指标】*/
    call db_rpts.pra_rptdata_Qry_Pd_Region_Indicator(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_curr_month,
        v_region_type,
        v_indicator_id,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.154.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询产品区间指标出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询指数区间指标
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Index_Region_Indicator;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Index_Region_Indicator(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_curr_month int,
    IN p_region_type int,
    IN p_indicator_id int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_curr_month int;
    declare v_region_type int;
    declare v_indicator_id int;
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
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_curr_month = p_curr_month;
    SET v_region_type = p_region_type;
    SET v_indicator_id = p_indicator_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询指数区间指标】*/
    call db_rpts.pra_rptdata_Qry_Index_Region_Indicator(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code,
        v_exch_no,
        v_curr_month,
        v_region_type,
        v_indicator_id,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.155.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询指数区间指标出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询产品业绩基准区间指标
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_Std_Region_Indicator;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_Std_Region_Indicator(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_curr_month int,
    IN p_region_type int,
    IN p_indicator_id int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_curr_month int;
    declare v_region_type int;
    declare v_indicator_id int;
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
    SET v_curr_month = p_curr_month;
    SET v_region_type = p_region_type;
    SET v_indicator_id = p_indicator_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询产品业绩基准区间指标】*/
    call db_rpts.pra_rptdata_Qry_Pd_Std_Region_Indicator(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_curr_month,
        v_region_type,
        v_indicator_id,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.156.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询产品业绩基准区间指标出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_新增产品日净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Add_Pd_Day_Net;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Add_Pd_Day_Net(
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
    IN p_share_net decimal(18,4),
    IN p_last_share_net decimal(18,4),
    IN p_share_net_total decimal(18,4),
    IN p_pre_share_net_total decimal(18,4),
    IN p_net_change decimal(18,4),
    IN p_grp_row bigint,
    IN p_nav_asset decimal(18,4),
    IN p_asset_market_value decimal(18,4),
    IN p_fund_share_total decimal(18,2),
    IN p_fund_asset_net decimal(18,4),
    IN p_pre_fee_share_net_total decimal(18,4),
    IN p_post_fee_share_net_total decimal(18,4),
    IN p_achieve_performance decimal(18,4),
    IN p_recover_param decimal(18,12),
    IN p_last_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_share_net decimal(18,4);
    declare v_last_share_net decimal(18,4);
    declare v_share_net_total decimal(18,4);
    declare v_pre_share_net_total decimal(18,4);
    declare v_net_change decimal(18,4);
    declare v_grp_row bigint;
    declare v_nav_asset decimal(18,4);
    declare v_asset_market_value decimal(18,4);
    declare v_fund_share_total decimal(18,2);
    declare v_fund_asset_net decimal(18,4);
    declare v_pre_fee_share_net_total decimal(18,4);
    declare v_post_fee_share_net_total decimal(18,4);
    declare v_achieve_performance decimal(18,4);
    declare v_recover_param decimal(18,12);
    declare v_last_init_date int;
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
    SET v_share_net = p_share_net;
    SET v_last_share_net = p_last_share_net;
    SET v_share_net_total = p_share_net_total;
    SET v_pre_share_net_total = p_pre_share_net_total;
    SET v_net_change = p_net_change;
    SET v_grp_row = p_grp_row;
    SET v_nav_asset = p_nav_asset;
    SET v_asset_market_value = p_asset_market_value;
    SET v_fund_share_total = p_fund_share_total;
    SET v_fund_asset_net = p_fund_asset_net;
    SET v_pre_fee_share_net_total = p_pre_fee_share_net_total;
    SET v_post_fee_share_net_total = p_post_fee_share_net_total;
    SET v_achieve_performance = p_achieve_performance;
    SET v_recover_param = p_recover_param;
    SET v_last_init_date = p_last_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_新增产品日净值】*/
    call db_rpts.pra_rptdata_Add_Pd_Day_Net(
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
        v_share_net,
        v_last_share_net,
        v_share_net_total,
        v_pre_share_net_total,
        v_net_change,
        v_grp_row,
        v_nav_asset,
        v_asset_market_value,
        v_fund_share_total,
        v_fund_asset_net,
        v_pre_fee_share_net_total,
        v_post_fee_share_net_total,
        v_achieve_performance,
        v_recover_param,
        v_last_init_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.157.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_新增产品日净值出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_删除产品日净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Del_Pd_Day_Net;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Del_Pd_Day_Net(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_删除产品日净值】*/
    call db_rpts.pra_rptdata_Del_Pd_Day_Net(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.158.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_删除产品日净值出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_修改产品日净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Modi_Pd_Day_Net;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Modi_Pd_Day_Net(
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
    IN p_share_net decimal(18,4),
    IN p_last_share_net decimal(18,4),
    IN p_share_net_total decimal(18,4),
    IN p_pre_share_net_total decimal(18,4),
    IN p_net_change decimal(18,4),
    IN p_grp_row bigint,
    IN p_nav_asset decimal(18,4),
    IN p_asset_market_value decimal(18,4),
    IN p_fund_share_total decimal(18,2),
    IN p_fund_asset_net decimal(18,4),
    IN p_pre_fee_share_net_total decimal(18,4),
    IN p_post_fee_share_net_total decimal(18,4),
    IN p_achieve_performance decimal(18,4),
    IN p_recover_param decimal(18,12),
    IN p_last_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_share_net decimal(18,4);
    declare v_last_share_net decimal(18,4);
    declare v_share_net_total decimal(18,4);
    declare v_pre_share_net_total decimal(18,4);
    declare v_net_change decimal(18,4);
    declare v_grp_row bigint;
    declare v_nav_asset decimal(18,4);
    declare v_asset_market_value decimal(18,4);
    declare v_fund_share_total decimal(18,2);
    declare v_fund_asset_net decimal(18,4);
    declare v_pre_fee_share_net_total decimal(18,4);
    declare v_post_fee_share_net_total decimal(18,4);
    declare v_achieve_performance decimal(18,4);
    declare v_recover_param decimal(18,12);
    declare v_last_init_date int;
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
    SET v_share_net = p_share_net;
    SET v_last_share_net = p_last_share_net;
    SET v_share_net_total = p_share_net_total;
    SET v_pre_share_net_total = p_pre_share_net_total;
    SET v_net_change = p_net_change;
    SET v_grp_row = p_grp_row;
    SET v_nav_asset = p_nav_asset;
    SET v_asset_market_value = p_asset_market_value;
    SET v_fund_share_total = p_fund_share_total;
    SET v_fund_asset_net = p_fund_asset_net;
    SET v_pre_fee_share_net_total = p_pre_fee_share_net_total;
    SET v_post_fee_share_net_total = p_post_fee_share_net_total;
    SET v_achieve_performance = p_achieve_performance;
    SET v_recover_param = p_recover_param;
    SET v_last_init_date = p_last_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_修改产品日净值】*/
    call db_rpts.pra_rptdata_Modi_Pd_Day_Net(
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
        v_share_net,
        v_last_share_net,
        v_share_net_total,
        v_pre_share_net_total,
        v_net_change,
        v_grp_row,
        v_nav_asset,
        v_asset_market_value,
        v_fund_share_total,
        v_fund_asset_net,
        v_pre_fee_share_net_total,
        v_post_fee_share_net_total,
        v_achieve_performance,
        v_recover_param,
        v_last_init_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.159.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_修改产品日净值出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询产品日净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_Day_Net;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_Day_Net(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
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
    declare v_query_region_type int;
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
    SET v_query_region_type = p_query_region_type;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询产品日净值】*/
    call db_rpts.pra_rptdata_Qry_Pd_Day_Net(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_query_region_type,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.160.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询产品日净值出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_初始化产品日收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_Pd_Day_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_Pd_Day_NAV_Rate(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_初始化产品日收益率】*/
    call db_rpts.pra_rptdata_Init_Pd_Day_NAV_Rate(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.161.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_初始化产品日收益率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_初始化指数日收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_Index_Day_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_Index_Day_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_init_date int;
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
    SET v_init_date = p_init_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_初始化指数日收益率】*/
    call db_rpts.pra_rptdata_Init_Index_Day_NAV_Rate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_stock_code_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.162.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_初始化指数日收益率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_初始化产品周收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_Pd_Week_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_Pd_Week_NAV_Rate(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_初始化产品周收益率】*/
    call db_rpts.pra_rptdata_Init_Pd_Week_NAV_Rate(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.163.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_初始化产品周收益率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_初始化指数周收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_Index_Week_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_Index_Week_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_init_date int;
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
    SET v_init_date = p_init_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_初始化指数周收益率】*/
    call db_rpts.pra_rptdata_Init_Index_Week_NAV_Rate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_stock_code_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.164.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_初始化指数周收益率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_初始化产品月收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_Pd_Month_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_Pd_Month_NAV_Rate(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_初始化产品月收益率】*/
    call db_rpts.pra_rptdata_Init_Pd_Month_NAV_Rate(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.165.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_初始化产品月收益率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_初始化指数月收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_Index_Month_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_Index_Month_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_init_date int;
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
    SET v_init_date = p_init_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_初始化指数月收益率】*/
    call db_rpts.pra_rptdata_Init_Index_Month_NAV_Rate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_stock_code_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.166.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_初始化指数月收益率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询产品日收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_Day_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_Day_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_co_no int,
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
    declare v_co_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询产品日收益率】*/
    call db_rpts.pra_rptdata_Qry_Pd_Day_NAV_Rate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.181.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询产品日收益率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询指数日收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Index_Day_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Index_Day_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询指数日收益率】*/
    call db_rpts.pra_rptdata_Qry_Index_Day_NAV_Rate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_stock_code_no,
        v_stock_code,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.182.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询指数日收益率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询产品周收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_Week_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_Week_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_co_no int,
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
    declare v_co_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询产品周收益率】*/
    call db_rpts.pra_rptdata_Qry_Pd_Week_NAV_Rate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.183.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询产品周收益率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询指数周收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Index_Week_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Index_Week_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询指数周收益率】*/
    call db_rpts.pra_rptdata_Qry_Index_Week_NAV_Rate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_stock_code_no,
        v_stock_code,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.184.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询指数周收益率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询产品月收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_Month_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_Month_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_co_no int,
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
    declare v_co_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询产品月收益率】*/
    call db_rpts.pra_rptdata_Qry_Pd_Month_NAV_Rate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.185.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询产品月收益率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询指数月收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Index_Month_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Index_Month_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询指数月收益率】*/
    call db_rpts.pra_rptdata_Qry_Index_Month_NAV_Rate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_stock_code_no,
        v_stock_code,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.186.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询指数月收益率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_月报处理产品收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_MonthRpt_Pd_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_MonthRpt_Pd_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_月报处理产品收益率】*/
    call db_rpts.pra_rptdata_Init_MonthRpt_Pd_NAV_Rate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_curr_month,
        v_indicator_id,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.201.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_月报处理产品收益率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_月报处理指数收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_MonthRpt_Index_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_MonthRpt_Index_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_月报处理指数收益率】*/
    call db_rpts.pra_rptdata_Init_MonthRpt_Index_NAV_Rate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_curr_month,
        v_indicator_id,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.202.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_月报处理指数收益率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_月报处理产品最大回撤
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_MonthRpt_Pd_MaxDrawDown;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_MonthRpt_Pd_MaxDrawDown(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_月报处理产品最大回撤】*/
    call db_rpts.pra_rptdata_Init_MonthRpt_Pd_MaxDrawDown(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_curr_month,
        v_indicator_id,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.203.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_月报处理产品最大回撤出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_月报处理指数最大回撤
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_MonthRpt_Index_MaxDrawDown;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_MonthRpt_Index_MaxDrawDown(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_月报处理指数最大回撤】*/
    call db_rpts.pra_rptdata_Init_MonthRpt_Index_MaxDrawDown(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_curr_month,
        v_indicator_id,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.204.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_月报处理指数最大回撤出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_月报处理产品夏普比率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_MonthRpt_Pd_SharpRatio;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_MonthRpt_Pd_SharpRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_月报处理产品夏普比率】*/
    call db_rpts.pra_rptdata_Init_MonthRpt_Pd_SharpRatio(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_curr_month,
        v_indicator_id,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.205.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_月报处理产品夏普比率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_月报处理指数夏普比率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_MonthRpt_Index_SharpRatio;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_MonthRpt_Index_SharpRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_月报处理指数夏普比率】*/
    call db_rpts.pra_rptdata_Init_MonthRpt_Index_SharpRatio(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_curr_month,
        v_indicator_id,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.206.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_月报处理指数夏普比率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_月报处理产品日胜率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_MonthRpt_Pd_DayWinRatio;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_MonthRpt_Pd_DayWinRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_月报处理产品日胜率】*/
    call db_rpts.pra_rptdata_Init_MonthRpt_Pd_DayWinRatio(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_curr_month,
        v_indicator_id,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.207.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_月报处理产品日胜率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_月报处理指数日胜率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_MonthRpt_Index_DayWinRatio;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_MonthRpt_Index_DayWinRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_月报处理指数日胜率】*/
    call db_rpts.pra_rptdata_Init_MonthRpt_Index_DayWinRatio(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_curr_month,
        v_indicator_id,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.208.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_月报处理指数日胜率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_月报处理产品周胜率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_MonthRpt_Pd_WeekWinRatio;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_MonthRpt_Pd_WeekWinRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_月报处理产品周胜率】*/
    call db_rpts.pra_rptdata_Init_MonthRpt_Pd_WeekWinRatio(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_curr_month,
        v_indicator_id,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.209.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_月报处理产品周胜率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_月报处理指数周胜率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Init_MonthRpt_Index_WeekWinRatio;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Init_MonthRpt_Index_WeekWinRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_月报处理指数周胜率】*/
    call db_rpts.pra_rptdata_Init_MonthRpt_Index_WeekWinRatio(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_curr_month,
        v_indicator_id,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.210.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_月报处理指数周胜率出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询基金经理与交易员关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_Mananger_Trader_Conn;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_Mananger_Trader_Conn(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_fund_manager_no int,
    IN p_trader_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_fund_manager_no int;
    declare v_trader_no int;
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_trader_no = p_trader_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_查询基金经理与交易员关系】*/
    call db_rpts.pra_rptdata_Qry_Pd_Mananger_Trader_Conn(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_fund_manager_no,
        v_trader_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.211.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询基金经理与交易员关系出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询产品资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_Asset;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
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
    declare v_query_region_type int;
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
    SET v_query_region_type = p_query_region_type;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询产品资产】*/
    call db_rpts.pra_rptdata_Qry_Pd_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_query_region_type,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.301.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询产品资产出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询产品持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_Posi;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
    IN p_pd_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_query_region_type int;
    declare v_pd_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
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
    SET v_query_region_type = p_query_region_type;
    SET v_pd_no = p_pd_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询产品持仓】*/
    call db_rpts.pra_rptdata_Qry_Pd_Posi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_query_region_type,
        v_pd_no,
        v_stock_code,
        v_exch_no,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.302.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询产品持仓出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询产品行业
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_Industry;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_Industry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
    IN p_industry_std int,
    IN p_industry_classification int,
    IN p_industry_id int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_no int;
    declare v_industry_std int;
    declare v_industry_classification int;
    declare v_industry_id int;
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
    SET v_pd_no = p_pd_no;
    SET v_industry_std = p_industry_std;
    SET v_industry_classification = p_industry_classification;
    SET v_industry_id = p_industry_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询产品行业】*/
    call db_rpts.pra_rptdata_Qry_Pd_Industry(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_pd_no,
        v_industry_std,
        v_industry_classification,
        v_industry_id,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.303.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询产品行业出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询产品行业区间盈亏
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_Industry_inter_pl;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_Industry_inter_pl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
    IN p_industry_std int,
    IN p_industry_classification int,
    IN p_industry_id int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_no int;
    declare v_industry_std int;
    declare v_industry_classification int;
    declare v_industry_id int;
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
    SET v_pd_no = p_pd_no;
    SET v_industry_std = p_industry_std;
    SET v_industry_classification = p_industry_classification;
    SET v_industry_id = p_industry_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询产品行业区间盈亏】*/
    call db_rpts.pra_rptdata_Qry_Pd_Industry_inter_pl(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_pd_no,
        v_industry_std,
        v_industry_classification,
        v_industry_id,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.304.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询产品行业区间盈亏出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询汇总机构证券买卖成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Sum_Co_Stock_Buy_Sale_Strike;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Sum_Co_Stock_Buy_Sale_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询汇总机构证券买卖成交】*/
    call db_rpts.pra_rptdata_Qry_Sum_Co_Stock_Buy_Sale_Strike(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_pd_no,
        v_exch_no,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.305.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询汇总机构证券买卖成交出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询汇总产品证券买卖成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Sum_Pd_Stock_Buy_Sale_Strike;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Sum_Pd_Stock_Buy_Sale_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询汇总产品证券买卖成交】*/
    call db_rpts.pra_rptdata_Qry_Sum_Pd_Stock_Buy_Sale_Strike(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_pd_no,
        v_exch_no,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.306.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询汇总产品证券买卖成交出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询汇总产品证券成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Sum_Pd_Stock_Strike;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Sum_Pd_Stock_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_order_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_order_dir int;
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
    SET v_pd_no = p_pd_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询汇总产品证券成交】*/
    call db_rpts.pra_rptdata_Qry_Sum_Pd_Stock_Strike(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_pd_no,
        v_stock_code,
        v_exch_no,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_order_dir,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.307.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询汇总产品证券成交出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询区间汇总产品证券成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_RegSum_Pd_Stock_Strike;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_RegSum_Pd_Stock_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_order_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_query_region_type int;
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_order_dir int;
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
    SET v_query_region_type = p_query_region_type;
    SET v_pd_no = p_pd_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询区间汇总产品证券成交】*/
    call db_rpts.pra_rptdata_Qry_RegSum_Pd_Stock_Strike(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_query_region_type,
        v_pd_no,
        v_exch_no,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_order_dir,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.308.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询区间汇总产品证券成交出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询汇总产品资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Sum_Pd_equitiescashoperation;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Sum_Pd_equitiescashoperation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
    IN p_busi_flag int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_no int;
    declare v_busi_flag int;
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
    SET v_pd_no = p_pd_no;
    SET v_busi_flag = p_busi_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询汇总产品资金流水】*/
    call db_rpts.pra_rptdata_Qry_Sum_Pd_equitiescashoperation(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_pd_no,
        v_busi_flag,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.309.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询汇总产品资金流水出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询区间汇总产品资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_RegSum_Pd_equitiescashoperation;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_RegSum_Pd_equitiescashoperation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
    IN p_busi_flag int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_no int;
    declare v_busi_flag int;
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
    SET v_pd_no = p_pd_no;
    SET v_busi_flag = p_busi_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询区间汇总产品资金流水】*/
    call db_rpts.pra_rptdata_Qry_RegSum_Pd_equitiescashoperation(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_pd_no,
        v_busi_flag,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.310.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询区间汇总产品资金流水出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询月汇总产品持仓成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_MonthSum_Pd_Posi_Strike;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_MonthSum_Pd_Posi_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
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
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询月汇总产品持仓成交】*/
    call db_rpts.pra_rptdata_Qry_MonthSum_Pd_Posi_Strike(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.311.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询月汇总产品持仓成交出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询结算提前待入账记录表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_clsest_before_preentry;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_clsest_before_preentry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_busi_flag int,
    IN p_act_record_flag int,
    IN p_acco_entry_flag int,
    IN p_entry_status varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_busi_flag int;
    declare v_act_record_flag int;
    declare v_acco_entry_flag int;
    declare v_entry_status varchar(2);
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_busi_flag = p_busi_flag;
    SET v_act_record_flag = p_act_record_flag;
    SET v_acco_entry_flag = p_acco_entry_flag;
    SET v_entry_status = p_entry_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询结算提前待入账记录表】*/
    call db_rpts.pra_rptdata_Qry_Pd_clsest_before_preentry(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_pd_no,
        v_exch_group_no,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_busi_flag,
        v_act_record_flag,
        v_acco_entry_flag,
        v_entry_status,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.312.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询结算提前待入账记录表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_修改统计基金经理资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Modi_Fund_Mananger_Asset;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Modi_Fund_Mananger_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_fund_manager_no int,
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
    declare v_fund_manager_no int;
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_修改统计基金经理资产】*/
    call db_rpts.pra_rptdata_Modi_Fund_Mananger_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_fund_manager_no,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.313.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_修改统计基金经理资产出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询统计基金经理资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Fund_Mananger_Asset;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Fund_Mananger_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
    IN p_fund_manager_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_query_region_type int;
    declare v_fund_manager_no int;
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
    SET v_query_region_type = p_query_region_type;
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_查询统计基金经理资产】*/
    call db_rpts.pra_rptdata_Qry_Fund_Mananger_Asset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_query_region_type,
        v_fund_manager_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.314.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询统计基金经理资产出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_修改统计基金经理持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Modi_Fund_Mananger_Posi;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Modi_Fund_Mananger_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_fund_manager_no int,
    IN p_stock_code_no int,
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
    declare v_fund_manager_no int;
    declare v_stock_code_no int;
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_修改统计基金经理持仓】*/
    call db_rpts.pra_rptdata_Modi_Fund_Mananger_Posi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_fund_manager_no,
        v_stock_code_no,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.315.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_修改统计基金经理持仓出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询统计基金经理持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Fund_Mananger_Posi;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Fund_Mananger_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
    IN p_fund_manager_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_query_region_type int;
    declare v_fund_manager_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
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
    SET v_query_region_type = p_query_region_type;
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_查询统计基金经理持仓】*/
    call db_rpts.pra_rptdata_Qry_Fund_Mananger_Posi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_query_region_type,
        v_fund_manager_no,
        v_exch_no,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.316.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询统计基金经理持仓出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_新增机构业绩报告配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Add_Co_MonthRpt_Config;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Add_Co_MonthRpt_Config(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_config_no bigint,
    IN p_config_name varchar(64),
    IN p_show_order int,
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
    declare v_pd_no int;
    declare v_config_no bigint;
    declare v_config_name varchar(64);
    declare v_show_order int;
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
    SET v_pd_no = p_pd_no;
    SET v_config_no = p_config_no;
    SET v_config_name = p_config_name;
    SET v_show_order = p_show_order;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_新增机构业绩报告配置】*/
    call db_rpts.pra_rptdata_Add_Co_MonthRpt_Config(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_config_no,
        v_config_name,
        v_show_order,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.401.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_新增机构业绩报告配置出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_删除机构业绩报告配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Del_Co_MonthRpt_Config;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Del_Co_MonthRpt_Config(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_pd_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_config_no = p_config_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_删除机构业绩报告配置】*/
    call db_rpts.pra_rptdata_Del_Co_MonthRpt_Config(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_config_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.402.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_删除机构业绩报告配置出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_修改机构业绩报告配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Modi_Co_MonthRpt_Config;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Modi_Co_MonthRpt_Config(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_config_no bigint,
    IN p_config_name varchar(64),
    IN p_show_order int,
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
    declare v_pd_no int;
    declare v_config_no bigint;
    declare v_config_name varchar(64);
    declare v_show_order int;
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
    SET v_pd_no = p_pd_no;
    SET v_config_no = p_config_no;
    SET v_config_name = p_config_name;
    SET v_show_order = p_show_order;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_修改机构业绩报告配置】*/
    call db_rpts.pra_rptdata_Modi_Co_MonthRpt_Config(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_config_no,
        v_config_name,
        v_show_order,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.403.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_修改机构业绩报告配置出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询机构业绩报告配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Co_MonthRpt_Config;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Co_MonthRpt_Config(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
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
    declare v_pd_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_config_no = p_config_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_查询机构业绩报告配置】*/
    call db_rpts.pra_rptdata_Qry_Co_MonthRpt_Config(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_config_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.404.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询机构业绩报告配置出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_新增产品业绩报告附加信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Add_Pd_MonthRpt_AddInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Add_Pd_MonthRpt_AddInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_rpt_add_info varchar(10000),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_rpt_add_info varchar(10000);
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
    SET v_rpt_add_info = p_rpt_add_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_新增产品业绩报告附加信息】*/
    call db_rpts.pra_rptdata_Add_Pd_MonthRpt_AddInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_rpt_add_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.406.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_新增产品业绩报告附加信息出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_删除产品业绩报告附加信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Del_Pd_MonthRpt_AddInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Del_Pd_MonthRpt_AddInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    declare v_co_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_删除产品业绩报告附加信息】*/
    call db_rpts.pra_rptdata_Del_Pd_MonthRpt_AddInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.407.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_删除产品业绩报告附加信息出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_修改产品业绩报告附加信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Modi_Pd_MonthRpt_AddInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Modi_Pd_MonthRpt_AddInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_rpt_add_info varchar(10000),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_rpt_add_info varchar(10000);
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
    SET v_rpt_add_info = p_rpt_add_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_报表_报表数据_修改产品业绩报告附加信息】*/
    call db_rpts.pra_rptdata_Modi_Pd_MonthRpt_AddInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_rpt_add_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.408.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_修改产品业绩报告附加信息出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询产品业绩报告附加信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_MonthRpt_AddInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_MonthRpt_AddInfo(
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
    

    /* 调用【原子_报表_报表数据_查询产品业绩报告附加信息】*/
    call db_rpts.pra_rptdata_Qry_Pd_MonthRpt_AddInfo(
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
        SET v_error_code = "rptT.2.409.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询产品业绩报告附加信息出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_新增基金经理信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Add_Fund_Mananger;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Add_Fund_Mananger(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
    IN p_fund_manager_name varchar(32),
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
    declare v_fund_manager_no int;
    declare v_fund_manager_name varchar(32);
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_fund_manager_name = p_fund_manager_name;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_新增基金经理信息】*/
    call db_rpts.pra_rptdata_Add_Fund_Mananger(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_fund_manager_no,
        v_fund_manager_name,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.411.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_新增基金经理信息出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_删除基金经理信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Del_Fund_Mananger;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Del_Fund_Mananger(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_fund_manager_no int;
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_删除基金经理信息】*/
    call db_rpts.pra_rptdata_Del_Fund_Mananger(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_fund_manager_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.412.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_删除基金经理信息出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_修改基金经理信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Modi_Fund_Mananger;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Modi_Fund_Mananger(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
    IN p_fund_manager_name varchar(32),
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
    declare v_fund_manager_no int;
    declare v_fund_manager_name varchar(32);
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_fund_manager_name = p_fund_manager_name;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_修改基金经理信息】*/
    call db_rpts.pra_rptdata_Modi_Fund_Mananger(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_fund_manager_no,
        v_fund_manager_name,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.413.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_修改基金经理信息出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询基金经理信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Fund_Mananger;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Fund_Mananger(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_fund_manager_no int;
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_查询基金经理信息】*/
    call db_rpts.pra_rptdata_Qry_Fund_Mananger(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_fund_manager_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.414.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询基金经理信息出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_新增交易员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Add_Trader;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Add_Trader(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
    IN p_fund_manager_name varchar(32),
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
    declare v_fund_manager_no int;
    declare v_fund_manager_name varchar(32);
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_fund_manager_name = p_fund_manager_name;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_新增交易员信息】*/
    call db_rpts.pra_rptdata_Add_Trader(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_fund_manager_no,
        v_fund_manager_name,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.416.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_新增交易员信息出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_删除交易员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Del_Trader;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Del_Trader(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_fund_manager_no int;
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_删除交易员信息】*/
    call db_rpts.pra_rptdata_Del_Trader(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_fund_manager_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.417.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_删除交易员信息出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_修改交易员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Modi_Trader;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Modi_Trader(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
    IN p_fund_manager_name varchar(32),
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
    declare v_fund_manager_no int;
    declare v_fund_manager_name varchar(32);
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_fund_manager_name = p_fund_manager_name;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_修改交易员信息】*/
    call db_rpts.pra_rptdata_Modi_Trader(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_fund_manager_no,
        v_fund_manager_name,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.418.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_修改交易员信息出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询交易员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Trader;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Trader(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_fund_manager_no int;
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_查询交易员信息】*/
    call db_rpts.pra_rptdata_Qry_Trader(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_fund_manager_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.419.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询交易员信息出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_新增产品基金经理与交易员
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Add_Pd_Fund_Mananger_Trader;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Add_Pd_Fund_Mananger_Trader(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_fund_manager_no int,
    IN p_fund_manager_name varchar(32),
    IN p_trader_no int,
    IN p_trader_name varchar(32),
    IN p_show_order int,
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
    declare v_pd_no int;
    declare v_fund_manager_no int;
    declare v_fund_manager_name varchar(32);
    declare v_trader_no int;
    declare v_trader_name varchar(32);
    declare v_show_order int;
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
    SET v_pd_no = p_pd_no;
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_fund_manager_name = p_fund_manager_name;
    SET v_trader_no = p_trader_no;
    SET v_trader_name = p_trader_name;
    SET v_show_order = p_show_order;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_新增产品基金经理与交易员】*/
    call db_rpts.pra_rptdata_Add_Pd_Fund_Mananger_Trader(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_fund_manager_no,
        v_fund_manager_name,
        v_trader_no,
        v_trader_name,
        v_show_order,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.421.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_新增产品基金经理与交易员出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_删除产品基金经理与交易员
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Del_Pd_Fund_Mananger_Trader;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Del_Pd_Fund_Mananger_Trader(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
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
    declare v_row_id bigint;
    declare v_co_no int;
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
    SET v_row_id = p_row_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_删除产品基金经理与交易员】*/
    call db_rpts.pra_rptdata_Del_Pd_Fund_Mananger_Trader(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.422.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_删除产品基金经理与交易员出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_修改产品基金经理与交易员
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Modi_Pd_Fund_Mananger_Trader;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Modi_Pd_Fund_Mananger_Trader(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_fund_manager_no int,
    IN p_fund_manager_name varchar(32),
    IN p_trader_no int,
    IN p_trader_name varchar(32),
    IN p_show_order int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_fund_manager_no int;
    declare v_fund_manager_name varchar(32);
    declare v_trader_no int;
    declare v_trader_name varchar(32);
    declare v_show_order int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_fund_manager_name = p_fund_manager_name;
    SET v_trader_no = p_trader_no;
    SET v_trader_name = p_trader_name;
    SET v_show_order = p_show_order;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_修改产品基金经理与交易员】*/
    call db_rpts.pra_rptdata_Modi_Pd_Fund_Mananger_Trader(
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
        v_fund_manager_no,
        v_fund_manager_name,
        v_trader_no,
        v_trader_name,
        v_show_order,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.423.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_修改产品基金经理与交易员出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询产品基金经理与交易员
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_Fund_Mananger_Trader;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_Fund_Mananger_Trader(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_fund_manager_no int;
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_查询产品基金经理与交易员】*/
    call db_rpts.pra_rptdata_Qry_Pd_Fund_Mananger_Trader(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_fund_manager_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.424.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询产品基金经理与交易员出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_新增产品持仓导入外部交割流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Add_Pd_Out_Deli_Jour;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Add_Pd_Out_Deli_Jour(
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
    IN p_pass_deli_jour_no bigint,
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_num int,
    IN p_entry_end_qty decimal(18,2),
    IN p_entry_end_amt decimal(18,4),
    IN p_out_all_fee decimal(18,4),
    IN p_out_stamp_tax decimal(18,4),
    IN p_out_trans_fee decimal(18,4),
    IN p_out_brkage decimal(18,4),
    IN p_out_SEC_charges decimal(18,4),
    IN p_out_other_fee decimal(18,4),
    IN p_out_brkage_commis decimal(18,4),
    IN p_out_chann_commis decimal(18,4),
    IN p_out_divi_commis decimal(18,4),
    IN p_out_other_commis decimal(18,4),
    IN p_busi_flag int,
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
    declare v_pass_deli_jour_no bigint;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_entry_end_qty decimal(18,2);
    declare v_entry_end_amt decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_out_stamp_tax decimal(18,4);
    declare v_out_trans_fee decimal(18,4);
    declare v_out_brkage decimal(18,4);
    declare v_out_SEC_charges decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_chann_commis decimal(18,4);
    declare v_out_divi_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_busi_flag int;
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
    SET v_pass_deli_jour_no = p_pass_deli_jour_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_num = p_strike_num;
    SET v_entry_end_qty = p_entry_end_qty;
    SET v_entry_end_amt = p_entry_end_amt;
    SET v_out_all_fee = p_out_all_fee;
    SET v_out_stamp_tax = p_out_stamp_tax;
    SET v_out_trans_fee = p_out_trans_fee;
    SET v_out_brkage = p_out_brkage;
    SET v_out_SEC_charges = p_out_SEC_charges;
    SET v_out_other_fee = p_out_other_fee;
    SET v_out_brkage_commis = p_out_brkage_commis;
    SET v_out_chann_commis = p_out_chann_commis;
    SET v_out_divi_commis = p_out_divi_commis;
    SET v_out_other_commis = p_out_other_commis;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_新增产品持仓导入外部交割流水】*/
    call db_rpts.pra_rptdata_Add_Pd_Out_Deli_Jour(
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
        v_pass_deli_jour_no,
        v_strike_date,
        v_strike_time,
        v_strike_no,
        v_report_date,
        v_report_time,
        v_report_no,
        v_crncy_type,
        v_exch_no,
        v_stock_acco,
        v_stock_code,
        v_order_dir,
        v_order_price,
        v_order_qty,
        v_strike_price,
        v_strike_qty,
        v_strike_amt,
        v_strike_num,
        v_entry_end_qty,
        v_entry_end_amt,
        v_out_all_fee,
        v_out_stamp_tax,
        v_out_trans_fee,
        v_out_brkage,
        v_out_SEC_charges,
        v_out_other_fee,
        v_out_brkage_commis,
        v_out_chann_commis,
        v_out_divi_commis,
        v_out_other_commis,
        v_busi_flag,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.425.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_新增产品持仓导入外部交割流水出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_删除产品持仓导入外部交割流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Del_Pd_Out_Deli_Jour;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Del_Pd_Out_Deli_Jour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_query_region_type int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    SET v_query_region_type = p_query_region_type;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_删除产品持仓导入外部交割流水】*/
    call db_rpts.pra_rptdata_Del_Pd_Out_Deli_Jour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_query_region_type,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_pass_no,
        v_out_acco,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.426.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_删除产品持仓导入外部交割流水出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_查询产品持仓导入外部交割流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Qry_Pd_Out_Deli_Jour;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Qry_Pd_Out_Deli_Jour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_query_region_type int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    SET v_query_region_type = p_query_region_type;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_查询产品持仓导入外部交割流水】*/
    call db_rpts.pra_rptdata_Qry_Pd_Out_Deli_Jour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_query_region_type,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_pass_no,
        v_out_acco,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.428.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_查询产品持仓导入外部交割流水出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_处理产品持仓导入外部交割流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Set_Pd_Out_Deli_Jour;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Set_Pd_Out_Deli_Jour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_query_region_type int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    SET v_query_region_type = p_query_region_type;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_处理产品持仓导入外部交割流水】*/
    call db_rpts.pra_rptdata_Set_Pd_Out_Deli_Jour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_begin_date,
        v_qry_end_date,
        v_query_region_type,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_pass_no,
        v_out_acco,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.429.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_处理产品持仓导入外部交割流水出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_修改月汇总产品持仓成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Modi_MonthSum_Pd_Posi_Strike;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Modi_MonthSum_Pd_Posi_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_month_apply_amt decimal(18,4),
    IN p_trade_deduct_amt decimal(18,4),
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
    declare v_curr_month int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_month_apply_amt decimal(18,4);
    declare v_trade_deduct_amt decimal(18,4);
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
    SET v_curr_month = p_curr_month;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_month_apply_amt = p_month_apply_amt;
    SET v_trade_deduct_amt = p_trade_deduct_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_修改月汇总产品持仓成交】*/
    call db_rpts.pra_rptdata_Modi_MonthSum_Pd_Posi_Strike(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_curr_month,
        v_co_no,
        v_pd_no,
        v_month_apply_amt,
        v_trade_deduct_amt,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.431.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_修改月汇总产品持仓成交出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_新增汇总产品证券成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Add_Sum_Pd_Stock_Strike;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Add_Sum_Pd_Stock_Strike(
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
    IN p_stock_code_no int,
    IN p_asset_acco varchar(16),
    IN p_stock_acco varchar(16),
    IN p_exch_no int,
    IN p_invest_type int,
    IN p_stock_type int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_crncy_type varchar(3),
    IN p_strike_aver_price decimal(16,9),
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
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
    IN p_bond_accr_intrst decimal(18,12),
    IN p_net_price_flag int,
    IN p_bank_ib_member varchar(255),
    IN p_last_price decimal(16,9),
    IN p_quot_strike_qty decimal(18,2),
    IN p_quot_strike_amt decimal(18,4),
    IN p_sum_grp_cnt int,
    IN p_sum_grp_str varchar(255),
    IN p_busi_flag int,
    IN p_valid_flag int,
    IN p_remark_info varchar(255),
    IN p_src_data_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_stock_code_no int;
    declare v_asset_acco varchar(16);
    declare v_stock_acco varchar(16);
    declare v_exch_no int;
    declare v_invest_type int;
    declare v_stock_type int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_crncy_type varchar(3);
    declare v_strike_aver_price decimal(16,9);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
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
    declare v_bond_accr_intrst decimal(18,12);
    declare v_net_price_flag int;
    declare v_bank_ib_member varchar(255);
    declare v_last_price decimal(16,9);
    declare v_quot_strike_qty decimal(18,2);
    declare v_quot_strike_amt decimal(18,4);
    declare v_sum_grp_cnt int;
    declare v_sum_grp_str varchar(255);
    declare v_busi_flag int;
    declare v_valid_flag int;
    declare v_remark_info varchar(255);
    declare v_src_data_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sql_grp_no bigint;
    declare v_sync_his_flag int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_pos_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_asset_acco = p_asset_acco;
    SET v_stock_acco = p_stock_acco;
    SET v_exch_no = p_exch_no;
    SET v_invest_type = p_invest_type;
    SET v_stock_type = p_stock_type;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_crncy_type = p_crncy_type;
    SET v_strike_aver_price = p_strike_aver_price;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
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
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bank_ib_member = p_bank_ib_member;
    SET v_last_price = p_last_price;
    SET v_quot_strike_qty = p_quot_strike_qty;
    SET v_quot_strike_amt = p_quot_strike_amt;
    SET v_sum_grp_cnt = p_sum_grp_cnt;
    SET v_sum_grp_str = p_sum_grp_str;
    SET v_busi_flag = p_busi_flag;
    SET v_valid_flag = p_valid_flag;
    SET v_remark_info = p_remark_info;
    SET v_src_data_type = p_src_data_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sql_grp_no = 0;
    SET v_sync_his_flag = 0;
    SET v_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_end_date = date_format(curdate(),'%Y%m%d');
    SET v_pos_str = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_新增汇总产品证券成交】*/
    call db_rpts.pra_rptdata_Add_Sum_Pd_Stock_Strike(
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
        v_stock_code_no,
        v_asset_acco,
        v_stock_acco,
        v_exch_no,
        v_invest_type,
        v_stock_type,
        v_stock_code,
        v_stock_name,
        v_crncy_type,
        v_strike_aver_price,
        v_order_dir,
        v_order_price,
        v_order_qty,
        v_strike_qty,
        v_strike_amt,
        v_all_fee,
        v_stamp_tax,
        v_trans_fee,
        v_brkage_fee,
        v_SEC_charges,
        v_other_fee,
        v_trade_commis,
        v_other_commis,
        v_bond_accr_intrst,
        v_net_price_flag,
        v_bank_ib_member,
        v_last_price,
        v_quot_strike_qty,
        v_quot_strike_amt,
        v_sum_grp_cnt,
        v_sum_grp_str,
        v_busi_flag,
        v_valid_flag,
        v_remark_info,
        v_src_data_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.436.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_新增汇总产品证券成交出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @组号# = 104; */
    set v_sql_grp_no = 104;

    /* set @同步历史标志# = 0; */
    set v_sync_his_flag = 0;

    /* set @开始日期# = @初始化日期#; */
    set v_begin_date = v_init_date;

    /* set @结束日期# = @初始化日期#; */
    set v_end_date = v_init_date;

    /* set @数据来源类型# = 0; */
    set v_src_data_type = 0;

    /* set @定位串# = @产品编号#; */
    set v_pos_str = v_pd_no;

    /* 调用【原子_报表_报表基础_执行语句执行组】*/
    call db_rpts.pra_rpt_Run_Exe_Sql_Grps(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_sql_grp_no,
        v_co_no,
        v_pd_no,
        v_sync_his_flag,
        v_begin_date,
        v_end_date,
        v_src_data_type,
        v_pos_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.436.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表基础_执行语句执行组出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_删除汇总产品证券成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Del_Sum_Pd_Stock_Strike;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Del_Sum_Pd_Stock_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_busi_flag int,
    IN p_valid_flag int,
    IN p_src_data_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_busi_flag int;
    declare v_valid_flag int;
    declare v_src_data_type int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_busi_flag = p_busi_flag;
    SET v_valid_flag = p_valid_flag;
    SET v_src_data_type = p_src_data_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_删除汇总产品证券成交】*/
    call db_rpts.pra_rptdata_Del_Sum_Pd_Stock_Strike(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_code,
        v_stock_type,
        v_asset_type,
        v_busi_flag,
        v_valid_flag,
        v_src_data_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.437.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_删除汇总产品证券成交出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_修改汇总产品证券成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Modi_Sum_Pd_Stock_Strike;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Modi_Sum_Pd_Stock_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_stock_code_no int,
    IN p_asset_acco varchar(16),
    IN p_stock_acco varchar(16),
    IN p_exch_no int,
    IN p_invest_type int,
    IN p_stock_type int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_crncy_type varchar(3),
    IN p_strike_aver_price decimal(16,9),
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
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
    IN p_bond_accr_intrst decimal(18,12),
    IN p_net_price_flag int,
    IN p_bank_ib_member varchar(255),
    IN p_last_price decimal(16,9),
    IN p_quot_strike_qty decimal(18,2),
    IN p_quot_strike_amt decimal(18,4),
    IN p_sum_grp_cnt int,
    IN p_sum_grp_str varchar(255),
    IN p_busi_flag int,
    IN p_valid_flag int,
    IN p_remark_info varchar(255),
    IN p_src_data_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_stock_code_no int;
    declare v_asset_acco varchar(16);
    declare v_stock_acco varchar(16);
    declare v_exch_no int;
    declare v_invest_type int;
    declare v_stock_type int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_crncy_type varchar(3);
    declare v_strike_aver_price decimal(16,9);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
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
    declare v_bond_accr_intrst decimal(18,12);
    declare v_net_price_flag int;
    declare v_bank_ib_member varchar(255);
    declare v_last_price decimal(16,9);
    declare v_quot_strike_qty decimal(18,2);
    declare v_quot_strike_amt decimal(18,4);
    declare v_sum_grp_cnt int;
    declare v_sum_grp_str varchar(255);
    declare v_busi_flag int;
    declare v_valid_flag int;
    declare v_remark_info varchar(255);
    declare v_src_data_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sql_grp_no bigint;
    declare v_sync_his_flag int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_pos_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_asset_acco = p_asset_acco;
    SET v_stock_acco = p_stock_acco;
    SET v_exch_no = p_exch_no;
    SET v_invest_type = p_invest_type;
    SET v_stock_type = p_stock_type;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_crncy_type = p_crncy_type;
    SET v_strike_aver_price = p_strike_aver_price;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
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
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bank_ib_member = p_bank_ib_member;
    SET v_last_price = p_last_price;
    SET v_quot_strike_qty = p_quot_strike_qty;
    SET v_quot_strike_amt = p_quot_strike_amt;
    SET v_sum_grp_cnt = p_sum_grp_cnt;
    SET v_sum_grp_str = p_sum_grp_str;
    SET v_busi_flag = p_busi_flag;
    SET v_valid_flag = p_valid_flag;
    SET v_remark_info = p_remark_info;
    SET v_src_data_type = p_src_data_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sql_grp_no = 0;
    SET v_sync_his_flag = 0;
    SET v_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_end_date = date_format(curdate(),'%Y%m%d');
    SET v_pos_str = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_修改汇总产品证券成交】*/
    call db_rpts.pra_rptdata_Modi_Sum_Pd_Stock_Strike(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_stock_code_no,
        v_asset_acco,
        v_stock_acco,
        v_exch_no,
        v_invest_type,
        v_stock_type,
        v_stock_code,
        v_stock_name,
        v_crncy_type,
        v_strike_aver_price,
        v_order_dir,
        v_order_price,
        v_order_qty,
        v_strike_qty,
        v_strike_amt,
        v_all_fee,
        v_stamp_tax,
        v_trans_fee,
        v_brkage_fee,
        v_SEC_charges,
        v_other_fee,
        v_trade_commis,
        v_other_commis,
        v_bond_accr_intrst,
        v_net_price_flag,
        v_bank_ib_member,
        v_last_price,
        v_quot_strike_qty,
        v_quot_strike_amt,
        v_sum_grp_cnt,
        v_sum_grp_str,
        v_busi_flag,
        v_valid_flag,
        v_remark_info,
        v_src_data_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.438.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_修改汇总产品证券成交出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @组号# = 104; */
    set v_sql_grp_no = 104;

    /* set @同步历史标志# = 0; */
    set v_sync_his_flag = 0;

    /* set @开始日期# = @初始化日期#; */
    set v_begin_date = v_init_date;

    /* set @结束日期# = @初始化日期#; */
    set v_end_date = v_init_date;

    /* set @数据来源类型# = 0; */
    set v_src_data_type = 0;

    /* set @定位串# = @产品编号#; */
    set v_pos_str = v_pd_no;

    /* 调用【原子_报表_报表基础_执行语句执行组】*/
    call db_rpts.pra_rpt_Run_Exe_Sql_Grps(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_sql_grp_no,
        v_co_no,
        v_pd_no,
        v_sync_his_flag,
        v_begin_date,
        v_end_date,
        v_src_data_type,
        v_pos_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.438.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表基础_执行语句执行组出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_新增结算提前待入账记录表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Add_Pd_clsest_before_preentry;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Add_Pd_clsest_before_preentry(
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
    IN p_pd_name varchar(64),
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_exch_rate decimal(18,12),
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_pre_entry_qty decimal(18,2),
    IN p_pre_entry_amt decimal(18,4),
    IN p_impawn_ratio decimal(18,12),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_busi_flag int,
    IN p_act_record_flag int,
    IN p_acco_entry_flag int,
    IN p_entry_money_jour_no bigint,
    IN p_entry_status varchar(2),
    IN p_reg_date int,
    IN p_arrive_date int,
    IN p_begin_trade_date int,
    IN p_remark_info varchar(255),
    IN p_src_data_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_name varchar(64);
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_busi_flag int;
    declare v_act_record_flag int;
    declare v_acco_entry_flag int;
    declare v_entry_money_jour_no bigint;
    declare v_entry_status varchar(2);
    declare v_reg_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_remark_info varchar(255);
    declare v_src_data_type int;
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
    SET v_pd_name = p_pd_name;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_pre_entry_qty = p_pre_entry_qty;
    SET v_pre_entry_amt = p_pre_entry_amt;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_busi_flag = p_busi_flag;
    SET v_act_record_flag = p_act_record_flag;
    SET v_acco_entry_flag = p_acco_entry_flag;
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_status = p_entry_status;
    SET v_reg_date = p_reg_date;
    SET v_arrive_date = p_arrive_date;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_remark_info = p_remark_info;
    SET v_src_data_type = p_src_data_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_新增结算提前待入账记录表】*/
    call db_rpts.pra_rptdata_Add_Pd_clsest_before_preentry(
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
        v_pd_name,
        v_exch_group_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_code,
        v_stock_name,
        v_asset_acco_no,
        v_crncy_type,
        v_exch_crncy_type,
        v_exch_rate,
        v_trade_code_no,
        v_target_code_no,
        v_stock_type,
        v_asset_type,
        v_pre_entry_qty,
        v_pre_entry_amt,
        v_impawn_ratio,
        v_bond_accr_intrst,
        v_busi_flag,
        v_act_record_flag,
        v_acco_entry_flag,
        v_entry_money_jour_no,
        v_entry_status,
        v_reg_date,
        v_arrive_date,
        v_begin_trade_date,
        v_remark_info,
        v_src_data_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.441.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_新增结算提前待入账记录表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_删除结算提前待入账记录表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Del_Pd_clsest_before_preentry;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Del_Pd_clsest_before_preentry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_busi_flag int,
    IN p_act_record_flag int,
    IN p_src_data_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_busi_flag int;
    declare v_act_record_flag int;
    declare v_src_data_type int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_busi_flag = p_busi_flag;
    SET v_act_record_flag = p_act_record_flag;
    SET v_src_data_type = p_src_data_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_删除结算提前待入账记录表】*/
    call db_rpts.pra_rptdata_Del_Pd_clsest_before_preentry(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_code,
        v_stock_type,
        v_asset_type,
        v_busi_flag,
        v_act_record_flag,
        v_src_data_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.442.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_删除结算提前待入账记录表出现错误！',v_mysql_message);
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

# 事务_报表_报表数据_修改结算提前待入账记录表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rptdata_Modi_Pd_clsest_before_preentry;;
DELIMITER ;;
CREATE PROCEDURE prt_rptdata_Modi_Pd_clsest_before_preentry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_name varchar(64),
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_exch_rate decimal(18,12),
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_pre_entry_qty decimal(18,2),
    IN p_pre_entry_amt decimal(18,4),
    IN p_impawn_ratio decimal(18,12),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_busi_flag int,
    IN p_act_record_flag int,
    IN p_acco_entry_flag int,
    IN p_entry_money_jour_no bigint,
    IN p_entry_status varchar(2),
    IN p_reg_date int,
    IN p_arrive_date int,
    IN p_begin_trade_date int,
    IN p_remark_info varchar(255),
    IN p_src_data_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_name varchar(64);
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_busi_flag int;
    declare v_act_record_flag int;
    declare v_acco_entry_flag int;
    declare v_entry_money_jour_no bigint;
    declare v_entry_status varchar(2);
    declare v_reg_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_remark_info varchar(255);
    declare v_src_data_type int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_name = p_pd_name;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_pre_entry_qty = p_pre_entry_qty;
    SET v_pre_entry_amt = p_pre_entry_amt;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_busi_flag = p_busi_flag;
    SET v_act_record_flag = p_act_record_flag;
    SET v_acco_entry_flag = p_acco_entry_flag;
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_status = p_entry_status;
    SET v_reg_date = p_reg_date;
    SET v_arrive_date = p_arrive_date;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_remark_info = p_remark_info;
    SET v_src_data_type = p_src_data_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1

    /* 调用【原子_报表_报表数据_修改结算提前待入账记录表】*/
    call db_rpts.pra_rptdata_Modi_Pd_clsest_before_preentry(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_pd_name,
        v_exch_group_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_code,
        v_stock_name,
        v_asset_acco_no,
        v_crncy_type,
        v_exch_crncy_type,
        v_exch_rate,
        v_trade_code_no,
        v_target_code_no,
        v_stock_type,
        v_asset_type,
        v_pre_entry_qty,
        v_pre_entry_amt,
        v_impawn_ratio,
        v_bond_accr_intrst,
        v_busi_flag,
        v_act_record_flag,
        v_acco_entry_flag,
        v_entry_money_jour_no,
        v_entry_status,
        v_reg_date,
        v_arrive_date,
        v_begin_trade_date,
        v_remark_info,
        v_src_data_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rptT.2.443.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_报表_报表数据_修改结算提前待入账记录表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


