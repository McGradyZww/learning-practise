DELIMITER ;;
use db_pub;;

# 原子_公共_融资融券基础数据_新增可冲抵保证金证券表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_AddCanOffsetMarginSecurities;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_AddCanOffsetMarginSecurities(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_co_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_discount_rate decimal(18,12),
    IN p_offset_status int,
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
    declare v_pass_no int;
    declare v_co_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_discount_rate decimal(18,12);
    declare v_offset_status int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_discount_rate = p_discount_rate;
    SET v_offset_status = p_offset_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][公共_融资融券基础数据_可冲抵保证金证券表][字段][字段变量][1][@证券代码编号#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesemdt_offset_margin_stock(
        create_date, create_time, update_date, 
        update_time, update_times, pass_no, co_no, 
        stock_code_no, exch_no, stock_code, discount_rate, 
        offset_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pass_no, v_co_no, 
        v_stock_code_no, v_exch_no, v_stock_code, v_discount_rate, 
        v_offset_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.29.1.1";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@记录序号#] */
    select LAST_INSERT_ID() into v_row_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_融资融券基础数据_修改可冲抵保证金证券表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_ModiCanOffsetMarginSecurities;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_ModiCanOffsetMarginSecurities(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_pass_no int,
    IN p_co_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_discount_rate decimal(18,12),
    IN p_offset_status int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pass_no int;
    declare v_co_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_discount_rate decimal(18,12);
    declare v_offset_status int;
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
    SET v_row_id = p_row_id;
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_discount_rate = p_discount_rate;
    SET v_offset_status = p_offset_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][公共_融资融券基础数据_可冲抵保证金证券表][字段][字段变量][{通道编号}=@通道编号#,{机构编号}=@机构编号#,{证券代码编号}=@证券代码编号#,{证券代码}=@证券代码#,{市场编号}=@市场编号#,{折算率}=@折算率#,{冲抵状态}=@冲抵状态#][2][@记录序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesemdt_offset_margin_stock (
        create_date, create_time, update_date, 
        update_time, update_times, pass_no, co_no, 
        stock_code_no, exch_no, stock_code, discount_rate, 
        offset_status) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pass_no, v_co_no, 
        v_stock_code_no, v_exch_no, v_stock_code, v_discount_rate, 
        v_offset_status) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pass_no=v_pass_no,co_no=v_co_no,stock_code_no=v_stock_code_no,stock_code=v_stock_code,exch_no=v_exch_no,discount_rate=v_discount_rate,offset_status=v_offset_status;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.29.2.2";
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

# 原子_公共_融资融券基础数据_删除可冲抵保证金证券表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_DelCanOffsetMarginSecurities;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_DelCanOffsetMarginSecurities(
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
    

    /* [删除表记录][公共_融资融券基础数据_可冲抵保证金证券表][{记录序号}=@记录序号#][3][@记录序号#] */
    delete from db_pub.tb_basesemdt_offset_margin_stock 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.29.3.3";
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

# 原子_公共_融资融券基础数据_查询可冲抵保证金证券表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_QueryCanOffsetMarginSecurities;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_QueryCanOffsetMarginSecurities(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_co_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_pass_no int;
    declare v_co_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][公共_融资融券基础数据_可冲抵保证金证券表][字段][(@通道编号# = 0 or {通道编号}=@通道编号#) and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码# = " " or {证券代码}=@证券代码#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, exch_no, stock_code, 
            discount_rate, offset_status from db_pub.tb_basesemdt_offset_margin_stock where (v_pass_no = 0 or pass_no=v_pass_no) and (v_co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, exch_no, stock_code, 
            discount_rate, offset_status from db_pub.tb_basesemdt_offset_margin_stock where (v_pass_no = 0 or pass_no=v_pass_no) and (v_co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][公共_融资融券基础数据_可冲抵保证金证券表][字段][(@通道编号# = 0 or {通道编号}=@通道编号#) and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码# = " " or {证券代码}=@证券代码#) and {记录序号}>@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, exch_no, stock_code, 
            discount_rate, offset_status from db_pub.tb_basesemdt_offset_margin_stock where (v_pass_no = 0 or pass_no=v_pass_no) and (v_co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, exch_no, stock_code, 
            discount_rate, offset_status from db_pub.tb_basesemdt_offset_margin_stock where (v_pass_no = 0 or pass_no=v_pass_no) and (v_co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_融资融券基础数据_新增融资融券配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_AddSecuMarginAllocation;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_AddSecuMarginAllocation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_co_no int,
    IN p_fina_year_intrst_rate decimal(18,12),
    IN p_secu_loan_year_intrst_rate decimal(18,12),
    IN p_fina_pen_intrst_rate decimal(18,12),
    IN p_secu_loan_pen_intrst_rate decimal(18,12),
    IN p_intrst_sett_day int,
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
    declare v_pass_no int;
    declare v_co_no int;
    declare v_fina_year_intrst_rate decimal(18,12);
    declare v_secu_loan_year_intrst_rate decimal(18,12);
    declare v_fina_pen_intrst_rate decimal(18,12);
    declare v_secu_loan_pen_intrst_rate decimal(18,12);
    declare v_intrst_sett_day int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_fina_year_intrst_rate = p_fina_year_intrst_rate;
    SET v_secu_loan_year_intrst_rate = p_secu_loan_year_intrst_rate;
    SET v_fina_pen_intrst_rate = p_fina_pen_intrst_rate;
    SET v_secu_loan_pen_intrst_rate = p_secu_loan_pen_intrst_rate;
    SET v_intrst_sett_day = p_intrst_sett_day;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][公共_融资融券基础数据_融资融券配置表][字段][字段变量][1][@通道编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesemdt_secu_margin_allocation(
        create_date, create_time, update_date, 
        update_time, update_times, pass_no, co_no, 
        fina_year_intrst_rate, secu_loan_year_intrst_rate, fina_pen_intrst_rate, secu_loan_pen_intrst_rate, 
        intrst_sett_day) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pass_no, v_co_no, 
        v_fina_year_intrst_rate, v_secu_loan_year_intrst_rate, v_fina_pen_intrst_rate, v_secu_loan_pen_intrst_rate, 
        v_intrst_sett_day);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.29.5.1";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@记录序号#] */
    select LAST_INSERT_ID() into v_row_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_融资融券基础数据_修改融资融券配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_ModiSecuMarginAllocation;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_ModiSecuMarginAllocation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_co_no int,
    IN p_fina_year_intrst_rate decimal(18,12),
    IN p_secu_loan_year_intrst_rate decimal(18,12),
    IN p_fina_pen_intrst_rate decimal(18,12),
    IN p_secu_loan_pen_intrst_rate decimal(18,12),
    IN p_intrst_sett_day int,
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
    declare v_pass_no int;
    declare v_co_no int;
    declare v_fina_year_intrst_rate decimal(18,12);
    declare v_secu_loan_year_intrst_rate decimal(18,12);
    declare v_fina_pen_intrst_rate decimal(18,12);
    declare v_secu_loan_pen_intrst_rate decimal(18,12);
    declare v_intrst_sett_day int;
    declare v_row_id bigint;
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
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_fina_year_intrst_rate = p_fina_year_intrst_rate;
    SET v_secu_loan_year_intrst_rate = p_secu_loan_year_intrst_rate;
    SET v_fina_pen_intrst_rate = p_fina_pen_intrst_rate;
    SET v_secu_loan_pen_intrst_rate = p_secu_loan_pen_intrst_rate;
    SET v_intrst_sett_day = p_intrst_sett_day;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][公共_融资融券基础数据_融资融券配置表][字段][字段变量][{通道编号}=@通道编号#,{机构编号}=@机构编号#,{融资年利率}=@融资年利率#,{融券年利率}=@融券年利率#,{融资罚息利率}=@融资罚息利率#,{融券罚息利率}=@融券罚息利率#,{结息日期}=@结息日期#][2][@记录序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesemdt_secu_margin_allocation (
        create_date, create_time, update_date, 
        update_time, update_times, pass_no, co_no, 
        fina_year_intrst_rate, secu_loan_year_intrst_rate, fina_pen_intrst_rate, secu_loan_pen_intrst_rate, 
        intrst_sett_day) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pass_no, v_co_no, 
        v_fina_year_intrst_rate, v_secu_loan_year_intrst_rate, v_fina_pen_intrst_rate, v_secu_loan_pen_intrst_rate, 
        v_intrst_sett_day) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pass_no=v_pass_no,co_no=v_co_no,fina_year_intrst_rate=v_fina_year_intrst_rate,secu_loan_year_intrst_rate=v_secu_loan_year_intrst_rate,fina_pen_intrst_rate=v_fina_pen_intrst_rate,secu_loan_pen_intrst_rate=v_secu_loan_pen_intrst_rate,intrst_sett_day=v_intrst_sett_day;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.29.6.2";
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

# 原子_公共_融资融券基础数据_删除融资融券配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_DelSecuMarginAllocation;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_DelSecuMarginAllocation(
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
    

    /* [删除表记录][公共_融资融券基础数据_融资融券配置表][{记录序号}=@记录序号#][3][@记录序号#] */
    delete from db_pub.tb_basesemdt_secu_margin_allocation 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.29.7.3";
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

# 原子_公共_融资融券基础数据_查询融资融券配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_QuerySecuMarginAllocation;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_QuerySecuMarginAllocation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_pass_no int,
    IN p_co_no int,
    IN p_sort_type int,
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
    declare v_pass_no int;
    declare v_co_no int;
    declare v_sort_type int;
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
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_sort_type = p_sort_type;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][公共_融资融券基础数据_融资融券配置表][字段][(@通道编号# = 0 or {通道编号}=@通道编号#) and (@机构编号# = 0 or {机构编号}=@机构编号#) and {记录序号}>@记录序号# order by {记录序号} ][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, fina_year_intrst_rate, secu_loan_year_intrst_rate, fina_pen_intrst_rate, 
            secu_loan_pen_intrst_rate, intrst_sett_day from db_pub.tb_basesemdt_secu_margin_allocation where (v_pass_no = 0 or pass_no=v_pass_no) and (v_co_no = 0 or co_no=v_co_no) and row_id>v_row_id order by row_id ;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, fina_year_intrst_rate, secu_loan_year_intrst_rate, fina_pen_intrst_rate, 
            secu_loan_pen_intrst_rate, intrst_sett_day from db_pub.tb_basesemdt_secu_margin_allocation where (v_pass_no = 0 or pass_no=v_pass_no) and (v_co_no = 0 or co_no=v_co_no) and row_id>v_row_id order by row_id  limit v_row_count;
        end if;

    else

        /* [获取表记录][公共_融资融券基础数据_融资融券配置表][字段][(@通道编号# = 0 or {通道编号}=@通道编号#) and (@机构编号# = 0 or {机构编号}=@机构编号#) and {记录序号}>@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, fina_year_intrst_rate, secu_loan_year_intrst_rate, fina_pen_intrst_rate, 
            secu_loan_pen_intrst_rate, intrst_sett_day from db_pub.tb_basesemdt_secu_margin_allocation where (v_pass_no = 0 or pass_no=v_pass_no) and (v_co_no = 0 or co_no=v_co_no) and row_id>v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, fina_year_intrst_rate, secu_loan_year_intrst_rate, fina_pen_intrst_rate, 
            secu_loan_pen_intrst_rate, intrst_sett_day from db_pub.tb_basesemdt_secu_margin_allocation where (v_pass_no = 0 or pass_no=v_pass_no) and (v_co_no = 0 or co_no=v_co_no) and row_id>v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_融资融券基础数据_新增融资融券标的证券表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_AddSecuMarginUnderlySecu;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_AddSecuMarginUnderlySecu(
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
    IN p_fina_status varchar(2),
    IN p_secu_loan_status varchar(2),
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
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_fina_status varchar(2);
    declare v_secu_loan_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_fina_status = p_fina_status;
    SET v_secu_loan_status = p_secu_loan_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][公共_融资融券基础数据_融资融券标的证券表][字段][字段变量][1][@证券代码编号#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesemdt_secu_margin_underly_secu(
        create_date, create_time, update_date, 
        update_time, update_times, stock_code_no, stock_code, 
        exch_no, fina_status, secu_loan_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_stock_code_no, v_stock_code, 
        v_exch_no, v_fina_status, v_secu_loan_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.29.9.1";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@记录序号#] */
    select LAST_INSERT_ID() into v_row_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_融资融券基础数据_修改融资融券标的证券表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_ModiSecuMarginUnderlySecu;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_ModiSecuMarginUnderlySecu(
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
    IN p_fina_status varchar(2),
    IN p_secu_loan_status varchar(2),
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
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_fina_status varchar(2);
    declare v_secu_loan_status varchar(2);
    declare v_row_id bigint;
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
    SET v_fina_status = p_fina_status;
    SET v_secu_loan_status = p_secu_loan_status;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][公共_融资融券基础数据_融资融券标的证券表][字段][字段变量][{证券代码编号}=@证券代码编号#,{证券代码}=@证券代码#,{市场编号}=@市场编号#,{融资状态}=@融资状态#,{融券状态}=@融券状态#][2][@记录序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesemdt_secu_margin_underly_secu (
        create_date, create_time, update_date, 
        update_time, update_times, stock_code_no, stock_code, 
        exch_no, fina_status, secu_loan_status) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_stock_code_no, v_stock_code, 
        v_exch_no, v_fina_status, v_secu_loan_status) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, stock_code_no=v_stock_code_no,stock_code=v_stock_code,exch_no=v_exch_no,fina_status=v_fina_status,secu_loan_status=v_secu_loan_status;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.29.10.2";
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

# 原子_公共_融资融券基础数据_删除融资融券标的证券表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_DeSecuMarginUnderlySecu;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_DeSecuMarginUnderlySecu(
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
    

    /* [删除表记录][公共_融资融券基础数据_融资融券标的证券表][{记录序号}=@记录序号#][3][@记录序号#] */
    delete from db_pub.tb_basesemdt_secu_margin_underly_secu 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.29.11.3";
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

# 原子_公共_融资融券基础数据_查询融资融券标的证券表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_QuerySecuMarginUnderlySecu;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_QuerySecuMarginUnderlySecu(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_row_count int,
    IN p_row_id bigint,
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_row_count int;
    declare v_row_id bigint;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_row_count = p_row_count;
    SET v_row_id = p_row_id;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][公共_融资融券基础数据_融资融券标的证券表][字段][(@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码# = " " or {证券代码}=@证券代码#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, stock_code_no, 
            stock_code, exch_no, fina_status, secu_loan_status from db_pub.tb_basesemdt_secu_margin_underly_secu where (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, stock_code_no, 
            stock_code, exch_no, fina_status, secu_loan_status from db_pub.tb_basesemdt_secu_margin_underly_secu where (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][公共_融资融券基础数据_融资融券标的证券表][字段][(@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码# = " " or {证券代码}=@证券代码#) and {记录序号}>@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, stock_code_no, 
            stock_code, exch_no, fina_status, secu_loan_status from db_pub.tb_basesemdt_secu_margin_underly_secu where (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, stock_code_no, 
            stock_code, exch_no, fina_status, secu_loan_status from db_pub.tb_basesemdt_secu_margin_underly_secu where (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_融资融券基础数据_新增融资融券券商禁止标的证券表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_AddMarginBrokerBanUnderlySecu;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_AddMarginBrokerBanUnderlySecu(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_co_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_fina_status varchar(2),
    IN p_secu_loan_status varchar(2),
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
    declare v_pass_no int;
    declare v_co_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_fina_status varchar(2);
    declare v_secu_loan_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_fina_status = p_fina_status;
    SET v_secu_loan_status = p_secu_loan_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][公共_融资融券基础数据_融资融券券商禁止标的证券表][字段][字段变量][1][@证券代码编号#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesemdt_margin_broker_ban_underly_secu(
        create_date, create_time, update_date, 
        update_time, update_times, pass_no, co_no, 
        stock_code_no, stock_code, exch_no, fina_status, 
        secu_loan_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pass_no, v_co_no, 
        v_stock_code_no, v_stock_code, v_exch_no, v_fina_status, 
        v_secu_loan_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.29.13.1";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@记录序号#] */
    select LAST_INSERT_ID() into v_row_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_融资融券基础数据_修改融资融券券商禁止标的证券表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_ModiMarginBrokerBanUnderlySecu;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_ModiMarginBrokerBanUnderlySecu(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_co_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_fina_status varchar(2),
    IN p_secu_loan_status varchar(2),
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
    declare v_pass_no int;
    declare v_co_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_fina_status varchar(2);
    declare v_secu_loan_status varchar(2);
    declare v_row_id bigint;
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
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_fina_status = p_fina_status;
    SET v_secu_loan_status = p_secu_loan_status;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][公共_融资融券基础数据_融资融券券商禁止标的证券表][字段][字段变量][{通道编号}=@通道编号#,{机构编号}=@机构编号#,{证券代码编号}=@证券代码编号#,{证券代码}=@证券代码#,{市场编号}=@市场编号#,{融资状态}=@融资状态#,{融券状态}=@融券状态#][2][@记录序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesemdt_margin_broker_ban_underly_secu (
        create_date, create_time, update_date, 
        update_time, update_times, pass_no, co_no, 
        stock_code_no, stock_code, exch_no, fina_status, 
        secu_loan_status) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pass_no, v_co_no, 
        v_stock_code_no, v_stock_code, v_exch_no, v_fina_status, 
        v_secu_loan_status) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pass_no=v_pass_no,co_no=v_co_no,stock_code_no=v_stock_code_no,stock_code=v_stock_code,exch_no=v_exch_no,fina_status=v_fina_status,secu_loan_status=v_secu_loan_status;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.29.14.2";
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

# 原子_公共_融资融券基础数据_删除融资融券券商禁止标的证券表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_DelMarginBrokerBanUnderlySecu;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_DelMarginBrokerBanUnderlySecu(
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
    

    /* [删除表记录][公共_融资融券基础数据_融资融券券商禁止标的证券表][{记录序号}=@记录序号#][3][@记录序号#] */
    delete from db_pub.tb_basesemdt_margin_broker_ban_underly_secu 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.29.15.3";
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

# 原子_公共_融资融券基础数据_查询融资融券券商禁止标的证券表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_QueryMarginBrokerBanUnderlySecu;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_QueryMarginBrokerBanUnderlySecu(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_co_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_row_count int,
    IN p_row_id bigint,
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
    declare v_pass_no int;
    declare v_co_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_row_count int;
    declare v_row_id bigint;
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
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_row_count = p_row_count;
    SET v_row_id = p_row_id;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][公共_融资融券基础数据_融资融券券商禁止标的证券表][字段][(@通道编号# = 0 or {通道编号}=@通道编号#) and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码# = " " or {证券代码}=@证券代码#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, stock_code, exch_no, 
            fina_status, secu_loan_status from db_pub.tb_basesemdt_margin_broker_ban_underly_secu where (v_pass_no = 0 or pass_no=v_pass_no) and (v_co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, stock_code, exch_no, 
            fina_status, secu_loan_status from db_pub.tb_basesemdt_margin_broker_ban_underly_secu where (v_pass_no = 0 or pass_no=v_pass_no) and (v_co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][公共_融资融券基础数据_融资融券券商禁止标的证券表][字段][(@通道编号# = 0 or {通道编号}=@通道编号#) and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码# = " " or {证券代码}=@证券代码#) and {记录序号}>@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, stock_code, exch_no, 
            fina_status, secu_loan_status from db_pub.tb_basesemdt_margin_broker_ban_underly_secu where (v_pass_no = 0 or pass_no=v_pass_no) and (v_co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, stock_code, exch_no, 
            fina_status, secu_loan_status from db_pub.tb_basesemdt_margin_broker_ban_underly_secu where (v_pass_no = 0 or pass_no=v_pass_no) and (v_co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_融资融券基础数据_新增融资融券保证金比例配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_AddSecuMarginRatioAllocation;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_AddSecuMarginRatioAllocation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_co_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_fina_marg_ratio decimal(18,12),
    IN p_secu_loan_marg_ratio decimal(18,12),
    IN p_secu_loan_price_limit decimal(16,9),
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
    declare v_pass_no int;
    declare v_co_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_fina_marg_ratio decimal(18,12);
    declare v_secu_loan_marg_ratio decimal(18,12);
    declare v_secu_loan_price_limit decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_fina_marg_ratio = p_fina_marg_ratio;
    SET v_secu_loan_marg_ratio = p_secu_loan_marg_ratio;
    SET v_secu_loan_price_limit = p_secu_loan_price_limit;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][公共_融资融券基础数据_融资融券保证金比例配置表][字段][字段变量][1][@证券代码编号#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesemdt_secu_margin_ratio_allocation(
        create_date, create_time, update_date, 
        update_time, update_times, pass_no, co_no, 
        stock_code_no, stock_code, exch_no, stock_type, 
        fina_marg_ratio, secu_loan_marg_ratio, secu_loan_price_limit) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pass_no, v_co_no, 
        v_stock_code_no, v_stock_code, v_exch_no, v_stock_type, 
        v_fina_marg_ratio, v_secu_loan_marg_ratio, v_secu_loan_price_limit);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.29.17.1";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@记录序号#] */
    select LAST_INSERT_ID() into v_row_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_融资融券基础数据_修改融资融券保证金比例配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_ModiSecuMarginRatioAllocation;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_ModiSecuMarginRatioAllocation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_co_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_fina_marg_ratio decimal(18,12),
    IN p_secu_loan_marg_ratio decimal(18,12),
    IN p_secu_loan_price_limit decimal(16,9),
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
    declare v_pass_no int;
    declare v_co_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_fina_marg_ratio decimal(18,12);
    declare v_secu_loan_marg_ratio decimal(18,12);
    declare v_secu_loan_price_limit decimal(16,9);
    declare v_row_id bigint;
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
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_fina_marg_ratio = p_fina_marg_ratio;
    SET v_secu_loan_marg_ratio = p_secu_loan_marg_ratio;
    SET v_secu_loan_price_limit = p_secu_loan_price_limit;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][公共_融资融券基础数据_融资融券保证金比例配置表][字段][字段变量][{通道编号}=@通道编号#,{机构编号}=@机构编号#,{证券代码编号}=@证券代码编号#,{证券代码}=@证券代码#,{市场编号}=@市场编号#,{证券类型}=@证券类型#,{融资保证金比例}=@融资保证金比例#,{融券保证金比例}=@融券保证金比例#,{融券价格限制}=@融券价格限制#][2][@记录序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesemdt_secu_margin_ratio_allocation (
        create_date, create_time, update_date, 
        update_time, update_times, pass_no, co_no, 
        stock_code_no, stock_code, exch_no, stock_type, 
        fina_marg_ratio, secu_loan_marg_ratio, secu_loan_price_limit) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pass_no, v_co_no, 
        v_stock_code_no, v_stock_code, v_exch_no, v_stock_type, 
        v_fina_marg_ratio, v_secu_loan_marg_ratio, v_secu_loan_price_limit) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pass_no=v_pass_no,co_no=v_co_no,stock_code_no=v_stock_code_no,stock_code=v_stock_code,exch_no=v_exch_no,stock_type=v_stock_type,fina_marg_ratio=v_fina_marg_ratio,secu_loan_marg_ratio=v_secu_loan_marg_ratio,secu_loan_price_limit=v_secu_loan_price_limit;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.29.18.2";
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

# 原子_公共_融资融券基础数据_删除融资融券保证金比例配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_DeSecuMarginRatioAllocation;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_DeSecuMarginRatioAllocation(
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
    

    /* [删除表记录][公共_融资融券基础数据_融资融券保证金比例配置表][{记录序号}=@记录序号#][3][@记录序号#] */
    delete from db_pub.tb_basesemdt_secu_margin_ratio_allocation 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.29.19.3";
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

# 原子_公共_融资融券基础数据_查询融资融券保证金比例配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_QuerySecuMarginRatioAllocation;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_QuerySecuMarginRatioAllocation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_co_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_row_count int,
    IN p_row_id bigint,
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
    declare v_pass_no int;
    declare v_co_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_row_count int;
    declare v_row_id bigint;
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
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_row_count = p_row_count;
    SET v_row_id = p_row_id;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][公共_融资融券基础数据_融资融券保证金比例配置表][字段][(@通道编号# = 0 or {通道编号}=@通道编号#) and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码# = " " or {证券代码}=@证券代码#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, stock_code, exch_no, 
            stock_type, fina_marg_ratio, secu_loan_marg_ratio, secu_loan_price_limit from db_pub.tb_basesemdt_secu_margin_ratio_allocation where (v_pass_no = 0 or pass_no=v_pass_no) and (v_co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and (v_stock_type = 0 or stock_type=v_stock_type) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, stock_code, exch_no, 
            stock_type, fina_marg_ratio, secu_loan_marg_ratio, secu_loan_price_limit from db_pub.tb_basesemdt_secu_margin_ratio_allocation where (v_pass_no = 0 or pass_no=v_pass_no) and (v_co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and (v_stock_type = 0 or stock_type=v_stock_type) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][公共_融资融券基础数据_融资融券保证金比例配置表][字段][(@通道编号# = 0 or {通道编号}=@通道编号#) and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码# = " " or {证券代码}=@证券代码#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and {记录序号}>@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, stock_code, exch_no, 
            stock_type, fina_marg_ratio, secu_loan_marg_ratio, secu_loan_price_limit from db_pub.tb_basesemdt_secu_margin_ratio_allocation where (v_pass_no = 0 or pass_no=v_pass_no) and (v_co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and (v_stock_type = 0 or stock_type=v_stock_type) and row_id>v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, stock_code, exch_no, 
            stock_type, fina_marg_ratio, secu_loan_marg_ratio, secu_loan_price_limit from db_pub.tb_basesemdt_secu_margin_ratio_allocation where (v_pass_no = 0 or pass_no=v_pass_no) and (v_co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and (v_stock_type = 0 or stock_type=v_stock_type) and row_id>v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_融资融券基础数据_获取融资融券保证金比例配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_GetSecuMarginRatioAllocation;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_GetSecuMarginRatioAllocation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_co_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_fina_marg_ratio decimal(18,12),
    OUT p_secu_loan_marg_ratio decimal(18,12),
    OUT p_secu_loan_price_limit decimal(16,9)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pass_no int;
    declare v_co_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_fina_marg_ratio decimal(18,12);
    declare v_secu_loan_marg_ratio decimal(18,12);
    declare v_secu_loan_price_limit decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_fina_marg_ratio = 0;
    SET v_secu_loan_marg_ratio = 0;
    SET v_secu_loan_price_limit = 0;

    
    label_pro:BEGIN
    

        /* [获取表记录变量语句][公共_融资融券基础数据_融资融券保证金比例配置表][{融资保证金比例},{融券保证金比例},{融券价格限制}][@融资保证金比例#,@融券保证金比例#,@融券价格限制#][{通道编号}=@通道编号# and {机构编号}=@机构编号# and {市场编号}=@市场编号# and {证券代码}=@证券代码#] */
        select fina_marg_ratio,secu_loan_marg_ratio,secu_loan_price_limit into v_fina_marg_ratio,v_secu_loan_marg_ratio,v_secu_loan_price_limit from db_pub.tb_basesemdt_secu_margin_ratio_allocation where pass_no=v_pass_no and co_no=v_co_no and exch_no=v_exch_no and stock_code=v_stock_code limit 1;

        if FOUND_ROWS() = 0 then

              /* [获取表记录变量语句][公共_融资融券基础数据_融资融券保证金比例配置表][{融资保证金比例},{融券保证金比例},{融券价格限制}][@融资保证金比例#,@融券保证金比例#,@融券价格限制#][{通道编号}=@通道编号# and {机构编号}=0 and {市场编号}=@市场编号# and {证券代码}=@证券代码#] */
              select fina_marg_ratio,secu_loan_marg_ratio,secu_loan_price_limit into v_fina_marg_ratio,v_secu_loan_marg_ratio,v_secu_loan_price_limit from db_pub.tb_basesemdt_secu_margin_ratio_allocation where pass_no=v_pass_no and co_no=0 and exch_no=v_exch_no and stock_code=v_stock_code limit 1;

              if FOUND_ROWS() = 0 then

                   /* [获取表记录变量语句][公共_融资融券基础数据_融资融券保证金比例配置表][{融资保证金比例},{融券保证金比例},{融券价格限制}][@融资保证金比例#,@融券保证金比例#,@融券价格限制#][{通道编号}=@通道编号# and {机构编号}=@机构编号# and {市场编号}=@市场编号# and {证券代码}=" "] */
                   select fina_marg_ratio,secu_loan_marg_ratio,secu_loan_price_limit into v_fina_marg_ratio,v_secu_loan_marg_ratio,v_secu_loan_price_limit from db_pub.tb_basesemdt_secu_margin_ratio_allocation where pass_no=v_pass_no and co_no=v_co_no and exch_no=v_exch_no and stock_code=" " limit 1;

                   if FOUND_ROWS() = 0 then

                        /* [获取表记录变量语句][公共_融资融券基础数据_融资融券保证金比例配置表][{融资保证金比例},{融券保证金比例},{融券价格限制}][@融资保证金比例#,@融券保证金比例#,@融券价格限制#][{通道编号}=@通道编号# and {机构编号}=0 and {市场编号}=@市场编号# and {证券代码}=" "] */
                        select fina_marg_ratio,secu_loan_marg_ratio,secu_loan_price_limit into v_fina_marg_ratio,v_secu_loan_marg_ratio,v_secu_loan_price_limit from db_pub.tb_basesemdt_secu_margin_ratio_allocation where pass_no=v_pass_no and co_no=0 and exch_no=v_exch_no and stock_code=" " limit 1;

                        if FOUND_ROWS() = 0 then

                              /* [获取表记录变量语句][公共_融资融券基础数据_融资融券保证金比例配置表][{融资保证金比例},{融券保证金比例},{融券价格限制}][@融资保证金比例#,@融券保证金比例#,@融券价格限制#][{通道编号}=0 and {机构编号}=@机构编号# and {市场编号}=@市场编号# and {证券代码}=" "] */
                              select fina_marg_ratio,secu_loan_marg_ratio,secu_loan_price_limit into v_fina_marg_ratio,v_secu_loan_marg_ratio,v_secu_loan_price_limit from db_pub.tb_basesemdt_secu_margin_ratio_allocation where pass_no=0 and co_no=v_co_no and exch_no=v_exch_no and stock_code=" " limit 1;

                              if FOUND_ROWS() = 0 then

                                  /* [获取表记录变量语句][公共_融资融券基础数据_融资融券保证金比例配置表][{融资保证金比例},{融券保证金比例},{融券价格限制}][@融资保证金比例#,@融券保证金比例#,@融券价格限制#][{通道编号}=0 and {机构编号}=0 and {市场编号}=@市场编号# and {证券代码}=" "] */
                                  select fina_marg_ratio,secu_loan_marg_ratio,secu_loan_price_limit into v_fina_marg_ratio,v_secu_loan_marg_ratio,v_secu_loan_price_limit from db_pub.tb_basesemdt_secu_margin_ratio_allocation where pass_no=0 and co_no=0 and exch_no=v_exch_no and stock_code=" " limit 1;

                                  if FOUND_ROWS() = 0 then

                                      /* set @融资保证金比例# = 0; */
                                      set v_fina_marg_ratio = 0;

                                      /* set @融券保证金比例# = 0; */
                                      set v_secu_loan_marg_ratio = 0;

                                      /* set @融券价格限制# = 1; */
                                      set v_secu_loan_price_limit = 1;
                                  end if;
                              end if;
                         end if;
                    end if;
              end if;
        end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_fina_marg_ratio = v_fina_marg_ratio;
    SET p_secu_loan_marg_ratio = v_secu_loan_marg_ratio;
    SET p_secu_loan_price_limit = v_secu_loan_price_limit;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_融资融券基础数据_获取可冲抵保证金证券表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_GetCanOffsetMarginSecurities;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_GetCanOffsetMarginSecurities(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_co_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_row_id bigint,
    IN p_sort_type int,
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
    declare v_pass_no int;
    declare v_co_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_row_id bigint;
    declare v_sort_type int;
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
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_sort_type = p_sort_type;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][公共_融资融券基础数据_可冲抵保证金证券表][字段][(@通道编号# = 0 or {通道编号}=@通道编号#) and ({机构编号} = 0 or {机构编号}=@机构编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码# = " " or {证券代码}=@证券代码#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, exch_no, stock_code, 
            discount_rate, offset_status from db_pub.tb_basesemdt_offset_margin_stock where (v_pass_no = 0 or pass_no=v_pass_no) and (co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, exch_no, stock_code, 
            discount_rate, offset_status from db_pub.tb_basesemdt_offset_margin_stock where (v_pass_no = 0 or pass_no=v_pass_no) and (co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][公共_融资融券基础数据_可冲抵保证金证券表][字段][(@通道编号# = 0 or {通道编号}=@通道编号#) and ({机构编号} = 0 or {机构编号}=@机构编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码# = " " or {证券代码}=@证券代码#) and {记录序号}>@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, exch_no, stock_code, 
            discount_rate, offset_status from db_pub.tb_basesemdt_offset_margin_stock where (v_pass_no = 0 or pass_no=v_pass_no) and (co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, exch_no, stock_code, 
            discount_rate, offset_status from db_pub.tb_basesemdt_offset_margin_stock where (v_pass_no = 0 or pass_no=v_pass_no) and (co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_融资融券基础数据_查询机构融资融券保证金比例
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_QueryCompanySecuMarginRatio;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_QueryCompanySecuMarginRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_co_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_row_count int,
    IN p_row_id bigint,
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
    declare v_pass_no int;
    declare v_co_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_row_count int;
    declare v_row_id bigint;
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
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_row_count = p_row_count;
    SET v_row_id = p_row_id;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][公共_融资融券基础数据_融资融券保证金比例配置表][字段][(@通道编号# = 0 or {通道编号}=@通道编号#) and ({机构编号} = 0 or {机构编号}=@机构编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码# = " " or {证券代码}=@证券代码#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, stock_code, exch_no, 
            stock_type, fina_marg_ratio, secu_loan_marg_ratio, secu_loan_price_limit from db_pub.tb_basesemdt_secu_margin_ratio_allocation where (v_pass_no = 0 or pass_no=v_pass_no) and (co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and (v_stock_type = 0 or stock_type=v_stock_type) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, stock_code, exch_no, 
            stock_type, fina_marg_ratio, secu_loan_marg_ratio, secu_loan_price_limit from db_pub.tb_basesemdt_secu_margin_ratio_allocation where (v_pass_no = 0 or pass_no=v_pass_no) and (co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and (v_stock_type = 0 or stock_type=v_stock_type) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][公共_融资融券基础数据_融资融券保证金比例配置表][字段][(@通道编号# = 0 or {通道编号}=@通道编号#) and ({机构编号} = 0 or {机构编号}=@机构编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码# = " " or {证券代码}=@证券代码#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and {记录序号}>@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, stock_code, exch_no, 
            stock_type, fina_marg_ratio, secu_loan_marg_ratio, secu_loan_price_limit from db_pub.tb_basesemdt_secu_margin_ratio_allocation where (v_pass_no = 0 or pass_no=v_pass_no) and (co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and (v_stock_type = 0 or stock_type=v_stock_type) and row_id>v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, pass_no, 
            co_no, stock_code_no, stock_code, exch_no, 
            stock_type, fina_marg_ratio, secu_loan_marg_ratio, secu_loan_price_limit from db_pub.tb_basesemdt_secu_margin_ratio_allocation where (v_pass_no = 0 or pass_no=v_pass_no) and (co_no = 0 or co_no=v_co_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code = " " or stock_code=v_stock_code) and (v_stock_type = 0 or stock_type=v_stock_type) and row_id>v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_融资融券基础数据_查询证券类型对应折算率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_QueryStockTypeConversionScale;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_QueryStockTypeConversionScale(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_discount_rate decimal(18,12)
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
    declare v_stock_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_discount_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_type = p_stock_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_discount_rate = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_融资融券基础数据_折算比例模板表][{折算率}][@折算率#][{市场编号}=@市场编号# and {证券类型}=@证券类型#] */
    select discount_rate into v_discount_rate from db_pub.tb_basesemdt_conversion_scale_template where exch_no=v_exch_no and stock_type=v_stock_type limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_discount_rate = v_discount_rate;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_融资融券基础数据_可冲抵保证金证券导入
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_ImportCanOffsetMarginSecurities;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_ImportCanOffsetMarginSecurities(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_co_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_discount_rate decimal(18,12),
    IN p_offset_status int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pass_no int;
    declare v_co_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_discount_rate decimal(18,12);
    declare v_offset_status int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
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
    SET v_pass_no = p_pass_no;
    SET v_co_no = p_co_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_discount_rate = p_discount_rate;
    SET v_offset_status = p_offset_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [插入重复更新][公共_融资融券基础数据_可冲抵保证金证券表][字段][字段变量][{通道编号}=@通道编号#,{机构编号}=@机构编号#,{证券代码编号}=@证券代码编号#,{证券代码}=@证券代码#,{市场编号}=@市场编号#,{折算率}=@折算率#,{冲抵状态}=@冲抵状态#][2][@记录序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesemdt_offset_margin_stock (
        create_date, create_time, update_date, 
        update_time, update_times, pass_no, co_no, 
        stock_code_no, exch_no, stock_code, discount_rate, 
        offset_status) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pass_no, v_co_no, 
        v_stock_code_no, v_exch_no, v_stock_code, v_discount_rate, 
        v_offset_status) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pass_no=v_pass_no,co_no=v_co_no,stock_code_no=v_stock_code_no,stock_code=v_stock_code,exch_no=v_exch_no,discount_rate=v_discount_rate,offset_status=v_offset_status;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.29.25.2";
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

# 原子_公共_融资融券基础数据_融资融券标的证券导入
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_basesemdt_ImportSecuMarginUnderlySecu;;
DELIMITER ;;
CREATE PROCEDURE pra_basesemdt_ImportSecuMarginUnderlySecu(
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
    IN p_fina_status varchar(2),
    IN p_secu_loan_status varchar(2),
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
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_fina_status varchar(2);
    declare v_secu_loan_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_fina_status = p_fina_status;
    SET v_secu_loan_status = p_secu_loan_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][公共_融资融券基础数据_融资融券标的证券表][字段][字段变量][{证券代码编号}=@证券代码编号#,{证券代码}=@证券代码#,{市场编号}=@市场编号#,{融资状态}=@融资状态#,{融券状态}=@融券状态#][2][@记录序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_basesemdt_secu_margin_underly_secu (
        create_date, create_time, update_date, 
        update_time, update_times, stock_code_no, stock_code, 
        exch_no, fina_status, secu_loan_status) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_stock_code_no, v_stock_code, 
        v_exch_no, v_fina_status, v_secu_loan_status) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, stock_code_no=v_stock_code_no,stock_code=v_stock_code,exch_no=v_exch_no,fina_status=v_fina_status,secu_loan_status=v_secu_loan_status;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.29.26.2";
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
    SET p_row_id = v_row_id;

END;;


