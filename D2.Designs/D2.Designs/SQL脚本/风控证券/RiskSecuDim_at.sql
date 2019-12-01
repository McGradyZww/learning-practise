DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_查询指数类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_QueryIndexType;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_QueryIndexType(
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
    

    /* [获取表全记录][风控证券_维度_指数类型表][字段][1=1] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, index_no, 
        index_code, index_name, index_build_orgn, weight_type, 
        remark_info from db_rksecu.tb_rksedm_index_type where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_查询指数证券代码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_QueryIndexStock;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_QueryIndexStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_index_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_index_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_index_code = p_index_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][风控证券_维度_指数证券代码表][字段][{指数编码}=(case when @指数编码#<>" " then @指数编码# else {指数编码} end)] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, index_no, 
        index_code, index_name, exch_no, stock_code_no, 
        stock_code, stock_name, stock_type, weight_value, 
        weight_ratio, remark_info from db_rksecu.tb_rksedm_index_stock where index_code=(case when v_index_code<>" " then v_index_code else index_code end);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_查询行业类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_QueryIndustryType;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_QueryIndustryType(
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
    

    /* [获取表全记录][风控证券_维度_行业类型表][字段][1=1] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, indu_type_no, 
        indu_type_name, indu_bulid_orgn, indu_level_total, weight_type, 
        remark_info from db_rksecu.tb_rksedm_industry_type where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_查询行业层级
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_QueryIndustryClassification;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_QueryIndustryClassification(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_indu_type_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_indu_type_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_indu_type_no = p_indu_type_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][风控证券_维度_行业层级表][字段][{行业类型编号}=@行业类型编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, indu_type_no, 
        indu_code, indu_name, indu_level_total, indu_level, 
        highup_indu_code, weight_type, weight_value, weight_ratio, 
        remark_info from db_rksecu.tb_rksedm_industry_classification where indu_type_no=v_indu_type_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_查询行业证券代码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_QueryIndustryStock;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_QueryIndustryStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_indu_type_no int,
    IN p_indu_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_indu_type_no int;
    declare v_indu_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_indu_type_no = p_indu_type_no;
    SET v_indu_code = p_indu_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][风控证券_维度_行业证券代码表][字段][{行业类型编号}=(case when @行业类型编号#<>0 then @行业类型编号# else {行业类型编号} end) and {行业编码}=(case when @行业编码#<>" " then @行业编码# else {行业编码} end)] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, indu_type_no, 
        indu_code, exch_no, stock_code_no, stock_code, 
        stock_name, stock_type, weight_value, weight_ratio, 
        remark_info from db_rksecu.tb_rksedm_industry_stock where indu_type_no=(case when v_indu_type_no<>0 then v_indu_type_no else indu_type_no end) and indu_code=(case when v_indu_code<>" " then v_indu_code else indu_code end);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_查询自定义维度类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_QueryCustomDimensionType;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_QueryCustomDimensionType(
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
    

    /* [获取表全记录][风控证券_维度_自定义维度类型表][{维度类型编码}, {维度类型名称}, {备注信息}][1=1] */
    select dime_type_code, dime_type_name, remark_info from db_rksecu.tb_rksedm_custom_dimension_type where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_查询自定义维度证券代码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_QueryCustomDimensionStock;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_QueryCustomDimensionStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_dime_type_code varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_dime_type_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_dime_type_code = p_dime_type_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][风控证券_维度_自定义维度证券代码表][字段][{维度类型编码}=(case when @维度类型编码#<>" " then @维度类型编码# else {维度类型编码} end)] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, dime_type_code, 
        exch_no, stock_code_no, stock_code, stock_name, 
        stock_type, weight_value, weight_ratio, remark_info from db_rksecu.tb_rksedm_custom_dimension_stock where dime_type_code=(case when v_dime_type_code<>" " then v_dime_type_code else dime_type_code end);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_新增机构维度类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_InsertUserDimensionType;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_InsertUserDimensionType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_user_dim_type int,
    IN p_dime_type_code varchar(32),
    IN p_dime_type_name varchar(64),
    IN p_weight_type int,
    IN p_remark_info varchar(255),
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
    declare v_co_no int;
    declare v_user_dim_type int;
    declare v_dime_type_code varchar(32);
    declare v_dime_type_name varchar(64);
    declare v_weight_type int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_dime_type int;
    declare v_ctrl_cond_dim_code_str varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_user_dim_type = p_user_dim_type;
    SET v_dime_type_code = p_dime_type_code;
    SET v_dime_type_name = p_dime_type_name;
    SET v_weight_type = p_weight_type;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_dime_type = 0;
    SET v_ctrl_cond_dim_code_str = " ";

    
    label_pro:BEGIN
    

    /* [插入表记录][风控证券_维度_机构维度类型表][字段][字段变量][4][@维度类型编码#,@维度类型名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rksedm_user_dimension_type(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, user_dim_type, 
        dime_type_code, dime_type_name, weight_type, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_user_dim_type, 
        v_dime_type_code, v_dime_type_name, v_weight_type, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.3.8.4";
        SET v_error_info =  CONCAT(concat("维度类型编码=",v_dime_type_code,",","维度类型名称=",v_dime_type_name),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @维度类型# = 4; */
    set v_dime_type = 4;

    /* set @控制条件维度编码串# = @维度类型编码#; */
    set v_ctrl_cond_dim_code_str = v_dime_type_code;

    /* [插入表记录][风控证券_维度_证券维度关系表][字段][字段变量][5][@维度类型#,@控制条件维度编码串#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rksedm_stock_code_dimension(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, dime_type, 
        ctrl_cond_dim_code_str, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_dime_type, 
        v_ctrl_cond_dim_code_str, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.3.8.5";
        SET v_error_info =  CONCAT(concat("维度类型=",v_dime_type,",","控制条件维度编码串=",v_ctrl_cond_dim_code_str),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@记录序号#] */
    select LAST_INSERT_ID() into v_row_id;


    /* [获取表记录变量语句][风控证券_维度_证券维度关系表][字段][字段变量][{记录序号} = @记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        dime_type, ctrl_cond_dim_code_str, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_dime_type, v_ctrl_cond_dim_code_str, v_remark_info from db_rksecu.tb_rksedm_stock_code_dimension where row_id = v_row_id limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_修改机构维度类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_UpdateUserDimensionType;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_UpdateUserDimensionType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_user_dim_type int,
    IN p_dime_type_code varchar(32),
    IN p_dime_type_name varchar(64),
    IN p_weight_type int,
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
    declare v_user_dim_type int;
    declare v_dime_type_code varchar(32);
    declare v_dime_type_name varchar(64);
    declare v_weight_type int;
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
    SET v_user_dim_type = p_user_dim_type;
    SET v_dime_type_code = p_dime_type_code;
    SET v_dime_type_name = p_dime_type_name;
    SET v_weight_type = p_weight_type;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][风控证券_维度_机构维度类型表][{维度类型名称}=@维度类型名称#,{权重类型}=@权重类型#,{备注信息}=@备注信息#][{机构维度类型}=@机构维度类型# and {机构编号}=@机构编号# and {维度类型编码}=@维度类型编码#][2][@维度类型编码#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rksedm_user_dimension_type set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, dime_type_name=v_dime_type_name,weight_type=v_weight_type,remark_info=v_remark_info where user_dim_type=v_user_dim_type and co_no=v_co_no and dime_type_code=v_dime_type_code;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.3.9.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("维度类型编码=",v_dime_type_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("维度类型编码=",v_dime_type_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_删除机构维度类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_DeleteUserDimensionType;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_DeleteUserDimensionType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_user_dim_type int,
    IN p_dime_type_code varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_user_dim_type int;
    declare v_dime_type_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_user_dim_type = p_user_dim_type;
    SET v_dime_type_code = p_dime_type_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][风控证券_维度_机构维度类型表][{机构维度类型}=@机构维度类型# and {机构编号}=@机构编号# and {维度类型编码}=@维度类型编码#][3][@维度类型编码#] */
    delete from db_rksecu.tb_rksedm_user_dimension_type 
        where user_dim_type=v_user_dim_type and co_no=v_co_no and dime_type_code=v_dime_type_code;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.3.10.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("维度类型编码=",v_dime_type_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("维度类型编码=",v_dime_type_code);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][风控证券_维度_证券维度关系表][{维度类型}=4 and {机构编号}=@机构编号# and {控制条件维度编码串}=@维度类型编码#][3][@维度类型编码#] */
    delete from db_rksecu.tb_rksedm_stock_code_dimension 
        where dime_type=4 and co_no=v_co_no and ctrl_cond_dim_code_str=v_dime_type_code;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.3.10.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("维度类型编码=",v_dime_type_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("维度类型编码=",v_dime_type_code);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][风控证券_维度_机构维度证券代码表][{机构编号}=@机构编号# and {维度类型编码}=@维度类型编码#][3][@维度类型编码#] */
    delete from db_rksecu.tb_rksedm_user_dimension_stock 
        where co_no=v_co_no and dime_type_code=v_dime_type_code;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.3.10.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("维度类型编码=",v_dime_type_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("维度类型编码=",v_dime_type_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_查询机构维度类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_QueryUserDimensionType;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_QueryUserDimensionType(
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
    

    /* [获取表全记录][风控证券_维度_机构维度类型表][字段][{机构编号}= @机构编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        user_dim_type, dime_type_code, dime_type_name, weight_type, 
        remark_info from db_rksecu.tb_rksedm_user_dimension_type where co_no= v_co_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_新增机构维度证券代码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_InsertUserDimensionStock;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_InsertUserDimensionStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_dime_type_code varchar(32),
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_stock_type int,
    IN p_weight_value decimal(18,4),
    IN p_weight_ratio decimal(18,2),
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
    declare v_dime_type_code varchar(32);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_stock_type int;
    declare v_weight_value decimal(18,4);
    declare v_weight_ratio decimal(18,2);
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
    SET v_dime_type_code = p_dime_type_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_stock_type = p_stock_type;
    SET v_weight_value = p_weight_value;
    SET v_weight_ratio = p_weight_ratio;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][风控证券_维度_机构维度证券代码表][字段][字段变量][{证券类型}=@证券类型#,{权重值}=@权重值#,{权重比例}=@权重比例#,{备注信息}=@备注信息#][2][@维度类型编码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rksedm_user_dimension_stock (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, dime_type_code, 
        exch_no, stock_code_no, stock_code, stock_name, 
        stock_type, weight_value, weight_ratio, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_dime_type_code, 
        v_exch_no, v_stock_code_no, v_stock_code, v_stock_name, 
        v_stock_type, v_weight_value, v_weight_ratio, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, stock_type=v_stock_type,weight_value=v_weight_value,weight_ratio=v_weight_ratio,remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.3.12.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("维度类型编码=",v_dime_type_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("维度类型编码=",v_dime_type_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_删除机构维度证券代码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_DeleteUserDimensionStock;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_DeleteUserDimensionStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_dime_type_code varchar(32),
    IN p_exch_no int,
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
    declare v_co_no int;
    declare v_dime_type_code varchar(32);
    declare v_exch_no int;
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
    SET v_co_no = p_co_no;
    SET v_dime_type_code = p_dime_type_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][风控证券_维度_机构维度证券代码表][{机构编号}=@机构编号# and {维度类型编码}=@维度类型编码# and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号#][3][@维度类型编码#] */
    delete from db_rksecu.tb_rksedm_user_dimension_stock 
        where co_no=v_co_no and dime_type_code=v_dime_type_code and exch_no=v_exch_no and stock_code_no=v_stock_code_no;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.3.13.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("维度类型编码=",v_dime_type_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("维度类型编码=",v_dime_type_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_查询机构维度证券代码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_QueryUserDimensionStock;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_QueryUserDimensionStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_dime_type_code varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_dime_type_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_dime_type_code = p_dime_type_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][风控证券_维度_机构维度证券代码表][字段][{机构编号}=(case when @机构编号#<>0 then @机构编号# else {机构编号} end) and {维度类型编码}=(case when @维度类型编码#<>" " then @维度类型编码# else {维度类型编码} end)] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        dime_type_code, exch_no, stock_code_no, stock_code, 
        stock_name, stock_type, weight_value, weight_ratio, 
        remark_info from db_rksecu.tb_rksedm_user_dimension_stock where co_no=(case when v_co_no<>0 then v_co_no else co_no end) and dime_type_code=(case when v_dime_type_code<>" " then v_dime_type_code else dime_type_code end);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_维度序号获取范围
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_GetRangeByDimeId;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_GetRangeByDimeId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_dime_id bigint,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_trig_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_stock_code_no int,
    OUT p_cash_asset_flag int
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
    declare v_dime_id bigint;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_trig_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_stock_code_no int;
    declare v_cash_asset_flag int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_dime_type int;
    declare v_ctrl_cond_dim_code_str varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_dime_id = p_dime_id;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_trig_type = p_trig_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_stock_code_no = 0;
    SET v_cash_asset_flag = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_dime_type = 0;
    SET v_ctrl_cond_dim_code_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_计算_证券信息表][{证券类型},{证券代码编号},{资产类型}][@证券类型#,@证券代码编号#,@资产类型#][{市场编号} = @市场编号# and {证券代码} = @证券代码#] */
    select stock_type,stock_code_no,asset_type into v_stock_type,v_stock_code_no,v_asset_type from db_rksecu.tb_rksecc_secu_stock_info where exch_no = v_exch_no and stock_code = v_stock_code limit 1;


    /* [获取表记录变量语句][风控证券_维度_证券维度关系表][{维度类型},{控制条件维度编码串}][@维度类型#,@控制条件维度编码串#][{记录序号} = @维度序号#] */
    select dime_type,ctrl_cond_dim_code_str into v_dime_type,v_ctrl_cond_dim_code_str from db_rksecu.tb_rksedm_stock_code_dimension where row_id = v_dime_id limit 1;


    /* set @现金资产标志#  = 0; */
    set v_cash_asset_flag  = 0;

    /* if @维度类型# = -1 then */
    if v_dime_type = -1 then

      /* set @记录个数# = 1; */
      set v_record_count = 1;

      /* [检查正常返回][@维度类型# = -1] */
      if v_dime_type = -1 then
          leave label_pro;
      end if;


    /* elseif @维度类型# = 1 then */
    elseif v_dime_type = 1 then

      /* if instr(concat(";",@控制条件维度编码串#,";") , concat(";",1001, ";")) > 0 then */
      if instr(concat(";",v_ctrl_cond_dim_code_str,";") , concat(";",1001, ";")) > 0 then

        /* set @控制条件维度编码串# = replace(@控制条件维度编码串#, "1001", "1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20"); */
        set v_ctrl_cond_dim_code_str = replace(v_ctrl_cond_dim_code_str, "1001", "1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20");
      end if;

      /* if instr(concat(";",@控制条件维度编码串#,";") , concat(";",1002, ";")) > 0 then */
      if instr(concat(";",v_ctrl_cond_dim_code_str,";") , concat(";",1002, ";")) > 0 then

        /* set @控制条件维度编码串# = replace(@控制条件维度编码串#, "1002", "21;22;23;24;25;26;27;28;29;30;31;32;33;34;35;36;37;38;39;40;41;42;43;44;45;46;47;48;49"); */
        set v_ctrl_cond_dim_code_str = replace(v_ctrl_cond_dim_code_str, "1002", "21;22;23;24;25;26;27;28;29;30;31;32;33;34;35;36;37;38;39;40;41;42;43;44;45;46;47;48;49");
      end if;

      /* if instr(concat(";",@控制条件维度编码串#,";") , concat(";",1003, ";")) > 0 then */
      if instr(concat(";",v_ctrl_cond_dim_code_str,";") , concat(";",1003, ";")) > 0 then

        /* set @控制条件维度编码串# = replace(@控制条件维度编码串#, "1003", "51;52;53;54;55;56;57;58;59;60;61;62;63;64;65;66;67;68;69"); */
        set v_ctrl_cond_dim_code_str = replace(v_ctrl_cond_dim_code_str, "1003", "51;52;53;54;55;56;57;58;59;60;61;62;63;64;65;66;67;68;69");
      end if;

      /* if instr(concat(";",@控制条件维度编码串#,";") , concat(";",@证券类型#, ";")) > 0 or @控制条件维度编码串# = "-1" then */
      if instr(concat(";",v_ctrl_cond_dim_code_str,";") , concat(";",v_stock_type, ";")) > 0 or v_ctrl_cond_dim_code_str = "-1" then

        /* set @记录个数# =1; */
        set v_record_count =1;
      else

        /* set @记录个数# =0; */
        set v_record_count =0;
      end if;

    /* elseif @维度类型# = 2 then */
    elseif v_dime_type = 2 then

      /* [获取表记录数量][风控证券_维度_指数证券代码表][@记录个数#][{指数编码} = @控制条件维度编码串#  and {证券代码} = @证券代码#] */
      select count(1) into v_record_count from db_rksecu.tb_rksedm_index_stock where index_code = v_ctrl_cond_dim_code_str  and stock_code = v_stock_code;


    /* elseif @维度类型# = 3 then */
    elseif v_dime_type = 3 then

      /* [获取表记录数量][风控证券_维度_行业证券代码表][@记录个数#][{行业编码} = @控制条件维度编码串# and {证券代码} = @证券代码#] */
      select count(1) into v_record_count from db_rksecu.tb_rksedm_industry_stock where indu_code = v_ctrl_cond_dim_code_str and stock_code = v_stock_code;


    /* elseif @维度类型# = 4 then */
    elseif v_dime_type = 4 then

      /* [获取表记录数量][风控证券_维度_机构维度证券代码表][@记录个数#][{机构编号} = @机构编号# and {维度类型编码} = @控制条件维度编码串# and {证券代码} = @证券代码#] */
      select count(1) into v_record_count from db_rksecu.tb_rksedm_user_dimension_stock where co_no = v_co_no and dime_type_code = v_ctrl_cond_dim_code_str and stock_code = v_stock_code;


    /* elseif @维度类型# = 5 then */
    elseif v_dime_type = 5 then

      /* [获取表记录数量][风控证券_维度_自定义维度证券代码表][@记录个数#][{维度类型编码} = @控制条件维度编码串# and {证券代码} = @证券代码#] */
      select count(1) into v_record_count from db_rksecu.tb_rksedm_custom_dimension_stock where dime_type_code = v_ctrl_cond_dim_code_str and stock_code = v_stock_code;


    /* elseif @维度类型# = 9 then */
    elseif v_dime_type = 9 then
      #风控资产类型和证券的资产进行转换，判断

      /* set @控制条件维度编码串# = concat(";",@控制条件维度编码串#,";"); */
      set v_ctrl_cond_dim_code_str = concat(";",v_ctrl_cond_dim_code_str,";");

      /* if instr(@控制条件维度编码串# , concat(";",1, ";")) > 0  then */
      if instr(v_ctrl_cond_dim_code_str , concat(";",1, ";")) > 0  then

        /* set @控制条件维度编码串# = replace(@控制条件维度编码串#, ";1;", ";11;"); */
        set v_ctrl_cond_dim_code_str = replace(v_ctrl_cond_dim_code_str, ";1;", ";11;");
      end if;

      /* if instr(@控制条件维度编码串# , concat(";",2, ";")) > 0  then */
      if instr(v_ctrl_cond_dim_code_str , concat(";",2, ";")) > 0  then

        /* set @控制条件维度编码串# = replace(@控制条件维度编码串#, ";2;", ";21;22;23;24;25;26;27;"); */
        set v_ctrl_cond_dim_code_str = replace(v_ctrl_cond_dim_code_str, ";2;", ";21;22;23;24;25;26;27;");
      end if;

      /* if instr(@控制条件维度编码串# , concat(";",3, ";")) > 0  then */
      if instr(v_ctrl_cond_dim_code_str , concat(";",3, ";")) > 0  then

        /* set @控制条件维度编码串# = replace(@控制条件维度编码串#, ";3;", ";51;52;53;54;55;"); */
        set v_ctrl_cond_dim_code_str = replace(v_ctrl_cond_dim_code_str, ";3;", ";51;52;53;54;55;");
      end if;

      /* if instr(@控制条件维度编码串#, concat(";",101, ";")) > 0  then */
      if instr(v_ctrl_cond_dim_code_str, concat(";",101, ";")) > 0  then

        /* set @控制条件维度编码串# = replace(@控制条件维度编码串#, ";101;", ";43;"); */
        set v_ctrl_cond_dim_code_str = replace(v_ctrl_cond_dim_code_str, ";101;", ";43;");
      end if;
      #只有现金资产，买要判断小于方向相关，卖要判断大于方向相关

      /* if @控制条件维度编码串# = concat(";",4, ";")   then */
      if v_ctrl_cond_dim_code_str = concat(";",4, ";")   then

        /* set @记录个数# =1; */
        set v_record_count =1;

        /* set @现金资产标志#  = 2; */
        set v_cash_asset_flag  = 2;

      /* elseif instr(@控制条件维度编码串#, concat(";",4, ";")) > 0  then */
      elseif instr(v_ctrl_cond_dim_code_str, concat(";",4, ";")) > 0  then
        #控制混合资产，包含现金资产，并且下单券也在控制的资产类型中，这种情况下是不判断风控的，因为总资产计算值是不变的

        /* if instr(@控制条件维度编码串# , concat(";",@资产类型#, ";")) > 0 then */
        if instr(v_ctrl_cond_dim_code_str , concat(";",v_asset_type, ";")) > 0 then

          /* set @记录个数# =0; */
          set v_record_count =0;
        #控制混合资产，包含现金资产，下单券不在控制的资产类型中，买入：总的计算值变小，要判断小于方向相关；卖出：总的计算值变大，要大于方向

        /* elseif instr(@控制条件维度编码串# , concat(";",@资产类型#, ";")) <= 0  then */
        elseif instr(v_ctrl_cond_dim_code_str , concat(";",v_asset_type, ";")) <= 0  then

          /* if (@订单方向#=《订单方向-卖出》 or @订单方向# = 《订单方向-融资买入》) and (@触发方向# =《触发方向-大于》 or  @触发方向# =《触发方向-大于等于》) or (@订单方向#=《订单方向-买入》 or @订单方向# = 《订单方向-融券卖出》) and (@触发方向# =《触发方向-小于》 or  @触发方向# =《触发方向-小于等于》) then */
          if (v_order_dir=2 or v_order_dir = 5) and (v_trig_type =1 or  v_trig_type =2) or (v_order_dir=1 or v_order_dir = 6) and (v_trig_type =3 or  v_trig_type =4) then

              /* set @记录个数# =1; */
              set v_record_count =1;

              /* set @现金资产标志#  = 1; */
              set v_cash_asset_flag  = 1;
          end if;
        end if;

      /* elseif instr(@控制条件维度编码串# , concat(";",@资产类型#, ";")) > 0 then */
      elseif instr(v_ctrl_cond_dim_code_str , concat(";",v_asset_type, ";")) > 0 then

        /* set @记录个数# =1; */
        set v_record_count =1;
      else

        /* set @记录个数# =0; */
        set v_record_count =0;
      end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;
    SET p_stock_code_no = v_stock_code_no;
    SET p_cash_asset_flag = v_cash_asset_flag;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_维度序号获取维度编码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_QueryDimCodeByDimID;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_QueryDimCodeByDimID(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_dime_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_dime_id bigint;
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
    SET v_dime_id = p_dime_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][风控证券_维度_证券维度关系表][{记录序号},{机构编号},{维度类型},{控制条件维度编码串}][{记录序号} = @维度序号# or @维度序号# = 0][@指定行数#] */
    if v_row_count = -1 then
        select row_id,co_no,dime_type,ctrl_cond_dim_code_str from db_rksecu.tb_rksedm_stock_code_dimension where row_id = v_dime_id or v_dime_id = 0;
    else
        select row_id,co_no,dime_type,ctrl_cond_dim_code_str from db_rksecu.tb_rksedm_stock_code_dimension where row_id = v_dime_id or v_dime_id = 0 limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_维度编码获取维度序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_QueryDimIDByDimCode;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_QueryDimIDByDimCode(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_dime_type int,
    IN p_ctrl_cond_dim_code_str varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_dime_id bigint,
    OUT p_deal_flag int
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
    declare v_dime_type int;
    declare v_ctrl_cond_dim_code_str varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_dime_id bigint;
    declare v_deal_flag int;
    declare v_remark_info varchar(255);
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
    SET v_dime_type = p_dime_type;
    SET v_ctrl_cond_dim_code_str = p_ctrl_cond_dim_code_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_dime_id = 0;
    SET v_deal_flag = 0;
    SET v_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @备注信息# = "查询补录"; */
    set v_remark_info = "查询补录";

    /* set @处理标志# = 0; */
    set v_deal_flag = 0;

    /* [获取表记录变量语句][风控证券_维度_证券维度关系表][{记录序号}][@维度序号#][{机构编号} = @机构编号# and {维度类型} = @维度类型# and {控制条件维度编码串} = @控制条件维度编码串#] */
    select row_id into v_dime_id from db_rksecu.tb_rksedm_stock_code_dimension where co_no = v_co_no and dime_type = v_dime_type and ctrl_cond_dim_code_str = v_ctrl_cond_dim_code_str limit 1;

    if FOUND_ROWS()  = 0 then

      /* [插入表记录][风控证券_维度_证券维度关系表][字段][字段变量][5][@维度类型#,@控制条件维度编码串#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_rksecu.tb_rksedm_stock_code_dimension(
          create_date, create_time, update_date, 
          update_time, update_times, co_no, dime_type, 
          ctrl_cond_dim_code_str, remark_info) 
      value( 
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_co_no, v_dime_type, 
          v_ctrl_cond_dim_code_str, v_remark_info);
      if v_error_code = "1" then
                  
          SET v_error_code = "rksecuA.3.18.5";
          SET v_error_info =  CONCAT(concat("维度类型=",v_dime_type,",","控制条件维度编码串=",v_ctrl_cond_dim_code_str),"#",v_mysql_message);
          leave label_pro;
      end if;


      /* [获取记录序号][@维度序号#] */
      select LAST_INSERT_ID() into v_dime_id;


      /* set @处理标志# = 1; */
      set v_deal_flag = 1;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_dime_id = v_dime_id;
    SET p_deal_flag = v_deal_flag;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_生成自定义维度代码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_CreateCustomDimensionStockService;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_CreateCustomDimensionStockService(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_dime_type_code varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_dime_type_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_dime_sql_script varchar(10000);
    declare v_dime_sql_create_type int;
    declare v_weight_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_dime_type_code = p_dime_type_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_dime_sql_script = " ";
    SET v_dime_sql_create_type = 0;
    SET v_weight_type = 0;

    
    label_pro:BEGIN
    

    /* [删除表记录][风控证券_维度_自定义维度证券代码表][{维度类型编码} = @维度类型编码#][1]["维度证券代码表删除失败"] */
    delete from db_rksecu.tb_rksedm_custom_dimension_stock 
        where dime_type_code = v_dime_type_code;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.3.19.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("维度证券代码表删除失败","#",v_mysql_message);
        else
            SET v_error_info = "维度证券代码表删除失败";
        end if;
        leave label_pro;
    end if;


    /* [声明游标][风控证券_维度_自定义维度类型表][{维度类型编码},{维度脚本},{维度代码生成类型},{权重类型}][{维度代码生成类型}=2 and {维度脚本} <> ' ' and {维度类型编码} = @维度类型编码# ][cur_customdimensionstockservice] */
    cur_customdimensionstockservice:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cur_customdimensionstockservice CURSOR FOR
        select dime_type_code,dime_sql_script,dime_sql_create_type,weight_type 
        from db_rksecu.tb_rksedm_custom_dimension_type 
        where dime_sql_create_type=2 and dime_sql_script <> ' ' and dime_type_code = v_dime_type_code ;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@维度类型编码#,@维度脚本#,@维度代码生成类型#,@权重类型#][cur_customdimensionstockservice][customdimensionstockservice] */
    open cur_customdimensionstockservice;
    customdimensionstockservice: LOOP
    fetch cur_customdimensionstockservice into v_dime_type_code,v_dime_sql_script,v_dime_sql_create_type,v_weight_type;
        IF v_cursor_done THEN
            LEAVE customdimensionstockservice;
        END IF;


    /* [执行语句][@维度脚本#] */
    set @tmp_sql = v_dime_sql_script;
    PREPARE stmt from @tmp_sql;
    EXECUTE stmt;
    set @tmp_sql = '';
    DEALLOCATE PREPARE stmt;


    /* [关闭游标][cur_customdimensionstockservice] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cur_customdimensionstockservice;
    end cur_customdimensionstockservice;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_获取H股代码关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_GetHstockCode;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_GetHstockCode(
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
    OUT p_hk_stock_code varchar(16)
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
    declare v_hk_stock_code varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_hk_stock_code = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_维度_A+H股关系对照表][{标的代码}][@港股代码#][{市场编号}=@市场编号# and {证券代码}=@证券代码#] */
    select target_code into v_hk_stock_code from db_rksecu.tb_rksedm_AH_code_Relationship where exch_no=v_exch_no and stock_code=v_stock_code limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_hk_stock_code = v_hk_stock_code;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_获取A股代码关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_GetAstockCode;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_GetAstockCode(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_hk_stock_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code varchar(6),
    OUT p_exch_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_hk_stock_code varchar(16);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_hk_stock_code = p_hk_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code = " ";
    SET v_exch_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_维度_A+H股关系对照表][{证券代码}, {市场编号}][@证券代码#, @市场编号#][{标的代码}=@港股代码#] */
    select stock_code, exch_no into v_stock_code, v_exch_no from db_rksecu.tb_rksedm_AH_code_Relationship where target_code=v_hk_stock_code limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code = v_stock_code;
    SET p_exch_no = v_exch_no;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_维度序号获取维度信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_QueryDimInfoByDimID;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_QueryDimInfoByDimID(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_dime_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_dime_type int,
    OUT p_ctrl_cond_dim_code_str varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_dime_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_dime_type int;
    declare v_ctrl_cond_dim_code_str varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_dime_id = p_dime_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_dime_type = 0;
    SET v_ctrl_cond_dim_code_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_维度_证券维度关系表][{机构编号},{维度类型},{控制条件维度编码串}][@机构编号#, @维度类型#, @控制条件维度编码串#][{记录序号} = @维度序号#] */
    select co_no,dime_type,ctrl_cond_dim_code_str into v_co_no, v_dime_type, v_ctrl_cond_dim_code_str from db_rksecu.tb_rksedm_stock_code_dimension where row_id = v_dime_id limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_dime_type = v_dime_type;
    SET p_ctrl_cond_dim_code_str = v_ctrl_cond_dim_code_str;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_维度获取计算范围
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksedm_GetCalcRangeByDimeId;;
DELIMITER ;;
CREATE PROCEDURE pra_rksedm_GetCalcRangeByDimeId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_dime_id bigint,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_order_dir_str varchar(1024),
    IN p_trig_type int,
    IN p_stock_code_no int,
    IN p_order_batch_no int,
    IN p_trig_stage_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_cash_asset_flag int
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
    declare v_dime_id bigint;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_trig_type int;
    declare v_stock_code_no int;
    declare v_order_batch_no int;
    declare v_trig_stage_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_cash_asset_flag int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_dime_type int;
    declare v_ctrl_cond_dim_code_str varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_dime_id = p_dime_id;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_trig_type = p_trig_type;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_cash_asset_flag = 0;
    SET v_stock_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_dime_type = 0;
    SET v_ctrl_cond_dim_code_str = " ";

    
    label_pro:BEGIN
    

    /* set @记录个数# =0; */
    set v_record_count =0;

        /* [获取表记录变量语句][风控证券_计算_证券信息表][{证券代码},{证券类型},{资产类型}][@证券代码#,@证券类型#,@资产类型#][{证券代码编号} = @证券代码编号#] */
        select stock_code,stock_type,asset_type into v_stock_code,v_stock_type,v_asset_type from db_rksecu.tb_rksecc_secu_stock_info where stock_code_no = v_stock_code_no limit 1;


        /* [获取表记录变量语句][风控证券_维度_证券维度关系表][{维度类型},{控制条件维度编码串}][@维度类型#,@控制条件维度编码串#][{记录序号} = @维度序号#] */
        select dime_type,ctrl_cond_dim_code_str into v_dime_type,v_ctrl_cond_dim_code_str from db_rksecu.tb_rksedm_stock_code_dimension where row_id = v_dime_id limit 1;


        /* set @现金资产标志#  = 0; */
        set v_cash_asset_flag  = 0;

        /* if @维度类型# = -1 then */
        if v_dime_type = -1 then

          /* set @记录个数# = @记录个数#+1; */
          set v_record_count = v_record_count+1;

          /* [检查正常返回][@维度类型# = -1] */
          if v_dime_type = -1 then
              leave label_pro;
          end if;


        /* elseif @维度类型# = 1 then */
        elseif v_dime_type = 1 then

          /* if instr(concat(";",@控制条件维度编码串#,";") , concat(";",1001, ";")) > 0 then */
          if instr(concat(";",v_ctrl_cond_dim_code_str,";") , concat(";",1001, ";")) > 0 then

            /* set @控制条件维度编码串# = replace(@控制条件维度编码串#, "1001", "1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20"); */
            set v_ctrl_cond_dim_code_str = replace(v_ctrl_cond_dim_code_str, "1001", "1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20");
          end if;

          /* if instr(concat(";",@控制条件维度编码串#,";") , concat(";",1002, ";")) > 0 then */
          if instr(concat(";",v_ctrl_cond_dim_code_str,";") , concat(";",1002, ";")) > 0 then

            /* set @控制条件维度编码串# = replace(@控制条件维度编码串#, "1002", "21;22;23;24;25;26;27;28;29;30;31;32;33;34;35;36;37;38;39;40;41;42;43;44;45;46;47;48;49"); */
            set v_ctrl_cond_dim_code_str = replace(v_ctrl_cond_dim_code_str, "1002", "21;22;23;24;25;26;27;28;29;30;31;32;33;34;35;36;37;38;39;40;41;42;43;44;45;46;47;48;49");
          end if;

          /* if instr(concat(";",@控制条件维度编码串#,";") , concat(";",1003, ";")) > 0 then */
          if instr(concat(";",v_ctrl_cond_dim_code_str,";") , concat(";",1003, ";")) > 0 then

            /* set @控制条件维度编码串# = replace(@控制条件维度编码串#, "1003", "51;52;53;54;55;56;57;58;59;60;61;62;63;64;65;66;67;68;69"); */
            set v_ctrl_cond_dim_code_str = replace(v_ctrl_cond_dim_code_str, "1003", "51;52;53;54;55;56;57;58;59;60;61;62;63;64;65;66;67;68;69");
          end if;

          /* if instr(concat(";",@控制条件维度编码串#,";") , concat(";",@证券类型#, ";")) > 0 or @控制条件维度编码串# = "-1" then */
          if instr(concat(";",v_ctrl_cond_dim_code_str,";") , concat(";",v_stock_type, ";")) > 0 or v_ctrl_cond_dim_code_str = "-1" then

            /* set @记录个数# =@记录个数#+1; */
            set v_record_count =v_record_count+1;
          else

            /* set @记录个数# =0; */
            set v_record_count =0;
          end if;

        /* elseif @维度类型# = 2 then */
        elseif v_dime_type = 2 then

          /* [获取表记录数量][风控证券_维度_指数证券代码表][@记录个数#][{指数编码} = @控制条件维度编码串#  and {证券代码} = @证券代码#] */
          select count(1) into v_record_count from db_rksecu.tb_rksedm_index_stock where index_code = v_ctrl_cond_dim_code_str  and stock_code = v_stock_code;


        /* elseif @维度类型# = 3 then */
        elseif v_dime_type = 3 then

          /* [获取表记录数量][风控证券_维度_行业证券代码表][@记录个数#][{行业编码} = @控制条件维度编码串# and {证券代码} = @证券代码#] */
          select count(1) into v_record_count from db_rksecu.tb_rksedm_industry_stock where indu_code = v_ctrl_cond_dim_code_str and stock_code = v_stock_code;


        /* elseif @维度类型# = 4 then */
        elseif v_dime_type = 4 then

          /* [获取表记录数量][风控证券_维度_机构维度证券代码表][@记录个数#][{机构编号} = @机构编号# and {维度类型编码} = @控制条件维度编码串# and {证券代码} = @证券代码#] */
          select count(1) into v_record_count from db_rksecu.tb_rksedm_user_dimension_stock where co_no = v_co_no and dime_type_code = v_ctrl_cond_dim_code_str and stock_code = v_stock_code;


        /* elseif @维度类型# = 5 then */
        elseif v_dime_type = 5 then

          /* [获取表记录数量][风控证券_维度_自定义维度证券代码表][@记录个数#][{维度类型编码} = @控制条件维度编码串# and {证券代码} = @证券代码#] */
          select count(1) into v_record_count from db_rksecu.tb_rksedm_custom_dimension_stock where dime_type_code = v_ctrl_cond_dim_code_str and stock_code = v_stock_code;


        /* elseif @维度类型# = 9 then */
        elseif v_dime_type = 9 then
          #风控资产类型和证券的资产进行转换，判断

          /* set @控制条件维度编码串# = concat(";",@控制条件维度编码串#,";"); */
          set v_ctrl_cond_dim_code_str = concat(";",v_ctrl_cond_dim_code_str,";");

          /* if instr(@控制条件维度编码串# , concat(";",1, ";")) > 0  then */
          if instr(v_ctrl_cond_dim_code_str , concat(";",1, ";")) > 0  then

            /* set @控制条件维度编码串# = replace(@控制条件维度编码串#, ";1;", ";11;"); */
            set v_ctrl_cond_dim_code_str = replace(v_ctrl_cond_dim_code_str, ";1;", ";11;");
          end if;

          /* if instr(@控制条件维度编码串# , concat(";",2, ";")) > 0  then */
          if instr(v_ctrl_cond_dim_code_str , concat(";",2, ";")) > 0  then

            /* set @控制条件维度编码串# = replace(@控制条件维度编码串#, ";2;", ";21;22;23;24;25;26;27;"); */
            set v_ctrl_cond_dim_code_str = replace(v_ctrl_cond_dim_code_str, ";2;", ";21;22;23;24;25;26;27;");
          end if;

          /* if instr(@控制条件维度编码串# , concat(";",3, ";")) > 0  then */
          if instr(v_ctrl_cond_dim_code_str , concat(";",3, ";")) > 0  then

            /* set @控制条件维度编码串# = replace(@控制条件维度编码串#, ";3;", ";51;52;53;54;55;"); */
            set v_ctrl_cond_dim_code_str = replace(v_ctrl_cond_dim_code_str, ";3;", ";51;52;53;54;55;");
          end if;

          /* if instr(@控制条件维度编码串#, concat(";",101, ";")) > 0  then */
          if instr(v_ctrl_cond_dim_code_str, concat(";",101, ";")) > 0  then

            /* set @控制条件维度编码串# = replace(@控制条件维度编码串#, ";101;", ";43;"); */
            set v_ctrl_cond_dim_code_str = replace(v_ctrl_cond_dim_code_str, ";101;", ";43;");
          end if;
          #只有现金资产，买要判断小于方向相关，卖要判断大于方向相关

          /* if @控制条件维度编码串# = concat(";",4, ";")   then */
          if v_ctrl_cond_dim_code_str = concat(";",4, ";")   then

            /* set @记录个数# =@记录个数#+1; */
            set v_record_count =v_record_count+1;

            /* set @现金资产标志#  = 2; */
            set v_cash_asset_flag  = 2;

          /* elseif instr(@控制条件维度编码串#, concat(";",4, ";")) > 0  then */
          elseif instr(v_ctrl_cond_dim_code_str, concat(";",4, ";")) > 0  then
            #控制混合资产，包含现金资产，并且下单券也在控制的资产类型中，这种情况下是不判断风控的，因为总资产计算值是不变的

            /* if instr(@控制条件维度编码串# , concat(";",@资产类型#, ";")) > 0 then */
            if instr(v_ctrl_cond_dim_code_str , concat(";",v_asset_type, ";")) > 0 then

              /* set @记录个数# =0; */
              set v_record_count =0;
            #控制混合资产，包含现金资产，下单券不在控制的资产类型中，买入：总的计算值变小，要判断小于方向相关；卖出：总的计算值变大，要大于方向

            /* elseif instr(@控制条件维度编码串# , concat(";",@资产类型#, ";")) <= 0  then */
            elseif instr(v_ctrl_cond_dim_code_str , concat(";",v_asset_type, ";")) <= 0  then
              #if (@订单方向#=《订单方向-卖出》 or @订单方向# = 《订单方向-融资买入》) and (@触发方向# =《触发方向-大于》 or  @触发方向# =《触发方向-大于等于》) or     (@订单方向#=《订单方向-买入》 or @订单方向# = 《订单方向-融券卖出》) and (@触发方向# =《触发方向-小于》 or  @触发方向# =《触发方向-小于等于》) then

                  /* set @记录个数# =@记录个数#+1; */
                  set v_record_count =v_record_count+1;

                  /* set @现金资产标志#  = 1; */
                  set v_cash_asset_flag  = 1;
              #end if;
            end if;

          /* elseif instr(@控制条件维度编码串# , concat(";",@资产类型#, ";")) > 0 then */
          elseif instr(v_ctrl_cond_dim_code_str , concat(";",v_asset_type, ";")) > 0 then

              /* set @记录个数# = @记录个数#+1; */
              set v_record_count = v_record_count+1;
          else

            /* set @记录个数# =0; */
            set v_record_count =0;
          end if;
        end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;
    SET p_cash_asset_flag = v_cash_asset_flag;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_查询证券代码股票池
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserm_QueryStockCodeDimensionType;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserm_QueryStockCodeDimensionType(
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
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录两表关联][风控证券_维度_机构维度证券代码表][风控证券_维度_机构维度类型表][a.{证券代码编号},a.{机构编号},a.{维度类型编码},GROUP_CONCAT(b.{维度类型名称}) as {备注信息} ][ a.{机构编号}=b.{机构编号} and a.{维度类型编码} = b.{维度类型编码} and a.{机构编号}=@操作员机构编号# and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", a.{证券代码编号}, ";")))
group by a.{机构编号},a.{证券代码编号}][@指定行数#] */
    if v_row_count = -1 then
        select a.stock_code_no,a.co_no,a.dime_type_code,GROUP_CONCAT(b.dime_type_name) as remark_info  from db_rksecu.tb_rksedm_user_dimension_stock a,db_rksecu.tb_rksedm_user_dimension_type b where  a.co_no=b.co_no and a.dime_type_code = b.dime_type_code and a.co_no=v_opor_co_no and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", a.stock_code_no, ";")))
    group by a.co_no,a.stock_code_no;
    else
        select a.stock_code_no,a.co_no,a.dime_type_code,GROUP_CONCAT(b.dime_type_name) as remark_info  from db_rksecu.tb_rksedm_user_dimension_stock a,db_rksecu.tb_rksedm_user_dimension_type b where  a.co_no=b.co_no and a.dime_type_code = b.dime_type_code and a.co_no=v_opor_co_no and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", a.stock_code_no, ";")))
    group by a.co_no,a.stock_code_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_维度_清空并新增指数证券代码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserm_ClearAndAddIndexStock;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserm_ClearAndAddIndexStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_index_name varchar(64),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_weight_ratio decimal(18,2),
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
    declare v_index_name varchar(64);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_weight_ratio decimal(18,2);
    declare v_stock_type int;
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_index_no int;
    declare v_index_code varchar(6);
    declare v_record_count int;
    declare v_weight_value decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_index_name = p_index_name;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_weight_ratio = p_weight_ratio;
    SET v_stock_type = p_stock_type;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_index_no = 0;
    SET v_index_code = " ";
    SET v_record_count = 0;
    SET v_weight_value = 0;
    SET v_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #根据证券代码以及交易市场查询证券代码信息

    /* set  @指数编号# = 0; */
    set  v_index_no = 0;

    /* set  @指数编码# = " "; */
    set  v_index_code = " ";

    /* select {指数编号} , {指数编码} into @指数编号#, @指数编码# from db_rksecu.tb_rksedm_index_type where {指数名称} = @指数名称# limit 1; */
    select index_no , index_code into v_index_no, v_index_code from db_rksecu.tb_rksedm_index_type where index_name = v_index_name limit 1;
    #判断是否需要清空当前表数据

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* select count(1) into @记录个数# from db_rksecu.tb_rksedm_index_stock where   CONVERT (date_format(now(), '%Y%m%d'),  signed INTEGER )  > update_date; */
    select count(1) into v_record_count from db_rksecu.tb_rksedm_index_stock where   CONVERT (date_format(now(), '%Y%m%d'),  signed INTEGER )  > update_date;

    /* if @记录个数# > 0 then */
    if v_record_count > 0 then

    /* [清空表记录][风控证券_维度_指数证券代码表] */
    truncate table db_rksecu.tb_rksedm_index_stock;

    end if;
    #新增指数证券代码信息

    /* set @权重值# = @权重比例#; */
    set v_weight_value = v_weight_ratio;

    /* set @备注信息# = '聚源数据同步'; */
    set v_remark_info = '聚源数据同步';

    /* [记录不存在插入表记录][风控证券_维度_指数证券代码表][字段][字段变量][@指数编号# = {指数编号} and {证券代码编号} = @证券代码编号# and {市场编号} = @市场编号#][5][@指数编号#, @证券代码编号#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rksedm_index_stock (
        create_date, create_time, update_date, 
        update_time, update_times, index_no, index_code, 
        index_name, exch_no, stock_code_no, stock_code, 
        stock_name, stock_type, weight_value, weight_ratio, 
        remark_info) 
        select v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_index_no, v_index_code, 
        v_index_name, v_exch_no, v_stock_code_no, v_stock_code, 
        v_stock_name, v_stock_type, v_weight_value, v_weight_ratio, 
        v_remark_info 
        from dual 
        where not exists(select * from db_rksecu.tb_rksedm_index_stock where v_index_no = index_no and stock_code_no = v_stock_code_no and exch_no = v_exch_no);
    if v_error_code <> "0" then
                
        SET v_error_code = "rksecuA.3.25.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指数编号=",v_index_no,","," 证券代码编号=", v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("指数编号=",v_index_no,","," 证券代码编号=", v_stock_code_no,","," 市场编号=", v_exch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


