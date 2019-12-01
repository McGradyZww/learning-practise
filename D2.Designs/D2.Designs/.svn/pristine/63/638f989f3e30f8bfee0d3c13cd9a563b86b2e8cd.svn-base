DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_查询新股信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_QueryNewStockTable;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_QueryNewStockTable(
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
    

    /* [获取表全记录][公共_证券基础数据_证券新股代码信息表][{市场编号},{证券代码},{证券名称},{交易代码},{标的代码},{证券代码编号},{交易代码编号},{标的代码编号},{申购日期},{申购上限},{上市日期},{发行价}][1=1] */
    select exch_no,stock_code,stock_name,trade_code,target_code,stock_code_no,trade_code_no,target_code_no,apply_date,apply_limit,begin_trade_date,issue_price from db_pub.tb_basesedt_new_stock_code_info where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_更新新股信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_UpdateNewStockTable;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_UpdateNewStockTable(
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @证券代码编号# = 0; */
    set v_stock_code_no = 0;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select stock_code_no into v_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.28.102.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@证券代码编号# = 0][4][@市场编号#,@证券代码#] */
    if v_stock_code_no = 0 then
        
        SET v_error_code = "pubA.28.102.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* if @证券代码编号# >0 then */
    if v_stock_code_no >0 then

           /* [插入重复更新][公共_证券基础数据_证券新股代码信息表][字段][字段变量][{证券名称}=@证券名称#,{申购日期}=@申购日期#,{申购上限}=@申购上限#,{上市日期}=@上市日期#,{发行价}=@发行价#][1][@市场编号#,@证券代码#,@证券名称#] */
           set v_create_date = date_format(curdate(),'%Y%m%d');
           set v_create_time = date_format(curtime(),'%H%i%s');
           set v_update_date = v_create_date;
           set v_update_time = v_create_time;
           set v_update_times = 1;
           insert into db_pub.tb_basesedt_new_stock_code_info (
               create_date, create_time, update_date, 
               update_time, update_times, exch_no, stock_code, 
               stock_name, trade_code, target_code, stock_code_no, 
               trade_code_no, target_code_no, apply_date, apply_limit, 
               begin_trade_date, issue_price) 
           values(
               v_create_date, v_create_time, v_update_date, 
               v_update_time, v_update_times, v_exch_no, v_stock_code, 
               v_stock_name, v_trade_code, v_target_code, v_stock_code_no, 
               v_trade_code_no, v_target_code_no, v_apply_date, v_apply_limit, 
               v_begin_trade_date, v_issue_price) 
           ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, stock_name=v_stock_name,apply_date=v_apply_date,apply_limit=v_apply_limit,begin_trade_date=v_begin_trade_date,issue_price=v_issue_price;
           if v_error_code = "1" then
                       
               SET v_error_code = "pubA.28.102.1";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name),"#",v_mysql_message);
               else
                   SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name);
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

# 原子_公共_基础数据同步_查询证券代码信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_QueryStockCodeTable;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_QueryStockCodeTable(
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
    

    /* [获取表全记录][公共_证券基础数据_证券代码信息表][{证券代码编号},{市场编号},{证券代码},{证券名称},{拼音简称},{证券类型},{资产类型},{票面面值},{本币币种},{交易币种},{总股本},{流通股本},{资金回转天数},{持仓回转天数},{类型单位},{申报单位},{最小单位},{最大数量},{最小数量},{区分订单方向标志},{价格上限},{价格下限},{最小价差},{公允价格},{停牌标志},{港股通标的},{时间戳}][1=1] */
    select stock_code_no,exch_no,stock_code,stock_name,pinyin_short,stock_type,asset_type,par_value,crncy_type,exch_crncy_type,total_stock_issue,circl_stock_capit,capit_reback_days,posi_reback_days,type_unit,report_unit,min_unit,max_qty,min_qty,is_order_dir_flag,price_up,price_down,step_price,fair_price,stop_status,hk_stock_flag,time_stamp from db_pub.tb_basesedt_stock_code_info where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_更新证券代码信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_UpdateStockCodeTable;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_UpdateStockCodeTable(
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
    declare v_record_count int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
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
    SET v_record_count = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @证券代码编号# = 0; */
    set v_stock_code_no = 0;

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* set @时间戳# = unix_timestamp(); */
    set v_time_stamp = unix_timestamp();

    /* set @编号类型# =8 ; */
    set v_record_no_type =8 ;

    /* [获取表记录数量][公共_证券基础数据_证券代码信息表][@记录个数#][{市场编号}=@市场编号# and {证券代码}=@证券代码#] */
    select count(1) into v_record_count from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code;


    /* if @记录个数#=0 then */
    if v_record_count=0 then

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
            SET v_error_code = "pubA.28.112.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场业务记录编号出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @证券代码编号# = @当前编号#; */
        set v_stock_code_no = v_curr_no;

        /* [插入表记录][公共_证券基础数据_证券代码信息表][字段][字段变量][1][@市场编号#,@证券代码#,@证券名称#,@证券代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_basesedt_stock_code_info(
            create_date, create_time, update_date, 
            update_time, update_times, stock_code_no, exch_no, 
            stock_code, stock_name, pinyin_short, stock_type, 
            asset_type, par_value, crncy_type, exch_crncy_type, 
            total_stock_issue, circl_stock_capit, capit_reback_days, posi_reback_days, 
            type_unit, report_unit, min_unit, max_qty, 
            min_qty, is_order_dir_flag, price_up, price_down, 
            step_price, fair_price, stop_status, hk_stock_flag, 
            time_stamp) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_stock_code_no, v_exch_no, 
            v_stock_code, v_stock_name, v_pinyin_short, v_stock_type, 
            v_asset_type, v_par_value, v_crncy_type, v_exch_crncy_type, 
            v_total_stock_issue, v_circl_stock_capit, v_capit_reback_days, v_posi_reback_days, 
            v_type_unit, v_report_unit, v_min_unit, v_max_qty, 
            v_min_qty, v_is_order_dir_flag, v_price_up, v_price_down, 
            v_step_price, v_fair_price, v_stop_status, v_hk_stock_flag, 
            v_time_stamp);
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.28.112.1";
            SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            leave label_pro;
        end if;


    /* else if @记录个数# >0 then */
    else if v_record_count >0 then

            /* [更新表记录][公共_证券基础数据_证券代码信息表][{证券名称}=@证券名称#,{拼音简称}=@拼音简称#,{证券类型}=@证券类型#,{资产类型}=@资产类型#,{票面面值}=@票面面值#,{本币币种}=@本币币种#,{交易币种}=@交易币种#,{总股本}=@总股本#,{流通股本}=@流通股本#,{资金回转天数}=@资金回转天数#,{持仓回转天数}=@持仓回转天数#,{类型单位}=@类型单位#,{申报单位}=@申报单位#,{最小单位}=@最小单位#,{最大数量}=@最大数量#,{最小数量}=@最小数量#,{区分订单方向标志}=@区分订单方向标志#,{价格上限}=@价格上限#,{价格下限}=@价格下限#,{最小价差}=@最小价差#,{公允价格}=@公允价格#,{停牌标志}=@停牌标志#,{港股通标的}=@港股通标的#,{时间戳}=@时间戳#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][1][@市场编号#,@证券代码#,@证券名称#,@证券代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pub.tb_basesedt_stock_code_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_name=v_stock_name,pinyin_short=v_pinyin_short,stock_type=v_stock_type,asset_type=v_asset_type,par_value=v_par_value,crncy_type=v_crncy_type,exch_crncy_type=v_exch_crncy_type,total_stock_issue=v_total_stock_issue,circl_stock_capit=v_circl_stock_capit,capit_reback_days=v_capit_reback_days,posi_reback_days=v_posi_reback_days,type_unit=v_type_unit,report_unit=v_report_unit,min_unit=v_min_unit,max_qty=v_max_qty,min_qty=v_min_qty,is_order_dir_flag=v_is_order_dir_flag,price_up=v_price_up,price_down=v_price_down,step_price=v_step_price,fair_price=v_fair_price,stop_status=v_stop_status,hk_stock_flag=v_hk_stock_flag,time_stamp=v_time_stamp where exch_no=v_exch_no and stock_code=v_stock_code;
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.28.112.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no);
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
use db_pub;;

# 原子_公共_基础数据同步_查询债券属性信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_QueryBondInfoTable;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_QueryBondInfoTable(
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
    

    /* [获取表全记录][公共_证券基础数据_债券属性信息表][{市场编号},{证券代码},{交易代码},{标的代码},{证券代码编号},{交易代码编号},{标的代码编号},{证券名称},{发行日期},{结束日期},{起息日期},{下一起息日期},{上市日期},{债券期限},{发行价},{票面面值},{年利率},{计息天数},{付息间隔},{债券计提利息},{债券利率类型},{间隔天数},{净价标志},{最后交易日},{权益类型},{转股开始日期},{转股结束日期},{行权开始日期},{行权结束日期},{质押比例},{付息标志},{时间戳}][1=1] */
    select exch_no,stock_code,trade_code,target_code,stock_code_no,trade_code_no,target_code_no,stock_name,issue_date,end_date,value_date,next_value_date,begin_trade_date,bond_limit,issue_price,par_value,intrst_ratio,intrst_days,pay_inteval,bond_accr_intrst,bond_rate_type,inteval_days,net_price_flag,last_trade_date,rights_type,trans_begin_date,trans_end_date,exec_begin_date,exec_end_date,impawn_ratio,pay_intrst_flag,time_stamp from db_pub.tb_basesedt_bond_info where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_更新债券属性信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_UpdateBondInfoTable;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_UpdateBondInfoTable(
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @证券代码编号# = 0; */
    set v_stock_code_no = 0;

    /* set @时间戳# = unix_timestamp(); */
    set v_time_stamp = unix_timestamp();

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select stock_code_no into v_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.28.122.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@证券代码编号# = 0][4][@市场编号#,@证券代码#] */
    if v_stock_code_no = 0 then
        
        SET v_error_code = "pubA.28.122.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* if @证券代码编号# >0 then */
    if v_stock_code_no >0 then

      /* [插入重复更新][公共_证券基础数据_债券属性信息表][字段][字段变量][{证券名称}=@证券名称#,{发行日期}=@发行日期#,{结束日期}=@结束日期#,{起息日期}=@起息日期#,{下一起息日期}=@下一起息日期#,{上市日期}=@上市日期#,{债券期限}=@债券期限#,{发行价}=@发行价#,{票面面值}=@票面面值#,{年利率}=@年利率#,{计息天数}=@计息天数#,{付息间隔}=@付息间隔#,{债券计提利息}=@债券计提利息#,{债券利率类型}=@债券利率类型#,{间隔天数}=@间隔天数#,{净价标志}=@净价标志#,{最后交易日}=@最后交易日#,{权益类型}=@权益类型#,{转股开始日期}=@转股开始日期#,{转股结束日期}=@转股结束日期#,{行权开始日期}=@行权开始日期#,{行权结束日期}=@行权结束日期#,{质押比例}=@质押比例#,{付息标志}=@付息标志#,{时间戳}=@时间戳#][1][@市场编号#,@证券代码#,@证券名称#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_pub.tb_basesedt_bond_info (
          create_date, create_time, update_date, 
          update_time, update_times, exch_no, stock_code, 
          trade_code, target_code, stock_code_no, trade_code_no, 
          target_code_no, stock_name, issue_date, end_date, 
          value_date, next_value_date, begin_trade_date, bond_limit, 
          issue_price, par_value, intrst_ratio, intrst_days, 
          pay_inteval, bond_accr_intrst, bond_rate_type, inteval_days, 
          net_price_flag, last_trade_date, rights_type, trans_begin_date, 
          trans_end_date, exec_begin_date, exec_end_date, impawn_ratio, 
          pay_intrst_flag, time_stamp) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_exch_no, v_stock_code, 
          v_trade_code, v_target_code, v_stock_code_no, v_trade_code_no, 
          v_target_code_no, v_stock_name, v_issue_date, v_end_date, 
          v_value_date, v_next_value_date, v_begin_trade_date, v_bond_limit, 
          v_issue_price, v_par_value, v_intrst_ratio, v_intrst_days, 
          v_pay_inteval, v_bond_accr_intrst, v_bond_rate_type, v_inteval_days, 
          v_net_price_flag, v_last_trade_date, v_rights_type, v_trans_begin_date, 
          v_trans_end_date, v_exec_begin_date, v_exec_end_date, v_impawn_ratio, 
          v_pay_intrst_flag, v_time_stamp) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, stock_name=v_stock_name,issue_date=v_issue_date,end_date=v_end_date,value_date=v_value_date,next_value_date=v_next_value_date,begin_trade_date=v_begin_trade_date,bond_limit=v_bond_limit,issue_price=v_issue_price,par_value=v_par_value,intrst_ratio=v_intrst_ratio,intrst_days=v_intrst_days,pay_inteval=v_pay_inteval,bond_accr_intrst=v_bond_accr_intrst,bond_rate_type=v_bond_rate_type,inteval_days=v_inteval_days,net_price_flag=v_net_price_flag,last_trade_date=v_last_trade_date,rights_type=v_rights_type,trans_begin_date=v_trans_begin_date,trans_end_date=v_trans_end_date,exec_begin_date=v_exec_begin_date,exec_end_date=v_exec_end_date,impawn_ratio=v_impawn_ratio,pay_intrst_flag=v_pay_intrst_flag,time_stamp=v_time_stamp;
      if v_error_code = "1" then
                  
          SET v_error_code = "pubA.28.122.1";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name),"#",v_mysql_message);
          else
              SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name);
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

# 原子_公共_基础数据同步_查询证券行情表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_QueryStockQuotTable;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_QueryStockQuotTable(
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
    

    /* [获取表全记录][公共_证券基础数据_证券行情表][{证券代码编号},{市场编号},{证券代码},{证券名称},{涨停价},{跌停价},{最新价},{昨收盘价},{今开盘价},{今收盘价},{今最高价},{今最低价},{买一价},{买一量},{买二价},{买二量},{买三价},{买三量},{买四价},{买四量},{买五价},{买五量},{卖一价},{卖一量},{卖二价},{卖二量},{卖三价},{卖三量},{卖四价},{卖四量},{卖五价},{卖五量},{成交数量},{成交金额},{市盈率},{时间戳}][1=1] */
    select stock_code_no,exch_no,stock_code,stock_name,up_limit_price,down_limit_price,last_price,pre_close_price,today_open_price,today_close_price,today_max_price,today_min_price,buy_price_1,buy_qty_1,buy_price_2,buy_qty_2,buy_price_3,buy_qty_3,buy_price_4,buy_qty_4,buy_price_5,buy_qty_5,sell_price_1,sell_qty_1,sell_price_2,sell_qty_2,sell_price_3,sell_qty_3,sell_price_4,sell_qty_4,sell_price_5,sell_qty_5,strike_qty,strike_amt,pe_ratio,time_stamp from db_pub.tb_basesedt_stock_quot where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_更新证券行情表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_UpdateStockQuotTable;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_UpdateStockQuotTable(
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @证券代码编号# = 0; */
    set v_stock_code_no = 0;

    /* set @时间戳# = unix_timestamp(); */
    set v_time_stamp = unix_timestamp();

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select stock_code_no into v_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.28.132.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@证券代码编号# = 0][4][@市场编号#,@证券代码#] */
    if v_stock_code_no = 0 then
        
        SET v_error_code = "pubA.28.132.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* if @证券代码编号# >0 then */
    if v_stock_code_no >0 then

         /* [插入重复更新][公共_证券基础数据_证券行情表][字段][字段变量][{证券名称}=@证券名称#,{涨停价}=@涨停价#,{跌停价}=@跌停价#,{最新价}=@最新价#,{昨收盘价}=@昨收盘价#,{今开盘价}=@今开盘价#,{今收盘价}=@今收盘价#,{今最高价}=@今最高价#,{今最低价}=@今最低价#,{买一价}=@买一价#,{买一量}=@买一量#,{买二价}=@买二价#,{买二量}=@买二量#,{买三价}=@买三价#,{买三量}=@买三量#,{买四价}=@买四价#,{买四量}=@买四量#,{买五价}=@买五价#,{买五量}=@买五量#,{卖一价}=@卖一价#,{卖一量}=@卖一量#,{卖二价}=@卖二价#,{卖二量}=@卖二量#,{卖三价}=@卖三价#,{卖三量}=@卖三量#,{卖四价}=@卖四价#,{卖四量}=@卖四量#,{卖五价}=@卖五价#,{卖五量}=@卖五量#,{成交数量}=@成交数量#,{成交金额}=@成交金额#,{市盈率}=@市盈率#,{时间戳}=@时间戳#][1][@证券代码编号#,@市场编号#,@证券代码#,@证券名称#] */
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
         ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, stock_name=v_stock_name,up_limit_price=v_up_limit_price,down_limit_price=v_down_limit_price,last_price=v_last_price,pre_close_price=v_pre_close_price,today_open_price=v_today_open_price,today_close_price=v_today_close_price,today_max_price=v_today_max_price,today_min_price=v_today_min_price,buy_price_1=v_buy_price_1,buy_qty_1=v_buy_qty_1,buy_price_2=v_buy_price_2,buy_qty_2=v_buy_qty_2,buy_price_3=v_buy_price_3,buy_qty_3=v_buy_qty_3,buy_price_4=v_buy_price_4,buy_qty_4=v_buy_qty_4,buy_price_5=v_buy_price_5,buy_qty_5=v_buy_qty_5,sell_price_1=v_sell_price_1,sell_qty_1=v_sell_qty_1,sell_price_2=v_sell_price_2,sell_qty_2=v_sell_qty_2,sell_price_3=v_sell_price_3,sell_qty_3=v_sell_qty_3,sell_price_4=v_sell_price_4,sell_qty_4=v_sell_qty_4,sell_price_5=v_sell_price_5,sell_qty_5=v_sell_qty_5,strike_qty=v_strike_qty,strike_amt=v_strike_amt,pe_ratio=v_pe_ratio,time_stamp=v_time_stamp;
         if v_error_code = "1" then
                     
             SET v_error_code = "pubA.28.132.1";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name),"#",v_mysql_message);
             else
                 SET v_error_info = concat("证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name);
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

# 原子_公共_基础数据同步_查询代码映射表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_QueryCodeMapTable;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_QueryCodeMapTable(
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
    

    /* [获取表全记录][公共_证券基础数据_证券代码映射表][{证券代码编号},{证券代码},{市场编号},{交易代码},{标的代码},{时间戳}][1=1] */
    select stock_code_no,stock_code,exch_no,trade_code,target_code,time_stamp from db_pub.tb_basesedt_code_map where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_更新代码映射表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_UpdateCodeMapTable;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_UpdateCodeMapTable(
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
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_trade_code = p_trade_code;
    SET v_target_code = p_target_code;
    SET v_time_stamp = p_time_stamp;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @证券代码编号# = 0; */
    set v_stock_code_no = 0;

    /* set @时间戳# = unix_timestamp(); */
    set v_time_stamp = unix_timestamp();

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select stock_code_no into v_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.28.142.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@证券代码编号# = 0][4][@市场编号#,@证券代码#] */
    if v_stock_code_no = 0 then
        
        SET v_error_code = "pubA.28.142.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* if @证券代码编号# >0 then */
    if v_stock_code_no >0 then

        /* [插入重复更新][公共_证券基础数据_证券代码映射表][字段][字段变量][{交易代码}=@交易代码#,{标的代码}=@标的代码#,{时间戳}=@时间戳#][1][@证券代码编号#,@市场编号#,@证券代码#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_basesedt_code_map (
            create_date, create_time, update_date, 
            update_time, update_times, stock_code_no, stock_code, 
            exch_no, trade_code, target_code, time_stamp) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_stock_code_no, v_stock_code, 
            v_exch_no, v_trade_code, v_target_code, v_time_stamp) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, trade_code=v_trade_code,target_code=v_target_code,time_stamp=v_time_stamp;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.28.142.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code);
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

# 原子_公共_基础数据同步_查询证券代码订单方向表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_QueryStockCodeOrderDirTable;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_QueryStockCodeOrderDirTable(
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
    

    /* [左关联查询][公共_证券基础数据_证券代码订单方向表][公共_证券基础数据_证券代码信息表][t.{证券代码编号},t.{市场编号},a.{证券代码},t.{订单方向},t.{资金冻结方式},t.{订单数量拆分标志},t.{最小单位},t.{最大数量},t.{最小数量},t.{时间戳}
][t.{证券代码编号}=a.{证券代码编号}][1=1] */
    select t.stock_code_no,t.exch_no,a.stock_code,t.order_dir,t.cash_frozen_type,t.order_split_flag,t.min_unit,t.max_qty,t.min_qty,t.time_stamp
     from db_pub.tb_basesedt_stock_code_order_dir t left join db_pub.tb_basesedt_stock_code_info a on t.stock_code_no=a.stock_code_no where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_更新证券代码订单方向表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_UpdateStockCodeOrderDirTable;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_UpdateStockCodeOrderDirTable(
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
    SET v_order_dir = p_order_dir;
    SET v_cash_frozen_type = p_cash_frozen_type;
    SET v_order_split_flag = p_order_split_flag;
    SET v_min_unit = p_min_unit;
    SET v_max_qty = p_max_qty;
    SET v_min_qty = p_min_qty;
    SET v_time_stamp = p_time_stamp;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @证券代码编号# = 0; */
    set v_stock_code_no = 0;

    /* set @时间戳# = unix_timestamp(); */
    set v_time_stamp = unix_timestamp();

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select stock_code_no into v_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.28.152.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@证券代码编号# = 0][4][@市场编号#,@证券代码#] */
    if v_stock_code_no = 0 then
        
        SET v_error_code = "pubA.28.152.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* if @证券代码编号# >0 then */
    if v_stock_code_no >0 then

        /* [插入重复更新][公共_证券基础数据_证券代码订单方向表][字段][字段变量][{资金冻结方式}=@资金冻结方式#,{订单数量拆分标志}=@订单数量拆分标志#,{最小单位}=@最小单位#,{最大数量}=@最大数量#,{最小数量}=@最小数量#,{时间戳}=@时间戳#][1][@证券代码编号#,@市场编号#，@订单方向#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_basesedt_stock_code_order_dir (
            create_date, create_time, update_date, 
            update_time, update_times, stock_code_no, exch_no, 
            order_dir, cash_frozen_type, order_split_flag, min_unit, 
            max_qty, min_qty, time_stamp) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_stock_code_no, v_exch_no, 
            v_order_dir, v_cash_frozen_type, v_order_split_flag, v_min_unit, 
            v_max_qty, v_min_qty, v_time_stamp) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, cash_frozen_type=v_cash_frozen_type,order_split_flag=v_order_split_flag,min_unit=v_min_unit,max_qty=v_max_qty,min_qty=v_min_qty,time_stamp=v_time_stamp;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.28.152.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,",","市场编号，订单方向=",v_exch_no，v_order_dir),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no,",","市场编号，订单方向=",v_exch_no，v_order_dir);
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

# 原子_公共_基础数据同步_查询港股通汇率表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_QueryHkExchRateTable;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_QueryHkExchRateTable(
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
    

    /* [获取表全记录][公共_基础_港股通汇率表][字段][1=1] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        exch_no, for_crncy_type, crncy_type, buy_ref_rate, 
        sell_ref_rate, settle_buy_rate, settle_sell_rate, pboc_rate from db_pub.tb_base_hk_exch_rate where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_更新港股通汇率表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_UpdateHkExchRateTable;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_UpdateHkExchRateTable(
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

        /* [插入重复更新][公共_基础_港股通汇率表][字段][字段变量][{外币币种}=@外币币种#,{本币币种}=@本币币种#,{买入参考汇率}=@买入参考汇率#,{卖出参考汇率}=@卖出参考汇率#,{买入结算汇率}=@买入结算汇率#,{卖出结算汇率}=@卖出结算汇率#,{中国人行汇率}=@中国人行汇率#][1][@初始化日期#,@市场编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_base_hk_exch_rate (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, exch_no, 
            for_crncy_type, crncy_type, buy_ref_rate, sell_ref_rate, 
            settle_buy_rate, settle_sell_rate, pboc_rate) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_exch_no, 
            v_for_crncy_type, v_crncy_type, v_buy_ref_rate, v_sell_ref_rate, 
            v_settle_buy_rate, v_settle_sell_rate, v_pboc_rate) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, for_crncy_type=v_for_crncy_type,crncy_type=v_crncy_type,buy_ref_rate=v_buy_ref_rate,sell_ref_rate=v_sell_ref_rate,settle_buy_rate=v_settle_buy_rate,settle_sell_rate=v_settle_sell_rate,pboc_rate=v_pboc_rate;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.28.162.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no);
            end if;
            leave label_pro;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_更新A股股本信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_UpdateAShareCapitalInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_UpdateAShareCapitalInfo(
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
    IN p_total_stock_issue decimal(18,2),
    IN p_circl_stock_capit decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_total_stock_issue decimal(18,2);
    declare v_circl_stock_capit decimal(18,2);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_total_stock_issue = p_total_stock_issue;
    SET v_circl_stock_capit = p_circl_stock_capit;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

      /* [更新表记录][公共_证券基础数据_证券代码信息表][{证券名称}=@证券名称#,{总股本}=@总股本#,{流通股本}=@流通股本#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][2][@市场编号#,@证券代码#,@证券名称#] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_pub.tb_basesedt_stock_code_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_name=v_stock_name,total_stock_issue=v_total_stock_issue,circl_stock_capit=v_circl_stock_capit where exch_no=v_exch_no and stock_code=v_stock_code;
      if v_error_code = "1" then
                  
          SET v_error_code = "pubA.28.171.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name),"#",v_mysql_message);
          else
              SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name);
          end if;
          leave label_pro;
      end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_更新新股信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_UpdateNewStockInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_UpdateNewStockInfo(
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
    IN p_trade_code varchar(6),
    IN p_target_code varchar(6),
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
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_apply_date int;
    declare v_apply_limit decimal(18,2);
    declare v_begin_trade_date int;
    declare v_issue_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_record_count int;
    declare v_time_stamp int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_issue_date int;
    declare v_end_date int;
    declare v_value_date int;
    declare v_next_value_date int;
    declare v_bond_limit decimal(18,2);
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_trade_code = p_trade_code;
    SET v_target_code = p_target_code;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_apply_date = p_apply_date;
    SET v_apply_limit = p_apply_limit;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_issue_price = p_issue_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_record_count = 0;
    SET v_time_stamp = unix_timestamp();
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_issue_date = date_format(curdate(),'%Y%m%d');
    SET v_end_date = date_format(curdate(),'%Y%m%d');
    SET v_value_date = date_format(curdate(),'%Y%m%d');
    SET v_next_value_date = date_format(curdate(),'%Y%m%d');
    SET v_bond_limit = 0;
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
    SET v_pay_intrst_flag = 0;

    
    label_pro:BEGIN
    

    /* set @证券代码编号# = 0; */
    set v_stock_code_no = 0;

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* set @时间戳# = unix_timestamp(); */
    set v_time_stamp = unix_timestamp();

    /* set @编号类型# =8 ; */
    set v_record_no_type =8 ;

    /* if @证券代码#<=688999  and  @证券代码#>=688000 and @市场编号#=《市场编号-上海证券交易所》  then */
    if v_stock_code<=688999  and  v_stock_code>=688000 and v_exch_no=1  then

        /* set @最小单位# = 1; */
        set v_min_unit = 1;

        /* set @最小数量# = 200; */
        set v_min_qty = 200;

        /* set @最大数量# = 100000; */
        set v_max_qty = 100000;
    end if;

    /* [获取表记录数量][公共_证券基础数据_证券代码信息表][@记录个数#][{市场编号}=@市场编号# and {证券代码}=@证券代码#] */
    select count(1) into v_record_count from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code;


    /* if @记录个数#=0 then */
    if v_record_count=0 then

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
            SET v_error_code = "pubA.28.172.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场业务记录编号出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @证券代码编号# = @当前编号#; */
        set v_stock_code_no = v_curr_no;

        /* [插入表记录][公共_证券基础数据_证券代码信息表][字段][字段变量][1][@市场编号#,@证券代码#,@证券名称#,@证券代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_basesedt_stock_code_info(
            create_date, create_time, update_date, 
            update_time, update_times, stock_code_no, exch_no, 
            stock_code, stock_name, pinyin_short, stock_type, 
            asset_type, par_value, crncy_type, exch_crncy_type, 
            total_stock_issue, circl_stock_capit, capit_reback_days, posi_reback_days, 
            type_unit, report_unit, min_unit, max_qty, 
            min_qty, is_order_dir_flag, price_up, price_down, 
            step_price, fair_price, stop_status, hk_stock_flag, 
            time_stamp) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_stock_code_no, v_exch_no, 
            v_stock_code, v_stock_name, v_pinyin_short, v_stock_type, 
            v_asset_type, v_par_value, v_crncy_type, v_exch_crncy_type, 
            v_total_stock_issue, v_circl_stock_capit, v_capit_reback_days, v_posi_reback_days, 
            v_type_unit, v_report_unit, v_min_unit, v_max_qty, 
            v_min_qty, v_is_order_dir_flag, v_price_up, v_price_down, 
            v_step_price, v_fair_price, v_stop_status, v_hk_stock_flag, 
            v_time_stamp);
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.28.172.1";
            SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            leave label_pro;
        end if;


    /* elseif @记录个数# >0 then */
    elseif v_record_count >0 then

            /* [更新表记录][公共_证券基础数据_证券代码信息表][{证券名称}=@证券名称#,{拼音简称}=@拼音简称#,{证券类型}=@证券类型#,{资产类型}=@资产类型#,{票面面值}=@票面面值#,{本币币种}=@本币币种#,{交易币种}=@交易币种#,{总股本}=@总股本#,{流通股本}=@流通股本#,{资金回转天数}=@资金回转天数#,{持仓回转天数}=@持仓回转天数#,{类型单位}=@类型单位#,{申报单位}=@申报单位#,{最小单位}=@最小单位#,{最大数量}=@最大数量#,{最小数量}=@最小数量#,{区分订单方向标志}=@区分订单方向标志#,{价格上限}=@价格上限#,{价格下限}=@价格下限#,{最小价差}=@最小价差#,{公允价格}=@公允价格#,{停牌标志}=@停牌标志#,{港股通标的}=@港股通标的#,{时间戳}=@时间戳#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][1][@市场编号#,@证券代码#,@证券名称#,@证券代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pub.tb_basesedt_stock_code_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_name=v_stock_name,pinyin_short=v_pinyin_short,stock_type=v_stock_type,asset_type=v_asset_type,par_value=v_par_value,crncy_type=v_crncy_type,exch_crncy_type=v_exch_crncy_type,total_stock_issue=v_total_stock_issue,circl_stock_capit=v_circl_stock_capit,capit_reback_days=v_capit_reback_days,posi_reback_days=v_posi_reback_days,type_unit=v_type_unit,report_unit=v_report_unit,min_unit=v_min_unit,max_qty=v_max_qty,min_qty=v_min_qty,is_order_dir_flag=v_is_order_dir_flag,price_up=v_price_up,price_down=v_price_down,step_price=v_step_price,fair_price=v_fair_price,stop_status=v_stop_status,hk_stock_flag=v_hk_stock_flag,time_stamp=v_time_stamp where exch_no=v_exch_no and stock_code=v_stock_code;
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.28.172.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;

    end if;
    #新股插入新股表  可转债发行不进入 新股表

    /* if (@市场编号#=《市场编号-上海证券交易所》  and  @证券类型#= 《证券类型-申购》) or (@市场编号#=《市场编号-深圳证券交易所》  and  @证券类型#= 《证券类型-股票》) then */
    if (v_exch_no=1  and  v_stock_type= 2) or (v_exch_no=2  and  v_stock_type= 1) then

         /* [获取表记录数量][公共_证券基础数据_证券新股代码信息表][@记录个数#][{市场编号}=@市场编号# and {证券代码}=@证券代码#] */
         select count(1) into v_record_count from db_pub.tb_basesedt_new_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code;


        /* [检查报错返回][@记录个数# <> 0][1][concat("该新股信息已存在！",@市场编号#,@证券代码#)] */
        if v_record_count <> 0 then
            
            SET v_error_code = "pubA.28.172.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("该新股信息已存在！",v_exch_no,v_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("该新股信息已存在！",v_exch_no,v_stock_code);
            end if;
            leave label_pro;
        end if;


         /* if @记录个数# = 0 then */
         if v_record_count = 0 then

                 /* [插入表记录][公共_证券基础数据_证券新股代码信息表][字段][字段变量][1][@市场编号#,@证券代码#,@证券名称#,@证券代码编号#] */
                 set v_create_date = date_format(curdate(),'%Y%m%d');
                 set v_create_time = date_format(curtime(),'%H%i%s');
                 set v_update_date = v_create_date;
                 set v_update_time = v_create_time;
                 set v_update_times = 1;
                 insert into db_pub.tb_basesedt_new_stock_code_info(
                     create_date, create_time, update_date, 
                     update_time, update_times, exch_no, stock_code, 
                     stock_name, trade_code, target_code, stock_code_no, 
                     trade_code_no, target_code_no, apply_date, apply_limit, 
                     begin_trade_date, issue_price) 
                 value( 
                     v_create_date, v_create_time, v_update_date, 
                     v_update_time, v_update_times, v_exch_no, v_stock_code, 
                     v_stock_name, v_trade_code, v_target_code, v_stock_code_no, 
                     v_trade_code_no, v_target_code_no, v_apply_date, v_apply_limit, 
                     v_begin_trade_date, v_issue_price);
                 if v_error_code = "1" then
                             
                     SET v_error_code = "pubA.28.172.1";
                     SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                     leave label_pro;
                 end if;

         end if;

         /* [获取表记录数量][公共_证券基础数据_证券代码映射表][@记录个数#][{市场编号}=@市场编号# and {证券代码}=@证券代码#] */
         select count(1) into v_record_count from db_pub.tb_basesedt_code_map where exch_no=v_exch_no and stock_code=v_stock_code;


         /* if @记录个数# = 0 then */
         if v_record_count = 0 then

                 /* [插入表记录][公共_证券基础数据_证券代码映射表][字段][字段变量][1][@市场编号#,@证券代码#,@证券名称#,@证券代码编号#] */
                 set v_create_date = date_format(curdate(),'%Y%m%d');
                 set v_create_time = date_format(curtime(),'%H%i%s');
                 set v_update_date = v_create_date;
                 set v_update_time = v_create_time;
                 set v_update_times = 1;
                 insert into db_pub.tb_basesedt_code_map(
                     create_date, create_time, update_date, 
                     update_time, update_times, stock_code_no, stock_code, 
                     exch_no, trade_code, target_code, time_stamp) 
                 value( 
                     v_create_date, v_create_time, v_update_date, 
                     v_update_time, v_update_times, v_stock_code_no, v_stock_code, 
                     v_exch_no, v_trade_code, v_target_code, v_time_stamp);
                 if v_error_code = "1" then
                             
                     SET v_error_code = "pubA.28.172.1";
                     SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                     leave label_pro;
                 end if;

         end if;
    end if;
    #可转债发行 证券代码 插入债券信息表  |申购代码不插入

    /* if (@证券类型#<>《证券类型-股票》 and  @证券类型#<> 《证券类型-申购》 and   @证券类型#<> 《证券类型-债券申购》)  then */
    if (v_stock_type<>1 and  v_stock_type<> 2 and   v_stock_type<> 32)  then

         /* [获取表记录数量][公共_证券基础数据_债券属性信息表][@记录个数#][{市场编号}=@市场编号# and {证券代码}=@证券代码#] */
         select count(1) into v_record_count from db_pub.tb_basesedt_bond_info where exch_no=v_exch_no and stock_code=v_stock_code;


         /* if @记录个数# = 0 then */
         if v_record_count = 0 then

                /* set @交易代码#=" "; */
                set v_trade_code=" ";

                /* set @标的代码#=" "; */
                set v_target_code=" ";

                /* set @发行日期#=0; */
                set v_issue_date=0;

                /* set @结束日期#=0; */
                set v_end_date=0;

                /* set @起息日期#=0; */
                set v_value_date=0;

                /* set @下一起息日期#=0; */
                set v_next_value_date=0;

                /* set @债券期限#=0; */
                set v_bond_limit=0;

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

                /* set @间隔天数#=0; */
                set v_inteval_days=0;

                /* set @净价标志#=0; */
                set v_net_price_flag=0;

                /* set @最后交易日#=0; */
                set v_last_trade_date=0;

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

                /* set @质押比例#=0; */
                set v_impawn_ratio=0;

                /* set @付息标志#=0; */
                set v_pay_intrst_flag=0;

                 /* [插入表记录][公共_证券基础数据_债券属性信息表][字段][字段变量][1][@市场编号#,@证券代码#,@证券名称#,@证券代码编号#] */
                 set v_create_date = date_format(curdate(),'%Y%m%d');
                 set v_create_time = date_format(curtime(),'%H%i%s');
                 set v_update_date = v_create_date;
                 set v_update_time = v_create_time;
                 set v_update_times = 1;
                 insert into db_pub.tb_basesedt_bond_info(
                     create_date, create_time, update_date, 
                     update_time, update_times, exch_no, stock_code, 
                     trade_code, target_code, stock_code_no, trade_code_no, 
                     target_code_no, stock_name, issue_date, end_date, 
                     value_date, next_value_date, begin_trade_date, bond_limit, 
                     issue_price, par_value, intrst_ratio, intrst_days, 
                     pay_inteval, bond_accr_intrst, bond_rate_type, inteval_days, 
                     net_price_flag, last_trade_date, rights_type, trans_begin_date, 
                     trans_end_date, exec_begin_date, exec_end_date, impawn_ratio, 
                     pay_intrst_flag, time_stamp) 
                 value( 
                     v_create_date, v_create_time, v_update_date, 
                     v_update_time, v_update_times, v_exch_no, v_stock_code, 
                     v_trade_code, v_target_code, v_stock_code_no, v_trade_code_no, 
                     v_target_code_no, v_stock_name, v_issue_date, v_end_date, 
                     v_value_date, v_next_value_date, v_begin_trade_date, v_bond_limit, 
                     v_issue_price, v_par_value, v_intrst_ratio, v_intrst_days, 
                     v_pay_inteval, v_bond_accr_intrst, v_bond_rate_type, v_inteval_days, 
                     v_net_price_flag, v_last_trade_date, v_rights_type, v_trans_begin_date, 
                     v_trans_end_date, v_exec_begin_date, v_exec_end_date, v_impawn_ratio, 
                     v_pay_intrst_flag, v_time_stamp);
                 if v_error_code = "1" then
                             
                     SET v_error_code = "pubA.28.172.1";
                     SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                     leave label_pro;
                 end if;

         end if;
    end if;

    /* if (@证券类型#<>《证券类型-股票》 and  @证券类型#<> 《证券类型-申购》 and   @证券类型#<> 《证券类型-可转债》)  then */
    if (v_stock_type<>1 and  v_stock_type<> 2 and   v_stock_type<> 24)  then
         #申购代码插入 可转债表

         /* [获取表记录数量][公共_证券基础数据_可转债代码信息表][@记录个数#][{市场编号}=@市场编号# and {证券代码}=@证券代码#] */
         select count(1) into v_record_count from db_pub.tb_basesedt_convertible_bond_info where exch_no=v_exch_no and stock_code=v_stock_code;


        /* [检查报错返回][@记录个数# <> 0][1][concat("该可转债信息已存在！",@市场编号#,@证券代码#)] */
        if v_record_count <> 0 then
            
            SET v_error_code = "pubA.28.172.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("该可转债信息已存在！",v_exch_no,v_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("该可转债信息已存在！",v_exch_no,v_stock_code);
            end if;
            leave label_pro;
        end if;


         /* if @记录个数# = 0 then */
         if v_record_count = 0 then

                 /* [插入表记录][公共_证券基础数据_可转债代码信息表][字段][字段变量][1][@市场编号#,@证券代码#,@证券名称#,@证券代码编号#] */
                 set v_create_date = date_format(curdate(),'%Y%m%d');
                 set v_create_time = date_format(curtime(),'%H%i%s');
                 set v_update_date = v_create_date;
                 set v_update_time = v_create_time;
                 set v_update_times = 1;
                 insert into db_pub.tb_basesedt_convertible_bond_info(
                     create_date, create_time, update_date, 
                     update_time, update_times, exch_no, stock_code, 
                     stock_name, trade_code, target_code, stock_code_no, 
                     trade_code_no, target_code_no, apply_date, apply_limit, 
                     begin_trade_date, issue_price) 
                 value( 
                     v_create_date, v_create_time, v_update_date, 
                     v_update_time, v_update_times, v_exch_no, v_stock_code, 
                     v_stock_name, v_trade_code, v_target_code, v_stock_code_no, 
                     v_trade_code_no, v_target_code_no, v_apply_date, v_apply_limit, 
                     v_begin_trade_date, v_issue_price);
                 if v_error_code = "1" then
                             
                     SET v_error_code = "pubA.28.172.1";
                     SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                     leave label_pro;
                 end if;

         end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_新增证券行情信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_AddStockQuotInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_AddStockQuotInfo(
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
    IN p_issue_price decimal(16,9),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_last_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_issue_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_time_stamp int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_issue_price = p_issue_price;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_last_price = p_last_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_time_stamp = unix_timestamp();
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @证券代码编号# = 0; */
    set v_stock_code_no = 0;

    /* set @时间戳# = unix_timestamp(); */
    set v_time_stamp = unix_timestamp();

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select stock_code_no into v_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.28.173.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@证券代码编号# = 0][4][@市场编号#,@证券代码#] */
    if v_stock_code_no = 0 then
        
        SET v_error_code = "pubA.28.173.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* set @昨收盘价#=0; */
    set v_pre_close_price=0;

    /* set @今开盘价#=0; */
    set v_today_open_price=0;

    /* set @今收盘价#=0; */
    set v_today_close_price=0;

    /* set @今最高价#=0; */
    set v_today_max_price=0;

    /* set @今最低价#=0; */
    set v_today_min_price=0;

    /* set @买一价#=0; */
    set v_buy_price_1=0;

    /* set @买一量#=0; */
    set v_buy_qty_1=0;

    /* set @买二价#=0; */
    set v_buy_price_2=0;

    /* set @买二量#=0; */
    set v_buy_qty_2=0;

    /* set @买三价#=0; */
    set v_buy_price_3=0;

    /* set @买三量#=0; */
    set v_buy_qty_3=0;

    /* set @买四价#=0; */
    set v_buy_price_4=0;

    /* set @买四量#=0; */
    set v_buy_qty_4=0;

    /* set @买五价#=0; */
    set v_buy_price_5=0;

    /* set @买五量#=0; */
    set v_buy_qty_5=0;

    /* set @卖一价#=0; */
    set v_sell_price_1=0;

    /* set @卖一量#=0; */
    set v_sell_qty_1=0;

    /* set @卖二价#=0; */
    set v_sell_price_2=0;

    /* set @卖二量#=0; */
    set v_sell_qty_2=0;

    /* set @卖三价#=0; */
    set v_sell_price_3=0;

    /* set @卖三量#=0; */
    set v_sell_qty_3=0;

    /* set @卖四价#=0; */
    set v_sell_price_4=0;

    /* set @卖四量#=0; */
    set v_sell_qty_4=0;

    /* set @卖五价#=0; */
    set v_sell_price_5=0;

    /* set @卖五量#=0; */
    set v_sell_qty_5=0;

    /* set @成交数量#=0; */
    set v_strike_qty=0;

    /* set @成交金额#=0; */
    set v_strike_amt=0;

    /* set @市盈率#=0; */
    set v_pe_ratio=0;

    /* [插入重复更新][公共_证券基础数据_证券行情表][字段][字段变量][{涨停价}=@涨停价#,{跌停价}=@跌停价#,{最新价}=@最新价#][1][@市场编号#,@证券代码#,@证券名称#,@证券代码编号#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, up_limit_price=v_up_limit_price,down_limit_price=v_down_limit_price,last_price=v_last_price;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.28.173.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    #[获取表记录数量][公共_证券基础数据_证券行情表][@记录个数#][{市场编号}=@市场编号# and {证券代码}=@证券代码#]
    #if @记录个数# = 0 then
       #  [插入表记录][公共_证券基础数据_证券行情表][字段][字段变量][1][@市场编号#,@证券代码#,@证券名称#,@证券代码编号#]
    #end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_更新基金信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_UpdateFundInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_UpdateFundInfo(
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
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_pre_close_price decimal(16,9),
    IN p_fair_price decimal(16,9),
    IN p_stop_status varchar(2),
    IN p_hk_stock_flag int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_stop_status varchar(2);
    declare v_hk_stock_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_record_count int;
    declare v_time_stamp int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
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
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_pre_close_price = p_pre_close_price;
    SET v_fair_price = p_fair_price;
    SET v_stop_status = p_stop_status;
    SET v_hk_stock_flag = p_hk_stock_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_record_count = 0;
    SET v_time_stamp = unix_timestamp();
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @证券代码编号# = 0; */
    set v_stock_code_no = 0;

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* set @时间戳# = unix_timestamp(); */
    set v_time_stamp = unix_timestamp();

    /* set @编号类型# =8 ; */
    set v_record_no_type =8 ;

    /* [获取表记录数量][公共_证券基础数据_证券代码信息表][@记录个数#][{市场编号}=@市场编号# and {证券代码}=@证券代码#] */
    select count(1) into v_record_count from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code;


    /* if @记录个数#=0 then */
    if v_record_count=0 then

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
            SET v_error_code = "pubA.28.173.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场业务记录编号出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @证券代码编号# = @当前编号#; */
        set v_stock_code_no = v_curr_no;

        /* [插入表记录][公共_证券基础数据_证券代码信息表][字段][字段变量][1][@市场编号#,@证券代码#,@证券名称#,@证券代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_basesedt_stock_code_info(
            create_date, create_time, update_date, 
            update_time, update_times, stock_code_no, exch_no, 
            stock_code, stock_name, pinyin_short, stock_type, 
            asset_type, par_value, crncy_type, exch_crncy_type, 
            total_stock_issue, circl_stock_capit, capit_reback_days, posi_reback_days, 
            type_unit, report_unit, min_unit, max_qty, 
            min_qty, is_order_dir_flag, price_up, price_down, 
            step_price, fair_price, stop_status, hk_stock_flag, 
            time_stamp) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_stock_code_no, v_exch_no, 
            v_stock_code, v_stock_name, v_pinyin_short, v_stock_type, 
            v_asset_type, v_par_value, v_crncy_type, v_exch_crncy_type, 
            v_total_stock_issue, v_circl_stock_capit, v_capit_reback_days, v_posi_reback_days, 
            v_type_unit, v_report_unit, v_min_unit, v_max_qty, 
            v_min_qty, v_is_order_dir_flag, v_price_up, v_price_down, 
            v_step_price, v_fair_price, v_stop_status, v_hk_stock_flag, 
            v_time_stamp);
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.28.173.1";
            SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            leave label_pro;
        end if;


    /* elseif @记录个数# >0 then */
    elseif v_record_count >0 then

            /* [更新表记录][公共_证券基础数据_证券代码信息表][{证券名称}=@证券名称#,{拼音简称}=@拼音简称#,{证券类型}=@证券类型#,{资产类型}=@资产类型#,{票面面值}=@票面面值#,{本币币种}=@本币币种#,{交易币种}=@交易币种#,{总股本}=@总股本#,{流通股本}=@流通股本#,{资金回转天数}=@资金回转天数#,{持仓回转天数}=@持仓回转天数#,{类型单位}=@类型单位#,{申报单位}=@申报单位#,{最小单位}=@最小单位#,{最大数量}=@最大数量#,{最小数量}=@最小数量#,{价格上限}=@价格上限#,{价格下限}=@价格下限#,{时间戳}=@时间戳#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][1][@市场编号#,@证券代码#,@证券名称#,@证券代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pub.tb_basesedt_stock_code_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_name=v_stock_name,pinyin_short=v_pinyin_short,stock_type=v_stock_type,asset_type=v_asset_type,par_value=v_par_value,crncy_type=v_crncy_type,exch_crncy_type=v_exch_crncy_type,total_stock_issue=v_total_stock_issue,circl_stock_capit=v_circl_stock_capit,capit_reback_days=v_capit_reback_days,posi_reback_days=v_posi_reback_days,type_unit=v_type_unit,report_unit=v_report_unit,min_unit=v_min_unit,max_qty=v_max_qty,min_qty=v_min_qty,price_up=v_price_up,price_down=v_price_down,time_stamp=v_time_stamp where exch_no=v_exch_no and stock_code=v_stock_code;
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.28.173.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no);
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

# 原子_公共_基础数据同步_更新债券信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_UpdateBondInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_UpdateBondInfo(
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
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_pre_close_price decimal(16,9),
    IN p_fair_price decimal(16,9),
    IN p_stop_status varchar(2),
    IN p_hk_stock_flag int,
    IN p_trade_code varchar(6),
    IN p_target_code varchar(6),
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_issue_date int,
    IN p_end_date int,
    IN p_value_date int,
    IN p_next_value_date int,
    IN p_begin_trade_date int,
    IN p_bond_limit decimal(18,2),
    IN p_issue_price decimal(16,9),
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_stop_status varchar(2);
    declare v_hk_stock_flag int;
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_issue_date int;
    declare v_end_date int;
    declare v_value_date int;
    declare v_next_value_date int;
    declare v_begin_trade_date int;
    declare v_bond_limit decimal(18,2);
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_record_count int;
    declare v_time_stamp int;
    declare v_record_no_type int;
    declare v_pay_intrst_flag int;
    declare v_curr_no bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_tmp_record_count int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_pre_close_price = p_pre_close_price;
    SET v_fair_price = p_fair_price;
    SET v_stop_status = p_stop_status;
    SET v_hk_stock_flag = p_hk_stock_flag;
    SET v_trade_code = p_trade_code;
    SET v_target_code = p_target_code;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_issue_date = p_issue_date;
    SET v_end_date = p_end_date;
    SET v_value_date = p_value_date;
    SET v_next_value_date = p_next_value_date;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_bond_limit = p_bond_limit;
    SET v_issue_price = p_issue_price;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_record_count = 0;
    SET v_time_stamp = unix_timestamp();
    SET v_record_no_type = 0;
    SET v_pay_intrst_flag = 0;
    SET v_curr_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_tmp_record_count = 0;

    
    label_pro:BEGIN
    

    /* set @证券代码编号# = 0; */
    set v_stock_code_no = 0;

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* set @时间戳# = unix_timestamp(); */
    set v_time_stamp = unix_timestamp();

    /* set @编号类型# =8 ; */
    set v_record_no_type =8 ;

    /* [获取表记录数量][公共_证券基础数据_证券代码信息表][@记录个数#][{市场编号}=@市场编号# and {证券代码}=@证券代码#] */
    select count(1) into v_record_count from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code;


     /* set @付息标志# = 0; */
     set v_pay_intrst_flag = 0;

    /* if @记录个数#=0 then */
    if v_record_count=0 then

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
            SET v_error_code = "pubA.28.174.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场业务记录编号出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @证券代码编号# = @当前编号#; */
        set v_stock_code_no = v_curr_no;

        /* [插入表记录][公共_证券基础数据_证券代码信息表][字段][字段变量][1][@市场编号#,@证券代码#,@证券名称#,@证券代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_basesedt_stock_code_info(
            create_date, create_time, update_date, 
            update_time, update_times, stock_code_no, exch_no, 
            stock_code, stock_name, pinyin_short, stock_type, 
            asset_type, par_value, crncy_type, exch_crncy_type, 
            total_stock_issue, circl_stock_capit, capit_reback_days, posi_reback_days, 
            type_unit, report_unit, min_unit, max_qty, 
            min_qty, is_order_dir_flag, price_up, price_down, 
            step_price, fair_price, stop_status, hk_stock_flag, 
            time_stamp) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_stock_code_no, v_exch_no, 
            v_stock_code, v_stock_name, v_pinyin_short, v_stock_type, 
            v_asset_type, v_par_value, v_crncy_type, v_exch_crncy_type, 
            v_total_stock_issue, v_circl_stock_capit, v_capit_reback_days, v_posi_reback_days, 
            v_type_unit, v_report_unit, v_min_unit, v_max_qty, 
            v_min_qty, v_is_order_dir_flag, v_price_up, v_price_down, 
            v_step_price, v_fair_price, v_stop_status, v_hk_stock_flag, 
            v_time_stamp);
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.28.174.1";
            SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            leave label_pro;
        end if;

    #非债券质押 插入

        /* if @证券类型#<>28  then */
        if v_stock_type<>28  then

            /* [插入表记录][公共_证券基础数据_债券属性信息表][字段][字段变量][1][@市场编号#,@证券代码#,@证券名称#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pub.tb_basesedt_bond_info(
                create_date, create_time, update_date, 
                update_time, update_times, exch_no, stock_code, 
                trade_code, target_code, stock_code_no, trade_code_no, 
                target_code_no, stock_name, issue_date, end_date, 
                value_date, next_value_date, begin_trade_date, bond_limit, 
                issue_price, par_value, intrst_ratio, intrst_days, 
                pay_inteval, bond_accr_intrst, bond_rate_type, inteval_days, 
                net_price_flag, last_trade_date, rights_type, trans_begin_date, 
                trans_end_date, exec_begin_date, exec_end_date, impawn_ratio, 
                pay_intrst_flag, time_stamp) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_exch_no, v_stock_code, 
                v_trade_code, v_target_code, v_stock_code_no, v_trade_code_no, 
                v_target_code_no, v_stock_name, v_issue_date, v_end_date, 
                v_value_date, v_next_value_date, v_begin_trade_date, v_bond_limit, 
                v_issue_price, v_par_value, v_intrst_ratio, v_intrst_days, 
                v_pay_inteval, v_bond_accr_intrst, v_bond_rate_type, v_inteval_days, 
                v_net_price_flag, v_last_trade_date, v_rights_type, v_trans_begin_date, 
                v_trans_end_date, v_exec_begin_date, v_exec_end_date, v_impawn_ratio, 
                v_pay_intrst_flag, v_time_stamp);
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.28.174.1";
                SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                leave label_pro;
            end if;

        end if;
    #质押代码 插入 映射表

        /* if @证券类型#=28 and @市场编号#=1 then */
        if v_stock_type=28 and v_exch_no=1 then

            /* [插入表记录][公共_证券基础数据_证券代码映射表][字段][字段变量][1][@市场编号#,@证券代码#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pub.tb_basesedt_code_map(
                create_date, create_time, update_date, 
                update_time, update_times, stock_code_no, stock_code, 
                exch_no, trade_code, target_code, time_stamp) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_stock_code_no, v_stock_code, 
                v_exch_no, v_trade_code, v_target_code, v_time_stamp);
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.28.174.1";
                SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                leave label_pro;
            end if;

        end if;

        /* if @市场编号#=2 and @质押比例#<>0  then */
        if v_exch_no=2 and v_impawn_ratio<>0  then

             /* set @交易代码# = @证券代码#; */
             set v_trade_code = v_stock_code;

             /* set @标的代码# = "131990"; */
             set v_target_code = "131990";

            /* [插入表记录][公共_证券基础数据_证券代码映射表][字段][字段变量][1][@市场编号#,@证券代码#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pub.tb_basesedt_code_map(
                create_date, create_time, update_date, 
                update_time, update_times, stock_code_no, stock_code, 
                exch_no, trade_code, target_code, time_stamp) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_stock_code_no, v_stock_code, 
                v_exch_no, v_trade_code, v_target_code, v_time_stamp);
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.28.174.1";
                SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                leave label_pro;
            end if;

        end if;
    #证券代码信息表原有的，还需再确定债券信息表和映射表是否有

    /* elseif @记录个数# >0 then */
    elseif v_record_count >0 then

            /* [更新表记录][公共_证券基础数据_证券代码信息表][{证券名称}=@证券名称#,{拼音简称}=@拼音简称#,{证券类型}=@证券类型#,{资产类型}=@资产类型#,{票面面值}=@票面面值#,{本币币种}=@本币币种#,{交易币种}=@交易币种#,{总股本}=@总股本#,{流通股本}=@流通股本#,{资金回转天数}=@资金回转天数#,{持仓回转天数}=@持仓回转天数#,{类型单位}=@类型单位#,{申报单位}=@申报单位#,{最小单位}=@最小单位#,{最大数量}=@最大数量#,{最小数量}=@最小数量#,{价格上限}=@价格上限#,{价格下限}=@价格下限#,{停牌标志}=@停牌标志#,{时间戳}=@时间戳#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][1][@市场编号#,@证券代码#,@证券名称#,@证券代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pub.tb_basesedt_stock_code_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_name=v_stock_name,pinyin_short=v_pinyin_short,stock_type=v_stock_type,asset_type=v_asset_type,par_value=v_par_value,crncy_type=v_crncy_type,exch_crncy_type=v_exch_crncy_type,total_stock_issue=v_total_stock_issue,circl_stock_capit=v_circl_stock_capit,capit_reback_days=v_capit_reback_days,posi_reback_days=v_posi_reback_days,type_unit=v_type_unit,report_unit=v_report_unit,min_unit=v_min_unit,max_qty=v_max_qty,min_qty=v_min_qty,price_up=v_price_up,price_down=v_price_down,stop_status=v_stop_status,time_stamp=v_time_stamp where exch_no=v_exch_no and stock_code=v_stock_code;
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.28.174.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券名称=",v_stock_name,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;


            /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
            select stock_code_no into v_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.28.174.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                end if;
                leave label_pro;
            end if;


            /* if @证券类型# <>28  then */
            if v_stock_type <>28  then

                /* [插入重复更新][公共_证券基础数据_债券属性信息表][字段][字段变量][{交易代码}=@交易代码#,{标的代码}=@标的代码#,{交易代码编号}=@交易代码编号#,{标的代码编号}=@标的代码编号#,{证券名称}=@证券名称#,{发行日期}=@发行日期#,{结束日期}=@结束日期#,{起息日期}=@起息日期#,{下一起息日期}=@下一起息日期#,{上市日期}=@上市日期#,{债券期限}=@债券期限#,{发行价}=@发行价#,{票面面值}=@票面面值#,{年利率}=@年利率#,{计息天数}=@计息天数#,{付息间隔}=@付息间隔#,{债券计提利息}=@债券计提利息#,{债券利率类型}=@债券利率类型#,{间隔天数}=@间隔天数#,{净价标志}=@净价标志#,{最后交易日}=@最后交易日#,{权益类型}=@权益类型#,{转股开始日期}=@转股开始日期#,{转股结束日期}=@转股结束日期#,{行权开始日期}=@行权开始日期#,{行权结束日期}=@行权结束日期#,{质押比例}=@质押比例#,{付息标志}=@付息标志#,{时间戳}=@时间戳#][1][@市场编号#,@证券代码#] */
                set v_create_date = date_format(curdate(),'%Y%m%d');
                set v_create_time = date_format(curtime(),'%H%i%s');
                set v_update_date = v_create_date;
                set v_update_time = v_create_time;
                set v_update_times = 1;
                insert into db_pub.tb_basesedt_bond_info (
                    create_date, create_time, update_date, 
                    update_time, update_times, exch_no, stock_code, 
                    trade_code, target_code, stock_code_no, trade_code_no, 
                    target_code_no, stock_name, issue_date, end_date, 
                    value_date, next_value_date, begin_trade_date, bond_limit, 
                    issue_price, par_value, intrst_ratio, intrst_days, 
                    pay_inteval, bond_accr_intrst, bond_rate_type, inteval_days, 
                    net_price_flag, last_trade_date, rights_type, trans_begin_date, 
                    trans_end_date, exec_begin_date, exec_end_date, impawn_ratio, 
                    pay_intrst_flag, time_stamp) 
                values(
                    v_create_date, v_create_time, v_update_date, 
                    v_update_time, v_update_times, v_exch_no, v_stock_code, 
                    v_trade_code, v_target_code, v_stock_code_no, v_trade_code_no, 
                    v_target_code_no, v_stock_name, v_issue_date, v_end_date, 
                    v_value_date, v_next_value_date, v_begin_trade_date, v_bond_limit, 
                    v_issue_price, v_par_value, v_intrst_ratio, v_intrst_days, 
                    v_pay_inteval, v_bond_accr_intrst, v_bond_rate_type, v_inteval_days, 
                    v_net_price_flag, v_last_trade_date, v_rights_type, v_trans_begin_date, 
                    v_trans_end_date, v_exec_begin_date, v_exec_end_date, v_impawn_ratio, 
                    v_pay_intrst_flag, v_time_stamp) 
                ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, trade_code=v_trade_code,target_code=v_target_code,trade_code_no=v_trade_code_no,target_code_no=v_target_code_no,stock_name=v_stock_name,issue_date=v_issue_date,end_date=v_end_date,value_date=v_value_date,next_value_date=v_next_value_date,begin_trade_date=v_begin_trade_date,bond_limit=v_bond_limit,issue_price=v_issue_price,par_value=v_par_value,intrst_ratio=v_intrst_ratio,intrst_days=v_intrst_days,pay_inteval=v_pay_inteval,bond_accr_intrst=v_bond_accr_intrst,bond_rate_type=v_bond_rate_type,inteval_days=v_inteval_days,net_price_flag=v_net_price_flag,last_trade_date=v_last_trade_date,rights_type=v_rights_type,trans_begin_date=v_trans_begin_date,trans_end_date=v_trans_end_date,exec_begin_date=v_exec_begin_date,exec_end_date=v_exec_end_date,impawn_ratio=v_impawn_ratio,pay_intrst_flag=v_pay_intrst_flag,time_stamp=v_time_stamp;
                if v_error_code = "1" then
                            
                    SET v_error_code = "pubA.28.174.1";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                    end if;
                    leave label_pro;
                end if;

            end if;

            /* [获取表记录数量][公共_证券基础数据_证券代码映射表][@临时_记录个数#][{证券代码编号}=@证券代码编号#] */
            select count(1) into v_tmp_record_count from db_pub.tb_basesedt_code_map where stock_code_no=v_stock_code_no;


            /* if @临时_记录个数#=0  then */
            if v_tmp_record_count=0  then

                    /* if @证券类型#=28 and @市场编号#=1 then */
                    if v_stock_type=28 and v_exch_no=1 then

                          /* [插入表记录][公共_证券基础数据_证券代码映射表][字段][字段变量][1][@市场编号#,@证券代码#,@证券代码编号#] */
                          set v_create_date = date_format(curdate(),'%Y%m%d');
                          set v_create_time = date_format(curtime(),'%H%i%s');
                          set v_update_date = v_create_date;
                          set v_update_time = v_create_time;
                          set v_update_times = 1;
                          insert into db_pub.tb_basesedt_code_map(
                              create_date, create_time, update_date, 
                              update_time, update_times, stock_code_no, stock_code, 
                              exch_no, trade_code, target_code, time_stamp) 
                          value( 
                              v_create_date, v_create_time, v_update_date, 
                              v_update_time, v_update_times, v_stock_code_no, v_stock_code, 
                              v_exch_no, v_trade_code, v_target_code, v_time_stamp);
                          if v_error_code = "1" then
                                      
                              SET v_error_code = "pubA.28.174.1";
                              SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                              leave label_pro;
                          end if;

                    end if;

                    /* if @市场编号#=2 and @质押比例#<>0  then */
                    if v_exch_no=2 and v_impawn_ratio<>0  then

                          /* set @交易代码# = @证券代码#; */
                          set v_trade_code = v_stock_code;

                          /* set @标的代码# = "131990"; */
                          set v_target_code = "131990";

                         /* [插入表记录][公共_证券基础数据_证券代码映射表][字段][字段变量][1][@市场编号#,@证券代码#,@证券代码编号#] */
                         set v_create_date = date_format(curdate(),'%Y%m%d');
                         set v_create_time = date_format(curtime(),'%H%i%s');
                         set v_update_date = v_create_date;
                         set v_update_time = v_create_time;
                         set v_update_times = 1;
                         insert into db_pub.tb_basesedt_code_map(
                             create_date, create_time, update_date, 
                             update_time, update_times, stock_code_no, stock_code, 
                             exch_no, trade_code, target_code, time_stamp) 
                         value( 
                             v_create_date, v_create_time, v_update_date, 
                             v_update_time, v_update_times, v_stock_code_no, v_stock_code, 
                             v_exch_no, v_trade_code, v_target_code, v_time_stamp);
                         if v_error_code = "1" then
                                     
                             SET v_error_code = "pubA.28.174.1";
                             SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                             leave label_pro;
                         end if;

                    end if;
            end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_查询自动同步设置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_QueryAutoSyncSet;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_QueryAutoSyncSet(
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
    declare v_mach_time int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_mach_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #同步请求类型1表示只查询当前时间内需要处理的

    /* if @同步请求类型# =1 then */
    if v_sync_req_type =1 then

      /* [获取机器时间][@机器时间#] */
      select date_format(curtime(),'%H%i%s') into v_mach_time;

    end if;

    /* [获取表全记录][公共_基础数据同步_自动同步设置表][字段][(@机构编号#={机构编号} or (@机构编号#=0 and {机构编号}>0 ))  and (@运维端自动同步类型#={运维端自动同步类型} or @运维端自动同步类型#=0) and ( @同步请求类型# = 0 or ( @机器时间#>{开始时间} and @机器时间# < {结束时间}) ) ] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        auto_sync_type, capital_batch_deal_range, posi_batch_deal_range, begin_time, 
        auto_sync_deal_flag, end_time, is_batch_deal, is_inner_check, 
        remark_info from db_pub.tb_auto_sync_set where (v_co_no=co_no or (v_co_no=0 and co_no>0 ))  and (v_auto_sync_type=auto_sync_type or v_auto_sync_type=0) and ( v_sync_req_type = 0 or ( v_mach_time>begin_time and v_mach_time < end_time) ) ;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_新增自动同步设置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_AddAutoSyncSet;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_AddAutoSyncSet(
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
    declare v_auto_sync_deal_flag int;
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
    SET v_auto_sync_deal_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @自动同步处理标志#=1; */
    set v_auto_sync_deal_flag=1;

    /* if @运维端自动同步类型# =1 then */
    if v_auto_sync_type =1 then

      /* set @自动同步处理标志#=0; */
      set v_auto_sync_deal_flag=0;
    end if;

    /* [插入表记录][公共_基础数据同步_自动同步设置表][字段][字段变量][1][@运维端自动同步类型#,@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_auto_sync_set(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, auto_sync_type, 
        capital_batch_deal_range, posi_batch_deal_range, begin_time, auto_sync_deal_flag, 
        end_time, is_batch_deal, is_inner_check, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_auto_sync_type, 
        v_capital_batch_deal_range, v_posi_batch_deal_range, v_begin_time, v_auto_sync_deal_flag, 
        v_end_time, v_is_batch_deal, v_is_inner_check, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.28.102.1";
        SET v_error_info =  CONCAT(concat("运维端自动同步类型=",v_auto_sync_type,",","机构编号=",v_co_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_修改自动同步设置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_EditAutoSyncSet;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_EditAutoSyncSet(
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_基础数据同步_自动同步设置表][{资金批量处理范围}=@资金批量处理范围#,{持仓批量处理范围}=@持仓批量处理范围#,{开始时间}=@开始时间#,{开始时间}=@开始时间#,{结束时间}=@结束时间#,{是否批量处理}=@是否批量处理#,{早盘自动同步是否内部核对}=@早盘自动同步是否内部核对#,{备注信息}=@备注信息#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_auto_sync_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, capital_batch_deal_range=v_capital_batch_deal_range,posi_batch_deal_range=v_posi_batch_deal_range,begin_time=v_begin_time,begin_time=v_begin_time,end_time=v_end_time,is_batch_deal=v_is_batch_deal,is_inner_check=v_is_inner_check,remark_info=v_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.28.103.2";
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
use db_pub;;

# 原子_公共_基础数据同步_删除自动同步设置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_DeleteAutoSyncSet;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_DeleteAutoSyncSet(
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
    

    /* [删除表记录][公共_基础数据同步_自动同步设置表][{记录序号} = @记录序号#][3][@记录序号#] */
    delete from db_pub.tb_auto_sync_set 
        where row_id = v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.28.104.3";
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
use db_pub;;

# 原子_公共_基础数据同步_更新自动同步处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_UpdateDealFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_UpdateDealFlag(
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
    SET v_row_id = p_row_id;
    SET v_auto_sync_deal_flag = p_auto_sync_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_基础数据同步_自动同步设置表][{自动同步处理标志}=@自动同步处理标志#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_auto_sync_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, auto_sync_deal_flag=v_auto_sync_deal_flag where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.28.105.2";
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
use db_pub;;

# 原子_公共_基础数据同步_查询自动同步日志表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_QueryAutoSynclog;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_QueryAutoSynclog(
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
    

    /* [获取表全记录][公共_基础数据同步_自动同步日志表][字段][(@机构编号#={机构编号} or @机构编号#=0 )  and ( instr({流程类型名},@流程类型名#)  > 0 or @流程类型名#=" ") ] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        process_type_name, process_name, event_msg_content, remark_info from db_pub.tb_auto_sync_log where (v_co_no=co_no or v_co_no=0 )  and ( instr(process_type_name,v_process_type_name)  > 0 or v_process_type_name=" ") ;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_新增自动同步日志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_AddAutoSyncLog;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_AddAutoSyncLog(
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
    SET v_co_no = p_co_no;
    SET v_process_type_name = p_process_type_name;
    SET v_process_name = p_process_name;
    SET v_event_msg_content = p_event_msg_content;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][公共_基础数据同步_自动同步日志表][字段][字段变量][1][@机构编号#,@流程类型名#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_auto_sync_log(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, process_type_name, 
        process_name, event_msg_content, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_process_type_name, 
        v_process_name, v_event_msg_content, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.28.107.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","流程类型名=",v_process_type_name),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_清空自动同步日志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_ClearAutoSyncLog;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_ClearAutoSyncLog(
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
    

    /* if @机构编号# =0 then */
    if v_co_no =0 then
        TRUNCATE table tb_auto_sync_log;

    /* elseif @机构编号# >0 then */
    elseif v_co_no >0 then

        /* delete from tb_auto_sync_log where co_no=@机构编号#; */
        delete from tb_auto_sync_log where co_no=v_co_no;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础数据同步_查询自动同步内部核对设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesync_QueryAutoSyncInnerCheck;;
DELIMITER ;;
CREATE PROCEDURE pra_basesync_QueryAutoSyncInnerCheck(
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
    declare v_mach_time int;
    declare v_begin_time int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_begin_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #机器时间格式 160425

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @开始时间#=0; */
    set v_begin_time=0;

    /* SELECT begin_time into @开始时间# FROM tb_auto_sync_set WHERE is_inner_check = 1 AND auto_sync_type = 1 ORDER BY begin_time LIMIT 1; */
    SELECT begin_time into v_begin_time FROM tb_auto_sync_set WHERE is_inner_check = 1 AND auto_sync_type = 1 ORDER BY begin_time LIMIT 1;

    /* SELECT count(1) into @未处理记录数# FROM DUAL WHERE (@机器时间#-@机器时间#%100)/100 =(@开始时间#-@开始时间#%100)/100; */
    SELECT count(1) into v_total_fail_count FROM DUAL WHERE (v_mach_time-v_mach_time%100)/100 =(v_begin_time-v_begin_time%100)/100;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_total_fail_count = v_total_fail_count;

END;;


