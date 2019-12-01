DELIMITER ;;
use db_pub;;

# 事务_公共_证券行情服务_初始化证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_sequotser_InitStockCode;;
DELIMITER ;;
CREATE PROCEDURE prt_sequotser_InitStockCode(
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
    IN p_pinyin_short varchar(16),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_pinyin_short varchar(16);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_init_date int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_tmp_stock_name varchar(64);
    declare v_target_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_stock_code_no int;
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
    SET v_stock_name = p_stock_name;
    SET v_pinyin_short = p_pinyin_short;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_tmp_stock_name = " ";
    SET v_target_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_stock_code_no = 0;
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* set @机构编号# = 0; */
    set v_co_no = 0;

    /* 调用【原子_公共_基础_检查市场状态】*/
    call db_pub.pra_base_CheckMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_crncy_type,
        v_exch_crncy_type,
        v_exch_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.16.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @临时_证券名称# = @证券名称#; */
    set v_tmp_stock_name = v_stock_name;

    /* 调用【原子_公共_证券基础数据_获取代码证券名称】*/
    call db_pub.pra_basesedt_GetCodeStockName(
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
        v_stock_name);
    #证券代码信息不存在则新增

    /* if @错误编码#<>"0" then */
    if v_error_code<>"0" then

        /* set @证券名称#=@临时_证券名称#; */
        set v_stock_name=v_tmp_stock_name;

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_公共_证券行情服务_初始化证券代码信息】*/
            call db_pub.pra_sequotser_InitStockCode(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_exch_no,
                v_stock_code,
                v_pinyin_short,
                v_stock_name,
                v_error_code,
                v_error_info,
                v_target_stock_code_no,
                v_stock_type,
                v_asset_type);
            if v_error_code = "1" then
                SET v_error_code = "pubT.16.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券行情服务_初始化证券代码信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @证券代码编号# = @目标证券代码编号#; */
            set v_stock_code_no = v_target_stock_code_no;

            /* 调用【原子_公共_证券行情服务_初始化证券行情】*/
            call db_pub.pra_sequotser_InitStockQuotation(
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
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pubT.16.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券行情服务_初始化证券行情出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


        /* [事务结束] */
        COMMIT;

    else

        /* if @证券名称#<>@临时_证券名称# then */
        if v_stock_name<>v_tmp_stock_name then

            /* set @证券名称#=@临时_证券名称#; */
            set v_stock_name=v_tmp_stock_name;

            /* [事务开始] */
            START TRANSACTION;


                /* 调用【原子_公共_证券行情服务_初始化更新证券代码信息】*/
                call db_pub.pra_sequotser_InitUpdateStockCode(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_exch_no,
                    v_stock_code,
                    v_pinyin_short,
                    v_stock_name,
                    v_error_code,
                    v_error_info,
                    v_target_stock_code_no,
                    v_stock_type,
                    v_asset_type);
                if v_error_code = "1" then
                    SET v_error_code = "pubT.16.1.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券行情服务_初始化更新证券代码信息出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


                /* set @证券代码编号# = @目标证券代码编号#; */
                set v_stock_code_no = v_target_stock_code_no;

                /* 调用【原子_公共_证券行情服务_初始化证券行情】*/
                call db_pub.pra_sequotser_InitStockQuotation(
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
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "pubT.16.1.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券行情服务_初始化证券行情出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


            /* [事务结束] */
            COMMIT;

        else

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
                SET v_error_code = "pubT.16.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码编号出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* [事务开始] */
            START TRANSACTION;


                /* 调用【原子_公共_证券行情服务_初始化证券行情】*/
                call db_pub.pra_sequotser_InitStockQuotation(
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
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "pubT.16.1.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券行情服务_初始化证券行情出现错误！',v_mysql_message);
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
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_证券行情服务_更新证券代码行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_sequotser_UpdateStockCodeQuot;;
DELIMITER ;;
CREATE PROCEDURE prt_sequotser_UpdateStockCodeQuot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_last_price decimal(16,9),
    IN p_pre_close_price decimal(16,9),
    IN p_stop_status varchar(2),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_last_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_stop_status varchar(2);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_last_price = p_last_price;
    SET v_pre_close_price = p_pre_close_price;
    SET v_stop_status = p_stop_status;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券行情服务_更新证券代码停牌标志】*/
        call db_pub.pra_sequotser_UpdateStockStopFlag(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_stock_code,
            v_exch_no,
            v_stop_status,
            v_error_code,
            v_error_info,
            v_stock_code_no);
        if v_error_code = "1" then
            SET v_error_code = "pubT.16.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券行情服务_更新证券代码停牌标志出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if (@市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号#=《市场编号-深港通证券交易所》) or (@证券代码编号#<>0 and (@最新价# <> 0 or @昨收盘价# <> 0)) then */
        if (v_exch_no = 3 or v_exch_no=4) or (v_stock_code_no<>0 and (v_last_price <> 0 or v_pre_close_price <> 0)) then

            /* 调用【原子_公共_证券行情服务_更新证券代码行情】*/
            call db_pub.pra_sequotser_UpdateStockCodeQuot(
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
                v_last_price,
                v_pre_close_price,
                v_up_limit_price,
                v_down_limit_price,
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
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pubT.16.2.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券行情服务_更新证券代码行情出现错误！',v_mysql_message);
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
use db_pub;;

# 事务_公共_证券行情服务_盘后更新证券代码行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_sequotser_AfterMarketUpdateStockCodeQuot;;
DELIMITER ;;
CREATE PROCEDURE prt_sequotser_AfterMarketUpdateStockCodeQuot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_last_price decimal(16,9),
    IN p_pre_close_price decimal(16,9),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_last_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_last_price = p_last_price;
    SET v_pre_close_price = p_pre_close_price;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_证券基础数据_证券代码信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#] */
    select stock_code_no into v_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;


    /* [事务开始] */
    START TRANSACTION;


        /* if (@市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号#=《市场编号-深港通证券交易所》) or (@证券代码编号#<>0 and (@最新价# <> 0 or @昨收盘价# <> 0)) then */
        if (v_exch_no = 3 or v_exch_no=4) or (v_stock_code_no<>0 and (v_last_price <> 0 or v_pre_close_price <> 0)) then

            /* 调用【原子_公共_证券行情服务_更新证券代码行情】*/
            call db_pub.pra_sequotser_UpdateStockCodeQuot(
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
                v_last_price,
                v_pre_close_price,
                v_up_limit_price,
                v_down_limit_price,
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
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pubT.16.3.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券行情服务_更新证券代码行情出现错误！',v_mysql_message);
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


