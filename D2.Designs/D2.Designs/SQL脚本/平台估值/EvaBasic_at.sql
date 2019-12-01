DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_增加估值科目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_AddFinaName;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_AddFinaName(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_fina_acco_code varchar(64),
    IN p_fina_acco_name varchar(64),
    IN p_fina_acco_level int,
    IN p_exch_no_str varchar(2048),
    IN p_pd_asset_type_str varchar(64),
    IN p_pd_fee_type_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_fina_acco_code varchar(64);
    declare v_fina_acco_name varchar(64);
    declare v_fina_acco_level int;
    declare v_exch_no_str varchar(2048);
    declare v_pd_asset_type_str varchar(64);
    declare v_pd_fee_type_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_field_order int;
    declare v_config_str varchar(2048);
    declare v_eva_check_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_fina_acco_code = p_fina_acco_code;
    SET v_fina_acco_name = p_fina_acco_name;
    SET v_fina_acco_level = p_fina_acco_level;
    SET v_exch_no_str = p_exch_no_str;
    SET v_pd_asset_type_str = p_pd_asset_type_str;
    SET v_pd_fee_type_str = p_pd_fee_type_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_field_order = 0;
    SET v_config_str = " ";
    SET v_eva_check_type = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
    set v_exch_no_str = concat(";", v_exch_no_str, ";");

    /* set @产品资产类型串# = concat(";", @产品资产类型串#, ";"); */
    set v_pd_asset_type_str = concat(";", v_pd_asset_type_str, ";");

    /* set @产品费用类型串# = concat(";", @产品费用类型串#, ";"); */
    set v_pd_fee_type_str = concat(";", v_pd_fee_type_str, ";");

    /* set @字段列号#=0; */
    set v_field_order=0;

    /* set @参数配置串#=' '; */
    set v_config_str=' ';

    /* set @估值核对类型#=0; */
    set v_eva_check_type=0;

    /* [插入表记录][平台估值_基础参数_估值科目表][字段][字段变量][13010101][@机构编号#, @科目代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evabasic_account_name(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        fina_acco_code, fina_acco_name, fina_acco_level, field_order, 
        eva_check_type, config_str, pd_asset_type_str, pd_fee_type_str) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_fina_acco_code, v_fina_acco_name, v_fina_acco_level, v_field_order, 
        v_eva_check_type, v_config_str, v_pd_asset_type_str, v_pd_fee_type_str);
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.1.1.13010101";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,","," 科目代码=", v_fina_acco_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_修改估值科目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_ModiFinaName;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_ModiFinaName(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_fina_acco_code varchar(64),
    IN p_fina_acco_name varchar(64),
    IN p_fina_acco_level int,
    IN p_exch_no_str varchar(2048),
    IN p_pd_asset_type_str varchar(64),
    IN p_pd_fee_type_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_fina_acco_code varchar(64);
    declare v_fina_acco_name varchar(64);
    declare v_fina_acco_level int;
    declare v_exch_no_str varchar(2048);
    declare v_pd_asset_type_str varchar(64);
    declare v_pd_fee_type_str varchar(64);
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
    SET v_co_no = p_co_no;
    SET v_fina_acco_code = p_fina_acco_code;
    SET v_fina_acco_name = p_fina_acco_name;
    SET v_fina_acco_level = p_fina_acco_level;
    SET v_exch_no_str = p_exch_no_str;
    SET v_pd_asset_type_str = p_pd_asset_type_str;
    SET v_pd_fee_type_str = p_pd_fee_type_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
    set v_exch_no_str = concat(";", v_exch_no_str, ";");

    /* set @产品资产类型串# = concat(";", @产品资产类型串#, ";"); */
    set v_pd_asset_type_str = concat(";", v_pd_asset_type_str, ";");

    /* set @产品费用类型串# = concat(";", @产品费用类型串#, ";"); */
    set v_pd_fee_type_str = concat(";", v_pd_fee_type_str, ";");

    /* [更新表记录][平台估值_基础参数_估值科目表][{科目名称}=@科目名称#, {科目级别}=@科目级别#, {市场编号串}=@市场编号串#, {产品资产类型串}=@产品资产类型串#, {产品费用类型串}=@产品费用类型串#][{机构编号}=@机构编号# and {科目代码}=@科目代码# or {记录序号}=@记录序号#][13010201][ @机构编号#, @科目代码#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evabasic_account_name set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, fina_acco_name=v_fina_acco_name, fina_acco_level=v_fina_acco_level, exch_no_str=v_exch_no_str, pd_asset_type_str=v_pd_asset_type_str, pd_fee_type_str=v_pd_fee_type_str where co_no=v_co_no and fina_acco_code=v_fina_acco_code or row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.1.2.13010201";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat(" 机构编号=", v_co_no,","," 科目代码=", v_fina_acco_code),"#",v_mysql_message);
        else
            SET v_error_info = concat(" 机构编号=", v_co_no,","," 科目代码=", v_fina_acco_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_删除估值科目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_DelFinaName;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_DelFinaName(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_fina_acco_code varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_fina_acco_code varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_fina_acco_code = p_fina_acco_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_基础参数_估值科目表][{机构编号}=@机构编号# and {科目代码}=@科目代码# and (@记录序号#=0 or {记录序号}=@记录序号#)][13010301][ @机构编号#, @科目代码#] */
    delete from db_eva.tb_evabasic_account_name 
        where co_no=v_co_no and fina_acco_code=v_fina_acco_code and (v_row_id=0 or row_id=v_row_id);
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.1.3.13010301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat(" 机构编号=", v_co_no,","," 科目代码=", v_fina_acco_code),"#",v_mysql_message);
        else
            SET v_error_info = concat(" 机构编号=", v_co_no,","," 科目代码=", v_fina_acco_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_查询估值科目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_QueryFinaName;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_QueryFinaName(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fina_acco_code varchar(64),
    IN p_fina_acco_name varchar(64),
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
    declare v_fina_acco_code varchar(64);
    declare v_fina_acco_name varchar(64);
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
    SET v_fina_acco_code = p_fina_acco_code;
    SET v_fina_acco_name = p_fina_acco_name;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_基础参数_估值科目表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@科目代码#=" " or {科目代码}=@科目代码#) and (@科目名称#=" " or {科目名称}=@科目名称#)  and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, fina_acco_code, fina_acco_name, fina_acco_level, 
        field_order, eva_check_type, config_str, pd_asset_type_str, 
        pd_fee_type_str from db_eva.tb_evabasic_account_name where (v_co_no = 0 or co_no=v_co_no) and (v_fina_acco_code=" " or fina_acco_code=v_fina_acco_code) and (v_fina_acco_name=" " or fina_acco_name=v_fina_acco_name)  and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, fina_acco_code, fina_acco_name, fina_acco_level, 
        field_order, eva_check_type, config_str, pd_asset_type_str, 
        pd_fee_type_str from db_eva.tb_evabasic_account_name where (v_co_no = 0 or co_no=v_co_no) and (v_fina_acco_code=" " or fina_acco_code=v_fina_acco_code) and (v_fina_acco_name=" " or fina_acco_name=v_fina_acco_name)  and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_获取产品特殊配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_GetPdSpecialConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_GetPdSpecialConfig(
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
    OUT p_error_info varchar(255),
    OUT p_config_value varchar(2048)
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
    declare v_config_value varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_config_value = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][平台估值_基础参数_产品特殊配置表][{配置值}][@配置值#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {配置编号}=@配置编号#][4][@产品编号#,@配置编号#] */
    select config_value into v_config_value from db_eva.tb_evabasic_pd_special_config where co_no=v_co_no and pd_no=v_pd_no and config_no=v_config_no limit 1;


    /* set @配置值#=ifnull(@配置值#,0); */
    set v_config_value=ifnull(v_config_value,0);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_config_value = v_config_value;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_增加估值产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_AddEvaPdInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_AddEvaPdInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_begin_share decimal(18,2),
    IN p_pd_curr_share decimal(18,2),
    IN p_target_pd_code varchar(8),
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
    declare v_pd_begin_share decimal(18,2);
    declare v_pd_curr_share decimal(18,2);
    declare v_target_pd_code varchar(8);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_task_status varchar(2);
    declare v_is_auto_push varchar(2);
    declare v_is_sync_netvalue int;
    declare v_unit_evalu int;
    declare v_hk_asset_calc_rate int;
    declare v_sync_total_rece_payab int;
    declare v_record_count int;
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
    SET v_pd_no = p_pd_no;
    SET v_pd_begin_share = p_pd_begin_share;
    SET v_pd_curr_share = p_pd_curr_share;
    SET v_target_pd_code = p_target_pd_code;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_task_status = "0";
    SET v_is_auto_push = "0";
    SET v_is_sync_netvalue = 0;
    SET v_unit_evalu = 0;
    SET v_hk_asset_calc_rate = 0;
    SET v_sync_total_rece_payab = 0;
    SET v_record_count = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @任务状态#=《任务状态-运行》; */
    set v_task_status="1";

    /* set @是否支持主推#=《是否支持主推-否》; */
    set v_is_auto_push="2";

    /* set @是否同步净值#=0; */
    set v_is_sync_netvalue=0;

    /* set @目标产品编码#="2"; */
    set v_target_pd_code="2";

    /* set @单元估值#=0; */
    set v_unit_evalu=0;

    /* set @港股通资产计算采用汇率#=0; */
    set v_hk_asset_calc_rate=0;

    /* set @同步累计应收应付#=0; */
    set v_sync_total_rece_payab=0;

    /* [记录已存在][平台估值_基础参数_估值产品基本信息表][@记录个数#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][104][@机构编号#,@产品编号#] */
    select count(1) into v_record_count from db_eva.tb_evabasic_product_info where co_no=v_co_no and pd_no=v_pd_no limit 1;
    if v_record_count > 0 then
                
        SET v_error_code = "evaA.1.11.104";
        SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        leave label_pro;
    end if;


    /* [插入表记录][平台估值_基础参数_估值产品基本信息表][字段][字段变量][104][@机构编号#,@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evabasic_product_info(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        pd_begin_share, pd_curr_share, target_pd_code, task_status, 
        is_auto_push, is_sync_netvalue, unit_evalu, hk_asset_calc_rate, 
        sync_total_rece_payab, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_pd_begin_share, v_pd_curr_share, v_target_pd_code, v_task_status, 
        v_is_auto_push, v_is_sync_netvalue, v_unit_evalu, v_hk_asset_calc_rate, 
        v_sync_total_rece_payab, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.1.11.104";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_修改估值产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_ModiEvaPdInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_ModiEvaPdInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_begin_share decimal(18,2),
    IN p_pd_curr_share decimal(18,2),
    IN p_target_pd_code varchar(8),
    IN p_task_status varchar(2),
    IN p_is_auto_push varchar(2),
    IN p_is_sync_netvalue int,
    IN p_unit_evalu int,
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
    declare v_pd_begin_share decimal(18,2);
    declare v_pd_curr_share decimal(18,2);
    declare v_target_pd_code varchar(8);
    declare v_task_status varchar(2);
    declare v_is_auto_push varchar(2);
    declare v_is_sync_netvalue int;
    declare v_unit_evalu int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_pd_begin_share = p_pd_begin_share;
    SET v_pd_curr_share = p_pd_curr_share;
    SET v_target_pd_code = p_target_pd_code;
    SET v_task_status = p_task_status;
    SET v_is_auto_push = p_is_auto_push;
    SET v_is_sync_netvalue = p_is_sync_netvalue;
    SET v_unit_evalu = p_unit_evalu;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [更新表记录][平台估值_基础参数_估值产品基本信息表][{产品期初份额}=@产品期初份额#, {产品当前份额}=@产品当前份额#, {目标产品编码}=@目标产品编码#,{备注信息}=@备注信息#,{任务状态}=@任务状态#,{是否支持主推}=@是否支持主推#,{是否同步净值}=@是否同步净值#,{单元估值}=@单元估值#][{机构编号}=@机构编号# and {产品编号}=@产品编号# or {记录序号}=@记录序号#][2][@机构编号#, @产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evabasic_product_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pd_begin_share=v_pd_begin_share, pd_curr_share=v_pd_curr_share, target_pd_code=v_target_pd_code,remark_info=v_remark_info,task_status=v_task_status,is_auto_push=v_is_auto_push,is_sync_netvalue=v_is_sync_netvalue,unit_evalu=v_unit_evalu where co_no=v_co_no and pd_no=v_pd_no or row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.1.12.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_删除估值产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_DelEvaPdInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_DelEvaPdInfo(
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
    

    /* [删除表记录][平台估值_基础参数_估值产品基本信息表][{机构编号}=@机构编号# and {产品编号}=@产品编号# ][3][@机构编号#,@产品编号#] */
    delete from db_eva.tb_evabasic_product_info 
        where co_no=v_co_no and pd_no=v_pd_no ;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.1.13.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_查询估值产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_QueryEvaPdInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_QueryEvaPdInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
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
    declare v_pd_no_str varchar(2048);
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_基础参数_估值产品基本信息表][字段][{机构编号}=@机构编号# and (@产品编号串# = "; ;" or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, pd_begin_share, pd_curr_share, target_pd_code, 
        task_status, is_auto_push, is_sync_netvalue, unit_evalu, 
        hk_asset_calc_rate, sync_total_rece_payab, remark_info from db_eva.tb_evabasic_product_info where co_no=v_co_no and (v_pd_no_str = "; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, pd_begin_share, pd_curr_share, target_pd_code, 
        task_status, is_auto_push, is_sync_netvalue, unit_evalu, 
        hk_asset_calc_rate, sync_total_rece_payab, remark_info from db_eva.tb_evabasic_product_info where co_no=v_co_no and (v_pd_no_str = "; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_获取估值产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_GetEvaPdInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_GetEvaPdInfo(
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
    OUT p_error_info varchar(255),
    OUT p_pd_begin_share decimal(18,2),
    OUT p_pd_curr_share decimal(18,2),
    OUT p_target_pd_code varchar(8),
    OUT p_is_auto_push varchar(2),
    OUT p_unit_evalu int,
    OUT p_sync_total_rece_payab int
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
    declare v_pd_begin_share decimal(18,2);
    declare v_pd_curr_share decimal(18,2);
    declare v_target_pd_code varchar(8);
    declare v_is_auto_push varchar(2);
    declare v_unit_evalu int;
    declare v_sync_total_rece_payab int;
    declare v_evalu_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pd_begin_share = 0;
    SET v_pd_curr_share = 0;
    SET v_target_pd_code = " ";
    SET v_is_auto_push = "0";
    SET v_unit_evalu = 0;
    SET v_sync_total_rece_payab = 0;
    SET v_evalu_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    
        #获取上日初始值

        /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品资产信息表][{产品当前份额}][@产品期初份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@估值日期# order by {初始化日期} desc] */
        select pd_curr_share into v_pd_begin_share from db_eva_his.tb_evatotal_product_asset_info_his where co_no=v_co_no and pd_no=v_pd_no and init_date<v_evalu_date order by init_date desc limit 1;

        #获取当日份额变动

        /* [获取表记录变量语句][平台估值_基础参数_估值产品份额流水表][ifnull(sum(case {变动方向} when 《变动方向-增加》 then {变动份额} else -1*{变动份额} end ),0)+@产品期初份额#][@产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#][4][@产品编号#] */
        select ifnull(sum(case occur_dir when 1 then occur_share else -1*occur_share end ),0)+v_pd_begin_share into v_pd_curr_share from db_eva.tb_evabasic_product_share_jour where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date limit 1;


    /* [获取表记录变量][平台估值_基础参数_估值产品基本信息表][{目标产品编码},{是否支持主推},{单元估值},{同步累计应收应付}][@目标产品编码#,@是否支持主推#,@单元估值#,@同步累计应收应付#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][4][@机构编号#, @产品编号#] */
    select target_pd_code,is_auto_push,unit_evalu,sync_total_rece_payab into v_target_pd_code,v_is_auto_push,v_unit_evalu,v_sync_total_rece_payab from db_eva.tb_evabasic_product_info where co_no=v_co_no and pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "evaA.1.15.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_begin_share = v_pd_begin_share;
    SET p_pd_curr_share = v_pd_curr_share;
    SET p_target_pd_code = v_target_pd_code;
    SET p_is_auto_push = v_is_auto_push;
    SET p_unit_evalu = v_unit_evalu;
    SET p_sync_total_rece_payab = v_sync_total_rece_payab;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_获取估值产品推送配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_GetEvaPdPushConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_GetEvaPdPushConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_pd_no int,
    OUT p_unit_evalu int
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_pd_no int;
    declare v_unit_evalu int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_pd_no = 0;
    SET v_unit_evalu = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][平台估值_基础参数_估值产品基本信息表][{记录序号},{产品编号},{单元估值}][@记录序号#,@产品编号#,@单元估值#][{机构编号}=@机构编号# and {是否支持主推}=1 and {记录序号}>@查询记录序号# order by {记录序号} asc ][4][@机构编号#, @查询记录序号#] */
    select row_id,pd_no,unit_evalu into v_row_id,v_pd_no,v_unit_evalu from db_eva.tb_evabasic_product_info where co_no=v_co_no and is_auto_push=1 and row_id>v_query_row_id order by row_id asc  limit 1;


    /* set @记录序号#=ifnull(@记录序号#,0); */
    set v_row_id=ifnull(v_row_id,0);

    /* set @产品编号#=ifnull(@产品编号#,0); */
    set v_pd_no=ifnull(v_pd_no,0);

    /* set @单元估值#=ifnull(@单元估值#,0); */
    set v_unit_evalu=ifnull(v_unit_evalu,0);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_pd_no = v_pd_no;
    SET p_unit_evalu = v_unit_evalu;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_查询估值产品邮箱配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_QueryPdMailConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_QueryPdMailConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_基础参数_产品邮箱配置表][字段][(@产品编号#=0 or {产品编号}=@产品编号#) and {记录序号}>@记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, mail_server, server_type, mail_server_protocol, 
        mail_server_port, mail_server_username, mail_server_password, ssl_type, 
        send_from, mail_subject, netvalue_posi, netvalue_date_posi, 
        dateformat_type from db_eva.tb_evabasic_product_mail_config where (v_pd_no=0 or pd_no=v_pd_no) and row_id>v_row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, mail_server, server_type, mail_server_protocol, 
        mail_server_port, mail_server_username, mail_server_password, ssl_type, 
        send_from, mail_subject, netvalue_posi, netvalue_date_posi, 
        dateformat_type from db_eva.tb_evabasic_product_mail_config where (v_pd_no=0 or pd_no=v_pd_no) and row_id>v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_增加估值产品费率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_addPdFee;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_addPdFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_fee_type int,
    IN p_pd_fee_rate decimal(18,12),
    IN p_pd_fee_circle int,
    IN p_min_fee decimal(18,4),
    IN p_calc_fee_date_str varchar(4096),
    IN p_eva_calc_type int,
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
    declare v_pd_fee_type int;
    declare v_pd_fee_rate decimal(18,12);
    declare v_pd_fee_circle int;
    declare v_min_fee decimal(18,4);
    declare v_calc_fee_date_str varchar(4096);
    declare v_eva_calc_type int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_pd_net_asset decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_fina_acco_code varchar(64);
    declare v_confirm_apply decimal(18,4);
    declare v_manual_flag int;
    declare v_init_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_pd_fee_rate = p_pd_fee_rate;
    SET v_pd_fee_circle = p_pd_fee_circle;
    SET v_min_fee = p_min_fee;
    SET v_calc_fee_date_str = p_calc_fee_date_str;
    SET v_eva_calc_type = p_eva_calc_type;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_amt = 0;
    SET v_begin_amt = 0;
    SET v_pd_net_asset = 0;
    SET v_crncy_type = "CNY";
    SET v_fina_acco_code = " ";
    SET v_confirm_apply = 0;
    SET v_manual_flag = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

         /* set @当前金额# =0; */
         set v_curr_amt =0;

         /* set @期初金额#=0; */
         set v_begin_amt=0;

         /* set @产品净资产#=0; */
         set v_pd_net_asset=0;

         /* set @本币币种#=《本币币种-人民币》; */
         set v_crncy_type="CNY";

         /* set @科目代码#=' '; */
         set v_fina_acco_code=' ';

         /* set @确认金额#=0; */
         set v_confirm_apply=0;

         /* set @手工标志#=0; */
         set v_manual_flag=0;

         /* [获取机器日期][@初始化日期#] */
         select date_format(curdate(),'%Y%m%d') into v_init_date;


    /* [插入重复更新][平台估值_基础参数_估值产品费率表][字段][字段变量][{机构编号}=@机构编号#,{产品编号}=@产品编号#,{产品费用类型}=@产品费用类型#,{产品费用费率}=@产品费用费率#,{产品计费周期}=@产品计费周期#,{最低费用}=@最低费用#,{扣费日期串}=@扣费日期串#,{净值计算方式}=@净值计算方式#,{备注信息}=@备注信息#][1][@机构编号#, @产品编号#, @产品费用类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evabasic_product_fee (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        pd_fee_type, pd_fee_rate, pd_fee_circle, min_fee, 
        fina_acco_code, calc_fee_date_str, eva_calc_type, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_pd_fee_type, v_pd_fee_rate, v_pd_fee_circle, v_min_fee, 
        v_fina_acco_code, v_calc_fee_date_str, v_eva_calc_type, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no,pd_no=v_pd_no,pd_fee_type=v_pd_fee_type,pd_fee_rate=v_pd_fee_rate,pd_fee_circle=v_pd_fee_circle,min_fee=v_min_fee,calc_fee_date_str=v_calc_fee_date_str,eva_calc_type=v_eva_calc_type,remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 产品费用类型=", v_pd_fee_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 产品费用类型=", v_pd_fee_type);
        end if;
        leave label_pro;
    end if;


    /* [插入重复更新][平台估值_估值汇总_估值产品费用表][字段][字段变量][{机构编号}=@机构编号#,{初始化日期}=@初始化日期#,{产品编号}=@产品编号#,{产品费用类型}=@产品费用类型#,{本币币种}=@本币币种#,{期初金额}=@期初金额#,{当前金额}=@当前金额#,{产品净资产}=@产品净资产#,{备注信息}=@备注信息#][1][@机构编号#, @产品编号#, @产品费用类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evatotal_pd_fee_total (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, pd_fee_type, crncy_type, begin_amt, 
        curr_amt, pd_net_asset, confirm_apply, remark_info, 
        manual_flag) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_pd_fee_type, v_crncy_type, v_begin_amt, 
        v_curr_amt, v_pd_net_asset, v_confirm_apply, v_remark_info, 
        v_manual_flag) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no,init_date=v_init_date,pd_no=v_pd_no,pd_fee_type=v_pd_fee_type,crncy_type=v_crncy_type,begin_amt=v_begin_amt,curr_amt=v_curr_amt,pd_net_asset=v_pd_net_asset,remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 产品费用类型=", v_pd_fee_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 产品费用类型=", v_pd_fee_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_修改估值产品费率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_modifyPdFee;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_modifyPdFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_fee_type int,
    IN p_pd_fee_rate decimal(18,12),
    IN p_pd_fee_circle int,
    IN p_min_fee decimal(18,4),
    IN p_calc_fee_date_str varchar(4096),
    IN p_eva_calc_type int,
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
    declare v_pd_fee_type int;
    declare v_pd_fee_rate decimal(18,12);
    declare v_pd_fee_circle int;
    declare v_min_fee decimal(18,4);
    declare v_calc_fee_date_str varchar(4096);
    declare v_eva_calc_type int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_pd_fee_rate = p_pd_fee_rate;
    SET v_pd_fee_circle = p_pd_fee_circle;
    SET v_min_fee = p_min_fee;
    SET v_calc_fee_date_str = p_calc_fee_date_str;
    SET v_eva_calc_type = p_eva_calc_type;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][平台估值_基础参数_估值产品费率表][{产品费用费率}=@产品费用费率#, {产品计费周期}=@产品计费周期#,{最低费用}=@最低费用#,{扣费日期串}=@扣费日期串#,{净值计算方式}=@净值计算方式#,{备注信息}=@备注信息#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型#][2][@机构编号#,@产品编号#,@产品费用类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evabasic_product_fee set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pd_fee_rate=v_pd_fee_rate, pd_fee_circle=v_pd_fee_circle,min_fee=v_min_fee,calc_fee_date_str=v_calc_fee_date_str,eva_calc_type=v_eva_calc_type,remark_info=v_remark_info where co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.1.22.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","产品费用类型=",v_pd_fee_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","产品费用类型=",v_pd_fee_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_删除估值产品费率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_deletePdFee;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_deletePdFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_fee_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_fee_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_基础参数_估值产品费率表][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型#][3][@机构编号#,@产品编号#, @产品费用类型#] */
    delete from db_eva.tb_evabasic_product_fee 
        where co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.1.23.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,","," 产品费用类型=", v_pd_fee_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,","," 产品费用类型=", v_pd_fee_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_查询估值产品费率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_queryPdFee;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_queryPdFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_fee_type int,
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
    declare v_pd_fee_type int;
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
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_基础参数_估值产品费率表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@产品费用类型#=0 or {产品费用类型}=@产品费用类型#)  and {记录序号}>@记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, pd_fee_type, pd_fee_rate, pd_fee_circle, 
        min_fee, fina_acco_code, calc_fee_date_str, eva_calc_type, 
        remark_info from db_eva.tb_evabasic_product_fee where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_pd_fee_type=0 or pd_fee_type=v_pd_fee_type)  and row_id>v_row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, pd_fee_type, pd_fee_rate, pd_fee_circle, 
        min_fee, fina_acco_code, calc_fee_date_str, eva_calc_type, 
        remark_info from db_eva.tb_evabasic_product_fee where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_pd_fee_type=0 or pd_fee_type=v_pd_fee_type)  and row_id>v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_增加估值产品利率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_addPdRate;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_addPdRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_rate_type int,
    IN p_asset_acco varchar(16),
    IN p_intrst_rate decimal(18,12),
    IN p_pd_fee_circle int,
    IN p_min_interest decimal(18,4),
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
    declare v_pd_rate_type int;
    declare v_asset_acco varchar(16);
    declare v_intrst_rate decimal(18,12);
    declare v_pd_fee_circle int;
    declare v_min_interest decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_fina_acco_code varchar(64);
    declare v_confirm_apply decimal(18,4);
    declare v_manual_flag int;
    declare v_init_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_pd_rate_type = p_pd_rate_type;
    SET v_asset_acco = p_asset_acco;
    SET v_intrst_rate = p_intrst_rate;
    SET v_pd_fee_circle = p_pd_fee_circle;
    SET v_min_interest = p_min_interest;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_amt = 0;
    SET v_begin_amt = 0;
    SET v_intrst_base_amt = 0;
    SET v_crncy_type = "CNY";
    SET v_fina_acco_code = " ";
    SET v_confirm_apply = 0;
    SET v_manual_flag = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

         /* set @当前金额# =0; */
         set v_curr_amt =0;

         /* set @期初金额#=0; */
         set v_begin_amt=0;

         /* set @利息积数#=0; */
         set v_intrst_base_amt=0;

         /* set @本币币种#=《本币币种-人民币》; */
         set v_crncy_type="CNY";

         /* set @科目代码#=' '; */
         set v_fina_acco_code=' ';

         /* set @确认金额#=0; */
         set v_confirm_apply=0;

         /* set @手工标志#=0; */
         set v_manual_flag=0;

         /* [获取机器日期][@初始化日期#] */
         select date_format(curdate(),'%Y%m%d') into v_init_date;


    /* [插入重复更新][平台估值_基础参数_估值产品利率表][字段][字段变量][{机构编号}=@机构编号#,{产品编号}=@产品编号#,{产品利率类型}=@产品利率类型#,{资产账户}=@资产账户#,{利率}=@利率#,{产品计费周期}=@产品计费周期#,{最低利息}=@最低利息#,{备注信息}=@备注信息#][1][@机构编号#, @产品编号#, @产品利率类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evabasic_product_rate (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        pd_rate_type, asset_acco, intrst_rate, pd_fee_circle, 
        min_interest, fina_acco_code, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_pd_rate_type, v_asset_acco, v_intrst_rate, v_pd_fee_circle, 
        v_min_interest, v_fina_acco_code, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no,pd_no=v_pd_no,pd_rate_type=v_pd_rate_type,asset_acco=v_asset_acco,intrst_rate=v_intrst_rate,pd_fee_circle=v_pd_fee_circle,min_interest=v_min_interest,remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.1.31.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 产品利率类型=", v_pd_rate_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 产品利率类型=", v_pd_rate_type);
        end if;
        leave label_pro;
    end if;


    /* [插入重复更新][平台估值_估值汇总_估值产品利息表][字段][字段变量][{机构编号}=@机构编号#,{初始化日期}=@初始化日期#,{产品编号}=@产品编号#,{产品利率类型}=@产品利率类型#,{本币币种}=@本币币种#,{期初金额}=@期初金额#,{当前金额}=@当前金额#,{利息积数}=@利息积数#,{备注信息}=@备注信息#][1][@机构编号#, @产品编号#, @产品利率类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evatotal_pd_interest_total (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, pd_rate_type, asset_acco, crncy_type, 
        begin_amt, curr_amt, intrst_base_amt, confirm_apply, 
        remark_info, manual_flag) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_pd_rate_type, v_asset_acco, v_crncy_type, 
        v_begin_amt, v_curr_amt, v_intrst_base_amt, v_confirm_apply, 
        v_remark_info, v_manual_flag) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no,init_date=v_init_date,pd_no=v_pd_no,pd_rate_type=v_pd_rate_type,crncy_type=v_crncy_type,begin_amt=v_begin_amt,curr_amt=v_curr_amt,intrst_base_amt=v_intrst_base_amt,remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.1.31.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 产品利率类型=", v_pd_rate_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 产品利率类型=", v_pd_rate_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_修改估值产品利率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_modifyPdRate;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_modifyPdRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_rate_type int,
    IN p_asset_acco varchar(16),
    IN p_intrst_rate decimal(18,12),
    IN p_pd_fee_circle int,
    IN p_min_interest decimal(18,4),
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
    declare v_pd_rate_type int;
    declare v_asset_acco varchar(16);
    declare v_intrst_rate decimal(18,12);
    declare v_pd_fee_circle int;
    declare v_min_interest decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_rate_type = p_pd_rate_type;
    SET v_asset_acco = p_asset_acco;
    SET v_intrst_rate = p_intrst_rate;
    SET v_pd_fee_circle = p_pd_fee_circle;
    SET v_min_interest = p_min_interest;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][平台估值_基础参数_估值产品利率表][{利率}=@利率#, {产品计费周期}=@产品计费周期#,{最低利息}=@最低利息#,{备注信息}=@备注信息#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户}=@资产账户#][2][@机构编号#,@产品编号#,@资产账户#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evabasic_product_rate set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, intrst_rate=v_intrst_rate, pd_fee_circle=v_pd_fee_circle,min_interest=v_min_interest,remark_info=v_remark_info where co_no=v_co_no and pd_no=v_pd_no and asset_acco=v_asset_acco;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.1.32.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户=",v_asset_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户=",v_asset_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_删除估值产品利率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_deletePdRate;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_deletePdRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_rate_type int,
    IN p_asset_acco varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_rate_type int;
    declare v_asset_acco varchar(16);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_fee_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pd_rate_type = p_pd_rate_type;
    SET v_asset_acco = p_asset_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_fee_type = 0;

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_基础参数_估值产品利率表][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品利率类型}=@产品利率类型# and {资产账户}=@资产账户#][3][@机构编号#, @产品编号#, @产品费用类型#, @资产账户#] */
    delete from db_eva.tb_evabasic_product_rate 
        where co_no=v_co_no and pd_no=v_pd_no and pd_rate_type=v_pd_rate_type and asset_acco=v_asset_acco;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.1.33.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 产品费用类型=", v_pd_fee_type,","," 资产账户=", v_asset_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 产品费用类型=", v_pd_fee_type,","," 资产账户=", v_asset_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_查询估值产品利率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_queryPdRate;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_queryPdRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_rate_type int,
    IN p_asset_acco varchar(16),
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
    declare v_pd_rate_type int;
    declare v_asset_acco varchar(16);
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
    SET v_pd_rate_type = p_pd_rate_type;
    SET v_asset_acco = p_asset_acco;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_基础参数_估值产品利率表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@产品利率类型#=0 or {产品利率类型}=@产品利率类型#) and (@资产账户#=" " or {资产账户}=@资产账户#)  and  {记录序号}>@记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, pd_rate_type, asset_acco, intrst_rate, 
        pd_fee_circle, min_interest, fina_acco_code, remark_info from db_eva.tb_evabasic_product_rate where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_pd_rate_type=0 or pd_rate_type=v_pd_rate_type) and (v_asset_acco=" " or asset_acco=v_asset_acco)  and  row_id>v_row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, pd_rate_type, asset_acco, intrst_rate, 
        pd_fee_circle, min_interest, fina_acco_code, remark_info from db_eva.tb_evabasic_product_rate where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_pd_rate_type=0 or pd_rate_type=v_pd_rate_type) and (v_asset_acco=" " or asset_acco=v_asset_acco)  and  row_id>v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_增加估值产品份额流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_addPdShareJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_addPdShareJour(
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
    IN p_occur_dir int,
    IN p_share_oper int,
    IN p_occur_share decimal(18,2),
    IN p_occur_amt decimal(18,4),
    IN p_arrive_date int,
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
    declare v_occur_dir int;
    declare v_share_oper int;
    declare v_occur_share decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_arrive_date int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_occur_dir = p_occur_dir;
    SET v_share_oper = p_share_oper;
    SET v_occur_share = p_occur_share;
    SET v_occur_amt = p_occur_amt;
    SET v_arrive_date = p_arrive_date;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][平台估值_基础参数_估值产品份额流水表][字段][字段变量][1][@机构编号#, @产品编号#, @变动方向#,@份额操作#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evabasic_product_share_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, occur_dir, share_oper, occur_share, 
        occur_amt, arrive_date, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_occur_dir, v_share_oper, v_occur_share, 
        v_occur_amt, v_arrive_date, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.1.41.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 变动方向=", v_occur_dir,",","份额操作=",v_share_oper),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_修改估值产品份额流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_modifyPdShareJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_modifyPdShareJour(
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
    IN p_occur_dir int,
    IN p_share_oper int,
    IN p_occur_share decimal(18,2),
    IN p_occur_amt decimal(18,4),
    IN p_arrive_date int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_occur_dir int;
    declare v_share_oper int;
    declare v_occur_share decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_arrive_date int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_occur_dir = p_occur_dir;
    SET v_share_oper = p_share_oper;
    SET v_occur_share = p_occur_share;
    SET v_occur_amt = p_occur_amt;
    SET v_arrive_date = p_arrive_date;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][平台估值_基础参数_估值产品份额流水表][{初始化日期}=@初始化日期#,{变动方向}=@变动方向#,{份额操作}=@份额操作#,{变动份额}=@变动份额#,{变动金额}=@变动金额#,{到账日期}=@到账日期#,{备注信息}=@备注信息#][{记录序号}=@记录序号# and {机构编号}=@机构编号# and {产品编号}=@产品编号#][2][@机构编号#,@产品编号#,@变动方向#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evabasic_product_share_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_init_date,occur_dir=v_occur_dir,share_oper=v_share_oper,occur_share=v_occur_share,occur_amt=v_occur_amt,arrive_date=v_arrive_date,remark_info=v_remark_info where row_id=v_row_id and co_no=v_co_no and pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.1.42.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","变动方向=",v_occur_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","变动方向=",v_occur_dir);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_删除估值产品份额流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_deletePdShareJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_deletePdShareJour(
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
    IN p_share_oper int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_share_oper int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_share_oper = p_share_oper;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_基础参数_估值产品份额流水表][{记录序号}=@记录序号# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {份额操作}=@份额操作#][3][@机构编号#, @产品编号#, @初始化日期#, @份额操作#] */
    delete from db_eva.tb_evabasic_product_share_jour 
        where row_id=v_row_id and co_no=v_co_no and pd_no=v_pd_no and share_oper=v_share_oper;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.1.43.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 初始化日期=", v_init_date,","," 份额操作=", v_share_oper),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 初始化日期=", v_init_date,","," 份额操作=", v_share_oper);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_查询估值产品份额流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_queryPdShareJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_queryPdShareJour(
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
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_基础参数_估值产品份额流水表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and {初始化日期} between @开始日期# and @结束日期#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, occur_dir, share_oper, 
        occur_share, occur_amt, arrive_date, remark_info from db_eva.tb_evabasic_product_share_jour where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and init_date between v_begin_date and v_end_date;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, occur_dir, share_oper, 
        occur_share, occur_amt, arrive_date, remark_info from db_eva.tb_evabasic_product_share_jour where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and init_date between v_begin_date and v_end_date limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_获取估值产品份额差额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_getPdShareDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_getPdShareDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_evalu_share decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_occur_share decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_evalu_share decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_occur_share decimal(18,2);
    declare v_pd_curr_share decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_evalu_share = p_evalu_share;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_occur_share = 0;
    SET v_pd_curr_share = 0;

    
    label_pro:BEGIN
    
    #获取前日份额

    /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品资产信息表][{产品当前份额}][@产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@估值日期# order by {初始化日期} desc][4][@产品编号#,@估值日期#] */
    select pd_curr_share into v_pd_curr_share from db_eva_his.tb_evatotal_product_asset_info_his where co_no=v_co_no and pd_no=v_pd_no and init_date<v_evalu_date order by init_date desc limit 1;

    #获取当日变动

    /* [获取表记录变量语句][平台估值_基础参数_估值产品份额流水表][ifnull(sum(case {变动方向} when 《变动方向-增加》 then {变动份额} else -1*{变动份额} end ),0)+@产品当前份额#][@产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {备注信息}<>'自动同步份额'][4][@产品编号#] */
    select ifnull(sum(case occur_dir when 1 then occur_share else -1*occur_share end ),0)+v_pd_curr_share into v_pd_curr_share from db_eva.tb_evabasic_product_share_jour where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and remark_info<>'自动同步份额' limit 1;


    /* set @变动份额#=@估值份额#-@产品当前份额#; */
    set v_occur_share=v_evalu_share-v_pd_curr_share;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_occur_share = v_occur_share;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_删除估值产品份额同步流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_deletePdShareSyncJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_deletePdShareSyncJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
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
    declare v_evalu_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_基础参数_估值产品份额流水表][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {备注信息}='自动同步份额'][3][@机构编号#, @产品编号#, @估值日期#] */
    delete from db_eva.tb_evabasic_product_share_jour 
        where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and remark_info='自动同步份额';
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.1.46.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 估值日期=", v_evalu_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 估值日期=", v_evalu_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_获取估值产品科目信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_getEvaFinaInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_getEvaFinaInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_fina_acco_code varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_eva_check_type int,
    OUT p_config_str varchar(2048)
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
    declare v_fina_acco_code varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_eva_check_type int;
    declare v_config_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_fina_acco_code = p_fina_acco_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_eva_check_type = 0;
    SET v_config_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][平台估值_基础参数_估值科目表][{估值核对类型},{参数配置串}][@估值核对类型#,@参数配置串#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and @科目代码# like concat({科目代码},'%') and {估值核对类型}<>7][4][@机构编号#, @产品编号#] */
    select eva_check_type,config_str into v_eva_check_type,v_config_str from db_eva.tb_evabasic_account_name where co_no=v_co_no and pd_no=v_pd_no and v_fina_acco_code like concat(fina_acco_code,'%') and eva_check_type<>7 limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_eva_check_type = v_eva_check_type;
    SET p_config_str = v_config_str;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_获取估值产品科目汇总信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_getEvaFinaTotalInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_getEvaFinaTotalInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_fina_acco_code varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_eva_check_type int,
    OUT p_config_str varchar(2048)
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
    declare v_fina_acco_code varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_eva_check_type int;
    declare v_config_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_fina_acco_code = p_fina_acco_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_eva_check_type = 0;
    SET v_config_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][平台估值_基础参数_估值科目表][{估值核对类型},{参数配置串}][@估值核对类型#,@参数配置串#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and @科目代码# ={科目代码}][4][@机构编号#, @产品编号#] */
    select eva_check_type,config_str into v_eva_check_type,v_config_str from db_eva.tb_evabasic_account_name where co_no=v_co_no and pd_no=v_pd_no and v_fina_acco_code =fina_acco_code limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_eva_check_type = v_eva_check_type;
    SET p_config_str = v_config_str;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_增加估值产品累计净值配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_addPdTotalNetConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_addPdTotalNetConfig(
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
    IN p_divide_type int,
    IN p_pd_curr_share decimal(18,2),
    IN p_divi_amt decimal(18,4),
    IN p_unit_divi_amt decimal(18,4),
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
    declare v_divide_type int;
    declare v_pd_curr_share decimal(18,2);
    declare v_divi_amt decimal(18,4);
    declare v_unit_divi_amt decimal(18,4);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_divide_type = p_divide_type;
    SET v_pd_curr_share = p_pd_curr_share;
    SET v_divi_amt = p_divi_amt;
    SET v_unit_divi_amt = p_unit_divi_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][平台估值_基础参数_估值产品净值计算配置表][字段][字段变量][{初始化日期}=@初始化日期#,{机构编号}=@机构编号#,{产品编号}=@产品编号#,{分红方式}=@分红方式#,{产品当前份额}=@产品当前份额#,{分红金额}=@分红金额#,{单位分红}=@单位分红#,{备注信息}=@备注信息#][1][@机构编号#, @产品编号#, @初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evabasic_pd_net_config (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, divide_type, pd_curr_share, divi_amt, 
        unit_divi_amt, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_divide_type, v_pd_curr_share, v_divi_amt, 
        v_unit_divi_amt, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, init_date=v_init_date,co_no=v_co_no,pd_no=v_pd_no,divide_type=v_divide_type,pd_curr_share=v_pd_curr_share,divi_amt=v_divi_amt,unit_divi_amt=v_unit_divi_amt,remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.1.61.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 初始化日期=", v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no,","," 初始化日期=", v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_修改估值产品累计净值配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_editPdTotalNetConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_editPdTotalNetConfig(
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
    IN p_divide_type int,
    IN p_pd_curr_share decimal(18,2),
    IN p_divi_amt decimal(18,4),
    IN p_unit_divi_amt decimal(18,4),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_divide_type int;
    declare v_pd_curr_share decimal(18,2);
    declare v_divi_amt decimal(18,4);
    declare v_unit_divi_amt decimal(18,4);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_divide_type = p_divide_type;
    SET v_pd_curr_share = p_pd_curr_share;
    SET v_divi_amt = p_divi_amt;
    SET v_unit_divi_amt = p_unit_divi_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][平台估值_基础参数_估值产品净值计算配置表][{初始化日期}=@初始化日期#,{分红方式}=@分红方式#,{分红金额}=@分红金额#,{产品当前份额}=@产品当前份额#,{单位分红}=@单位分红#,{备注信息}=@备注信息#][{记录序号}=@记录序号# and {机构编号}=@机构编号# and {产品编号}=@产品编号#][2][@机构编号#,@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evabasic_pd_net_config set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_init_date,divide_type=v_divide_type,divi_amt=v_divi_amt,pd_curr_share=v_pd_curr_share,unit_divi_amt=v_unit_divi_amt,remark_info=v_remark_info where row_id=v_row_id and co_no=v_co_no and pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.1.62.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_删除估值产品累计净值配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_delPdTotalNetConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_delPdTotalNetConfig(
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
    IN p_divide_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_divide_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_divide_type = p_divide_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_基础参数_估值产品净值计算配置表][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {记录序号}=@记录序号#][3][@机构编号#, @产品编号#] */
    delete from db_eva.tb_evabasic_pd_net_config 
        where co_no=v_co_no and pd_no=v_pd_no and row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.1.63.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_查询估值产品累计净值配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_queryPdTotalNetConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_queryPdTotalNetConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_divide_type int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_divide_type int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_divide_type = p_divide_type;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_基础参数_估值产品净值计算配置表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号# and (@分红方式#=0 or {分红方式}=@分红方式#) and {初始化日期} between @开始日期# and @结束日期#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, divide_type, pd_curr_share, 
        divi_amt, unit_divi_amt, remark_info from db_eva.tb_evabasic_pd_net_config where co_no=v_co_no and pd_no=v_pd_no and (v_divide_type=0 or divide_type=v_divide_type) and init_date between v_begin_date and v_end_date;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, divide_type, pd_curr_share, 
        divi_amt, unit_divi_amt, remark_info from db_eva.tb_evabasic_pd_net_config where co_no=v_co_no and pd_no=v_pd_no and (v_divide_type=0 or divide_type=v_divide_type) and init_date between v_begin_date and v_end_date limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_增加估值产品增值税率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_addPdVatConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_addPdVatConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_vat_rate decimal(18,12),
    IN p_vat_add_rate decimal(18,12),
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
    declare v_vat_rate decimal(18,12);
    declare v_vat_add_rate decimal(18,12);
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
    SET v_pd_no = p_pd_no;
    SET v_vat_rate = p_vat_rate;
    SET v_vat_add_rate = p_vat_add_rate;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][平台估值_基础参数_估值产品增值税率表][字段][字段变量][{机构编号}=@机构编号#,{产品编号}=@产品编号#,{增值税率}=@增值税率#,{增值税附加税率}=@增值税附加税率#,{备注信息}=@备注信息#][1][@机构编号#, @产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evabasic_pd_vat_config (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        vat_rate, vat_add_rate, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_vat_rate, v_vat_add_rate, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no,pd_no=v_pd_no,vat_rate=v_vat_rate,vat_add_rate=v_vat_add_rate,remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.1.65.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_修改估值产品增值税率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_editPdVatConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_editPdVatConfig(
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
    IN p_vat_rate decimal(18,12),
    IN p_vat_add_rate decimal(18,12),
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
    declare v_vat_rate decimal(18,12);
    declare v_vat_add_rate decimal(18,12);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_vat_rate = p_vat_rate;
    SET v_vat_add_rate = p_vat_add_rate;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][平台估值_基础参数_估值产品增值税率表][{增值税率}=@增值税率#,{增值税附加税率}=@增值税附加税率#,{备注信息}=@备注信息#][{记录序号}=@记录序号# and {机构编号}=@机构编号# and {产品编号}=@产品编号#][2][@机构编号#,@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evabasic_pd_vat_config set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, vat_rate=v_vat_rate,vat_add_rate=v_vat_add_rate,remark_info=v_remark_info where row_id=v_row_id and co_no=v_co_no and pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.1.66.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_删除估值产品增值税率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_delPdVatConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_delPdVatConfig(
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
    

    /* [删除表记录][平台估值_基础参数_估值产品增值税率表][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {记录序号}=@记录序号#][3][@机构编号#, @产品编号#] */
    delete from db_eva.tb_evabasic_pd_vat_config 
        where co_no=v_co_no and pd_no=v_pd_no and row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.1.67.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_查询估值产品增值税率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_queryPdVatConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_queryPdVatConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_基础参数_估值产品增值税率表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号# ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, vat_rate, vat_add_rate, remark_info from db_eva.tb_evabasic_pd_vat_config where co_no=v_co_no and pd_no=v_pd_no ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, vat_rate, vat_add_rate, remark_info from db_eva.tb_evabasic_pd_vat_config where co_no=v_co_no and pd_no=v_pd_no  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_获取估值产品交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_getEvaExgpInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_getEvaExgpInfo(
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
    

    /* [删除表记录][平台估值_基础参数_估值产品交易组信息表][{机构编号} = @机构编号# and {产品编号} = @产品编号#][3][@机构编号#,@产品编号#] */
    delete from db_eva.tb_evabasic_exch_group_info 
        where co_no = v_co_no and pd_no = v_pd_no;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.1.71.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* insert into ~平台估值_基础参数_估值产品交易组信息表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{交易组编号},{机构编号},{交易组编码},{交易组名称},{交易组状态},{默认组标志},{产品编号},{原始资产},{分配产品资金},{交易组产品份额},{昨日交易组产品份额},{昨日净值},{期初净资产},{允许投资市场},{允许操作证券类型},{业务控制配置串},{市价冻结浮动比例},{权重值},{备注信息},{注销日期}) select {创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{交易组编号},{机构编号},{交易组编码},{交易组名称},{交易组状态},{默认组标志},{产品编号},{原始资产},{分配产品资金},{交易组产品份额},{昨日交易组产品份额},{昨日净值},{期初净资产},{允许投资市场},{允许操作证券类型},{业务控制配置串},{市价冻结浮动比例},{权重值},{备注信息},{注销日期} from db_dc.tb_user_exch_group_info where {机构编号}=@机构编号# and {产品编号}=@产品编号#; */
    insert into db_eva.tb_evabasic_exch_group_info(create_date,create_time,update_date,update_time,update_times,exch_group_no,co_no,exch_group_code,exch_group_name,exch_group_status,default_group_flag,pd_no,first_asset,exch_group_dist_pd_amt,exch_group_pd_share,pre_exch_group_pd_share,pre_nav,begin_NAV,allow_exch,allow_stock_type,busi_config_str,market_price_ratio,weight_value,remark_info,abolish_date) select create_date,create_time,update_date,update_time,update_times,exch_group_no,co_no,exch_group_code,exch_group_name,exch_group_status,default_group_flag,pd_no,first_asset,exch_group_dist_pd_amt,exch_group_pd_share,pre_exch_group_pd_share,pre_nav,begin_NAV,allow_exch,allow_stock_type,busi_config_str,market_price_ratio,weight_value,remark_info,abolish_date from db_dc.tb_user_exch_group_info where co_no=v_co_no and pd_no=v_pd_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_基础参数_获取估值产品母基金关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evabasic_getPdMomInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_evabasic_getPdMomInfo(
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
    

    /* [删除表记录][平台估值_基础参数_产品关系表][{机构编号} = @机构编号# and {产品编号} = @产品编号#][3][@机构编号#,@产品编号#] */
    delete from db_eva.tb_evabasic_pd_relation 
        where co_no = v_co_no and pd_no = v_pd_no;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.1.72.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* insert into ~平台估值_基础参数_产品关系表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{机构编号},{产品编号},{母产品编号}) select {创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{机构编号},{产品编号},{母产品编号} from db_dc.tb_pdacco_pd_relation where {机构编号}=@机构编号# and {产品编号}=@产品编号#; */
    insert into db_eva.tb_evabasic_pd_relation(create_date,create_time,update_date,update_time,update_times,co_no,pd_no,mum_pd_no) select create_date,create_time,update_date,update_time,update_times,co_no,pd_no,mum_pd_no from db_dc.tb_pdacco_pd_relation where co_no=v_co_no and pd_no=v_pd_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


