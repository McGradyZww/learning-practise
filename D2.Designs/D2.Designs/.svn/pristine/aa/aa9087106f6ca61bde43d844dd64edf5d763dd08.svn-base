DELIMITER ;;
use db_pub;;

# 原子_公共_清算接口_证券价格除权处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clearif_SecuPriceExRightsDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_clearif_SecuPriceExRightsDeal(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_price_occur_amt decimal(18,4),
    IN p_price_occur_ratio decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_target_code varchar(6),
    OUT p_target_code_no int,
    OUT p_impawn_ratio decimal(18,12)
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
    declare v_price_occur_amt decimal(18,4);
    declare v_price_occur_ratio decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_target_code varchar(6);
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_stock_type int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_last_price decimal(16,9);
    declare v_net_price_flag int;
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
    SET v_price_occur_amt = p_price_occur_amt;
    SET v_price_occur_ratio = p_price_occur_ratio;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_target_code = " ";
    SET v_target_code_no = 0;
    SET v_impawn_ratio = 0;
    SET v_stock_type = 0;
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_last_price = 0;
    SET v_net_price_flag = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券类型},{证券代码},{市场编号}][@证券类型#,@证券代码#,@市场编号#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
    select stock_type,stock_code,exch_no into v_stock_type,v_stock_code,v_exch_no from db_pub.tb_basesedt_stock_code_info where stock_code_no=v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.26.1.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][公共_证券基础数据_证券行情表][{最新价}][@最新价#][{证券代码编号}=@证券代码编号#] */
    select last_price into v_last_price from db_pub.tb_basesedt_stock_quot where stock_code_no=v_stock_code_no limit 1;


    /* if @证券类型#>20 and @证券类型#<50 then */
    if v_stock_type>20 and v_stock_type<50 then

        /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{净价标志},{质押比例}][@净价标志#,@质押比例#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
        select net_price_flag,impawn_ratio into v_net_price_flag,v_impawn_ratio from db_pub.tb_basesedt_bond_info where stock_code_no=v_stock_code_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.26.1.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;


        /* if @净价标志#=《净价标志-全价》 then */
        if v_net_price_flag=2 then

            /* [更新表记录][公共_证券基础数据_证券行情表][{最新价}=round({最新价}-@价格变动金额#,3)][{证券代码编号}=@证券代码编号#][2][@证券代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pub.tb_basesedt_stock_quot set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, last_price=round(last_price-v_price_occur_amt,3) where stock_code_no=v_stock_code_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.26.1.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;

        end if;

        /* [更新表记录][公共_证券基础数据_债券属性信息表][{付息标志}=1][{证券代码编号}=@证券代码编号#][2][@证券代码编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pub.tb_basesedt_bond_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pay_intrst_flag=1 where stock_code_no=v_stock_code_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.26.1.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量语句][公共_证券基础数据_证券代码映射表][{标的代码}][@标的代码#][{市场编号}=@市场编号# and {交易代码}=@证券代码#] */
        select target_code into v_target_code from db_pub.tb_basesedt_code_map where exch_no=v_exch_no and trade_code=v_stock_code limit 1;

        if FOUND_ROWS() = 0 then

            /* set @标的代码# = @证券代码#; */
            set v_target_code = v_stock_code;

            /* set @标的代码编号# = @证券代码编号#; */
            set v_target_code_no = v_stock_code_no;
        else

            /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@标的代码编号#][{市场编号}=@市场编号# and {证券代码}=@标的代码#][4][@市场编号#,@标的代码#] */
            select stock_code_no into v_target_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_target_code limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.26.1.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","标的代码=",v_target_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,",","标的代码=",v_target_code);
                end if;
                leave label_pro;
            end if;

        end if;
    else

        /* set @质押比例# = 0; */
        set v_impawn_ratio = 0;

        /* set @标的代码# = @证券代码#; */
        set v_target_code = v_stock_code;

        /* set @标的代码编号# = @证券代码编号#; */
        set v_target_code_no = v_stock_code_no;

        /* if @最新价#>=@价格变动金额# then */
        if v_last_price>=v_price_occur_amt then

            /* [更新表记录][公共_证券基础数据_证券行情表][{最新价}=round(({最新价}-@价格变动金额#)/(1+@价格变动比例#),2)][{证券代码编号}=@证券代码编号#][2][@证券代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pub.tb_basesedt_stock_quot set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, last_price=round((last_price-v_price_occur_amt)/(1+v_price_occur_ratio),2) where stock_code_no=v_stock_code_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.26.1.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;

        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_target_code = v_target_code;
    SET p_target_code_no = v_target_code_no;
    SET p_impawn_ratio = v_impawn_ratio;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_清算接口_获取合约交割参数记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clearif_GetDeliParam;;
DELIMITER ;;
CREATE PROCEDURE pra_clearif_GetDeliParam(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_deli_price decimal(16,9)
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
    declare v_contrc_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_deli_price decimal(16,9);
    declare v_row_id bigint;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_deli_price = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_期货基础数据_合约交割参数表][字段][字段变量][{合约代码编号}=@合约代码编号#][5][@市场编号#,@合约代码编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        contrc_code_no, deli_price into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_exch_no, 
        v_contrc_code_no, v_deli_price from db_pub.tb_basefudt_futu_deli_param where contrc_code_no=v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.26.63.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_deli_price = v_deli_price;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_清算接口_获取保证金优惠组合编码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clearif_GetCombinationCode;;
DELIMITER ;;
CREATE PROCEDURE pra_clearif_GetCombinationCode(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_contrc_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comb_code varchar(6),
    OUT p_comb_type int
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
    declare v_contrc_type int;
    declare v_contrc_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comb_code varchar(6);
    declare v_comb_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_code = p_contrc_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comb_code = " ";
    SET v_comb_type = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_期货基础数据_期货组合保证金参数表][{组合编码}][@组合编码#][{市场编号}=@市场编号# and ({参与代码}=@合约代码# or {参与代码}=@合约类型#) order by {优先级}][4][@市场编号#,@合约代码#,@合约类型#] */
    select comb_code into v_comb_code from db_pub.tb_basefudt_futu_group_margin_config where exch_no=v_exch_no and (partic_code=v_contrc_code or partic_code=v_contrc_type) order by prior_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.26.64.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code,",","合约类型=",v_contrc_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code,",","合约类型=",v_contrc_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comb_code = v_comb_code;
    SET p_comb_type = v_comb_type;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_清算接口_获取代码编号合约代码属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clearif_GetCodeNoContrcCodeProp;;
DELIMITER ;;
CREATE PROCEDURE pra_clearif_GetCodeNoContrcCodeProp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_no int,
    OUT p_contrc_code varchar(6),
    OUT p_contrc_name varchar(64),
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_margin_pref int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_expire_date int,
    OUT p_begin_deli_date int,
    OUT p_end_deli_date int,
    OUT p_deli_price decimal(16,9)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_contrc_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_name varchar(64);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_margin_pref int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_expire_date int;
    declare v_begin_deli_date int;
    declare v_end_deli_date int;
    declare v_deli_price decimal(16,9);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pinyin_short varchar(16);
    declare v_asset_type int;
    declare v_par_value decimal(16,9);
    declare v_report_unit int;
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_fee_set varchar(2048);
    declare v_is_order_dir_flag int;
    declare v_valid_flag int;
    declare v_contrc_limit_flag int;
    declare v_posi_type int;
    declare v_deli_year int;
    declare v_deli_month int;
    declare v_begin_trade_date int;
    declare v_open_order_type int;
    declare v_step_price decimal(16,9);
    declare v_hold_qty decimal(18,2);
    declare v_main_flag int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_name = " ";
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_margin_pref = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_expire_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_deli_date = date_format(curdate(),'%Y%m%d');
    SET v_end_deli_date = date_format(curdate(),'%Y%m%d');
    SET v_deli_price = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pinyin_short = " ";
    SET v_asset_type = 0;
    SET v_par_value = 0;
    SET v_report_unit = 0;
    SET v_min_unit = 0;
    SET v_max_qty = 0;
    SET v_min_qty = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_fee_set = " ";
    SET v_is_order_dir_flag = 0;
    SET v_valid_flag = 0;
    SET v_contrc_limit_flag = 0;
    SET v_posi_type = 0;
    SET v_deli_year = 0;
    SET v_deli_month = 0;
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_open_order_type = 0;
    SET v_step_price = 0;
    SET v_hold_qty = 0;
    SET v_main_flag = 0;
    SET v_time_stamp = unix_timestamp();

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_期货基础数据_合约代码信息表][字段][字段变量][{合约代码编号}=@合约代码编号#][4][@合约代码编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, contrc_code_no, 
        exch_no, contrc_code, contrc_name, pinyin_short, 
        contrc_type, asset_type, par_value, contrc_unit, 
        report_unit, min_unit, max_qty, min_qty, 
        crncy_type, exch_crncy_type, capit_reback_days, posi_reback_days, 
        fee_set, is_order_dir_flag, valid_flag, contrc_limit_flag, 
        margin_pref, posi_type, deli_year, deli_month, 
        begin_trade_date, expire_date, begin_deli_date, end_deli_date, 
        open_order_type, step_price, hold_qty, main_flag, 
        time_stamp into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_contrc_code_no, 
        v_exch_no, v_contrc_code, v_contrc_name, v_pinyin_short, 
        v_contrc_type, v_asset_type, v_par_value, v_contrc_unit, 
        v_report_unit, v_min_unit, v_max_qty, v_min_qty, 
        v_crncy_type, v_exch_crncy_type, v_capit_reback_days, v_posi_reback_days, 
        v_fee_set, v_is_order_dir_flag, v_valid_flag, v_contrc_limit_flag, 
        v_margin_pref, v_posi_type, v_deli_year, v_deli_month, 
        v_begin_trade_date, v_expire_date, v_begin_deli_date, v_end_deli_date, 
        v_open_order_type, v_step_price, v_hold_qty, v_main_flag, 
        v_time_stamp from db_pub.tb_basefudt_futu_contrc_info where contrc_code_no=v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.26.65.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_no = v_exch_no;
    SET p_contrc_code = v_contrc_code;
    SET p_contrc_name = v_contrc_name;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_margin_pref = v_margin_pref;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_expire_date = v_expire_date;
    SET p_begin_deli_date = v_begin_deli_date;
    SET p_end_deli_date = v_end_deli_date;
    SET p_deli_price = v_deli_price;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_清算接口_获取期货结算价
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clearif_GetContrcSettPrice;;
DELIMITER ;;
CREATE PROCEDURE pra_clearif_GetContrcSettPrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code_no int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_sett_price decimal(16,9),
    OUT p_pre_settle_price decimal(16,9)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_contrc_code_no int;
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sett_price decimal(16,9);
    declare v_pre_settle_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sett_price = 0;
    SET v_pre_settle_price = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_期货基础数据_期货行情表][{结算价},{昨结算价}][@结算价#,@昨结算价#][{合约代码编号}=@合约代码编号#][4][@合约代码编号#] */
    select sett_price,pre_settle_price into v_sett_price,v_pre_settle_price from db_pub.tb_basefudt_futu_quot where contrc_code_no=v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.26.66.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_sett_price = v_sett_price;
    SET p_pre_settle_price = v_pre_settle_price;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_清算接口_获取机构业务控制配置串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clearif_GetCoBusiConfigStr;;
DELIMITER ;;
CREATE PROCEDURE pra_clearif_GetCoBusiConfigStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_busi_config_str varchar(64)
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
    declare v_co_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_co_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_机构信息表][{业务控制配置串}][@机构业务控制配置串#][{机构编号}=@机构编号#][4][@机构编号#] */
    select busi_config_str into v_co_busi_config_str from db_pub.tb_base_co_info where co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.26.71.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_清算接口_获取港股通结算汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clearif_GetHKSettleRate;;
DELIMITER ;;
CREATE PROCEDURE pra_clearif_GetHKSettleRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_settle_buy_rate decimal(18,12),
    OUT p_settle_sell_rate decimal(18,12)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@买入结算汇率#,@卖出结算汇率#][{初始化日期}=@初始化日期# and {市场编号}=@市场编号#] */
    select settle_buy_rate,settle_sell_rate into v_settle_buy_rate,v_settle_sell_rate from db_pub.tb_base_hk_exch_rate where init_date=v_init_date and exch_no=v_exch_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_settle_buy_rate = v_settle_buy_rate;
    SET p_settle_sell_rate = v_settle_sell_rate;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_清算接口_获取港股通交收日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clearif_GetHKSettleDate;;
DELIMITER ;;
CREATE PROCEDURE pra_clearif_GetHKSettleDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_settle_date int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_settle_date int;
    declare v_record_count int;
    declare v_fixed_date int;
    declare v_no_settle_date_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_settle_date = 0;
    SET v_record_count = 0;
    SET v_fixed_date = 0;
    SET v_no_settle_date_str = " ";

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* set @指定日期# = date_format(date_add(@初始化日期#, interval 1 day), '%Y%m%d'); */
    set v_fixed_date = date_format(date_add(v_init_date, interval 1 day), '%Y%m%d');

    /* [获取表记录变量][公共_基础_市场信息表][{非交收日期串}][@非交收日期串#][{市场编号} = @市场编号#][1][@市场编号#] */
    select no_settle_date_str into v_no_settle_date_str from db_pub.tb_base_exch_info where exch_no = v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.26.82.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;

    loop_label:loop

        /* if dayofweek(@指定日期#) <> 7 and dayofweek(@指定日期#) <> 1 and instr(@非交收日期串#, concat(";", @指定日期#, ";")) = 0 then */
        if dayofweek(v_fixed_date) <> 7 and dayofweek(v_fixed_date) <> 1 and instr(v_no_settle_date_str, concat(";", v_fixed_date, ";")) = 0 then

            /* set @记录个数# = @记录个数# + 1; */
            set v_record_count = v_record_count + 1;

            /* if @记录个数# = 1 then */
            if v_record_count = 1 then

                /* set @指定日期# = date_format(date_add(@指定日期#, interval 1 day), '%Y%m%d'); */
                set v_fixed_date = date_format(date_add(v_fixed_date, interval 1 day), '%Y%m%d');
            else
                leave loop_label;
            end if;
        else

            /* set @指定日期# = date_format(date_add(@指定日期#, interval 1 day), '%Y%m%d'); */
            set v_fixed_date = date_format(date_add(v_fixed_date, interval 1 day), '%Y%m%d');
        end if;
    end loop;

    /* set @交收日期# = @指定日期#; */
    set v_settle_date = v_fixed_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_settle_date = v_settle_date;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_清算接口_获取证券代码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clearif_GetStockCodeNo;;
DELIMITER ;;
CREATE PROCEDURE pra_clearif_GetStockCodeNo(
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
    SET v_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* set @证券代码编号# = 0; */
    set v_stock_code_no = 0;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select stock_code_no into v_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.26.83.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@证券代码编号# = 0][4][@市场编号#,@证券代码#] */
    if v_stock_code_no = 0 then
        
        SET v_error_code = "pubA.26.83.4";
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
    SET p_stock_code_no = v_stock_code_no;

END;;


