DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_新增证券费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_AddSecuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_AddSecuFeeTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_fee_tmplat_no int,
    IN p_co_no int,
    IN p_fee_tmplat_name varchar(64),
    IN p_fee_tmplat_kind int,
    IN p_remark_info varchar(255),
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
    declare v_fee_tmplat_no int;
    declare v_co_no int;
    declare v_fee_tmplat_name varchar(64);
    declare v_fee_tmplat_kind int;
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_co_no = p_co_no;
    SET v_fee_tmplat_name = p_fee_tmplat_name;
    SET v_fee_tmplat_kind = p_fee_tmplat_kind;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [插入表记录][公共_证券费用_证券费用模板表][字段][字段变量][1][@机构编号#, @费用模板名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_secu_fee_tmplat(
        create_date, create_time, update_date, 
        update_time, update_times, fee_tmplat_no, co_no, 
        fee_tmplat_name, fee_tmplat_kind, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_fee_tmplat_no, v_co_no, 
        v_fee_tmplat_name, v_fee_tmplat_kind, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.11.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,","," 费用模板名称=", v_fee_tmplat_name),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增证券费用模板"; */
    set v_oper_remark_info = "新增证券费用模板";

    /* [插入表记录][公共_证券费用_证券费用模板流水表][字段][字段变量][5][@费用模板编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_secu_fee_tmplat_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, fee_tmplat_no, 
        co_no, fee_tmplat_name, fee_tmplat_kind, remark_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_fee_tmplat_no, 
        v_co_no, v_fee_tmplat_name, v_fee_tmplat_kind, v_remark_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.11.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_修改证券费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_ModiSecuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_ModiSecuFeeTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_fee_tmplat_no int,
    IN p_fee_tmplat_name varchar(64),
    IN p_remark_info varchar(255),
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
    declare v_co_no int;
    declare v_fee_tmplat_no int;
    declare v_fee_tmplat_name varchar(64);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_fee_tmplat_kind int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
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
    SET v_co_no = p_co_no;
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_fee_tmplat_name = p_fee_tmplat_name;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_fee_tmplat_kind = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_证券费用_证券费用模板表][{备注信息}=@备注信息#,{费用模板名称}=@费用模板名称#][{费用模板编号}=@费用模板编号# and {机构编号}=@机构编号#][2][@费用模板编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_feesecu_secu_fee_tmplat set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, remark_info=v_remark_info,fee_tmplat_name=v_fee_tmplat_name where fee_tmplat_no=v_fee_tmplat_no and co_no=v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.12.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券费用_证券费用模板表][{机构编号},{费用模板名称},{费用模板类别}][@机构编号#,@费用模板名称#,@费用模板类别#][{费用模板编号}=@费用模板编号# and {机构编号}=@机构编号#][4][@费用模板编号#,@机构编号#] */
    select co_no,fee_tmplat_name,fee_tmplat_kind into v_co_no,v_fee_tmplat_name,v_fee_tmplat_kind from db_pub.tb_feesecu_secu_fee_tmplat where fee_tmplat_no=v_fee_tmplat_no and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.12.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,",","机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,",","机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改证券费用模板"; */
    set v_oper_remark_info = "修改证券费用模板";

    /* [插入表记录][公共_证券费用_证券费用模板流水表][字段][字段变量][5][@费用模板编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_secu_fee_tmplat_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, fee_tmplat_no, 
        co_no, fee_tmplat_name, fee_tmplat_kind, remark_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_fee_tmplat_no, 
        v_co_no, v_fee_tmplat_name, v_fee_tmplat_kind, v_remark_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.12.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_删除证券费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_DeleteSecuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_DeleteSecuFeeTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_fee_tmplat_no int,
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
    declare v_fee_tmplat_no int;
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
    declare v_co_no int;
    declare v_fee_tmplat_name varchar(64);
    declare v_fee_tmplat_kind int;
    declare v_remark_info varchar(255);
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
    SET v_fee_tmplat_no = p_fee_tmplat_no;
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
    SET v_co_no = 0;
    SET v_fee_tmplat_name = " ";
    SET v_fee_tmplat_kind = 0;
    SET v_remark_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券费用_证券费用模板表][字段][字段变量][{费用模板编号}=@费用模板编号#][4][@费用模板编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, fee_tmplat_no, 
        co_no, fee_tmplat_name, fee_tmplat_kind, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_fee_tmplat_no, 
        v_co_no, v_fee_tmplat_name, v_fee_tmplat_kind, v_remark_info from db_pub.tb_feesecu_secu_fee_tmplat where fee_tmplat_no=v_fee_tmplat_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.13.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_证券费用模板表][{费用模板编号}=@费用模板编号#][3][@费用模板编号#] */
    delete from db_pub.tb_feesecu_secu_fee_tmplat 
        where fee_tmplat_no=v_fee_tmplat_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.13.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_证券费用模板流水表][字段][字段变量][5][@费用模板编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_secu_fee_tmplat_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, fee_tmplat_no, 
        co_no, fee_tmplat_name, fee_tmplat_kind, remark_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_fee_tmplat_no, 
        v_co_no, v_fee_tmplat_name, v_fee_tmplat_kind, v_remark_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.13.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* if @费用模板类别# = 《费用模板类别-类型》 then */
    if v_fee_tmplat_kind = 1 then

        /* [删除表记录][公共_证券费用_证券类型费用模板明细表][{费用模板编号}=@费用模板编号#][3][@费用模板编号#,@费用模板类别#] */
        delete from db_pub.tb_feesecu_stock_type_fee_tmplat_detail 
            where fee_tmplat_no=v_fee_tmplat_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.9.13.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind),"#",v_mysql_message);
            else
                SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind);
            end if;
            leave label_pro;
        end if;


        /* [更新表记录][公共_证券费用_资产账户证券费用模板表][{证券类型费用模板编号}=0][{机构编号}=@机构编号#][2][@机构编号#,@费用模板类别#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pub.tb_feesecu_asset_acco_fee_tmplat set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, secu_type_fee_tmplat_no=0 where co_no=v_co_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.9.13.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","费用模板类别=",v_fee_tmplat_kind),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","费用模板类别=",v_fee_tmplat_kind);
            end if;
            leave label_pro;
        end if;

    else

        /* [删除表记录][公共_证券费用_证券代码费用模板明细表][{费用模板编号}=@费用模板编号#][3][@费用模板编号#,@费用模板类别#] */
        delete from db_pub.tb_feesecu_stock_code_fee_tmplat_detail 
            where fee_tmplat_no=v_fee_tmplat_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.9.13.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind),"#",v_mysql_message);
            else
                SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind);
            end if;
            leave label_pro;
        end if;


        /* [更新表记录][公共_证券费用_资产账户证券费用模板表][{证券代码费用模板编号}=0][{机构编号}=@机构编号#][2][@机构编号#,@费用模板类别#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pub.tb_feesecu_asset_acco_fee_tmplat set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, secu_code_fee_tmplat_no=0 where co_no=v_co_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.9.13.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","费用模板类别=",v_fee_tmplat_kind),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","费用模板类别=",v_fee_tmplat_kind);
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

# 原子_公共_证券费用_查询证券费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QuerySecuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QuerySecuFeeTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_fee_tmplat_no int,
    IN p_co_no int,
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
    declare v_fee_tmplat_no int;
    declare v_co_no int;
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
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_co_no = p_co_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_证券费用模板表][字段][(@费用模板编号# = 0 or {费用模板编号} = @费用模板编号#) and (@机构编号# = 0 or {机构编号} = @机构编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, fee_tmplat_no, 
        co_no, fee_tmplat_name, fee_tmplat_kind, remark_info from db_pub.tb_feesecu_secu_fee_tmplat where (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and (v_co_no = 0 or co_no = v_co_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, fee_tmplat_no, 
        co_no, fee_tmplat_name, fee_tmplat_kind, remark_info from db_pub.tb_feesecu_secu_fee_tmplat where (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and (v_co_no = 0 or co_no = v_co_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询证券费用模板流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QuerySecuFeeTmplatJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QuerySecuFeeTmplatJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_fee_tmplat_no int,
    IN p_co_no int,
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
    declare v_fee_tmplat_no int;
    declare v_co_no int;
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
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_co_no = p_co_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_证券费用模板流水表][字段][{初始化日期}<=@初始化日期# and (@费用模板编号# = 0 or {费用模板编号} = @费用模板编号#) and (@机构编号# = 0 or {机构编号} = @机构编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        fee_tmplat_no, co_no, fee_tmplat_name, fee_tmplat_kind, 
        remark_info, oper_remark_info from db_pub.tb_feesecu_secu_fee_tmplat_jour where init_date<=v_init_date and (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and (v_co_no = 0 or co_no = v_co_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        fee_tmplat_no, co_no, fee_tmplat_name, fee_tmplat_kind, 
        remark_info, oper_remark_info from db_pub.tb_feesecu_secu_fee_tmplat_jour where init_date<=v_init_date and (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and (v_co_no = 0 or co_no = v_co_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询历史证券费用模板流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QuerySecuFeeTmplatJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QuerySecuFeeTmplatJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_fee_tmplat_no int,
    IN p_co_no int,
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
    declare v_fee_tmplat_no int;
    declare v_co_no int;
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
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_co_no = p_co_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_证券费用_证券费用模板流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@费用模板编号# = 0 or {费用模板编号} = @费用模板编号#) and (@机构编号# = 0 or {机构编号} = @机构编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        fee_tmplat_no, co_no, fee_tmplat_name, fee_tmplat_kind, 
        remark_info, oper_remark_info from db_pub_his.tb_feesecu_secu_fee_tmplat_jour_his where (init_date between v_begin_date and v_end_date) and (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and (v_co_no = 0 or co_no = v_co_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        fee_tmplat_no, co_no, fee_tmplat_name, fee_tmplat_kind, 
        remark_info, oper_remark_info from db_pub_his.tb_feesecu_secu_fee_tmplat_jour_his where (init_date between v_begin_date and v_end_date) and (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and (v_co_no = 0 or co_no = v_co_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_新增证券类型费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_AddStockTypeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_AddStockTypeFeeTmplatDetail(
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
    IN p_fee_tmplat_no int,
    IN p_fee_no int,
    IN p_amt_ratio decimal(18,12),
    IN p_amt_value decimal(18,4),
    IN p_par_value_ratio decimal(18,12),
    IN p_par_value_value decimal(18,4),
    IN p_max_fee decimal(18,4),
    IN p_min_fee decimal(18,4),
    IN p_remark_info varchar(255),
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
    declare v_fee_tmplat_no int;
    declare v_fee_no int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_fee_choice int;
    declare v_float_ratio decimal(18,12);
    declare v_co_no int;
    declare v_fee_tmplat_kind int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_fee_no = p_fee_no;
    SET v_amt_ratio = p_amt_ratio;
    SET v_amt_value = p_amt_value;
    SET v_par_value_ratio = p_par_value_ratio;
    SET v_par_value_value = p_par_value_value;
    SET v_max_fee = p_max_fee;
    SET v_min_fee = p_min_fee;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_fee_choice = 0;
    SET v_float_ratio = 0;
    SET v_co_no = 0;
    SET v_fee_tmplat_kind = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "市场编号", "|", "证券类型", "|", "费用模板编号", "|", "费用编号", "|", "金额比例", "|", "金额固定额", "|", "面值比例", "|", "面值固定额", "|", "最高费用", "|", "最低费用", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_type, "|", v_fee_tmplat_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @费用选择# = 《费用选择-固定》; */
    set v_fee_choice = 1;

    /* set @浮动比例# = 0; */
    set v_float_ratio = 0;

    /* [获取表记录变量][公共_证券费用_证券费用模板表][{机构编号}, {费用模板类别}][@机构编号#, @费用模板类别#][{费用模板编号} = @费用模板编号#][4][@费用模板编号#] */
    select co_no, fee_tmplat_kind into v_co_no, v_fee_tmplat_kind from db_pub.tb_feesecu_secu_fee_tmplat where fee_tmplat_no = v_fee_tmplat_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.21.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@费用模板类别# <> 《费用模板类别-类型》][80][@费用模板编号#, @费用模板类别#] */
    if v_fee_tmplat_kind <> 1 then
        
        SET v_error_code = "pubA.9.21.80";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 费用模板类别=", v_fee_tmplat_kind),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 费用模板类别=", v_fee_tmplat_kind);
        end if;
        leave label_pro;
    end if;


    /* [插入表记录][公共_证券费用_证券类型费用模板明细表][字段][字段变量][1][@费用模板编号#, @市场编号#, @证券类型#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_stock_type_fee_tmplat_detail(
        create_date, create_time, update_date, 
        update_time, update_times, fee_tmplat_no, co_no, 
        exch_no, stock_type, fee_no, amt_ratio, 
        amt_value, par_value_ratio, par_value_value, max_fee, 
        min_fee, float_ratio, fee_choice, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_fee_tmplat_no, v_co_no, 
        v_exch_no, v_stock_type, v_fee_no, v_amt_ratio, 
        v_amt_value, v_par_value_ratio, v_par_value_value, v_max_fee, 
        v_min_fee, v_float_ratio, v_fee_choice, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.21.1";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_type, "|", v_fee_tmplat_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增证券类型费用模板明细"; */
    set v_oper_remark_info = "新增证券类型费用模板明细";

    /* [插入表记录][公共_证券费用_证券类型费用模板明细流水表][字段][字段变量][5][@费用模板编号#, @市场编号#, @证券类型#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_stock_type_fee_tmplat_detail_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        exch_no, stock_type, fee_tmplat_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_exch_no, v_stock_type, v_fee_tmplat_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.21.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_修改证券类型费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_ModiStockTypeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_ModiStockTypeFeeTmplatDetail(
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
    IN p_fee_tmplat_no int,
    IN p_fee_no int,
    IN p_amt_ratio decimal(18,12),
    IN p_amt_value decimal(18,4),
    IN p_par_value_ratio decimal(18,12),
    IN p_par_value_value decimal(18,4),
    IN p_max_fee decimal(18,4),
    IN p_min_fee decimal(18,4),
    IN p_remark_info varchar(255),
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
    declare v_fee_tmplat_no int;
    declare v_fee_no int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_co_no int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
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
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_fee_no = p_fee_no;
    SET v_amt_ratio = p_amt_ratio;
    SET v_amt_value = p_amt_value;
    SET v_par_value_ratio = p_par_value_ratio;
    SET v_par_value_value = p_par_value_value;
    SET v_max_fee = p_max_fee;
    SET v_min_fee = p_min_fee;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_co_no = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "市场编号", "|", "证券类型", "|", "费用模板编号", "|", "费用编号", "|", "金额比例", "|", "金额固定额", "|", "面值比例", "|", "面值固定额", "|", "最高费用", "|", "最低费用", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_type, "|", v_fee_tmplat_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_证券费用_证券类型费用模板明细表][{金额比例}=@金额比例#,{金额固定额}=@金额固定额#,{面值比例}=@面值比例#,{面值固定额}=@面值固定额#,{最高费用}=@最高费用#,{最低费用}=@最低费用#,{备注信息}=@备注信息#][{费用模板编号}=@费用模板编号# and {市场编号}=@市场编号# and {证券类型}=@证券类型# and {费用编号}=@费用编号#][2][@费用模板编号#, @市场编号#, @证券类型#, @费用编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_feesecu_stock_type_fee_tmplat_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, amt_ratio=v_amt_ratio,amt_value=v_amt_value,par_value_ratio=v_par_value_ratio,par_value_value=v_par_value_value,max_fee=v_max_fee,min_fee=v_min_fee,remark_info=v_remark_info where fee_tmplat_no=v_fee_tmplat_no and exch_no=v_exch_no and stock_type=v_stock_type and fee_no=v_fee_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.22.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券费用_证券类型费用模板明细表][{机构编号}][@机构编号#][{费用模板编号}=@费用模板编号# and {市场编号}=@市场编号# and {证券类型}=@证券类型# and {费用编号}=@费用编号#][4][@费用模板编号#, @市场编号#, @证券类型#, @费用编号#] */
    select co_no into v_co_no from db_pub.tb_feesecu_stock_type_fee_tmplat_detail where fee_tmplat_no=v_fee_tmplat_no and exch_no=v_exch_no and stock_type=v_stock_type and fee_no=v_fee_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.22.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_type, "|", v_fee_tmplat_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改证券类型费用模板明细"; */
    set v_oper_remark_info = "修改证券类型费用模板明细";

    /* [插入表记录][公共_证券费用_证券类型费用模板明细流水表][字段][字段变量][5][@费用模板编号#, @市场编号#, @证券类型#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_stock_type_fee_tmplat_detail_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        exch_no, stock_type, fee_tmplat_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_exch_no, v_stock_type, v_fee_tmplat_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.22.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_删除证券类型费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_DeleteStockTypeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_DeleteStockTypeFeeTmplatDetail(
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
    IN p_fee_tmplat_no int,
    IN p_fee_no int,
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
    declare v_fee_tmplat_no int;
    declare v_fee_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_co_no int;
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
    SET v_stock_type = p_stock_type;
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_fee_no = p_fee_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_co_no = 0;
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

    /* [获取表记录变量][公共_证券费用_证券类型费用模板明细表][{机构编号}][@机构编号#][{费用模板编号}=@费用模板编号# and {市场编号}=@市场编号# and {证券类型}=@证券类型# and {费用编号}=@费用编号#][4][@费用模板编号#, @市场编号#, @证券类型#, @费用编号#] */
    select co_no into v_co_no from db_pub.tb_feesecu_stock_type_fee_tmplat_detail where fee_tmplat_no=v_fee_tmplat_no and exch_no=v_exch_no and stock_type=v_stock_type and fee_no=v_fee_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.23.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_证券类型费用模板明细表][{费用模板编号}=@费用模板编号# and {市场编号}=@市场编号# and {证券类型}=@证券类型# and {费用编号}=@费用编号#][3][@费用模板编号#, @市场编号#, @证券类型#, @费用编号#] */
    delete from db_pub.tb_feesecu_stock_type_fee_tmplat_detail 
        where fee_tmplat_no=v_fee_tmplat_no and exch_no=v_exch_no and stock_type=v_stock_type and fee_no=v_fee_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.23.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# =" " ; */
    set v_jour_after_occur_info =" " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_证券类型费用模板明细流水表][字段][字段变量][5][@费用模板编号#, @市场编号#, @证券类型#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_stock_type_fee_tmplat_detail_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        exch_no, stock_type, fee_tmplat_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_exch_no, v_stock_type, v_fee_tmplat_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.23.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询证券类型费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QueryStockTypeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QueryStockTypeFeeTmplatDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_fee_tmplat_no_str varchar(2048),
    IN p_fee_no_str varchar(255),
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_fee_tmplat_no_str varchar(2048);
    declare v_fee_no_str varchar(255);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_fee_tmplat_no_str = p_fee_tmplat_no_str;
    SET v_fee_no_str = p_fee_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_证券类型费用模板明细表][{记录序号},{市场编号},{证券类型},{机构编号},{费用编号},{费用模板编号},{费用编号} div 10000 as {证券费用类型},{费用编号} % 10000 div 100 as {订单方向},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{备注信息}][(@机构编号#=0 or {机构编号}=@机构编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and (@费用编号串# = "; ;" or instr(@费用编号串#, concat(";", {费用编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,exch_no,stock_type,co_no,fee_no,fee_tmplat_no,fee_no div 10000 as secu_fee_type,fee_no % 10000 div 100 as order_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,remark_info from db_pub.tb_feesecu_stock_type_fee_tmplat_detail where (v_co_no=0 or co_no=v_co_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id,exch_no,stock_type,co_no,fee_no,fee_tmplat_no,fee_no div 10000 as secu_fee_type,fee_no % 10000 div 100 as order_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,remark_info from db_pub.tb_feesecu_stock_type_fee_tmplat_detail where (v_co_no=0 or co_no=v_co_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    #[获取表记录][公共_证券费用_证券类型费用模板明细表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and (@费用编号串# = "; ;" or instr(@费用编号串#, concat(";", {费用编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询证券类型费用模板明细流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QueryStockTypeFeeTmplatDetailJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QueryStockTypeFeeTmplatDetailJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_init_date int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_fee_tmplat_no_str varchar(2048),
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
    declare v_init_date int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_fee_tmplat_no_str varchar(2048);
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
    SET v_init_date = p_init_date;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_fee_tmplat_no_str = p_fee_tmplat_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_证券类型费用模板明细流水表][字段][{初始化日期}<=@初始化日期# and (@机构编号#=0 or {机构编号}=@机构编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and  (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_type, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_stock_type_fee_tmplat_detail_jour where init_date<=v_init_date and (v_co_no=0 or co_no=v_co_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and  (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_type, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_stock_type_fee_tmplat_detail_jour where init_date<=v_init_date and (v_co_no=0 or co_no=v_co_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and  (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询历史证券类型费用模板明细流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QueryStockTypeFeeTmplatDetailJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QueryStockTypeFeeTmplatDetailJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_fee_tmplat_no_str varchar(2048),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_fee_tmplat_no_str varchar(2048);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_fee_tmplat_no_str = p_fee_tmplat_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_证券费用_证券类型费用模板明细流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_type, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_stock_type_fee_tmplat_detail_jour_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_type, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_stock_type_fee_tmplat_detail_jour_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_新增证券代码费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_AddStockCodeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_AddStockCodeFeeTmplatDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_fee_tmplat_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_fee_no int,
    IN p_amt_ratio decimal(18,12),
    IN p_amt_value decimal(18,4),
    IN p_par_value_ratio decimal(18,12),
    IN p_par_value_value decimal(18,4),
    IN p_max_fee decimal(18,4),
    IN p_min_fee decimal(18,4),
    IN p_remark_info varchar(255),
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
    declare v_fee_tmplat_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_fee_no int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_fee_choice int;
    declare v_float_ratio decimal(18,12);
    declare v_co_no int;
    declare v_fee_tmplat_kind int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_fee_no = p_fee_no;
    SET v_amt_ratio = p_amt_ratio;
    SET v_amt_value = p_amt_value;
    SET v_par_value_ratio = p_par_value_ratio;
    SET v_par_value_value = p_par_value_value;
    SET v_max_fee = p_max_fee;
    SET v_min_fee = p_min_fee;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_fee_choice = 0;
    SET v_float_ratio = 0;
    SET v_co_no = 0;
    SET v_fee_tmplat_kind = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "费用模板编号", "|", "市场编号", "|", "证券代码编号", "|", "费用编号", "|", "金额比例", "|", "金额固定额", "|", "面值比例", "|", "面值固定额", "|", "最高费用", "|", "最低费用", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_fee_tmplat_no, "|", v_exch_no, "|", v_stock_code_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @费用选择# = 《费用选择-固定》; */
    set v_fee_choice = 1;

    /* set @浮动比例# = 0; */
    set v_float_ratio = 0;

    /* [获取表记录变量][公共_证券费用_证券费用模板表][{机构编号}, {费用模板类别}][@机构编号#, @费用模板类别#][{费用模板编号} = @费用模板编号#][4][@费用模板编号#] */
    select co_no, fee_tmplat_kind into v_co_no, v_fee_tmplat_kind from db_pub.tb_feesecu_secu_fee_tmplat where fee_tmplat_no = v_fee_tmplat_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.31.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@费用模板类别# <> 《费用模板类别-代码》][80][@费用模板编号#, @费用模板类别#] */
    if v_fee_tmplat_kind <> 2 then
        
        SET v_error_code = "pubA.9.31.80";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 费用模板类别=", v_fee_tmplat_kind),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 费用模板类别=", v_fee_tmplat_kind);
        end if;
        leave label_pro;
    end if;


    /* [插入表记录][公共_证券费用_证券代码费用模板明细表][字段][字段变量][1][@费用模板编号#, @证券代码编号#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_stock_code_fee_tmplat_detail(
        create_date, create_time, update_date, 
        update_time, update_times, fee_tmplat_no, co_no, 
        exch_no, stock_code_no, fee_no, amt_ratio, 
        amt_value, par_value_ratio, par_value_value, max_fee, 
        min_fee, float_ratio, fee_choice, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_fee_tmplat_no, v_co_no, 
        v_exch_no, v_stock_code_no, v_fee_no, v_amt_ratio, 
        v_amt_value, v_par_value_ratio, v_par_value_value, v_max_fee, 
        v_min_fee, v_float_ratio, v_fee_choice, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.31.1";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_fee_tmplat_no, "|", v_exch_no, "|", v_stock_code_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增证券代码费用模板明细"; */
    set v_oper_remark_info = "新增证券代码费用模板明细";

    /* [插入表记录][公共_证券费用_证券代码费用模板明细流水表][字段][字段变量][5][@费用模板编号#, @证券代码编号#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_stock_code_fee_tmplat_detail_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        exch_no, stock_code_no, fee_tmplat_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_exch_no, v_stock_code_no, v_fee_tmplat_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.31.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_修改证券代码费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_ModiStockCodeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_ModiStockCodeFeeTmplatDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_fee_tmplat_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_fee_no int,
    IN p_amt_ratio decimal(18,12),
    IN p_amt_value decimal(18,4),
    IN p_par_value_ratio decimal(18,12),
    IN p_par_value_value decimal(18,4),
    IN p_max_fee decimal(18,4),
    IN p_min_fee decimal(18,4),
    IN p_remark_info varchar(255),
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
    declare v_fee_tmplat_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_fee_no int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_co_no int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
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
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_fee_no = p_fee_no;
    SET v_amt_ratio = p_amt_ratio;
    SET v_amt_value = p_amt_value;
    SET v_par_value_ratio = p_par_value_ratio;
    SET v_par_value_value = p_par_value_value;
    SET v_max_fee = p_max_fee;
    SET v_min_fee = p_min_fee;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_co_no = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "费用模板编号", "|", "市场编号", "|", "证券代码编号", "|", "费用编号", "|", "金额比例", "|", "金额固定额", "|", "面值比例", "|", "面值固定额", "|", "最高费用", "|", "最低费用", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_fee_tmplat_no, "|", v_exch_no, "|", v_stock_code_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_证券费用_证券代码费用模板明细表][{金额比例}=@金额比例#,{金额固定额}=@金额固定额#,{面值比例}=@面值比例#,{面值固定额}=@面值固定额#,{最高费用}=@最高费用#,{最低费用}=@最低费用#,{备注信息}=@备注信息#][{费用模板编号}=@费用模板编号# and {证券代码编号}=@证券代码编号# and {费用编号}=@费用编号#][2][@费用模板编号#, @证券代码编号#, @费用编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_feesecu_stock_code_fee_tmplat_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, amt_ratio=v_amt_ratio,amt_value=v_amt_value,par_value_ratio=v_par_value_ratio,par_value_value=v_par_value_value,max_fee=v_max_fee,min_fee=v_min_fee,remark_info=v_remark_info where fee_tmplat_no=v_fee_tmplat_no and stock_code_no=v_stock_code_no and fee_no=v_fee_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.32.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券费用_证券代码费用模板明细表][{机构编号}][@机构编号#][{费用模板编号}=@费用模板编号# and {证券代码编号}=@证券代码编号# and {费用编号}=@费用编号#][4][@费用模板编号#, @证券代码编号#, @费用编号#] */
    select co_no into v_co_no from db_pub.tb_feesecu_stock_code_fee_tmplat_detail where fee_tmplat_no=v_fee_tmplat_no and stock_code_no=v_stock_code_no and fee_no=v_fee_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.32.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_fee_tmplat_no, "|", v_exch_no, "|", v_stock_code_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改证券代码费用模板明细"; */
    set v_oper_remark_info = "修改证券代码费用模板明细";

    /* [插入表记录][公共_证券费用_证券代码费用模板明细流水表][字段][字段变量][5][@费用模板编号#, @证券代码编号#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_stock_code_fee_tmplat_detail_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        exch_no, stock_code_no, fee_tmplat_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_exch_no, v_stock_code_no, v_fee_tmplat_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.32.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_删除证券代码费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_DeleteStockCodeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_DeleteStockCodeFeeTmplatDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_fee_tmplat_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_fee_no int,
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
    declare v_fee_tmplat_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_fee_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_co_no int;
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
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_fee_no = p_fee_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_co_no = 0;
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

    /* [获取表记录变量][公共_证券费用_证券代码费用模板明细表][{机构编号}][@机构编号#][{费用模板编号}=@费用模板编号# and {证券代码编号}=@证券代码编号# and {费用编号}=@费用编号#][4][@费用模板编号#, @证券代码编号#, @费用编号#] */
    select co_no into v_co_no from db_pub.tb_feesecu_stock_code_fee_tmplat_detail where fee_tmplat_no=v_fee_tmplat_no and stock_code_no=v_stock_code_no and fee_no=v_fee_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_证券代码费用模板明细表][{费用模板编号}=@费用模板编号# and {证券代码编号}=@证券代码编号# and {费用编号}=@费用编号#][3][@费用模板编号#, @证券代码编号#, @费用编号#] */
    delete from db_pub.tb_feesecu_stock_code_fee_tmplat_detail 
        where fee_tmplat_no=v_fee_tmplat_no and stock_code_no=v_stock_code_no and fee_no=v_fee_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.33.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# =" " ; */
    set v_jour_after_occur_info =" " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_证券代码费用模板明细流水表][字段][字段变量][5][@费用模板编号#, @证券代码编号#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_stock_code_fee_tmplat_detail_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        exch_no, stock_code_no, fee_tmplat_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_exch_no, v_stock_code_no, v_fee_tmplat_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.33.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询证券代码费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QueryStockCodeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QueryStockCodeFeeTmplatDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fee_tmplat_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_fee_no_str varchar(255),
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
    declare v_fee_tmplat_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_fee_no_str varchar(255);
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
    SET v_fee_tmplat_no_str = p_fee_tmplat_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_fee_no_str = p_fee_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_证券代码费用模板明细表][{记录序号},{费用模板编号},{机构编号},{市场编号},{证券代码编号},{费用编号},{费用编号} div 10000 as {证券费用类型},{费用编号} % 10000 div 100 as {订单方向},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{备注信息}][(@机构编号#=0 or {机构编号}=@机构编号#) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码编号# = 0 or {证券代码编号}  = @证券代码编号#) and (@费用编号串# = "; ;" or instr(@费用编号串#, concat(";", {费用编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,fee_tmplat_no,co_no,exch_no,stock_code_no,fee_no,fee_no div 10000 as secu_fee_type,fee_no % 10000 div 100 as order_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,remark_info from db_pub.tb_feesecu_stock_code_fee_tmplat_detail where (v_co_no=0 or co_no=v_co_no) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no  = v_stock_code_no) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id,fee_tmplat_no,co_no,exch_no,stock_code_no,fee_no,fee_no div 10000 as secu_fee_type,fee_no % 10000 div 100 as order_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,remark_info from db_pub.tb_feesecu_stock_code_fee_tmplat_detail where (v_co_no=0 or co_no=v_co_no) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no  = v_stock_code_no) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    #[获取表记录][公共_证券费用_证券代码费用模板明细表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码编号# = 0 or {证券代码编号}  = @证券代码编号#) and (@费用编号串# = "; ;" or instr(@费用编号串#, concat(";", {费用编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询证券代码费用模板明细流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QueryStockCodeFeeTmplatDetailJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QueryStockCodeFeeTmplatDetailJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_init_date int,
    IN p_fee_tmplat_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
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
    declare v_co_no int;
    declare v_init_date int;
    declare v_fee_tmplat_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
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
    SET v_co_no = p_co_no;
    SET v_init_date = p_init_date;
    SET v_fee_tmplat_no_str = p_fee_tmplat_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_证券代码费用模板明细流水表][字段][{初始化日期}<=@初始化日期# and (@机构编号#=0 or {机构编号}=@机构编号#) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码编号# = 0 or {证券代码编号}  = @证券代码编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_code_no, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_stock_code_fee_tmplat_detail_jour where init_date<=v_init_date and (v_co_no=0 or co_no=v_co_no) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no  = v_stock_code_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_code_no, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_stock_code_fee_tmplat_detail_jour where init_date<=v_init_date and (v_co_no=0 or co_no=v_co_no) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no  = v_stock_code_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询历史证券代码费用模板明细流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QueryStockCodeFeeTmplatDetailJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QueryStockCodeFeeTmplatDetailJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_fee_tmplat_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
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
    declare v_co_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_fee_tmplat_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
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
    SET v_co_no = p_co_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_fee_tmplat_no_str = p_fee_tmplat_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_证券费用_证券代码费用模板明细流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码编号# = 0 or {证券代码编号}  = @证券代码编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_code_no, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_stock_code_fee_tmplat_detail_jour_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no  = v_stock_code_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_code_no, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_stock_code_fee_tmplat_detail_jour_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no  = v_stock_code_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_新增外部证券类型费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_AddOutStockTypeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_AddOutStockTypeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_fee_no int,
    IN p_amt_ratio decimal(18,12),
    IN p_amt_value decimal(18,4),
    IN p_par_value_ratio decimal(18,12),
    IN p_par_value_value decimal(18,4),
    IN p_max_fee decimal(18,4),
    IN p_min_fee decimal(18,4),
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
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_fee_no int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_fee_no = p_fee_no;
    SET v_amt_ratio = p_amt_ratio;
    SET v_amt_value = p_amt_value;
    SET v_par_value_ratio = p_par_value_ratio;
    SET v_par_value_value = p_par_value_value;
    SET v_max_fee = p_max_fee;
    SET v_min_fee = p_min_fee;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "通道编号", "|", "市场编号", "|", "证券类型", "|", "费用编号", "|", "金额比例", "|", "金额固定额", "|", "面值比例", "|", "面值固定额", "|", "最高费用", "|", "最低费用", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_pass_no, "|", v_exch_no, "|", v_stock_type, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [插入表记录][公共_证券费用_外部证券类型费用表][字段][字段变量][1][@通道编号#, @市场编号#, @证券类型#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_out_stock_type_fee(
        create_date, create_time, update_date, 
        update_time, update_times, pass_no, exch_no, 
        stock_type, fee_no, amt_ratio, amt_value, 
        par_value_ratio, par_value_value, max_fee, min_fee) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pass_no, v_exch_no, 
        v_stock_type, v_fee_no, v_amt_ratio, v_amt_value, 
        v_par_value_ratio, v_par_value_value, v_max_fee, v_min_fee);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.81.1";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_pass_no, "|", v_exch_no, "|", v_stock_type, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_外部证券类型费用流水表][字段][字段变量][5][@通道编号#, @市场编号#, @证券类型#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_out_stock_type_fee_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, pass_no, 
        exch_no, stock_type, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_pass_no, 
        v_exch_no, v_stock_type, v_fee_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.81.5";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_修改外部证券类型费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_ModiOutStockTypeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_ModiOutStockTypeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_fee_no int,
    IN p_amt_ratio decimal(18,12),
    IN p_amt_value decimal(18,4),
    IN p_par_value_ratio decimal(18,12),
    IN p_par_value_value decimal(18,4),
    IN p_max_fee decimal(18,4),
    IN p_min_fee decimal(18,4),
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
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_fee_no int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_fee_no = p_fee_no;
    SET v_amt_ratio = p_amt_ratio;
    SET v_amt_value = p_amt_value;
    SET v_par_value_ratio = p_par_value_ratio;
    SET v_par_value_value = p_par_value_value;
    SET v_max_fee = p_max_fee;
    SET v_min_fee = p_min_fee;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "通道编号", "|", "市场编号", "|", "证券类型", "|", "费用编号", "|", "金额比例", "|", "金额固定额", "|", "面值比例", "|", "面值固定额", "|", "最高费用", "|", "最低费用", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_pass_no, "|", v_exch_no, "|", v_stock_type, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_证券费用_外部证券类型费用表][{金额比例}=@金额比例#,{金额固定额}=@金额固定额#,{面值比例}=@面值比例#,{面值固定额}=@面值固定额#,{最高费用}=@最高费用#,{最低费用}=@最低费用#][{通道编号}=@通道编号# and {市场编号}=@市场编号# and {证券类型}=@证券类型# and {费用编号}=@费用编号#][2][@通道编号#, @市场编号#, @证券类型#, @费用编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_feesecu_out_stock_type_fee set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, amt_ratio=v_amt_ratio,amt_value=v_amt_value,par_value_ratio=v_par_value_ratio,par_value_value=v_par_value_value,max_fee=v_max_fee,min_fee=v_min_fee where pass_no=v_pass_no and exch_no=v_exch_no and stock_type=v_stock_type and fee_no=v_fee_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.82.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券费用_外部证券类型费用表][{记录序号}][@记录序号#][{通道编号}=@通道编号# and {市场编号}=@市场编号# and {证券类型}=@证券类型# and {费用编号}=@费用编号#][4][@通道编号#, @市场编号#, @证券类型#, @费用编号#] */
    select row_id into v_row_id from db_pub.tb_feesecu_out_stock_type_fee where pass_no=v_pass_no and exch_no=v_exch_no and stock_type=v_stock_type and fee_no=v_fee_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.82.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_pass_no, "|", v_exch_no, "|", v_stock_type, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_外部证券类型费用流水表][字段][字段变量][5][@通道编号#, @市场编号#, @证券类型#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_out_stock_type_fee_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, pass_no, 
        exch_no, stock_type, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_pass_no, 
        v_exch_no, v_stock_type, v_fee_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.82.5";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_删除外部证券类型费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_DeleteOutStockTypeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_DeleteOutStockTypeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_fee_no int,
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
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_fee_no int;
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
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_fee_no = p_fee_no;
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

    /* [获取表记录变量][公共_证券费用_外部证券类型费用表][{记录序号}][@记录序号#][{通道编号}=@通道编号# and {市场编号}=@市场编号# and {证券类型}=@证券类型# and {费用编号}=@费用编号#][4][@通道编号#, @市场编号#, @证券类型#, @费用编号#] */
    select row_id into v_row_id from db_pub.tb_feesecu_out_stock_type_fee where pass_no=v_pass_no and exch_no=v_exch_no and stock_type=v_stock_type and fee_no=v_fee_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.83.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_外部证券类型费用表][{通道编号}=@通道编号# and {市场编号}=@市场编号# and {证券类型}=@证券类型# and {费用编号}=@费用编号#][3][@通道编号#, @市场编号#, @证券类型#, @费用编号#] */
    delete from db_pub.tb_feesecu_out_stock_type_fee 
        where pass_no=v_pass_no and exch_no=v_exch_no and stock_type=v_stock_type and fee_no=v_fee_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.83.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# =" " ; */
    set v_jour_after_occur_info =" " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_外部证券类型费用流水表][字段][字段变量][5][@通道编号#, @市场编号#, @证券类型#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_out_stock_type_fee_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, pass_no, 
        exch_no, stock_type, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_pass_no, 
        v_exch_no, v_stock_type, v_fee_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.83.5";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询外部证券类型费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QueryOutStockTypeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QueryOutStockTypeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_fee_no int,
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
    declare v_pass_no int;
    declare v_fee_no int;
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
    SET v_pass_no = p_pass_no;
    SET v_fee_no = p_fee_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_外部证券类型费用表][字段][(@通道编号# = 0 or {通道编号} = @通道编号#) and (@费用编号# = 0 or {费用编号} = @费用编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";",{证券类型},";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        exch_no, stock_type, fee_no, amt_ratio, 
        amt_value, par_value_ratio, par_value_value, max_fee, 
        min_fee from db_pub.tb_feesecu_out_stock_type_fee where (v_pass_no = 0 or pass_no = v_pass_no) and (v_fee_no = 0 or fee_no = v_fee_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";",stock_type,";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        exch_no, stock_type, fee_no, amt_ratio, 
        amt_value, par_value_ratio, par_value_value, max_fee, 
        min_fee from db_pub.tb_feesecu_out_stock_type_fee where (v_pass_no = 0 or pass_no = v_pass_no) and (v_fee_no = 0 or fee_no = v_fee_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";",stock_type,";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询外部证券类型费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QueryOutStockTypeFeeJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QueryOutStockTypeFeeJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_fee_no int,
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
    declare v_pass_no int;
    declare v_fee_no int;
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
    SET v_pass_no = p_pass_no;
    SET v_fee_no = p_fee_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_外部证券类型费用流水表][字段][{初始化日期}<=@初始化日期# and (@通道编号# = 0 or {通道编号} = @通道编号#) and (@费用编号# = 0 or {费用编号} = @费用编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";",{证券类型},";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        pass_no, exch_no, stock_type, fee_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_out_stock_type_fee_jour where init_date<=v_init_date and (v_pass_no = 0 or pass_no = v_pass_no) and (v_fee_no = 0 or fee_no = v_fee_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";",stock_type,";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        pass_no, exch_no, stock_type, fee_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_out_stock_type_fee_jour where init_date<=v_init_date and (v_pass_no = 0 or pass_no = v_pass_no) and (v_fee_no = 0 or fee_no = v_fee_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";",stock_type,";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询历史外部证券类型费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QueryOutStockTypeFeeJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QueryOutStockTypeFeeJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_pass_no int,
    IN p_fee_no int,
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
    declare v_pass_no int;
    declare v_fee_no int;
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
    SET v_pass_no = p_pass_no;
    SET v_fee_no = p_fee_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_证券费用_外部证券类型费用流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@通道编号# = 0 or {通道编号} = @通道编号#) and (@费用编号# = 0 or {费用编号} = @费用编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";",{证券类型},";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        pass_no, exch_no, stock_type, fee_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_out_stock_type_fee_jour_his where (init_date between v_begin_date and v_end_date) and (v_pass_no = 0 or pass_no = v_pass_no) and (v_fee_no = 0 or fee_no = v_fee_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";",stock_type,";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        pass_no, exch_no, stock_type, fee_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_out_stock_type_fee_jour_his where (init_date between v_begin_date and v_end_date) and (v_pass_no = 0 or pass_no = v_pass_no) and (v_fee_no = 0 or fee_no = v_fee_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";",stock_type,";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_新增外部证券代码费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_AddOutStockCodeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_AddOutStockCodeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_fee_no int,
    IN p_amt_ratio decimal(18,12),
    IN p_amt_value decimal(18,4),
    IN p_par_value_ratio decimal(18,12),
    IN p_par_value_value decimal(18,4),
    IN p_max_fee decimal(18,4),
    IN p_min_fee decimal(18,4),
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
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_fee_no int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_fee_no = p_fee_no;
    SET v_amt_ratio = p_amt_ratio;
    SET v_amt_value = p_amt_value;
    SET v_par_value_ratio = p_par_value_ratio;
    SET v_par_value_value = p_par_value_value;
    SET v_max_fee = p_max_fee;
    SET v_min_fee = p_min_fee;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "通道编号", "|", "市场编号", "|", "证券代码编号", "|", "费用编号", "|", "金额比例", "|", "金额固定额", "|", "面值比例", "|", "面值固定额", "|", "最高费用", "|", "最低费用", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_pass_no, "|", v_exch_no, "|", v_stock_code_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [插入表记录][公共_证券费用_外部证券代码费用表][字段][字段变量][1][@通道编号#, @证券代码编号#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_out_stock_code_fee(
        create_date, create_time, update_date, 
        update_time, update_times, pass_no, exch_no, 
        stock_code_no, fee_no, amt_ratio, amt_value, 
        par_value_ratio, par_value_value, max_fee, min_fee) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pass_no, v_exch_no, 
        v_stock_code_no, v_fee_no, v_amt_ratio, v_amt_value, 
        v_par_value_ratio, v_par_value_value, v_max_fee, v_min_fee);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.91.1";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_pass_no, "|", v_exch_no, "|", v_stock_code_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_外部证券代码费用流水表][字段][字段变量][5][@通道编号#, @证券代码编号#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_out_stock_code_fee_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, pass_no, 
        exch_no, stock_code_no, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_pass_no, 
        v_exch_no, v_stock_code_no, v_fee_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.91.5";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_修改外部证券代码费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_ModiOutStockCodeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_ModiOutStockCodeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_fee_no int,
    IN p_amt_ratio decimal(18,12),
    IN p_amt_value decimal(18,4),
    IN p_par_value_ratio decimal(18,12),
    IN p_par_value_value decimal(18,4),
    IN p_max_fee decimal(18,4),
    IN p_min_fee decimal(18,4),
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
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_fee_no int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_fee_no = p_fee_no;
    SET v_amt_ratio = p_amt_ratio;
    SET v_amt_value = p_amt_value;
    SET v_par_value_ratio = p_par_value_ratio;
    SET v_par_value_value = p_par_value_value;
    SET v_max_fee = p_max_fee;
    SET v_min_fee = p_min_fee;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "通道编号", "|", "市场编号", "|", "证券代码编号", "|", "费用编号", "|", "金额比例", "|", "金额固定额", "|", "面值比例", "|", "面值固定额", "|", "最高费用", "|", "最低费用", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_pass_no, "|", v_exch_no, "|", v_stock_code_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_证券费用_外部证券代码费用表][{金额比例}=@金额比例#,{金额固定额}=@金额固定额#,{面值比例}=@面值比例#,{面值固定额}=@面值固定额#,{最高费用}=@最高费用#,{最低费用}=@最低费用#][{通道编号}=@通道编号# and {证券代码编号}=@证券代码编号# and {费用编号}=@费用编号#][2][@通道编号#, @证券代码编号#, @费用编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_feesecu_out_stock_code_fee set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, amt_ratio=v_amt_ratio,amt_value=v_amt_value,par_value_ratio=v_par_value_ratio,par_value_value=v_par_value_value,max_fee=v_max_fee,min_fee=v_min_fee where pass_no=v_pass_no and stock_code_no=v_stock_code_no and fee_no=v_fee_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.92.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券费用_外部证券代码费用表][{记录序号}][@记录序号#][{通道编号}=@通道编号# and {证券代码编号}=@证券代码编号# and {费用编号}=@费用编号#][4][@通道编号#, @证券代码编号#, @费用编号#] */
    select row_id into v_row_id from db_pub.tb_feesecu_out_stock_code_fee where pass_no=v_pass_no and stock_code_no=v_stock_code_no and fee_no=v_fee_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.92.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_pass_no, "|", v_exch_no, "|", v_stock_code_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_外部证券代码费用流水表][字段][字段变量][5][@通道编号#, @证券代码编号#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_out_stock_code_fee_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, pass_no, 
        exch_no, stock_code_no, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_pass_no, 
        v_exch_no, v_stock_code_no, v_fee_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.92.5";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_删除外部证券代码费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_DeleteOutStockCodeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_DeleteOutStockCodeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_fee_no int,
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
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_fee_no int;
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
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_fee_no = p_fee_no;
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

    /* [获取表记录变量][公共_证券费用_外部证券代码费用表][{记录序号}][@记录序号#][{通道编号}=@通道编号# and {证券代码编号}=@证券代码编号# and {费用编号}=@费用编号#][4][@通道编号#, @证券代码编号#, @费用编号#] */
    select row_id into v_row_id from db_pub.tb_feesecu_out_stock_code_fee where pass_no=v_pass_no and stock_code_no=v_stock_code_no and fee_no=v_fee_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.93.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_外部证券代码费用表][{通道编号}=@通道编号# and {证券代码编号}=@证券代码编号# and {费用编号}=@费用编号#][3][@通道编号#, @证券代码编号#, @费用编号#] */
    delete from db_pub.tb_feesecu_out_stock_code_fee 
        where pass_no=v_pass_no and stock_code_no=v_stock_code_no and fee_no=v_fee_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.93.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# =" " ; */
    set v_jour_after_occur_info =" " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_外部证券代码费用流水表][字段][字段变量][5][@通道编号#, @证券代码编号#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_out_stock_code_fee_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, pass_no, 
        exch_no, stock_code_no, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_pass_no, 
        v_exch_no, v_stock_code_no, v_fee_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.93.5";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询外部证券代码费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QueryOutStockCodeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QueryOutStockCodeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_fee_no int,
    IN p_exch_no_str varchar(2048),
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
    declare v_pass_no int;
    declare v_fee_no int;
    declare v_exch_no_str varchar(2048);
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
    SET v_pass_no = p_pass_no;
    SET v_fee_no = p_fee_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_外部证券代码费用表][字段][(@通道编号# = 0 or {通道编号} = @通道编号#) and (@费用编号# = 0 or {费用编号} = @费用编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        exch_no, stock_code_no, fee_no, amt_ratio, 
        amt_value, par_value_ratio, par_value_value, max_fee, 
        min_fee from db_pub.tb_feesecu_out_stock_code_fee where (v_pass_no = 0 or pass_no = v_pass_no) and (v_fee_no = 0 or fee_no = v_fee_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        exch_no, stock_code_no, fee_no, amt_ratio, 
        amt_value, par_value_ratio, par_value_value, max_fee, 
        min_fee from db_pub.tb_feesecu_out_stock_code_fee where (v_pass_no = 0 or pass_no = v_pass_no) and (v_fee_no = 0 or fee_no = v_fee_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询外部证券代码费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QueryOutStockCodeFeeJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QueryOutStockCodeFeeJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_fee_no int,
    IN p_exch_no_str varchar(2048),
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
    declare v_init_date int;
    declare v_pass_no int;
    declare v_fee_no int;
    declare v_exch_no_str varchar(2048);
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
    SET v_init_date = p_init_date;
    SET v_pass_no = p_pass_no;
    SET v_fee_no = p_fee_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_外部证券代码费用流水表][字段][{初始化日期}<=@初始化日期# and (@通道编号# = 0 or {通道编号} = @通道编号#) and (@费用编号# = 0 or {费用编号} = @费用编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        pass_no, exch_no, stock_code_no, fee_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_out_stock_code_fee_jour where init_date<=v_init_date and (v_pass_no = 0 or pass_no = v_pass_no) and (v_fee_no = 0 or fee_no = v_fee_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        pass_no, exch_no, stock_code_no, fee_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_out_stock_code_fee_jour where init_date<=v_init_date and (v_pass_no = 0 or pass_no = v_pass_no) and (v_fee_no = 0 or fee_no = v_fee_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询历史外部证券代码费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QueryOutStockCodeFeeJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QueryOutStockCodeFeeJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_pass_no int,
    IN p_fee_no int,
    IN p_exch_no_str varchar(2048),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_pass_no int;
    declare v_fee_no int;
    declare v_exch_no_str varchar(2048);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_pass_no = p_pass_no;
    SET v_fee_no = p_fee_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_证券费用_外部证券代码费用流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@通道编号# = 0 or {通道编号} = @通道编号#) and (@费用编号# = 0 or {费用编号} = @费用编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        pass_no, exch_no, stock_code_no, fee_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_out_stock_code_fee_jour_his where (init_date between v_begin_date and v_end_date) and (v_pass_no = 0 or pass_no = v_pass_no) and (v_fee_no = 0 or fee_no = v_fee_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        pass_no, exch_no, stock_code_no, fee_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_out_stock_code_fee_jour_his where (init_date between v_begin_date and v_end_date) and (v_pass_no = 0 or pass_no = v_pass_no) and (v_fee_no = 0 or fee_no = v_fee_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_新增系统证券类型费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_AddSysStockTypeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_AddSysStockTypeFee(
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
    IN p_fee_no int,
    IN p_amt_ratio decimal(18,12),
    IN p_amt_value decimal(18,4),
    IN p_par_value_ratio decimal(18,12),
    IN p_par_value_value decimal(18,4),
    IN p_max_fee decimal(18,4),
    IN p_min_fee decimal(18,4),
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
    declare v_fee_no int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_fee_no = p_fee_no;
    SET v_amt_ratio = p_amt_ratio;
    SET v_amt_value = p_amt_value;
    SET v_par_value_ratio = p_par_value_ratio;
    SET v_par_value_value = p_par_value_value;
    SET v_max_fee = p_max_fee;
    SET v_min_fee = p_min_fee;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "市场编号", "|", "证券类型", "|", "费用编号", "|", "金额比例", "|", "金额固定额", "|", "面值比例", "|", "面值固定额", "|", "最高费用", "|", "最低费用", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_type, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [插入表记录][公共_证券费用_系统证券类型费用表][字段][字段变量][1][@市场编号#, @证券类型#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_sys_stock_type_fee(
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, stock_type, 
        fee_no, amt_ratio, amt_value, par_value_ratio, 
        par_value_value, max_fee, min_fee) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_no, v_stock_type, 
        v_fee_no, v_amt_ratio, v_amt_value, v_par_value_ratio, 
        v_par_value_value, v_max_fee, v_min_fee);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.101.1";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_type, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_系统证券类型费用流水表][字段][字段变量][5][@市场编号#, @证券类型#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_sys_stock_type_fee_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, exch_no, 
        stock_type, fee_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_exch_no, 
        v_stock_type, v_fee_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.101.5";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_修改系统证券类型费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_ModiSysStockTypeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_ModiSysStockTypeFee(
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
    IN p_fee_no int,
    IN p_amt_ratio decimal(18,12),
    IN p_amt_value decimal(18,4),
    IN p_par_value_ratio decimal(18,12),
    IN p_par_value_value decimal(18,4),
    IN p_max_fee decimal(18,4),
    IN p_min_fee decimal(18,4),
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
    declare v_fee_no int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_fee_no = p_fee_no;
    SET v_amt_ratio = p_amt_ratio;
    SET v_amt_value = p_amt_value;
    SET v_par_value_ratio = p_par_value_ratio;
    SET v_par_value_value = p_par_value_value;
    SET v_max_fee = p_max_fee;
    SET v_min_fee = p_min_fee;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "市场编号", "|", "证券类型", "|", "费用编号", "|", "金额比例", "|", "金额固定额", "|", "面值比例", "|", "面值固定额", "|", "最高费用", "|", "最低费用", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_type, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_证券费用_系统证券类型费用表][{金额比例}=@金额比例#,{金额固定额}=@金额固定额#,{面值比例}=@面值比例#,{面值固定额}=@面值固定额#,{最高费用}=@最高费用#,{最低费用}=@最低费用#][{市场编号}=@市场编号# and {证券类型}=@证券类型# and {费用编号}=@费用编号#][2][@市场编号#, @证券类型#, @费用编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_feesecu_sys_stock_type_fee set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, amt_ratio=v_amt_ratio,amt_value=v_amt_value,par_value_ratio=v_par_value_ratio,par_value_value=v_par_value_value,max_fee=v_max_fee,min_fee=v_min_fee where exch_no=v_exch_no and stock_type=v_stock_type and fee_no=v_fee_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.102.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券费用_系统证券类型费用表][{记录序号}][@记录序号#][{市场编号}=@市场编号# and {证券类型}=@证券类型# and {费用编号}=@费用编号#][4][@市场编号#, @证券类型#, @费用编号#] */
    select row_id into v_row_id from db_pub.tb_feesecu_sys_stock_type_fee where exch_no=v_exch_no and stock_type=v_stock_type and fee_no=v_fee_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.102.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_type, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_系统证券类型费用流水表][字段][字段变量][5][@市场编号#, @证券类型#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_sys_stock_type_fee_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, exch_no, 
        stock_type, fee_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_exch_no, 
        v_stock_type, v_fee_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.102.5";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_删除系统证券类型费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_DeleteSysStockTypeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_DeleteSysStockTypeFee(
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
    IN p_fee_no int,
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
    declare v_fee_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_fee_no = p_fee_no;
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

    /* [获取表记录变量][公共_证券费用_系统证券类型费用表][{记录序号}][@记录序号#][{市场编号}=@市场编号# and {证券类型}=@证券类型# and {费用编号}=@费用编号#][4][@市场编号#, @证券类型#, @费用编号#] */
    select row_id into v_row_id from db_pub.tb_feesecu_sys_stock_type_fee where exch_no=v_exch_no and stock_type=v_stock_type and fee_no=v_fee_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.103.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_系统证券类型费用表][{市场编号}=@市场编号# and {证券类型}=@证券类型# and {费用编号}=@费用编号#][3][@市场编号#, @证券类型#, @费用编号#] */
    delete from db_pub.tb_feesecu_sys_stock_type_fee 
        where exch_no=v_exch_no and stock_type=v_stock_type and fee_no=v_fee_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.103.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# =" " ; */
    set v_jour_after_occur_info =" " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_系统证券类型费用流水表][字段][字段变量][5][@市场编号#, @证券类型#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_sys_stock_type_fee_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, exch_no, 
        stock_type, fee_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_exch_no, 
        v_stock_type, v_fee_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.103.5";
        SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询系统证券类型费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QuerySysStockTypeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QuerySysStockTypeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_fee_no_str varchar(255),
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
    declare v_fee_no_str varchar(255);
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
    SET v_fee_no_str = p_fee_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_系统证券类型费用表][字段][(@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and (@费用编号串# = "; ;" or instr(@费用编号串#, concat(";", {费用编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_type, fee_no, amt_ratio, amt_value, 
        par_value_ratio, par_value_value, max_fee, min_fee from db_pub.tb_feesecu_sys_stock_type_fee where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_type, fee_no, amt_ratio, amt_value, 
        par_value_ratio, par_value_value, max_fee, min_fee from db_pub.tb_feesecu_sys_stock_type_fee where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询系统证券类型费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QuerySysStockTypeFeeJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QuerySysStockTypeFeeJour(
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
    IN p_fee_no_str varchar(255),
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
    declare v_fee_no_str varchar(255);
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
    SET v_fee_no_str = p_fee_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_系统证券类型费用流水表][字段][{初始化日期}<=@初始化日期# and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and (@费用编号串# = "; ;" or instr(@费用编号串#, concat(";", {费用编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_type, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_sys_stock_type_fee_jour where init_date<=v_init_date and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_type, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_sys_stock_type_fee_jour where init_date<=v_init_date and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询历史系统证券类型费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QuerySysStockTypeFeeJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QuerySysStockTypeFeeJour_His(
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
    IN p_fee_no_str varchar(255),
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
    declare v_fee_no_str varchar(255);
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
    SET v_fee_no_str = p_fee_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_证券费用_系统证券类型费用流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and (@费用编号串# = "; ;" or instr(@费用编号串#, concat(";", {费用编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_type, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_sys_stock_type_fee_jour_his where (init_date between v_begin_date and v_end_date) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_type, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_sys_stock_type_fee_jour_his where (init_date between v_begin_date and v_end_date) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_新增系统证券代码费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_AddSysStockCodeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_AddSysStockCodeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_fee_no int,
    IN p_amt_ratio decimal(18,12),
    IN p_amt_value decimal(18,4),
    IN p_par_value_ratio decimal(18,12),
    IN p_par_value_value decimal(18,4),
    IN p_max_fee decimal(18,4),
    IN p_min_fee decimal(18,4),
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
    declare v_stock_code_no int;
    declare v_fee_no int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_fee_no = p_fee_no;
    SET v_amt_ratio = p_amt_ratio;
    SET v_amt_value = p_amt_value;
    SET v_par_value_ratio = p_par_value_ratio;
    SET v_par_value_value = p_par_value_value;
    SET v_max_fee = p_max_fee;
    SET v_min_fee = p_min_fee;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "市场编号", "|", "证券代码编号", "|", "费用编号", "|", "金额比例", "|", "金额固定额", "|", "面值比例", "|", "面值固定额", "|", "最高费用", "|", "最低费用", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_code_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [插入表记录][公共_证券费用_系统证券代码费用表][字段][字段变量][1][@证券代码编号#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_sys_stock_code_fee(
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, stock_code_no, 
        fee_no, amt_ratio, amt_value, par_value_ratio, 
        par_value_value, max_fee, min_fee) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_no, v_stock_code_no, 
        v_fee_no, v_amt_ratio, v_amt_value, v_par_value_ratio, 
        v_par_value_value, v_max_fee, v_min_fee);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.111.1";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_code_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_系统证券代码费用流水表][字段][字段变量][5][@证券代码编号#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_sys_stock_code_fee_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, exch_no, 
        stock_code_no, fee_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_exch_no, 
        v_stock_code_no, v_fee_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.111.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_修改系统证券代码费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_ModiSysStockCodeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_ModiSysStockCodeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_fee_no int,
    IN p_amt_ratio decimal(18,12),
    IN p_amt_value decimal(18,4),
    IN p_par_value_ratio decimal(18,12),
    IN p_par_value_value decimal(18,4),
    IN p_max_fee decimal(18,4),
    IN p_min_fee decimal(18,4),
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
    declare v_stock_code_no int;
    declare v_fee_no int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_fee_no = p_fee_no;
    SET v_amt_ratio = p_amt_ratio;
    SET v_amt_value = p_amt_value;
    SET v_par_value_ratio = p_par_value_ratio;
    SET v_par_value_value = p_par_value_value;
    SET v_max_fee = p_max_fee;
    SET v_min_fee = p_min_fee;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "市场编号", "|", "证券代码编号", "|", "费用编号", "|", "金额比例", "|", "金额固定额", "|", "面值比例", "|", "面值固定额", "|", "最高费用", "|", "最低费用", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_code_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_证券费用_系统证券代码费用表][{金额比例}=@金额比例#,{金额固定额}=@金额固定额#,{面值比例}=@面值比例#,{面值固定额}=@面值固定额#,{最高费用}=@最高费用#,{最低费用}=@最低费用#][{证券代码编号}=@证券代码编号# and {费用编号}=@费用编号#][2][@证券代码编号#, @费用编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_feesecu_sys_stock_code_fee set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, amt_ratio=v_amt_ratio,amt_value=v_amt_value,par_value_ratio=v_par_value_ratio,par_value_value=v_par_value_value,max_fee=v_max_fee,min_fee=v_min_fee where stock_code_no=v_stock_code_no and fee_no=v_fee_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.112.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券费用_系统证券代码费用表][{记录序号}][@记录序号#][{证券代码编号}=@证券代码编号# and {费用编号}=@费用编号#][4][@证券代码编号#, @费用编号#] */
    select row_id into v_row_id from db_pub.tb_feesecu_sys_stock_code_fee where stock_code_no=v_stock_code_no and fee_no=v_fee_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.112.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_exch_no, "|", v_stock_code_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_系统证券代码费用流水表][字段][字段变量][5][@证券代码编号#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_sys_stock_code_fee_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, exch_no, 
        stock_code_no, fee_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_exch_no, 
        v_stock_code_no, v_fee_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.112.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_删除系统证券代码费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_DeleteSysStockCodeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_DeleteSysStockCodeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_fee_no int,
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
    declare v_stock_code_no int;
    declare v_fee_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_fee_no = p_fee_no;
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

    /* [获取表记录变量][公共_证券费用_系统证券代码费用表][{记录序号}][@记录序号#][{证券代码编号}=@证券代码编号# and {费用编号}=@费用编号#][4][@证券代码编号#, @费用编号#] */
    select row_id into v_row_id from db_pub.tb_feesecu_sys_stock_code_fee where stock_code_no=v_stock_code_no and fee_no=v_fee_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.113.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_系统证券代码费用表][{证券代码编号}=@证券代码编号# and {费用编号}=@费用编号#][3][@证券代码编号#, @费用编号#] */
    delete from db_pub.tb_feesecu_sys_stock_code_fee 
        where stock_code_no=v_stock_code_no and fee_no=v_fee_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.113.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# =" " ; */
    set v_jour_after_occur_info =" " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_系统证券代码费用流水表][字段][字段变量][5][@证券代码编号#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_sys_stock_code_fee_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, exch_no, 
        stock_code_no, fee_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_exch_no, 
        v_stock_code_no, v_fee_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.113.5";
        SET v_error_info =  CONCAT(concat("证券代码编号=",v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询系统证券代码费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QuerySysStockCodeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QuerySysStockCodeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_fee_no_str varchar(255),
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
    declare v_stock_code_no int;
    declare v_fee_no_str varchar(255);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_fee_no_str = p_fee_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_系统证券代码费用表][字段][(@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@费用编号串# = "; ;" or instr(@费用编号串#, concat(";", {费用编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code_no, fee_no, amt_ratio, amt_value, 
        par_value_ratio, par_value_value, max_fee, min_fee from db_pub.tb_feesecu_sys_stock_code_fee where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code_no, fee_no, amt_ratio, amt_value, 
        par_value_ratio, par_value_value, max_fee, min_fee from db_pub.tb_feesecu_sys_stock_code_fee where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询系统证券代码费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QuerySysStockCodeFeeJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QuerySysStockCodeFeeJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_fee_no_str varchar(255),
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
    declare v_stock_code_no int;
    declare v_fee_no_str varchar(255);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_fee_no_str = p_fee_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_系统证券代码费用流水表][字段][{初始化日期}<=@初始化日期# and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@费用编号串# = "; ;" or instr(@费用编号串#, concat(";", {费用编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code_no, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_sys_stock_code_fee_jour where init_date<=v_init_date and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code_no, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_sys_stock_code_fee_jour where init_date<=v_init_date and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询历史系统证券代码费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QuerySysStockCodeFeeJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QuerySysStockCodeFeeJour_His(
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
    IN p_stock_code_no int,
    IN p_fee_no_str varchar(255),
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
    declare v_stock_code_no int;
    declare v_fee_no_str varchar(255);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_fee_no_str = p_fee_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_证券费用_系统证券代码费用流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@费用编号串# = "; ;" or instr(@费用编号串#, concat(";", {费用编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code_no, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_sys_stock_code_fee_jour_his where (init_date between v_begin_date and v_end_date) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code_no, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_sys_stock_code_fee_jour_his where (init_date between v_begin_date and v_end_date) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_新增产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_AddProdFare;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_AddProdFare(
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
    IN p_pd_fee_type int,
    IN p_pd_fee_name varchar(64),
    IN p_pd_fee_rate decimal(18,12),
    IN p_pd_fee_cacl_type int,
    IN p_pd_fee_cacl_base decimal(18,4),
    IN p_min_fee decimal(18,4),
    IN p_crncy_type varchar(3),
    IN p_remark_info varchar(255),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
    declare v_pd_fee_name varchar(64);
    declare v_pd_fee_rate decimal(18,12);
    declare v_pd_fee_cacl_type int;
    declare v_pd_fee_cacl_base decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_jour_occur_field varchar(2048);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_pd_fee_name = p_pd_fee_name;
    SET v_pd_fee_rate = p_pd_fee_rate;
    SET v_pd_fee_cacl_type = p_pd_fee_cacl_type;
    SET v_pd_fee_cacl_base = p_pd_fee_cacl_base;
    SET v_min_fee = p_min_fee;
    SET v_crncy_type = p_crncy_type;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";

    
    label_pro:BEGIN
    

    /* [插入表记录][公共_证券费用_产品费用表][字段][字段变量][1][@产品编号#, @产品费用类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_prod_fare(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        pd_fee_type, pd_fee_name, pd_fee_rate, pd_fee_cacl_type, 
        pd_fee_cacl_base, min_fee, crncy_type, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_pd_fee_type, v_pd_fee_name, v_pd_fee_rate, v_pd_fee_cacl_type, 
        v_pd_fee_cacl_base, v_min_fee, v_crncy_type, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.161.1";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,","," 产品费用类型=", v_pd_fee_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增产品费用"; */
    set v_oper_remark_info = "新增产品费用";

    /* [插入表记录][公共_证券费用_产品费用流水表][字段][字段变量][5][@产品编号#, @产品费用类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_prod_fare_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, pd_fee_type, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_pd_fee_type, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.161.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,","," 产品费用类型=", v_pd_fee_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_修改产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_ModiProdFare;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_ModiProdFare(
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
    IN p_pd_fee_type int,
    IN p_pd_fee_name varchar(64),
    IN p_pd_fee_rate decimal(18,12),
    IN p_pd_fee_cacl_type int,
    IN p_pd_fee_cacl_base decimal(18,4),
    IN p_min_fee decimal(18,4),
    IN p_crncy_type varchar(3),
    IN p_remark_info varchar(255),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
    declare v_pd_fee_name varchar(64);
    declare v_pd_fee_rate decimal(18,12);
    declare v_pd_fee_cacl_type int;
    declare v_pd_fee_cacl_base decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_pd_fee_name = p_pd_fee_name;
    SET v_pd_fee_rate = p_pd_fee_rate;
    SET v_pd_fee_cacl_type = p_pd_fee_cacl_type;
    SET v_pd_fee_cacl_base = p_pd_fee_cacl_base;
    SET v_min_fee = p_min_fee;
    SET v_crncy_type = p_crncy_type;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_证券费用_产品费用表][{产品费用类型}=@产品费用类型#,{产品费用名称}=@产品费用名称#,{产品费用费率}=@产品费用费率#,{产品费用计费方式}=@产品费用计费方式#,{产品费用计费基数}=@产品费用计费基数#,{最低费用}=@最低费用#,{本币币种}=@本币币种#,{备注信息}=@备注信息#][{产品编号}=@产品编号# and {产品费用类型}=@产品费用类型#][2][@产品编号#, @产品费用类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_feesecu_prod_fare set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pd_fee_type=v_pd_fee_type,pd_fee_name=v_pd_fee_name,pd_fee_rate=v_pd_fee_rate,pd_fee_cacl_type=v_pd_fee_cacl_type,pd_fee_cacl_base=v_pd_fee_cacl_base,min_fee=v_min_fee,crncy_type=v_crncy_type,remark_info=v_remark_info where pd_no=v_pd_no and pd_fee_type=v_pd_fee_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.162.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,","," 产品费用类型=", v_pd_fee_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,","," 产品费用类型=", v_pd_fee_type);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改产品费用"; */
    set v_oper_remark_info = "修改产品费用";

    /* [插入表记录][公共_证券费用_产品费用流水表][字段][字段变量][5][@产品编号#, @产品费用类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_prod_fare_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, pd_fee_type, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_pd_fee_type, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.162.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,","," 产品费用类型=", v_pd_fee_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_删除产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_DeleteProdFare;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_DeleteProdFare(
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
    IN p_pd_fee_type int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
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
    declare v_pd_fee_name varchar(64);
    declare v_pd_fee_rate decimal(18,12);
    declare v_pd_fee_cacl_type int;
    declare v_pd_fee_cacl_base decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_remark_info varchar(255);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_jour_occur_field varchar(2048);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type = p_pd_fee_type;
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
    SET v_pd_fee_name = " ";
    SET v_pd_fee_rate = 0;
    SET v_pd_fee_cacl_type = 0;
    SET v_pd_fee_cacl_base = 0;
    SET v_min_fee = 0;
    SET v_crncy_type = "CNY";
    SET v_remark_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券费用_产品费用表][字段][字段变量][{产品编号}=@产品编号# and {产品费用类型}=@产品费用类型#][4][@产品编号#, @产品费用类型#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, pd_fee_type, pd_fee_name, pd_fee_rate, 
        pd_fee_cacl_type, pd_fee_cacl_base, min_fee, crncy_type, 
        remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_pd_fee_type, v_pd_fee_name, v_pd_fee_rate, 
        v_pd_fee_cacl_type, v_pd_fee_cacl_base, v_min_fee, v_crncy_type, 
        v_remark_info from db_pub.tb_feesecu_prod_fare where pd_no=v_pd_no and pd_fee_type=v_pd_fee_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.163.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,","," 产品费用类型=", v_pd_fee_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,","," 产品费用类型=", v_pd_fee_type);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_产品费用表][{产品编号}=@产品编号# and {产品费用类型}=@产品费用类型#][3][@产品编号#, @产品费用类型#] */
    delete from db_pub.tb_feesecu_prod_fare 
        where pd_no=v_pd_no and pd_fee_type=v_pd_fee_type;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.163.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,","," 产品费用类型=", v_pd_fee_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,","," 产品费用类型=", v_pd_fee_type);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_产品费用流水表][字段][字段变量][5][@产品编号#, @产品费用类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_prod_fare_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, pd_fee_type, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_pd_fee_type, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.163.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,","," 产品费用类型=", v_pd_fee_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QueryProdFare;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QueryProdFare(
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
    declare v_pd_fee_type_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pd_fee_type_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_产品费用表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@产品费用类型串# = " " or instr(@产品费用类型串#, concat(";", {产品费用类型}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, pd_fee_type, pd_fee_name, pd_fee_rate, 
        pd_fee_cacl_type, pd_fee_cacl_base, min_fee, crncy_type, 
        remark_info from db_pub.tb_feesecu_prod_fare where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_pd_fee_type_str = " " or instr(v_pd_fee_type_str, concat(";", pd_fee_type, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, pd_fee_type, pd_fee_name, pd_fee_rate, 
        pd_fee_cacl_type, pd_fee_cacl_base, min_fee, crncy_type, 
        remark_info from db_pub.tb_feesecu_prod_fare where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_pd_fee_type_str = " " or instr(v_pd_fee_type_str, concat(";", pd_fee_type, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询产品费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QueryProdFareJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QueryProdFareJour(
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
    IN p_pd_fee_type_str varchar(64),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type_str varchar(64);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type_str = p_pd_fee_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_产品费用流水表][字段][{初始化日期}=@初始化日期# and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@产品费用类型串# = "; ;" or instr(@产品费用类型串#, concat(";", {产品费用类型}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, pd_fee_type, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_prod_fare_jour where init_date=v_init_date and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_pd_fee_type_str = "; ;" or instr(v_pd_fee_type_str, concat(";", pd_fee_type, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, pd_fee_type, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_prod_fare_jour where init_date=v_init_date and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_pd_fee_type_str = "; ;" or instr(v_pd_fee_type_str, concat(";", pd_fee_type, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_查询历史产品费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QueryProdFareJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QueryProdFareJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_fee_type_str varchar(64),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type_str varchar(64);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type_str = p_pd_fee_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_证券费用_产品费用流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@产品费用类型串# = "; ;" or instr(@产品费用类型串#, concat(";", {产品费用类型}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, pd_fee_type, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_prod_fare_jour_his where (init_date between v_begin_date and v_end_date) and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_pd_fee_type_str = "; ;" or instr(v_pd_fee_type_str, concat(";", pd_fee_type, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, pd_fee_type, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_prod_fare_jour_his where (init_date between v_begin_date and v_end_date) and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_pd_fee_type_str = "; ;" or instr(v_pd_fee_type_str, concat(";", pd_fee_type, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_归档公共证券费用数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_BackUpFeeSecuData;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_BackUpFeeSecuData(
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
    

    /* [数据归历史][公共_证券费用_证券费用模板流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_feesecu_secu_fee_tmplat_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        fee_tmplat_no, co_no, fee_tmplat_name, fee_tmplat_kind, 
        remark_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        fee_tmplat_no, co_no, fee_tmplat_name, fee_tmplat_kind, 
        remark_info, oper_remark_info 
        from db_pub.tb_feesecu_secu_fee_tmplat_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.171.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_证券费用模板流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_feesecu_secu_fee_tmplat_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.171.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券费用_证券类型费用模板明细流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_feesecu_stock_type_fee_tmplat_detail_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_type, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_type, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info 
        from db_pub.tb_feesecu_stock_type_fee_tmplat_detail_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.171.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_证券类型费用模板明细流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_feesecu_stock_type_fee_tmplat_detail_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.171.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券费用_证券代码费用模板明细流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_feesecu_stock_code_fee_tmplat_detail_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_code_no, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_code_no, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info 
        from db_pub.tb_feesecu_stock_code_fee_tmplat_detail_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.171.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_证券代码费用模板明细流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_feesecu_stock_code_fee_tmplat_detail_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.171.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券费用_资产账户证券费用模板流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_feesecu_asset_acco_fee_tmplat_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        asset_acco_no, co_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        asset_acco_no, co_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info 
        from db_pub.tb_feesecu_asset_acco_fee_tmplat_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.171.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_资产账户证券费用模板流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_feesecu_asset_acco_fee_tmplat_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.171.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券费用_外部证券类型费用流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_feesecu_out_stock_type_fee_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        pass_no, exch_no, stock_type, fee_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        pass_no, exch_no, stock_type, fee_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info 
        from db_pub.tb_feesecu_out_stock_type_fee_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.171.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_外部证券类型费用流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_feesecu_out_stock_type_fee_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.171.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券费用_外部证券代码费用流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_feesecu_out_stock_code_fee_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        pass_no, exch_no, stock_code_no, fee_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        pass_no, exch_no, stock_code_no, fee_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info 
        from db_pub.tb_feesecu_out_stock_code_fee_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.171.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_外部证券代码费用流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_feesecu_out_stock_code_fee_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.171.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券费用_系统证券类型费用流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_feesecu_sys_stock_type_fee_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_type, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_type, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pub.tb_feesecu_sys_stock_type_fee_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.171.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_系统证券类型费用流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_feesecu_sys_stock_type_fee_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.171.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券费用_系统证券代码费用流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_feesecu_sys_stock_code_fee_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code_no, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        exch_no, stock_code_no, fee_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pub.tb_feesecu_sys_stock_code_fee_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.171.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_系统证券代码费用流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_feesecu_sys_stock_code_fee_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.171.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_证券费用_产品费用流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_feesecu_prod_fare_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, pd_fee_type, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, pd_fee_type, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pub.tb_feesecu_prod_fare_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.9.171.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_产品费用流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_feesecu_prod_fare_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.9.171.3";
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

# 原子_公共_证券费用_查询费用编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_QueryFeeNo;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_QueryFeeNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_fee_no int,
    IN p_secu_fee_type int,
    IN p_order_dir int,
    IN p_contrc_dir int,
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
    declare v_fee_no int;
    declare v_secu_fee_type int;
    declare v_order_dir int;
    declare v_contrc_dir int;
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
    SET v_fee_no = p_fee_no;
    SET v_secu_fee_type = p_secu_fee_type;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][公共_证券费用_费用编号表][字段][(@费用编号# = 0 or {费用编号}=@费用编号#) and (@证券费用类型# = 0 or {证券费用类型}=@证券费用类型#) and (@订单方向# = 0 or {订单方向}=@订单方向#) and (@开平方向# = 0 or {开平方向}=@开平方向#)] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, fee_no, 
        secu_fee_type, order_dir, contrc_dir, remark_info from db_pub.tb_feesecu_fee_no where (v_fee_no = 0 or fee_no=v_fee_no) and (v_secu_fee_type = 0 or secu_fee_type=v_secu_fee_type) and (v_order_dir = 0 or order_dir=v_order_dir) and (v_contrc_dir = 0 or contrc_dir=v_contrc_dir);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_计算证券指定费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_CalcSecuSpecFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_CalcSecuSpecFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_secu_fee_type int,
    IN p_fee_no int,
    IN p_fee_qty decimal(18,2),
    IN p_fee_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_tax_fee decimal(18,4)
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
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_secu_fee_type int;
    declare v_fee_no int;
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tax_fee decimal(18,4);
    declare v_secu_code_spec_fee_tmplat_no int;
    declare v_secu_type_spec_fee_tmplat_no int;
    declare v_secu_code_fee_tmplat_no int;
    declare v_secu_type_fee_tmplat_no int;
    declare v_secu_code_out_fee_tmplat_no int;
    declare v_secu_type_out_fee_tmplat_no int;
    declare v_calc_end_flag int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_float_ratio decimal(18,12);
    declare v_fee_choice int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_secu_fee_type = p_secu_fee_type;
    SET v_fee_no = p_fee_no;
    SET v_fee_qty = p_fee_qty;
    SET v_fee_price = p_fee_price;
    SET v_order_qty = p_order_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tax_fee = 0;
    SET v_secu_code_spec_fee_tmplat_no = 0;
    SET v_secu_type_spec_fee_tmplat_no = 0;
    SET v_secu_code_fee_tmplat_no = 0;
    SET v_secu_type_fee_tmplat_no = 0;
    SET v_secu_code_out_fee_tmplat_no = 0;
    SET v_secu_type_out_fee_tmplat_no = 0;
    SET v_calc_end_flag = 0;
    SET v_amt_ratio = 0;
    SET v_amt_value = 0;
    SET v_par_value_ratio = 0;
    SET v_par_value_value = 0;
    SET v_max_fee = 0;
    SET v_min_fee = 0;
    SET v_float_ratio = 0;
    SET v_fee_choice = 0;

    
    label_pro:BEGIN
    
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

        /* [获取表记录变量语句][公共_证券费用_证券代码费用模板明细表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#,@浮动比例#,@费用选择#][{费用模板编号} = @证券代码特殊费用模板编号# and {证券代码编号} = @证券代码编号# and {费用编号} = @费用编号#] */
        select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee,v_float_ratio,v_fee_choice from db_pub.tb_feesecu_stock_code_fee_tmplat_detail where fee_tmplat_no = v_secu_code_spec_fee_tmplat_no and stock_code_no = v_stock_code_no and fee_no = v_fee_no limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @计算结束标志# = 1; */
            set v_calc_end_flag = 1;
        end if;
    end if;

    /* if @证券类型特殊费用模板编号# <> 0 and @计算结束标志# = 0 then */
    if v_secu_type_spec_fee_tmplat_no <> 0 and v_calc_end_flag = 0 then

        /* [获取表记录变量语句][公共_证券费用_证券类型费用模板明细表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#,@浮动比例#,@费用选择#][{费用模板编号} = @证券类型特殊费用模板编号# and {市场编号} = @市场编号# and {证券类型} = @证券类型# and {费用编号} = @费用编号#] */
        select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee,v_float_ratio,v_fee_choice from db_pub.tb_feesecu_stock_type_fee_tmplat_detail where fee_tmplat_no = v_secu_type_spec_fee_tmplat_no and exch_no = v_exch_no and stock_type = v_stock_type and fee_no = v_fee_no limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @计算结束标志# = 1; */
            set v_calc_end_flag = 1;
        end if;
    end if;

    /* if @证券代码费用模板编号# <> 0 and @计算结束标志# = 0 then */
    if v_secu_code_fee_tmplat_no <> 0 and v_calc_end_flag = 0 then

        /* [获取表记录变量语句][公共_证券费用_证券代码费用模板明细表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#,@浮动比例#,@费用选择#][{费用模板编号} = @证券代码费用模板编号# and {证券代码编号} = @证券代码编号# and {费用编号} = @费用编号#] */
        select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee,v_float_ratio,v_fee_choice from db_pub.tb_feesecu_stock_code_fee_tmplat_detail where fee_tmplat_no = v_secu_code_fee_tmplat_no and stock_code_no = v_stock_code_no and fee_no = v_fee_no limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @计算结束标志# = 1; */
            set v_calc_end_flag = 1;
        end if;
    end if;

    /* if @证券类型费用模板编号# <> 0 and @计算结束标志# = 0 then */
    if v_secu_type_fee_tmplat_no <> 0 and v_calc_end_flag = 0 then

        /* [获取表记录变量语句][公共_证券费用_证券类型费用模板明细表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#,@浮动比例#,@费用选择#][{费用模板编号} = @证券类型费用模板编号# and {市场编号} = @市场编号# and {证券类型} = @证券类型# and {费用编号} = @费用编号#] */
        select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee,v_float_ratio,v_fee_choice from db_pub.tb_feesecu_stock_type_fee_tmplat_detail where fee_tmplat_no = v_secu_type_fee_tmplat_no and exch_no = v_exch_no and stock_type = v_stock_type and fee_no = v_fee_no limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @计算结束标志# = 1; */
            set v_calc_end_flag = 1;
        end if;
    end if;

    /* if @计算结束标志# = 0 then */
    if v_calc_end_flag = 0 then

        /* [获取表记录变量语句][公共_证券费用_系统证券代码费用表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#][{证券代码编号} = @证券代码编号# and {费用编号} = @费用编号#] */
        select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee from db_pub.tb_feesecu_sys_stock_code_fee where stock_code_no = v_stock_code_no and fee_no = v_fee_no limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @浮动比例# = 1; */
            set v_float_ratio = 1;

            /* set @费用选择# = 《费用选择-固定》; */
            set v_fee_choice = 1;

            /* set @计算结束标志# = 1; */
            set v_calc_end_flag = 1;
        end if;
    end if;

    /* if @计算结束标志# = 0 then */
    if v_calc_end_flag = 0 then

        /* [获取表记录变量语句][公共_证券费用_系统证券类型费用表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#][{市场编号} = @市场编号# and {证券类型} = @证券类型# and {费用编号} = @费用编号#] */
        select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee from db_pub.tb_feesecu_sys_stock_type_fee where exch_no = v_exch_no and stock_type = v_stock_type and fee_no = v_fee_no limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @浮动比例# = 1; */
            set v_float_ratio = 1;

            /* set @费用选择# = 《费用选择-固定》; */
            set v_fee_choice = 1;

            /* set @计算结束标志# = 1; */
            set v_calc_end_flag = 1;
        end if;
    end if;
    #如果费用选择为浮动，则需要取外部费用设置

    /* if @费用选择# = 《费用选择-浮动》 then */
    if v_fee_choice = 2 then

        /* set @计算结束标志# = 0; */
        set v_calc_end_flag = 0;

        /* if @证券代码外部费用模板编号# <> 0 then */
        if v_secu_code_out_fee_tmplat_no <> 0 then

            /* [获取表记录变量语句][公共_证券费用_证券代码费用模板明细表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#][{费用模板编号} = @证券代码外部费用模板编号# and {证券代码编号} = @证券代码编号# and {费用编号} = @费用编号#] */
            select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee from db_pub.tb_feesecu_stock_code_fee_tmplat_detail where fee_tmplat_no = v_secu_code_out_fee_tmplat_no and stock_code_no = v_stock_code_no and fee_no = v_fee_no limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @计算结束标志# = 1; */
                set v_calc_end_flag = 1;
            end if;
        end if;

        /* if @证券类型外部费用模板编号# <> 0 and @计算结束标志# = 0 then */
        if v_secu_type_out_fee_tmplat_no <> 0 and v_calc_end_flag = 0 then

            /* [获取表记录变量语句][公共_证券费用_证券类型费用模板明细表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#][{费用模板编号} = @证券类型外部费用模板编号# and {市场编号} = @市场编号# and {证券类型} = @证券类型# and {费用编号} = @费用编号#] */
            select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee from db_pub.tb_feesecu_stock_type_fee_tmplat_detail where fee_tmplat_no = v_secu_type_out_fee_tmplat_no and exch_no = v_exch_no and stock_type = v_stock_type and fee_no = v_fee_no limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @计算结束标志# = 1; */
                set v_calc_end_flag = 1;
            end if;
        end if;

        /* if @计算结束标志# = 0 then */
        if v_calc_end_flag = 0 then

            /* [获取表记录变量语句][公共_证券费用_外部证券代码费用表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#][{通道编号} = @通道编号# and {证券代码编号} = @证券代码编号# and {费用编号} = @费用编号#] */
            select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee from db_pub.tb_feesecu_out_stock_code_fee where pass_no = v_pass_no and stock_code_no = v_stock_code_no and fee_no = v_fee_no limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @计算结束标志# = 1; */
                set v_calc_end_flag = 1;
            end if;
        end if;

        /* if @计算结束标志# = 0 then */
        if v_calc_end_flag = 0 then

            /* [获取表记录变量语句][公共_证券费用_外部证券类型费用表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#][{通道编号} = @通道编号# and {市场编号} = @市场编号# and {证券类型} = @证券类型# and {费用编号} = @费用编号#] */
            select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee from db_pub.tb_feesecu_out_stock_type_fee where pass_no = v_pass_no and exch_no = v_exch_no and stock_type = v_stock_type and fee_no = v_fee_no limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @计算结束标志# = 1; */
                set v_calc_end_flag = 1;
            end if;
        end if;

        /* set @金额比例# = @浮动比例# + @金额比例#; */
        set v_amt_ratio = v_float_ratio + v_amt_ratio;
    end if;

    /* if @金额固定额# >0  and @订单数量#>0 then */
    if v_amt_value >0  and v_order_qty>0 then

        /* set @金额固定额# = @金额固定额# * @费用数量#/@订单数量#; */
        set v_amt_value = v_amt_value * v_fee_qty/v_order_qty;
    end if;
    #最后计算值

    /* if (@市场编号#=《市场编号-沪港通证券交易所》 or @市场编号#=《市场编号-深港通证券交易所》) and @证券费用类型#=《证券费用类型-印花税》 then */
    if (v_exch_no=3 or v_exch_no=4) and v_secu_fee_type=1 then

        /* set @税费费用# = ceil(@金额比例# * @费用数量# * @费用价格# + @金额固定额#); */
        set v_tax_fee = ceil(v_amt_ratio * v_fee_qty * v_fee_price + v_amt_value);
    else

        /* set @税费费用# = @金额比例# * @费用数量# * @费用价格# + @金额固定额#; */
        set v_tax_fee = v_amt_ratio * v_fee_qty * v_fee_price + v_amt_value;
    end if;

    /* [检查正常赋值][@税费费用#<@最低费用#][@税费费用#][@最低费用#] */
    if v_tax_fee<v_min_fee then
        SET v_tax_fee=v_min_fee;
    end if;


    /* if @最高费用#<>0 then */
    if v_max_fee<>0 then

        /* [检查正常赋值][@税费费用#>@最高费用#][@税费费用#][@最高费用#] */
        if v_tax_fee>v_max_fee then
            SET v_tax_fee=v_max_fee;
        end if;

    end if;

    /* [检查正常赋值][@税费费用# is null][@税费费用#][0] */
    if v_tax_fee is null then
        SET v_tax_fee=0;
    end if;


    /* set @税费费用# = round(@税费费用#, 2); */
    set v_tax_fee = round(v_tax_fee, 2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_tax_fee = v_tax_fee;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_计算外部证券指定费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_CalcOutSecuSpecFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_CalcOutSecuSpecFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_fee_no int,
    IN p_fee_qty decimal(18,2),
    IN p_fee_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_tax_fee decimal(18,4)
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
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_fee_no int;
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tax_fee decimal(18,4);
    declare v_secu_code_out_fee_tmplat_no int;
    declare v_secu_type_out_fee_tmplat_no int;
    declare v_calc_end_flag int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
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
    SET v_pass_no = p_pass_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_fee_no = p_fee_no;
    SET v_fee_qty = p_fee_qty;
    SET v_fee_price = p_fee_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tax_fee = 0;
    SET v_secu_code_out_fee_tmplat_no = 0;
    SET v_secu_type_out_fee_tmplat_no = 0;
    SET v_calc_end_flag = 0;
    SET v_amt_ratio = 0;
    SET v_amt_value = 0;
    SET v_par_value_ratio = 0;
    SET v_par_value_value = 0;
    SET v_max_fee = 0;
    SET v_min_fee = 0;

    
    label_pro:BEGIN
    
    #先获取资产账户编号设置的费用模板，如果没有设置或者设置值为0，则取系统级

    /* [获取表记录变量语句][公共_证券费用_资产账户证券费用模板表][{证券代码外部费用模板编号}, {证券类型外部费用模板编号}][@证券代码外部费用模板编号#, @证券类型外部费用模板编号#][{资产账户编号} = @资产账户编号#] */
    select secu_code_out_fee_tmplat_no, secu_type_out_fee_tmplat_no into v_secu_code_out_fee_tmplat_no, v_secu_type_out_fee_tmplat_no from db_pub.tb_feesecu_asset_acco_fee_tmplat where asset_acco_no = v_asset_acco_no limit 1;

    if FOUND_ROWS() = 0 then

        /* set @证券代码外部费用模板编号# = 0; */
        set v_secu_code_out_fee_tmplat_no = 0;

        /* set @证券类型外部费用模板编号# = 0; */
        set v_secu_type_out_fee_tmplat_no = 0;
    end if;
    #置状态位计算结束标志

    /* set @计算结束标志# = 0; */
    set v_calc_end_flag = 0;

    /* if @证券代码外部费用模板编号# <> 0 then */
    if v_secu_code_out_fee_tmplat_no <> 0 then

        /* [获取表记录变量语句][公共_证券费用_证券代码费用模板明细表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#][{费用模板编号} = @证券代码外部费用模板编号# and {证券代码编号} = @证券代码编号# and {费用编号} = @费用编号#] */
        select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee from db_pub.tb_feesecu_stock_code_fee_tmplat_detail where fee_tmplat_no = v_secu_code_out_fee_tmplat_no and stock_code_no = v_stock_code_no and fee_no = v_fee_no limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @计算结束标志# = 1; */
            set v_calc_end_flag = 1;
        end if;
    end if;

    /* if @证券类型外部费用模板编号# <> 0 and @计算结束标志# = 0 then */
    if v_secu_type_out_fee_tmplat_no <> 0 and v_calc_end_flag = 0 then

        /* [获取表记录变量语句][公共_证券费用_证券类型费用模板明细表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#][{费用模板编号} = @证券类型外部费用模板编号# and {市场编号} = @市场编号# and {证券类型} = @证券类型# and {费用编号} = @费用编号#] */
        select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee from db_pub.tb_feesecu_stock_type_fee_tmplat_detail where fee_tmplat_no = v_secu_type_out_fee_tmplat_no and exch_no = v_exch_no and stock_type = v_stock_type and fee_no = v_fee_no limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @计算结束标志# = 1; */
            set v_calc_end_flag = 1;
        end if;
    end if;

    /* if @计算结束标志# = 0 then */
    if v_calc_end_flag = 0 then

        /* [获取表记录变量语句][公共_证券费用_外部证券代码费用表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#][{通道编号} = @通道编号# and {证券代码编号} = @证券代码编号# and {费用编号} = @费用编号#] */
        select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee from db_pub.tb_feesecu_out_stock_code_fee where pass_no = v_pass_no and stock_code_no = v_stock_code_no and fee_no = v_fee_no limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @计算结束标志# = 1; */
            set v_calc_end_flag = 1;
        end if;
    end if;

    /* if @计算结束标志# = 0 then */
    if v_calc_end_flag = 0 then

        /* [获取表记录变量语句][公共_证券费用_外部证券类型费用表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#][{通道编号} = @通道编号# and {市场编号} = @市场编号# and {证券类型} = @证券类型# and {费用编号} = @费用编号#] */
        select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee from db_pub.tb_feesecu_out_stock_type_fee where pass_no = v_pass_no and exch_no = v_exch_no and stock_type = v_stock_type and fee_no = v_fee_no limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @计算结束标志# = 1; */
            set v_calc_end_flag = 1;
        end if;
    end if;
    #最后计算值

    /* set @税费费用# = @金额比例# * @费用数量# * @费用价格# + @金额固定额#; */
    set v_tax_fee = v_amt_ratio * v_fee_qty * v_fee_price + v_amt_value;

    /* [检查正常赋值][@税费费用#<@最低费用#][@税费费用#][@最低费用#] */
    if v_tax_fee<v_min_fee then
        SET v_tax_fee=v_min_fee;
    end if;


    /* if @最高费用#<>0 then */
    if v_max_fee<>0 then

        /* [检查正常赋值][@税费费用#>@最高费用#][@税费费用#][@最高费用#] */
        if v_tax_fee>v_max_fee then
            SET v_tax_fee=v_max_fee;
        end if;

    end if;

    /* [检查正常赋值][@税费费用# is null][@税费费用#][0] */
    if v_tax_fee is null then
        SET v_tax_fee=0;
    end if;


    /* set @税费费用# = round(@税费费用#, 2); */
    set v_tax_fee = round(v_tax_fee, 2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_tax_fee = v_tax_fee;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_计算证券费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_CalcSecuFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_CalcSecuFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_fee_qty decimal(18,2),
    IN p_fee_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stamp_tax decimal(18,4),
    OUT p_trans_fee decimal(18,4),
    OUT p_brkage_fee decimal(18,4),
    OUT p_SEC_charges decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_trade_tax decimal(18,4),
    OUT p_trade_cost_fee decimal(18,4),
    OUT p_trade_system_use_fee decimal(18,4),
    OUT p_stock_settle_fee decimal(18,4)
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
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_contrc_dir int;
    declare v_secu_fee_type int;
    declare v_fee_no int;
    declare v_tax_fee decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_fee_qty = p_fee_qty;
    SET v_fee_price = p_fee_price;
    SET v_order_qty = p_order_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_contrc_dir = 0;
    SET v_secu_fee_type = 0;
    SET v_fee_no = 0;
    SET v_tax_fee = 0;

    
    label_pro:BEGIN
    

    /* set @开平方向# = 0; */
    set v_contrc_dir = 0;

    /* if @订单方向# =《订单方向-卖出》 and (@市场编号#=《市场编号-上海证券交易所》 or @市场编号#=《市场编号-深圳证券交易所》) then */
    if v_order_dir =2 and (v_exch_no=1 or v_exch_no=2) then

        /* set @证券费用类型#=《证券费用类型-印花税》; */
        set v_secu_fee_type=1;

        /* set @费用编号#=《证券费用类型-印花税》*10000+@订单方向#*100+@开平方向#; */
        set v_fee_no=1*10000+v_order_dir*100+v_contrc_dir;

        /* 调用【原子_公共_证券费用_计算证券指定费用】*/
        call db_pub.pra_feesecu_CalcSecuSpecFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_asset_acco_no,
            v_stock_code_no,
            v_exch_no,
            v_stock_type,
            v_secu_fee_type,
            v_fee_no,
            v_fee_qty,
            v_fee_price,
            v_order_qty,
            v_error_code,
            v_error_info,
            v_tax_fee);
        if v_error_code = "1" then
            SET v_error_code = "pubA.9.203.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券指定费用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @印花税# = @税费费用#; */
        set v_stamp_tax = v_tax_fee;

    /* elseif @市场编号#=《市场编号-沪港通证券交易所》 or @市场编号#=《市场编号-深港通证券交易所》 then */
    elseif v_exch_no=3 or v_exch_no=4 then

        /* set @证券费用类型#=《证券费用类型-印花税》; */
        set v_secu_fee_type=1;

        /* set @费用编号#=《证券费用类型-印花税》*10000+@订单方向#*100+@开平方向#; */
        set v_fee_no=1*10000+v_order_dir*100+v_contrc_dir;

        /* 调用【原子_公共_证券费用_计算证券指定费用】*/
        call db_pub.pra_feesecu_CalcSecuSpecFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_asset_acco_no,
            v_stock_code_no,
            v_exch_no,
            v_stock_type,
            v_secu_fee_type,
            v_fee_no,
            v_fee_qty,
            v_fee_price,
            v_order_qty,
            v_error_code,
            v_error_info,
            v_tax_fee);
        if v_error_code = "1" then
            SET v_error_code = "pubA.9.203.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券指定费用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @印花税# = @税费费用#; */
        set v_stamp_tax = v_tax_fee;
    else

        /* set @印花税# = 0.0; */
        set v_stamp_tax = 0.0;
    end if;

    /* if @市场编号#=《市场编号-上海证券交易所》 or @市场编号#=《市场编号-深圳证券交易所》 then */
    if v_exch_no=1 or v_exch_no=2 then

        /* set @证券费用类型#=《证券费用类型-过户费》; */
        set v_secu_fee_type=2;

        /* set @费用编号#=《证券费用类型-过户费》*10000+@订单方向#*100+@开平方向#; */
        set v_fee_no=2*10000+v_order_dir*100+v_contrc_dir;

        /* 调用【原子_公共_证券费用_计算证券指定费用】*/
        call db_pub.pra_feesecu_CalcSecuSpecFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_asset_acco_no,
            v_stock_code_no,
            v_exch_no,
            v_stock_type,
            v_secu_fee_type,
            v_fee_no,
            v_fee_qty,
            v_fee_price,
            v_order_qty,
            v_error_code,
            v_error_info,
            v_tax_fee);
        if v_error_code = "1" then
            SET v_error_code = "pubA.9.203.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券指定费用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @过户费#=@税费费用#; */
        set v_trans_fee=v_tax_fee;

        /* set @证券费用类型#=《证券费用类型-经手费》; */
        set v_secu_fee_type=3;

        /* set @费用编号#=《证券费用类型-经手费》*10000+@订单方向#*100+@开平方向#; */
        set v_fee_no=3*10000+v_order_dir*100+v_contrc_dir;

       /* 调用【原子_公共_证券费用_计算证券指定费用】*/
       call db_pub.pra_feesecu_CalcSecuSpecFee(
           v_opor_co_no,
           v_opor_no,
           v_oper_mac,
           v_oper_ip_addr,
           v_oper_info,
           v_oper_way,
           v_func_code,
           v_pass_no,
           v_asset_acco_no,
           v_stock_code_no,
           v_exch_no,
           v_stock_type,
           v_secu_fee_type,
           v_fee_no,
           v_fee_qty,
           v_fee_price,
           v_order_qty,
           v_error_code,
           v_error_info,
           v_tax_fee);
       if v_error_code = "1" then
           SET v_error_code = "pubA.9.203.999";
           if v_mysql_message <> "" then
                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券指定费用出现错误！',v_mysql_message);
           end if;
           leave label_pro;
       elseif v_error_code <> "0" then
           leave label_pro;
       end if;


       /* set @经手费#=@税费费用#; */
       set v_brkage_fee=v_tax_fee;

        /* set @证券费用类型#=《证券费用类型-证管费》; */
        set v_secu_fee_type=4;

        /* set @费用编号#=《证券费用类型-证管费》*10000+@订单方向#*100+@开平方向#; */
        set v_fee_no=4*10000+v_order_dir*100+v_contrc_dir;

        /* 调用【原子_公共_证券费用_计算证券指定费用】*/
        call db_pub.pra_feesecu_CalcSecuSpecFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_asset_acco_no,
            v_stock_code_no,
            v_exch_no,
            v_stock_type,
            v_secu_fee_type,
            v_fee_no,
            v_fee_qty,
            v_fee_price,
            v_order_qty,
            v_error_code,
            v_error_info,
            v_tax_fee);
        if v_error_code = "1" then
            SET v_error_code = "pubA.9.203.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券指定费用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @证管费#=@税费费用#; */
        set v_SEC_charges=v_tax_fee;
    end if;

    /* if @市场编号#=《市场编号-沪港通证券交易所》 or @市场编号#=《市场编号-深港通证券交易所》 then */
    if v_exch_no=3 or v_exch_no=4 then

        /* set @证券费用类型#=《证券费用类型-交易征费》; */
        set v_secu_fee_type=10;

        /* set @费用编号#=《证券费用类型-交易征费》*10000+@订单方向#*100+@开平方向#; */
        set v_fee_no=10*10000+v_order_dir*100+v_contrc_dir;

        /* 调用【原子_公共_证券费用_计算证券指定费用】*/
        call db_pub.pra_feesecu_CalcSecuSpecFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_asset_acco_no,
            v_stock_code_no,
            v_exch_no,
            v_stock_type,
            v_secu_fee_type,
            v_fee_no,
            v_fee_qty,
            v_fee_price,
            v_order_qty,
            v_error_code,
            v_error_info,
            v_tax_fee);
        if v_error_code = "1" then
            SET v_error_code = "pubA.9.203.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券指定费用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @交易征费#=@税费费用#; */
        set v_trade_tax=v_tax_fee;

        /* set @证券费用类型#=《证券费用类型-交易费》; */
        set v_secu_fee_type=11;

        /* set @费用编号#=《证券费用类型-交易费》*10000+@订单方向#*100+@开平方向#; */
        set v_fee_no=11*10000+v_order_dir*100+v_contrc_dir;

        /* 调用【原子_公共_证券费用_计算证券指定费用】*/
        call db_pub.pra_feesecu_CalcSecuSpecFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_asset_acco_no,
            v_stock_code_no,
            v_exch_no,
            v_stock_type,
            v_secu_fee_type,
            v_fee_no,
            v_fee_qty,
            v_fee_price,
            v_order_qty,
            v_error_code,
            v_error_info,
            v_tax_fee);
        if v_error_code = "1" then
            SET v_error_code = "pubA.9.203.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券指定费用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @交易费#=@税费费用#; */
        set v_trade_cost_fee=v_tax_fee;

        /* set @证券费用类型#=《证券费用类型-交易系统使用费》; */
        set v_secu_fee_type=12;

        /* set @费用编号#=《证券费用类型-交易系统使用费》*10000+@订单方向#*100+@开平方向#; */
        set v_fee_no=12*10000+v_order_dir*100+v_contrc_dir;

        /* 调用【原子_公共_证券费用_计算证券指定费用】*/
        call db_pub.pra_feesecu_CalcSecuSpecFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_asset_acco_no,
            v_stock_code_no,
            v_exch_no,
            v_stock_type,
            v_secu_fee_type,
            v_fee_no,
            v_fee_qty,
            v_fee_price,
            v_order_qty,
            v_error_code,
            v_error_info,
            v_tax_fee);
        if v_error_code = "1" then
            SET v_error_code = "pubA.9.203.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券指定费用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @交易系统使用费#=@税费费用#; */
        set v_trade_system_use_fee=v_tax_fee;

        /* set @证券费用类型#=《证券费用类型-股份交收费》; */
        set v_secu_fee_type=13;

        /* set @费用编号#=《证券费用类型-股份交收费》*10000+@订单方向#*100+@开平方向#; */
        set v_fee_no=13*10000+v_order_dir*100+v_contrc_dir;

        /* 调用【原子_公共_证券费用_计算证券指定费用】*/
        call db_pub.pra_feesecu_CalcSecuSpecFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_asset_acco_no,
            v_stock_code_no,
            v_exch_no,
            v_stock_type,
            v_secu_fee_type,
            v_fee_no,
            v_fee_qty,
            v_fee_price,
            v_order_qty,
            v_error_code,
            v_error_info,
            v_tax_fee);
        if v_error_code = "1" then
            SET v_error_code = "pubA.9.203.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券指定费用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @股份交收费#=@税费费用#; */
        set v_stock_settle_fee=v_tax_fee;
    end if;

    /* set @证券费用类型#=《证券费用类型-其他费用》; */
    set v_secu_fee_type=5;

    /* set @费用编号#=《证券费用类型-其他费用》*10000+@订单方向#*100+@开平方向#; */
    set v_fee_no=5*10000+v_order_dir*100+v_contrc_dir;

    /* 调用【原子_公共_证券费用_计算证券指定费用】*/
    call db_pub.pra_feesecu_CalcSecuSpecFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_stock_code_no,
        v_exch_no,
        v_stock_type,
        v_secu_fee_type,
        v_fee_no,
        v_fee_qty,
        v_fee_price,
        v_order_qty,
        v_error_code,
        v_error_info,
        v_tax_fee);
    if v_error_code = "1" then
        SET v_error_code = "pubA.9.203.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券指定费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @其他费用#=@税费费用#; */
    set v_other_fee=v_tax_fee;

    /* set @证券费用类型#=《证券费用类型-交易佣金》; */
    set v_secu_fee_type=7;

    /* set @费用编号#=《证券费用类型-交易佣金》*10000+@订单方向#*100+@开平方向#; */
    set v_fee_no=7*10000+v_order_dir*100+v_contrc_dir;

    /* 调用【原子_公共_证券费用_计算证券指定费用】*/
    call db_pub.pra_feesecu_CalcSecuSpecFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_stock_code_no,
        v_exch_no,
        v_stock_type,
        v_secu_fee_type,
        v_fee_no,
        v_fee_qty,
        v_fee_price,
        v_order_qty,
        v_error_code,
        v_error_info,
        v_tax_fee);
    if v_error_code = "1" then
        SET v_error_code = "pubA.9.203.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券指定费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @交易佣金#=@税费费用#; */
    set v_trade_commis=v_tax_fee;

    /* set @证券费用类型#=《证券费用类型-其他佣金》; */
    set v_secu_fee_type=9;

    /* set @费用编号#=《证券费用类型-其他佣金》*10000+@订单方向#*100+@开平方向#; */
    set v_fee_no=9*10000+v_order_dir*100+v_contrc_dir;

    /* 调用【原子_公共_证券费用_计算证券指定费用】*/
    call db_pub.pra_feesecu_CalcSecuSpecFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_stock_code_no,
        v_exch_no,
        v_stock_type,
        v_secu_fee_type,
        v_fee_no,
        v_fee_qty,
        v_fee_price,
        v_order_qty,
        v_error_code,
        v_error_info,
        v_tax_fee);
    if v_error_code = "1" then
        SET v_error_code = "pubA.9.203.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券指定费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @其他佣金#=@税费费用#; */
    set v_other_commis=v_tax_fee;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stamp_tax = v_stamp_tax;
    SET p_trans_fee = v_trans_fee;
    SET p_brkage_fee = v_brkage_fee;
    SET p_SEC_charges = v_SEC_charges;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_trade_tax = v_trade_tax;
    SET p_trade_cost_fee = v_trade_cost_fee;
    SET p_trade_system_use_fee = v_trade_system_use_fee;
    SET p_stock_settle_fee = v_stock_settle_fee;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_计算外部证券费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_CalcOutSecuFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_CalcOutSecuFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_fee_qty decimal(18,2),
    IN p_fee_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_out_stamp_tax decimal(18,4),
    OUT p_out_trans_fee decimal(18,4),
    OUT p_out_brkage decimal(18,4),
    OUT p_out_SEC_charges decimal(18,4),
    OUT p_out_other_fee decimal(18,4),
    OUT p_out_brkage_commis decimal(18,4),
    OUT p_out_other_commis decimal(18,4)
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
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_out_stamp_tax decimal(18,4);
    declare v_out_trans_fee decimal(18,4);
    declare v_out_brkage decimal(18,4);
    declare v_out_SEC_charges decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_contrc_dir int;
    declare v_secu_fee_type int;
    declare v_fee_no int;
    declare v_tax_fee decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_fee_qty = p_fee_qty;
    SET v_fee_price = p_fee_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_out_stamp_tax = 0;
    SET v_out_trans_fee = 0;
    SET v_out_brkage = 0;
    SET v_out_SEC_charges = 0;
    SET v_out_other_fee = 0;
    SET v_out_brkage_commis = 0;
    SET v_out_other_commis = 0;
    SET v_contrc_dir = 0;
    SET v_secu_fee_type = 0;
    SET v_fee_no = 0;
    SET v_tax_fee = 0;

    
    label_pro:BEGIN
    

    /* set @开平方向# = 0; */
    set v_contrc_dir = 0;

    /* if @订单方向#=《订单方向-卖出》 then */
    if v_order_dir=2 then

        /* set @证券费用类型#=《证券费用类型-印花税》; */
        set v_secu_fee_type=1;

        /* set @费用编号#=《证券费用类型-印花税》*10000+@订单方向#*100; */
        set v_fee_no=1*10000+v_order_dir*100;

        /* 调用【原子_公共_证券费用_计算外部证券指定费用】*/
        call db_pub.pra_feesecu_CalcOutSecuSpecFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_asset_acco_no,
            v_stock_code_no,
            v_exch_no,
            v_stock_type,
            v_fee_no,
            v_fee_qty,
            v_fee_price,
            v_error_code,
            v_error_info,
            v_tax_fee);
        if v_error_code = "1" then
            SET v_error_code = "pubA.9.204.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算外部证券指定费用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @外部印花税# = @税费费用#; */
        set v_out_stamp_tax = v_tax_fee;
    else

        /* set @外部印花税# = 0.0; */
        set v_out_stamp_tax = 0.0;
    end if;

    /* set @证券费用类型#=《证券费用类型-过户费》; */
    set v_secu_fee_type=2;

    /* set @费用编号#=《证券费用类型-过户费》*10000+@订单方向#*100; */
    set v_fee_no=2*10000+v_order_dir*100;

    /* 调用【原子_公共_证券费用_计算外部证券指定费用】*/
    call db_pub.pra_feesecu_CalcOutSecuSpecFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_stock_code_no,
        v_exch_no,
        v_stock_type,
        v_fee_no,
        v_fee_qty,
        v_fee_price,
        v_error_code,
        v_error_info,
        v_tax_fee);
    if v_error_code = "1" then
        SET v_error_code = "pubA.9.204.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算外部证券指定费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @外部过户费#=@税费费用#; */
    set v_out_trans_fee=v_tax_fee;

    /* set @证券费用类型#=《证券费用类型-经手费》; */
    set v_secu_fee_type=3;

    /* set @费用编号#=《证券费用类型-经手费》*10000+@订单方向#*100; */
    set v_fee_no=3*10000+v_order_dir*100;

    /* 调用【原子_公共_证券费用_计算外部证券指定费用】*/
    call db_pub.pra_feesecu_CalcOutSecuSpecFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_stock_code_no,
        v_exch_no,
        v_stock_type,
        v_fee_no,
        v_fee_qty,
        v_fee_price,
        v_error_code,
        v_error_info,
        v_tax_fee);
    if v_error_code = "1" then
        SET v_error_code = "pubA.9.204.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算外部证券指定费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @外部经手费#=@税费费用#; */
    set v_out_brkage=v_tax_fee;

    /* set @证券费用类型#=《证券费用类型-证管费》; */
    set v_secu_fee_type=4;

    /* set @费用编号#=《证券费用类型-证管费》*10000+@订单方向#*100; */
    set v_fee_no=4*10000+v_order_dir*100;

    /* 调用【原子_公共_证券费用_计算外部证券指定费用】*/
    call db_pub.pra_feesecu_CalcOutSecuSpecFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_stock_code_no,
        v_exch_no,
        v_stock_type,
        v_fee_no,
        v_fee_qty,
        v_fee_price,
        v_error_code,
        v_error_info,
        v_tax_fee);
    if v_error_code = "1" then
        SET v_error_code = "pubA.9.204.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算外部证券指定费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @外部证管费#=@税费费用#; */
    set v_out_SEC_charges=v_tax_fee;

    /* set @证券费用类型#=《证券费用类型-其他费用》; */
    set v_secu_fee_type=5;

    /* set @费用编号#=《证券费用类型-其他费用》*10000+@订单方向#*100; */
    set v_fee_no=5*10000+v_order_dir*100;

    /* 调用【原子_公共_证券费用_计算外部证券指定费用】*/
    call db_pub.pra_feesecu_CalcOutSecuSpecFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_stock_code_no,
        v_exch_no,
        v_stock_type,
        v_fee_no,
        v_fee_qty,
        v_fee_price,
        v_error_code,
        v_error_info,
        v_tax_fee);
    if v_error_code = "1" then
        SET v_error_code = "pubA.9.204.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算外部证券指定费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @外部其他费用#=@税费费用#; */
    set v_out_other_fee=v_tax_fee;

    /* set @证券费用类型#=《证券费用类型-交易佣金》; */
    set v_secu_fee_type=7;

    /* set @费用编号#=《证券费用类型-交易佣金》*10000+@订单方向#*100; */
    set v_fee_no=7*10000+v_order_dir*100;

    /* 调用【原子_公共_证券费用_计算外部证券指定费用】*/
    call db_pub.pra_feesecu_CalcOutSecuSpecFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_stock_code_no,
        v_exch_no,
        v_stock_type,
        v_fee_no,
        v_fee_qty,
        v_fee_price,
        v_error_code,
        v_error_info,
        v_tax_fee);
    if v_error_code = "1" then
        SET v_error_code = "pubA.9.204.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算外部证券指定费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @外部交易佣金#=@税费费用#; */
    set v_out_brkage_commis=v_tax_fee;

    /* set @证券费用类型#=《证券费用类型-其他佣金》; */
    set v_secu_fee_type=9;

    /* set @费用编号#=《证券费用类型-其他佣金》*10000+@订单方向#*100; */
    set v_fee_no=9*10000+v_order_dir*100;

    /* 调用【原子_公共_证券费用_计算外部证券指定费用】*/
    call db_pub.pra_feesecu_CalcOutSecuSpecFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_stock_code_no,
        v_exch_no,
        v_stock_type,
        v_fee_no,
        v_fee_qty,
        v_fee_price,
        v_error_code,
        v_error_info,
        v_tax_fee);
    if v_error_code = "1" then
        SET v_error_code = "pubA.9.204.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算外部证券指定费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @外部其他佣金#=@税费费用#; */
    set v_out_other_commis=v_tax_fee;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_out_stamp_tax = v_out_stamp_tax;
    SET p_out_trans_fee = v_out_trans_fee;
    SET p_out_brkage = v_out_brkage;
    SET p_out_SEC_charges = v_out_SEC_charges;
    SET p_out_other_fee = v_out_other_fee;
    SET p_out_brkage_commis = v_out_brkage_commis;
    SET p_out_other_commis = v_out_other_commis;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用_模板编号删除证券费用明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feesecu_DeleteSecuFeeTmplatDetailByFeeNo;;
DELIMITER ;;
CREATE PROCEDURE pra_feesecu_DeleteSecuFeeTmplatDetailByFeeNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_fee_tmplat_no int,
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
    declare v_co_no int;
    declare v_fee_tmplat_no int;
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
    declare v_fee_tmplat_name varchar(64);
    declare v_fee_tmplat_kind int;
    declare v_remark_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_fee_tmplat_no = p_fee_tmplat_no;
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
    SET v_fee_tmplat_name = " ";
    SET v_fee_tmplat_kind = 0;
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券费用_证券费用模板表][字段][字段变量][{费用模板编号}=@费用模板编号# and {机构编号}=@机构编号#][4][@费用模板编号#,@机构编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, fee_tmplat_no, 
        co_no, fee_tmplat_name, fee_tmplat_kind, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_fee_tmplat_no, 
        v_co_no, v_fee_tmplat_name, v_fee_tmplat_kind, v_remark_info from db_pub.tb_feesecu_secu_fee_tmplat where fee_tmplat_no=v_fee_tmplat_no and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.9.205.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,",","机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,",","机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* if @费用模板类别# = 《费用模板类别-类型》 then */
    if v_fee_tmplat_kind = 1 then

        /* [删除表记录][公共_证券费用_证券类型费用模板明细表][{费用模板编号}=@费用模板编号# and {机构编号}=@机构编号#][3][@机构编号#,@费用模板编号#,@费用模板类别#] */
        delete from db_pub.tb_feesecu_stock_type_fee_tmplat_detail 
            where fee_tmplat_no=v_fee_tmplat_no and co_no=v_co_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.9.205.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind);
            end if;
            leave label_pro;
        end if;

    else

        /* [删除表记录][公共_证券费用_证券代码费用模板明细表][{费用模板编号}=@费用模板编号# and {机构编号}=@机构编号#][3][@机构编号#,@费用模板编号#,@费用模板类别#] */
        delete from db_pub.tb_feesecu_stock_code_fee_tmplat_detail 
            where fee_tmplat_no=v_fee_tmplat_no and co_no=v_co_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.9.205.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


