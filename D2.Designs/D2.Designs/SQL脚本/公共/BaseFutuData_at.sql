DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_检查期货交易业务属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_CheckFutuExchProp;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_CheckFutuExchProp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_contrc_unit int
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
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_contrc_unit int;
    declare v_valid_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_contrc_unit = 0;
    SET v_valid_flag = 0;

    
    label_pro:BEGIN
    
    #如果价格类型是市价，则根据配置设置订单价格

    /* [获取表记录变量][公共_期货基础数据_合约代码信息表][{合约代码编号},{合约类型},{资产类型},{本币币种},{资金回转天数},{持仓回转天数},{合约乘数},{有效标志}][@合约代码编号#,@合约类型#,@资产类型#,@本币币种#,@资金回转天数#,@持仓回转天数#,@合约乘数#,@有效标志#][{市场编号}=@市场编号# and {合约代码}=@合约代码#][4][@市场编号#, @合约代码#] */
    select contrc_code_no,contrc_type,asset_type,crncy_type,capit_reback_days,posi_reback_days,contrc_unit,valid_flag into v_contrc_code_no,v_contrc_type,v_asset_type,v_crncy_type,v_capit_reback_days,v_posi_reback_days,v_contrc_unit,v_valid_flag from db_pub.tb_basefudt_futu_contrc_info where exch_no=v_exch_no and contrc_code=v_contrc_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.13.62.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 合约代码=", v_contrc_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 合约代码=", v_contrc_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@有效标志# <> 《有效标志-正常》][8][@合约代码#] */
    if v_valid_flag <> 1 then
        
        SET v_error_code = "pubA.13.62.8";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码=",v_contrc_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码=",v_contrc_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_contrc_unit = v_contrc_unit;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_获取合约代码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_GetContrcCodeNo;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_GetContrcCodeNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_contrc_code_no int,
    OUT p_contrc_type int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_contrc_code_no int;
    declare v_contrc_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_期货基础数据_合约代码信息表][{合约代码编号}, {合约类型}][@合约代码编号#, @合约类型#][{市场编号}=@市场编号# and {合约代码}=@合约代码#][4][@市场编号#, @合约代码#] */
    select contrc_code_no, contrc_type into v_contrc_code_no, v_contrc_type from db_pub.tb_basefudt_futu_contrc_info where exch_no=v_exch_no and contrc_code=v_contrc_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.13.101.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 合约代码=", v_contrc_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 合约代码=", v_contrc_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_修改合约类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_ModiContrcType;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_ModiContrcType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_contrc_type_name varchar(16),
    IN p_asset_type int,
    IN p_par_value decimal(16,9),
    IN p_contrc_unit int,
    IN p_report_unit int,
    IN p_min_unit int,
    IN p_max_qty decimal(18,2),
    IN p_min_qty decimal(18,2),
    IN p_type_unit int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
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
    declare v_contrc_type int;
    declare v_contrc_type_name varchar(16);
    declare v_asset_type int;
    declare v_par_value decimal(16,9);
    declare v_contrc_unit int;
    declare v_report_unit int;
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_type_unit int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_is_order_dir_flag int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_time_stamp int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_type_name = p_contrc_type_name;
    SET v_asset_type = p_asset_type;
    SET v_par_value = p_par_value;
    SET v_contrc_unit = p_contrc_unit;
    SET v_report_unit = p_report_unit;
    SET v_min_unit = p_min_unit;
    SET v_max_qty = p_max_qty;
    SET v_min_qty = p_min_qty;
    SET v_type_unit = p_type_unit;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_is_order_dir_flag = p_is_order_dir_flag;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "市场编号", "|", "合约类型", "|", "合约类型简称", "|", "资产类型", "|", "票面面值", "|", "合约乘数", "|", "申报单位", "|", "最小单位", "|", "最大数量", "|", "最小数量", "|", "类型单位", "|", "本币币种", "|", "交易币种", "|", "资金回转天数", "|", "持仓回转天数", "|", "区分订单方向标志", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_contrc_type, "|", v_contrc_type_name, "|", v_asset_type, "|", v_par_value, "|", v_contrc_unit, "|", v_report_unit, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_type_unit, "|", v_crncy_type, "|", v_exch_crncy_type, "|", v_capit_reback_days, "|", v_posi_reback_days, "|", v_is_order_dir_flag, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_期货基础数据_合约类型表][{合约类型简称}=@合约类型简称#,{资产类型}=@资产类型#,{票面面值}=@票面面值#,{合约乘数}=@合约乘数#,{申报单位}=@申报单位#,{最小单位}=@最小单位#,{最大数量}=@最大数量#,{最小数量}=@最小数量#,{类型单位}=@类型单位#,{本币币种}=@本币币种#,{交易币种}=@交易币种#,{资金回转天数} = @资金回转天数#,{持仓回转天数} = @持仓回转天数#,{区分订单方向标志}=@区分订单方向标志#,{时间戳}=@时间戳#][{市场编号}=@市场编号# and {合约类型}=@合约类型#][2][@市场编号#, @合约类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basefudt_contrc_type set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, contrc_type_name=v_contrc_type_name,asset_type=v_asset_type,par_value=v_par_value,contrc_unit=v_contrc_unit,report_unit=v_report_unit,min_unit=v_min_unit,max_qty=v_max_qty,min_qty=v_min_qty,type_unit=v_type_unit,crncy_type=v_crncy_type,exch_crncy_type=v_exch_crncy_type,capit_reback_days = v_capit_reback_days,posi_reback_days = v_posi_reback_days,is_order_dir_flag=v_is_order_dir_flag,time_stamp=v_time_stamp where exch_no=v_exch_no and contrc_type=v_contrc_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.112.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 合约类型=", v_contrc_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 合约类型=", v_contrc_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_期货基础数据_合约类型表][字段][字段变量][{市场编号}=@市场编号# and {合约类型}=@合约类型#][4][@市场编号#, @合约类型#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        contrc_type, contrc_type_name, asset_type, par_value, 
        contrc_unit, report_unit, min_unit, max_qty, 
        min_qty, type_unit, crncy_type, exch_crncy_type, 
        capit_reback_days, posi_reback_days, is_order_dir_flag, time_stamp into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_exch_no, 
        v_contrc_type, v_contrc_type_name, v_asset_type, v_par_value, 
        v_contrc_unit, v_report_unit, v_min_unit, v_max_qty, 
        v_min_qty, v_type_unit, v_crncy_type, v_exch_crncy_type, 
        v_capit_reback_days, v_posi_reback_days, v_is_order_dir_flag, v_time_stamp from db_pub.tb_basefudt_contrc_type where exch_no=v_exch_no and contrc_type=v_contrc_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.13.112.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 合约类型=", v_contrc_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 合约类型=", v_contrc_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_contrc_type, "|", v_contrc_type_name, "|", v_asset_type, "|", v_par_value, "|", v_contrc_unit, "|", v_report_unit, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_type_unit, "|", v_crncy_type, "|", v_exch_crncy_type, "|", v_capit_reback_days, "|", v_posi_reback_days, "|", v_is_order_dir_flag, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_期货基础数据_合约类型流水表][字段][字段变量][5][@市场编号#, @合约类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basefudt_contrc_type_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, exch_no, 
        contrc_type, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_exch_no, 
        v_contrc_type, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.112.5";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,","," 合约类型=", v_contrc_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询合约类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryContrcType;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryContrcType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_contrc_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
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
    declare v_exch_no_str varchar(2048);
    declare v_contrc_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_time_stamp = p_time_stamp;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货基础数据_合约类型表][字段][(@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@合约类型串# = "; ;" or instr(@合约类型串#, concat(";", {合约类型}, ";")) > 0) and (@资产类型串# = "; ;" or instr(@资产类型串#, concat(";", {资产类型}, ";")) > 0) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        contrc_type, contrc_type_name, asset_type, par_value, 
        contrc_unit, report_unit, min_unit, max_qty, 
        min_qty, type_unit, crncy_type, exch_crncy_type, 
        capit_reback_days, posi_reback_days, is_order_dir_flag, time_stamp from db_pub.tb_basefudt_contrc_type where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_asset_type_str = "; ;" or instr(v_asset_type_str, concat(";", asset_type, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        contrc_type, contrc_type_name, asset_type, par_value, 
        contrc_unit, report_unit, min_unit, max_qty, 
        min_qty, type_unit, crncy_type, exch_crncy_type, 
        capit_reback_days, posi_reback_days, is_order_dir_flag, time_stamp from db_pub.tb_basefudt_contrc_type where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_asset_type_str = "; ;" or instr(v_asset_type_str, concat(";", asset_type, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询合约类型流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryContrcTypeJour;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryContrcTypeJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no_str varchar(2048),
    IN p_contrc_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
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
    declare v_contrc_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
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
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货基础数据_合约类型流水表][字段][{初始化日期}<=@初始化日期# and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@合约类型串# = "; ;" or instr(@合约类型串#, concat(";", {合约类型}, ";")) > 0) and (@资产类型串# = "; ;" or instr(@资产类型串#, concat(";", {资产类型}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, contrc_type, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub.tb_basefudt_contrc_type_jour where init_date<=v_init_date and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_asset_type_str = "; ;" or instr(v_asset_type_str, concat(";", asset_type, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, contrc_type, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub.tb_basefudt_contrc_type_jour where init_date<=v_init_date and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_asset_type_str = "; ;" or instr(v_asset_type_str, concat(";", asset_type, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询历史合约类型流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryContrcTypeJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryContrcTypeJour_His(
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
    IN p_contrc_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
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
    declare v_contrc_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
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
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_期货基础数据_合约类型流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@合约类型串# = "; ;" or instr(@合约类型串#, concat(";", {合约类型}, ";")) > 0) and (@资产类型串# = "; ;" or instr(@资产类型串#, concat(";", {资产类型}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, contrc_type, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub_his.tb_basefudt_contrc_type_jour_his where (init_date between v_begin_date and v_end_date) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_asset_type_str = "; ;" or instr(v_asset_type_str, concat(";", asset_type, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, contrc_type, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub_his.tb_basefudt_contrc_type_jour_his where (init_date between v_begin_date and v_end_date) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_asset_type_str = "; ;" or instr(v_asset_type_str, concat(";", asset_type, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询合约类型订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryContrcTypeOrderDir;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryContrcTypeOrderDir(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_contrc_type_str varchar(2048),
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
    declare v_exch_no_str varchar(2048);
    declare v_contrc_type_str varchar(2048);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_time_stamp = p_time_stamp;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货基础数据_合约类型订单方向表][字段][(@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@合约类型串# = "; ;" or instr(@合约类型串#, concat(";", {合约类型}, ";")) > 0) and (@订单方向串# = "; ;" or instr(@订单方向串#, concat(";", {订单方向}, ";")) > 0) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        contrc_type, order_dir, cash_frozen_type, order_split_flag, 
        min_unit, max_qty, min_qty, time_stamp from db_pub.tb_basefudt_contrc_type_order_dir where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_order_dir_str = "; ;" or instr(v_order_dir_str, concat(";", order_dir, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        contrc_type, order_dir, cash_frozen_type, order_split_flag, 
        min_unit, max_qty, min_qty, time_stamp from db_pub.tb_basefudt_contrc_type_order_dir where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_order_dir_str = "; ;" or instr(v_order_dir_str, concat(";", order_dir, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_初始化合约代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_InitContrcCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_InitContrcCodeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code_no int,
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_name varchar(64),
    IN p_contrc_unit int,
    IN p_deli_year int,
    IN p_deli_month int,
    IN p_begin_trade_date int,
    IN p_expire_date int,
    IN p_begin_deli_date int,
    IN p_end_deli_date int,
    IN p_margin_pref int,
    IN p_step_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_target_contrc_code_no int,
    OUT p_contrc_type int,
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
    declare v_contrc_code_no int;
    declare v_exch_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_name varchar(64);
    declare v_contrc_unit int;
    declare v_deli_year int;
    declare v_deli_month int;
    declare v_begin_trade_date int;
    declare v_expire_date int;
    declare v_begin_deli_date int;
    declare v_end_deli_date int;
    declare v_margin_pref int;
    declare v_step_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_target_contrc_code_no int;
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_pinyin_short varchar(16);
    declare v_report_unit int;
    declare v_par_value decimal(16,9);
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_posi_reback_days int;
    declare v_capit_reback_days int;
    declare v_is_order_dir_flag int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_fee_set varchar(2048);
    declare v_valid_flag int;
    declare v_contrc_limit_flag int;
    declare v_posi_type int;
    declare v_hold_qty decimal(18,2);
    declare v_main_flag int;
    declare v_open_order_type int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_exch_no = p_exch_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_name = p_contrc_name;
    SET v_contrc_unit = p_contrc_unit;
    SET v_deli_year = p_deli_year;
    SET v_deli_month = p_deli_month;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_expire_date = p_expire_date;
    SET v_begin_deli_date = p_begin_deli_date;
    SET v_end_deli_date = p_end_deli_date;
    SET v_margin_pref = p_margin_pref;
    SET v_step_price = p_step_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_target_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_pinyin_short = " ";
    SET v_report_unit = 0;
    SET v_par_value = 0;
    SET v_min_unit = 0;
    SET v_max_qty = 0;
    SET v_min_qty = 0;
    SET v_posi_reback_days = 0;
    SET v_capit_reback_days = 0;
    SET v_is_order_dir_flag = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_fee_set = " ";
    SET v_valid_flag = 0;
    SET v_contrc_limit_flag = 0;
    SET v_posi_type = 0;
    SET v_hold_qty = 0;
    SET v_main_flag = 0;
    SET v_open_order_type = 0;
    SET v_time_stamp = unix_timestamp();
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @拼音简称#=@合约代码#; */
    set v_pinyin_short=v_contrc_code;

    /* [获取表记录变量][公共_期货基础数据_期货模板表][{合约类型},{资产类型}][@合约类型#,@资产类型#][{市场编号}=@市场编号# and @合约代码# like {前缀字符}][4][@市场编号#,@合约代码#] */
    select contrc_type,asset_type into v_contrc_type,v_asset_type from db_pub.tb_basefudt_futu_tmplat where exch_no=v_exch_no and v_contrc_code like prefix_char limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.13.131.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_期货基础数据_合约类型表][{申报单位},{合约类型},{资产类型},{票面面值},{最小单位},{最大数量},{最小数量},{持仓回转天数},{资金回转天数},{区分订单方向标志},{本币币种},{交易币种}][@申报单位#,@合约类型#,@资产类型#,@票面面值#,@最小单位#,@最大数量#,@最小数量#,@持仓回转天数#,@资金回转天数#,@区分订单方向标志#,@本币币种#,@交易币种#][{市场编号}=@市场编号# and {合约类型}=@合约类型#][4][@市场编号#,@合约类型#] */
    select report_unit,contrc_type,asset_type,par_value,min_unit,max_qty,min_qty,posi_reback_days,capit_reback_days,is_order_dir_flag,crncy_type,exch_crncy_type into v_report_unit,v_contrc_type,v_asset_type,v_par_value,v_min_unit,v_max_qty,v_min_qty,v_posi_reback_days,v_capit_reback_days,v_is_order_dir_flag,v_crncy_type,v_exch_crncy_type from db_pub.tb_basefudt_contrc_type where exch_no=v_exch_no and contrc_type=v_contrc_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.13.131.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","合约类型=",v_contrc_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","合约类型=",v_contrc_type);
        end if;
        leave label_pro;
    end if;


    /* set @费用设置# = " "; */
    set v_fee_set = " ";

    /* set @有效标志# = 《有效标志-正常》; */
    set v_valid_flag = 1;

    /* set @合约限制# = "0"; */
    set v_contrc_limit_flag = "0";

    /* set @持仓类型# = 0; */
    set v_posi_type = 0;

    /* set @持仓量# = 0; */
    set v_hold_qty = 0;

    /* set @主力标志# = 0; */
    set v_main_flag = 0;

    /* set @交割月自然人允许开仓标志# = 0; */
    set v_open_order_type = 0;

    /* set @时间戳# = UNIX_TIMESTAMP(); */
    set v_time_stamp = UNIX_TIMESTAMP();

    /* [插入重复更新][公共_期货基础数据_合约代码信息表][字段][字段变量][{合约名称}=@合约名称#,{合约乘数}=@合约乘数#,{交割年份}=@交割年份#,{交割月份}=@交割月份#,{上市日期}=@上市日期#,{到期日期}=@到期日期#,{开始交割日}=@开始交割日#,{结束交割日}=@结束交割日#,{保证金优惠}=@保证金优惠#,{合约类型}=@合约类型#,{资产类型}=@资产类型#,{申报单位}=@申报单位#,{时间戳}=@时间戳#,{拼音简称}=@拼音简称#,{最小价差}=@最小价差#][1][@市场编号#,@合约代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basefudt_futu_contrc_info (
        create_date, create_time, update_date, 
        update_time, update_times, contrc_code_no, exch_no, 
        contrc_code, contrc_name, pinyin_short, contrc_type, 
        asset_type, par_value, contrc_unit, report_unit, 
        min_unit, max_qty, min_qty, crncy_type, 
        exch_crncy_type, capit_reback_days, posi_reback_days, fee_set, 
        is_order_dir_flag, valid_flag, contrc_limit_flag, margin_pref, 
        posi_type, deli_year, deli_month, begin_trade_date, 
        expire_date, begin_deli_date, end_deli_date, open_order_type, 
        step_price, hold_qty, main_flag, time_stamp) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_contrc_code_no, v_exch_no, 
        v_contrc_code, v_contrc_name, v_pinyin_short, v_contrc_type, 
        v_asset_type, v_par_value, v_contrc_unit, v_report_unit, 
        v_min_unit, v_max_qty, v_min_qty, v_crncy_type, 
        v_exch_crncy_type, v_capit_reback_days, v_posi_reback_days, v_fee_set, 
        v_is_order_dir_flag, v_valid_flag, v_contrc_limit_flag, v_margin_pref, 
        v_posi_type, v_deli_year, v_deli_month, v_begin_trade_date, 
        v_expire_date, v_begin_deli_date, v_end_deli_date, v_open_order_type, 
        v_step_price, v_hold_qty, v_main_flag, v_time_stamp) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, contrc_name=v_contrc_name,contrc_unit=v_contrc_unit,deli_year=v_deli_year,deli_month=v_deli_month,begin_trade_date=v_begin_trade_date,expire_date=v_expire_date,begin_deli_date=v_begin_deli_date,end_deli_date=v_end_deli_date,margin_pref=v_margin_pref,contrc_type=v_contrc_type,asset_type=v_asset_type,report_unit=v_report_unit,time_stamp=v_time_stamp,pinyin_short=v_pinyin_short,step_price=v_step_price;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.131.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code);
        end if;
        leave label_pro;
    end if;


    /* [获取记录序号][@记录序号#] */
    select LAST_INSERT_ID() into v_row_id;


    /* [获取表记录变量][公共_期货基础数据_合约代码信息表][{合约代码编号}][@目标合约代码编号#][{市场编号}=@市场编号# and {合约代码}=@合约代码#][4][@市场编号#,@合约代码#] */
    select contrc_code_no into v_target_contrc_code_no from db_pub.tb_basefudt_futu_contrc_info where exch_no=v_exch_no and contrc_code=v_contrc_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.13.131.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_target_contrc_code_no = v_target_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_asset_type = v_asset_type;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_初始化合约代码行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_InitContrcCodeQuot;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_InitContrcCodeQuot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code_no int,
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_name varchar(64),
    IN p_asset_type int,
    IN p_contrc_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_contrc_code varchar(6);
    declare v_contrc_name varchar(64);
    declare v_asset_type int;
    declare v_contrc_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pre_close_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_pre_settle_price decimal(16,9);
    declare v_today_close_price decimal(16,9);
    declare v_hold_qty decimal(18,2);
    declare v_pre_hold_qty decimal(18,2);
    declare v_last_price decimal(16,9);
    declare v_today_open_price decimal(16,9);
    declare v_max_buy_price decimal(16,9);
    declare v_min_sale_price decimal(16,9);
    declare v_total_buy_qty decimal(18,2);
    declare v_total_sale_qty decimal(18,2);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_exch_no = p_exch_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_name = p_contrc_name;
    SET v_asset_type = p_asset_type;
    SET v_contrc_type = p_contrc_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pre_close_price = 0;
    SET v_sett_price = 0;
    SET v_pre_settle_price = 0;
    SET v_today_close_price = 0;
    SET v_hold_qty = 0;
    SET v_pre_hold_qty = 0;
    SET v_last_price = 0;
    SET v_today_open_price = 0;
    SET v_max_buy_price = 0;
    SET v_min_sale_price = 0;
    SET v_total_buy_qty = 0;
    SET v_total_sale_qty = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
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
    SET v_time_stamp = unix_timestamp();
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @昨收盘价# = 0; */
    set v_pre_close_price = 0;

    /* set @结算价# = 0; */
    set v_sett_price = 0;

    /* set @昨结算价# = 0; */
    set v_pre_settle_price = 0;

    /* set @今收盘价# = 0; */
    set v_today_close_price = 0;

    /* set @持仓量# = 0; */
    set v_hold_qty = 0;

    /* set @昨持仓量# = 0; */
    set v_pre_hold_qty = 0;

    /* set @最新价# = 0; */
    set v_last_price = 0;

    /* set @今开盘价# = 0; */
    set v_today_open_price = 0;

    /* set @最高买价# = 0; */
    set v_max_buy_price = 0;

    /* set @最低卖价# = 0; */
    set v_min_sale_price = 0;

    /* set @市场总买量# = 0; */
    set v_total_buy_qty = 0;

    /* set @市场总卖量# = 0; */
    set v_total_sale_qty = 0;

    /* set @涨停价# = 0; */
    set v_up_limit_price = 0;

    /* set @跌停价# = 0; */
    set v_down_limit_price = 0;

    /* set @成交数量# = 0; */
    set v_strike_qty = 0;

    /* set @成交金额# = 0; */
    set v_strike_amt = 0;

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

    /* set @时间戳# = UNIX_TIMESTAMP(); */
    set v_time_stamp = UNIX_TIMESTAMP();

    /* [插入重复更新][公共_期货基础数据_期货行情表][字段][字段变量][{合约名称}=@合约名称#,{资产类型}=@资产类型#,{合约类型}=@合约类型#][1][@合约代码编号#,@市场编号#,@合约代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basefudt_futu_quot (
        create_date, create_time, update_date, 
        update_time, update_times, contrc_code_no, exch_no, 
        contrc_code, contrc_name, pre_close_price, sett_price, 
        pre_settle_price, today_close_price, hold_qty, pre_hold_qty, 
        last_price, today_open_price, max_buy_price, min_sale_price, 
        total_buy_qty, total_sale_qty, up_limit_price, down_limit_price, 
        strike_qty, strike_amt, buy_price_1, buy_qty_1, 
        buy_price_2, buy_qty_2, buy_price_3, buy_qty_3, 
        buy_price_4, buy_qty_4, buy_price_5, buy_qty_5, 
        sell_price_1, sell_qty_1, sell_price_2, sell_qty_2, 
        sell_price_3, sell_qty_3, sell_price_4, sell_qty_4, 
        sell_price_5, sell_qty_5, contrc_type, asset_type, 
        time_stamp) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_contrc_code_no, v_exch_no, 
        v_contrc_code, v_contrc_name, v_pre_close_price, v_sett_price, 
        v_pre_settle_price, v_today_close_price, v_hold_qty, v_pre_hold_qty, 
        v_last_price, v_today_open_price, v_max_buy_price, v_min_sale_price, 
        v_total_buy_qty, v_total_sale_qty, v_up_limit_price, v_down_limit_price, 
        v_strike_qty, v_strike_amt, v_buy_price_1, v_buy_qty_1, 
        v_buy_price_2, v_buy_qty_2, v_buy_price_3, v_buy_qty_3, 
        v_buy_price_4, v_buy_qty_4, v_buy_price_5, v_buy_qty_5, 
        v_sell_price_1, v_sell_qty_1, v_sell_price_2, v_sell_qty_2, 
        v_sell_price_3, v_sell_qty_3, v_sell_price_4, v_sell_qty_4, 
        v_sell_price_5, v_sell_qty_5, v_contrc_type, v_asset_type, 
        v_time_stamp) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, contrc_name=v_contrc_name,asset_type=v_asset_type,contrc_type=v_contrc_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.132.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码编号=",v_contrc_code_no,",","市场编号=",v_exch_no,",","合约代码=",v_contrc_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码编号=",v_contrc_code_no,",","市场编号=",v_exch_no,",","合约代码=",v_contrc_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_更新期货行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_UpdateFutuQuote;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_UpdateFutuQuote(
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
    declare v_buy_price_1 decimal(16,9);
    declare v_sell_price_1 decimal(16,9);
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
    SET v_contrc_code = p_contrc_code;
    SET v_last_price = p_last_price;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_sett_price = p_sett_price;
    SET v_today_close_price = p_today_close_price;
    SET v_pre_close_price = p_pre_close_price;
    SET v_buy_price_1 = p_buy_price_1;
    SET v_sell_price_1 = p_sell_price_1;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_期货基础数据_期货行情表][{买一价}=@买一价#,{卖一价}=@卖一价#,{最新价} = case when @最新价# <> 0 then @最新价# else {最新价} end, {涨停价} = case when @涨停价# <> 0 then @涨停价# else {涨停价} end, {跌停价} = case when @跌停价# <> 0 then @跌停价# else {跌停价} end, {昨结算价} = case when @昨结算价# <> 0 then @昨结算价# else {昨结算价} end,{结算价} = case when @结算价# <> 0 then @结算价# else {结算价} end,{今收盘价} = case when @今收盘价# <> 0 then @今收盘价# else {今收盘价} end,{昨收盘价} = case when @昨收盘价# <> 0 then @昨收盘价# else {昨收盘价} end][{市场编号}=@市场编号# and {合约代码} = @合约代码#][2][@市场编号#,@合约代码#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basefudt_futu_quot set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, buy_price_1=v_buy_price_1,sell_price_1=v_sell_price_1,last_price = case when v_last_price <> 0 then v_last_price else last_price end, up_limit_price = case when v_up_limit_price <> 0 then v_up_limit_price else up_limit_price end, down_limit_price = case when v_down_limit_price <> 0 then v_down_limit_price else down_limit_price end, pre_settle_price = case when v_pre_settle_price <> 0 then v_pre_settle_price else pre_settle_price end,sett_price = case when v_sett_price <> 0 then v_sett_price else sett_price end,today_close_price = case when v_today_close_price <> 0 then v_today_close_price else today_close_price end,pre_close_price = case when v_pre_close_price <> 0 then v_pre_close_price else pre_close_price end where exch_no=v_exch_no and contrc_code = v_contrc_code;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.133.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_更新期货合约持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_UpdateContractHold;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_UpdateContractHold(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    IN p_hold_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_hold_qty decimal(18,2);
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
    SET v_contrc_code = p_contrc_code;
    SET v_hold_qty = p_hold_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_期货基础数据_合约代码信息表][{持仓量} = @持仓量#][{市场编号} = @市场编号# and {合约代码} = @合约代码#][2][@市场编号#,@合约代码#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basefudt_futu_contrc_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, hold_qty = v_hold_qty where exch_no = v_exch_no and contrc_code = v_contrc_code;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.135.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询期货模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryFutuTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryFutuTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_contrc_type_str varchar(2048),
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
    declare v_contrc_type_str varchar(2048);
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
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_time_stamp = p_time_stamp;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货基础数据_期货模板表][字段][(@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@合约类型串# = "; ;" or instr(@合约类型串#, concat(";", {合约类型}, ";")) > 0) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, model_name, 
        exch_no, prefix_char, contrc_type, asset_type, 
        contrc_unit, report_unit from db_pub.tb_basefudt_futu_tmplat where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, model_name, 
        exch_no, prefix_char, contrc_type, asset_type, 
        contrc_unit, report_unit from db_pub.tb_basefudt_futu_tmplat where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_期货合约列表查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryContractList;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryContractList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][公共_期货基础数据_合约代码信息表][字段][@市场编号串# = "; ;" or instr(@市场编号串#,concat(";",{市场编号},";"))>0] */
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
        time_stamp from db_pub.tb_basefudt_futu_contrc_info where v_exch_no_str = "; ;" or instr(v_exch_no_str,concat(";",exch_no,";"))>0;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_新增合约代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_AddContrcCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_AddContrcCodeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_contrc_code_no int,
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_name varchar(64),
    IN p_pinyin_short varchar(16),
    IN p_contrc_type int,
    IN p_asset_type int,
    IN p_par_value decimal(16,9),
    IN p_contrc_unit int,
    IN p_report_unit int,
    IN p_min_unit int,
    IN p_max_qty decimal(18,2),
    IN p_min_qty decimal(18,2),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_fee_set varchar(2048),
    IN p_is_order_dir_flag int,
    IN p_valid_flag int,
    IN p_contrc_limit_flag int,
    IN p_margin_pref int,
    IN p_posi_type int,
    IN p_deli_year int,
    IN p_deli_month int,
    IN p_begin_trade_date int,
    IN p_expire_date int,
    IN p_begin_deli_date int,
    IN p_end_deli_date int,
    IN p_open_order_type int,
    IN p_step_price decimal(16,9),
    IN p_hold_qty decimal(18,2),
    IN p_main_flag int,
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
    declare v_contrc_code_no int;
    declare v_exch_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_name varchar(64);
    declare v_pinyin_short varchar(16);
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);
    declare v_contrc_unit int;
    declare v_report_unit int;
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_fee_set varchar(2048);
    declare v_is_order_dir_flag int;
    declare v_valid_flag int;
    declare v_contrc_limit_flag int;
    declare v_margin_pref int;
    declare v_posi_type int;
    declare v_deli_year int;
    declare v_deli_month int;
    declare v_begin_trade_date int;
    declare v_expire_date int;
    declare v_begin_deli_date int;
    declare v_end_deli_date int;
    declare v_open_order_type int;
    declare v_step_price decimal(16,9);
    declare v_hold_qty decimal(18,2);
    declare v_main_flag int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_time_stamp int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_exch_no = p_exch_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_name = p_contrc_name;
    SET v_pinyin_short = p_pinyin_short;
    SET v_contrc_type = p_contrc_type;
    SET v_asset_type = p_asset_type;
    SET v_par_value = p_par_value;
    SET v_contrc_unit = p_contrc_unit;
    SET v_report_unit = p_report_unit;
    SET v_min_unit = p_min_unit;
    SET v_max_qty = p_max_qty;
    SET v_min_qty = p_min_qty;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_fee_set = p_fee_set;
    SET v_is_order_dir_flag = p_is_order_dir_flag;
    SET v_valid_flag = p_valid_flag;
    SET v_contrc_limit_flag = p_contrc_limit_flag;
    SET v_margin_pref = p_margin_pref;
    SET v_posi_type = p_posi_type;
    SET v_deli_year = p_deli_year;
    SET v_deli_month = p_deli_month;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_expire_date = p_expire_date;
    SET v_begin_deli_date = p_begin_deli_date;
    SET v_end_deli_date = p_end_deli_date;
    SET v_open_order_type = p_open_order_type;
    SET v_step_price = p_step_price;
    SET v_hold_qty = p_hold_qty;
    SET v_main_flag = p_main_flag;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "合约代码编号", "|", "市场编号", "|", "合约代码", "|", "合约名称", "|", "拼音简称", "|", "合约类型", "|", "资产类型", "|", "票面面值", "|", "合约乘数", "|", "申报单位", "|", "最小单位", "|", "最大数量", "|", "最小数量", "|", "本币币种", "|", "交易币种", "|", "资金回转天数", "|", "持仓回转天数", "|", "费用设置", "|", "区分订单方向标志", "|", "有效标志", "|", "合约限制", "|", "保证金优惠", "|", "持仓类型", "|", "交割年份", "|", "交割月份", "|", "上市日期", "|", "到期日期", "|", "开始交割日", "|", "结束交割日", "|", "交割月自然人允许开仓标志", "|", "最小价差", "|", "持仓量", "|", "主力标志", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_contrc_code_no, "|", v_exch_no, "|", v_contrc_code, "|", v_contrc_name, "|", v_pinyin_short, "|", v_contrc_type, "|", v_asset_type, "|", v_par_value, "|", v_contrc_unit, "|", v_report_unit, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_crncy_type, "|", v_exch_crncy_type, "|", v_capit_reback_days, "|", v_posi_reback_days, "|", v_fee_set, "|", v_is_order_dir_flag, "|", v_valid_flag, "|", v_contrc_limit_flag, "|", v_margin_pref, "|", v_posi_type, "|", v_deli_year, "|", v_deli_month, "|", v_begin_trade_date, "|", v_expire_date, "|", v_begin_deli_date, "|", v_end_deli_date, "|", v_open_order_type, "|", v_step_price, "|", v_hold_qty, "|", v_main_flag, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [插入表记录][公共_期货基础数据_合约代码信息表][字段][字段变量][1][@合约代码编号#, @市场编号#, @合约代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basefudt_futu_contrc_info(
        create_date, create_time, update_date, 
        update_time, update_times, contrc_code_no, exch_no, 
        contrc_code, contrc_name, pinyin_short, contrc_type, 
        asset_type, par_value, contrc_unit, report_unit, 
        min_unit, max_qty, min_qty, crncy_type, 
        exch_crncy_type, capit_reback_days, posi_reback_days, fee_set, 
        is_order_dir_flag, valid_flag, contrc_limit_flag, margin_pref, 
        posi_type, deli_year, deli_month, begin_trade_date, 
        expire_date, begin_deli_date, end_deli_date, open_order_type, 
        step_price, hold_qty, main_flag, time_stamp) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_contrc_code_no, v_exch_no, 
        v_contrc_code, v_contrc_name, v_pinyin_short, v_contrc_type, 
        v_asset_type, v_par_value, v_contrc_unit, v_report_unit, 
        v_min_unit, v_max_qty, v_min_qty, v_crncy_type, 
        v_exch_crncy_type, v_capit_reback_days, v_posi_reback_days, v_fee_set, 
        v_is_order_dir_flag, v_valid_flag, v_contrc_limit_flag, v_margin_pref, 
        v_posi_type, v_deli_year, v_deli_month, v_begin_trade_date, 
        v_expire_date, v_begin_deli_date, v_end_deli_date, v_open_order_type, 
        v_step_price, v_hold_qty, v_main_flag, v_time_stamp);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.141.1";
        SET v_error_info =  CONCAT(concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 合约代码=", v_contrc_code),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_期货基础数据_合约代码信息表][字段][字段变量][{市场编号}=@市场编号# and {合约代码}=@合约代码#][4][@市场编号#, @合约代码#] */
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
        v_time_stamp from db_pub.tb_basefudt_futu_contrc_info where exch_no=v_exch_no and contrc_code=v_contrc_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.13.141.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 合约代码=", v_contrc_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 合约代码=", v_contrc_code);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_contrc_code_no, "|", v_exch_no, "|", v_contrc_code, "|", v_contrc_name, "|", v_pinyin_short, "|", v_contrc_type, "|", v_asset_type, "|", v_par_value, "|", v_contrc_unit, "|", v_report_unit, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_crncy_type, "|", v_exch_crncy_type, "|", v_capit_reback_days, "|", v_posi_reback_days, "|", v_fee_set, "|", v_is_order_dir_flag, "|", v_valid_flag, "|", v_contrc_limit_flag, "|", v_margin_pref, "|", v_posi_type, "|", v_deli_year, "|", v_deli_month, "|", v_begin_trade_date, "|", v_expire_date, "|", v_begin_deli_date, "|", v_end_deli_date, "|", v_open_order_type, "|", v_step_price, "|", v_hold_qty, "|", v_main_flag, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_期货基础数据_合约代码信息流水表][字段][字段变量][5][@合约代码编号#, @市场编号#, @合约代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basefudt_futu_contrc_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, contrc_code_no, 
        exch_no, contrc_code, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_contrc_code_no, 
        v_exch_no, v_contrc_code, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.141.5";
        SET v_error_info =  CONCAT(concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 合约代码=", v_contrc_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_修改合约代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_ModiContrcCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_ModiContrcCodeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_contrc_code_no int,
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_name varchar(64),
    IN p_pinyin_short varchar(16),
    IN p_contrc_type int,
    IN p_asset_type int,
    IN p_par_value decimal(16,9),
    IN p_contrc_unit int,
    IN p_report_unit int,
    IN p_min_unit int,
    IN p_max_qty decimal(18,2),
    IN p_min_qty decimal(18,2),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_fee_set varchar(2048),
    IN p_is_order_dir_flag int,
    IN p_valid_flag int,
    IN p_contrc_limit_flag int,
    IN p_margin_pref int,
    IN p_posi_type int,
    IN p_deli_year int,
    IN p_deli_month int,
    IN p_begin_trade_date int,
    IN p_expire_date int,
    IN p_begin_deli_date int,
    IN p_end_deli_date int,
    IN p_open_order_type int,
    IN p_step_price decimal(16,9),
    IN p_hold_qty decimal(18,2),
    IN p_main_flag int,
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
    declare v_contrc_code_no int;
    declare v_exch_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_name varchar(64);
    declare v_pinyin_short varchar(16);
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);
    declare v_contrc_unit int;
    declare v_report_unit int;
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_fee_set varchar(2048);
    declare v_is_order_dir_flag int;
    declare v_valid_flag int;
    declare v_contrc_limit_flag int;
    declare v_margin_pref int;
    declare v_posi_type int;
    declare v_deli_year int;
    declare v_deli_month int;
    declare v_begin_trade_date int;
    declare v_expire_date int;
    declare v_begin_deli_date int;
    declare v_end_deli_date int;
    declare v_open_order_type int;
    declare v_step_price decimal(16,9);
    declare v_hold_qty decimal(18,2);
    declare v_main_flag int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_time_stamp int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_exch_no = p_exch_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_name = p_contrc_name;
    SET v_pinyin_short = p_pinyin_short;
    SET v_contrc_type = p_contrc_type;
    SET v_asset_type = p_asset_type;
    SET v_par_value = p_par_value;
    SET v_contrc_unit = p_contrc_unit;
    SET v_report_unit = p_report_unit;
    SET v_min_unit = p_min_unit;
    SET v_max_qty = p_max_qty;
    SET v_min_qty = p_min_qty;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_fee_set = p_fee_set;
    SET v_is_order_dir_flag = p_is_order_dir_flag;
    SET v_valid_flag = p_valid_flag;
    SET v_contrc_limit_flag = p_contrc_limit_flag;
    SET v_margin_pref = p_margin_pref;
    SET v_posi_type = p_posi_type;
    SET v_deli_year = p_deli_year;
    SET v_deli_month = p_deli_month;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_expire_date = p_expire_date;
    SET v_begin_deli_date = p_begin_deli_date;
    SET v_end_deli_date = p_end_deli_date;
    SET v_open_order_type = p_open_order_type;
    SET v_step_price = p_step_price;
    SET v_hold_qty = p_hold_qty;
    SET v_main_flag = p_main_flag;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "合约代码编号", "|", "市场编号", "|", "合约代码", "|", "合约名称", "|", "拼音简称", "|", "合约类型", "|", "资产类型", "|", "票面面值", "|", "合约乘数", "|", "申报单位", "|", "最小单位", "|", "最大数量", "|", "最小数量", "|", "本币币种", "|", "交易币种", "|", "资金回转天数", "|", "持仓回转天数", "|", "费用设置", "|", "区分订单方向标志", "|", "有效标志", "|", "合约限制", "|", "保证金优惠", "|", "持仓类型", "|", "交割年份", "|", "交割月份", "|", "上市日期", "|", "到期日期", "|", "开始交割日", "|", "结束交割日", "|", "交割月自然人允许开仓标志", "|", "最小价差", "|", "持仓量", "|", "主力标志", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_contrc_code_no, "|", v_exch_no, "|", v_contrc_code, "|", v_contrc_name, "|", v_pinyin_short, "|", v_contrc_type, "|", v_asset_type, "|", v_par_value, "|", v_contrc_unit, "|", v_report_unit, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_crncy_type, "|", v_exch_crncy_type, "|", v_capit_reback_days, "|", v_posi_reback_days, "|", v_fee_set, "|", v_is_order_dir_flag, "|", v_valid_flag, "|", v_contrc_limit_flag, "|", v_margin_pref, "|", v_posi_type, "|", v_deli_year, "|", v_deli_month, "|", v_begin_trade_date, "|", v_expire_date, "|", v_begin_deli_date, "|", v_end_deli_date, "|", v_open_order_type, "|", v_step_price, "|", v_hold_qty, "|", v_main_flag, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_期货基础数据_合约代码信息表][{合约名称} = @合约名称#,{拼音简称} = @拼音简称#,{合约类型} = @合约类型#,{资产类型} = @资产类型#,{票面面值} = @票面面值#,{合约乘数} = @合约乘数#,{申报单位} = @申报单位#,{最小单位} = @最小单位#,{最大数量} = @最大数量#,{最小数量} = @最小数量#,{本币币种} = @本币币种#,{交易币种} = @交易币种#,{资金回转天数} = @资金回转天数#,{持仓回转天数} = @持仓回转天数#,{费用设置} = @费用设置#,{区分订单方向标志} = @区分订单方向标志#,{有效标志} = @有效标志#,{合约限制} = @合约限制#,{保证金优惠} = @保证金优惠#,{持仓类型} = @持仓类型#,{交割年份} = @交割年份#,{交割月份} = @交割月份#,{上市日期} = @上市日期#,{到期日期} = @到期日期#,{开始交割日} = @开始交割日#,{结束交割日} = @结束交割日#,{交割月自然人允许开仓标志} = @交割月自然人允许开仓标志#,{最小价差} = @最小价差#,{持仓量} = @持仓量#,{主力标志} = @主力标志#,{时间戳} = @时间戳#][{合约代码编号}=@合约代码编号# and {市场编号}=@市场编号# and {合约代码}=@合约代码#][2][@合约代码编号#, @市场编号#, @合约代码#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basefudt_futu_contrc_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, contrc_name = v_contrc_name,pinyin_short = v_pinyin_short,contrc_type = v_contrc_type,asset_type = v_asset_type,par_value = v_par_value,contrc_unit = v_contrc_unit,report_unit = v_report_unit,min_unit = v_min_unit,max_qty = v_max_qty,min_qty = v_min_qty,crncy_type = v_crncy_type,exch_crncy_type = v_exch_crncy_type,capit_reback_days = v_capit_reback_days,posi_reback_days = v_posi_reback_days,fee_set = v_fee_set,is_order_dir_flag = v_is_order_dir_flag,valid_flag = v_valid_flag,contrc_limit_flag = v_contrc_limit_flag,margin_pref = v_margin_pref,posi_type = v_posi_type,deli_year = v_deli_year,deli_month = v_deli_month,begin_trade_date = v_begin_trade_date,expire_date = v_expire_date,begin_deli_date = v_begin_deli_date,end_deli_date = v_end_deli_date,open_order_type = v_open_order_type,step_price = v_step_price,hold_qty = v_hold_qty,main_flag = v_main_flag,time_stamp = v_time_stamp where contrc_code_no=v_contrc_code_no and exch_no=v_exch_no and contrc_code=v_contrc_code;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.142.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 合约代码=", v_contrc_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 合约代码=", v_contrc_code);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_期货基础数据_合约代码信息表][字段][字段变量][{合约代码编号}=@合约代码编号# and {市场编号}=@市场编号# and {合约代码}=@合约代码#][4][@合约代码编号#, @市场编号#, @合约代码#] */
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
        v_time_stamp from db_pub.tb_basefudt_futu_contrc_info where contrc_code_no=v_contrc_code_no and exch_no=v_exch_no and contrc_code=v_contrc_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.13.142.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 合约代码=", v_contrc_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 合约代码=", v_contrc_code);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_contrc_code_no, "|", v_exch_no, "|", v_contrc_code, "|", v_contrc_name, "|", v_pinyin_short, "|", v_contrc_type, "|", v_asset_type, "|", v_par_value, "|", v_contrc_unit, "|", v_report_unit, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_crncy_type, "|", v_exch_crncy_type, "|", v_capit_reback_days, "|", v_posi_reback_days, "|", v_fee_set, "|", v_is_order_dir_flag, "|", v_valid_flag, "|", v_contrc_limit_flag, "|", v_margin_pref, "|", v_posi_type, "|", v_deli_year, "|", v_deli_month, "|", v_begin_trade_date, "|", v_expire_date, "|", v_begin_deli_date, "|", v_end_deli_date, "|", v_open_order_type, "|", v_step_price, "|", v_hold_qty, "|", v_main_flag, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_期货基础数据_合约代码信息流水表][字段][字段变量][5][@合约代码编号#, @市场编号#, @合约代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basefudt_futu_contrc_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, contrc_code_no, 
        exch_no, contrc_code, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_contrc_code_no, 
        v_exch_no, v_contrc_code, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.142.5";
        SET v_error_info =  CONCAT(concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 合约代码=", v_contrc_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询合约代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryContrcCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryContrcCodeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code_no int,
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code varchar(6),
    IN p_contrc_type_str varchar(2048),
    IN p_valid_kind_str varchar(64),
    IN p_contrc_limit_str varchar(2048),
    IN p_margin_pref int,
    IN p_posi_type_str varchar(64),
    IN p_deli_year int,
    IN p_deli_month int,
    IN p_expire_date int,
    IN p_begin_deli_date int,
    IN p_end_deli_date int,
    IN p_open_order_type_str varchar(64),
    IN p_time_stamp int,
    IN p_main_flag int,
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
    declare v_contrc_code_no int;
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code varchar(6);
    declare v_contrc_type_str varchar(2048);
    declare v_valid_kind_str varchar(64);
    declare v_contrc_limit_str varchar(2048);
    declare v_margin_pref int;
    declare v_posi_type_str varchar(64);
    declare v_deli_year int;
    declare v_deli_month int;
    declare v_expire_date int;
    declare v_begin_deli_date int;
    declare v_end_deli_date int;
    declare v_open_order_type_str varchar(64);
    declare v_time_stamp int;
    declare v_main_flag int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_valid_kind_str = p_valid_kind_str;
    SET v_contrc_limit_str = p_contrc_limit_str;
    SET v_margin_pref = p_margin_pref;
    SET v_posi_type_str = p_posi_type_str;
    SET v_deli_year = p_deli_year;
    SET v_deli_month = p_deli_month;
    SET v_expire_date = p_expire_date;
    SET v_begin_deli_date = p_begin_deli_date;
    SET v_end_deli_date = p_end_deli_date;
    SET v_open_order_type_str = p_open_order_type_str;
    SET v_time_stamp = p_time_stamp;
    SET v_main_flag = p_main_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货基础数据_合约代码信息表][字段][(@合约代码编号# = 0 or {合约代码编号}=@合约代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@合约类型串# = "; ;" or instr(@合约类型串#, concat(";",{合约类型},";")) > 0) and (@有效标志串# = "; ;" or instr(@有效标志串#, concat(";", {有效标志}, ";")) > 0) and (@合约限制串# = "; ;" or instr(@合约限制串#, concat(";", {合约限制}, ";")) > 0) and (@保证金优惠# = 0 or {保证金优惠} = @保证金优惠#) and (@持仓类型串# = "; ;" or instr(@持仓类型串#, concat(";", {持仓类型}, ";")) > 0) and (@交割年份# = 0 or {交割年份} = @交割年份#) and (@交割月份# = 0 or {交割月份} = @交割月份#) and (@到期日期# = 0 or {到期日期} = @到期日期#) and (@开始交割日# = 0 or {开始交割日} = @开始交割日#) and (@结束交割日# = 0 or {结束交割日} = @结束交割日#) and (@交割月自然人允许开仓标志串# = "; ;" or instr(@交割月自然人允许开仓标志串#, concat(";",{交割月自然人允许开仓标志},";")) > 0) and (@主力标志# = 0 or {主力标志} = @主力标志#) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
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
        time_stamp from db_pub.tb_basefudt_futu_contrc_info where (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";",contrc_type,";")) > 0) and (v_valid_kind_str = "; ;" or instr(v_valid_kind_str, concat(";", valid_flag, ";")) > 0) and (v_contrc_limit_str = "; ;" or instr(v_contrc_limit_str, concat(";", contrc_limit_flag, ";")) > 0) and (v_margin_pref = 0 or margin_pref = v_margin_pref) and (v_posi_type_str = "; ;" or instr(v_posi_type_str, concat(";", posi_type, ";")) > 0) and (v_deli_year = 0 or deli_year = v_deli_year) and (v_deli_month = 0 or deli_month = v_deli_month) and (v_expire_date = 0 or expire_date = v_expire_date) and (v_begin_deli_date = 0 or begin_deli_date = v_begin_deli_date) and (v_end_deli_date = 0 or end_deli_date = v_end_deli_date) and (v_open_order_type_str = "; ;" or instr(v_open_order_type_str, concat(";",open_order_type,";")) > 0) and (v_main_flag = 0 or main_flag = v_main_flag) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
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
        time_stamp from db_pub.tb_basefudt_futu_contrc_info where (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";",contrc_type,";")) > 0) and (v_valid_kind_str = "; ;" or instr(v_valid_kind_str, concat(";", valid_flag, ";")) > 0) and (v_contrc_limit_str = "; ;" or instr(v_contrc_limit_str, concat(";", contrc_limit_flag, ";")) > 0) and (v_margin_pref = 0 or margin_pref = v_margin_pref) and (v_posi_type_str = "; ;" or instr(v_posi_type_str, concat(";", posi_type, ";")) > 0) and (v_deli_year = 0 or deli_year = v_deli_year) and (v_deli_month = 0 or deli_month = v_deli_month) and (v_expire_date = 0 or expire_date = v_expire_date) and (v_begin_deli_date = 0 or begin_deli_date = v_begin_deli_date) and (v_end_deli_date = 0 or end_deli_date = v_end_deli_date) and (v_open_order_type_str = "; ;" or instr(v_open_order_type_str, concat(";",open_order_type,";")) > 0) and (v_main_flag = 0 or main_flag = v_main_flag) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询客户端合约代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryClientContrcCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryClientContrcCodeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_time_stamp = p_time_stamp;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货基础数据_合约代码信息表][{记录序号},{合约代码编号},{市场编号},{合约代码},{合约名称},{拼音简称},{合约类型},{资产类型},{合约乘数},{本币币种},{交易币种},{资金回转天数},{持仓回转天数},{最小价差},{主力标志},{时间戳}][(@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,contrc_code_no,exch_no,contrc_code,contrc_name,pinyin_short,contrc_type,asset_type,contrc_unit,crncy_type,exch_crncy_type,capit_reback_days,posi_reback_days,step_price,main_flag,time_stamp from db_pub.tb_basefudt_futu_contrc_info where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
        select row_id,contrc_code_no,exch_no,contrc_code,contrc_name,pinyin_short,contrc_type,asset_type,contrc_unit,crncy_type,exch_crncy_type,capit_reback_days,posi_reback_days,step_price,main_flag,time_stamp from db_pub.tb_basefudt_futu_contrc_info where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_获取合约代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_GetContrcCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_GetContrcCodeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_contrc_code_no int,
    OUT p_contrc_name varchar(64),
    OUT p_pinyin_short varchar(16),
    OUT p_contrc_type int,
    OUT p_asset_type int,
    OUT p_par_value decimal(16,9),
    OUT p_contrc_unit int,
    OUT p_report_unit int,
    OUT p_min_unit int,
    OUT p_max_qty decimal(18,2),
    OUT p_min_qty decimal(18,2),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_fee_set varchar(2048),
    OUT p_is_order_dir_flag int,
    OUT p_valid_flag int,
    OUT p_contrc_limit_flag int,
    OUT p_margin_pref int,
    OUT p_posi_type int,
    OUT p_deli_year int,
    OUT p_deli_month int,
    OUT p_begin_trade_date int,
    OUT p_expire_date int,
    OUT p_begin_deli_date int,
    OUT p_end_deli_date int,
    OUT p_open_order_type int,
    OUT p_step_price decimal(16,9),
    OUT p_hold_qty decimal(18,2),
    OUT p_main_flag int,
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
    declare v_contrc_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_contrc_code_no int;
    declare v_contrc_name varchar(64);
    declare v_pinyin_short varchar(16);
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);
    declare v_contrc_unit int;
    declare v_report_unit int;
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_fee_set varchar(2048);
    declare v_is_order_dir_flag int;
    declare v_valid_flag int;
    declare v_contrc_limit_flag int;
    declare v_margin_pref int;
    declare v_posi_type int;
    declare v_deli_year int;
    declare v_deli_month int;
    declare v_begin_trade_date int;
    declare v_expire_date int;
    declare v_begin_deli_date int;
    declare v_end_deli_date int;
    declare v_open_order_type int;
    declare v_step_price decimal(16,9);
    declare v_hold_qty decimal(18,2);
    declare v_main_flag int;
    declare v_time_stamp int;
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
    SET v_contrc_code = p_contrc_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_contrc_code_no = 0;
    SET v_contrc_name = " ";
    SET v_pinyin_short = " ";
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;
    SET v_contrc_unit = 0;
    SET v_report_unit = 0;
    SET v_min_unit = 0;
    SET v_max_qty = 0;
    SET v_min_qty = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_fee_set = " ";
    SET v_is_order_dir_flag = 0;
    SET v_valid_flag = 0;
    SET v_contrc_limit_flag = 0;
    SET v_margin_pref = 0;
    SET v_posi_type = 0;
    SET v_deli_year = 0;
    SET v_deli_month = 0;
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_expire_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_deli_date = date_format(curdate(),'%Y%m%d');
    SET v_end_deli_date = date_format(curdate(),'%Y%m%d');
    SET v_open_order_type = 0;
    SET v_step_price = 0;
    SET v_hold_qty = 0;
    SET v_main_flag = 0;
    SET v_time_stamp = unix_timestamp();
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_期货基础数据_合约代码信息表][字段][字段变量][{市场编号}=@市场编号# and {合约代码} = @合约代码#][1][@合约代码编号#, @市场编号#, @合约代码#] */
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
        v_time_stamp from db_pub.tb_basefudt_futu_contrc_info where exch_no=v_exch_no and contrc_code = v_contrc_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.13.145.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 合约代码=", v_contrc_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 合约代码=", v_contrc_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_name = v_contrc_name;
    SET p_pinyin_short = v_pinyin_short;
    SET p_contrc_type = v_contrc_type;
    SET p_asset_type = v_asset_type;
    SET p_par_value = v_par_value;
    SET p_contrc_unit = v_contrc_unit;
    SET p_report_unit = v_report_unit;
    SET p_min_unit = v_min_unit;
    SET p_max_qty = v_max_qty;
    SET p_min_qty = v_min_qty;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_fee_set = v_fee_set;
    SET p_is_order_dir_flag = v_is_order_dir_flag;
    SET p_valid_flag = v_valid_flag;
    SET p_contrc_limit_flag = v_contrc_limit_flag;
    SET p_margin_pref = v_margin_pref;
    SET p_posi_type = v_posi_type;
    SET p_deli_year = v_deli_year;
    SET p_deli_month = v_deli_month;
    SET p_begin_trade_date = v_begin_trade_date;
    SET p_expire_date = v_expire_date;
    SET p_begin_deli_date = v_begin_deli_date;
    SET p_end_deli_date = v_end_deli_date;
    SET p_open_order_type = v_open_order_type;
    SET p_step_price = v_step_price;
    SET p_hold_qty = v_hold_qty;
    SET p_main_flag = v_main_flag;
    SET p_time_stamp = v_time_stamp;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询合约代码信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryContrcCodeInfoJour;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryContrcCodeInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_contrc_code_no int,
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
    declare v_contrc_code_no int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货基础数据_合约代码信息流水表][字段][{初始化日期}<=@初始化日期# and (@合约代码编号# = 0 or {合约代码编号}=@合约代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        contrc_code_no, exch_no, contrc_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_basefudt_futu_contrc_info_jour where init_date<=v_init_date and (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        contrc_code_no, exch_no, contrc_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_basefudt_futu_contrc_info_jour where init_date<=v_init_date and (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询历史合约代码信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryContrcCodeInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryContrcCodeInfoJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_contrc_code_no int,
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
    declare v_contrc_code_no int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_期货基础数据_合约代码信息流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@合约代码编号# = 0 or {合约代码编号}=@合约代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        contrc_code_no, exch_no, contrc_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_basefudt_futu_contrc_info_jour_his where (init_date between v_begin_date and v_end_date) and (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        contrc_code_no, exch_no, contrc_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_basefudt_futu_contrc_info_jour_his where (init_date between v_begin_date and v_end_date) and (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询合约代码列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryContrcCodeInfoList;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryContrcCodeInfoList(
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
    

    /* [获取表记录][公共_期货基础数据_合约代码信息表][{记录序号},{合约代码编号},{市场编号},{合约代码},{合约名称},{合约类型},{资产类型}][{记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,contrc_code_no,exch_no,contrc_code,contrc_name,contrc_type,asset_type from db_pub.tb_basefudt_futu_contrc_info where row_id > v_row_id order by row_id;
    else
        select row_id,contrc_code_no,exch_no,contrc_code,contrc_name,contrc_type,asset_type from db_pub.tb_basefudt_futu_contrc_info where row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_新增合约代码订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_AddContrcCodeOrderDir;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_AddContrcCodeOrderDir(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_contrc_code_no int,
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
    declare v_contrc_code_no int;
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
    declare v_time_stamp int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_contrc_code_no = p_contrc_code_no;
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
    SET v_time_stamp = unix_timestamp();
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "合约代码编号", "|", "市场编号", "|", "订单方向", "|", "资金冻结方式", "|", "订单数量拆分标志", "|", "最小单位", "|", "最大数量", "|", "最小数量", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_contrc_code_no, "|", v_exch_no, "|", v_order_dir, "|", v_cash_frozen_type, "|", v_order_split_flag, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [插入表记录][公共_期货基础数据_合约代码订单方向表][字段][字段变量][1][@合约代码编号#, @市场编号#, @订单方向#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basefudt_contrc_code_order_dir(
        create_date, create_time, update_date, 
        update_time, update_times, contrc_code_no, exch_no, 
        order_dir, cash_frozen_type, order_split_flag, min_unit, 
        max_qty, min_qty, time_stamp) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_contrc_code_no, v_exch_no, 
        v_order_dir, v_cash_frozen_type, v_order_split_flag, v_min_unit, 
        v_max_qty, v_min_qty, v_time_stamp);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.151.1";
        SET v_error_info =  CONCAT(concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_期货基础数据_合约代码订单方向表][字段][字段变量][{合约代码编号}=@合约代码编号# and {市场编号}=@市场编号# and {订单方向}=@订单方向#][2][@合约代码编号#, @市场编号#, @订单方向#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, contrc_code_no, 
        exch_no, order_dir, cash_frozen_type, order_split_flag, 
        min_unit, max_qty, min_qty, time_stamp into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_contrc_code_no, 
        v_exch_no, v_order_dir, v_cash_frozen_type, v_order_split_flag, 
        v_min_unit, v_max_qty, v_min_qty, v_time_stamp from db_pub.tb_basefudt_contrc_code_order_dir where contrc_code_no=v_contrc_code_no and exch_no=v_exch_no and order_dir=v_order_dir limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.13.151.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_contrc_code_no, "|", v_exch_no, "|", v_order_dir, "|", v_cash_frozen_type, "|", v_order_split_flag, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_期货基础数据_合约代码订单方向流水表][字段][字段变量][5][@合约代码编号#, @市场编号#, @订单方向#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basefudt_contrc_code_order_dir_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, contrc_code_no, 
        exch_no, order_dir, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_contrc_code_no, 
        v_exch_no, v_order_dir, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.151.5";
        SET v_error_info =  CONCAT(concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_修改合约代码订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_ModiContrcCodeOrderDir;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_ModiContrcCodeOrderDir(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_contrc_code_no int,
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
    declare v_contrc_code_no int;
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
    declare v_time_stamp int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_contrc_code_no = p_contrc_code_no;
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
    SET v_time_stamp = unix_timestamp();
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "合约代码编号", "|", "市场编号", "|", "订单方向", "|", "资金冻结方式", "|", "订单数量拆分标志", "|", "最小单位", "|", "最大数量", "|", "最小数量", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_contrc_code_no, "|", v_exch_no, "|", v_order_dir, "|", v_cash_frozen_type, "|", v_order_split_flag, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_期货基础数据_合约代码订单方向表][{资金冻结方式}=@资金冻结方式#,{订单数量拆分标志}=@订单数量拆分标志#,{最小单位}=@最小单位#,{最大数量}=@最大数量#,{最小数量}=@最小数量#,{时间戳}=@时间戳#][{合约代码编号}=@合约代码编号# and {市场编号}=@市场编号# and {订单方向}=@订单方向#][2][@合约代码编号#, @市场编号#, @订单方向#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basefudt_contrc_code_order_dir set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cash_frozen_type=v_cash_frozen_type,order_split_flag=v_order_split_flag,min_unit=v_min_unit,max_qty=v_max_qty,min_qty=v_min_qty,time_stamp=v_time_stamp where contrc_code_no=v_contrc_code_no and exch_no=v_exch_no and order_dir=v_order_dir;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.152.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_期货基础数据_合约代码订单方向表][字段][字段变量][{合约代码编号}=@合约代码编号# and {市场编号}=@市场编号# and {订单方向}=@订单方向#][4][@合约代码编号#, @市场编号#, @订单方向#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, contrc_code_no, 
        exch_no, order_dir, cash_frozen_type, order_split_flag, 
        min_unit, max_qty, min_qty, time_stamp into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_contrc_code_no, 
        v_exch_no, v_order_dir, v_cash_frozen_type, v_order_split_flag, 
        v_min_unit, v_max_qty, v_min_qty, v_time_stamp from db_pub.tb_basefudt_contrc_code_order_dir where contrc_code_no=v_contrc_code_no and exch_no=v_exch_no and order_dir=v_order_dir limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.13.152.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_contrc_code_no, "|", v_exch_no, "|", v_order_dir, "|", v_cash_frozen_type, "|", v_order_split_flag, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_期货基础数据_合约代码订单方向流水表][字段][字段变量][5][@合约代码编号#, @市场编号#, @订单方向#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basefudt_contrc_code_order_dir_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, contrc_code_no, 
        exch_no, order_dir, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_contrc_code_no, 
        v_exch_no, v_order_dir, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.152.5";
        SET v_error_info =  CONCAT(concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_删除合约代码订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_DeleteContrcCodeOrderDir;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_DeleteContrcCodeOrderDir(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_contrc_code_no int,
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
    declare v_contrc_code_no int;
    declare v_exch_no int;
    declare v_order_dir int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_cash_frozen_type int;
    declare v_order_split_flag int;
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_time_stamp int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_exch_no = p_exch_no;
    SET v_order_dir = p_order_dir;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_cash_frozen_type = 0;
    SET v_order_split_flag = 0;
    SET v_min_unit = 0;
    SET v_max_qty = 0;
    SET v_min_qty = 0;
    SET v_time_stamp = unix_timestamp();
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @流水变动字段# = " "; */
    set v_jour_occur_field = " ";

    /* set @流水变动信息# = " " ; */
    set v_jour_occur_info = " " ;

    /* [获取表记录变量][公共_期货基础数据_合约代码订单方向表][字段][字段变量][{合约代码编号}=@合约代码编号# and {市场编号}=@市场编号# and {订单方向}=@订单方向#][4][@合约代码编号#, @市场编号#, @订单方向#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, contrc_code_no, 
        exch_no, order_dir, cash_frozen_type, order_split_flag, 
        min_unit, max_qty, min_qty, time_stamp into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_contrc_code_no, 
        v_exch_no, v_order_dir, v_cash_frozen_type, v_order_split_flag, 
        v_min_unit, v_max_qty, v_min_qty, v_time_stamp from db_pub.tb_basefudt_contrc_code_order_dir where contrc_code_no=v_contrc_code_no and exch_no=v_exch_no and order_dir=v_order_dir limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.13.153.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_期货基础数据_合约代码订单方向表][{合约代码编号}=@合约代码编号# and {市场编号}=@市场编号# and {订单方向}=@订单方向#][3][@合约代码编号#, @市场编号#, @订单方向#] */
    delete from db_pub.tb_basefudt_contrc_code_order_dir 
        where contrc_code_no=v_contrc_code_no and exch_no=v_exch_no and order_dir=v_order_dir;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.13.153.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# =" " ; */
    set v_jour_after_occur_info =" " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_期货基础数据_合约代码订单方向流水表][字段][字段变量][5][@合约代码编号#, @市场编号#, @订单方向#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basefudt_contrc_code_order_dir_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, contrc_code_no, 
        exch_no, order_dir, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_contrc_code_no, 
        v_exch_no, v_order_dir, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.153.5";
        SET v_error_info =  CONCAT(concat("合约代码编号=",v_contrc_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询合约代码订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryContrcCodeOrderDir;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryContrcCodeOrderDir(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code_no int,
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
    declare v_contrc_code_no int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_time_stamp = p_time_stamp;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货基础数据_合约代码订单方向表][字段][(@合约代码编号# = 0 or {合约代码编号}=@合约代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@订单方向串# = "; ;" or instr(@订单方向串#, concat(";", {订单方向}, ";")) > 0) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, contrc_code_no, 
        exch_no, order_dir, cash_frozen_type, order_split_flag, 
        min_unit, max_qty, min_qty, time_stamp from db_pub.tb_basefudt_contrc_code_order_dir where (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_order_dir_str = "; ;" or instr(v_order_dir_str, concat(";", order_dir, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, contrc_code_no, 
        exch_no, order_dir, cash_frozen_type, order_split_flag, 
        min_unit, max_qty, min_qty, time_stamp from db_pub.tb_basefudt_contrc_code_order_dir where (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_order_dir_str = "; ;" or instr(v_order_dir_str, concat(";", order_dir, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询合约代码订单方向流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryContrcCodeOrderDirJour;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryContrcCodeOrderDirJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_contrc_code_no int,
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
    declare v_contrc_code_no int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货基础数据_合约代码订单方向流水表][字段][{初始化日期}<=@初始化日期# and (@合约代码编号# = 0 or {合约代码编号}=@合约代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@订单方向串# = "; ;" or instr(@订单方向串#, concat(";", {订单方向}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        contrc_code_no, exch_no, order_dir, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_basefudt_contrc_code_order_dir_jour where init_date<=v_init_date and (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_order_dir_str = "; ;" or instr(v_order_dir_str, concat(";", order_dir, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        contrc_code_no, exch_no, order_dir, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_basefudt_contrc_code_order_dir_jour where init_date<=v_init_date and (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_order_dir_str = "; ;" or instr(v_order_dir_str, concat(";", order_dir, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询历史合约代码订单方向流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryContrcCodeOrderDirJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryContrcCodeOrderDirJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_contrc_code_no int,
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
    declare v_contrc_code_no int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_期货基础数据_合约代码订单方向流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@合约代码编号# = 0 or {合约代码编号}=@合约代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@订单方向串# = "; ;" or instr(@订单方向串#, concat(";", {订单方向}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        contrc_code_no, exch_no, order_dir, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_basefudt_contrc_code_order_dir_jour_his where (init_date between v_begin_date and v_end_date) and (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_order_dir_str = "; ;" or instr(v_order_dir_str, concat(";", order_dir, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        contrc_code_no, exch_no, order_dir, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_basefudt_contrc_code_order_dir_jour_his where (init_date between v_begin_date and v_end_date) and (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_order_dir_str = "; ;" or instr(v_order_dir_str, concat(";", order_dir, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_增加合约交割参数记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_AddDeliParam;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_AddDeliParam(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code_no int,
    IN p_deli_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_deli_price decimal(16,9);
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_deli_price = p_deli_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][公共_期货基础数据_合约交割参数表][字段][字段变量][1][@合约代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basefudt_futu_deli_param(
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, contrc_code_no, 
        deli_price) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_no, v_contrc_code_no, 
        v_deli_price);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.157.1";
        SET v_error_info =  CONCAT(concat("合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_修改合约交割参数记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_ModiDeliParam;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_ModiDeliParam(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code_no int,
    IN p_deli_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_deli_price decimal(16,9);
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_deli_price = p_deli_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_期货基础数据_合约交割参数表][{交割价}=@交割价#][{合约代码编号}=@合约代码编号#][2][@合约代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basefudt_futu_deli_param set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deli_price=v_deli_price where contrc_code_no=v_contrc_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.158.2";
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

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_删除合约交割参数记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_DeleteDeliParam;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_DeleteDeliParam(
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
    OUT p_error_info varchar(255)
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [删除表记录][公共_期货基础数据_合约交割参数表][{市场编号}=@市场编号# and {合约代码编号}=@合约代码编号#][1][@市场编号#,@合约代码编号#] */
    delete from db_pub.tb_basefudt_futu_deli_param 
        where exch_no=v_exch_no and contrc_code_no=v_contrc_code_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.13.159.1";
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

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询合约交割参数记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryDeliParam;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryDeliParam(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
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
    declare v_exch_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货基础数据_合约交割参数表][字段][(@市场编号#=0 or {市场编号}=@市场编号#) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        contrc_code_no, deli_price from db_pub.tb_basefudt_futu_deli_param where (v_exch_no=0 or exch_no=v_exch_no) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        contrc_code_no, deli_price from db_pub.tb_basefudt_futu_deli_param where (v_exch_no=0 or exch_no=v_exch_no) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_归档公共期货基础数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_BackUpFutuBaseData;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_BackUpFutuBaseData(
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
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [数据归历史][公共_期货基础数据_合约类型流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_basefudt_contrc_type_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, contrc_type, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, contrc_type, jour_occur_field, jour_after_occur_info, 
        oper_remark_info 
        from db_pub.tb_basefudt_contrc_type_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_期货基础数据_合约类型流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_basefudt_contrc_type_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.13.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_期货基础数据_合约类型订单方向流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_basefudt_contrc_type_order_dir_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, contrc_type, order_dir, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, contrc_type, order_dir, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pub.tb_basefudt_contrc_type_order_dir_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_期货基础数据_合约类型订单方向流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_basefudt_contrc_type_order_dir_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.13.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_期货基础数据_合约代码信息流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_basefudt_futu_contrc_info_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        contrc_code_no, exch_no, contrc_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        contrc_code_no, exch_no, contrc_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pub.tb_basefudt_futu_contrc_info_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_期货基础数据_合约代码信息流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_basefudt_futu_contrc_info_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.13.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_期货基础数据_合约代码订单方向流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_basefudt_contrc_code_order_dir_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        contrc_code_no, exch_no, order_dir, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        contrc_code_no, exch_no, order_dir, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pub.tb_basefudt_contrc_code_order_dir_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_期货基础数据_合约代码订单方向流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_basefudt_contrc_code_order_dir_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.13.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_期货基础数据_历史期货行情表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pub_his.tb_basefudt_futu_quot_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.13.201.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][公共_期货基础数据_期货行情表][字段][302][@初始化日期#] */
    insert into db_pub_his.tb_basefudt_futu_quot_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, contrc_code_no, exch_no, 
        contrc_code, contrc_name, pre_close_price, sett_price, 
        pre_settle_price, today_close_price, hold_qty, pre_hold_qty, 
        last_price, today_open_price, max_buy_price, min_sale_price, 
        total_buy_qty, total_sale_qty, up_limit_price, down_limit_price, 
        strike_qty, strike_amt, buy_price_1, buy_qty_1, 
        buy_price_2, buy_qty_2, buy_price_3, buy_qty_3, 
        buy_price_4, buy_qty_4, buy_price_5, buy_qty_5, 
        sell_price_1, sell_qty_1, sell_price_2, sell_qty_2, 
        sell_price_3, sell_qty_3, sell_price_4, sell_qty_4, 
        sell_price_5, sell_qty_5, contrc_type, asset_type, 
        time_stamp) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, contrc_code_no, exch_no, 
        contrc_code, contrc_name, pre_close_price, sett_price, 
        pre_settle_price, today_close_price, hold_qty, pre_hold_qty, 
        last_price, today_open_price, max_buy_price, min_sale_price, 
        total_buy_qty, total_sale_qty, up_limit_price, down_limit_price, 
        strike_qty, strike_amt, buy_price_1, buy_qty_1, 
        buy_price_2, buy_qty_2, buy_price_3, buy_qty_3, 
        buy_price_4, buy_qty_4, buy_price_5, buy_qty_5, 
        sell_price_1, sell_qty_1, sell_price_2, sell_qty_2, 
        sell_price_3, sell_qty_3, sell_price_4, sell_qty_4, 
        sell_price_5, sell_qty_5, contrc_type, asset_type, 
        time_stamp 
        from db_pub.tb_basefudt_futu_quot;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.201.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_期货基础数据_期货行情表][{昨结算价}={结算价},{最新价}={结算价}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basefudt_futu_quot set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_settle_price=sett_price,last_price=sett_price where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.201.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_期货基础数据_期货行情流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_basefudt_futu_quot_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, contrc_code_no, 
        exch_no, contrc_code, jour_occur_field, jour_occur_info, 
        jour_after_occur_info, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, contrc_code_no, 
        exch_no, contrc_code, jour_occur_field, jour_occur_info, 
        jour_after_occur_info, remark_info 
        from db_pub.tb_basefudt_futu_quot_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_期货基础数据_期货行情流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_basefudt_futu_quot_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.13.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_获取编号持仓属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_GetContrcNoPosiInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_GetContrcNoPosiInfo(
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
    OUT p_contrc_type int,
    OUT p_asset_type int,
    OUT p_contrc_unit int,
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_contrc_unit int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_contrc_unit = 0;
    SET v_sett_price = 0;
    SET v_pre_settle_price = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_期货基础数据_合约代码信息表][{市场编号},{合约代码},{合约类型},{资产类型},{合约乘数}][@市场编号#,@合约代码#,@合约类型#,@资产类型#,@合约乘数#][{合约代码编号} = @合约代码编号#][4][@合约代码编号#] */
    select exch_no,contrc_code,contrc_type,asset_type,contrc_unit into v_exch_no,v_contrc_code,v_contrc_type,v_asset_type,v_contrc_unit from db_pub.tb_basefudt_futu_contrc_info where contrc_code_no = v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.13.301.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_期货基础数据_期货行情表][{昨结算价},{昨结算价}][@结算价#,@昨结算价#][{合约代码编号}=@合约代码编号#][4][合约代码编号] */
    select pre_settle_price,pre_settle_price into v_sett_price,v_pre_settle_price from db_pub.tb_basefudt_futu_quot where contrc_code_no=v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.13.301.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(合约代码编号,"#",v_mysql_message);
        else
            SET v_error_info = 合约代码编号;
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_no = v_exch_no;
    SET p_contrc_code = v_contrc_code;
    SET p_contrc_type = v_contrc_type;
    SET p_asset_type = v_asset_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_sett_price = v_sett_price;
    SET p_pre_settle_price = v_pre_settle_price;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_获取同步所需合约代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_GetContrcCodeInfoBySync;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_GetContrcCodeInfoBySync(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_contrc_code_no int,
    OUT p_exch_no int,
    OUT p_contrc_type int,
    OUT p_contrc_name varchar(64),
    OUT p_contrc_unit int,
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
    declare v_contrc_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_contrc_code_no int;
    declare v_exch_no int;
    declare v_contrc_type int;
    declare v_contrc_name varchar(64);
    declare v_contrc_unit int;
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
    SET v_contrc_code = p_contrc_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_contrc_code_no = 0;
    SET v_exch_no = 0;
    SET v_contrc_type = 0;
    SET v_contrc_name = " ";
    SET v_contrc_unit = 0;
    SET v_pre_settle_price = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_期货基础数据_合约代码信息表][{合约类型},{合约名称},{市场编号},{合约代码编号},{合约乘数}][@合约类型#,@合约名称#,@市场编号#,@合约代码编号#,@合约乘数#][{合约代码} = @合约代码#][4][@合约代码#] */
    select contrc_type,contrc_name,exch_no,contrc_code_no,contrc_unit into v_contrc_type,v_contrc_name,v_exch_no,v_contrc_code_no,v_contrc_unit from db_pub.tb_basefudt_futu_contrc_info where contrc_code = v_contrc_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.13.302.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码=",v_contrc_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码=",v_contrc_code);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][公共_期货基础数据_期货行情表][{昨结算价}][@昨结算价#][{合约代码编号}=@合约代码编号#][4][@合约代码编号#] */
    select pre_settle_price into v_pre_settle_price from db_pub.tb_basefudt_futu_quot where contrc_code_no=v_contrc_code_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_exch_no = v_exch_no;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_name = v_contrc_name;
    SET p_contrc_unit = v_contrc_unit;
    SET p_pre_settle_price = v_pre_settle_price;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_获取同步编号代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_GetContrcNoInfoBySync;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_GetContrcNoInfoBySync(
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
    OUT p_contrc_type int,
    OUT p_contrc_name varchar(64),
    OUT p_contrc_unit int,
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_name varchar(64);
    declare v_contrc_unit int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_contrc_name = " ";
    SET v_contrc_unit = 0;
    SET v_pre_settle_price = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_期货基础数据_合约代码信息表][{市场编号},{合约代码},{合约类型},{合约名称},{合约乘数}][@市场编号#,@合约代码#,@合约类型#,@合约名称#,@合约乘数#][{合约代码编号} = @合约代码编号#][4][@合约代码编号#] */
    select exch_no,contrc_code,contrc_type,contrc_name,contrc_unit into v_exch_no,v_contrc_code,v_contrc_type,v_contrc_name,v_contrc_unit from db_pub.tb_basefudt_futu_contrc_info where contrc_code_no = v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.13.303.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][公共_期货基础数据_期货行情表][{昨结算价}][@昨结算价#][{合约代码编号}=@合约代码编号#][4][@合约代码编号#] */
    select pre_settle_price into v_pre_settle_price from db_pub.tb_basefudt_futu_quot where contrc_code_no=v_contrc_code_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_no = v_exch_no;
    SET p_contrc_code = v_contrc_code;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_name = v_contrc_name;
    SET p_contrc_unit = v_contrc_unit;
    SET p_pre_settle_price = v_pre_settle_price;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询组合保证金参数
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryGroupMargin;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryGroupMargin(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_type int,
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
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
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
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_type = p_contrc_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货基础数据_期货组合保证金参数表][字段][(@市场编号# = 0 or {市场编号}=@市场编号#) and ((@合约类型#=" " and @合约代码#=" " )  or  ({参与代码}=@合约代码# or {参与代码}=@合约类型#)) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        comb_code, comb_name, comb_type, pref_type, 
        partic_code, margin_ratio, prior_type, trade_pref, 
        sett_pref from db_pub.tb_basefudt_futu_group_margin_config where (v_exch_no = 0 or exch_no=v_exch_no) and ((v_contrc_type=" " and v_contrc_code=" " )  or  (partic_code=v_contrc_code or partic_code=v_contrc_type)) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        comb_code, comb_name, comb_type, pref_type, 
        partic_code, margin_ratio, prior_type, trade_pref, 
        sett_pref from db_pub.tb_basefudt_futu_group_margin_config where (v_exch_no = 0 or exch_no=v_exch_no) and ((v_contrc_type=" " and v_contrc_code=" " )  or  (partic_code=v_contrc_code or partic_code=v_contrc_type)) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_增加自选行情记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_AddCustomQuote;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_AddCustomQuote(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_name varchar(64),
    IN p_contrc_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_contrc_code varchar(6);
    declare v_contrc_name varchar(64);
    declare v_contrc_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
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
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_name = p_contrc_name;
    SET v_contrc_type = p_contrc_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* [插入表记录][公共_期货基础数据_期货自选行情表][字段][字段变量][1][@合约代码#,@合约代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basefudt_futu_custom_quot(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, opor_no, 
        contrc_code_no, exch_no, contrc_code, contrc_name, 
        contrc_type) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_opor_no, 
        v_contrc_code_no, v_exch_no, v_contrc_code, v_contrc_name, 
        v_contrc_type);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.310.1";
        SET v_error_info =  CONCAT(concat("合约代码=",v_contrc_code,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_删除自选行情记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_DeleteCustomQuote;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_DeleteCustomQuote(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [删除表记录][公共_期货基础数据_期货自选行情表][{操作员编号}=@操作员编号# and {合约代码编号}=@合约代码编号# ][1][@操作员编号#,@合约代码编号#] */
    delete from db_pub.tb_basefudt_futu_custom_quot 
        where opor_no=v_opor_no and contrc_code_no=v_contrc_code_no ;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.13.311.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询自选行情记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryCustomQuote;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryCustomQuote(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
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
    declare v_exch_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货基础数据_期货自选行情表][字段][{操作员编号}=@操作员编号#  and  (@市场编号#=0 or {市场编号}=@市场编号#) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, contrc_code_no, exch_no, contrc_code, 
        contrc_name, contrc_type from db_pub.tb_basefudt_futu_custom_quot where opor_no=v_opor_no  and  (v_exch_no=0 or exch_no=v_exch_no) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, contrc_code_no, exch_no, contrc_code, 
        contrc_name, contrc_type from db_pub.tb_basefudt_futu_custom_quot where opor_no=v_opor_no  and  (v_exch_no=0 or exch_no=v_exch_no) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_查询期货行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_QueryFutuQuote;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_QueryFutuQuote(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
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
    declare v_contrc_code varchar(6);
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
    SET v_contrc_code = p_contrc_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货基础数据_期货行情表][字段][(@合约代码#=" " or {合约代码} = @合约代码#) and (@市场编号#=0 or {市场编号} = @市场编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, contrc_code_no, 
        exch_no, contrc_code, contrc_name, pre_close_price, 
        sett_price, pre_settle_price, today_close_price, hold_qty, 
        pre_hold_qty, last_price, today_open_price, max_buy_price, 
        min_sale_price, total_buy_qty, total_sale_qty, up_limit_price, 
        down_limit_price, strike_qty, strike_amt, buy_price_1, 
        buy_qty_1, buy_price_2, buy_qty_2, buy_price_3, 
        buy_qty_3, buy_price_4, buy_qty_4, buy_price_5, 
        buy_qty_5, sell_price_1, sell_qty_1, sell_price_2, 
        sell_qty_2, sell_price_3, sell_qty_3, sell_price_4, 
        sell_qty_4, sell_price_5, sell_qty_5, contrc_type, 
        asset_type, time_stamp from db_pub.tb_basefudt_futu_quot where (v_contrc_code=" " or contrc_code = v_contrc_code) and (v_exch_no=0 or exch_no = v_exch_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, contrc_code_no, 
        exch_no, contrc_code, contrc_name, pre_close_price, 
        sett_price, pre_settle_price, today_close_price, hold_qty, 
        pre_hold_qty, last_price, today_open_price, max_buy_price, 
        min_sale_price, total_buy_qty, total_sale_qty, up_limit_price, 
        down_limit_price, strike_qty, strike_amt, buy_price_1, 
        buy_qty_1, buy_price_2, buy_qty_2, buy_price_3, 
        buy_qty_3, buy_price_4, buy_qty_4, buy_price_5, 
        buy_qty_5, sell_price_1, sell_qty_1, sell_price_2, 
        sell_qty_2, sell_price_3, sell_qty_3, sell_price_4, 
        sell_qty_4, sell_price_5, sell_qty_5, contrc_type, 
        asset_type, time_stamp from db_pub.tb_basefudt_futu_quot where (v_contrc_code=" " or contrc_code = v_contrc_code) and (v_exch_no=0 or exch_no = v_exch_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货基础数据_更新期货行情结算价
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basefudt_UpdateFutuQuoteSettlePrice;;
DELIMITER ;;
CREATE PROCEDURE pra_basefudt_UpdateFutuQuoteSettlePrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    IN p_sett_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_sett_price decimal(16,9);
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
    SET v_contrc_code = p_contrc_code;
    SET v_sett_price = p_sett_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_期货基础数据_期货行情表][{结算价} = case when @结算价# <> 0 then @结算价# else {结算价} end][{市场编号}=@市场编号# and {合约代码} = @合约代码#][2][@市场编号#,@合约代码#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basefudt_futu_quot set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_price = case when v_sett_price <> 0 then v_sett_price else sett_price end where exch_no=v_exch_no and contrc_code = v_contrc_code;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.13.314.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


