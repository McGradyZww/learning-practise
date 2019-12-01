DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询证券模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockTmplat(
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
    

    /* [获取表记录][公共_证券基础数据_证券模板表][字段][(@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and (@证券代码特征# = " " or {证券代码特征}=@证券代码特征#) and (@证券名称特征# = " " or {证券名称特征}=@证券名称特征#) and (@模板名称# = " " or {模板名称}=@模板名称#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, model_name, 
        exch_no, stock_code_feature, stock_name_feature, stock_type from db_pub.tb_basesedt_stock_tmplat where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_stock_code_feature = " " or stock_code_feature=v_stock_code_feature) and (v_stock_name_feature = " " or stock_name_feature=v_stock_name_feature) and (v_model_name = " " or model_name=v_model_name) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, model_name, 
        exch_no, stock_code_feature, stock_name_feature, stock_type from db_pub.tb_basesedt_stock_tmplat where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_stock_code_feature = " " or stock_code_feature=v_stock_code_feature) and (v_stock_name_feature = " " or stock_name_feature=v_stock_name_feature) and (v_model_name = " " or model_name=v_model_name) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_修改证券类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_ModiStockType;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_ModiStockType(
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
    declare v_time_stamp int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_time_stamp = unix_timestamp();
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "市场编号", "|", "证券类型", "|", "证券类型简称", "|", "资产类型", "|", "票面面值", "|", "本币币种", "|", "交易币种", "|", "资金回转天数", "|", "持仓回转天数", "|", "类型单位", "|", "申报单位", "|", "最小单位", "|", "最大数量", "|", "最小数量", "|", "区分订单方向标志", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_type, "|", v_stock_type_name, "|", v_asset_type, "|", v_par_value, "|", v_crncy_type, "|", v_exch_crncy_type, "|", v_capit_reback_days, "|", v_posi_reback_days, "|", v_type_unit, "|", v_report_unit, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_is_order_dir_flag, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_证券基础数据_证券类型表][{证券类型简称}=@证券类型简称#,{资产类型}=@资产类型#,{票面面值}=@票面面值#,{申报单位}=@申报单位#,{最小单位}=@最小单位#,{最大数量}=@最大数量#,{最小数量}=@最小数量#,{类型单位}=@类型单位#,{本币币种}=@本币币种#,{交易币种}=@交易币种#,{资金回转天数} = @资金回转天数#,{持仓回转天数} = @持仓回转天数#,{区分订单方向标志}=@区分订单方向标志#,{时间戳}=@时间戳#][{市场编号}=@市场编号# and {证券类型}=@证券类型#][2][@市场编号#, @证券类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_stock_type set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_type_name=v_stock_type_name,asset_type=v_asset_type,par_value=v_par_value,report_unit=v_report_unit,min_unit=v_min_unit,max_qty=v_max_qty,min_qty=v_min_qty,type_unit=v_type_unit,crncy_type=v_crncy_type,exch_crncy_type=v_exch_crncy_type,capit_reback_days = v_capit_reback_days,posi_reback_days = v_posi_reback_days,is_order_dir_flag=v_is_order_dir_flag,time_stamp=v_time_stamp where exch_no=v_exch_no and stock_type=v_stock_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.12.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_证券类型表][{记录序号}][@记录序号#][{市场编号}=@市场编号# and {证券类型}=@证券类型#][4][@市场编号#, @证券类型#] */
    select row_id into v_row_id from db_pub.tb_basesedt_stock_type where exch_no=v_exch_no and stock_type=v_stock_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.12.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_type, "|", v_stock_type_name, "|", v_asset_type, "|", v_par_value, "|", v_crncy_type, "|", v_exch_crncy_type, "|", v_capit_reback_days, "|", v_posi_reback_days, "|", v_type_unit, "|", v_report_unit, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_is_order_dir_flag, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_证券类型流水表][字段][字段变量][5][@市场编号#, @证券类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_stock_type_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, exch_no, 
        stock_type, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_exch_no, 
        v_stock_type, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.12.5";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询证券类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockType;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockType(
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
    

    /* [获取表记录][公共_证券基础数据_证券类型表][{记录序号},{市场编号},{证券类型},{证券类型简称},{资产类型},{票面面值},{本币币种},{交易币种},{资金回转天数},{持仓回转天数},{类型单位},{申报单位},{最小单位},{最大数量},{最小数量},{区分订单方向标志},{时间戳}][(@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and (@资产类型串# = "; ;" or instr(@资产类型串#, concat(";", {资产类型}, ";")) > 0) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,exch_no,stock_type,stock_type_name,asset_type,par_value,crncy_type,exch_crncy_type,capit_reback_days,posi_reback_days,type_unit,report_unit,min_unit,max_qty,min_qty,is_order_dir_flag,time_stamp from db_pub.tb_basesedt_stock_type where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_asset_type_str = "; ;" or instr(v_asset_type_str, concat(";", asset_type, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
        select row_id,exch_no,stock_type,stock_type_name,asset_type,par_value,crncy_type,exch_crncy_type,capit_reback_days,posi_reback_days,type_unit,report_unit,min_unit,max_qty,min_qty,is_order_dir_flag,time_stamp from db_pub.tb_basesedt_stock_type where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_asset_type_str = "; ;" or instr(v_asset_type_str, concat(";", asset_type, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询证券类型流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockTypeJour;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockTypeJour(
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
    

    /* [获取表记录][公共_证券基础数据_证券类型流水表][字段][{初始化日期}<=@初始化日期# and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_type, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub.tb_basesedt_stock_type_jour where init_date<=v_init_date and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_type, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub.tb_basesedt_stock_type_jour where init_date<=v_init_date and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询历史证券类型流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockTypeJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockTypeJour_His(
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
    

    /* [获取表记录][历史_公共_证券基础数据_证券类型流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_type, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub_his.tb_basesedt_stock_type_jour_his where (init_date between v_begin_date and v_end_date) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_type, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub_his.tb_basesedt_stock_type_jour_his where (init_date between v_begin_date and v_end_date) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询证券类型订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockTypeOrderDir;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockTypeOrderDir(
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
    

    /* [获取表记录][公共_证券基础数据_证券类型订单方向表][字段][(@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and (@订单方向串# = "; ;" or instr(@订单方向串#, concat(";", {订单方向}, ";")) > 0) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_type, order_dir, cash_frozen_type, order_split_flag, 
        min_unit, max_qty, min_qty, time_stamp from db_pub.tb_basesedt_stock_type_order_dir where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_order_dir_str = "; ;" or instr(v_order_dir_str, concat(";", order_dir, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_type, order_dir, cash_frozen_type, order_split_flag, 
        min_unit, max_qty, min_qty, time_stamp from db_pub.tb_basesedt_stock_type_order_dir where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_order_dir_str = "; ;" or instr(v_order_dir_str, concat(";", order_dir, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_新增证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_AddStockCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_AddStockCodeInfo(
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
    declare v_time_stamp int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_time_stamp = unix_timestamp();
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "证券代码编号", "|", "市场编号", "|", "证券代码", "|", "证券名称", "|", "拼音简称", "|", "证券类型", "|", "资产类型", "|", "票面面值", "|", "本币币种", "|", "交易币种", "|", "总股本", "|", "流通股本", "|", "资金回转天数", "|", "持仓回转天数", "|", "类型单位", "|", "申报单位", "|", "最小单位", "|", "最大数量", "|", "最小数量", "|", "区分订单方向标志", "|", "价格上限", "|", "价格下限", "|", "最小价差", "|", "公允价格", "|", "停牌标志", "|", "港股通标的", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_stock_code_no, "|", v_exch_no, "|", v_stock_code, "|", v_stock_name, "|", v_pinyin_short, "|", v_stock_type, "|", v_asset_type, "|", v_par_value, "|", v_crncy_type, "|", v_exch_crncy_type, "|", v_total_stock_issue, "|", v_circl_stock_capit, "|", v_capit_reback_days, "|", v_posi_reback_days, "|", v_type_unit, "|", v_report_unit, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_is_order_dir_flag, "|", v_price_up, "|", v_price_down, "|", v_step_price, "|", v_fair_price, "|", v_stop_status, "|", v_hk_stock_flag, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [插入表记录][公共_证券基础数据_证券代码信息表][字段][字段变量][1][@市场编号#, @证券代码#] */
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
                
        SET v_error_code = "pubA.1.41.1";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_stock_code_no, "|", v_exch_no, "|", v_stock_code, "|", v_stock_name, "|", v_pinyin_short, "|", v_stock_type, "|", v_asset_type, "|", v_par_value, "|", v_crncy_type, "|", v_exch_crncy_type, "|", v_total_stock_issue, "|", v_circl_stock_capit, "|", v_capit_reback_days, "|", v_posi_reback_days, "|", v_type_unit, "|", v_report_unit, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_is_order_dir_flag, "|", v_price_up, "|", v_price_down, "|", v_step_price, "|", v_fair_price, "|", v_stop_status, "|", v_hk_stock_flag, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_证券代码信息流水表][字段][字段变量][5][@市场编号#, @证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_stock_code_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, stock_code, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_stock_code, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.41.5";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_修改证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_ModiStockCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_ModiStockCodeInfo(
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
    declare v_time_stamp int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_time_stamp = unix_timestamp();
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "证券代码编号", "|", "市场编号", "|", "证券代码", "|", "证券名称", "|", "拼音简称", "|", "证券类型", "|", "资产类型", "|", "票面面值", "|", "本币币种", "|", "交易币种", "|", "总股本", "|", "流通股本", "|", "资金回转天数", "|", "持仓回转天数", "|", "类型单位", "|", "申报单位", "|", "最小单位", "|", "最大数量", "|", "最小数量", "|", "区分订单方向标志", "|", "价格上限", "|", "价格下限", "|", "最小价差", "|", "公允价格", "|", "停牌标志", "|", "港股通标的", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_stock_code_no, "|", v_exch_no, "|", v_stock_code, "|", v_stock_name, "|", v_pinyin_short, "|", v_stock_type, "|", v_asset_type, "|", v_par_value, "|", v_crncy_type, "|", v_exch_crncy_type, "|", v_total_stock_issue, "|", v_circl_stock_capit, "|", v_capit_reback_days, "|", v_posi_reback_days, "|", v_type_unit, "|", v_report_unit, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_is_order_dir_flag, "|", v_price_up, "|", v_price_down, "|", v_step_price, "|", v_fair_price, "|", v_stop_status, "|", v_hk_stock_flag, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_证券基础数据_证券代码信息表][{证券名称}=@证券名称#,{拼音简称}=@拼音简称#,{证券类型}=@证券类型#,{资产类型}=@资产类型#,{票面面值}=@票面面值#,{本币币种}=@本币币种#,{交易币种}=@交易币种#,{总股本}=@总股本#,{流通股本}=@流通股本#,{资金回转天数} = @资金回转天数#,{持仓回转天数} = @持仓回转天数#,{类型单位}=@类型单位#,{申报单位}=@申报单位#,{最小单位}=@最小单位#,{最大数量}=@最大数量#,{最小数量}=@最小数量#,{区分订单方向标志}=@区分订单方向标志#,{价格上限}=@价格上限#,{价格下限}=@价格下限#,{最小价差}=@最小价差#,{公允价格}=@公允价格#,{停牌标志}=@停牌标志#,{港股通标的}=@港股通标的#,{时间戳}=@时间戳#][{证券代码编号} = @证券代码编号# and {市场编号}=@市场编号# and {证券代码}=@证券代码#][2][@证券代码编号#, @市场编号#, @证券代码#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_stock_code_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_name=v_stock_name,pinyin_short=v_pinyin_short,stock_type=v_stock_type,asset_type=v_asset_type,par_value=v_par_value,crncy_type=v_crncy_type,exch_crncy_type=v_exch_crncy_type,total_stock_issue=v_total_stock_issue,circl_stock_capit=v_circl_stock_capit,capit_reback_days = v_capit_reback_days,posi_reback_days = v_posi_reback_days,type_unit=v_type_unit,report_unit=v_report_unit,min_unit=v_min_unit,max_qty=v_max_qty,min_qty=v_min_qty,is_order_dir_flag=v_is_order_dir_flag,price_up=v_price_up,price_down=v_price_down,step_price=v_step_price,fair_price=v_fair_price,stop_status=v_stop_status,hk_stock_flag=v_hk_stock_flag,time_stamp=v_time_stamp where stock_code_no = v_stock_code_no and exch_no=v_exch_no and stock_code=v_stock_code;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.42.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 证券代码=", v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{记录序号}][@记录序号#][{证券代码编号} = @证券代码编号# and {市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@证券代码编号#, @市场编号#, @证券代码#] */
    select row_id into v_row_id from db_pub.tb_basesedt_stock_code_info where stock_code_no = v_stock_code_no and exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.42.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 证券代码=", v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_stock_code_no, "|", v_exch_no, "|", v_stock_code, "|", v_stock_name, "|", v_pinyin_short, "|", v_stock_type, "|", v_asset_type, "|", v_par_value, "|", v_crncy_type, "|", v_exch_crncy_type, "|", v_total_stock_issue, "|", v_circl_stock_capit, "|", v_capit_reback_days, "|", v_posi_reback_days, "|", v_type_unit, "|", v_report_unit, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_is_order_dir_flag, "|", v_price_up, "|", v_price_down, "|", v_step_price, "|", v_fair_price, "|", v_stop_status, "|", v_hk_stock_flag, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_证券代码信息流水表][字段][字段变量][5][@证券代码编号#, @市场编号#, @证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_stock_code_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, stock_code, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_stock_code, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.42.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询证券信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockInfo(
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
    

    /* [获取表记录][公共_证券基础数据_证券代码信息表][{证券代码编号},{市场编号},{证券代码},{证券名称},{拼音简称}][(@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码# = " " or {证券代码} like concat("%",@证券代码#,"%")) and (@证券名称#= " " or {证券名称} like concat("%",@证券名称#,"%")) and (@拼音简称#= " " or {拼音简称} like concat("%",@拼音简称#,"%")) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select stock_code_no,exch_no,stock_code,stock_name,pinyin_short from db_pub.tb_basesedt_stock_code_info where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code like concat("%",v_stock_code,"%")) and (v_stock_name= " " or stock_name like concat("%",v_stock_name,"%")) and (v_pinyin_short= " " or pinyin_short like concat("%",v_pinyin_short,"%")) and row_id > v_row_id order by row_id;
    else
        select stock_code_no,exch_no,stock_code,stock_name,pinyin_short from db_pub.tb_basesedt_stock_code_info where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code like concat("%",v_stock_code,"%")) and (v_stock_name= " " or stock_name like concat("%",v_stock_name,"%")) and (v_pinyin_short= " " or pinyin_short like concat("%",v_pinyin_short,"%")) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockCodeInfo(
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
    

    /* [获取表记录][公共_证券基础数据_证券代码信息表][{记录序号},{证券代码编号},{市场编号},{证券代码},{证券名称},{拼音简称},{证券类型},{资产类型},{票面面值},{本币币种},{交易币种},{总股本},{流通股本},{资金回转天数},{持仓回转天数},{类型单位},{申报单位},{最小单位},{最大数量},{最小数量},{区分订单方向标志},{价格上限},{价格下限},{最小价差},{公允价格},{停牌标志},{港股通标的},{时间戳}][(@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码# = " " or {证券代码} = @证券代码#) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and (@资产类型串# = "; ;" or instr(@资产类型串#, concat(";", {资产类型}, ";")) > 0) and (@停牌标志串# = "; ;" or instr(@停牌标志串#, concat(";", {停牌标志}, ";")) > 0) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,stock_code_no,exch_no,stock_code,stock_name,pinyin_short,stock_type,asset_type,par_value,crncy_type,exch_crncy_type,total_stock_issue,circl_stock_capit,capit_reback_days,posi_reback_days,type_unit,report_unit,min_unit,max_qty,min_qty,is_order_dir_flag,price_up,price_down,step_price,fair_price,stop_status,hk_stock_flag,time_stamp from db_pub.tb_basesedt_stock_code_info where (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_asset_type_str = "; ;" or instr(v_asset_type_str, concat(";", asset_type, ";")) > 0) and (v_stop_status_str = "; ;" or instr(v_stop_status_str, concat(";", stop_status, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
        select row_id,stock_code_no,exch_no,stock_code,stock_name,pinyin_short,stock_type,asset_type,par_value,crncy_type,exch_crncy_type,total_stock_issue,circl_stock_capit,capit_reback_days,posi_reback_days,type_unit,report_unit,min_unit,max_qty,min_qty,is_order_dir_flag,price_up,price_down,step_price,fair_price,stop_status,hk_stock_flag,time_stamp from db_pub.tb_basesedt_stock_code_info where (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_asset_type_str = "; ;" or instr(v_asset_type_str, concat(";", asset_type, ";")) > 0) and (v_stop_status_str = "; ;" or instr(v_stop_status_str, concat(";", stop_status, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询证券代码信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockCodeInfoJour;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockCodeInfoJour(
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
    

    /* [获取表记录][公共_证券基础数据_证券代码信息流水表][字段][{初始化日期}<=@初始化日期# and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, stock_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_basesedt_stock_code_info_jour where init_date<=v_init_date and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, stock_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_basesedt_stock_code_info_jour where init_date<=v_init_date and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询历史证券代码信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockCodeInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockCodeInfoJour_His(
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
    

    /* [获取表记录][历史_公共_证券基础数据_证券代码信息流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, stock_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_basesedt_stock_code_info_jour_his where (init_date between v_begin_date and v_end_date) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, stock_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_basesedt_stock_code_info_jour_his where (init_date between v_begin_date and v_end_date) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询证券代码列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockCodeInfoList;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockCodeInfoList(
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
    

    /* [获取表记录][公共_证券基础数据_证券代码信息表][{记录序号},{证券代码编号},{市场编号},{证券代码},{证券名称},{证券类型},{资产类型},{港股通标的}][{记录序号}>@记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id,stock_code_no,exch_no,stock_code,stock_name,stock_type,asset_type,hk_stock_flag from db_pub.tb_basesedt_stock_code_info where row_id>v_row_id;
    else
        select row_id,stock_code_no,exch_no,stock_code,stock_name,stock_type,asset_type,hk_stock_flag from db_pub.tb_basesedt_stock_code_info where row_id>v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询客户端证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryClientStockCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryClientStockCodeInfo(
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
    SET v_stock_code_load_range = p_stock_code_load_range;
    SET v_time_stamp = p_time_stamp;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* if @证券代码加载范围# = 1 then */
    if v_stock_code_load_range = 1 then

         /* if @机构编号# = 9999  then */
         if v_co_no = 9999  then

               /* [获取表记录][公共_证券基础数据_证券代码信息表][{记录序号},{证券代码编号},{市场编号},{证券代码},{证券名称},{拼音简称},{证券类型},{资产类型},{本币币种},{资金回转天数},{持仓回转天数},{最小单位},{最大数量},{最小数量},{最小价差},{停牌标志},{港股通标的},{时间戳}][{时间戳}>@时间戳# and {记录序号}>@记录序号# and {停牌标志}<>3][@指定行数#] */
               if v_row_count = -1 then
                   select row_id,stock_code_no,exch_no,stock_code,stock_name,pinyin_short,stock_type,asset_type,crncy_type,capit_reback_days,posi_reback_days,min_unit,max_qty,min_qty,step_price,stop_status,hk_stock_flag,time_stamp from db_pub.tb_basesedt_stock_code_info where time_stamp>v_time_stamp and row_id>v_row_id and stop_status<>3;
               else
                   select row_id,stock_code_no,exch_no,stock_code,stock_name,pinyin_short,stock_type,asset_type,crncy_type,capit_reback_days,posi_reback_days,min_unit,max_qty,min_qty,step_price,stop_status,hk_stock_flag,time_stamp from db_pub.tb_basesedt_stock_code_info where time_stamp>v_time_stamp and row_id>v_row_id and stop_status<>3 limit v_row_count;
               end if;

         else

               /* if @指定行数# = -1 then */
               if v_row_count = -1 then

                      /* select {记录序号},{证券代码编号},{市场编号},{证券代码},{证券名称},{拼音简称},{证券类型},{资产类型},{本币币种},{资金回转天数},{持仓回转天数},{最小单位},{最大数量},{最小数量},{最小价差},{停牌标志},{港股通标的},{时间戳} from ~公共_证券基础数据_证券代码信息表^ where {时间戳}>@时间戳# and {记录序号}>@记录序号# and {停牌标志}<>3 and {证券代码编号} not in (select {证券代码编号} from ~公共_证券基础数据_基金产品对照表^ where {机构编号}<>@机构编号#); */
                      select row_id,stock_code_no,exch_no,stock_code,stock_name,pinyin_short,stock_type,asset_type,crncy_type,capit_reback_days,posi_reback_days,min_unit,max_qty,min_qty,step_price,stop_status,hk_stock_flag,time_stamp from db_pub.tb_basesedt_stock_code_info where time_stamp>v_time_stamp and row_id>v_row_id and stop_status<>3 and stock_code_no not in (select stock_code_no from db_pub.tb_basesedt_fund_pd_comparision where co_no<>v_co_no);
               else

                      /* select {记录序号},{证券代码编号},{市场编号},{证券代码},{证券名称},{拼音简称},{证券类型},{资产类型},{本币币种},{资金回转天数},{持仓回转天数},{最小单位},{最大数量},{最小数量},{最小价差},{停牌标志},{港股通标的},{时间戳} from ~公共_证券基础数据_证券代码信息表^ where {时间戳}>@时间戳# and {记录序号}>@记录序号# and {停牌标志}<>3 and {证券代码编号} not in (select {证券代码编号} from ~公共_证券基础数据_基金产品对照表^ where {机构编号}<>@机构编号#) limit @指定行数#; */
                      select row_id,stock_code_no,exch_no,stock_code,stock_name,pinyin_short,stock_type,asset_type,crncy_type,capit_reback_days,posi_reback_days,min_unit,max_qty,min_qty,step_price,stop_status,hk_stock_flag,time_stamp from db_pub.tb_basesedt_stock_code_info where time_stamp>v_time_stamp and row_id>v_row_id and stop_status<>3 and stock_code_no not in (select stock_code_no from db_pub.tb_basesedt_fund_pd_comparision where co_no<>v_co_no) limit v_row_count;
               end if;
         end if;

    /* elseif @证券代码加载范围# = 2 then */
    elseif v_stock_code_load_range = 2 then

        /* [获取表记录][公共_证券基础数据_证券代码信息表][{记录序号},{证券代码编号},{市场编号},{证券代码},{证券名称},{拼音简称},{证券类型},{资产类型},{本币币种},{资金回转天数},{持仓回转天数},{最小单位},{最大数量},{最小数量},{最小价差},{停牌标志},{港股通标的},{时间戳}][({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》) and {时间戳}>@时间戳# and {记录序号}>@记录序号# and {停牌标志}<>3][@指定行数#] */
        if v_row_count = -1 then
            select row_id,stock_code_no,exch_no,stock_code,stock_name,pinyin_short,stock_type,asset_type,crncy_type,capit_reback_days,posi_reback_days,min_unit,max_qty,min_qty,step_price,stop_status,hk_stock_flag,time_stamp from db_pub.tb_basesedt_stock_code_info where (exch_no=3 or exch_no=4) and time_stamp>v_time_stamp and row_id>v_row_id and stop_status<>3;
        else
            select row_id,stock_code_no,exch_no,stock_code,stock_name,pinyin_short,stock_type,asset_type,crncy_type,capit_reback_days,posi_reback_days,min_unit,max_qty,min_qty,step_price,stop_status,hk_stock_flag,time_stamp from db_pub.tb_basesedt_stock_code_info where (exch_no=3 or exch_no=4) and time_stamp>v_time_stamp and row_id>v_row_id and stop_status<>3 limit v_row_count;
        end if;

    else

        /* [获取表记录][公共_证券基础数据_证券代码信息表][{记录序号},{证券代码编号},{市场编号},{证券代码},{证券名称},{拼音简称},{证券类型},{资产类型},{本币币种},{资金回转天数},{持仓回转天数},{最小单位},{最大数量},{最小数量},{最小价差},{停牌标志},{港股通标的},{时间戳}][({市场编号}=《市场编号-上海证券交易所》 or {市场编号}=《市场编号-深圳证券交易所》) and {时间戳}>@时间戳# and {记录序号}>@记录序号# and {停牌标志}<>3][@指定行数#] */
        if v_row_count = -1 then
            select row_id,stock_code_no,exch_no,stock_code,stock_name,pinyin_short,stock_type,asset_type,crncy_type,capit_reback_days,posi_reback_days,min_unit,max_qty,min_qty,step_price,stop_status,hk_stock_flag,time_stamp from db_pub.tb_basesedt_stock_code_info where (exch_no=1 or exch_no=2) and time_stamp>v_time_stamp and row_id>v_row_id and stop_status<>3;
        else
            select row_id,stock_code_no,exch_no,stock_code,stock_name,pinyin_short,stock_type,asset_type,crncy_type,capit_reback_days,posi_reback_days,min_unit,max_qty,min_qty,step_price,stop_status,hk_stock_flag,time_stamp from db_pub.tb_basesedt_stock_code_info where (exch_no=1 or exch_no=2) and time_stamp>v_time_stamp and row_id>v_row_id and stop_status<>3 limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_新增证券代码订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_AddStockCodeOrderDir;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_AddStockCodeOrderDir(
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
    declare v_time_stamp int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_time_stamp = unix_timestamp();
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "证券代码编号", "|", "市场编号", "|", "订单方向", "|", "资金冻结方式", "|", "订单数量拆分标志", "|", "最小单位", "|", "最大数量", "|", "最小数量", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_stock_code_no, "|", v_exch_no, "|", v_order_dir, "|", v_cash_frozen_type, "|", v_order_split_flag, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [插入表记录][公共_证券基础数据_证券代码订单方向表][字段][字段变量][1][@证券代码编号#, @市场编号#, @订单方向#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_stock_code_order_dir(
        create_date, create_time, update_date, 
        update_time, update_times, stock_code_no, exch_no, 
        order_dir, cash_frozen_type, order_split_flag, min_unit, 
        max_qty, min_qty, time_stamp) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_stock_code_no, v_exch_no, 
        v_order_dir, v_cash_frozen_type, v_order_split_flag, v_min_unit, 
        v_max_qty, v_min_qty, v_time_stamp);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.51.1";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_stock_code_no, "|", v_exch_no, "|", v_order_dir, "|", v_cash_frozen_type, "|", v_order_split_flag, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_证券代码订单方向流水表][字段][字段变量][5][@证券代码编号#, @市场编号#, @订单方向#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_stock_code_order_dir_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, order_dir, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_order_dir, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.51.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_修改证券代码订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_ModiStockCodeOrderDir;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_ModiStockCodeOrderDir(
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
    declare v_time_stamp int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_time_stamp = unix_timestamp();
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "证券代码编号", "|", "市场编号", "|", "订单方向", "|", "资金冻结方式", "|", "订单数量拆分标志", "|", "最小单位", "|", "最大数量", "|", "最小数量", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_stock_code_no, "|", v_exch_no, "|", v_order_dir, "|", v_cash_frozen_type, "|", v_order_split_flag, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_证券基础数据_证券代码订单方向表][{资金冻结方式}=@资金冻结方式#,{订单数量拆分标志}=@订单数量拆分标志#,{最小单位}=@最小单位#,{最大数量}=@最大数量#,{最小数量}=@最小数量#,{时间戳}=@时间戳#][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {订单方向}=@订单方向#][2][@证券代码编号#, @市场编号#, @订单方向#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_stock_code_order_dir set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cash_frozen_type=v_cash_frozen_type,order_split_flag=v_order_split_flag,min_unit=v_min_unit,max_qty=v_max_qty,min_qty=v_min_qty,time_stamp=v_time_stamp where stock_code_no=v_stock_code_no and exch_no=v_exch_no and order_dir=v_order_dir;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.52.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_证券代码订单方向表][{记录序号}][@记录序号#][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {订单方向}=@订单方向#][4][@证券代码编号#, @市场编号#, @订单方向#] */
    select row_id into v_row_id from db_pub.tb_basesedt_stock_code_order_dir where stock_code_no=v_stock_code_no and exch_no=v_exch_no and order_dir=v_order_dir limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.52.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_stock_code_no, "|", v_exch_no, "|", v_order_dir, "|", v_cash_frozen_type, "|", v_order_split_flag, "|", v_min_unit, "|", v_max_qty, "|", v_min_qty, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_证券代码订单方向流水表][字段][字段变量][5][@证券代码编号#, @市场编号#, @订单方向#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_stock_code_order_dir_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, order_dir, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_order_dir, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.52.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_删除证券代码订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_DeleteStockCodeOrderDir;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_DeleteStockCodeOrderDir(
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
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_order_dir = p_order_dir;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @流水变动字段# = " "; */
    set v_jour_occur_field = " ";

    /* set @流水变动信息# = " " ; */
    set v_jour_occur_info = " " ;

    /* [获取表记录变量][公共_证券基础数据_证券代码订单方向表][{记录序号}][@记录序号#][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {订单方向}=@订单方向#][4][@证券代码编号#, @市场编号#, @订单方向#] */
    select row_id into v_row_id from db_pub.tb_basesedt_stock_code_order_dir where stock_code_no=v_stock_code_no and exch_no=v_exch_no and order_dir=v_order_dir limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_证券代码订单方向表][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {订单方向}=@订单方向#][3][@证券代码编号#, @市场编号#, @订单方向#] */
    delete from db_pub.tb_basesedt_stock_code_order_dir 
        where stock_code_no=v_stock_code_no and exch_no=v_exch_no and order_dir=v_order_dir;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.53.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# =" " ; */
    set v_jour_after_occur_info =" " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_证券代码订单方向流水表][字段][字段变量][5][@证券代码编号#, @市场编号#, @订单方向#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_stock_code_order_dir_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, order_dir, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_order_dir, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.53.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 订单方向=", v_order_dir),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询证券代码订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockCodeOrderDir;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockCodeOrderDir(
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
    

    /* [获取表记录][公共_证券基础数据_证券代码订单方向表][字段][(@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@订单方向串# = "; ;" or instr(@订单方向串#, concat(";", {订单方向}, ";")) > 0) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, stock_code_no, 
        exch_no, order_dir, cash_frozen_type, order_split_flag, 
        min_unit, max_qty, min_qty, time_stamp from db_pub.tb_basesedt_stock_code_order_dir where (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_order_dir_str = "; ;" or instr(v_order_dir_str, concat(";", order_dir, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, stock_code_no, 
        exch_no, order_dir, cash_frozen_type, order_split_flag, 
        min_unit, max_qty, min_qty, time_stamp from db_pub.tb_basesedt_stock_code_order_dir where (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_order_dir_str = "; ;" or instr(v_order_dir_str, concat(";", order_dir, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询证券代码订单方向流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockCodeOrderDirJour;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockCodeOrderDirJour(
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
    

    /* [获取表记录][公共_证券基础数据_证券代码订单方向流水表][字段][{初始化日期}<=@初始化日期# and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@订单方向串# = "; ;" or instr(@订单方向串#, concat(";", {订单方向}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, order_dir, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_basesedt_stock_code_order_dir_jour where init_date<=v_init_date and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_order_dir_str = "; ;" or instr(v_order_dir_str, concat(";", order_dir, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, order_dir, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_basesedt_stock_code_order_dir_jour where init_date<=v_init_date and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_order_dir_str = "; ;" or instr(v_order_dir_str, concat(";", order_dir, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询历史证券代码订单方向流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockCodeOrderDirJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockCodeOrderDirJour_His(
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
    

    /* [获取表记录][历史_公共_证券基础数据_证券代码订单方向流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@订单方向串# = "; ;" or instr(@订单方向串#, concat(";", {订单方向}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, order_dir, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_basesedt_stock_code_order_dir_jour_his where (init_date between v_begin_date and v_end_date) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_order_dir_str = "; ;" or instr(v_order_dir_str, concat(";", order_dir, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, order_dir, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_basesedt_stock_code_order_dir_jour_his where (init_date between v_begin_date and v_end_date) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_order_dir_str = "; ;" or instr(v_order_dir_str, concat(";", order_dir, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_新增证券代码映射
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_AddStockCodeMap;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_AddStockCodeMap(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
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
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_time_stamp int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_trade_code = p_trade_code;
    SET v_target_code = p_target_code;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [插入表记录][公共_证券基础数据_证券代码映射表][字段][字段变量][1][@证券代码编号#, @市场编号#] */
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
                
        SET v_error_code = "pubA.1.61.1";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_证券代码映射流水表][字段][字段变量][5][@证券代码编号#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_code_map_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, trade_code, target_code, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_trade_code, v_target_code, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.61.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_修改证券代码映射
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_ModiStockCodeMap;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_ModiStockCodeMap(
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
    declare v_time_stamp int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_trade_code = p_trade_code;
    SET v_target_code = p_target_code;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [更新表记录][公共_证券基础数据_证券代码映射表][{交易代码}=@交易代码#,{标的代码}=@标的代码#,{时间戳}=@时间戳#][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号#][2][@证券代码编号#, @市场编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_code_map set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, trade_code=v_trade_code,target_code=v_target_code,time_stamp=v_time_stamp where stock_code_no=v_stock_code_no and exch_no=v_exch_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.62.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_证券代码映射表][{记录序号}][@记录序号#][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号#][4][@证券代码编号#, @市场编号#] */
    select row_id into v_row_id from db_pub.tb_basesedt_code_map where stock_code_no=v_stock_code_no and exch_no=v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.62.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_证券代码映射流水表][字段][字段变量][5][@证券代码编号#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_code_map_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, trade_code, target_code, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_trade_code, v_target_code, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.62.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_删除证券代码映射
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_DeleteStockCodeMap;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_DeleteStockCodeMap(
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
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_code = " ";
    SET v_target_code = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_证券代码映射表][{交易代码},{标的代码}][@交易代码#,@标的代码#][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号#][4][@证券代码编号#, @市场编号#] */
    select trade_code,target_code into v_trade_code,v_target_code from db_pub.tb_basesedt_code_map where stock_code_no=v_stock_code_no and exch_no=v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.63.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_证券代码映射表][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号#][3][@证券代码编号#, @市场编号#] */
    delete from db_pub.tb_basesedt_code_map 
        where stock_code_no=v_stock_code_no and exch_no=v_exch_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.63.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_证券代码映射流水表][字段][字段变量][5][@证券代码编号#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_code_map_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, trade_code, target_code, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_trade_code, v_target_code, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.63.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询证券代码映射
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockCodeMap;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockCodeMap(
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
    declare v_row_count int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][公共_证券基础数据_证券代码映射表][字段][(@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, stock_code_no, 
        stock_code, exch_no, trade_code, target_code, 
        time_stamp from db_pub.tb_basesedt_code_map where (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, stock_code_no, 
        stock_code, exch_no, trade_code, target_code, 
        time_stamp from db_pub.tb_basesedt_code_map where (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询证券代码映射流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockCodeMapJour;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockCodeMapJour(
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
    

    /* [获取表记录][公共_证券基础数据_证券代码映射流水表][字段][{初始化日期}<=@初始化日期# and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, trade_code, target_code, 
        oper_remark_info from db_pub.tb_basesedt_code_map_jour where init_date<=v_init_date and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, trade_code, target_code, 
        oper_remark_info from db_pub.tb_basesedt_code_map_jour where init_date<=v_init_date and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询历史证券代码映射流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockCodeMapJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockCodeMapJour_His(
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
    

    /* [获取表记录][历史_公共_证券基础数据_证券代码映射流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, trade_code, target_code, 
        oper_remark_info from db_pub_his.tb_basesedt_code_map_jour_his where (init_date between v_begin_date and v_end_date) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, trade_code, target_code, 
        oper_remark_info from db_pub_his.tb_basesedt_code_map_jour_his where (init_date between v_begin_date and v_end_date) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询新股信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryNewStockCode;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryNewStockCode(
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][{初始化日期}][@初始化日期#][1=1][4][" "] */
    select init_date into v_init_date from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.34.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [获取表记录][公共_证券基础数据_证券新股代码信息表][字段][(@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码#=" " or {证券代码}=@证券代码#)  and {申购日期}>= @初始化日期# and {记录序号}>@记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, stock_name, trade_code, target_code, 
        stock_code_no, trade_code_no, target_code_no, apply_date, 
        apply_limit, begin_trade_date, issue_price from db_pub.tb_basesedt_new_stock_code_info where (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=" " or stock_code=v_stock_code)  and apply_date>= v_init_date and row_id>v_row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, stock_name, trade_code, target_code, 
        stock_code_no, trade_code_no, target_code_no, apply_date, 
        apply_limit, begin_trade_date, issue_price from db_pub.tb_basesedt_new_stock_code_info where (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=" " or stock_code=v_stock_code)  and apply_date>= v_init_date and row_id>v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询当日新股信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryTodayNewStockCode;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryTodayNewStockCode(
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
    

    /* [获取表全记录][公共_证券基础数据_证券新股代码信息表][字段][{申购日期}=@初始化日期#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, stock_name, trade_code, target_code, 
        stock_code_no, trade_code_no, target_code_no, apply_date, 
        apply_limit, begin_trade_date, issue_price from db_pub.tb_basesedt_new_stock_code_info where apply_date=v_init_date;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询可转债信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryConvertibleBondInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryConvertibleBondInfo(
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][{初始化日期}][@初始化日期#][1=1][4][" "] */
    select init_date into v_init_date from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.36.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [获取表记录][公共_证券基础数据_可转债代码信息表][字段][(@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码#=" " or {证券代码}=@证券代码#) and {申购日期}>= @初始化日期# and {记录序号}>@记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, stock_name, trade_code, target_code, 
        stock_code_no, trade_code_no, target_code_no, apply_date, 
        apply_limit, begin_trade_date, issue_price from db_pub.tb_basesedt_convertible_bond_info where (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=" " or stock_code=v_stock_code) and apply_date>= v_init_date and row_id>v_row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, stock_name, trade_code, target_code, 
        stock_code_no, trade_code_no, target_code_no, apply_date, 
        apply_limit, begin_trade_date, issue_price from db_pub.tb_basesedt_convertible_bond_info where (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=" " or stock_code=v_stock_code) and apply_date>= v_init_date and row_id>v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询当日可转债信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryTodayConvertibleBondInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryTodayConvertibleBondInfo(
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
    

    /* [获取表全记录][公共_证券基础数据_可转债代码信息表][字段][{申购日期}=@初始化日期#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, stock_name, trade_code, target_code, 
        stock_code_no, trade_code_no, target_code_no, apply_date, 
        apply_limit, begin_trade_date, issue_price from db_pub.tb_basesedt_convertible_bond_info where apply_date=v_init_date;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_新增证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_AddStockQuot;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_AddStockQuot(
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
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_last_price decimal(16,9),
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
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_time_stamp int;
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
    declare v_stop_status varchar(2);
    declare v_hk_stock_flag int;
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
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_last_price = p_last_price;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_stock_name = " ";
    SET v_pinyin_short = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;
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
    SET v_stop_status = "0";
    SET v_hk_stock_flag = 0;
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
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* 调用【原子_公共_证券基础数据_获取证券代码信息】*/
    call db_pub.pra_basesedt_GetStockCodeInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_exch_no,
        v_error_code,
        v_error_info,
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
        v_stop_status,
        v_hk_stock_flag);
    if v_error_code = "1" then
        SET v_error_code = "pubA.1.71.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


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

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "证券代码编号", "|", "市场编号", "|", "证券代码", "|", "涨停价", "|", "跌停价", "|", "最新价", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_stock_code_no, "|", v_exch_no, "|", v_stock_code, "|", v_up_limit_price, "|", v_down_limit_price, "|", v_last_price, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [插入表记录][公共_证券基础数据_证券行情表][字段][字段变量][1][@证券代码编号#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_stock_quot(
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
    value( 
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
        v_pe_ratio, v_time_stamp);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.71.1";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_stock_code_no, "|", v_exch_no, "|", v_stock_code, "|", v_up_limit_price, "|", v_down_limit_price, "|", v_last_price, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_证券行情流水表][字段][字段变量][5][@证券代码编号#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_stock_quot_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, stock_code, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_stock_code, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.71.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_修改证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_ModiStockQuot;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_ModiStockQuot(
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
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_last_price decimal(16,9),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_init_date int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_times int;
    declare v_time_stamp int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_last_price = p_last_price;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_times = 1;
    SET v_time_stamp = unix_timestamp();
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "证券代码编号", "|", "市场编号", "|", "证券代码", "|", "涨停价", "|", "跌停价", "|", "最新价", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_stock_code_no, "|", v_exch_no, "|", v_stock_code, "|", v_up_limit_price, "|", v_down_limit_price, "|", v_last_price, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_证券基础数据_证券行情表][{涨停价}=@涨停价#,{跌停价}=@跌停价#,{最新价}=@最新价#,{时间戳}=@时间戳#][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号#][2][@证券代码编号#, @市场编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_stock_quot set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, up_limit_price=v_up_limit_price,down_limit_price=v_down_limit_price,last_price=v_last_price,time_stamp=v_time_stamp where stock_code_no=v_stock_code_no and exch_no=v_exch_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.72.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_证券行情表][{记录序号}][@记录序号#][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号#][4][@证券代码编号#, @市场编号#] */
    select row_id into v_row_id from db_pub.tb_basesedt_stock_quot where stock_code_no=v_stock_code_no and exch_no=v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.72.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_stock_code_no, "|", v_exch_no, "|", v_stock_code, "|", v_up_limit_price, "|", v_down_limit_price, "|", v_last_price, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_证券行情流水表][字段][字段变量][5][@证券代码编号#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_stock_quot_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, stock_code, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_stock_code, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.72.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #供场外基金行情主推用。

    /* [获取表记录变量][公共_证券基础数据_证券行情表][{更新次数}][@更新次数#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#, @市场编号#] */
    select update_times into v_update_times from db_pub.tb_basesedt_stock_quot where stock_code_no=v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.72.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_删除证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_DeleteStockQuot;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_DeleteStockQuot(
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
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_init_date int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @流水变动字段# = " "; */
    set v_jour_occur_field = " ";

    /* set @流水变动信息# = " " ; */
    set v_jour_occur_info = " " ;

    /* [获取表记录变量][公共_证券基础数据_证券行情表][{记录序号},{更新次数}][@记录序号#,@更新次数#][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号#][4][@证券代码编号#, @市场编号#] */
    select row_id,update_times into v_row_id,v_update_times from db_pub.tb_basesedt_stock_quot where stock_code_no=v_stock_code_no and exch_no=v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.73.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_证券行情表][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号#][3][@证券代码编号#, @市场编号#] */
    delete from db_pub.tb_basesedt_stock_quot 
        where stock_code_no=v_stock_code_no and exch_no=v_exch_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.73.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# =" " ; */
    set v_jour_after_occur_info =" " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_证券行情流水表][字段][字段变量][5][@证券代码编号#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_stock_quot_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, stock_code, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_stock_code, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.73.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #供场外基金行情主推用。

    /* set @更新次数# = @更新次数#+1; */
    set v_update_times = v_update_times+1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockQuot;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockQuot(
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
    

    /* [获取表记录][公共_证券基础数据_证券行情表][字段][(@证券代码#=" " or {证券代码} = @证券代码#) and (@市场编号#=0 or {市场编号} = @市场编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, stock_code_no, 
        exch_no, stock_code, stock_name, up_limit_price, 
        down_limit_price, last_price, pre_close_price, today_open_price, 
        today_close_price, today_max_price, today_min_price, buy_price_1, 
        buy_qty_1, buy_price_2, buy_qty_2, buy_price_3, 
        buy_qty_3, buy_price_4, buy_qty_4, buy_price_5, 
        buy_qty_5, sell_price_1, sell_qty_1, sell_price_2, 
        sell_qty_2, sell_price_3, sell_qty_3, sell_price_4, 
        sell_qty_4, sell_price_5, sell_qty_5, strike_qty, 
        strike_amt, pe_ratio, time_stamp from db_pub.tb_basesedt_stock_quot where (v_stock_code=" " or stock_code = v_stock_code) and (v_exch_no=0 or exch_no = v_exch_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, stock_code_no, 
        exch_no, stock_code, stock_name, up_limit_price, 
        down_limit_price, last_price, pre_close_price, today_open_price, 
        today_close_price, today_max_price, today_min_price, buy_price_1, 
        buy_qty_1, buy_price_2, buy_qty_2, buy_price_3, 
        buy_qty_3, buy_price_4, buy_qty_4, buy_price_5, 
        buy_qty_5, sell_price_1, sell_qty_1, sell_price_2, 
        sell_qty_2, sell_price_3, sell_qty_3, sell_price_4, 
        sell_qty_4, sell_price_5, sell_qty_5, strike_qty, 
        strike_amt, pe_ratio, time_stamp from db_pub.tb_basesedt_stock_quot where (v_stock_code=" " or stock_code = v_stock_code) and (v_exch_no=0 or exch_no = v_exch_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_批量获取证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetBatchStockQuot;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetBatchStockQuot(
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
    

    /* [获取表全记录][公共_证券基础数据_证券行情表][字段][instr(@证券代码编号串#,concat(";",{证券代码编号},";"))>0] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, stock_code_no, 
        exch_no, stock_code, stock_name, up_limit_price, 
        down_limit_price, last_price, pre_close_price, today_open_price, 
        today_close_price, today_max_price, today_min_price, buy_price_1, 
        buy_qty_1, buy_price_2, buy_qty_2, buy_price_3, 
        buy_qty_3, buy_price_4, buy_qty_4, buy_price_5, 
        buy_qty_5, sell_price_1, sell_qty_1, sell_price_2, 
        sell_qty_2, sell_price_3, sell_qty_3, sell_price_4, 
        sell_qty_4, sell_price_5, sell_qty_5, strike_qty, 
        strike_amt, pe_ratio, time_stamp from db_pub.tb_basesedt_stock_quot where instr(v_stock_code_no_str,concat(";",stock_code_no,";"))>0;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetStockQuot;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetStockQuot(
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
    

    /* [获取表记录变量语句][公共_证券基础数据_证券行情表][{证券名称},{涨停价},{跌停价},{最新价},{昨收盘价}][@证券名称#,@涨停价#,@跌停价#,@最新价#,@昨收盘价#][{证券代码编号} = @证券代码编号#] */
    select stock_name,up_limit_price,down_limit_price,last_price,pre_close_price into v_stock_name,v_up_limit_price,v_down_limit_price,v_last_price,v_pre_close_price from db_pub.tb_basesedt_stock_quot where stock_code_no = v_stock_code_no limit 1;

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

# 原子_公共_证券基础数据_查询证券行情流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockQuotJour;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockQuotJour(
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
    

    /* [获取表记录][公共_证券基础数据_证券行情流水表][字段][{初始化日期}<=@初始化日期# and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码# = " " or {证券代码} = @证券代码#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, stock_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_basesedt_stock_quot_jour where init_date<=v_init_date and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, stock_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_basesedt_stock_quot_jour where init_date<=v_init_date and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询历史证券行情流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockQuotJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockQuotJour_His(
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
    

    /* [获取表记录][历史_公共_证券基础数据_证券行情流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码# = " " or {证券代码} = @证券代码#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, stock_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_basesedt_stock_quot_jour_his where (init_date between v_begin_date and v_end_date) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, stock_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_basesedt_stock_quot_jour_his where (init_date between v_begin_date and v_end_date) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_证券行情归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_StockQuotBackup;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_StockQuotBackup(
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
    

    /* [删除表记录][公共_证券基础数据_历史证券行情表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pub_his.tb_basesedt_stock_quot_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.79.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][公共_证券基础数据_证券行情表][字段][302][@初始化日期#] */
    insert into db_pub_his.tb_basesedt_stock_quot_his (init_date,
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
        select v_init_date,
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
        pe_ratio, time_stamp 
        from db_pub.tb_basesedt_stock_quot;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.79.302";
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

# 原子_公共_证券基础数据_新增债券属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_AddBondInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_AddBondInfo(
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
    declare v_time_stamp int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_pay_intrst_flag int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_time_stamp = unix_timestamp();
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_pay_intrst_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();

    #获取代码对应的编号

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型}][@证券代码编号#,@证券类型#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#, @证券代码#] */
    select stock_code_no,stock_type into v_stock_code_no,v_stock_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.81.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@证券类型#<21 or @证券类型#>50][257][@市场编号#,@证券代码#] */
    if v_stock_type<21 or v_stock_type>50 then
        
        SET v_error_code = "pubA.1.81.257";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* set @交易代码# = " "; */
    set v_trade_code = " ";

    /* set @标的代码# = " "; */
    set v_target_code = " ";

    /* set @交易代码编号# = 0; */
    set v_trade_code_no = 0;

    /* set @标的代码编号# = 0; */
    set v_target_code_no = 0;
    #if @交易代码# <> @证券代码# then
    #    [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@交易代码编号#][{市场编号}=@市场编号# and {证券代码}=@交易代码#][4][@市场编号#, @交易代码#]
    #else
    #    set @交易代码编号# = @证券代码编号#;
    #end if;
    #if @标的代码# <> @证券代码# then
    #    [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@标的代码编号#][{市场编号}=@市场编号# and {证券代码}=@标的代码#][4][@市场编号#, @标的代码#]
    #else
    #    set @标的代码编号# = @证券代码编号#;
    #end if;

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "市场编号", "|", "证券代码", "|", "证券名称", "|", "发行日期", "|", "结束日期", "|", "起息日期", "|", "下一起息日期", "|", "上市日期", "|", "债券期限", "|", "发行价", "|", "票面面值", "|", "年利率", "|", "计息天数", "|", "付息间隔", "|", "债券计提利息", "|", "债券利率类型", "|", "间隔天数", "|", "净价标志", "|", "最后交易日", "|", "权益类型", "|", "转股开始日期", "|", "转股结束日期", "|", "行权开始日期", "|", "行权结束日期", "|", "质押比例", "|", "交易代码", "|", "标的代码", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_code, "|", v_stock_name, "|", v_issue_date, "|", v_end_date, "|", v_value_date, "|", v_next_value_date, "|", v_begin_trade_date, "|", v_bond_limit, "|", v_issue_price, "|", v_par_value, "|", v_intrst_ratio, "|", v_intrst_days, "|", v_pay_inteval, "|", v_bond_accr_intrst, "|", v_bond_rate_type, "|", v_inteval_days, "|", v_net_price_flag, "|", v_last_trade_date, "|", v_rights_type, "|", v_trans_begin_date, "|", v_trans_end_date, "|", v_exec_begin_date, "|", v_exec_end_date, "|", v_impawn_ratio, "|", v_trade_code, "|", v_target_code, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @付息标志# = 0; */
    set v_pay_intrst_flag = 0;

    /* [插入表记录][公共_证券基础数据_债券属性信息表][字段][字段变量][1][@市场编号#,@证券代码#] */
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
                
        SET v_error_code = "pubA.1.81.1";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_code, "|", v_stock_name, "|", v_issue_date, "|", v_end_date, "|", v_value_date, "|", v_next_value_date, "|", v_begin_trade_date, "|", v_bond_limit, "|", v_issue_price, "|", v_par_value, "|", v_intrst_ratio, "|", v_intrst_days, "|", v_pay_inteval, "|", v_bond_accr_intrst, "|", v_bond_rate_type, "|", v_inteval_days, "|", v_net_price_flag, "|", v_last_trade_date, "|", v_rights_type, "|", v_trans_begin_date, "|", v_trans_end_date, "|", v_exec_begin_date, "|", v_exec_end_date, "|", v_impawn_ratio, "|", v_trade_code, "|", v_target_code, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_债券属性信息流水表][字段][字段变量][5][@市场编号#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_bond_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, exch_no, 
        stock_code, stock_code_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_exch_no, 
        v_stock_code, v_stock_code_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.81.5";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_修改债券属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_ModiBondInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_ModiBondInfo(
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
    declare v_time_stamp int;
    declare v_stock_code_no int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_time_stamp = unix_timestamp();
    SET v_stock_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();

    #获取代码对应的编号

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#, @证券代码#] */
    select stock_code_no into v_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.82.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* set @交易代码# = " "; */
    set v_trade_code = " ";

    /* set @标的代码# = " "; */
    set v_target_code = " ";

    /* set @交易代码编号# = 0; */
    set v_trade_code_no = 0;

    /* set @标的代码编号# = 0; */
    set v_target_code_no = 0;
    #if @交易代码# <> @证券代码# then
    #    [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@交易代码编号#][{市场编号}=@市场编号# and {证券代码}=@交易代码#][4][@市场编号#, @交易代码#]
    #else
    #    set @交易代码编号# = @证券代码编号#;
    #end if;
    #if @标的代码# <> @证券代码# then
    #    [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@标的代码编号#][{市场编号}=@市场编号# and {证券代码}=@标的代码#][4][@市场编号#, @标的代码#]
    #else
    #    set @标的代码编号# = @证券代码编号#;
    #end if;

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "市场编号", "|", "证券代码", "|", "证券名称", "|", "发行日期", "|", "结束日期", "|", "起息日期", "|", "下一起息日期", "|", "上市日期", "|", "债券期限", "|", "发行价", "|", "票面面值", "|", "年利率", "|", "计息天数", "|", "付息间隔", "|", "债券计提利息", "|", "债券利率类型", "|", "间隔天数", "|", "净价标志", "|", "最后交易日", "|", "权益类型", "|", "转股开始日期", "|", "转股结束日期", "|", "行权开始日期", "|", "行权结束日期", "|", "质押比例", "|", "交易代码", "|", "标的代码", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_code, "|", v_stock_name, "|", v_issue_date, "|", v_end_date, "|", v_value_date, "|", v_next_value_date, "|", v_begin_trade_date, "|", v_bond_limit, "|", v_issue_price, "|", v_par_value, "|", v_intrst_ratio, "|", v_intrst_days, "|", v_pay_inteval, "|", v_bond_accr_intrst, "|", v_bond_rate_type, "|", v_inteval_days, "|", v_net_price_flag, "|", v_last_trade_date, "|", v_rights_type, "|", v_trans_begin_date, "|", v_trans_end_date, "|", v_exec_begin_date, "|", v_exec_end_date, "|", v_impawn_ratio, "|", v_trade_code, "|", v_target_code, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_证券基础数据_债券属性信息表][{证券名称} = @证券名称#,{发行日期} = @发行日期#,{结束日期} = @结束日期#,{起息日期} = @起息日期#,{下一起息日期} = @下一起息日期#,{上市日期} = @上市日期#,{债券期限} = @债券期限#,{发行价} = @发行价#,{票面面值} = @票面面值#,{年利率} = @年利率#,{计息天数} = @计息天数#,{付息间隔} = @付息间隔#,{债券计提利息} = @债券计提利息#,{债券利率类型} = @债券利率类型#,{间隔天数} = @间隔天数#,{净价标志} = @净价标志#,{最后交易日} = @最后交易日#,{权益类型} = @权益类型#,{转股开始日期} = @转股开始日期#,{转股结束日期} = @转股结束日期#,{行权开始日期} = @行权开始日期#,{行权结束日期} = @行权结束日期#,{质押比例} = @质押比例#,{交易代码}=@交易代码#,{标的代码}=@标的代码#,{交易代码编号}=@交易代码编号#,{标的代码编号}=@标的代码编号#,{时间戳} = @时间戳#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][2][@市场编号#,@证券代码#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_bond_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_name = v_stock_name,issue_date = v_issue_date,end_date = v_end_date,value_date = v_value_date,next_value_date = v_next_value_date,begin_trade_date = v_begin_trade_date,bond_limit = v_bond_limit,issue_price = v_issue_price,par_value = v_par_value,intrst_ratio = v_intrst_ratio,intrst_days = v_intrst_days,pay_inteval = v_pay_inteval,bond_accr_intrst = v_bond_accr_intrst,bond_rate_type = v_bond_rate_type,inteval_days = v_inteval_days,net_price_flag = v_net_price_flag,last_trade_date = v_last_trade_date,rights_type = v_rights_type,trans_begin_date = v_trans_begin_date,trans_end_date = v_trans_end_date,exec_begin_date = v_exec_begin_date,exec_end_date = v_exec_end_date,impawn_ratio = v_impawn_ratio,trade_code=v_trade_code,target_code=v_target_code,trade_code_no=v_trade_code_no,target_code_no=v_target_code_no,time_stamp = v_time_stamp where exch_no=v_exch_no and stock_code=v_stock_code;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.82.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{记录序号}][@记录序号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select row_id into v_row_id from db_pub.tb_basesedt_bond_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.82.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_code, "|", v_stock_name, "|", v_issue_date, "|", v_end_date, "|", v_value_date, "|", v_next_value_date, "|", v_begin_trade_date, "|", v_bond_limit, "|", v_issue_price, "|", v_par_value, "|", v_intrst_ratio, "|", v_intrst_days, "|", v_pay_inteval, "|", v_bond_accr_intrst, "|", v_bond_rate_type, "|", v_inteval_days, "|", v_net_price_flag, "|", v_last_trade_date, "|", v_rights_type, "|", v_trans_begin_date, "|", v_trans_end_date, "|", v_exec_begin_date, "|", v_exec_end_date, "|", v_impawn_ratio, "|", v_trade_code, "|", v_target_code, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_债券属性信息流水表][字段][字段变量][5][@市场编号#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_bond_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, exch_no, 
        stock_code, stock_code_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_exch_no, 
        v_stock_code, v_stock_code_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.82.5";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_删除债券属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_DeleteBondInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_DeleteBondInfo(
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
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_stock_code_no int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_stock_code = p_stock_code;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_stock_code_no = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @流水变动字段# = " "; */
    set v_jour_occur_field = " ";

    /* set @流水变动信息# = " " ; */
    set v_jour_occur_info = " " ;

    /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select stock_code_no into v_stock_code_no from db_pub.tb_basesedt_bond_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.83.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_债券属性信息表][{市场编号}=@市场编号# and {证券代码}=@证券代码#][3][@市场编号#,@证券代码#] */
    delete from db_pub.tb_basesedt_bond_info 
        where exch_no=v_exch_no and stock_code=v_stock_code;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.83.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# =" " ; */
    set v_jour_after_occur_info =" " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_债券属性信息流水表][字段][字段变量][5][@市场编号#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_bond_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, exch_no, 
        stock_code, stock_code_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_exch_no, 
        v_stock_code, v_stock_code_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.83.5";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询债券属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryBondInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryBondInfo(
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
    

    /* [获取表记录][公共_证券基础数据_债券属性信息表][{记录序号},{市场编号},{证券代码},{证券名称},{发行日期},{结束日期},{起息日期},{下一起息日期},{上市日期},{债券期限},{发行价},{票面面值},{年利率},{计息天数},{付息间隔},{债券计提利息},{债券利率类型},{间隔天数},{净价标志},{最后交易日},{权益类型},{转股开始日期},{转股结束日期},{行权开始日期},{行权结束日期},{质押比例},{交易代码},{标的代码},{时间戳}][(@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码# = " " or {证券代码} = @证券代码#) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,exch_no,stock_code,stock_name,issue_date,end_date,value_date,next_value_date,begin_trade_date,bond_limit,issue_price,par_value,intrst_ratio,intrst_days,pay_inteval,bond_accr_intrst,bond_rate_type,inteval_days,net_price_flag,last_trade_date,rights_type,trans_begin_date,trans_end_date,exec_begin_date,exec_end_date,impawn_ratio,trade_code,target_code,time_stamp from db_pub.tb_basesedt_bond_info where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
        select row_id,exch_no,stock_code,stock_name,issue_date,end_date,value_date,next_value_date,begin_trade_date,bond_limit,issue_price,par_value,intrst_ratio,intrst_days,pay_inteval,bond_accr_intrst,bond_rate_type,inteval_days,net_price_flag,last_trade_date,rights_type,trans_begin_date,trans_end_date,exec_begin_date,exec_end_date,impawn_ratio,trade_code,target_code,time_stamp from db_pub.tb_basesedt_bond_info where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取债券属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetBondInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetBondInfo(
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_stock_code_no int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_pay_intrst_flag int;
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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_stock_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_pay_intrst_flag = 0;
    SET v_time_stamp = unix_timestamp();

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_债券属性信息表][字段][字段变量][{市场编号}=@市场编号# and {证券代码} = @证券代码#][4][@市场编号#,@证券代码#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, trade_code, target_code, stock_code_no, 
        trade_code_no, target_code_no, stock_name, issue_date, 
        end_date, value_date, next_value_date, begin_trade_date, 
        bond_limit, issue_price, par_value, intrst_ratio, 
        intrst_days, pay_inteval, bond_accr_intrst, bond_rate_type, 
        inteval_days, net_price_flag, last_trade_date, rights_type, 
        trans_begin_date, trans_end_date, exec_begin_date, exec_end_date, 
        impawn_ratio, pay_intrst_flag, time_stamp into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_exch_no, 
        v_stock_code, v_trade_code, v_target_code, v_stock_code_no, 
        v_trade_code_no, v_target_code_no, v_stock_name, v_issue_date, 
        v_end_date, v_value_date, v_next_value_date, v_begin_trade_date, 
        v_bond_limit, v_issue_price, v_par_value, v_intrst_ratio, 
        v_intrst_days, v_pay_inteval, v_bond_accr_intrst, v_bond_rate_type, 
        v_inteval_days, v_net_price_flag, v_last_trade_date, v_rights_type, 
        v_trans_begin_date, v_trans_end_date, v_exec_begin_date, v_exec_end_date, 
        v_impawn_ratio, v_pay_intrst_flag, v_time_stamp from db_pub.tb_basesedt_bond_info where exch_no=v_exch_no and stock_code = v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.88.4";
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

# 原子_公共_证券基础数据_查询债券属性流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryBondInfoJour;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryBondInfoJour(
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
    

    /* [获取表记录][公共_证券基础数据_债券属性信息流水表][字段][{初始化日期}<=@初始化日期# and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码# = " " or {证券代码} = @证券代码#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code, stock_code_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_basesedt_bond_info_jour where init_date<=v_init_date and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code, stock_code_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_basesedt_bond_info_jour where init_date<=v_init_date and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询历史债券属性流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryBondInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryBondInfoJour_His(
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
    

    /* [获取表记录][历史_公共_证券基础数据_债券属性信息流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码# = " " or {证券代码} = @证券代码#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code, stock_code_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_basesedt_bond_info_jour_his where (init_date between v_begin_date and v_end_date) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code, stock_code_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_basesedt_bond_info_jour_his where (init_date between v_begin_date and v_end_date) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询债券质押信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryBondImpawnInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryBondImpawnInfo(
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
    

    /* SELECT
 a.{证券代码编号} as {证券代码编号},
 b.{证券代码编号} as {质押代码编号},
 b.{证券代码} as {质押代码},
 a.{质押比例}
FROM
 ~公共_证券基础数据_证券代码映射表^ b,
 ~公共_证券基础数据_债券属性信息表^ a
WHERE
 b.{市场编号} = a.{市场编号}
AND b.{交易代码} = a.{证券代码}
AND a.{质押比例} <> 0 AND (@证券代码编号#=0 or a.{证券代码编号}=@证券代码编号#);

 */
    SELECT
     a.stock_code_no as stock_code_no,
     b.stock_code_no as impawn_code_no,
     b.stock_code as impawn_code,
     a.impawn_ratio
    FROM
     db_pub.tb_basesedt_code_map b,
     db_pub.tb_basesedt_bond_info a
    WHERE
     b.exch_no = a.exch_no
    AND b.trade_code = a.stock_code
    AND a.impawn_ratio <> 0 AND (v_stock_code_no=0 or a.stock_code_no=v_stock_code_no);
    
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_新增债券利率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_AddBondRate;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_AddBondRate(
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
    declare v_time_stamp int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_intrst_begin_date = p_intrst_begin_date;
    SET v_intrst_ratio = p_intrst_ratio;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [插入表记录][公共_证券基础数据_债券利率表][字段][字段变量][1][@证券代码编号#, @市场编号#, @利率开始日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_bond_rate(
        create_date, create_time, update_date, 
        update_time, update_times, stock_code_no, exch_no, 
        intrst_begin_date, intrst_ratio, time_stamp) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_stock_code_no, v_exch_no, 
        v_intrst_begin_date, v_intrst_ratio, v_time_stamp);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.91.1";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 利率开始日期=", v_intrst_begin_date),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_债券利率流水表][字段][字段变量][5][@证券代码编号#, @市场编号#, @利率开始日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_bond_rate_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, intrst_begin_date, intrst_ratio, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_intrst_begin_date, v_intrst_ratio, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.91.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 利率开始日期=", v_intrst_begin_date),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_修改债券利率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_ModiBondRate;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_ModiBondRate(
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
    declare v_time_stamp int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_intrst_begin_date = p_intrst_begin_date;
    SET v_intrst_ratio = p_intrst_ratio;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [更新表记录][公共_证券基础数据_债券利率表][{年利率}=@年利率#,{时间戳}=@时间戳#][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {利率开始日期}=@利率开始日期#][2][@证券代码编号#, @市场编号#, @利率开始日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_bond_rate set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, intrst_ratio=v_intrst_ratio,time_stamp=v_time_stamp where stock_code_no=v_stock_code_no and exch_no=v_exch_no and intrst_begin_date=v_intrst_begin_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.92.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 利率开始日期=", v_intrst_begin_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 利率开始日期=", v_intrst_begin_date);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_债券利率表][{记录序号}][@记录序号#][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {利率开始日期}=@利率开始日期#][4][@证券代码编号#, @市场编号#, @利率开始日期#] */
    select row_id into v_row_id from db_pub.tb_basesedt_bond_rate where stock_code_no=v_stock_code_no and exch_no=v_exch_no and intrst_begin_date=v_intrst_begin_date limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.92.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 利率开始日期=", v_intrst_begin_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 利率开始日期=", v_intrst_begin_date);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_债券利率流水表][字段][字段变量][5][@证券代码编号#, @市场编号#, @利率开始日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_bond_rate_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, intrst_begin_date, intrst_ratio, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_intrst_begin_date, v_intrst_ratio, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.92.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 利率开始日期=", v_intrst_begin_date),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_删除债券利率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_DeleteBondRate;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_DeleteBondRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
    IN p_intrst_begin_date int,
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
    declare v_intrst_begin_date int;
    declare v_exch_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_intrst_ratio decimal(18,12);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_intrst_begin_date = p_intrst_begin_date;
    SET v_exch_no = p_exch_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_intrst_ratio = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_债券利率表][{年利率}][@年利率#][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {利率开始日期}=@利率开始日期#][4][@证券代码编号#, @市场编号#, @利率开始日期#] */
    select intrst_ratio into v_intrst_ratio from db_pub.tb_basesedt_bond_rate where stock_code_no=v_stock_code_no and exch_no=v_exch_no and intrst_begin_date=v_intrst_begin_date limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.93.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 利率开始日期=", v_intrst_begin_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 利率开始日期=", v_intrst_begin_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_债券利率表][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {利率开始日期}=@利率开始日期#][3][@证券代码编号#, @市场编号#, @利率开始日期#] */
    delete from db_pub.tb_basesedt_bond_rate 
        where stock_code_no=v_stock_code_no and exch_no=v_exch_no and intrst_begin_date=v_intrst_begin_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.93.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 利率开始日期=", v_intrst_begin_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 利率开始日期=", v_intrst_begin_date);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_债券利率流水表][字段][字段变量][5][@证券代码编号#, @市场编号#, @利率开始日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_bond_rate_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, intrst_begin_date, intrst_ratio, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_intrst_begin_date, v_intrst_ratio, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.93.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,","," 利率开始日期=", v_intrst_begin_date),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询债券利率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryBondRate;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryBondRate(
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
    

    /* [获取表记录][公共_证券基础数据_债券利率表][字段][(@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, stock_code_no, 
        exch_no, intrst_begin_date, intrst_ratio, time_stamp from db_pub.tb_basesedt_bond_rate where (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, stock_code_no, 
        exch_no, intrst_begin_date, intrst_ratio, time_stamp from db_pub.tb_basesedt_bond_rate where (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询债券利率流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryBondRateJour;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryBondRateJour(
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
    

    /* [获取表记录][公共_证券基础数据_债券利率流水表][字段][{初始化日期}<=@初始化日期# and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, intrst_begin_date, intrst_ratio, 
        oper_remark_info from db_pub.tb_basesedt_bond_rate_jour where init_date<=v_init_date and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, intrst_begin_date, intrst_ratio, 
        oper_remark_info from db_pub.tb_basesedt_bond_rate_jour where init_date<=v_init_date and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询历史债券利率流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryBondRateJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryBondRateJour_His(
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
    

    /* [获取表记录][历史_公共_证券基础数据_债券利率流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, intrst_begin_date, intrst_ratio, 
        oper_remark_info from db_pub_his.tb_basesedt_bond_rate_jour_his where (init_date between v_begin_date and v_end_date) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, intrst_begin_date, intrst_ratio, 
        oper_remark_info from db_pub_his.tb_basesedt_bond_rate_jour_his where (init_date between v_begin_date and v_end_date) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_新增债券评级信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_AddBondRating;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_AddBondRating(
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
    declare v_time_stamp int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_rating_agency = p_rating_agency;
    SET v_co_no = p_co_no;
    SET v_bond_level = p_bond_level;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [插入表记录][公共_证券基础数据_债券评级信息表][字段][字段变量][1][@证券代码编号#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_bond_rating(
        create_date, create_time, update_date, 
        update_time, update_times, stock_code_no, exch_no, 
        rating_agency, co_no, bond_level, time_stamp) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_stock_code_no, v_exch_no, 
        v_rating_agency, v_co_no, v_bond_level, v_time_stamp);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.101.1";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_债券评级信息流水表][字段][字段变量][5][@证券代码编号#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_bond_rating_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, rating_agency, co_no, bond_level, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_rating_agency, v_co_no, v_bond_level, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.101.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_修改债券评级信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_ModiBondRating;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_ModiBondRating(
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
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_rating_agency = p_rating_agency;
    SET v_co_no = p_co_no;
    SET v_bond_level = p_bond_level;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_证券基础数据_债券评级信息表][{债券等级}=@债券等级#][{评级机构}=@评级机构# and {机构编号}=@机构编号# and {证券代码编号}=@证券代码编号# and {市场编号}= @市场编号#][2][@证券代码编号#, @机构编号#,@评级机构#,@市场编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_bond_rating set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, bond_level=v_bond_level where rating_agency=v_rating_agency and co_no=v_co_no and stock_code_no=v_stock_code_no and exch_no= v_exch_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.102.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 机构编号=", v_co_no,",","评级机构=",v_rating_agency,",","市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 机构编号=", v_co_no,",","评级机构=",v_rating_agency,",","市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_债券评级信息表][{记录序号}][@记录序号#][{证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {评级机构}=@评级机构# and {机构编号}=@机构编号#][4][@证券代码编号#, @机构编号#,@评级机构#,@市场编号#] */
    select row_id into v_row_id from db_pub.tb_basesedt_bond_rating where stock_code_no=v_stock_code_no and exch_no=v_exch_no and rating_agency=v_rating_agency and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.102.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 机构编号=", v_co_no,",","评级机构=",v_rating_agency,",","市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 机构编号=", v_co_no,",","评级机构=",v_rating_agency,",","市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_债券评级信息流水表][字段][字段变量][5][@证券代码编号#, @机构编号#,@评级机构#,@市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_bond_rating_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, rating_agency, co_no, bond_level, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_rating_agency, v_co_no, v_bond_level, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.102.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 机构编号=", v_co_no,",","评级机构=",v_rating_agency,",","市场编号=",v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_删除债券评级信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_DeleteBondRating;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_DeleteBondRating(
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_exch_no int;
    declare v_bond_level int;
    declare v_time_stamp int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_rating_agency = p_rating_agency;
    SET v_co_no = p_co_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_no = 0;
    SET v_bond_level = 0;
    SET v_time_stamp = unix_timestamp();
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_债券评级信息表][字段][字段变量][{证券代码编号}=@证券代码编号# and {机构编号}=@机构编号# and {评级机构}=@评级机构#][4][@证券代码编号#, @机构编号#, @评级机构#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, stock_code_no, 
        exch_no, rating_agency, co_no, bond_level, 
        time_stamp into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_stock_code_no, 
        v_exch_no, v_rating_agency, v_co_no, v_bond_level, 
        v_time_stamp from db_pub.tb_basesedt_bond_rating where stock_code_no=v_stock_code_no and co_no=v_co_no and rating_agency=v_rating_agency limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.103.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 机构编号=", v_co_no,","," 评级机构=", v_rating_agency),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 机构编号=", v_co_no,","," 评级机构=", v_rating_agency);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_债券评级信息表][{证券代码编号}=@证券代码编号# and {机构编号}=@机构编号# and {评级机构}=@评级机构#][3][@证券代码编号#, @机构编号#, @评级机构#] */
    delete from db_pub.tb_basesedt_bond_rating 
        where stock_code_no=v_stock_code_no and co_no=v_co_no and rating_agency=v_rating_agency;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.103.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 机构编号=", v_co_no,","," 评级机构=", v_rating_agency),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 机构编号=", v_co_no,","," 评级机构=", v_rating_agency);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_债券评级信息流水表][字段][字段变量][5][@证券代码编号#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_bond_rating_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, rating_agency, co_no, bond_level, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_rating_agency, v_co_no, v_bond_level, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.103.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询债券评级信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryBondRating;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryBondRating(
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
    

    /* [获取表记录][公共_证券基础数据_债券评级信息表][字段][(@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, stock_code_no, 
        exch_no, rating_agency, co_no, bond_level, 
        time_stamp from db_pub.tb_basesedt_bond_rating where (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, stock_code_no, 
        exch_no, rating_agency, co_no, bond_level, 
        time_stamp from db_pub.tb_basesedt_bond_rating where (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询债券评级流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryBondRatingJour;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryBondRatingJour(
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
    

    /* [获取表记录][公共_证券基础数据_债券评级信息流水表][字段][{初始化日期}<=@初始化日期# and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, rating_agency, co_no, 
        bond_level, oper_remark_info from db_pub.tb_basesedt_bond_rating_jour where init_date<=v_init_date and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, rating_agency, co_no, 
        bond_level, oper_remark_info from db_pub.tb_basesedt_bond_rating_jour where init_date<=v_init_date and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询历史债券评级流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryBondRatingJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryBondRatingJour_His(
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
    

    /* [获取表记录][历史_公共_证券基础数据_债券评级信息流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, rating_agency, co_no, 
        bond_level, oper_remark_info from db_pub_his.tb_basesedt_bond_rating_jour_his where (init_date between v_begin_date and v_end_date) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, rating_agency, co_no, 
        bond_level, oper_remark_info from db_pub_his.tb_basesedt_bond_rating_jour_his where (init_date between v_begin_date and v_end_date) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询回购代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryRepoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryRepoInfo(
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
    

    /* [获取表全记录][公共_证券基础数据_回购参数表][{证券代码编号},{市场编号},{证券代码},{证券类型},{证券名称},{回购天数},{资金占款天数},0 as {最新价}][(@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码#=" " or {证券代码}=@证券代码#)] */
    select stock_code_no,exch_no,stock_code,stock_type,stock_name,repo_days,cash_capt_days,0 as last_price from db_pub.tb_basesedt_repo_param where (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=" " or stock_code=v_stock_code);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_逆回购获取代码费用信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetRepoStockFeeInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetRepoStockFeeInfo(
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
    declare v_fee_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_asset_acco_no int;
    declare v_stock_type int;
    declare v_stock_name varchar(64);
    declare v_repo_days int;
    declare v_cash_capt_days int;
    declare v_secu_code_spec_fee_tmplat_no int;
    declare v_secu_type_spec_fee_tmplat_no int;
    declare v_secu_code_fee_tmplat_no int;
    declare v_secu_type_fee_tmplat_no int;
    declare v_secu_code_out_fee_tmplat_no int;
    declare v_secu_type_out_fee_tmplat_no int;
    declare v_calc_end_flag int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_fee_no = 0;
    SET v_stock_code_no = 0;
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_asset_acco_no = 0;
    SET v_stock_type = 0;
    SET v_stock_name = " ";
    SET v_repo_days = 0;
    SET v_cash_capt_days = 0;
    SET v_secu_code_spec_fee_tmplat_no = 0;
    SET v_secu_type_spec_fee_tmplat_no = 0;
    SET v_secu_code_fee_tmplat_no = 0;
    SET v_secu_type_fee_tmplat_no = 0;
    SET v_secu_code_out_fee_tmplat_no = 0;
    SET v_secu_type_out_fee_tmplat_no = 0;
    SET v_calc_end_flag = 0;
    SET v_amt_ratio = 0;
    SET v_amt_value = 0;
    SET v_max_fee = 0;
    SET v_min_fee = 0;

    
    label_pro:BEGIN
    

    /* set @金额比例串#=""; */
    set v_amt_ratio_str="";

    /* set @金额固定额串#=""; */
    set v_amt_value_str="";

    /* set @最高费用串#=""; */
    set v_max_fee_str="";

    /* set @最低费用串#=""; */
    set v_min_fee_str="";

    /* set @票面面值#=100; */
    set v_par_value=100;

    /* set @费用编号#=70400; */
    set v_fee_no=70400;
    loop_label:loop

        /* if instr(@证券代码编号串#,";") > 0 then */
        if instr(v_stock_code_no_str,";") > 0 then

            /* set @证券代码编号#=cast(substring(@证券代码编号串#,1,LOCATE(";",@证券代码编号串#)-1) as SIGNED); */
            set v_stock_code_no=cast(substring(v_stock_code_no_str,1,LOCATE(";",v_stock_code_no_str)-1) as SIGNED);

            /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(";",@市场编号串#)-1) as SIGNED); */
            set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(";",v_exch_no_str)-1) as SIGNED);

            /* set @证券代码#=cast(substring(@证券代码串#,1,LOCATE(";",@证券代码串#)-1) as SIGNED); */
            set v_stock_code=cast(substring(v_stock_code_str,1,LOCATE(";",v_stock_code_str)-1) as SIGNED);

            /* set @资产账户编号#=cast(substring(@资产账户编号串#,1,LOCATE(";",@资产账户编号串#)-1) as SIGNED); */
            set v_asset_acco_no=cast(substring(v_asset_acco_no_str,1,LOCATE(";",v_asset_acco_no_str)-1) as SIGNED);

            /* [获取表记录变量][公共_证券基础数据_回购参数表][{证券类型},{证券名称},{回购天数},{资金占款天数}][@证券类型#,@证券名称#,@回购天数#,@资金占款天数#][{证券代码编号}=@证券代码编号# and  {市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@证券代码编号#,@市场编号#,@证券代码#] */
            select stock_type,stock_name,repo_days,cash_capt_days into v_stock_type,v_stock_name,v_repo_days,v_cash_capt_days from db_pub.tb_basesedt_repo_param where stock_code_no=v_stock_code_no and  exch_no=v_exch_no and stock_code=v_stock_code limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.1.131.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                end if;
                leave label_pro;
            end if;

            #[获取表记录变量][公共)证券基础数据_证券代码信息表][{票面面值}][@票面面值#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#]
            #先获取资产账户编号设置的费用模板，如果没有设置或者设置值为0，则取系统级

            /* [获取表记录变量语句][公共_证券费用_资产账户证券费用模板表][{证券代码特殊费用模板编号}, {证券类型特殊费用模板编号}, {证券代码费用模板编号}, {证券类型费用模板编号}, {证券代码外部费用模板编号}, {证券类型外部费用模板编号}][@证券代码特殊费用模板编号#, @证券类型特殊费用模板编号#, @证券代码费用模板编号#, @证券类型费用模板编号#, @证券代码外部费用模板编号#, @证券类型外部费用模板编号#][{资产账户编号} = @资产账户编号#] */
            select secu_code_spec_fee_tmplat_no, secu_type_spec_fee_tmplat_no, secu_code_fee_tmplat_no, secu_type_fee_tmplat_no, secu_code_out_fee_tmplat_no, secu_type_out_fee_tmplat_no into v_secu_code_spec_fee_tmplat_no, v_secu_type_spec_fee_tmplat_no, v_secu_code_fee_tmplat_no, v_secu_type_fee_tmplat_no, v_secu_code_out_fee_tmplat_no, v_secu_type_out_fee_tmplat_no from db_pub.tb_feesecu_asset_acco_fee_tmplat where asset_acco_no = v_asset_acco_no limit 1;

            if FOUND_ROWS() = 0 then

                /* set @证券代码特殊费用模板编号# = 0; */
                set v_secu_code_spec_fee_tmplat_no = 0;

                /* set @证券类型特殊费用模板编号# = 0; */
                set v_secu_type_spec_fee_tmplat_no = 0;

                /* set @证券代码费用模板编号# = 0; */
                set v_secu_code_fee_tmplat_no = 0;

                /* set @证券类型费用模板编号# = 0; */
                set v_secu_type_fee_tmplat_no = 0;

                /* set @证券代码外部费用模板编号# = 0; */
                set v_secu_code_out_fee_tmplat_no = 0;

                /* set @证券类型外部费用模板编号# = 0; */
                set v_secu_type_out_fee_tmplat_no = 0;
            end if;
            #置状态位计算结束标志

            /* set @计算结束标志# = 0; */
            set v_calc_end_flag = 0;
            #费用优先级顺序，先个性，再模板，最后系统。证券代码特殊费用模板>证券类型特殊费用模板>证券代码费用模板>证券类型费用模板>系统证券代码费用>系统证券类型费用

            /* if @证券代码特殊费用模板编号# <> 0 and @计算结束标志# = 0 then */
            if v_secu_code_spec_fee_tmplat_no <> 0 and v_calc_end_flag = 0 then

                /* [获取表记录变量语句][公共_证券费用_证券代码费用模板明细表][{金额比例},{金额固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@最高费用#,@最低费用#][{费用模板编号} = @证券代码特殊费用模板编号# and {证券代码编号} = @证券代码编号# and {费用编号} = @费用编号#] */
                select amt_ratio,amt_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_max_fee,v_min_fee from db_pub.tb_feesecu_stock_code_fee_tmplat_detail where fee_tmplat_no = v_secu_code_spec_fee_tmplat_no and stock_code_no = v_stock_code_no and fee_no = v_fee_no limit 1;

                if FOUND_ROWS() <> 0 then

                    /* set @计算结束标志# = 1; */
                    set v_calc_end_flag = 1;
                end if;
            end if;

            /* if @证券类型特殊费用模板编号# <> 0 and @计算结束标志# = 0 then */
            if v_secu_type_spec_fee_tmplat_no <> 0 and v_calc_end_flag = 0 then

                /* [获取表记录变量语句][公共_证券费用_证券类型费用模板明细表][{金额比例},{金额固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@最高费用#,@最低费用#][{费用模板编号} = @证券类型特殊费用模板编号# and {市场编号} = @市场编号# and {证券类型} = @证券类型# and {费用编号} = @费用编号#] */
                select amt_ratio,amt_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_max_fee,v_min_fee from db_pub.tb_feesecu_stock_type_fee_tmplat_detail where fee_tmplat_no = v_secu_type_spec_fee_tmplat_no and exch_no = v_exch_no and stock_type = v_stock_type and fee_no = v_fee_no limit 1;

                if FOUND_ROWS() <> 0 then

                    /* set @计算结束标志# = 1; */
                    set v_calc_end_flag = 1;
                end if;
            end if;

            /* if @证券代码费用模板编号# <> 0 and @计算结束标志# = 0 then */
            if v_secu_code_fee_tmplat_no <> 0 and v_calc_end_flag = 0 then

                /* [获取表记录变量语句][公共_证券费用_证券代码费用模板明细表][{金额比例},{金额固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@最高费用#,@最低费用#][{费用模板编号} = @证券代码费用模板编号# and {证券代码编号} = @证券代码编号# and {费用编号} = @费用编号#] */
                select amt_ratio,amt_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_max_fee,v_min_fee from db_pub.tb_feesecu_stock_code_fee_tmplat_detail where fee_tmplat_no = v_secu_code_fee_tmplat_no and stock_code_no = v_stock_code_no and fee_no = v_fee_no limit 1;

                if FOUND_ROWS() <> 0 then

                    /* set @计算结束标志# = 1; */
                    set v_calc_end_flag = 1;
                end if;
            end if;

            /* if @证券类型费用模板编号# <> 0 and @计算结束标志# = 0 then */
            if v_secu_type_fee_tmplat_no <> 0 and v_calc_end_flag = 0 then

                /* [获取表记录变量语句][公共_证券费用_证券类型费用模板明细表][{金额比例},{金额固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@最高费用#,@最低费用#][{费用模板编号} = @证券类型费用模板编号# and {市场编号} = @市场编号# and {证券类型} = @证券类型# and {费用编号} = @费用编号#] */
                select amt_ratio,amt_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_max_fee,v_min_fee from db_pub.tb_feesecu_stock_type_fee_tmplat_detail where fee_tmplat_no = v_secu_type_fee_tmplat_no and exch_no = v_exch_no and stock_type = v_stock_type and fee_no = v_fee_no limit 1;

                if FOUND_ROWS() <> 0 then

                    /* set @计算结束标志# = 1; */
                    set v_calc_end_flag = 1;
                end if;
            end if;

            /* if @计算结束标志# = 0 then */
            if v_calc_end_flag = 0 then

                /* [获取表记录变量语句][公共_证券费用_系统证券代码费用表][{金额比例},{金额固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@最高费用#,@最低费用#][{证券代码编号} = @证券代码编号# and {费用编号} = @费用编号#] */
                select amt_ratio,amt_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_max_fee,v_min_fee from db_pub.tb_feesecu_sys_stock_code_fee where stock_code_no = v_stock_code_no and fee_no = v_fee_no limit 1;

                if FOUND_ROWS() <> 0 then

                    /* set @计算结束标志# = 1; */
                    set v_calc_end_flag = 1;
                end if;
            end if;

            /* if @计算结束标志# = 0 then */
            if v_calc_end_flag = 0 then

                /* [获取表记录变量语句][公共_证券费用_系统证券类型费用表][{金额比例},{金额固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@最高费用#,@最低费用#][{市场编号} = @市场编号# and {证券类型} = @证券类型# and {费用编号} = @费用编号#] */
                select amt_ratio,amt_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_max_fee,v_min_fee from db_pub.tb_feesecu_sys_stock_type_fee where exch_no = v_exch_no and stock_type = v_stock_type and fee_no = v_fee_no limit 1;

                if FOUND_ROWS() <> 0 then

                    /* set @计算结束标志# = 1; */
                    set v_calc_end_flag = 1;
                end if;
            end if;

            /* set @金额比例串# = concat(@金额比例串#,@金额比例#,";"); */
            set v_amt_ratio_str = concat(v_amt_ratio_str,v_amt_ratio,";");

            /* set @金额固定额串# = concat(@金额固定额串#,@金额固定额#,";"); */
            set v_amt_value_str = concat(v_amt_value_str,v_amt_value,";");

            /* set @最高费用串# = concat(@最高费用串#,@最高费用#,";"); */
            set v_max_fee_str = concat(v_max_fee_str,v_max_fee,";");

            /* set @最低费用串# = concat(@最低费用串#,@最低费用#,";"); */
            set v_min_fee_str = concat(v_min_fee_str,v_min_fee,";");

            /* set @证券代码编号串#=substring(@证券代码编号串#,LOCATE(";",@证券代码编号串#)+1); */
            set v_stock_code_no_str=substring(v_stock_code_no_str,LOCATE(";",v_stock_code_no_str)+1);

            /* set @市场编号串#=substring(@市场编号串#,LOCATE(";",@市场编号串#)+1); */
            set v_exch_no_str=substring(v_exch_no_str,LOCATE(";",v_exch_no_str)+1);

            /* set @证券代码串#=substring(@证券代码串#,LOCATE(";",@证券代码串#)+1); */
            set v_stock_code_str=substring(v_stock_code_str,LOCATE(";",v_stock_code_str)+1);

            /* set @资产账户编号串#=substring(@资产账户编号串#,LOCATE(";",@资产账户编号串#)+1); */
            set v_asset_acco_no_str=substring(v_asset_acco_no_str,LOCATE(";",v_asset_acco_no_str)+1);
        else
            leave loop_label;
        end if;
    end loop;
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

# 原子_公共_证券基础数据_查询港股价位
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryHKStepPrice;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryHKStepPrice(
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
    

    /* [获取表全记录][公共_证券基础数据_港股价位表][字段][1=1] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, begin_price, 
        end_price, step_price from db_pub.tb_basesedt_hk_step_price where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_更新回购资金占款天数
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_UpdateRepoCashCaptDays;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_UpdateRepoCashCaptDays(
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
    declare v_exch_no int;
    declare v_exch_init_date int;
    declare v_tmp_exch_init_date int;
    declare v_row_id bigint;
    declare v_tmp_row_id bigint;
    declare v_stock_code_no int;
    declare v_repo_days int;
    declare v_fixed_date int;
    declare v_repo_trade_date int;
    declare v_repo_first_settle_date int;
    declare v_repo_back_date int;
    declare v_repo_back_trade_date int;
    declare v_cash_capt_days int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_exch_init_date = 0;
    SET v_tmp_exch_init_date = 0;
    SET v_row_id = 0;
    SET v_tmp_row_id = 0;
    SET v_stock_code_no = 0;
    SET v_repo_days = 0;
    SET v_fixed_date = 0;
    SET v_repo_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_repo_first_settle_date = 0;
    SET v_repo_back_date = 0;
    SET v_repo_back_trade_date = 0;
    SET v_cash_capt_days = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @市场编号# = 《市场编号-上海证券交易所》; */
    set v_exch_no = 1;

    /* 调用【原子_公共_基础_获取市场初始化日期】*/
    call db_pub.pra_base_GetExchInitDate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_exch_init_date);
    if v_error_code = "1" then
        SET v_error_code = "pubA.1.141.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场初始化日期出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @临时_市场初始化日期# = @市场初始化日期#; */
    set v_tmp_exch_init_date = v_exch_init_date;

    /* set @记录序号# = 0; */
    set v_row_id = 0;
    loop_label:loop

        /* [获取表记录变量语句][公共_证券基础数据_回购参数表][{记录序号},{市场编号},{证券代码编号},{回购天数}][@临时_记录序号#,@市场编号#,@证券代码编号#,@回购天数#][{记录序号}>@记录序号# order by {记录序号}] */
        select row_id,exch_no,stock_code_no,repo_days into v_tmp_row_id,v_exch_no,v_stock_code_no,v_repo_days from db_pub.tb_basesedt_repo_param where row_id>v_row_id order by row_id limit 1;


        /* if @记录序号# = @临时_记录序号# then */
        if v_row_id = v_tmp_row_id then
            leave loop_label;
        else

            /* set @记录序号# = @临时_记录序号#; */
            set v_row_id = v_tmp_row_id;
        end if;

        /* set @指定日期# = date_format(ADDDATE(@临时_市场初始化日期#, 1),'%Y%m%d'); */
        set v_fixed_date = date_format(ADDDATE(v_tmp_exch_init_date, 1),'%Y%m%d');

        /* 调用【原子_公共_基础_获取市场指定下一交易日】*/
        call db_pub.pra_base_GetExchSpecNextExchDate(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_fixed_date,
            v_error_code,
            v_error_info,
            v_exch_init_date);
        if v_error_code = "1" then
            SET v_error_code = "pubA.1.141.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场指定下一交易日出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @回购交易日期# = @市场初始化日期#; */
        set v_repo_trade_date = v_exch_init_date;

        /* set @回购首次交收日期# = @市场初始化日期#; */
        set v_repo_first_settle_date = v_exch_init_date;

        /* set @指定日期# = date_format(ADDDATE(@临时_市场初始化日期#, @回购天数#),'%Y%m%d'); */
        set v_fixed_date = date_format(ADDDATE(v_tmp_exch_init_date, v_repo_days),'%Y%m%d');

        /* 调用【原子_公共_基础_获取市场指定下一交易日】*/
        call db_pub.pra_base_GetExchSpecNextExchDate(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_fixed_date,
            v_error_code,
            v_error_info,
            v_exch_init_date);
        if v_error_code = "1" then
            SET v_error_code = "pubA.1.141.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场指定下一交易日出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @回购到期日期# = @市场初始化日期#; */
        set v_repo_back_date = v_exch_init_date;

        /* set @指定日期# = date_format(ADDDATE(@市场初始化日期#, 1),'%Y%m%d'); */
        set v_fixed_date = date_format(ADDDATE(v_exch_init_date, 1),'%Y%m%d');

        /* 调用【原子_公共_基础_获取市场指定下一交易日】*/
        call db_pub.pra_base_GetExchSpecNextExchDate(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_fixed_date,
            v_error_code,
            v_error_info,
            v_exch_init_date);
        if v_error_code = "1" then
            SET v_error_code = "pubA.1.141.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场指定下一交易日出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @实际回购到期日期# = @市场初始化日期#; */
        set v_repo_back_trade_date = v_exch_init_date;

        /* set @资金占款天数# =datediff(@实际回购到期日期#,@回购交易日期#); */
        set v_cash_capt_days =datediff(v_repo_back_trade_date,v_repo_trade_date);

        /* [更新表记录][公共_证券基础数据_回购参数表][{资金占款天数}=@资金占款天数#,{回购首次交收日期}=@回购首次交收日期#,{回购到期日期}=@回购到期日期#][{证券代码编号}=@证券代码编号#][2][@证券代码编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pub.tb_basesedt_repo_param set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cash_capt_days=v_cash_capt_days,repo_first_settle_date=v_repo_first_settle_date,repo_back_date=v_repo_back_date where stock_code_no=v_stock_code_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.1.141.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;

    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_归档公共证券基础数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_BackUpBaseSecuData;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_BackUpBaseSecuData(
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
    

    /* [数据归历史][公共_证券基础数据_证券类型流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_basesedt_stock_type_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_type, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_type, jour_occur_field, jour_after_occur_info, 
        oper_remark_info 
        from db_pub.tb_basesedt_stock_type_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_证券类型流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_basesedt_stock_type_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券基础数据_证券类型订单方向流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_basesedt_stock_type_order_dir_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_type, order_dir, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_type, order_dir, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pub.tb_basesedt_stock_type_order_dir_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_证券类型订单方向流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_basesedt_stock_type_order_dir_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券基础数据_证券代码信息流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_basesedt_stock_code_info_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, stock_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, stock_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pub.tb_basesedt_stock_code_info_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_证券代码信息流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_basesedt_stock_code_info_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券基础数据_证券代码订单方向流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_basesedt_stock_code_order_dir_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, order_dir, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, order_dir, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pub.tb_basesedt_stock_code_order_dir_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_证券代码订单方向流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_basesedt_stock_code_order_dir_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券基础数据_证券代码映射流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_basesedt_code_map_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, trade_code, target_code, 
        oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, trade_code, target_code, 
        oper_remark_info 
        from db_pub.tb_basesedt_code_map_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_证券代码映射流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_basesedt_code_map_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_历史证券行情表][{初始化日期}=@初始化日期#][3][@初始化日期#] */
    delete from db_pub_his.tb_basesedt_stock_quot_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][公共_证券基础数据_证券行情表][字段][1=1][1][@初始化日期#] */
    insert into db_pub_his.tb_basesedt_stock_quot_his (init_date,
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
        select v_init_date,
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
        pe_ratio, time_stamp 
        from db_pub.tb_basesedt_stock_quot;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.201.1=1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(1,"#",v_mysql_message);
            else
                SET v_error_info = 1;
            end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_证券基础数据_证券行情表][{昨收盘价}={最新价}][1=1][1][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_stock_quot set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_close_price=last_price where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券基础数据_证券行情流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_basesedt_stock_quot_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, stock_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, stock_code, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pub.tb_basesedt_stock_quot_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_证券行情流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_basesedt_stock_quot_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #[数据归历史][公共_证券基础数据_证券新股代码信息表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#]
    #[删除表记录][公共_证券基础数据_证券新股代码信息表][{初始化日期}<=@初始化日期#][3][@初始化日期#]

    /* [删除表记录][公共_证券基础数据_历史债券属性信息表][{初始化日期}=@初始化日期#][3][@初始化日期#] */
    delete from db_pub_his.tb_basesedt_bond_info_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][公共_证券基础数据_债券属性信息表][字段][1=1][1][@初始化日期#] */
    insert into db_pub_his.tb_basesedt_bond_info_his (init_date,
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
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, stock_code, 
        trade_code, target_code, stock_code_no, trade_code_no, 
        target_code_no, stock_name, issue_date, end_date, 
        value_date, next_value_date, begin_trade_date, bond_limit, 
        issue_price, par_value, intrst_ratio, intrst_days, 
        pay_inteval, bond_accr_intrst, bond_rate_type, inteval_days, 
        net_price_flag, last_trade_date, rights_type, trans_begin_date, 
        trans_end_date, exec_begin_date, exec_end_date, impawn_ratio, 
        pay_intrst_flag, time_stamp 
        from db_pub.tb_basesedt_bond_info;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.201.1=1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(1,"#",v_mysql_message);
            else
                SET v_error_info = 1;
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_历史基金属性信息表][{初始化日期}=@初始化日期#][3][@初始化日期#] */
    delete from db_pub_his.tb_basesedt_fund_info_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][公共_证券基础数据_基金属性信息表][字段][1=1][1][@初始化日期#] */
    insert into db_pub_his.tb_basesedt_fund_info_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, stock_code, 
        stock_code_no, stock_name, fund_kind, fund_manager, 
        fund_trustee, distribution_scale, charging_method, default_divide_type, 
        fund_found_date, fund_expire_date, subscription_trade_mark, purchase_trade_mark, 
        rede_trade_mark, first_minimum_amt, minimum_subscription_amt, minimum_purchase_amt, 
        minimum_rede_share, minimum_holding_share, minimum_turning_out_share, rede_money_to_account_days, 
        registration_agency, time_stamp) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, stock_code, 
        stock_code_no, stock_name, fund_kind, fund_manager, 
        fund_trustee, distribution_scale, charging_method, default_divide_type, 
        fund_found_date, fund_expire_date, subscription_trade_mark, purchase_trade_mark, 
        rede_trade_mark, first_minimum_amt, minimum_subscription_amt, minimum_purchase_amt, 
        minimum_rede_share, minimum_holding_share, minimum_turning_out_share, rede_money_to_account_days, 
        registration_agency, time_stamp 
        from db_pub.tb_basesedt_fund_info;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.201.1=1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(1,"#",v_mysql_message);
            else
                SET v_error_info = 1;
            end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券基础数据_债券属性信息流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_basesedt_bond_info_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code, stock_code_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code, stock_code_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pub.tb_basesedt_bond_info_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_债券属性信息流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_basesedt_bond_info_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券基础数据_基金属性信息流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_basesedt_fund_info_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code, stock_code_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code, stock_code_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pub.tb_basesedt_fund_info_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_基金属性信息流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_basesedt_fund_info_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券基础数据_债券利率流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_basesedt_bond_rate_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, intrst_begin_date, intrst_ratio, 
        oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, intrst_begin_date, intrst_ratio, 
        oper_remark_info 
        from db_pub.tb_basesedt_bond_rate_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_债券利率流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_basesedt_bond_rate_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券基础数据_债券评级信息流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_basesedt_bond_rating_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, rating_agency, co_no, 
        bond_level, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, rating_agency, co_no, 
        bond_level, oper_remark_info 
        from db_pub.tb_basesedt_bond_rating_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_债券评级信息流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_basesedt_bond_rating_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券基础数据_回购参数流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_basesedt_repo_param_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, stock_code, stock_type, 
        stock_name, repo_days, cash_capt_days, repo_first_settle_date, 
        repo_back_date, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        stock_code_no, exch_no, stock_code, stock_type, 
        stock_name, repo_days, cash_capt_days, repo_first_settle_date, 
        repo_back_date, oper_remark_info 
        from db_pub.tb_basesedt_repo_param_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_回购参数流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_basesedt_repo_param_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.201.3";
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

# 原子_公共_证券基础数据_获取证券代码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetStockCodeNo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetStockCodeNo(
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
    OUT p_stock_type int,
    OUT p_asset_type int,
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型},{资产类型},{票面面值}][@证券代码编号#,@证券类型#,@资产类型#,@票面面值#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#, @证券代码#] */
    select stock_code_no,stock_type,asset_type,par_value into v_stock_code_no,v_stock_type,v_asset_type,v_par_value from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.301.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_par_value = v_par_value;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取证券类型资产类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetStockTypeAssetType;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetStockTypeAssetType(
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
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_type int;
    declare v_asset_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_type = 0;
    SET v_asset_type = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券类型},{资产类型}][@证券类型#,@资产类型#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
    select stock_type,asset_type into v_stock_type,v_asset_type from db_pub.tb_basesedt_stock_code_info where stock_code_no=v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.302.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetStockCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetStockCodeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code varchar(6),
    OUT p_stock_name varchar(64),
    OUT p_pinyin_short varchar(16),
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_par_value decimal(16,9),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_total_stock_issue decimal(18,2),
    OUT p_circl_stock_capit decimal(18,2),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_type_unit int,
    OUT p_report_unit int,
    OUT p_min_unit int,
    OUT p_max_qty decimal(18,2),
    OUT p_min_qty decimal(18,2),
    OUT p_is_order_dir_flag int,
    OUT p_price_up decimal(16,9),
    OUT p_price_down decimal(16,9),
    OUT p_step_price decimal(16,9),
    OUT p_stop_status varchar(2),
    OUT p_hk_stock_flag int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_stop_status varchar(2);
    declare v_hk_stock_flag int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_fair_price decimal(16,9);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code = " ";
    SET v_stock_name = " ";
    SET v_pinyin_short = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;
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
    SET v_stop_status = "0";
    SET v_hk_stock_flag = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_fair_price = 0;
    SET v_time_stamp = unix_timestamp();

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][字段][字段变量][{证券代码编号} = @证券代码编号# and {市场编号} = @市场编号#][1][@证券代码编号#, @市场编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, stock_code_no, 
        exch_no, stock_code, stock_name, pinyin_short, 
        stock_type, asset_type, par_value, crncy_type, 
        exch_crncy_type, total_stock_issue, circl_stock_capit, capit_reback_days, 
        posi_reback_days, type_unit, report_unit, min_unit, 
        max_qty, min_qty, is_order_dir_flag, price_up, 
        price_down, step_price, fair_price, stop_status, 
        hk_stock_flag, time_stamp into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_stock_code_no, 
        v_exch_no, v_stock_code, v_stock_name, v_pinyin_short, 
        v_stock_type, v_asset_type, v_par_value, v_crncy_type, 
        v_exch_crncy_type, v_total_stock_issue, v_circl_stock_capit, v_capit_reback_days, 
        v_posi_reback_days, v_type_unit, v_report_unit, v_min_unit, 
        v_max_qty, v_min_qty, v_is_order_dir_flag, v_price_up, 
        v_price_down, v_step_price, v_fair_price, v_stop_status, 
        v_hk_stock_flag, v_time_stamp from db_pub.tb_basesedt_stock_code_info where stock_code_no = v_stock_code_no and exch_no = v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.303.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code = v_stock_code;
    SET p_stock_name = v_stock_name;
    SET p_pinyin_short = v_pinyin_short;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_par_value = v_par_value;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_total_stock_issue = v_total_stock_issue;
    SET p_circl_stock_capit = v_circl_stock_capit;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_type_unit = v_type_unit;
    SET p_report_unit = v_report_unit;
    SET p_min_unit = v_min_unit;
    SET p_max_qty = v_max_qty;
    SET p_min_qty = v_min_qty;
    SET p_is_order_dir_flag = v_is_order_dir_flag;
    SET p_price_up = v_price_up;
    SET p_price_down = v_price_down;
    SET p_step_price = v_step_price;
    SET p_stop_status = v_stop_status;
    SET p_hk_stock_flag = v_hk_stock_flag;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取代码证券名称
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetCodeStockName;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetCodeStockName(
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
    OUT p_stock_name varchar(64)
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券名称}][@证券名称#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select stock_name into v_stock_name from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.304.4";
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
    SET p_stock_name = v_stock_name;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取债券付息信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetBondDebtInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetBondDebtInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_exch_no int,
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_crncy_type varchar(3),
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_inteval_days int,
    OUT p_bond_cash_flag int
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
    declare v_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_crncy_type varchar(3);
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_inteval_days int;
    declare v_bond_cash_flag int;
    declare v_fixed_date int;
    declare v_exch_init_date int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_stock_code varchar(6);
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);
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
    declare v_intrst_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_pay_inteval int;
    declare v_bond_rate_type int;
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_crncy_type = "CNY";
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_inteval_days = 0;
    SET v_bond_cash_flag = 0;
    SET v_fixed_date = 0;
    SET v_exch_init_date = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_stock_code = " ";
    SET v_trade_code = " ";
    SET v_target_code = " ";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_name = " ";
    SET v_issue_date = date_format(curdate(),'%Y%m%d');
    SET v_end_date = date_format(curdate(),'%Y%m%d');
    SET v_value_date = date_format(curdate(),'%Y%m%d');
    SET v_next_value_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_bond_limit = 0;
    SET v_issue_price = 0;
    SET v_intrst_ratio = 0;
    SET v_intrst_days = 0;
    SET v_pay_inteval = 0;
    SET v_bond_rate_type = 0;
    SET v_net_price_flag = 0;
    SET v_last_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_rights_type = 0;
    SET v_trans_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_trans_end_date = date_format(curdate(),'%Y%m%d');
    SET v_exec_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_exec_end_date = date_format(curdate(),'%Y%m%d');
    SET v_impawn_ratio = 0;
    SET v_pay_intrst_flag = 0;
    SET v_time_stamp = unix_timestamp();

    
    label_pro:BEGIN
    

    /* set @市场编号#=《市场编号-上海证券交易所》; */
    set v_exch_no=1;

    /* set @指定日期#=@初始化日期#; */
    set v_fixed_date=v_init_date;

    /* 调用【原子_公共_基础_获取市场指定下一交易日】*/
    call db_pub.pra_base_GetExchSpecNextExchDate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_fixed_date,
        v_error_code,
        v_error_info,
        v_exch_init_date);
    if v_error_code = "1" then
        SET v_error_code = "pubA.1.305.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场指定下一交易日出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_债券属性信息表][字段][字段变量][({记录序号}>@查询记录序号# and ({下一起息日期}>@初始化日期# and {下一起息日期}<=@市场初始化日期# and {付息间隔} in (1,2,3,4)) or ({结束日期}>@初始化日期# and {结束日期}<=@市场初始化日期#)) order by {记录序号}][4][@查询记录序号#,@初始化日期#,@市场初始化日期#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, trade_code, target_code, stock_code_no, 
        trade_code_no, target_code_no, stock_name, issue_date, 
        end_date, value_date, next_value_date, begin_trade_date, 
        bond_limit, issue_price, par_value, intrst_ratio, 
        intrst_days, pay_inteval, bond_accr_intrst, bond_rate_type, 
        inteval_days, net_price_flag, last_trade_date, rights_type, 
        trans_begin_date, trans_end_date, exec_begin_date, exec_end_date, 
        impawn_ratio, pay_intrst_flag, time_stamp into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_exch_no, 
        v_stock_code, v_trade_code, v_target_code, v_stock_code_no, 
        v_trade_code_no, v_target_code_no, v_stock_name, v_issue_date, 
        v_end_date, v_value_date, v_next_value_date, v_begin_trade_date, 
        v_bond_limit, v_issue_price, v_par_value, v_intrst_ratio, 
        v_intrst_days, v_pay_inteval, v_bond_accr_intrst, v_bond_rate_type, 
        v_inteval_days, v_net_price_flag, v_last_trade_date, v_rights_type, 
        v_trans_begin_date, v_trans_end_date, v_exec_begin_date, v_exec_end_date, 
        v_impawn_ratio, v_pay_intrst_flag, v_time_stamp from db_pub.tb_basesedt_bond_info where (row_id>v_query_row_id and (next_value_date>v_init_date and next_value_date<=v_exch_init_date and pay_inteval in (1,2,3,4)) or (end_date>v_init_date and end_date<=v_exch_init_date)) order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.305.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询记录序号=",v_query_row_id,",","初始化日期=",v_init_date,",","市场初始化日期=",v_exch_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询记录序号=",v_query_row_id,",","初始化日期=",v_init_date,",","市场初始化日期=",v_exch_init_date);
        end if;
        leave label_pro;
    end if;

    #债券兑付时，不仅要处理利息，还需处理债券持仓，以红股方式处理，数量为-1

    /* if @结束日期#>@初始化日期# and @结束日期#<=@市场初始化日期# then */
    if v_end_date>v_init_date and v_end_date<=v_exch_init_date then

        /* set @债券兑付方式#=《债券兑付方式-兑付》; */
        set v_bond_cash_flag=2;

        /* if @付息间隔#<>6 then */
        if v_pay_inteval<>6 then

            /* set @债券计提利息#=round(ifnull(datediff(@结束日期#,@起息日期#)*@票面面值#*@年利率#/@计息天数#/100,0),3); */
            set v_bond_accr_intrst=round(ifnull(datediff(v_end_date,v_value_date)*v_par_value*v_intrst_ratio/v_intrst_days/100,0),3);
        end if;
    else

        /* set @债券兑付方式#=《债券兑付方式-付息》; */
        set v_bond_cash_flag=1;

        /* set @债券计提利息#=round(ifnull(datediff(@下一起息日期#,@起息日期#)*@票面面值#*@年利率#/@计息天数#/100,0),3); */
        set v_bond_accr_intrst=round(ifnull(datediff(v_next_value_date,v_value_date)*v_par_value*v_intrst_ratio/v_intrst_days/100,0),3);
    end if;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型},{本币币种}][@证券类型#,@本币币种#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select stock_code_no,stock_type,crncy_type into v_stock_type,v_crncy_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.305.4";
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
    SET p_row_id = v_row_id;
    SET p_exch_no = v_exch_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_crncy_type = v_crncy_type;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_inteval_days = v_inteval_days;
    SET p_bond_cash_flag = v_bond_cash_flag;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取编号债券计提利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetNoBondIntrst;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetNoBondIntrst(
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
    OUT p_bond_accr_intrst decimal(18,12),
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
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_bond_accr_intrst decimal(18,12);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_bond_accr_intrst = 0;
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{债券计提利息}, {票面面值}][@债券计提利息#, @票面面值#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
    select bond_accr_intrst, par_value into v_bond_accr_intrst, v_par_value from db_pub.tb_basesedt_bond_info where stock_code_no=v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.306.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_par_value = v_par_value;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取编号债券质押比例
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetNoBondImpawnRadio;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetNoBondImpawnRadio(
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_target_code varchar(6);
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_exch_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_target_code = " ";
    SET v_target_code_no = 0;
    SET v_impawn_ratio = 0;
    SET v_exch_no = 0;
    SET v_stock_code = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{市场编号}, {证券代码}, {质押比例}][@市场编号#, @证券代码#,@质押比例#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
    select exch_no, stock_code, impawn_ratio into v_exch_no, v_stock_code,v_impawn_ratio from db_pub.tb_basesedt_bond_info where stock_code_no=v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.307.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* if @市场编号# = 《市场编号-上海证券交易所》 then */
    if v_exch_no = 1 then

        /* set @标的代码# = "888880"; */
        set v_target_code = "888880";
    else

        /* set @标的代码# = "131990"; */
        set v_target_code = "131990";
    end if;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@标的代码编号#][{市场编号}=@市场编号# and {证券代码}=@标的代码#][4][@市场编号#,@标的代码#] */
    select stock_code_no into v_target_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_target_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.307.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","标的代码=",v_target_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","标的代码=",v_target_code);
        end if;
        leave label_pro;
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

# 原子_公共_证券基础数据_获取编号证券代码属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetNoStockCodeProp;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetNoStockCodeProp(
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
    OUT p_exch_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_net_price_flag int,
    OUT p_bond_rate_type int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_net_price_flag int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_stock_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_net_price_flag = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;

    
    label_pro:BEGIN
    

    /* set @债券计提利息#=0; */
    set v_bond_accr_intrst=0;

    /* set @票面面值#=0; */
    set v_par_value=0;

    /* set @质押比例#=0; */
    set v_impawn_ratio=0;

    /* set @计息天数# = 0; */
    set v_intrst_days = 0;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{市场编号},{证券代码},{证券类型},{本币币种},{交易币种},{资金回转天数},{持仓回转天数}][@市场编号#,@证券代码#,@证券类型#,@本币币种#,@交易币种#,@资金回转天数#,@持仓回转天数#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
    select exch_no,stock_code,stock_type,crncy_type,exch_crncy_type,capit_reback_days,posi_reback_days into v_exch_no,v_stock_code,v_stock_type,v_crncy_type,v_exch_crncy_type,v_capit_reback_days,v_posi_reback_days from db_pub.tb_basesedt_stock_code_info where stock_code_no=v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.308.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* set @交易代码编号#=@证券代码编号#; */
    set v_trade_code_no=v_stock_code_no;

    /* set @标的代码编号#=@证券代码编号#; */
    set v_target_code_no=v_stock_code_no;

    /* if @证券类型#>20 and @证券类型#<50 then */
    if v_stock_type>20 and v_stock_type<50 then

        /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{债券利率类型}, {债券计提利息}, {计息天数}, {票面面值},{质押比例},{净价标志}][@债券利率类型#,@债券计提利息#,@计息天数#, @票面面值#,@质押比例#,@净价标志#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
        select bond_rate_type, bond_accr_intrst, intrst_days, par_value,impawn_ratio,net_price_flag into v_bond_rate_type,v_bond_accr_intrst,v_intrst_days, v_par_value,v_impawn_ratio,v_net_price_flag from db_pub.tb_basesedt_bond_info where stock_code_no=v_stock_code_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.1.308.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;

        #[获取表记录变量][公共_证券基础数据_证券代码映射表][{交易代码},{标的代码}][@交易代码#,@标的代码#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#]
        #[获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@交易代码#][4][@市场编号#, @交易代码#]
        #set @交易代码编号#=@证券代码编号#;
        #[获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@标的代码#][4][@市场编号#, @标的代码#]
        #set @标的代码编号#=@证券代码编号#;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_no = v_exch_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_type = v_stock_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_net_price_flag = v_net_price_flag;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取基础证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetBaseStockQuot;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetBaseStockQuot(
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
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9)
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
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_证券行情表][{涨停价},{跌停价},{最新价}][@涨停价#,@跌停价#,@最新价#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
    select up_limit_price,down_limit_price,last_price into v_up_limit_price,v_down_limit_price,v_last_price from db_pub.tb_basesedt_stock_quot where stock_code_no=v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.309.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取同步所需证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetStockCodeInfoBySync;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetStockCodeInfoBySync(
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
    OUT p_asset_type int,
    OUT p_stock_type int,
    OUT p_stock_name varchar(64),
    OUT p_target_code varchar(6),
    OUT p_target_code_no int
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
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_stock_name varchar(64);
    declare v_target_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code varchar(6);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_type = 0;
    SET v_stock_type = 0;
    SET v_stock_name = " ";
    SET v_target_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code = " ";

    
    label_pro:BEGIN
    
    #标的代码编号 供同步回购代码持仓使用。

    /* set @标的代码编号# =0; */
    set v_target_code_no =0;

    /* if @证券代码#="SHRQ88" then */
    if v_stock_code="SHRQ88" then

        /* set @标的代码#="888880"; */
        set v_target_code="888880";

        /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券名称},{证券类型},{资产类型}][@证券代码编号#,@证券名称#,@证券类型#,@资产类型#][{市场编号}=@市场编号# and {证券代码}=@标的代码#][4][@市场编号#, @标的代码#] */
        select stock_code_no,stock_name,stock_type,asset_type into v_stock_code_no,v_stock_name,v_stock_type,v_asset_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_target_code limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.1.310.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 标的代码=", v_target_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,","," 标的代码=", v_target_code);
            end if;
            leave label_pro;
        end if;

    else

        /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券名称},{证券类型},{资产类型}][@证券代码编号#,@证券名称#,@证券类型#,@资产类型#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#, @证券代码#] */
        select stock_code_no,stock_name,stock_type,asset_type into v_stock_code_no,v_stock_name,v_stock_type,v_asset_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.1.310.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code);
            end if;
            leave label_pro;
        end if;


        /* if @证券类型# = 《证券类型-债券回购》 then */
        if v_stock_type = 26 then

            /* if @市场编号# = 《市场编号-上海证券交易所》 then */
            if v_exch_no = 1 then

                /* set @标的代码# = "888880" ; */
                set v_target_code = "888880" ;
            else

                /* set @标的代码# = "131990" ; */
                set v_target_code = "131990" ;
            end if;
            #[获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券名称},{证券类型},{资产类型}][@证券代码编号#,@证券名称#,@证券类型#,@资产类型#][{市场编号}=@市场编号# and {证券代码}=@标的代码#][4][@市场编号#, @标的代码#]

            /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@标的代码编号#][{市场编号}=@市场编号# and {证券代码}=@标的代码#][4][@市场编号#, @标的代码#] */
            select stock_code_no into v_target_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_target_code limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.1.310.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 标的代码=", v_target_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,","," 标的代码=", v_target_code);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if @证券类型# = 《证券类型-债券质押》 then */
        if v_stock_type = 28 then

            /* [获取表记录变量][公共_证券基础数据_证券代码映射表][{交易代码}][@交易代码#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
            select trade_code into v_trade_code from db_pub.tb_basesedt_code_map where stock_code_no=v_stock_code_no limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.1.310.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;


            /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券名称},{证券类型},{资产类型}][@证券代码编号#,@证券名称#,@证券类型#,@资产类型#][{市场编号}=@市场编号# and {证券代码}=@交易代码#][4][@市场编号#, @交易代码#] */
            select stock_code_no,stock_name,stock_type,asset_type into v_stock_code_no,v_stock_name,v_stock_type,v_asset_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_trade_code limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.1.310.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 交易代码=", v_trade_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,","," 交易代码=", v_trade_code);
                end if;
                leave label_pro;
            end if;

        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;
    SET p_asset_type = v_asset_type;
    SET p_stock_type = v_stock_type;
    SET p_stock_name = v_stock_name;
    SET p_target_code = v_target_code;
    SET p_target_code_no = v_target_code_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取同步所需证券代码编号信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetStockCodeNoInfoBySync;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetStockCodeNoInfoBySync(
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
    OUT p_stock_code varchar(6),
    OUT p_stock_name varchar(64),
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
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_stock_type int;
    declare v_asset_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code = " ";
    SET v_stock_name = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码},{证券名称},{证券类型},{资产类型}][@证券代码#,@证券名称#,@证券类型#,@资产类型#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
    select stock_code,stock_name,stock_type,asset_type into v_stock_code,v_stock_name,v_stock_type,v_asset_type from db_pub.tb_basesedt_stock_code_info where stock_code_no=v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.311.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code = v_stock_code;
    SET p_stock_name = v_stock_name;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取风控计算费用证券代码属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetStockCodeInfoByRiskCalcFee;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetStockCodeInfoByRiskCalcFee(
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
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_net_price_flag int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_rate_type int,
    OUT p_bond_accr_intrst decimal(18,12)
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
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;

    
    label_pro:BEGIN
    

    /* set @债券计提利息#=0; */
    set v_bond_accr_intrst=0;

    /* set @票面面值#=0; */
    set v_par_value=0;

    /* set @债券利率类型#=0; */
    set v_bond_rate_type=0;

    /* set @净价标志# = 0; */
    set v_net_price_flag = 0;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型},{资产类型}][@证券代码编号#,@证券类型#,@资产类型#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select stock_code_no,stock_type,asset_type into v_stock_code_no,v_stock_type,v_asset_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.312.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* if @证券类型#>20 and @证券类型#<50 then */
    if v_stock_type>20 and v_stock_type<50 then

        /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{债券利率类型}, {债券计提利息}, {净价标志}, {票面面值}][@债券利率类型#,@债券计提利息#,@净价标志#, @票面面值#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
        select bond_rate_type, bond_accr_intrst, net_price_flag, par_value into v_bond_rate_type,v_bond_accr_intrst,v_net_price_flag, v_par_value from db_pub.tb_basesedt_bond_info where stock_code_no=v_stock_code_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.1.312.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_net_price_flag = v_net_price_flag;
    SET p_par_value = v_par_value;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_bond_accr_intrst = v_bond_accr_intrst;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取风控所需证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetStockCodeInfoByRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetStockCodeInfoByRisk(
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
    

    /* if @指定行数# = -1 then */
    if v_row_count = -1 then

       /* SELECT
 a.{记录序号},
 a.{证券代码编号},
 a.{市场编号},
 a.{证券代码},
 a.{证券名称},
 a.{证券类型},
 a.{资产类型},
 a.{总股本},
 a.{流通股本},
 a.{本币币种},
 a.{交易币种},
 a.{公允价格},
 ifnull(b.{最新价}, 0) as {最新价},
 ifnull(b.{今开盘价}, 0) as {今开盘价},
 ifnull(b.{昨收盘价}, 0) as {昨收盘价},
 ifnull(b.{涨停价}, 0) as {涨停价},
 ifnull(b.{跌停价}, 0) as {跌停价},
 ifnull(c.{净价标志}, 0) as {净价标志},
 ifnull(c.{债券计提利息}, 0) as {债券计提利息},
 ifnull(c.{债券利率类型}, 0) as {债券利率类型},
 a.{最小价差}
FROM
 ~公共_证券基础数据_证券代码信息表^ a
LEFT JOIN ~公共_证券基础数据_证券行情表^ b ON a.{证券代码编号} = b.{证券代码编号}
LEFT JOIN ~公共_证券基础数据_债券属性信息表^ c ON a.{证券代码编号} = c.{证券代码编号}
WHERE
 a.{记录序号} > @记录序号#
ORDER BY
 a.{记录序号}; */
       SELECT
        a.row_id,
        a.stock_code_no,
        a.exch_no,
        a.stock_code,
        a.stock_name,
        a.stock_type,
        a.asset_type,
        a.total_stock_issue,
        a.circl_stock_capit,
        a.crncy_type,
        a.exch_crncy_type,
        a.fair_price,
        ifnull(b.last_price, 0) as last_price,
        ifnull(b.today_open_price, 0) as today_open_price,
        ifnull(b.pre_close_price, 0) as pre_close_price,
        ifnull(b.up_limit_price, 0) as up_limit_price,
        ifnull(b.down_limit_price, 0) as down_limit_price,
        ifnull(c.net_price_flag, 0) as net_price_flag,
        ifnull(c.bond_accr_intrst, 0) as bond_accr_intrst,
        ifnull(c.bond_rate_type, 0) as bond_rate_type,
        a.step_price
       FROM
        db_pub.tb_basesedt_stock_code_info a
       LEFT JOIN db_pub.tb_basesedt_stock_quot b ON a.stock_code_no = b.stock_code_no
       LEFT JOIN db_pub.tb_basesedt_bond_info c ON a.stock_code_no = c.stock_code_no
       WHERE
        a.row_id > v_row_id
       ORDER BY
        a.row_id;
    else

        /* SELECT
 a.{记录序号},
 a.{证券代码编号},
 a.{市场编号},
 a.{证券代码},
 a.{证券名称},
 a.{证券类型},
 a.{资产类型},
 a.{总股本},
 a.{流通股本},
 a.{本币币种},
 a.{交易币种},
 a.{公允价格},
 ifnull(b.{最新价}, 0) as {最新价},
 ifnull(b.{今开盘价}, 0) as {今开盘价},
 ifnull(b.{昨收盘价}, 0) as {昨收盘价},
 ifnull(b.{涨停价}, 0) as {涨停价},
 ifnull(b.{跌停价}, 0) as {跌停价},
 ifnull(c.{净价标志}, 0) as {净价标志},
 ifnull(c.{债券计提利息}, 0) as {债券计提利息},
 ifnull(c.{债券利率类型}, 0) as {债券利率类型},
a.{最小价差}
FROM
 ~公共_证券基础数据_证券代码信息表^ a
LEFT JOIN ~公共_证券基础数据_证券行情表^ b ON a.{证券代码编号} = b.{证券代码编号}
LEFT JOIN ~公共_证券基础数据_债券属性信息表^ c ON a.{证券代码编号} = c.{证券代码编号}
WHERE
 a.{记录序号} > @记录序号#
ORDER BY
 a.{记录序号}
limit 
 @指定行数#; */
        SELECT
         a.row_id,
         a.stock_code_no,
         a.exch_no,
         a.stock_code,
         a.stock_name,
         a.stock_type,
         a.asset_type,
         a.total_stock_issue,
         a.circl_stock_capit,
         a.crncy_type,
         a.exch_crncy_type,
         a.fair_price,
         ifnull(b.last_price, 0) as last_price,
         ifnull(b.today_open_price, 0) as today_open_price,
         ifnull(b.pre_close_price, 0) as pre_close_price,
         ifnull(b.up_limit_price, 0) as up_limit_price,
         ifnull(b.down_limit_price, 0) as down_limit_price,
         ifnull(c.net_price_flag, 0) as net_price_flag,
         ifnull(c.bond_accr_intrst, 0) as bond_accr_intrst,
         ifnull(c.bond_rate_type, 0) as bond_rate_type,
        a.step_price
        FROM
         db_pub.tb_basesedt_stock_code_info a
        LEFT JOIN db_pub.tb_basesedt_stock_quot b ON a.stock_code_no = b.stock_code_no
        LEFT JOIN db_pub.tb_basesedt_bond_info c ON a.stock_code_no = c.stock_code_no
        WHERE
         a.row_id > v_row_id
        ORDER BY
         a.row_id
        limit 
         v_row_count;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取编号回购参数信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetNoRepoParamInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetNoRepoParamInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_repo_days int,
    OUT p_repo_first_settle_date int,
    OUT p_repo_back_date int,
    OUT p_cash_capt_days int,
    OUT p_target_code_no int,
    OUT p_target_code varchar(6),
    OUT p_target_code_stock_type int,
    OUT p_target_code_asset_type int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_repo_days int;
    declare v_repo_first_settle_date int;
    declare v_repo_back_date int;
    declare v_cash_capt_days int;
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_repo_days = 0;
    SET v_repo_first_settle_date = 0;
    SET v_repo_back_date = 0;
    SET v_cash_capt_days = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_回购参数表][{回购天数},{回购首次交收日期},{回购到期日期},{资金占款天数}][@回购天数#,@回购首次交收日期#,@回购到期日期#,@资金占款天数#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
    select repo_days,repo_first_settle_date,repo_back_date,cash_capt_days into v_repo_days,v_repo_first_settle_date,v_repo_back_date,v_cash_capt_days from db_pub.tb_basesedt_repo_param where stock_code_no=v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.314.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* if @市场编号#=《市场编号-上海证券交易所》 then */
    if v_exch_no=1 then

        /* set @标的代码# = "888880"; */
        set v_target_code = "888880";

    /* elseif @市场编号#=《市场编号-深圳证券交易所》 then */
    elseif v_exch_no=2 then

        /* set @标的代码# = "131990"; */
        set v_target_code = "131990";
    end if;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型},{资产类型}][@标的代码编号#,@标的代码证券类型#,@标的代码资产类型#][{市场编号}=@市场编号# and {证券代码}=@标的代码#][4][@市场编号#,@标的代码#] */
    select stock_code_no,stock_type,asset_type into v_target_code_no,v_target_code_stock_type,v_target_code_asset_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_target_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.314.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","标的代码=",v_target_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","标的代码=",v_target_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_repo_days = v_repo_days;
    SET p_repo_first_settle_date = v_repo_first_settle_date;
    SET p_repo_back_date = v_repo_back_date;
    SET p_cash_capt_days = v_cash_capt_days;
    SET p_target_code_no = v_target_code_no;
    SET p_target_code = v_target_code;
    SET p_target_code_stock_type = v_target_code_stock_type;
    SET p_target_code_asset_type = v_target_code_asset_type;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取交易代码编号信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetTradeCodeNoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetTradeCodeNoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_trade_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_trade_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_type int;
    declare v_asset_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_trade_code_no = p_trade_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券类型},{资产类型}][@证券类型#,@资产类型#][{证券代码编号}=@交易代码编号#][4][@交易代码编号#] */
    select stock_type,asset_type into v_stock_type,v_asset_type from db_pub.tb_basesedt_stock_code_info where stock_code_no=v_trade_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.315.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易代码编号=",v_trade_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易代码编号=",v_trade_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_编号获取证券信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_NumberGetStockInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_NumberGetStockInfo(
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
    declare v_row_count int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数#=-1; */
    set v_row_count=-1;

    /* [获取表记录][公共_证券基础数据_证券代码信息表][{证券代码编号},{市场编号},{证券代码},{证券名称}][{证券代码编号}=@证券代码编号# or @证券代码编号#=0][@指定行数#] */
    if v_row_count = -1 then
        select stock_code_no,exch_no,stock_code,stock_name from db_pub.tb_basesedt_stock_code_info where stock_code_no=v_stock_code_no or v_stock_code_no=0;
    else
        select stock_code_no,exch_no,stock_code,stock_name from db_pub.tb_basesedt_stock_code_info where stock_code_no=v_stock_code_no or v_stock_code_no=0 limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_新增基金属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_AddFundInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_AddFundInfo(
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
    declare v_time_stamp int;
    declare v_tmp_oper_remark_info varchar(255);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_stock_code_no int;
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_jour_after_occur_info varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_time_stamp = unix_timestamp();
    SET v_tmp_oper_remark_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_stock_code_no = 0;
    SET v_pinyin_short = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;
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
    SET v_fair_price = 0;
    SET v_stop_status = "0";
    SET v_hk_stock_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_jour_after_occur_info = " ";

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* set @临时_操作备注#=@操作备注#; */
    set v_tmp_oper_remark_info=v_oper_remark_info;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @证券代码编号#=0; */
    set v_stock_code_no=0;
    #拼音简称放默认值,证券类型和资产类型分别置为54,51,票面面值置为1,取公共资源的数据

    /* set @拼音简称#=" "; */
    set v_pinyin_short=" ";

    /* set @证券类型#=54; */
    set v_stock_type=54;

    /* set @资产类型#=51; */
    set v_asset_type=51;

    /* set @票面面值#=1; */
    set v_par_value=1;

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @交易币种#="CNY"; */
    set v_exch_crncy_type="CNY";

    /* set @总股本#=@发行规模#; */
    set v_total_stock_issue=v_distribution_scale;

    /* set @流通股本#=@发行规模#; */
    set v_circl_stock_capit=v_distribution_scale;

    /* set @资金回转天数#=0; */
    set v_capit_reback_days=0;

    /* set @持仓回转天数#=1; */
    set v_posi_reback_days=1;

    /* set @类型单位#=3; */
    set v_type_unit=3;

    /* set @申报单位#=1; */
    set v_report_unit=1;

    /* set @最小单位#=1; */
    set v_min_unit=1;

    /* set @最大数量#=99999999; */
    set v_max_qty=99999999;

    /* set @最小数量#=1; */
    set v_min_qty=1;

    /* set @区分订单方向标志#=1; */
    set v_is_order_dir_flag=1;

    /* set @价格上限#=0; */
    set v_price_up=0;

    /* set @价格下限#=0; */
    set v_price_down=0;

    /* set @最小价差#=0; */
    set v_step_price=0;

    /* set @公允价格#=0; */
    set v_fair_price=0;

    /* set @停牌标志#=1; */
    set v_stop_status=1;

    /* set @港股通标的#=2; */
    set v_hk_stock_flag=2;

    /* [插入表记录][公共_证券基础数据_证券代码信息表][字段][字段变量][1][@市场编号#,@证券代码#] */
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
                
        SET v_error_code = "pubA.1.317.1";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @编号类型#=8; */
    set v_record_no_type=8;

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
        SET v_error_code = "pubA.1.317.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场业务记录编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @证券代码编号#=@当前编号#; */
    set v_stock_code_no=v_curr_no;

    /* [更新表记录][公共_证券基础数据_证券代码信息表][{证券代码编号}=@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][2][@市场编号#,@证券代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_stock_code_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_code_no=v_stock_code_no where exch_no=v_exch_no and stock_code=v_stock_code;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.317.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作备注#="新增场外基金证券代码信息 !"; */
    set v_oper_remark_info="新增场外基金证券代码信息 !";

    /* [获取流水变动][{初始化日期},{证券代码},{市场编号},{证券代码编号}][@初始化日期#,@证券代码#,@市场编号#,@证券代码编号#] */
    set v_jour_occur_field = concat("初始化日期","|","证券代码","|","市场编号","|","证券代码编号","|");
    set v_jour_occur_info = concat(v_init_date,"|",v_stock_code,"|",v_exch_no,"|",v_stock_code_no,"|");


    /* [获取流水后信息][@初始化日期#,@证券代码#,@市场编号#,@证券代码编号#] */
    set v_jour_after_occur_info = concat(v_init_date,"|",v_stock_code,"|",v_exch_no,"|",v_stock_code_no,"|");


    /* [插入表记录][公共_证券基础数据_证券代码信息流水表][字段][字段变量][5][@市场编号#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_stock_code_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, stock_code, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_stock_code, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.317.5";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @操作备注#=@临时_操作备注#; */
    set v_oper_remark_info=v_tmp_oper_remark_info;

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "市场编号", "|", "证券代码", "|", "证券名称", "|", "基金类别", "|", "基金管理人", "|", "基金托管人", "|", "发行规模", "|", "收费方式", "|", "默认分红方式", "|", "基金成立日期", "|", "基金到期日期", "|", "认购交易标志", "|", "申购交易标志", "|", "赎回交易标志", "|", "首次最低金额", "|", "最低认购金额", "|", "最低申购金额", "|", "最低赎回份额", "|", "最低持有份额", "|", "最低转出份额", "|", "赎回款到账天数", "|", "登记机构", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_code, "|", v_stock_name, "|", v_fund_kind, "|", v_fund_manager, "|", v_fund_trustee, "|", v_distribution_scale, "|", v_charging_method, "|", v_default_divide_type, "|", v_fund_found_date, "|", v_fund_expire_date, "|", v_subscription_trade_mark, "|", v_purchase_trade_mark, "|", v_rede_trade_mark, "|", v_first_minimum_amt, "|", v_minimum_subscription_amt, "|", v_minimum_purchase_amt, "|", v_minimum_rede_share, "|", v_minimum_holding_share, "|", v_minimum_turning_out_share, "|", v_rede_money_to_account_days, "|", v_registration_agency, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [插入表记录][公共_证券基础数据_基金属性信息表][字段][字段变量][1][@市场编号#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_fund_info(
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, stock_code, 
        stock_code_no, stock_name, fund_kind, fund_manager, 
        fund_trustee, distribution_scale, charging_method, default_divide_type, 
        fund_found_date, fund_expire_date, subscription_trade_mark, purchase_trade_mark, 
        rede_trade_mark, first_minimum_amt, minimum_subscription_amt, minimum_purchase_amt, 
        minimum_rede_share, minimum_holding_share, minimum_turning_out_share, rede_money_to_account_days, 
        registration_agency, time_stamp) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_no, v_stock_code, 
        v_stock_code_no, v_stock_name, v_fund_kind, v_fund_manager, 
        v_fund_trustee, v_distribution_scale, v_charging_method, v_default_divide_type, 
        v_fund_found_date, v_fund_expire_date, v_subscription_trade_mark, v_purchase_trade_mark, 
        v_rede_trade_mark, v_first_minimum_amt, v_minimum_subscription_amt, v_minimum_purchase_amt, 
        v_minimum_rede_share, v_minimum_holding_share, v_minimum_turning_out_share, v_rede_money_to_account_days, 
        v_registration_agency, v_time_stamp);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.317.1";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_code, "|", v_stock_name, "|", v_fund_kind, "|", v_fund_manager, "|", v_fund_trustee, "|", v_distribution_scale, "|", v_charging_method, "|", v_default_divide_type, "|", v_fund_found_date, "|", v_fund_expire_date, "|", v_subscription_trade_mark, "|", v_purchase_trade_mark, "|", v_rede_trade_mark, "|", v_first_minimum_amt, "|", v_minimum_subscription_amt, "|", v_minimum_purchase_amt, "|", v_minimum_rede_share, "|", v_minimum_holding_share, "|", v_minimum_turning_out_share, "|", v_rede_money_to_account_days, "|", v_registration_agency, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [插入表记录][公共_证券基础数据_基金属性信息流水表][字段][字段变量][5][@市场编号#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_fund_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, exch_no, 
        stock_code, stock_code_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_exch_no, 
        v_stock_code, v_stock_code_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.317.5";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_修改基金属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_ModiFundInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_ModiFundInfo(
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
    declare v_time_stamp int;
    declare v_stock_code_no int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_time_stamp = unix_timestamp();
    SET v_stock_code_no = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();

    #获取代码对应的编号

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#, @证券代码#] */
    select stock_code_no into v_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.318.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "市场编号", "|", "证券代码", "|", "证券名称", "|", "基金类别", "|", "基金管理人", "|", "基金托管人", "|", "发行规模", "|", "收费方式", "|", "默认分红方式", "|", "基金成立日期", "|", "基金到期日期", "|", "认购交易标志", "|", "申购交易标志", "|", "赎回交易标志", "|", "首次最低金额", "|", "最低认购金额", "|", "最低申购金额", "|", "最低赎回份额", "|", "最低持有份额", "|", "最低转出份额", "|", "赎回款到账天数", "|", "登记机构", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_code, "|", v_stock_name, "|", v_fund_kind, "|", v_fund_manager, "|", v_fund_trustee, "|", v_distribution_scale, "|", v_charging_method, "|", v_default_divide_type, "|", v_fund_found_date, "|", v_fund_expire_date, "|", v_subscription_trade_mark, "|", v_purchase_trade_mark, "|", v_rede_trade_mark, "|", v_first_minimum_amt, "|", v_minimum_subscription_amt, "|", v_minimum_purchase_amt, "|", v_minimum_rede_share, "|", v_minimum_holding_share, "|", v_minimum_turning_out_share, "|", v_rede_money_to_account_days, "|", v_registration_agency, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_证券基础数据_证券代码信息表][{证券名称}=@证券名称#][{证券代码编号}=@证券代码编号#][2][@证券代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_stock_code_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_name=v_stock_name where stock_code_no=v_stock_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.318.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_证券基础数据_基金属性信息表][{证券名称}=@证券名称#,{基金类别}=@基金类别#,{基金管理人}=@基金管理人#,{基金托管人}=@基金托管人#,{发行规模}=@发行规模#,{收费方式}=@收费方式#,{默认分红方式}=@默认分红方式#,{基金到期日期}=@基金到期日期#,{申购交易标志}=@申购交易标志#,{赎回交易标志}=@赎回交易标志#,{首次最低金额}=@首次最低金额#,{最低认购金额}=@最低认购金额#,{最低申购金额}=@最低申购金额#,{最低赎回份额}=@最低赎回份额#,{最低持有份额}=@最低持有份额#,{最低转出份额}=@最低转出份额#,{赎回款到账天数}=@赎回款到账天数#,{登记机构} = @登记机构#,{时间戳} = @时间戳#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][2][@市场编号#,@证券代码#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_fund_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_name=v_stock_name,fund_kind=v_fund_kind,fund_manager=v_fund_manager,fund_trustee=v_fund_trustee,distribution_scale=v_distribution_scale,charging_method=v_charging_method,default_divide_type=v_default_divide_type,fund_expire_date=v_fund_expire_date,purchase_trade_mark=v_purchase_trade_mark,rede_trade_mark=v_rede_trade_mark,first_minimum_amt=v_first_minimum_amt,minimum_subscription_amt=v_minimum_subscription_amt,minimum_purchase_amt=v_minimum_purchase_amt,minimum_rede_share=v_minimum_rede_share,minimum_holding_share=v_minimum_holding_share,minimum_turning_out_share=v_minimum_turning_out_share,rede_money_to_account_days=v_rede_money_to_account_days,registration_agency = v_registration_agency,time_stamp = v_time_stamp where exch_no=v_exch_no and stock_code=v_stock_code;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.318.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_基金属性信息表][{记录序号}][@记录序号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select row_id into v_row_id from db_pub.tb_basesedt_fund_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.318.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_code, "|", v_stock_name, "|", v_fund_kind, "|", v_fund_manager, "|", v_fund_trustee, "|", v_distribution_scale, "|", v_charging_method, "|", v_default_divide_type, "|", v_fund_found_date, "|", v_fund_expire_date, "|", v_subscription_trade_mark, "|", v_purchase_trade_mark, "|", v_rede_trade_mark, "|", v_first_minimum_amt, "|", v_minimum_subscription_amt, "|", v_minimum_purchase_amt, "|", v_minimum_rede_share, "|", v_minimum_holding_share, "|", v_minimum_turning_out_share, "|", v_rede_money_to_account_days, "|", v_registration_agency, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_基金属性信息流水表][字段][字段变量][5][@市场编号#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_fund_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, exch_no, 
        stock_code, stock_code_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_exch_no, 
        v_stock_code, v_stock_code_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.318.5";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_删除基金属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_DeleteFundInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_DeleteFundInfo(
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
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_stock_code_no int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_stock_code = p_stock_code;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_stock_code_no = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @流水变动字段# = " "; */
    set v_jour_occur_field = " ";

    /* set @流水变动信息# = " " ; */
    set v_jour_occur_info = " " ;

    /* [获取表记录变量][公共_证券基础数据_基金属性信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select stock_code_no into v_stock_code_no from db_pub.tb_basesedt_fund_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.319.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_基金属性信息表][{市场编号}=@市场编号# and {证券代码}=@证券代码#][3][@市场编号#,@证券代码#] */
    delete from db_pub.tb_basesedt_fund_info 
        where exch_no=v_exch_no and stock_code=v_stock_code;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.319.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# =" " ; */
    set v_jour_after_occur_info =" " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_基金属性信息流水表][字段][字段变量][5][@市场编号#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_fund_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, exch_no, 
        stock_code, stock_code_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_exch_no, 
        v_stock_code, v_stock_code_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.319.5";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询基金属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryFundInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryFundInfo(
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
    

    /* [获取表记录][公共_证券基础数据_基金属性信息表][字段][(@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码# = " " or {证券代码} = @证券代码#) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, stock_code_no, stock_name, fund_kind, 
        fund_manager, fund_trustee, distribution_scale, charging_method, 
        default_divide_type, fund_found_date, fund_expire_date, subscription_trade_mark, 
        purchase_trade_mark, rede_trade_mark, first_minimum_amt, minimum_subscription_amt, 
        minimum_purchase_amt, minimum_rede_share, minimum_holding_share, minimum_turning_out_share, 
        rede_money_to_account_days, registration_agency, time_stamp from db_pub.tb_basesedt_fund_info where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, stock_code_no, stock_name, fund_kind, 
        fund_manager, fund_trustee, distribution_scale, charging_method, 
        default_divide_type, fund_found_date, fund_expire_date, subscription_trade_mark, 
        purchase_trade_mark, rede_trade_mark, first_minimum_amt, minimum_subscription_amt, 
        minimum_purchase_amt, minimum_rede_share, minimum_holding_share, minimum_turning_out_share, 
        rede_money_to_account_days, registration_agency, time_stamp from db_pub.tb_basesedt_fund_info where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取基金属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetFundInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetFundInfo(
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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_基金属性信息表][字段][字段变量][{市场编号}=@市场编号# and {证券代码} = @证券代码#][4][@市场编号#,@证券代码#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, stock_code_no, stock_name, fund_kind, 
        fund_manager, fund_trustee, distribution_scale, charging_method, 
        default_divide_type, fund_found_date, fund_expire_date, subscription_trade_mark, 
        purchase_trade_mark, rede_trade_mark, first_minimum_amt, minimum_subscription_amt, 
        minimum_purchase_amt, minimum_rede_share, minimum_holding_share, minimum_turning_out_share, 
        rede_money_to_account_days, registration_agency, time_stamp into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_exch_no, 
        v_stock_code, v_stock_code_no, v_stock_name, v_fund_kind, 
        v_fund_manager, v_fund_trustee, v_distribution_scale, v_charging_method, 
        v_default_divide_type, v_fund_found_date, v_fund_expire_date, v_subscription_trade_mark, 
        v_purchase_trade_mark, v_rede_trade_mark, v_first_minimum_amt, v_minimum_subscription_amt, 
        v_minimum_purchase_amt, v_minimum_rede_share, v_minimum_holding_share, v_minimum_turning_out_share, 
        v_rede_money_to_account_days, v_registration_agency, v_time_stamp from db_pub.tb_basesedt_fund_info where exch_no=v_exch_no and stock_code = v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.321.4";
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

# 原子_公共_证券基础数据_查询基金属性流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryFundInfoJour;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryFundInfoJour(
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
    

    /* [获取表记录][公共_证券基础数据_基金属性信息流水表][字段][{初始化日期}<=@初始化日期# and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码# = " " or {证券代码} = @证券代码#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code, stock_code_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_basesedt_fund_info_jour where init_date<=v_init_date and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code, stock_code_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_basesedt_fund_info_jour where init_date<=v_init_date and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询历史基金属性流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryFundInfoJourHis;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryFundInfoJourHis(
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
    

    /* [获取表记录][历史_公共_证券基础数据_基金属性信息流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码# = " " or {证券代码} = @证券代码#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code, stock_code_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_basesedt_fund_info_jour_his where (init_date between v_begin_date and v_end_date) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code, stock_code_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_basesedt_fund_info_jour_his where (init_date between v_begin_date and v_end_date) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code = " " or stock_code = v_stock_code) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询新股开板监控信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryNewStockMonitor;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryNewStockMonitor(
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
    

    /* [获取表记录][公共_证券基础数据_证券新股开板监控信息表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and(@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码#=" " or {证券代码}=@证券代码#) and {记录序号}>@记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        exch_no, stock_code, stock_name, trade_code, 
        target_code, stock_code_no, trade_code_no, target_code_no, 
        apply_date, apply_limit, begin_trade_date, issue_price, 
        warn_trade_amount, warn_buy_amount, warn_auto_sell, is_warn, 
        stock_open_date, stock_open_price, strike_qty, buy_qty_1, 
        last_price, up_limit_price from db_pub.tb_basesedt_new_stock_monitor_info where (v_co_no=0 or co_no=v_co_no) and(v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=" " or stock_code=v_stock_code) and row_id>v_row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        exch_no, stock_code, stock_name, trade_code, 
        target_code, stock_code_no, trade_code_no, target_code_no, 
        apply_date, apply_limit, begin_trade_date, issue_price, 
        warn_trade_amount, warn_buy_amount, warn_auto_sell, is_warn, 
        stock_open_date, stock_open_price, strike_qty, buy_qty_1, 
        last_price, up_limit_price from db_pub.tb_basesedt_new_stock_monitor_info where (v_co_no=0 or co_no=v_co_no) and(v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=" " or stock_code=v_stock_code) and row_id>v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_新增新股开板监控信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_AddNewStockMonitor;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_AddNewStockMonitor(
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
    declare v_time_stamp int;
    declare v_stock_open_date int;
    declare v_co_no int;
    declare v_stock_open_price decimal(16,9);
    declare v_is_warn int;
    declare v_strike_qty decimal(18,2);
    declare v_buy_qty_1 decimal(18,2);
    declare v_up_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
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
    SET v_warn_trade_amount = p_warn_trade_amount;
    SET v_warn_buy_amount = p_warn_buy_amount;
    SET v_warn_auto_sell = p_warn_auto_sell;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_stock_open_date = 0;
    SET v_co_no = 0;
    SET v_stock_open_price = 0;
    SET v_is_warn = 0;
    SET v_strike_qty = 0;
    SET v_buy_qty_1 = 0;
    SET v_up_limit_price = 0;
    SET v_last_price = 0;
    SET v_stock_name = " ";
    SET v_trade_code = " ";
    SET v_target_code = " ";
    SET v_stock_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_apply_date = 0;
    SET v_apply_limit = 0;
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_issue_price = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* set @开板日期# = date_format(curdate(),'%Y%m%d'); */
    set v_stock_open_date = date_format(curdate(),'%Y%m%d');

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* set @开板价格# = 0; */
    set v_stock_open_price = 0;

    /* set @是否触警# = 2; */
    set v_is_warn = 2;

    /* set @成交数量# = 0; */
    set v_strike_qty = 0;

    /* set @买一量# = 0; */
    set v_buy_qty_1 = 0;

    /* set @涨停价# = 0; */
    set v_up_limit_price = 0;

    /* set @最新价# = 0; */
    set v_last_price = 0;

    /* [获取表记录变量][公共_证券基础数据_证券新股代码信息表][{证券名称},{交易代码},{标的代码},{证券代码编号},{交易代码编号},{标的代码编号},{申购日期},{申购上限},{上市日期},{发行价}][@证券名称#,@交易代码#,@标的代码#,@证券代码编号#,@交易代码编号#,@标的代码编号#,@申购日期#,@申购上限#,@上市日期#,@发行价#][{市场编号}=@市场编号# and {交易代码} = @证券代码#][4][@市场编号#,@证券代码#] */
    select stock_name,trade_code,target_code,stock_code_no,trade_code_no,target_code_no,apply_date,apply_limit,begin_trade_date,issue_price into v_stock_name,v_trade_code,v_target_code,v_stock_code_no,v_trade_code_no,v_target_code_no,v_apply_date,v_apply_limit,v_begin_trade_date,v_issue_price from db_pub.tb_basesedt_new_stock_code_info where exch_no=v_exch_no and trade_code = v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.152.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [插入表记录][公共_证券基础数据_证券新股开板监控信息表][字段][字段变量][1][@证券代码#, @市场编号#]

 */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_new_stock_monitor_info(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, exch_no, 
        stock_code, stock_name, trade_code, target_code, 
        stock_code_no, trade_code_no, target_code_no, apply_date, 
        apply_limit, begin_trade_date, issue_price, warn_trade_amount, 
        warn_buy_amount, warn_auto_sell, is_warn, stock_open_date, 
        stock_open_price, strike_qty, buy_qty_1, last_price, 
        up_limit_price) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_exch_no, 
        v_stock_code, v_stock_name, v_trade_code, v_target_code, 
        v_stock_code_no, v_trade_code_no, v_target_code_no, v_apply_date, 
        v_apply_limit, v_begin_trade_date, v_issue_price, v_warn_trade_amount, 
        v_warn_buy_amount, v_warn_auto_sell, v_is_warn, v_stock_open_date, 
        v_stock_open_price, v_strike_qty, v_buy_qty_1, v_last_price, 
        v_up_limit_price);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.152.1";
        SET v_error_info =  CONCAT(concat("证券代码=",v_stock_code,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_修改新股开板监控信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_ModiNewStockMonitor;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_ModiNewStockMonitor(
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
    declare v_time_stamp int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_row_id = p_row_id;
    SET v_warn_trade_amount = p_warn_trade_amount;
    SET v_warn_buy_amount = p_warn_buy_amount;
    SET v_warn_auto_sell = p_warn_auto_sell;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_stock_code = " ";

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [更新表记录][公共_证券基础数据_证券新股开板监控信息表][{触警成交量}=@触警成交量#,{触警买一数量}=@触警买一数量#,{触警是否自动卖出}=@触警是否自动卖出#][{记录序号}=@记录序号#][2][@证券代码#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_new_stock_monitor_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, warn_trade_amount=v_warn_trade_amount,warn_buy_amount=v_warn_buy_amount,warn_auto_sell=v_warn_auto_sell where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.153.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_删除新股开板监控信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_DeleteNewStockMonitor;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_DeleteNewStockMonitor(
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
    

    /* [删除表记录][公共_证券基础数据_证券新股开板监控信息表][{记录序号}=@记录序号#][3][@记录序号#] */
    delete from db_pub.tb_basesedt_new_stock_monitor_info 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.154.3";
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

# 原子_公共_证券基础数据_查询触警新股信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryTriggerNewStock;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryTriggerNewStock(
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
    
    SELECT b.row_id, b.warn_buy_amount,b.warn_trade_amount,b.warn_auto_sell, a.stock_code,a.stock_name, b.exch_no, a.last_price,  b.co_no,a.up_limit_price, a.buy_qty_1,  a.strike_qty  
       FROM db_pub.tb_basesedt_stock_quot a,db_pub.tb_basesedt_new_stock_monitor_info b  
    WHERE
     a.stock_code = b.trade_code
    AND (
     a.last_price < a.up_limit_price
     OR (
      b.warn_buy_amount > a.buy_qty_1
      AND b.warn_buy_amount != 0
     )
     OR (
      b.warn_trade_amount < a.strike_qty
      and b.warn_trade_amount !=0
     ));
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_更新新股触警信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_updateMonitorInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_updateMonitorInfo(
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
    declare v_time_stamp int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_row_id = p_row_id;
    SET v_strike_qty = p_strike_qty;
    SET v_buy_qty_1 = p_buy_qty_1;
    SET v_up_limit_price = p_up_limit_price;
    SET v_last_price = p_last_price;
    SET v_is_warn = p_is_warn;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_stock_code = " ";

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


    /* [更新表记录][公共_证券基础数据_证券新股开板监控信息表][{成交数量}=@成交数量#,{买一量}=@买一量#,{涨停价}=@涨停价#,{最新价}=@最新价#,{是否触警}=@是否触警#][{记录序号}=@记录序号#][2][@证券代码#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_new_stock_monitor_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_qty=v_strike_qty,buy_qty_1=v_buy_qty_1,up_limit_price=v_up_limit_price,last_price=v_last_price,is_warn=v_is_warn where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.156.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询所有新股信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryAllNewStock;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryAllNewStock(
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
    

    /* [获取表记录][公共_证券基础数据_证券新股代码信息表][字段][(@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码#=" " or {证券代码}=@证券代码#) and {记录序号}>@记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, stock_name, trade_code, target_code, 
        stock_code_no, trade_code_no, target_code_no, apply_date, 
        apply_limit, begin_trade_date, issue_price from db_pub.tb_basesedt_new_stock_code_info where (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=" " or stock_code=v_stock_code) and row_id>v_row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, stock_name, trade_code, target_code, 
        stock_code_no, trade_code_no, target_code_no, apply_date, 
        apply_limit, begin_trade_date, issue_price from db_pub.tb_basesedt_new_stock_code_info where (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=" " or stock_code=v_stock_code) and row_id>v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_新增基金产品对照关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_AddFundPdCompRelation;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_AddFundPdCompRelation(
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
    declare v_stock_code_no int;
    declare v_stock_name varchar(64);
    declare v_pd_no int;
    declare v_co_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_name = p_stock_name;
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][公共_证券基础数据_基金产品对照表][字段][字段变量][1][@证券代码编号#, @市场编号#,@证券代码#,@机构编号#,@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_fund_pd_comparision(
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, stock_code, 
        stock_code_no, stock_name, pd_no, co_no) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_no, v_stock_code, 
        v_stock_code_no, v_stock_name, v_pd_no, v_co_no);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.158.1";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no,",","证券代码=",v_stock_code,",","机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_修改基金产品对照关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_ModifyFundPdCompRelation;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_ModifyFundPdCompRelation(
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
    declare v_tmp_stock_code varchar(6);
    declare v_tmp_exch_no int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_tmp_stock_code = " ";
    SET v_tmp_exch_no = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_基金产品对照表][{证券代码},{市场编号}][@临时_证券代码#,@临时_市场编号#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][4][@机构编号#, @产品编号#] */
    select stock_code,exch_no into v_tmp_stock_code,v_tmp_exch_no from db_pub.tb_basesedt_fund_pd_comparision where co_no=v_co_no and pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.159.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* if @证券代码#=@临时_证券代码# and @市场编号#=@临时_市场编号#  then */
    if v_stock_code=v_tmp_stock_code and v_exch_no=v_tmp_exch_no  then

           /* [更新表记录][公共_证券基础数据_基金产品对照表][{证券名称}=@证券名称#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][2][@机构编号#,@产品编号#] */
           set v_update_date = date_format(curdate(),'%Y%m%d');
           set v_update_time = date_format(curtime(),'%H%i%s');
           update db_pub.tb_basesedt_fund_pd_comparision set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_name=v_stock_name where co_no=v_co_no and pd_no=v_pd_no;
           if v_error_code = "1" then
                       
               SET v_error_code = "pubA.1.159.2";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
               else
                   SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
               end if;
               leave label_pro;
           end if;

    else

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
               SET v_error_code = "pubA.1.159.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场业务记录编号出现错误！',v_mysql_message);
               end if;
               leave label_pro;
           elseif v_error_code <> "0" then
               leave label_pro;
           end if;


           /* set @证券代码编号# = @当前编号#; */
           set v_stock_code_no = v_curr_no;

           /* [更新表记录][公共_证券基础数据_基金产品对照表][{市场编号}=@市场编号#,{证券代码}=@证券代码#,{证券代码编号}=@证券代码编号#,{证券名称}=@证券名称#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][2][@机构编号#,@产品编号#] */
           set v_update_date = date_format(curdate(),'%Y%m%d');
           set v_update_time = date_format(curtime(),'%H%i%s');
           update db_pub.tb_basesedt_fund_pd_comparision set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, exch_no=v_exch_no,stock_code=v_stock_code,stock_code_no=v_stock_code_no,stock_name=v_stock_name where co_no=v_co_no and pd_no=v_pd_no;
           if v_error_code = "1" then
                       
               SET v_error_code = "pubA.1.159.2";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
               else
                   SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
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

# 原子_公共_证券基础数据_查询基金产品对照关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryFundPdCompRelation;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryFundPdCompRelation(
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
    

    /* [获取表记录][公共_证券基础数据_基金产品对照表][字段][(@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码#=" " or {证券代码}=@证券代码#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and {记录序号}>@记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, stock_code_no, stock_name, pd_no, 
        co_no from db_pub.tb_basesedt_fund_pd_comparision where (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=" " or stock_code=v_stock_code) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and row_id>v_row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, stock_code_no, stock_name, pd_no, 
        co_no from db_pub.tb_basesedt_fund_pd_comparision where (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=" " or stock_code=v_stock_code) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and row_id>v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_更新基金产品行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_UpdateFundPdQuot;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_UpdateFundPdQuot(
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
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_last_price decimal(16,9),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_update_times int;
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
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_last_price = p_last_price;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_update_times = 1;
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
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取时间戳][@时间戳#] */
    set v_time_stamp = unix_timestamp();


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

    /* [获取流水变动][{最新价}][@最新价#] */
    set v_jour_occur_field = concat("最新价","|");
    set v_jour_occur_info = concat(v_last_price,"|");


    /* [插入重复更新][公共_证券基础数据_证券行情表][字段][字段变量][{最新价}=@最新价#][1][@证券代码编号#, @市场编号#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, last_price=v_last_price;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.161.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@最新价#] */
    set v_jour_after_occur_info = concat(v_last_price,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券基础数据_证券行情流水表][字段][字段变量][5][@证券代码编号#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_stock_quot_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, stock_code_no, 
        exch_no, stock_code, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_stock_code_no, 
        v_exch_no, v_stock_code, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.161.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_证券行情表][{更新次数}][@更新次数#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#, @市场编号#] */
    select update_times into v_update_times from db_pub.tb_basesedt_stock_quot where stock_code_no=v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.161.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券类型},{资产类型}][@证券类型#,@资产类型#][{市场编号}= @市场编号# and {证券代码}=@证券代码#][4][@证券代码#, @市场编号#] */
    select stock_type,asset_type into v_stock_type,v_asset_type from db_pub.tb_basesedt_stock_code_info where exch_no= v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.161.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码=",v_stock_code,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码=",v_stock_code,","," 市场编号=", v_exch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_删除基金产品对照关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_DeleteFundPdCompRelation;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_DeleteFundPdCompRelation(
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
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_exch_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_基金产品对照表][{证券代码编号},{证券代码},{市场编号}][@证券代码编号#,@证券代码#,@市场编号#][{记录序号}=@记录序号# ][4][@记录序号#] */
    select stock_code_no,stock_code,exch_no into v_stock_code_no,v_stock_code,v_exch_no from db_pub.tb_basesedt_fund_pd_comparision where row_id=v_row_id  limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.1.162.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券基础数据_基金产品对照表][{记录序号}=@记录序号#][3][@记录序号#] */
    delete from db_pub.tb_basesedt_fund_pd_comparision 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.162.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    #[获取表记录变量语句][公共_证券基础数据_证券行情表][{记录序号}][@临时_记录序号#][{证券代码编号}=@证券代码编号#]
    #if @临时_记录序号# <> 0  then
    #      set @流水变动字段# = " ";
    #      set @流水变动信息# = " " ;
    #      [删除表记录][公共_证券基础数据_证券行情表][{记录序号}=@临时_记录序号#][3][@临时_记录序号#]
    #      set @流水后信息# =" " ;
     #     set @操作备注# = "删除产品证券代码对照关系";
    #      set @操作菜单# = @菜单编号#;
     #     set @操作功能# = @功能编码#;
      #    [插入表记录][公共_证券基础数据_证券行情流水表][字段][字段变量][5][@证券代码编号#, @市场编号#]
    #end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_同步场外基金属性信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_SyncOffSiteFundAttrInf;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_SyncOffSiteFundAttrInf(
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
    declare v_stock_code_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
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
    SET v_time_stamp = unix_timestamp();
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @时间戳# = unix_timestamp(); */
    set v_time_stamp = unix_timestamp();

    /* [插入表记录][公共_证券基础数据_基金属性信息表][字段][字段变量][1][@市场编号#, @证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_fund_info(
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, stock_code, 
        stock_code_no, stock_name, fund_kind, fund_manager, 
        fund_trustee, distribution_scale, charging_method, default_divide_type, 
        fund_found_date, fund_expire_date, subscription_trade_mark, purchase_trade_mark, 
        rede_trade_mark, first_minimum_amt, minimum_subscription_amt, minimum_purchase_amt, 
        minimum_rede_share, minimum_holding_share, minimum_turning_out_share, rede_money_to_account_days, 
        registration_agency, time_stamp) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_no, v_stock_code, 
        v_stock_code_no, v_stock_name, v_fund_kind, v_fund_manager, 
        v_fund_trustee, v_distribution_scale, v_charging_method, v_default_divide_type, 
        v_fund_found_date, v_fund_expire_date, v_subscription_trade_mark, v_purchase_trade_mark, 
        v_rede_trade_mark, v_first_minimum_amt, v_minimum_subscription_amt, v_minimum_purchase_amt, 
        v_minimum_rede_share, v_minimum_holding_share, v_minimum_turning_out_share, v_rede_money_to_account_days, 
        v_registration_agency, v_time_stamp);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.163.1";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取产品基本信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetPdBasicInf;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetPdBasicInf(
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
    

    /* [获取表全记录][公共_证券基础数据_产品基本信息][字段][1=1] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, link_row_id, 
        stock_code, stock_name, fund_manager, registration_agency from db_pub.tb_basesedt_pd_basic_inf where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取产品扩展信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetPdExpandInf;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetPdExpandInf(
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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_证券基础数据_产品扩展信息表][字段][字段变量][{关联记录序号}=@关联记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, link_row_id, 
        fund_trustee, distribution_scale, charging_method, default_divide_type, 
        fund_found_date, fund_expire_date, subscription_trade_mark, purchase_trade_mark, 
        rede_trade_mark into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_link_row_id, 
        v_fund_trustee, v_distribution_scale, v_charging_method, v_default_divide_type, 
        v_fund_found_date, v_fund_expire_date, v_subscription_trade_mark, v_purchase_trade_mark, 
        v_rede_trade_mark from db_pub.tb_basesedt_pd_expand_inf where link_row_id=v_link_row_id limit 1;

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

# 原子_公共_证券基础数据_查询特殊证券行情计算单位
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QuerySpecStockQuotCalcUnit;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QuerySpecStockQuotCalcUnit(
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
    

    /* [获取表记录][公共_证券基础数据_特殊证券行情信息表][字段][(@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码#=" " or {证券代码}=@证券代码#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#)and {记录序号}>@记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, stock_code_no, quot_calc_unit from db_pub.tb_basesedt_specail_stock_quot_info where (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=" " or stock_code=v_stock_code) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no)and row_id>v_row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, stock_code_no, quot_calc_unit from db_pub.tb_basesedt_specail_stock_quot_info where (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=" " or stock_code=v_stock_code) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no)and row_id>v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_设置特殊证券行情计算单位
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_UpdateSpecStockQuotCalcUnit;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_UpdateSpecStockQuotCalcUnit(
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
    IN p_quot_calc_unit decimal(16,9),
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_quot_calc_unit decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_times int;
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_quot_calc_unit = p_quot_calc_unit;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [插入重复更新][公共_证券基础数据_特殊证券行情信息表][字段][字段变量][{行情计算单位}=@行情计算单位#][1][@市场编号#,@证券代码#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesedt_specail_stock_quot_info (
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, stock_code, 
        stock_code_no, quot_calc_unit) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_no, v_stock_code, 
        v_stock_code_no, v_quot_calc_unit) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, quot_calc_unit=v_quot_calc_unit;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.1.167.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][公共_证券基础数据_特殊证券行情信息表][{更新次数}][@更新次数#][{证券代码编号}=@证券代码编号#] */
    select update_times into v_update_times from db_pub.tb_basesedt_specail_stock_quot_info where stock_code_no=v_stock_code_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_删除特殊证券行情计算单位
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_DeleteSpecStockQuotCalcUnit;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_DeleteSpecStockQuotCalcUnit(
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
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_quot_calc_unit = 0;
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_证券基础数据_特殊证券行情信息表][字段][字段变量][{记录序号}=@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code, stock_code_no, quot_calc_unit into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_exch_no, 
        v_stock_code, v_stock_code_no, v_quot_calc_unit from db_pub.tb_basesedt_specail_stock_quot_info where row_id=v_row_id limit 1;


    /* [删除表记录][公共_证券基础数据_特殊证券行情信息表][{记录序号}=@记录序号#][3][@记录序号#,@证券代码编号#] */
    delete from db_pub.tb_basesedt_specail_stock_quot_info 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.1.168.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* set @更新次数# = @更新次数#+1; */
    set v_update_times = v_update_times+1;
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

# 原子_公共_证券基础数据_初始化证券行情涨跌停价
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_InitStockQuotLimitMovePrice;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_InitStockQuotLimitMovePrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_no_exch_date_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_no_exch_date_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_date int;
    declare v_deal_count int;
    declare v_tmp_begin_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_no_exch_date_str = p_no_exch_date_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_deal_count = 0;
    SET v_tmp_begin_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    
    #先倒推出5个交易日前，科创板前5个工作日 不设涨跌停价。

    /* set  @开始日期# = @初始化日期#; */
    set  v_begin_date = v_init_date;

    /* set  @处理次数# = 0; */
    set  v_deal_count = 0;
    loop_label:loop

        /* set @临时_开始日期# = DATE_FORMAT(SUBDATE(@开始日期#,1),"%Y%m%d"); */
        set v_tmp_begin_date = DATE_FORMAT(SUBDATE(v_begin_date,1),"%Y%m%d");

        /* if dayofweek(@临时_开始日期#) <> 7 and dayofweek(@临时_开始日期#) <> 1 and instr(@非交易日期串#, concat(";", @临时_开始日期#, ";")) = 0 then */
        if dayofweek(v_tmp_begin_date) <> 7 and dayofweek(v_tmp_begin_date) <> 1 and instr(v_no_exch_date_str, concat(";", v_tmp_begin_date, ";")) = 0 then

            /* set @处理次数# = @处理次数# + 1; */
            set v_deal_count = v_deal_count + 1;

            /* if  @处理次数# = 5 then */
            if  v_deal_count = 5 then
               leave loop_label;
            end if;
        end if;

        /* set @开始日期# = @临时_开始日期#; */
        set v_begin_date = v_tmp_begin_date;
    end loop;
    #上市日期大于此日期的 科创板代码不设涨跌停

    /* set  @开始日期# = @临时_开始日期#; */
    set  v_begin_date = v_tmp_begin_date;
    #根据证券的最小价差计算 涨跌停价的 精度。
    #最小价差0.01 保留2位

    /* UPDATE ~公共_证券基础数据_证券行情表^ t1 SET t1.{更新日期}=date_format(curdate(),'%Y%m%d'),t1.{更新时间}=date_format(curtime(),'%H%i%s'),t1.{涨停价}=ROUND(t1.{昨收盘价}*1.1,2),t1.{跌停价}=ROUND(t1.{昨收盘价}*0.9,2)  WHERE t1.{市场编号} IN (1,2) AND t1.{证券代码编号} IN(SELECT t2.{证券代码编号}  FROM ~公共_证券基础数据_证券代码信息表^ t2 WHERE t2.{市场编号} IN(1,2) AND t2.{最小价差}=0.01 AND (t2.{证券类型} between 1 and 8 or t2.{证券类型} between 51 and 64)); */
    UPDATE db_pub.tb_basesedt_stock_quot t1 SET t1.update_date=date_format(curdate(),'%Y%m%d'),t1.update_time=date_format(curtime(),'%H%i%s'),t1.up_limit_price=ROUND(t1.pre_close_price*1.1,2),t1.down_limit_price=ROUND(t1.pre_close_price*0.9,2)  WHERE t1.exch_no IN (1,2) AND t1.stock_code_no IN(SELECT t2.stock_code_no  FROM db_pub.tb_basesedt_stock_code_info t2 WHERE t2.exch_no IN(1,2) AND t2.step_price=0.01 AND (t2.stock_type between 1 and 8 or t2.stock_type between 51 and 64));
    #科创板上市5天后 20%

    /* UPDATE ~公共_证券基础数据_证券行情表^ t1 SET t1.{更新日期}=date_format(curdate(),'%Y%m%d'),t1.{更新时间}=date_format(curtime(),'%H%i%s'),t1.{涨停价}=ROUND(t1.{昨收盘价}*1.2,2),t1.{跌停价}=ROUND(t1.{昨收盘价}*0.8,2)  WHERE t1.{市场编号} =1  AND   t1.{证券代码}>=688000 and t1.{证券代码}<=688999; */
    UPDATE db_pub.tb_basesedt_stock_quot t1 SET t1.update_date=date_format(curdate(),'%Y%m%d'),t1.update_time=date_format(curtime(),'%H%i%s'),t1.up_limit_price=ROUND(t1.pre_close_price*1.2,2),t1.down_limit_price=ROUND(t1.pre_close_price*0.8,2)  WHERE t1.exch_no =1  AND   t1.stock_code>=688000 and t1.stock_code<=688999;
    #最小价差0.001 保留3位

    /* UPDATE ~公共_证券基础数据_证券行情表^ t1 SET t1.{更新日期}=date_format(curdate(),'%Y%m%d'),t1.{更新时间}=date_format(curtime(),'%H%i%s'),t1.{涨停价}=ROUND(t1.{昨收盘价}*1.1,3),t1.{跌停价}=ROUND(t1.{昨收盘价}*0.9,3)  WHERE t1.{市场编号} IN (1,2) AND t1.{证券代码编号} IN(SELECT t2.{证券代码编号}  FROM ~公共_证券基础数据_证券代码信息表^ t2 WHERE t2.{市场编号} IN(1,2) AND t2.{最小价差}=0.001 AND (t2.{证券类型} between 1 and 8 or t2.{证券类型} between 51 and 64)); */
    UPDATE db_pub.tb_basesedt_stock_quot t1 SET t1.update_date=date_format(curdate(),'%Y%m%d'),t1.update_time=date_format(curtime(),'%H%i%s'),t1.up_limit_price=ROUND(t1.pre_close_price*1.1,3),t1.down_limit_price=ROUND(t1.pre_close_price*0.9,3)  WHERE t1.exch_no IN (1,2) AND t1.stock_code_no IN(SELECT t2.stock_code_no  FROM db_pub.tb_basesedt_stock_code_info t2 WHERE t2.exch_no IN(1,2) AND t2.step_price=0.001 AND (t2.stock_type between 1 and 8 or t2.stock_type between 51 and 64));
    #最小价差0.005 保留3位
    #UPDATE ~公共_证券基础数据_证券行情表^ t1 SET t1.{更新日期}=date_format(curdate(),'%Y%m%d'),t1.{更新时间}=date_format(curtime(),'%H%i%s'),t1.{涨停价}=0.005*ROUND(t1.{昨收盘价}*1.1/0.005),t1.{跌停价}=0.005*ROUND(t1.{昨收盘价}*0.9/0.005)    WHERE t1.{市场编号} IN (1,2) AND t1.{证券代码编号} IN(SELECT t2.{证券代码编号}  FROM ~公共_证券基础数据_证券代码信息表^ t2 WHERE t2.{市场编号} IN(1,2) AND t2.{最小价差}=0.005);
    #新股上市日，涨幅 44%，跌幅36%

    /* UPDATE ~公共_证券基础数据_证券行情表^ t1 SET t1.{更新日期}=date_format(curdate(),'%Y%m%d'),t1.{更新时间}=date_format(curtime(),'%H%i%s'),t1.{涨停价}=ROUND(t1.{昨收盘价}*1.44,2),t1.{跌停价}=ROUND(t1.{昨收盘价}*0.64,2)  WHERE t1.{市场编号} IN (1,2) AND t1.{证券代码编号} IN(SELECT t2.{证券代码编号}  FROM ~公共_证券基础数据_证券代码信息表^ t2,~公共_证券基础数据_证券新股代码信息表^ t3 WHERE t2.{市场编号} IN(1,2)  AND t2.{证券类型}=《证券类型-股票》 and t3.{上市日期}=@初始化日期# and t2.{市场编号}=t3.{市场编号} and t2.{证券代码}=t3.{交易代码}); */
    UPDATE db_pub.tb_basesedt_stock_quot t1 SET t1.update_date=date_format(curdate(),'%Y%m%d'),t1.update_time=date_format(curtime(),'%H%i%s'),t1.up_limit_price=ROUND(t1.pre_close_price*1.44,2),t1.down_limit_price=ROUND(t1.pre_close_price*0.64,2)  WHERE t1.exch_no IN (1,2) AND t1.stock_code_no IN(SELECT t2.stock_code_no  FROM db_pub.tb_basesedt_stock_code_info t2,db_pub.tb_basesedt_new_stock_code_info t3 WHERE t2.exch_no IN(1,2)  AND t2.stock_type=1 and t3.begin_trade_date=v_init_date and t2.exch_no=t3.exch_no and t2.stock_code=t3.trade_code);
    #ST股票 涨跌幅限制5%

    /* UPDATE ~公共_证券基础数据_证券行情表^ t1 SET t1.{更新日期}=date_format(curdate(),'%Y%m%d'),t1.{更新时间}=date_format(curtime(),'%H%i%s'),t1.{涨停价}=ROUND(t1.{昨收盘价}*1.05,2),t1.{跌停价}=ROUND(t1.{昨收盘价}*0.95,2)  WHERE t1.{市场编号} IN (1,2)  and (t1.{证券名称} like "ST%" or t1.{证券名称} like "*ST%" or t1.{证券名称} like "SST%" or t1.{证券名称} like "S*ST%") AND t1.{证券代码编号} IN(SELECT t2.{证券代码编号}  FROM ~公共_证券基础数据_证券代码信息表^ t2 WHERE t2.{市场编号} IN(1,2)  AND t2.{证券类型}=《证券类型-股票》); */
    UPDATE db_pub.tb_basesedt_stock_quot t1 SET t1.update_date=date_format(curdate(),'%Y%m%d'),t1.update_time=date_format(curtime(),'%H%i%s'),t1.up_limit_price=ROUND(t1.pre_close_price*1.05,2),t1.down_limit_price=ROUND(t1.pre_close_price*0.95,2)  WHERE t1.exch_no IN (1,2)  and (t1.stock_name like "ST%" or t1.stock_name like "*ST%" or t1.stock_name like "SST%" or t1.stock_name like "S*ST%") AND t1.stock_code_no IN(SELECT t2.stock_code_no  FROM db_pub.tb_basesedt_stock_code_info t2 WHERE t2.exch_no IN(1,2)  AND t2.stock_type=1);
    #科创板上市前5天，涨停价 10000，跌停价0.001

    /* UPDATE ~公共_证券基础数据_证券行情表^ t1 SET t1.{更新日期}=date_format(curdate(),'%Y%m%d'),t1.{更新时间}=date_format(curtime(),'%H%i%s'),t1.{涨停价}=1000000,t1.{跌停价}=0.001  WHERE t1.{市场编号} =1 AND t1.{证券代码编号} IN(SELECT t2.{证券代码编号}  FROM ~公共_证券基础数据_证券代码信息表^ t2,~公共_证券基础数据_证券新股代码信息表^ t3 WHERE t2.{市场编号} =1  AND t2.{证券类型}=《证券类型-股票》 and t3.{上市日期}>@开始日期# and t2.{市场编号}=t3.{市场编号} and t2.{证券代码}=t3.{交易代码} and t3.{交易代码}>=688000 and t3.{交易代码}<=688999); */
    UPDATE db_pub.tb_basesedt_stock_quot t1 SET t1.update_date=date_format(curdate(),'%Y%m%d'),t1.update_time=date_format(curtime(),'%H%i%s'),t1.up_limit_price=1000000,t1.down_limit_price=0.001  WHERE t1.exch_no =1 AND t1.stock_code_no IN(SELECT t2.stock_code_no  FROM db_pub.tb_basesedt_stock_code_info t2,db_pub.tb_basesedt_new_stock_code_info t3 WHERE t2.exch_no =1  AND t2.stock_type=1 and t3.begin_trade_date>v_begin_date and t2.exch_no=t3.exch_no and t2.stock_code=t3.trade_code and t3.trade_code>=688000 and t3.trade_code<=688999);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_获取证券信息根据代码及市场
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_GetStockInfoByCodeAndExch;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_GetStockInfoByCodeAndExch(
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
    
    #根据证券代码以及交易市场查询证券代码信息

    /* set  @证券代码编号# = 0; */
    set  v_stock_code_no = 0;

    /* set  @证券类型# = 0; */
    set  v_stock_type = 0;

    /* select {证券代码编号} , {证券类型} into @证券代码编号#, @证券类型# from db_pub.tb_basesedt_stock_code_info where {证券代码} = @证券代码# and {市场编号} = @市场编号# limit 1; */
    select stock_code_no , stock_type into v_stock_code_no, v_stock_type from db_pub.tb_basesedt_stock_code_info where stock_code = v_stock_code and exch_no = v_exch_no limit 1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_type = v_stock_type;
    SET p_stock_code_no = v_stock_code_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券基础数据_查询证券收盘价
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesedt_QueryStockClosePrice;;
DELIMITER ;;
CREATE PROCEDURE pra_basesedt_QueryStockClosePrice(
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
    

    /* [获取表记录][公共_证券基础数据_证券行情表][字段][(@证券代码#=" " or {证券代码} = @证券代码#) and (@市场编号#=0 or {市场编号} = @市场编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, stock_code_no, 
        exch_no, stock_code, stock_name, up_limit_price, 
        down_limit_price, last_price, pre_close_price, today_open_price, 
        today_close_price, today_max_price, today_min_price, buy_price_1, 
        buy_qty_1, buy_price_2, buy_qty_2, buy_price_3, 
        buy_qty_3, buy_price_4, buy_qty_4, buy_price_5, 
        buy_qty_5, sell_price_1, sell_qty_1, sell_price_2, 
        sell_qty_2, sell_price_3, sell_qty_3, sell_price_4, 
        sell_qty_4, sell_price_5, sell_qty_5, strike_qty, 
        strike_amt, pe_ratio, time_stamp from db_pub.tb_basesedt_stock_quot where (v_stock_code=" " or stock_code = v_stock_code) and (v_exch_no=0 or exch_no = v_exch_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, stock_code_no, 
        exch_no, stock_code, stock_name, up_limit_price, 
        down_limit_price, last_price, pre_close_price, today_open_price, 
        today_close_price, today_max_price, today_min_price, buy_price_1, 
        buy_qty_1, buy_price_2, buy_qty_2, buy_price_3, 
        buy_qty_3, buy_price_4, buy_qty_4, buy_price_5, 
        buy_qty_5, sell_price_1, sell_qty_1, sell_price_2, 
        sell_qty_2, sell_price_3, sell_qty_3, sell_price_4, 
        sell_qty_4, sell_price_5, sell_qty_5, strike_qty, 
        strike_amt, pe_ratio, time_stamp from db_pub.tb_basesedt_stock_quot where (v_stock_code=" " or stock_code = v_stock_code) and (v_exch_no=0 or exch_no = v_exch_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


