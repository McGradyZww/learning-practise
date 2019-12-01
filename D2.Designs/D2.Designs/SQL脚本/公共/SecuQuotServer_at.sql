DELIMITER ;;
use db_pub;;

# 原子_公共_证券行情服务_更新证券代码行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_sequotser_UpdateStockCodeQuot;;
DELIMITER ;;
CREATE PROCEDURE pra_sequotser_UpdateStockCodeQuot(
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
    declare v_stock_code_no int;
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
    declare v_time_stamp int;
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
    SET v_stock_code_no = p_stock_code_no;
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
    SET v_time_stamp = unix_timestamp();
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号#= 《市场编号-深圳证券交易所》 then */
    if v_exch_no = 1 or v_exch_no= 2 then

        /* [更新表记录][公共_证券基础数据_证券行情表][{最新价} = case when @最新价# <> 0 then @最新价# else {最新价} end, {昨收盘价} = case when @昨收盘价# <> 0 then @昨收盘价# else {昨收盘价} end, {涨停价} = case when @涨停价# <> 0 then @涨停价# else {涨停价} end, {跌停价} = case when @跌停价# <> 0 then @跌停价# else {跌停价} end,{今开盘价} = case when @今开盘价# <> 0 then @今开盘价# else {今开盘价} end, {成交数量}=@成交数量#, {成交金额}=@成交金额#, {时间戳}=@时间戳#][{证券代码编号}=@证券代码编号#][2][@证券代码编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pub.tb_basesedt_stock_quot set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, last_price = case when v_last_price <> 0 then v_last_price else last_price end, pre_close_price = case when v_pre_close_price <> 0 then v_pre_close_price else pre_close_price end, up_limit_price = case when v_up_limit_price <> 0 then v_up_limit_price else up_limit_price end, down_limit_price = case when v_down_limit_price <> 0 then v_down_limit_price else down_limit_price end,today_open_price = case when v_today_open_price <> 0 then v_today_open_price else today_open_price end, strike_qty=v_strike_qty, strike_amt=v_strike_amt, time_stamp=v_time_stamp where stock_code_no=v_stock_code_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.16.1.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;


    /* elseif @市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号#= 《市场编号-深港通证券交易所》 then */
    elseif v_exch_no = 3 or v_exch_no= 4 then

        /* [更新表记录][公共_证券基础数据_证券行情表][{最新价} = case when @最新价# <> 0 then @最新价# else {最新价} end, {昨收盘价} = case when @昨收盘价# <> 0 then @昨收盘价# else {昨收盘价} end, {买一价} = case when @买一价# <> 0 then @买一价# else {买一量} end, {买一量} = case when @买一量# <> 0 then @买一量# else {买一量} end, {卖一价} = case when @卖一价# <> 0 then @卖一价# else {卖一价} end, {卖一量} = case when @卖一量# <> 0 then @卖一量# else {卖一量} end, {今最高价} = @今最高价#, {今最低价} = @今最低价#, {成交数量}=@成交数量#, {成交金额}=@成交金额#, {时间戳}=@时间戳#][{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and {证券代码}=@证券代码#][2][@市场编号#,@证券代码#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pub.tb_basesedt_stock_quot set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, last_price = case when v_last_price <> 0 then v_last_price else last_price end, pre_close_price = case when v_pre_close_price <> 0 then v_pre_close_price else pre_close_price end, buy_price_1 = case when v_buy_price_1 <> 0 then v_buy_price_1 else buy_qty_1 end, buy_qty_1 = case when v_buy_qty_1 <> 0 then v_buy_qty_1 else buy_qty_1 end, sell_price_1 = case when v_sell_price_1 <> 0 then v_sell_price_1 else sell_price_1 end, sell_qty_1 = case when v_sell_qty_1 <> 0 then v_sell_qty_1 else sell_qty_1 end, today_max_price = v_today_max_price, today_min_price = v_today_min_price, strike_qty=v_strike_qty, strike_amt=v_strike_amt, time_stamp=v_time_stamp where exch_no in (3,4) and stock_code=v_stock_code;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.16.1.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券行情服务_更新证券代码停牌标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_sequotser_UpdateStockStopFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_sequotser_UpdateStockStopFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_stop_status varchar(2),
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
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stop_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_time_stamp int;
    declare v_stock_type int;
    declare v_tmp_stop_status varchar(2);
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
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_stop_status = p_stop_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_time_stamp = unix_timestamp();
    SET v_stock_type = 0;
    SET v_tmp_stop_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号#= 《市场编号-深圳证券交易所》 then */
    if v_exch_no = 1 or v_exch_no= 2 then

        /* [获取表记录变量语句][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型},{停牌标志}][@证券代码编号#,@证券类型#,@临时_停牌标志#][{市场编号}=@市场编号# and {证券代码}=@证券代码#] */
        select stock_code_no,stock_type,stop_status into v_stock_code_no,v_stock_type,v_tmp_stop_status from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;


        /* if (@停牌标志# <>  @临时_停牌标志#) and  (@证券类型# <> 《证券类型-债券回购》 and @证券类型# <> 《证券类型-回购标准券》) then */
        if (v_stop_status <>  v_tmp_stop_status) and  (v_stock_type <> 26 and v_stock_type <> 27) then

             /* [更新表记录][公共_证券基础数据_证券代码信息表][{停牌标志}=@停牌标志#, {时间戳}=@时间戳#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][2][@市场编号#,@证券代码#] */
             set v_update_date = date_format(curdate(),'%Y%m%d');
             set v_update_time = date_format(curtime(),'%H%i%s');
             update db_pub.tb_basesedt_stock_code_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stop_status=v_stop_status, time_stamp=v_time_stamp where exch_no=v_exch_no and stock_code=v_stock_code;
             if v_error_code = "1" then
                         
                 SET v_error_code = "pubA.16.2.2";
                 if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                 else
                     SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                 end if;
                 leave label_pro;
             end if;

        end if;
        #[获取表记录变量语句][公共_证券基础数据_证券代码信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#]

    /* elseif @市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号#= 《市场编号-深港通证券交易所》 then */
    elseif v_exch_no = 3 or v_exch_no= 4 then

        /* [更新表记录][公共_证券基础数据_证券代码信息表][{停牌标志}=@停牌标志#, {时间戳}=@时间戳#][{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and {证券代码}=@证券代码# and {停牌标志} <> @停牌标志#][2][@市场编号#,@证券代码#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pub.tb_basesedt_stock_code_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stop_status=v_stop_status, time_stamp=v_time_stamp where exch_no in (3,4) and stock_code=v_stock_code and stop_status <> v_stop_status;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.16.2.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券行情服务_初始化证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_sequotser_InitStockQuotation;;
DELIMITER ;;
CREATE PROCEDURE pra_sequotser_InitStockQuotation(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_fair_price decimal(16,9);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_fair_price = 0;
    SET v_last_price = 0;
    SET v_pre_close_price = 0;
    SET v_today_open_price = 0;
    SET v_today_close_price = 0;
    SET v_today_max_price = 0;
    SET v_today_min_price = 0;
    SET v_buy_price_1 = 0;
    SET v_buy_qty_1 = 0;
    SET v_buy_price_2 = 0;
    SET v_buy_qty_2 = 0;
    SET v_buy_price_3 = 0;
    SET v_buy_qty_3 = 0;
    SET v_buy_price_4 = 0;
    SET v_buy_qty_4 = 0;
    SET v_buy_price_5 = 0;
    SET v_buy_qty_5 = 0;
    SET v_sell_price_1 = 0;
    SET v_sell_qty_1 = 0;
    SET v_sell_price_2 = 0;
    SET v_sell_qty_2 = 0;
    SET v_sell_price_3 = 0;
    SET v_sell_qty_3 = 0;
    SET v_sell_price_4 = 0;
    SET v_sell_qty_4 = 0;
    SET v_sell_price_5 = 0;
    SET v_sell_qty_5 = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_pe_ratio = 0;
    SET v_time_stamp = unix_timestamp();
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @公允价格# = 0; */
    set v_fair_price = 0;

    /* set @最新价# = 0; */
    set v_last_price = 0;

    /* set @昨收盘价# = 0; */
    set v_pre_close_price = 0;

    /* set @今开盘价# = 0; */
    set v_today_open_price = 0;

    /* set @今收盘价# = 0; */
    set v_today_close_price = 0;

    /* set @今最高价# = 0; */
    set v_today_max_price = 0;

    /* set @今最低价# = 0; */
    set v_today_min_price = 0;

    /* set @买一价# = 0; */
    set v_buy_price_1 = 0;

    /* set @买一量# = 0; */
    set v_buy_qty_1 = 0;

    /* set @买二价# = 0; */
    set v_buy_price_2 = 0;

    /* set @买二量# = 0; */
    set v_buy_qty_2 = 0;

    /* set @买三价# = 0; */
    set v_buy_price_3 = 0;

    /* set @买三量# = 0; */
    set v_buy_qty_3 = 0;

    /* set @买四价# = 0; */
    set v_buy_price_4 = 0;

    /* set @买四量# = 0; */
    set v_buy_qty_4 = 0;

    /* set @买五价# = 0; */
    set v_buy_price_5 = 0;

    /* set @买五量# = 0; */
    set v_buy_qty_5 = 0;

    /* set @卖一价# = 0; */
    set v_sell_price_1 = 0;

    /* set @卖一量# = 0; */
    set v_sell_qty_1 = 0;

    /* set @卖二价# = 0; */
    set v_sell_price_2 = 0;

    /* set @卖二量# = 0; */
    set v_sell_qty_2 = 0;

    /* set @卖三价# = 0; */
    set v_sell_price_3 = 0;

    /* set @卖三量# = 0; */
    set v_sell_qty_3 = 0;

    /* set @卖四价# = 0; */
    set v_sell_price_4 = 0;

    /* set @卖四量# = 0; */
    set v_sell_qty_4 = 0;

    /* set @卖五价# = 0; */
    set v_sell_price_5 = 0;

    /* set @卖五量# = 0; */
    set v_sell_qty_5 = 0;

    /* set @成交数量# = 0; */
    set v_strike_qty = 0;

    /* set @成交金额# = 0; */
    set v_strike_amt = 0;

    /* set @市盈率# = 0; */
    set v_pe_ratio = 0;

    /* set @时间戳# = UNIX_TIMESTAMP(); */
    set v_time_stamp = UNIX_TIMESTAMP();

    /* [插入重复更新][公共_证券基础数据_证券行情表][字段][字段变量][{证券名称}=@证券名称#,{涨停价}=if(@涨停价#=0,{涨停价},@涨停价#),{跌停价}=if(@跌停价#=0,{跌停价},@跌停价#)][1][@证券代码编号#,@市场编号#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_stock_quot (
        create_date, create_time, update_date, 
        update_time, update_times, stock_code_no, exch_no, 
        stock_code, stock_name, up_limit_price, down_limit_price, 
        last_price, pre_close_price, today_open_price, today_close_price, 
        today_max_price, today_min_price, buy_price_1, buy_qty_1, 
        buy_price_2, buy_qty_2, buy_price_3, buy_qty_3, 
        buy_price_4, buy_qty_4, buy_price_5, buy_qty_5, 
        sell_price_1, sell_qty_1, sell_price_2, sell_qty_2, 
        sell_price_3, sell_qty_3, sell_price_4, sell_qty_4, 
        sell_price_5, sell_qty_5, strike_qty, strike_amt, 
        pe_ratio, time_stamp) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_stock_code_no, v_exch_no, 
        v_stock_code, v_stock_name, v_up_limit_price, v_down_limit_price, 
        v_last_price, v_pre_close_price, v_today_open_price, v_today_close_price, 
        v_today_max_price, v_today_min_price, v_buy_price_1, v_buy_qty_1, 
        v_buy_price_2, v_buy_qty_2, v_buy_price_3, v_buy_qty_3, 
        v_buy_price_4, v_buy_qty_4, v_buy_price_5, v_buy_qty_5, 
        v_sell_price_1, v_sell_qty_1, v_sell_price_2, v_sell_qty_2, 
        v_sell_price_3, v_sell_qty_3, v_sell_price_4, v_sell_qty_4, 
        v_sell_price_5, v_sell_qty_5, v_strike_qty, v_strike_amt, 
        v_pe_ratio, v_time_stamp) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, stock_name=v_stock_name,up_limit_price=if(v_up_limit_price=0,up_limit_price,v_up_limit_price),down_limit_price=if(v_down_limit_price=0,down_limit_price,v_down_limit_price);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.16.3.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券行情服务_初始化证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_sequotser_InitStockCode;;
DELIMITER ;;
CREATE PROCEDURE pra_sequotser_InitStockCode(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_pinyin_short varchar(16),
    IN p_stock_name varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_target_stock_code_no int,
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_pinyin_short varchar(16);
    declare v_stock_name varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_target_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_exch_name varchar(64);
    declare v_hk_stock_flag int;
    declare v_stop_status varchar(2);
    declare v_record_count int;
    declare v_stock_code_feature varchar(16);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_stock_type_name varchar(16);
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
    declare v_time_stamp int;
    declare v_total_stock_issue decimal(18,2);
    declare v_circl_stock_capit decimal(18,2);
    declare v_price_up decimal(16,9);
    declare v_price_down decimal(16,9);
    declare v_step_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
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
    SET v_pinyin_short = p_pinyin_short;
    SET v_stock_name = p_stock_name;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_target_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_exch_name = " ";
    SET v_hk_stock_flag = 0;
    SET v_stop_status = "0";
    SET v_record_count = 0;
    SET v_stock_code_feature = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_stock_type_name = " ";
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
    SET v_time_stamp = unix_timestamp();
    SET v_total_stock_issue = 0;
    SET v_circl_stock_capit = 0;
    SET v_price_up = 0;
    SET v_price_down = 0;
    SET v_step_price = 0;
    SET v_fair_price = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_pre_close_price = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* if @市场编号# = 《市场编号-上海证券交易所》 then */
    if v_exch_no = 1 then

        /* set @市场名称# = "上海证券交易所"; */
        set v_exch_name = "上海证券交易所";

    /* elseif @市场编号# = 《市场编号-深圳证券交易所》 then */
    elseif v_exch_no = 2 then

        /* set @市场名称# = "深圳证券交易所"; */
        set v_exch_name = "深圳证券交易所";
    else

        /* set @市场名称# = "未知"; */
        set v_exch_name = "未知";
    end if;

    /* set @港股通标的# = 《港股通标的-不是》; */
    set v_hk_stock_flag = 2;

    /* set @停牌标志# = 《停牌标志-正常》; */
    set v_stop_status = "1";

    /* [获取表记录数量][公共_证券基础数据_证券模板表][@记录个数#][@证券代码# like {证券代码特征} and {市场编号} = @市场编号#] */
    select count(1) into v_record_count from db_pub.tb_basesedt_stock_tmplat where v_stock_code like stock_code_feature and exch_no = v_exch_no;


    /* [检查报错返回][@记录个数#=0][4a][@证券代码#] */
    if v_record_count=0 then
        
        SET v_error_code = "pubA.16.4.4a";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* if @记录个数#=1 then */
    if v_record_count=1 then

        /* [获取表记录变量][公共_证券基础数据_证券模板表][{证券类型}][@证券类型#][@证券代码# like {证券代码特征} and {市场编号} = @市场编号#][4b][@证券代码#] */
        select stock_type into v_stock_type from db_pub.tb_basesedt_stock_tmplat where v_stock_code like stock_code_feature and exch_no = v_exch_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.16.4.4b";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码=",v_stock_code);
            end if;
            leave label_pro;
        end if;

    else

        /* [获取表记录数量][公共_证券基础数据_证券模板表][@记录个数#][@证券代码# like {证券代码特征} and @证券名称# like {证券名称特征} and {市场编号} = @市场编号#] */
        select count(1) into v_record_count from db_pub.tb_basesedt_stock_tmplat where v_stock_code like stock_code_feature and v_stock_name like stock_name_feature and exch_no = v_exch_no;


        /* if @记录个数#=0 then */
        if v_record_count=0 then

            /* [获取表记录变量][公共_证券基础数据_证券模板表][{证券类型}][@证券类型#][@证券代码# like {证券代码特征} and {证券名称特征}=" " and {市场编号} = @市场编号#][4c][@证券代码#] */
            select stock_type into v_stock_type from db_pub.tb_basesedt_stock_tmplat where v_stock_code like stock_code_feature and stock_name_feature=" " and exch_no = v_exch_no limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.16.4.4c";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("证券代码=",v_stock_code);
                end if;
                leave label_pro;
            end if;


        /* elseif @记录个数#=1 then */
        elseif v_record_count=1 then

            /* [获取表记录变量][公共_证券基础数据_证券模板表][{证券类型}][@证券类型#][@证券代码# like {证券代码特征} and @证券名称# like {证券名称特征} and {市场编号} = @市场编号#][4d][@证券代码#,@证券代码特征#,@市场编号#] */
            select stock_type into v_stock_type from db_pub.tb_basesedt_stock_tmplat where v_stock_code like stock_code_feature and v_stock_name like stock_name_feature and exch_no = v_exch_no limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.16.4.4d";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("证券代码=",v_stock_code,",","证券代码特征=",v_stock_code_feature,",","市场编号=",v_exch_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("证券代码=",v_stock_code,",","证券代码特征=",v_stock_code_feature,",","市场编号=",v_exch_no);
                end if;
                leave label_pro;
            end if;

        else

            /* [报错返回][4e][@记录个数#] */
                
                SET v_error_code = "pubA.16.4.4e";
                SET v_error_info = concat("记录个数=",v_record_count);
                leave label_pro;

        end if;
    end if;

    /* [获取表记录变量][公共_证券基础数据_证券类型表][字段][字段变量][{市场编号}=@市场编号# and {证券类型} = @证券类型#][4f][@市场编号#,@证券类型#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_type, stock_type_name, asset_type, par_value, 
        crncy_type, exch_crncy_type, capit_reback_days, posi_reback_days, 
        type_unit, report_unit, min_unit, max_qty, 
        min_qty, is_order_dir_flag, time_stamp into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_exch_no, 
        v_stock_type, v_stock_type_name, v_asset_type, v_par_value, 
        v_crncy_type, v_exch_crncy_type, v_capit_reback_days, v_posi_reback_days, 
        v_type_unit, v_report_unit, v_min_unit, v_max_qty, 
        v_min_qty, v_is_order_dir_flag, v_time_stamp from db_pub.tb_basesedt_stock_type where exch_no=v_exch_no and stock_type = v_stock_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.16.4.4f";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券类型=",v_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券类型=",v_stock_type);
        end if;
        leave label_pro;
    end if;


    /* if @市场编号# = 《市场编号-上海证券交易所》  and @证券代码#<=688999 and @证券代码#>=688000  then */
    if v_exch_no = 1  and v_stock_code<=688999 and v_stock_code>=688000  then

      /* set @最小单位#=1; */
      set v_min_unit=1;

      /* set @最小数量#=200; */
      set v_min_qty=200;

      /* set @最大数量# = 100000; */
      set v_max_qty = 100000;
    end if;

    /* set @总股本# = 0; */
    set v_total_stock_issue = 0;

    /* set @流通股本# = 0; */
    set v_circl_stock_capit = 0;

    /* set @停牌标志# = 《停牌标志-正常》; */
    set v_stop_status = "1";

    /* set @价格上限# = 0; */
    set v_price_up = 0;

    /* set @价格下限# = 0; */
    set v_price_down = 0;

    /* if (@市场编号# = 《市场编号-深圳证券交易所》 and (@证券类型#>20 and @证券类型#<50)) or (@证券类型#>50 and @证券类型#<70) then */
    if (v_exch_no = 2 and (v_stock_type>20 and v_stock_type<50)) or (v_stock_type>50 and v_stock_type<70) then

        /* set @最小价差# = 0.001; */
        set v_step_price = 0.001;
    else

        /* set @最小价差# = 0.01; */
        set v_step_price = 0.01;
    end if;

    /* set @公允价格# = 0; */
    set v_fair_price = 0;

    /* set @涨停价# = 0; */
    set v_up_limit_price = 0;

    /* set @跌停价# = 0; */
    set v_down_limit_price = 0;

    /* set @昨收盘价# = 0; */
    set v_pre_close_price = 0;

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
        SET v_error_code = "pubA.16.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场业务记录编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


     /* set @证券代码编号# = @当前编号#; */
     set v_stock_code_no = v_curr_no;

    /* set @时间戳# = UNIX_TIMESTAMP(); */
    set v_time_stamp = UNIX_TIMESTAMP();

    /* [插入重复更新][公共_证券基础数据_证券代码信息表][字段][字段变量][{时间戳}=@时间戳#,{证券名称}=@证券名称#,{拼音简称}=@拼音简称#][1][@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_stock_code_info (
        create_date, create_time, update_date, 
        update_time, update_times, stock_code_no, exch_no, 
        stock_code, stock_name, pinyin_short, stock_type, 
        asset_type, par_value, crncy_type, exch_crncy_type, 
        total_stock_issue, circl_stock_capit, capit_reback_days, posi_reback_days, 
        type_unit, report_unit, min_unit, max_qty, 
        min_qty, is_order_dir_flag, price_up, price_down, 
        step_price, fair_price, stop_status, hk_stock_flag, 
        time_stamp) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_stock_code_no, v_exch_no, 
        v_stock_code, v_stock_name, v_pinyin_short, v_stock_type, 
        v_asset_type, v_par_value, v_crncy_type, v_exch_crncy_type, 
        v_total_stock_issue, v_circl_stock_capit, v_capit_reback_days, v_posi_reback_days, 
        v_type_unit, v_report_unit, v_min_unit, v_max_qty, 
        v_min_qty, v_is_order_dir_flag, v_price_up, v_price_down, 
        v_step_price, v_fair_price, v_stop_status, v_hk_stock_flag, 
        v_time_stamp) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, time_stamp=v_time_stamp,stock_name=v_stock_name,pinyin_short=v_pinyin_short;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.16.4.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@目标证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4g][@市场编号#,@证券代码#] */
    select stock_code_no into v_target_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.16.4.4g";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券行情服务_初始化更新证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_sequotser_InitUpdateStockCode;;
DELIMITER ;;
CREATE PROCEDURE pra_sequotser_InitUpdateStockCode(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_pinyin_short varchar(16),
    IN p_stock_name varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_target_stock_code_no int,
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_pinyin_short varchar(16);
    declare v_stock_name varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_target_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_pinyin_short = p_pinyin_short;
    SET v_stock_name = p_stock_name;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_target_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_time_stamp = unix_timestamp();

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_证券基础数据_证券代码信息表][{时间戳}=@时间戳#,{证券名称}=@证券名称#,{拼音简称}=@拼音简称#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][2][@市场编号#,@证券代码#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_stock_code_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, time_stamp=v_time_stamp,stock_name=v_stock_name,pinyin_short=v_pinyin_short where exch_no=v_exch_no and stock_code=v_stock_code;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.16.5.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券类型},{资产类型},{证券代码编号}][@证券类型#,@资产类型#,@目标证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select stock_type,asset_type,stock_code_no into v_stock_type,v_asset_type,v_target_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.16.5.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;

END;;


