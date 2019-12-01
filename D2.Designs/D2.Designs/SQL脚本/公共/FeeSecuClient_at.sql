DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_新增证券费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_AddSecuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_AddSecuFeeTmplat(
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
                
        SET v_error_code = "pubA.23.11.1";
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
                
        SET v_error_code = "pubA.23.11.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_修改证券费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_ModiSecuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_ModiSecuFeeTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_fee_tmplat_no int,
    IN p_fee_tmplat_name varchar(64),
    IN p_co_no int,
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
    declare v_fee_tmplat_name varchar(64);
    declare v_co_no int;
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
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_fee_tmplat_name = p_fee_tmplat_name;
    SET v_co_no = p_co_no;
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
    

    /* [更新表记录][公共_证券费用_证券费用模板表][{备注信息}=@备注信息#,{费用模板名称}=@费用模板名称#][{费用模板编号}=@费用模板编号# and {机构编号}=@机构编号#][2][@费用模板编号#,@机构编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_feesecu_secu_fee_tmplat set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, remark_info=v_remark_info,fee_tmplat_name=v_fee_tmplat_name where fee_tmplat_no=v_fee_tmplat_no and co_no=v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.23.12.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,",","机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,",","机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券费用_证券费用模板表][{费用模板名称},{费用模板类别}][@费用模板名称#,@费用模板类别#][{费用模板编号}=@费用模板编号# and {机构编号}=@机构编号#][4][@费用模板编号#,@机构编号#] */
    select fee_tmplat_name,fee_tmplat_kind into v_fee_tmplat_name,v_fee_tmplat_kind from db_pub.tb_feesecu_secu_fee_tmplat where fee_tmplat_no=v_fee_tmplat_no and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.23.12.4";
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
                
        SET v_error_code = "pubA.23.12.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_删除证券费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_DeleteSecuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_DeleteSecuFeeTmplat(
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
    declare v_co_no int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
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
    SET v_co_no = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_fee_tmplat_name = " ";
    SET v_fee_tmplat_kind = 0;
    SET v_remark_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* [获取表记录变量][公共_证券费用_证券费用模板表][字段][字段变量][{费用模板编号}=@费用模板编号# and {机构编号}=@操作员机构编号#][4][@费用模板编号#,@操作员机构编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, fee_tmplat_no, 
        co_no, fee_tmplat_name, fee_tmplat_kind, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_fee_tmplat_no, 
        v_co_no, v_fee_tmplat_name, v_fee_tmplat_kind, v_remark_info from db_pub.tb_feesecu_secu_fee_tmplat where fee_tmplat_no=v_fee_tmplat_no and co_no=v_opor_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.23.13.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,",","操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,",","操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_证券费用模板表][{费用模板编号}=@费用模板编号# and {机构编号}=@操作员机构编号#][3][@费用模板编号#,@操作员机构编号#] */
    delete from db_pub.tb_feesecu_secu_fee_tmplat 
        where fee_tmplat_no=v_fee_tmplat_no and co_no=v_opor_co_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.23.13.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,",","操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,",","操作员机构编号=",v_opor_co_no);
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
                
        SET v_error_code = "pubA.23.13.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* if @费用模板类别# = 《费用模板类别-类型》 then */
    if v_fee_tmplat_kind = 1 then

        /* [删除表记录][公共_证券费用_证券类型费用模板明细表][{费用模板编号}=@费用模板编号#][3][@费用模板编号#,@费用模板类别#] */
        delete from db_pub.tb_feesecu_stock_type_fee_tmplat_detail 
            where fee_tmplat_no=v_fee_tmplat_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.23.13.3";
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
                    
            SET v_error_code = "pubA.23.13.2";
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
                    
            SET v_error_code = "pubA.23.13.3";
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
                    
            SET v_error_code = "pubA.23.13.2";
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

# 原子_公共_证券费用客户端_查询证券费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QuerySecuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QuerySecuFeeTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fee_tmplat_no int,
    IN p_fee_tmplat_kind int,
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
    declare v_fee_tmplat_no int;
    declare v_fee_tmplat_kind int;
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
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_fee_tmplat_kind = p_fee_tmplat_kind;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_证券费用模板表][字段][(@费用模板编号# = 0 or {费用模板编号} = @费用模板编号#) and (@费用模板类别#=0 or {费用模板类别}=@费用模板类别#) and {机构编号} = @机构编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, fee_tmplat_no, 
        co_no, fee_tmplat_name, fee_tmplat_kind, remark_info from db_pub.tb_feesecu_secu_fee_tmplat where (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and (v_fee_tmplat_kind=0 or fee_tmplat_kind=v_fee_tmplat_kind) and co_no = v_co_no and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, fee_tmplat_no, 
        co_no, fee_tmplat_name, fee_tmplat_kind, remark_info from db_pub.tb_feesecu_secu_fee_tmplat where (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and (v_fee_tmplat_kind=0 or fee_tmplat_kind=v_fee_tmplat_kind) and co_no = v_co_no and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_查询证券费用模板流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QuerySecuFeeTmplatJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QuerySecuFeeTmplatJour(
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
    

    /* [获取表记录][公共_证券费用_证券费用模板流水表][字段][{初始化日期}<=@初始化日期# and (@费用模板编号# = 0 or {费用模板编号} = @费用模板编号#) and {机构编号} = @机构编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        fee_tmplat_no, co_no, fee_tmplat_name, fee_tmplat_kind, 
        remark_info, oper_remark_info from db_pub.tb_feesecu_secu_fee_tmplat_jour where init_date<=v_init_date and (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and co_no = v_co_no and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        fee_tmplat_no, co_no, fee_tmplat_name, fee_tmplat_kind, 
        remark_info, oper_remark_info from db_pub.tb_feesecu_secu_fee_tmplat_jour where init_date<=v_init_date and (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and co_no = v_co_no and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_查询历史证券费用模板流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QuerySecuFeeTmplatJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QuerySecuFeeTmplatJour_His(
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
    

    /* [获取表记录][历史_公共_证券费用_证券费用模板流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@费用模板编号# = 0 or {费用模板编号} = @费用模板编号#) and {机构编号} = @机构编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        fee_tmplat_no, co_no, fee_tmplat_name, fee_tmplat_kind, 
        remark_info, oper_remark_info from db_pub_his.tb_feesecu_secu_fee_tmplat_jour_his where (init_date between v_begin_date and v_end_date) and (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and co_no = v_co_no and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        fee_tmplat_no, co_no, fee_tmplat_name, fee_tmplat_kind, 
        remark_info, oper_remark_info from db_pub_his.tb_feesecu_secu_fee_tmplat_jour_his where (init_date between v_begin_date and v_end_date) and (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and co_no = v_co_no and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_复制证券费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_CopySecuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_CopySecuFeeTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_source_fee_tmplat_no int,
    IN p_fee_tmplat_no int,
    IN p_fee_tmplat_name varchar(64),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_fee_tmplat_kind int
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
    declare v_source_fee_tmplat_no int;
    declare v_fee_tmplat_no int;
    declare v_fee_tmplat_name varchar(64);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_fee_tmplat_kind int;
    declare v_remark_info varchar(255);
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
    SET v_co_no = p_co_no;
    SET v_source_fee_tmplat_no = p_source_fee_tmplat_no;
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_fee_tmplat_name = p_fee_tmplat_name;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_fee_tmplat_kind = 0;
    SET v_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券费用_证券费用模板表][{费用模板类别},{备注信息}][@费用模板类别#,@备注信息#][{机构编号}=@机构编号# and {费用模板编号}=@源费用模板编号#][4][@机构编号#,@源费用模板编号#] */
    select fee_tmplat_kind,remark_info into v_fee_tmplat_kind,v_remark_info from db_pub.tb_feesecu_secu_fee_tmplat where co_no=v_co_no and fee_tmplat_no=v_source_fee_tmplat_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.23.17.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","源费用模板编号=",v_source_fee_tmplat_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","源费用模板编号=",v_source_fee_tmplat_no);
        end if;
        leave label_pro;
    end if;


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
                
        SET v_error_code = "pubA.23.17.1";
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
                
        SET v_error_code = "pubA.23.17.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_fee_tmplat_kind = v_fee_tmplat_kind;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_复制证券费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_CopySecuFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_CopySecuFeeTmplatDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_source_fee_tmplat_no int,
    IN p_fee_tmplat_no int,
    IN p_fee_tmplat_kind int,
    IN p_fee_tmplat_name varchar(64),
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
    declare v_source_fee_tmplat_no int;
    declare v_fee_tmplat_no int;
    declare v_fee_tmplat_kind int;
    declare v_fee_tmplat_name varchar(64);
    declare v_menu_no int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_source_fee_tmplat_no = p_source_fee_tmplat_no;
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_fee_tmplat_kind = p_fee_tmplat_kind;
    SET v_fee_tmplat_name = p_fee_tmplat_name;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @更新次数# = 1; */
    set v_update_times = 1;

    /* if @费用模板类别# = 《费用模板类别-类型》 then */
    if v_fee_tmplat_kind = 1 then

        /* [读取插入表记录][公共_证券费用_证券类型费用模板明细表][公共_证券费用_证券类型费用模板明细表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{费用模板编号},{机构编号},{市场编号},{证券类型},{费用编号},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择},{备注信息}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@费用模板编号#,{机构编号},{市场编号},{证券类型},{费用编号},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择},{备注信息}][{机构编号}=@机构编号# and {费用模板编号}=@源费用模板编号#][1][@机构编号#,@源费用模板编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_feesecu_stock_type_fee_tmplat_detail (
            create_date,create_time,update_date,update_time,update_times,fee_tmplat_no,co_no,exch_no,stock_type,fee_no,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice,remark_info) 
            select 
            v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_fee_tmplat_no,co_no,exch_no,stock_type,fee_no,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice,remark_info 
            from db_pub.tb_feesecu_stock_type_fee_tmplat_detail 
            where co_no=v_co_no and fee_tmplat_no=v_source_fee_tmplat_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.23.18.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","源费用模板编号=",v_source_fee_tmplat_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","源费用模板编号=",v_source_fee_tmplat_no);
            end if;
            leave label_pro;
        end if;


    /* elseif @费用模板类别# = 《费用模板类别-代码》 then */
    elseif v_fee_tmplat_kind = 2 then

        /* [读取插入表记录][公共_证券费用_证券代码费用模板明细表][公共_证券费用_证券代码费用模板明细表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{费用模板编号},{机构编号},{市场编号},{证券代码编号},{费用编号},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择},{备注信息}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@费用模板编号#,{机构编号},{市场编号},{证券代码编号},{费用编号},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择},{备注信息}][{机构编号}=@机构编号# and {费用模板编号}=@源费用模板编号#][1][@机构编号#,@源费用模板编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_feesecu_stock_code_fee_tmplat_detail (
            create_date,create_time,update_date,update_time,update_times,fee_tmplat_no,co_no,exch_no,stock_code_no,fee_no,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice,remark_info) 
            select 
            v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_fee_tmplat_no,co_no,exch_no,stock_code_no,fee_no,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice,remark_info 
            from db_pub.tb_feesecu_stock_code_fee_tmplat_detail 
            where co_no=v_co_no and fee_tmplat_no=v_source_fee_tmplat_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.23.18.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","源费用模板编号=",v_source_fee_tmplat_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","源费用模板编号=",v_source_fee_tmplat_no);
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

# 原子_公共_证券费用客户端_新增证券类型费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_AddStockTypeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_AddStockTypeFeeTmplatDetail(
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

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* [获取表记录变量][公共_证券费用_证券费用模板表][{费用模板类别}][@费用模板类别#][{费用模板编号} = @费用模板编号# and {机构编号}=@机构编号#][4][@费用模板编号#,@机构编号#] */
    select fee_tmplat_kind into v_fee_tmplat_kind from db_pub.tb_feesecu_secu_fee_tmplat where fee_tmplat_no = v_fee_tmplat_no and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.23.21.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,",","机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,",","机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@费用模板类别# <> 《费用模板类别-类型》][80][@费用模板编号#, @费用模板类别#] */
    if v_fee_tmplat_kind <> 1 then
        
        SET v_error_code = "pubA.23.21.80";
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
                
        SET v_error_code = "pubA.23.21.1";
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
                
        SET v_error_code = "pubA.23.21.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_修改证券类型费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_ModiStockTypeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_ModiStockTypeFeeTmplatDetail(
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
    declare v_co_no int;
    declare v_row_id bigint;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_co_no = 0;
    SET v_row_id = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
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


    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* [获取表记录变量][公共_证券费用_证券类型费用模板明细表][{记录序号}][@记录序号#][{费用模板编号}=@费用模板编号# and {市场编号}=@市场编号# and {证券类型}=@证券类型# and {费用编号}=@费用编号# and {机构编号}=@机构编号#][4][@费用模板编号#, @市场编号#, @证券类型#, @费用编号#, @机构编号#] */
    select row_id into v_row_id from db_pub.tb_feesecu_stock_type_fee_tmplat_detail where fee_tmplat_no=v_fee_tmplat_no and exch_no=v_exch_no and stock_type=v_stock_type and fee_no=v_fee_no and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.23.22.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no,","," 机构编号=", v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no,","," 机构编号=", v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_证券费用_证券类型费用模板明细表][{金额比例}=@金额比例#,{金额固定额}=@金额固定额#,{面值比例}=@面值比例#,{面值固定额}=@面值固定额#,{最高费用}=@最高费用#,{最低费用}=@最低费用#,{备注信息}=@备注信息#][{费用模板编号}=@费用模板编号# and {市场编号}=@市场编号# and {证券类型}=@证券类型# and {费用编号}=@费用编号#][2][@费用模板编号#, @市场编号#, @证券类型#, @费用编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_feesecu_stock_type_fee_tmplat_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, amt_ratio=v_amt_ratio,amt_value=v_amt_value,par_value_ratio=v_par_value_ratio,par_value_value=v_par_value_value,max_fee=v_max_fee,min_fee=v_min_fee,remark_info=v_remark_info where fee_tmplat_no=v_fee_tmplat_no and exch_no=v_exch_no and stock_type=v_stock_type and fee_no=v_fee_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.23.22.2";
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
                
        SET v_error_code = "pubA.23.22.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_删除证券类型费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_DeleteStockTypeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_DeleteStockTypeFeeTmplatDetail(
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
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_fee_no = p_fee_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_co_no = 0;
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

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* [获取表记录变量][公共_证券费用_证券类型费用模板明细表][{记录序号}][@记录序号#][{费用模板编号}=@费用模板编号# and {市场编号}=@市场编号# and {证券类型}=@证券类型# and {费用编号}=@费用编号# and {机构编号}=@机构编号#][4][@费用模板编号#, @市场编号#, @证券类型#, @费用编号#, @机构编号#] */
    select row_id into v_row_id from db_pub.tb_feesecu_stock_type_fee_tmplat_detail where fee_tmplat_no=v_fee_tmplat_no and exch_no=v_exch_no and stock_type=v_stock_type and fee_no=v_fee_no and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.23.23.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no,","," 机构编号=", v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no,","," 机构编号=", v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_证券类型费用模板明细表][{费用模板编号}=@费用模板编号# and {市场编号}=@市场编号# and {证券类型}=@证券类型# and {费用编号}=@费用编号#][3][@费用模板编号#, @市场编号#, @证券类型#, @费用编号#] */
    delete from db_pub.tb_feesecu_stock_type_fee_tmplat_detail 
        where fee_tmplat_no=v_fee_tmplat_no and exch_no=v_exch_no and stock_type=v_stock_type and fee_no=v_fee_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.23.23.3";
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
                
        SET v_error_code = "pubA.23.23.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 证券类型=", v_stock_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_查询证券类型费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QueryStockTypeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QueryStockTypeFeeTmplatDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_fee_tmplat_no_str varchar(2048),
    IN p_secu_fee_type int,
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
    declare v_fee_tmplat_no_str varchar(2048);
    declare v_secu_fee_type int;
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
    SET v_fee_tmplat_no_str = p_fee_tmplat_no_str;
    SET v_secu_fee_type = p_secu_fee_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_证券类型费用模板明细表][{记录序号},{市场编号},{证券类型},{机构编号},{费用编号},{费用模板编号},{费用编号} div 10000 as {证券费用类型},{费用编号} % 10000 div 100 as {订单方向},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{备注信息}][{机构编号}=@操作员机构编号# and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and (@证券费用类型#=0 or ({费用编号} div 10000 = @证券费用类型#)) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,exch_no,stock_type,co_no,fee_no,fee_tmplat_no,fee_no div 10000 as secu_fee_type,fee_no % 10000 div 100 as order_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,remark_info from db_pub.tb_feesecu_stock_type_fee_tmplat_detail where co_no=v_opor_co_no and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_secu_fee_type=0 or (fee_no div 10000 = v_secu_fee_type)) and row_id > v_row_id order by row_id;
    else
        select row_id,exch_no,stock_type,co_no,fee_no,fee_tmplat_no,fee_no div 10000 as secu_fee_type,fee_no % 10000 div 100 as order_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,remark_info from db_pub.tb_feesecu_stock_type_fee_tmplat_detail where co_no=v_opor_co_no and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_secu_fee_type=0 or (fee_no div 10000 = v_secu_fee_type)) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_查询证券类型费用模板明细流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QueryStockTypeFeeTmplatDetailJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QueryStockTypeFeeTmplatDetailJour(
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
    SET v_init_date = p_init_date;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_fee_tmplat_no_str = p_fee_tmplat_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_证券类型费用模板明细流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@操作员机构编号# and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_type, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_stock_type_fee_tmplat_detail_jour where init_date<=v_init_date and co_no=v_opor_co_no and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_type, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_stock_type_fee_tmplat_detail_jour where init_date<=v_init_date and co_no=v_opor_co_no and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_查询历史证券类型费用模板明细流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QueryStockTypeFeeTmplatDetailJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QueryStockTypeFeeTmplatDetailJour_His(
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
    

    /* [获取表记录][历史_公共_证券费用_证券类型费用模板明细流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@操作员机构编号# and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_type, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_stock_type_fee_tmplat_detail_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_opor_co_no and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_type, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_stock_type_fee_tmplat_detail_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_opor_co_no and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_新增证券代码费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_AddStockCodeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_AddStockCodeFeeTmplatDetail(
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

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* [获取表记录变量][公共_证券费用_证券费用模板表][{费用模板类别}][@费用模板类别#][{费用模板编号} = @费用模板编号# and {机构编号}=@机构编号#][4][@费用模板编号#,@机构编号#] */
    select fee_tmplat_kind into v_fee_tmplat_kind from db_pub.tb_feesecu_secu_fee_tmplat where fee_tmplat_no = v_fee_tmplat_no and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.23.31.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,",","机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,",","机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@费用模板类别# <> 《费用模板类别-代码》][80][@费用模板编号#, @费用模板类别#] */
    if v_fee_tmplat_kind <> 2 then
        
        SET v_error_code = "pubA.23.31.80";
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
                
        SET v_error_code = "pubA.23.31.1";
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
                
        SET v_error_code = "pubA.23.31.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_修改证券代码费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_ModiStockCodeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_ModiStockCodeFeeTmplatDetail(
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
    declare v_co_no int;
    declare v_row_id bigint;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_co_no = 0;
    SET v_row_id = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
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


    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* [获取表记录变量][公共_证券费用_证券代码费用模板明细表][{记录序号}][@记录序号#][{费用模板编号}=@费用模板编号# and {证券代码编号}=@证券代码编号# and {费用编号}=@费用编号# and {机构编号}=@机构编号#][4][@费用模板编号#, @证券代码编号#, @费用编号#, @机构编号#] */
    select row_id into v_row_id from db_pub.tb_feesecu_stock_code_fee_tmplat_detail where fee_tmplat_no=v_fee_tmplat_no and stock_code_no=v_stock_code_no and fee_no=v_fee_no and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.23.32.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no,","," 机构编号=", v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no,","," 机构编号=", v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_证券费用_证券代码费用模板明细表][{金额比例}=@金额比例#,{金额固定额}=@金额固定额#,{面值比例}=@面值比例#,{面值固定额}=@面值固定额#,{最高费用}=@最高费用#,{最低费用}=@最低费用#,{备注信息}=@备注信息#][{费用模板编号}=@费用模板编号# and {证券代码编号}=@证券代码编号# and {费用编号}=@费用编号#][2][@费用模板编号#, @证券代码编号#, @费用编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_feesecu_stock_code_fee_tmplat_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, amt_ratio=v_amt_ratio,amt_value=v_amt_value,par_value_ratio=v_par_value_ratio,par_value_value=v_par_value_value,max_fee=v_max_fee,min_fee=v_min_fee,remark_info=v_remark_info where fee_tmplat_no=v_fee_tmplat_no and stock_code_no=v_stock_code_no and fee_no=v_fee_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.23.32.2";
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
                
        SET v_error_code = "pubA.23.32.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_删除证券代码费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_DeleteStockCodeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_DeleteStockCodeFeeTmplatDetail(
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

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* [获取表记录变量][公共_证券费用_证券代码费用模板明细表][{记录序号}][@记录序号#][{费用模板编号}=@费用模板编号# and {证券代码编号}=@证券代码编号# and {费用编号}=@费用编号# and {机构编号}=@机构编号#][4][@费用模板编号#, @证券代码编号#, @费用编号#, @机构编号#] */
    select row_id into v_row_id from db_pub.tb_feesecu_stock_code_fee_tmplat_detail where fee_tmplat_no=v_fee_tmplat_no and stock_code_no=v_stock_code_no and fee_no=v_fee_no and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.23.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no,","," 机构编号=", v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no,","," 机构编号=", v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_证券代码费用模板明细表][{费用模板编号}=@费用模板编号# and {证券代码编号}=@证券代码编号# and {费用编号}=@费用编号#][3][@费用模板编号#, @证券代码编号#, @费用编号#] */
    delete from db_pub.tb_feesecu_stock_code_fee_tmplat_detail 
        where fee_tmplat_no=v_fee_tmplat_no and stock_code_no=v_stock_code_no and fee_no=v_fee_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.23.33.3";
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
                
        SET v_error_code = "pubA.23.33.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 证券代码编号=", v_stock_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_查询证券代码费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QueryStockCodeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QueryStockCodeFeeTmplatDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_fee_tmplat_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no_str varchar(4096),
    IN p_secu_fee_type int,
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
    declare v_fee_tmplat_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no_str varchar(4096);
    declare v_secu_fee_type int;
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
    SET v_fee_tmplat_no_str = p_fee_tmplat_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_secu_fee_type = p_secu_fee_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_证券代码费用模板明细表][{记录序号},{费用模板编号},{机构编号},{市场编号},{证券代码编号},{费用编号},{费用编号} div 10000 as {证券费用类型},{费用编号} % 10000 div 100 as {订单方向},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{备注信息}][{机构编号}=@操作员机构编号# and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and (@证券费用类型#=0 or ({费用编号} div 10000 = @证券费用类型#)) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,fee_tmplat_no,co_no,exch_no,stock_code_no,fee_no,fee_no div 10000 as secu_fee_type,fee_no % 10000 div 100 as order_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,remark_info from db_pub.tb_feesecu_stock_code_fee_tmplat_detail where co_no=v_opor_co_no and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_secu_fee_type=0 or (fee_no div 10000 = v_secu_fee_type)) and row_id > v_row_id order by row_id;
    else
        select row_id,fee_tmplat_no,co_no,exch_no,stock_code_no,fee_no,fee_no div 10000 as secu_fee_type,fee_no % 10000 div 100 as order_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,remark_info from db_pub.tb_feesecu_stock_code_fee_tmplat_detail where co_no=v_opor_co_no and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_secu_fee_type=0 or (fee_no div 10000 = v_secu_fee_type)) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_查询证券代码费用模板明细流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QueryStockCodeFeeTmplatDetailJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QueryStockCodeFeeTmplatDetailJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_init_date = p_init_date;
    SET v_fee_tmplat_no_str = p_fee_tmplat_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_证券代码费用模板明细流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@操作员机构编号# and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码编号# = 0 or {证券代码编号}  = @证券代码编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_code_no, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_stock_code_fee_tmplat_detail_jour where init_date<=v_init_date and co_no=v_opor_co_no and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no  = v_stock_code_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_code_no, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_feesecu_stock_code_fee_tmplat_detail_jour where init_date<=v_init_date and co_no=v_opor_co_no and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no  = v_stock_code_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_查询历史证券代码费用模板明细流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QueryStockCodeFeeTmplatDetailJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QueryStockCodeFeeTmplatDetailJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    

    /* [获取表记录][历史_公共_证券费用_证券代码费用模板明细流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@操作员机构编号# and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码编号# = 0 or {证券代码编号}  = @证券代码编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_code_no, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_stock_code_fee_tmplat_detail_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_opor_co_no and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no  = v_stock_code_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, exch_no, stock_code_no, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_feesecu_stock_code_fee_tmplat_detail_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_opor_co_no and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no = 0 or stock_code_no  = v_stock_code_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_新增资产账户证券费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_AddAsacSecuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_AddAsacSecuFeeTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_asset_acco_no int,
    IN p_secu_code_fee_tmplat_no int,
    IN p_secu_type_fee_tmplat_no int,
    IN p_secu_code_out_fee_tmplat_no int,
    IN p_secu_type_out_fee_tmplat_no int,
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
    declare v_asset_acco_no int;
    declare v_secu_code_fee_tmplat_no int;
    declare v_secu_type_fee_tmplat_no int;
    declare v_secu_code_out_fee_tmplat_no int;
    declare v_secu_type_out_fee_tmplat_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_co_no int;
    declare v_secu_code_spec_fee_tmplat_no int;
    declare v_secu_type_spec_fee_tmplat_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_secu_code_fee_tmplat_no = p_secu_code_fee_tmplat_no;
    SET v_secu_type_fee_tmplat_no = p_secu_type_fee_tmplat_no;
    SET v_secu_code_out_fee_tmplat_no = p_secu_code_out_fee_tmplat_no;
    SET v_secu_type_out_fee_tmplat_no = p_secu_type_out_fee_tmplat_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_co_no = 0;
    SET v_secu_code_spec_fee_tmplat_no = 0;
    SET v_secu_type_spec_fee_tmplat_no = 0;
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
    set v_jour_occur_field = concat("初始化日期", "|", "资产账户编号", "|", "证券代码费用模板编号", "|", "证券类型费用模板编号", "|", "证券代码外部费用模板编号", "|", "证券类型外部费用模板编号", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_asset_acco_no, "|", v_secu_code_fee_tmplat_no, "|", v_secu_type_fee_tmplat_no, "|", v_secu_code_out_fee_tmplat_no, "|", v_secu_type_out_fee_tmplat_no, "|", v_menu_no, "|");


    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* set @证券代码特殊费用模板编号# = 0; */
    set v_secu_code_spec_fee_tmplat_no = 0;

    /* set @证券类型特殊费用模板编号# = 0; */
    set v_secu_type_spec_fee_tmplat_no = 0;

    /* [插入重复更新][公共_证券费用_资产账户证券费用模板表][字段][字段变量][{证券代码费用模板编号}=@证券代码费用模板编号#,{证券类型费用模板编号}=@证券类型费用模板编号#][1][@资产账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_asset_acco_fee_tmplat (
        create_date, create_time, update_date, 
        update_time, update_times, asset_acco_no, co_no, 
        secu_code_spec_fee_tmplat_no, secu_type_spec_fee_tmplat_no, secu_code_fee_tmplat_no, secu_type_fee_tmplat_no, 
        secu_code_out_fee_tmplat_no, secu_type_out_fee_tmplat_no) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_asset_acco_no, v_co_no, 
        v_secu_code_spec_fee_tmplat_no, v_secu_type_spec_fee_tmplat_no, v_secu_code_fee_tmplat_no, v_secu_type_fee_tmplat_no, 
        v_secu_code_out_fee_tmplat_no, v_secu_type_out_fee_tmplat_no) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, secu_code_fee_tmplat_no=v_secu_code_fee_tmplat_no,secu_type_fee_tmplat_no=v_secu_type_fee_tmplat_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.23.71.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_asset_acco_no, "|", v_secu_code_fee_tmplat_no, "|", v_secu_type_fee_tmplat_no, "|", v_secu_code_out_fee_tmplat_no, "|", v_secu_type_out_fee_tmplat_no, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增资产账户证券费用模板"; */
    set v_oper_remark_info = "新增资产账户证券费用模板";

    /* [插入表记录][公共_证券费用_资产账户证券费用模板流水表][字段][字段变量][5][@资产账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_asset_acco_fee_tmplat_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, asset_acco_no, 
        co_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_asset_acco_no, 
        v_co_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.23.71.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_修改资产账户证券费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_ModiAsacSecuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_ModiAsacSecuFeeTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_asset_acco_no int,
    IN p_secu_code_fee_tmplat_no int,
    IN p_secu_type_fee_tmplat_no int,
    IN p_secu_code_out_fee_tmplat_no int,
    IN p_secu_type_out_fee_tmplat_no int,
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
    declare v_asset_acco_no int;
    declare v_secu_code_fee_tmplat_no int;
    declare v_secu_type_fee_tmplat_no int;
    declare v_secu_code_out_fee_tmplat_no int;
    declare v_secu_type_out_fee_tmplat_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_co_no int;
    declare v_row_id bigint;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_secu_code_fee_tmplat_no = p_secu_code_fee_tmplat_no;
    SET v_secu_type_fee_tmplat_no = p_secu_type_fee_tmplat_no;
    SET v_secu_code_out_fee_tmplat_no = p_secu_code_out_fee_tmplat_no;
    SET v_secu_type_out_fee_tmplat_no = p_secu_type_out_fee_tmplat_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_co_no = 0;
    SET v_row_id = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "资产账户编号", "|", "证券代码费用模板编号", "|", "证券类型费用模板编号", "|", "证券代码外部费用模板编号", "|", "证券类型外部费用模板编号", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_asset_acco_no, "|", v_secu_code_fee_tmplat_no, "|", v_secu_type_fee_tmplat_no, "|", v_secu_code_out_fee_tmplat_no, "|", v_secu_type_out_fee_tmplat_no, "|", v_menu_no, "|");


    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* [获取表记录变量][公共_证券费用_资产账户证券费用模板表][{记录序号}][@记录序号#][{资产账户编号}=@资产账户编号# and {机构编号}=@机构编号#][4][@资产账户编号#, @机构编号#] */
    select row_id into v_row_id from db_pub.tb_feesecu_asset_acco_fee_tmplat where asset_acco_no=v_asset_acco_no and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.23.72.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 机构编号=", v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 机构编号=", v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_证券费用_资产账户证券费用模板表][{证券代码费用模板编号}=@证券代码费用模板编号#,{证券类型费用模板编号}=@证券类型费用模板编号#,{证券代码外部费用模板编号}=@证券代码外部费用模板编号#,{证券类型外部费用模板编号}=@证券类型外部费用模板编号#][{资产账户编号}=@资产账户编号#][2][@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_feesecu_asset_acco_fee_tmplat set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, secu_code_fee_tmplat_no=v_secu_code_fee_tmplat_no,secu_type_fee_tmplat_no=v_secu_type_fee_tmplat_no,secu_code_out_fee_tmplat_no=v_secu_code_out_fee_tmplat_no,secu_type_out_fee_tmplat_no=v_secu_type_out_fee_tmplat_no where asset_acco_no=v_asset_acco_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.23.72.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_asset_acco_no, "|", v_secu_code_fee_tmplat_no, "|", v_secu_type_fee_tmplat_no, "|", v_secu_code_out_fee_tmplat_no, "|", v_secu_type_out_fee_tmplat_no, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改资产账户证券费用模板"; */
    set v_oper_remark_info = "修改资产账户证券费用模板";

    /* [插入表记录][公共_证券费用_资产账户证券费用模板流水表][字段][字段变量][5][@资产账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_asset_acco_fee_tmplat_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, asset_acco_no, 
        co_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_asset_acco_no, 
        v_co_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.23.72.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_删除资产账户证券费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_DeleteAsacSecuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_DeleteAsacSecuFeeTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_asset_acco_no int,
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
    declare v_asset_acco_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_row_id bigint;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_row_id = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";

    
    label_pro:BEGIN
    

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* [获取表记录变量][公共_证券费用_资产账户证券费用模板表][{记录序号}][@记录序号#][{资产账户编号}=@资产账户编号# and {机构编号}=@机构编号#][4][@资产账户编号#, @机构编号#] */
    select row_id into v_row_id from db_pub.tb_feesecu_asset_acco_fee_tmplat where asset_acco_no=v_asset_acco_no and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.23.73.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 机构编号=", v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 机构编号=", v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_证券费用_资产账户证券费用模板表][{资产账户编号}=@资产账户编号#][3][@资产账户编号#] */
    delete from db_pub.tb_feesecu_asset_acco_fee_tmplat 
        where asset_acco_no=v_asset_acco_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.23.73.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_证券费用_资产账户证券费用模板流水表][字段][字段变量][5][@资产账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_feesecu_asset_acco_fee_tmplat_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, asset_acco_no, 
        co_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_asset_acco_no, 
        v_co_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.23.73.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_查询资产账户证券费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QueryAsacSecuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QueryAsacSecuFeeTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_secu_code_fee_tmplat_str varchar(2048),
    IN p_secu_type_fee_tmplat_str varchar(2048),
    IN p_secu_code_out_fee_tmplat_str varchar(2048),
    IN p_secu_type_out_fee_tmplat_str varchar(2048),
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
    declare v_asset_acco_no int;
    declare v_secu_code_fee_tmplat_str varchar(2048);
    declare v_secu_type_fee_tmplat_str varchar(2048);
    declare v_secu_code_out_fee_tmplat_str varchar(2048);
    declare v_secu_type_out_fee_tmplat_str varchar(2048);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_secu_code_fee_tmplat_str = p_secu_code_fee_tmplat_str;
    SET v_secu_type_fee_tmplat_str = p_secu_type_fee_tmplat_str;
    SET v_secu_code_out_fee_tmplat_str = p_secu_code_out_fee_tmplat_str;
    SET v_secu_type_out_fee_tmplat_str = p_secu_type_out_fee_tmplat_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_资产账户证券费用模板表][字段][(@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and {机构编号} = @操作员机构编号# and (@证券代码费用模板串# = "; ;" or instr(@证券代码费用模板串#, concat(";", {证券代码费用模板编号}, ";")) > 0) and (@证券类型费用模板串# = "; ;" or instr(@证券类型费用模板串#, concat(";", {证券类型费用模板编号}, ";")) > 0) and (@证券代码外部费用模板串# = "; ;" or instr(@证券代码外部费用模板串#, concat(";", {证券代码外部费用模板编号}, ";")) > 0) and (@证券类型外部费用模板串# = "; ;" or instr(@证券类型外部费用模板串#, concat(";", {证券类型外部费用模板编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, asset_acco_no, 
        co_no, secu_code_spec_fee_tmplat_no, secu_type_spec_fee_tmplat_no, secu_code_fee_tmplat_no, 
        secu_type_fee_tmplat_no, secu_code_out_fee_tmplat_no, secu_type_out_fee_tmplat_no from db_pub.tb_feesecu_asset_acco_fee_tmplat where (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and co_no = v_opor_co_no and (v_secu_code_fee_tmplat_str = "; ;" or instr(v_secu_code_fee_tmplat_str, concat(";", secu_code_fee_tmplat_no, ";")) > 0) and (v_secu_type_fee_tmplat_str = "; ;" or instr(v_secu_type_fee_tmplat_str, concat(";", secu_type_fee_tmplat_no, ";")) > 0) and (v_secu_code_out_fee_tmplat_str = "; ;" or instr(v_secu_code_out_fee_tmplat_str, concat(";", secu_code_out_fee_tmplat_no, ";")) > 0) and (v_secu_type_out_fee_tmplat_str = "; ;" or instr(v_secu_type_out_fee_tmplat_str, concat(";", secu_type_out_fee_tmplat_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, asset_acco_no, 
        co_no, secu_code_spec_fee_tmplat_no, secu_type_spec_fee_tmplat_no, secu_code_fee_tmplat_no, 
        secu_type_fee_tmplat_no, secu_code_out_fee_tmplat_no, secu_type_out_fee_tmplat_no from db_pub.tb_feesecu_asset_acco_fee_tmplat where (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and co_no = v_opor_co_no and (v_secu_code_fee_tmplat_str = "; ;" or instr(v_secu_code_fee_tmplat_str, concat(";", secu_code_fee_tmplat_no, ";")) > 0) and (v_secu_type_fee_tmplat_str = "; ;" or instr(v_secu_type_fee_tmplat_str, concat(";", secu_type_fee_tmplat_no, ";")) > 0) and (v_secu_code_out_fee_tmplat_str = "; ;" or instr(v_secu_code_out_fee_tmplat_str, concat(";", secu_code_out_fee_tmplat_no, ";")) > 0) and (v_secu_type_out_fee_tmplat_str = "; ;" or instr(v_secu_type_out_fee_tmplat_str, concat(";", secu_type_out_fee_tmplat_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_查询资产账户证券费用模板流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QueryAsacSecuFeeTmplatJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QueryAsacSecuFeeTmplatJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_asset_acco_no int,
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
    declare v_asset_acco_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_资产账户证券费用模板流水表][字段][{初始化日期} <= @初始化日期# and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and {机构编号} = @操作员机构编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        asset_acco_no, co_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub.tb_feesecu_asset_acco_fee_tmplat_jour where init_date <= v_init_date and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and co_no = v_opor_co_no and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        asset_acco_no, co_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub.tb_feesecu_asset_acco_fee_tmplat_jour where init_date <= v_init_date and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and co_no = v_opor_co_no and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_查询历史资产账户证券费用模板流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QueryAsacSecuFeeTmplatJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QueryAsacSecuFeeTmplatJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_asset_acco_no int,
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
    declare v_asset_acco_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_证券费用_资产账户证券费用模板流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and {机构编号} = @操作员机构编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        asset_acco_no, co_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub_his.tb_feesecu_asset_acco_fee_tmplat_jour_his where (init_date between v_begin_date and v_end_date) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and co_no = v_opor_co_no and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        asset_acco_no, co_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub_his.tb_feesecu_asset_acco_fee_tmplat_jour_his where (init_date between v_begin_date and v_end_date) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and co_no = v_opor_co_no and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_查询系统证券类型费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QuerySysStockTypeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QuerySysStockTypeFee(
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
    

    /* [获取表记录][公共_证券费用_系统证券类型费用表][{记录序号},{市场编号},{证券类型},{费用编号},{费用编号} div 10000 as {证券费用类型},{费用编号} % 10000 div 100 as {订单方向},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][(@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and (@费用编号串# = "; ;" or instr(@费用编号串#, concat(";", {费用编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,exch_no,stock_type,fee_no,fee_no div 10000 as secu_fee_type,fee_no % 10000 div 100 as order_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee from db_pub.tb_feesecu_sys_stock_type_fee where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id,exch_no,stock_type,fee_no,fee_no div 10000 as secu_fee_type,fee_no % 10000 div 100 as order_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee from db_pub.tb_feesecu_sys_stock_type_fee where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_查询系统证券代码费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QuerySysStockCodeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QuerySysStockCodeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no_str varchar(4096),
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
    declare v_stock_code_no_str varchar(4096);
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
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_fee_no_str = p_fee_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_证券费用_系统证券代码费用表][{记录序号},{市场编号},{证券代码编号},{费用编号},{费用编号} div 10000 as {证券费用类型},{费用编号} % 10000 div 100 as {订单方向},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][(@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and (@费用编号串# = "; ;" or instr(@费用编号串#, concat(";", {费用编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,exch_no,stock_code_no,fee_no,fee_no div 10000 as secu_fee_type,fee_no % 10000 div 100 as order_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee from db_pub.tb_feesecu_sys_stock_code_fee where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id,exch_no,stock_code_no,fee_no,fee_no div 10000 as secu_fee_type,fee_no % 10000 div 100 as order_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee from db_pub.tb_feesecu_sys_stock_code_fee where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_新增产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_AddProdFare;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_AddProdFare(
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
                
        SET v_error_code = "pubA.23.161.1";
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
                
        SET v_error_code = "pubA.23.161.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,","," 产品费用类型=", v_pd_fee_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_修改产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_ModiProdFare;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_ModiProdFare(
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
                
        SET v_error_code = "pubA.23.162.2";
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
                
        SET v_error_code = "pubA.23.162.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,","," 产品费用类型=", v_pd_fee_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_删除产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_DeleteProdFare;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_DeleteProdFare(
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
                
        SET v_error_code = "pubA.23.163.4";
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
                
        SET v_error_code = "pubA.23.163.3";
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
                
        SET v_error_code = "pubA.23.163.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,","," 产品费用类型=", v_pd_fee_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_证券费用客户端_查询产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QueryProdFare;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QueryProdFare(
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

# 原子_公共_证券费用客户端_查询产品费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QueryProdFareJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QueryProdFareJour(
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

# 原子_公共_证券费用客户端_查询历史产品费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QueryProdFareJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QueryProdFareJour_His(
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

# 原子_公共_证券费用客户端_查询费用编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_QueryFeeNo;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_QueryFeeNo(
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

# 原子_公共_证券费用客户端_模板编号删除证券费用明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feeseclient_DeleteSecuFeeTmplatDetailByFeeNo;;
DELIMITER ;;
CREATE PROCEDURE pra_feeseclient_DeleteSecuFeeTmplatDetailByFeeNo(
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
    declare v_co_no int;
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
    SET v_fee_tmplat_no = p_fee_tmplat_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
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
    

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* [获取表记录变量][公共_证券费用_证券费用模板表][字段][字段变量][{费用模板编号}=@费用模板编号# and {机构编号}=@操作员机构编号#][4][@费用模板编号#,@操作员机构编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, fee_tmplat_no, 
        co_no, fee_tmplat_name, fee_tmplat_kind, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_fee_tmplat_no, 
        v_co_no, v_fee_tmplat_name, v_fee_tmplat_kind, v_remark_info from db_pub.tb_feesecu_secu_fee_tmplat where fee_tmplat_no=v_fee_tmplat_no and co_no=v_opor_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.23.167.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,",","操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,",","操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;

    #[删除表记录][公共_证券费用_证券费用模板表][{费用模板编号}=@费用模板编号# and {机构编号}=@操作员机构编号#][3][@费用模板编号#,@操作员机构编号#]
    #set @操作菜单# = @菜单编号#;
    #set @操作功能# = @功能编码#;
    #[插入表记录][公共_证券费用_证券费用模板流水表][字段][字段变量][5][@费用模板编号#]

    /* if @费用模板类别# = 《费用模板类别-类型》 then */
    if v_fee_tmplat_kind = 1 then

        /* [删除表记录][公共_证券费用_证券类型费用模板明细表][{费用模板编号}=@费用模板编号#][3][@费用模板编号#,@费用模板类别#] */
        delete from db_pub.tb_feesecu_stock_type_fee_tmplat_detail 
            where fee_tmplat_no=v_fee_tmplat_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.23.167.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind),"#",v_mysql_message);
            else
                SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind);
            end if;
            leave label_pro;
        end if;

       # [更新表记录][公共_证券费用_资产账户证券费用模板表][{证券类型费用模板编号}=0][{机构编号}=@机构编号#][2][@机构编号#,@费用模板类别#]
    else

        /* [删除表记录][公共_证券费用_证券代码费用模板明细表][{费用模板编号}=@费用模板编号#][3][@费用模板编号#,@费用模板类别#] */
        delete from db_pub.tb_feesecu_stock_code_fee_tmplat_detail 
            where fee_tmplat_no=v_fee_tmplat_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.23.167.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind),"#",v_mysql_message);
            else
                SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind);
            end if;
            leave label_pro;
        end if;

        #[更新表记录][公共_证券费用_资产账户证券费用模板表][{证券代码费用模板编号}=0][{机构编号}=@机构编号#][2][@机构编号#,@费用模板类别#]
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


