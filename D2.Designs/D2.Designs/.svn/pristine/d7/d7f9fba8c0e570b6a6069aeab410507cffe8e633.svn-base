DELIMITER ;;
use db_pub;;

# 原子_公共_王彤彤测试_新增增删改查表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_wtttest_add;;
DELIMITER ;;
CREATE PROCEDURE pra_wtttest_add(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_wanttt_id int,
    IN p_wanttt_name varchar(255),
    IN p_wangtt_stock_code_no int,
    IN p_wanttt_asset_no int,
    IN p_wanttt_buy_stock_qty int,
    IN p_wanttt_sale_stock_qty int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_wanttt_id int;
    declare v_wanttt_name varchar(255);
    declare v_wangtt_stock_code_no int;
    declare v_wanttt_asset_no int;
    declare v_wanttt_buy_stock_qty int;
    declare v_wanttt_sale_stock_qty int;
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
    SET v_wanttt_id = p_wanttt_id;
    SET v_wanttt_name = p_wanttt_name;
    SET v_wangtt_stock_code_no = p_wangtt_stock_code_no;
    SET v_wanttt_asset_no = p_wanttt_asset_no;
    SET v_wanttt_buy_stock_qty = p_wanttt_buy_stock_qty;
    SET v_wanttt_sale_stock_qty = p_wanttt_sale_stock_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][公共_王彤彤测试_增删改查表][字段][字段变量][1][@王彤彤测试编号#, @王彤彤测试姓名#, @王彤彤测试证券代码编号#, @王彤彤测试资产账号#, @王彤彤测试买入股票数#, @王彤彤测试卖出股票数#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_wangtongtong_test(
        create_date, create_time, update_date, 
        update_time, update_times, wanttt_id, wanttt_name, 
        wanttt_asset_no, wangtt_stock_code_no, wanttt_buy_stock_qty, wanttt_sale_stock_qty) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_wanttt_id, v_wanttt_name, 
        v_wanttt_asset_no, v_wangtt_stock_code_no, v_wanttt_buy_stock_qty, v_wanttt_sale_stock_qty);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.31.1.1";
        SET v_error_info =  CONCAT(concat("王彤彤测试编号=",v_wanttt_id,","," 王彤彤测试姓名=", v_wanttt_name,","," 王彤彤测试证券代码编号=", v_wangtt_stock_code_no,","," 王彤彤测试资产账号=", v_wanttt_asset_no,","," 王彤彤测试买入股票数=", v_wanttt_buy_stock_qty,","," 王彤彤测试卖出股票数=", v_wanttt_sale_stock_qty),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_王彤彤测试_删除增删改查表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_wtttest_dele;;
DELIMITER ;;
CREATE PROCEDURE pra_wtttest_dele(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_wanttt_id int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_wanttt_id int;
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
    SET v_wanttt_id = p_wanttt_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][公共_王彤彤测试_增删改查表][{王彤彤测试编号}=@王彤彤测试编号#][3][@王彤彤测试编号#] */
    delete from db_pub.tb_wangtongtong_test 
        where wanttt_id=v_wanttt_id;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.31.2.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("王彤彤测试编号=",v_wanttt_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("王彤彤测试编号=",v_wanttt_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_王彤彤测试_更改增删改查表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_wtttest_Modify;;
DELIMITER ;;
CREATE PROCEDURE pra_wtttest_Modify(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_wanttt_id int,
    IN p_wanttt_name varchar(255),
    IN p_wangtt_stock_code_no int,
    IN p_wanttt_asset_no int,
    IN p_wanttt_sale_stock_qty int,
    IN p_wanttt_buy_stock_qty int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_wanttt_id int;
    declare v_wanttt_name varchar(255);
    declare v_wangtt_stock_code_no int;
    declare v_wanttt_asset_no int;
    declare v_wanttt_sale_stock_qty int;
    declare v_wanttt_buy_stock_qty int;
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
    SET v_wanttt_id = p_wanttt_id;
    SET v_wanttt_name = p_wanttt_name;
    SET v_wangtt_stock_code_no = p_wangtt_stock_code_no;
    SET v_wanttt_asset_no = p_wanttt_asset_no;
    SET v_wanttt_sale_stock_qty = p_wanttt_sale_stock_qty;
    SET v_wanttt_buy_stock_qty = p_wanttt_buy_stock_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][公共_王彤彤测试_增删改查表][字段][字段变量][{王彤彤测试编号}=@王彤彤测试编号#,{王彤彤测试姓名}=@王彤彤测试姓名#,{王彤彤测试证券代码编号}=@王彤彤测试证券代码编号#,{王彤彤测试资产账号}=@王彤彤测试资产账号#,{王彤彤测试卖出股票数}=@王彤彤测试卖出股票数#,{王彤彤测试买入股票数}=@王彤彤测试买入股票数#][2][@王彤彤测试编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_wangtongtong_test (
        create_date, create_time, update_date, 
        update_time, update_times, wanttt_id, wanttt_name, 
        wanttt_asset_no, wangtt_stock_code_no, wanttt_buy_stock_qty, wanttt_sale_stock_qty) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_wanttt_id, v_wanttt_name, 
        v_wanttt_asset_no, v_wangtt_stock_code_no, v_wanttt_buy_stock_qty, v_wanttt_sale_stock_qty) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, wanttt_id=v_wanttt_id,wanttt_name=v_wanttt_name,wangtt_stock_code_no=v_wangtt_stock_code_no,wanttt_asset_no=v_wanttt_asset_no,wanttt_sale_stock_qty=v_wanttt_sale_stock_qty,wanttt_buy_stock_qty=v_wanttt_buy_stock_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.31.3.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("王彤彤测试编号=",v_wanttt_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("王彤彤测试编号=",v_wanttt_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_王彤彤测试_查找增删改查表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_wtttest_sel;;
DELIMITER ;;
CREATE PROCEDURE pra_wtttest_sel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_wanttt_id int,
    IN p_wanttt_name varchar(255),
    IN p_wangtt_stock_code_no int,
    IN p_wanttt_asset_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_wanttt_id int;
    declare v_wanttt_name varchar(255);
    declare v_wangtt_stock_code_no int;
    declare v_wanttt_asset_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sort_type int;
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
    SET v_wanttt_id = p_wanttt_id;
    SET v_wanttt_name = p_wanttt_name;
    SET v_wangtt_stock_code_no = p_wangtt_stock_code_no;
    SET v_wanttt_asset_no = p_wanttt_asset_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sort_type = 1;
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][公共_王彤彤测试_增删改查表][字段][(@王彤彤测试编号# = 0 or {王彤彤测试编号}=@王彤彤测试编号#) and (@王彤彤测试资产账号# = 0 or {王彤彤测试资产账号}=@王彤彤测试资产账号#) and (@王彤彤测试证券代码编号# = 0 or {王彤彤测试证券代码编号}=@王彤彤测试证券代码编号#) and (@王彤彤测试资产账号# = 0 or {王彤彤测试资产账号}=@王彤彤测试资产账号#) order by {王彤彤测试编号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, wanttt_id, 
            wanttt_name, wanttt_asset_no, wangtt_stock_code_no, wanttt_buy_stock_qty, 
            wanttt_sale_stock_qty from db_pub.tb_wangtongtong_test where (v_wanttt_id = 0 or wanttt_id=v_wanttt_id) and (v_wanttt_asset_no = 0 or wanttt_asset_no=v_wanttt_asset_no) and (v_wangtt_stock_code_no = 0 or wangtt_stock_code_no=v_wangtt_stock_code_no) and (v_wanttt_asset_no = 0 or wanttt_asset_no=v_wanttt_asset_no) order by wanttt_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, wanttt_id, 
            wanttt_name, wanttt_asset_no, wangtt_stock_code_no, wanttt_buy_stock_qty, 
            wanttt_sale_stock_qty from db_pub.tb_wangtongtong_test where (v_wanttt_id = 0 or wanttt_id=v_wanttt_id) and (v_wanttt_asset_no = 0 or wanttt_asset_no=v_wanttt_asset_no) and (v_wangtt_stock_code_no = 0 or wangtt_stock_code_no=v_wangtt_stock_code_no) and (v_wanttt_asset_no = 0 or wanttt_asset_no=v_wanttt_asset_no) order by wanttt_id limit v_row_count;
        end if;

    else

        /* [获取表记录][公共_王彤彤测试_增删改查表][字段][(@王彤彤测试编号# = 0 or {王彤彤测试编号}=@王彤彤测试编号#) and (@王彤彤测试资产账号# = 0 or {王彤彤测试资产账号}=@王彤彤测试资产账号#) and (@王彤彤测试证券代码编号# = 0 or {王彤彤测试证券代码编号}=@王彤彤测试证券代码编号#) and (@王彤彤测试资产账号# = 0 or {王彤彤测试资产账号}=@王彤彤测试资产账号#) order by {王彤彤测试编号} desc ][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, wanttt_id, 
            wanttt_name, wanttt_asset_no, wangtt_stock_code_no, wanttt_buy_stock_qty, 
            wanttt_sale_stock_qty from db_pub.tb_wangtongtong_test where (v_wanttt_id = 0 or wanttt_id=v_wanttt_id) and (v_wanttt_asset_no = 0 or wanttt_asset_no=v_wanttt_asset_no) and (v_wangtt_stock_code_no = 0 or wangtt_stock_code_no=v_wangtt_stock_code_no) and (v_wanttt_asset_no = 0 or wanttt_asset_no=v_wanttt_asset_no) order by wanttt_id desc ;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, wanttt_id, 
            wanttt_name, wanttt_asset_no, wangtt_stock_code_no, wanttt_buy_stock_qty, 
            wanttt_sale_stock_qty from db_pub.tb_wangtongtong_test where (v_wanttt_id = 0 or wanttt_id=v_wanttt_id) and (v_wanttt_asset_no = 0 or wanttt_asset_no=v_wanttt_asset_no) and (v_wangtt_stock_code_no = 0 or wangtt_stock_code_no=v_wangtt_stock_code_no) and (v_wanttt_asset_no = 0 or wanttt_asset_no=v_wanttt_asset_no) order by wanttt_id desc  limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


