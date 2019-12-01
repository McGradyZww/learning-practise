DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_新增期货费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_AddFutuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_AddFutuFeeTmplat(
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
    

    /* [插入表记录][公共_期货费用_期货费用模板表][字段][字段变量][1][@机构编号#, @费用模板名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_futu_fee_tmplat(
        create_date, create_time, update_date, 
        update_time, update_times, fee_tmplat_no, co_no, 
        fee_tmplat_name, fee_tmplat_kind, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_fee_tmplat_no, v_co_no, 
        v_fee_tmplat_name, v_fee_tmplat_kind, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.41.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,","," 费用模板名称=", v_fee_tmplat_name),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增期货费用模板"; */
    set v_oper_remark_info = "新增期货费用模板";

    /* [插入表记录][公共_期货费用_期货费用模板流水表][字段][字段变量][5][@费用模板编号#, @机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_futu_fee_tmplat_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        fee_tmplat_no, fee_tmplat_name, fee_tmplat_kind, remark_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_fee_tmplat_no, v_fee_tmplat_name, v_fee_tmplat_kind, v_remark_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.41.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 机构编号=", v_co_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_修改期货费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_ModiFutuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_ModiFutuFeeTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_fee_tmplat_no int,
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
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_co_no int;
    declare v_fee_tmplat_name varchar(64);
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
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_co_no = 0;
    SET v_fee_tmplat_name = " ";
    SET v_fee_tmplat_kind = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_期货费用_期货费用模板表][{备注信息}=@备注信息#][{费用模板编号}=@费用模板编号#][2][@费用模板编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_fee_futu_fee_tmplat set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, remark_info=v_remark_info where fee_tmplat_no=v_fee_tmplat_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.42.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_期货费用_期货费用模板表][{机构编号},{费用模板名称},{费用模板类别}][@机构编号#,@费用模板名称#,@费用模板类别#][{费用模板编号}=@费用模板编号#][4][@费用模板编号#] */
    select co_no,fee_tmplat_name,fee_tmplat_kind into v_co_no,v_fee_tmplat_name,v_fee_tmplat_kind from db_pub.tb_fee_futu_fee_tmplat where fee_tmplat_no=v_fee_tmplat_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.18.42.4";
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

    /* set @操作备注# = "修改期货费用模板"; */
    set v_oper_remark_info = "修改期货费用模板";

    /* [插入表记录][公共_期货费用_期货费用模板流水表][字段][字段变量][5][@费用模板编号#, @机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_futu_fee_tmplat_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        fee_tmplat_no, fee_tmplat_name, fee_tmplat_kind, remark_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_fee_tmplat_no, v_fee_tmplat_name, v_fee_tmplat_kind, v_remark_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.42.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 机构编号=", v_co_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_删除期货费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_DeleteFutuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_DeleteFutuFeeTmplat(
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
    

    /* [获取表记录变量][公共_期货费用_期货费用模板表][字段][字段变量][{费用模板编号}=@费用模板编号#][4][@费用模板编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, fee_tmplat_no, 
        co_no, fee_tmplat_name, fee_tmplat_kind, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_fee_tmplat_no, 
        v_co_no, v_fee_tmplat_name, v_fee_tmplat_kind, v_remark_info from db_pub.tb_fee_futu_fee_tmplat where fee_tmplat_no=v_fee_tmplat_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.18.43.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_期货费用_期货费用模板表][{费用模板编号}=@费用模板编号#][3][@费用模板编号#] */
    delete from db_pub.tb_fee_futu_fee_tmplat 
        where fee_tmplat_no=v_fee_tmplat_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.18.43.3";
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

    /* set @操作备注# = "删除期货费用模板"; */
    set v_oper_remark_info = "删除期货费用模板";

    /* [插入表记录][公共_期货费用_期货费用模板流水表][字段][字段变量][5][@费用模板编号#, @机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_futu_fee_tmplat_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        fee_tmplat_no, fee_tmplat_name, fee_tmplat_kind, remark_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_fee_tmplat_no, v_fee_tmplat_name, v_fee_tmplat_kind, v_remark_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.43.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 机构编号=", v_co_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* if @费用模板类别# = 《费用模板类别-类型》 then */
    if v_fee_tmplat_kind = 1 then

        /* [删除表记录][公共_期货费用_合约类型费用模板明细表][{费用模板编号}=@费用模板编号#][3][@费用模板编号#,@费用模板类别#] */
        delete from db_pub.tb_fee_contrc_type_fee_tmplat_detail 
            where fee_tmplat_no=v_fee_tmplat_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.18.43.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind),"#",v_mysql_message);
            else
                SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind);
            end if;
            leave label_pro;
        end if;


        /* [更新表记录][公共_期货费用_资产账户期货费用模板表][{期货类型费用模板编号}=0][{机构编号}=@机构编号#][2][@机构编号#,@费用模板类别#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pub.tb_fee_asset_acco_futu_fee_tmplat set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, futu_type_fee_tmplat_no=0 where co_no=v_co_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.18.43.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","费用模板类别=",v_fee_tmplat_kind),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","费用模板类别=",v_fee_tmplat_kind);
            end if;
            leave label_pro;
        end if;

    else

        /* [删除表记录][公共_期货费用_合约代码费用模板明细表][{费用模板编号}=@费用模板编号#][3][@费用模板编号#,@费用模板类别#] */
        delete from db_pub.tb_fee_contrc_code_fee_tmplat_detail 
            where fee_tmplat_no=v_fee_tmplat_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.18.43.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind),"#",v_mysql_message);
            else
                SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind);
            end if;
            leave label_pro;
        end if;


        /* [更新表记录][公共_期货费用_资产账户期货费用模板表][{期货代码费用模板编号}=0][{机构编号}=@机构编号#][2][@机构编号#,@费用模板类别#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pub.tb_fee_asset_acco_futu_fee_tmplat set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, futu_code_fee_tmplat_no=0 where co_no=v_co_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.18.43.2";
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

# 原子_公共_期货费用客户端_查询期货费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_QueryFutuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_QueryFutuFeeTmplat(
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
    

    /* [获取表记录][公共_期货费用_期货费用模板表][字段][(@费用模板编号# = 0 or {费用模板编号} = @费用模板编号#) and (@费用模板类别# = 0 or {费用模板类别} = @费用模板类别#) and (@机构编号# = 0 or {机构编号} = @机构编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, fee_tmplat_no, 
        co_no, fee_tmplat_name, fee_tmplat_kind, remark_info from db_pub.tb_fee_futu_fee_tmplat where (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and (v_fee_tmplat_kind = 0 or fee_tmplat_kind = v_fee_tmplat_kind) and (v_co_no = 0 or co_no = v_co_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, fee_tmplat_no, 
        co_no, fee_tmplat_name, fee_tmplat_kind, remark_info from db_pub.tb_fee_futu_fee_tmplat where (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and (v_fee_tmplat_kind = 0 or fee_tmplat_kind = v_fee_tmplat_kind) and (v_co_no = 0 or co_no = v_co_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_查询期货费用模板流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_QueryFutuFeeTmplatJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_QueryFutuFeeTmplatJour(
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
    

    /* [获取表记录][公共_期货费用_期货费用模板流水表][字段][{初始化日期}<=@初始化日期# and (@费用模板编号# = 0 or {费用模板编号} = @费用模板编号#) and (@机构编号# = 0 or {机构编号} = @机构编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, fee_tmplat_no, fee_tmplat_name, fee_tmplat_kind, 
        remark_info, oper_remark_info from db_pub.tb_fee_futu_fee_tmplat_jour where init_date<=v_init_date and (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and (v_co_no = 0 or co_no = v_co_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, fee_tmplat_no, fee_tmplat_name, fee_tmplat_kind, 
        remark_info, oper_remark_info from db_pub.tb_fee_futu_fee_tmplat_jour where init_date<=v_init_date and (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and (v_co_no = 0 or co_no = v_co_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_查询历史期货费用模板流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_QueryFutuFeeTmplatJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_QueryFutuFeeTmplatJour_His(
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
    

    /* [获取表记录][历史_公共_期货费用_期货费用模板流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@费用模板编号# = 0 or {费用模板编号} = @费用模板编号#) and (@机构编号# = 0 or {机构编号} = @机构编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, fee_tmplat_no, fee_tmplat_name, fee_tmplat_kind, 
        remark_info, oper_remark_info from db_pub_his.tb_fee_futu_fee_tmplat_jour_his where (init_date between v_begin_date and v_end_date) and (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and (v_co_no = 0 or co_no = v_co_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, fee_tmplat_no, fee_tmplat_name, fee_tmplat_kind, 
        remark_info, oper_remark_info from db_pub_his.tb_fee_futu_fee_tmplat_jour_his where (init_date between v_begin_date and v_end_date) and (v_fee_tmplat_no = 0 or fee_tmplat_no = v_fee_tmplat_no) and (v_co_no = 0 or co_no = v_co_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_新增合约类型费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_AddContrcTypeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_AddContrcTypeFeeTmplatDetail(
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
    IN p_contrc_type int,
    IN p_fee_no int,
    IN p_amt_ratio decimal(18,12),
    IN p_amt_value decimal(18,4),
    IN p_par_value_ratio decimal(18,12),
    IN p_par_value_value decimal(18,4),
    IN p_max_fee decimal(18,4),
    IN p_min_fee decimal(18,4),
    IN p_hedge_type int,
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
    declare v_contrc_type int;
    declare v_fee_no int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_hedge_type int;
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
    SET v_contrc_type = p_contrc_type;
    SET v_fee_no = p_fee_no;
    SET v_amt_ratio = p_amt_ratio;
    SET v_amt_value = p_amt_value;
    SET v_par_value_ratio = p_par_value_ratio;
    SET v_par_value_value = p_par_value_value;
    SET v_max_fee = p_max_fee;
    SET v_min_fee = p_min_fee;
    SET v_hedge_type = p_hedge_type;
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
    set v_jour_occur_field = concat("初始化日期", "|", "费用模板编号", "|", "市场编号", "|", "合约类型", "|", "费用编号", "|", "金额比例", "|", "金额固定额", "|", "面值比例", "|", "面值固定额", "|", "最高费用", "|", "最低费用", "|", "套保标志", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_fee_tmplat_no, "|", v_exch_no, "|", v_contrc_type, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_hedge_type, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @费用选择# = 《费用选择-固定》; */
    set v_fee_choice = 1;

    /* set @浮动比例# = 0; */
    set v_float_ratio = 0;

    /* [获取表记录变量][公共_期货费用_期货费用模板表][{机构编号}, {费用模板类别}][@机构编号#, @费用模板类别#][{费用模板编号} = @费用模板编号#][4][@费用模板编号#] */
    select co_no, fee_tmplat_kind into v_co_no, v_fee_tmplat_kind from db_pub.tb_fee_futu_fee_tmplat where fee_tmplat_no = v_fee_tmplat_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.18.51.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@费用模板类别# <> 《费用模板类别-类型》][80][@费用模板编号#, @费用模板类别#] */
    if v_fee_tmplat_kind <> 1 then
        
        SET v_error_code = "pubA.18.51.80";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 费用模板类别=", v_fee_tmplat_kind),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 费用模板类别=", v_fee_tmplat_kind);
        end if;
        leave label_pro;
    end if;


    /* [插入表记录][公共_期货费用_合约类型费用模板明细表][字段][字段变量][1][@费用模板编号#, @市场编号#, @合约类型#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_contrc_type_fee_tmplat_detail(
        create_date, create_time, update_date, 
        update_time, update_times, fee_tmplat_no, co_no, 
        exch_no, contrc_type, fee_no, amt_ratio, 
        amt_value, par_value_ratio, par_value_value, max_fee, 
        min_fee, float_ratio, fee_choice, hedge_type, 
        remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_fee_tmplat_no, v_co_no, 
        v_exch_no, v_contrc_type, v_fee_no, v_amt_ratio, 
        v_amt_value, v_par_value_ratio, v_par_value_value, v_max_fee, 
        v_min_fee, v_float_ratio, v_fee_choice, v_hedge_type, 
        v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.51.1";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 合约类型=", v_contrc_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_fee_tmplat_no, "|", v_exch_no, "|", v_contrc_type, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_hedge_type, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增合约类型费用模板明细"; */
    set v_oper_remark_info = "新增合约类型费用模板明细";

    /* [插入表记录][公共_期货费用_合约类型费用模板明细流水表][字段][字段变量][5][@费用模板编号#, @市场编号#, @合约类型#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_contrc_type_fee_tmplat_detail_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, oper_menu_no, init_date, co_no, 
        exch_no, contrc_type, fee_tmplat_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_oper_menu_no, v_init_date, v_co_no, 
        v_exch_no, v_contrc_type, v_fee_tmplat_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.51.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 合约类型=", v_contrc_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_修改合约类型费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_ModiContrcTypeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_ModiContrcTypeFeeTmplatDetail(
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
    IN p_contrc_type int,
    IN p_fee_no int,
    IN p_amt_ratio decimal(18,12),
    IN p_amt_value decimal(18,4),
    IN p_par_value_ratio decimal(18,12),
    IN p_par_value_value decimal(18,4),
    IN p_max_fee decimal(18,4),
    IN p_min_fee decimal(18,4),
    IN p_hedge_type int,
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
    declare v_contrc_type int;
    declare v_fee_no int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_hedge_type int;
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_fee_choice int;
    declare v_float_ratio decimal(18,12);
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
    SET v_contrc_type = p_contrc_type;
    SET v_fee_no = p_fee_no;
    SET v_amt_ratio = p_amt_ratio;
    SET v_amt_value = p_amt_value;
    SET v_par_value_ratio = p_par_value_ratio;
    SET v_par_value_value = p_par_value_value;
    SET v_max_fee = p_max_fee;
    SET v_min_fee = p_min_fee;
    SET v_hedge_type = p_hedge_type;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_fee_choice = 0;
    SET v_float_ratio = 0;
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
    set v_jour_occur_field = concat("初始化日期", "|", "费用模板编号", "|", "市场编号", "|", "合约类型", "|", "费用编号", "|", "金额比例", "|", "金额固定额", "|", "面值比例", "|", "面值固定额", "|", "最高费用", "|", "最低费用", "|", "套保标志", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_fee_tmplat_no, "|", v_exch_no, "|", v_contrc_type, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_hedge_type, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @费用选择# = 《费用选择-固定》; */
    set v_fee_choice = 1;

    /* set @浮动比例# = 0; */
    set v_float_ratio = 0;

    /* [更新表记录][公共_期货费用_合约类型费用模板明细表][{金额比例}=@金额比例#,{金额固定额}=@金额固定额#,{面值比例}=@面值比例#,{面值固定额}=@面值固定额#,{最高费用}=@最高费用#,{最低费用}=@最低费用#,{浮动比例}=@浮动比例#,{费用选择}=@费用选择#,{备注信息}=@备注信息#][{费用模板编号}=@费用模板编号# and {市场编号}=@市场编号# and {合约类型}=@合约类型# and {费用编号}=@费用编号# and {套保标志}=@套保标志#][2][@费用模板编号#, @市场编号#, @合约类型#, @费用编号#,@套保标志#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_fee_contrc_type_fee_tmplat_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, amt_ratio=v_amt_ratio,amt_value=v_amt_value,par_value_ratio=v_par_value_ratio,par_value_value=v_par_value_value,max_fee=v_max_fee,min_fee=v_min_fee,float_ratio=v_float_ratio,fee_choice=v_fee_choice,remark_info=v_remark_info where fee_tmplat_no=v_fee_tmplat_no and exch_no=v_exch_no and contrc_type=v_contrc_type and fee_no=v_fee_no and hedge_type=v_hedge_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.52.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 合约类型=", v_contrc_type,","," 费用编号=", v_fee_no,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 合约类型=", v_contrc_type,","," 费用编号=", v_fee_no,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_期货费用_合约类型费用模板明细表][{机构编号}][@机构编号#][{费用模板编号}=@费用模板编号# and {市场编号}=@市场编号# and {合约类型}=@合约类型# and {费用编号}=@费用编号# and {套保标志}=@套保标志#][4][@费用模板编号#, @市场编号#, @合约类型#, @费用编号#] */
    select co_no into v_co_no from db_pub.tb_fee_contrc_type_fee_tmplat_detail where fee_tmplat_no=v_fee_tmplat_no and exch_no=v_exch_no and contrc_type=v_contrc_type and fee_no=v_fee_no and hedge_type=v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.18.52.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 合约类型=", v_contrc_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 合约类型=", v_contrc_type,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_fee_tmplat_no, "|", v_exch_no, "|", v_contrc_type, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_hedge_type, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改合约类型费用模板明细"; */
    set v_oper_remark_info = "修改合约类型费用模板明细";

    /* [插入表记录][公共_期货费用_合约类型费用模板明细流水表][字段][字段变量][5][@费用模板编号#, @市场编号#, @合约类型#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_contrc_type_fee_tmplat_detail_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, oper_menu_no, init_date, co_no, 
        exch_no, contrc_type, fee_tmplat_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_oper_menu_no, v_init_date, v_co_no, 
        v_exch_no, v_contrc_type, v_fee_tmplat_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.52.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 合约类型=", v_contrc_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_删除合约类型费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_DeleteContrcTypeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_DeleteContrcTypeFeeTmplatDetail(
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
    IN p_contrc_type int,
    IN p_fee_no int,
    IN p_hedge_type int,
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
    declare v_contrc_type int;
    declare v_fee_no int;
    declare v_hedge_type int;
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
    SET v_contrc_type = p_contrc_type;
    SET v_fee_no = p_fee_no;
    SET v_hedge_type = p_hedge_type;
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

    /* [获取表记录变量][公共_期货费用_合约类型费用模板明细表][{机构编号}][@机构编号#][{费用模板编号}=@费用模板编号# and {市场编号}=@市场编号# and {合约类型}=@合约类型# and {费用编号}=@费用编号# and {套保标志}=@套保标志#][4][@费用模板编号#, @市场编号#, @合约类型#, @费用编号#,@套保标志#] */
    select co_no into v_co_no from db_pub.tb_fee_contrc_type_fee_tmplat_detail where fee_tmplat_no=v_fee_tmplat_no and exch_no=v_exch_no and contrc_type=v_contrc_type and fee_no=v_fee_no and hedge_type=v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.18.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 合约类型=", v_contrc_type,","," 费用编号=", v_fee_no,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 合约类型=", v_contrc_type,","," 费用编号=", v_fee_no,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_期货费用_合约类型费用模板明细表][{费用模板编号}=@费用模板编号# and {市场编号}=@市场编号# and {合约类型}=@合约类型# and {费用编号}=@费用编号# and {套保标志}=@套保标志#][3][@费用模板编号#, @市场编号#, @合约类型#, @费用编号#,@套保标志#] */
    delete from db_pub.tb_fee_contrc_type_fee_tmplat_detail 
        where fee_tmplat_no=v_fee_tmplat_no and exch_no=v_exch_no and contrc_type=v_contrc_type and fee_no=v_fee_no and hedge_type=v_hedge_type;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.18.53.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 合约类型=", v_contrc_type,","," 费用编号=", v_fee_no,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 合约类型=", v_contrc_type,","," 费用编号=", v_fee_no,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# =" " ; */
    set v_jour_after_occur_info =" " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_期货费用_合约类型费用模板明细流水表][字段][字段变量][5][@费用模板编号#, @市场编号#, @合约类型#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_contrc_type_fee_tmplat_detail_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, oper_menu_no, init_date, co_no, 
        exch_no, contrc_type, fee_tmplat_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_oper_menu_no, v_init_date, v_co_no, 
        v_exch_no, v_contrc_type, v_fee_tmplat_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.53.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 市场编号=", v_exch_no,","," 合约类型=", v_contrc_type,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_查询合约类型费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_QueryContrcTypeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_QueryContrcTypeFeeTmplatDetail(
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
    IN p_contrc_type_str varchar(2048),
    IN p_futu_fee_type int,
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
    declare v_contrc_type_str varchar(2048);
    declare v_futu_fee_type int;
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
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_futu_fee_type = p_futu_fee_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货费用_合约类型费用模板明细表][{记录序号},{费用模板编号},{机构编号},{市场编号},{合约类型},{费用编号},{费用编号} div 10000 as {期货费用类型},{费用编号} % 10000 div 100 as {订单方向},{费用编号} % 100 as {开平方向},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择},{套保标志},{备注信息}][(@机构编号#=0 or {机构编号}=@机构编号#) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@合约类型串# = "; ;" or instr(@合约类型串#, concat(";", {合约类型}, ";")) > 0) and (@期货费用类型#=0 or ({费用编号} div 10000 = @期货费用类型#)) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]; */
    if v_row_count = -1 then
        select row_id,fee_tmplat_no,co_no,exch_no,contrc_type,fee_no,fee_no div 10000 as futu_fee_type,fee_no % 10000 div 100 as order_dir,fee_no % 100 as contrc_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice,hedge_type,remark_info from db_pub.tb_fee_contrc_type_fee_tmplat_detail where (v_co_no=0 or co_no=v_co_no) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_futu_fee_type=0 or (fee_no div 10000 = v_futu_fee_type)) and row_id > v_row_id order by row_id;
    else
        select row_id,fee_tmplat_no,co_no,exch_no,contrc_type,fee_no,fee_no div 10000 as futu_fee_type,fee_no % 10000 div 100 as order_dir,fee_no % 100 as contrc_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice,hedge_type,remark_info from db_pub.tb_fee_contrc_type_fee_tmplat_detail where (v_co_no=0 or co_no=v_co_no) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_futu_fee_type=0 or (fee_no div 10000 = v_futu_fee_type)) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_查询合约类型费用模板明细流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_QueryContrcTypeFeeTmplatDetailJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_QueryContrcTypeFeeTmplatDetailJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_fee_tmplat_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_contrc_type_str varchar(2048),
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
    declare v_fee_tmplat_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_contrc_type_str varchar(2048);
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
    SET v_fee_tmplat_no_str = p_fee_tmplat_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货费用_合约类型费用模板明细流水表][字段][{初始化日期}<=@初始化日期# and (@机构编号#=0 or {机构编号}=@机构编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and  (@合约类型串# = "; ;" or instr(@合约类型串#, concat(";", {合约类型}, ";")) > 0) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, oper_menu_no, init_date, 
        co_no, exch_no, contrc_type, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_fee_contrc_type_fee_tmplat_detail_jour where init_date<=v_init_date and (v_co_no=0 or co_no=v_co_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and  (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, oper_menu_no, init_date, 
        co_no, exch_no, contrc_type, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_fee_contrc_type_fee_tmplat_detail_jour where init_date<=v_init_date and (v_co_no=0 or co_no=v_co_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and  (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_查询历史合约类型费用模板明细流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_QueryContrcTypeFeeTmplatDetailJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_QueryContrcTypeFeeTmplatDetailJour_His(
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
    IN p_contrc_type_str varchar(2048),
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
    declare v_contrc_type_str varchar(2048);
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
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_期货费用_合约类型费用模板明细流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@合约类型串# = "; ;" or instr(@合约类型串#, concat(";", {合约类型}, ";")) > 0) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, oper_menu_no, init_date, 
        co_no, exch_no, contrc_type, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_fee_contrc_type_fee_tmplat_detail_jour_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, oper_menu_no, init_date, 
        co_no, exch_no, contrc_type, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_fee_contrc_type_fee_tmplat_detail_jour_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_新增合约代码费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_AddContrcCodeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_AddContrcCodeFeeTmplatDetail(
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
    IN p_contrc_code_no int,
    IN p_fee_no int,
    IN p_amt_ratio decimal(18,12),
    IN p_amt_value decimal(18,4),
    IN p_par_value_ratio decimal(18,12),
    IN p_par_value_value decimal(18,4),
    IN p_max_fee decimal(18,4),
    IN p_min_fee decimal(18,4),
    IN p_hedge_type int,
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
    declare v_contrc_code_no int;
    declare v_fee_no int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_hedge_type int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_fee_no = p_fee_no;
    SET v_amt_ratio = p_amt_ratio;
    SET v_amt_value = p_amt_value;
    SET v_par_value_ratio = p_par_value_ratio;
    SET v_par_value_value = p_par_value_value;
    SET v_max_fee = p_max_fee;
    SET v_min_fee = p_min_fee;
    SET v_hedge_type = p_hedge_type;
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
    set v_jour_occur_field = concat("初始化日期", "|", "费用模板编号", "|", "市场编号", "|", "合约代码编号", "|", "费用编号", "|", "金额比例", "|", "金额固定额", "|", "面值比例", "|", "面值固定额", "|", "最高费用", "|", "最低费用", "|", "套保标志", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_fee_tmplat_no, "|", v_exch_no, "|", v_contrc_code_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_hedge_type, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @费用选择# = 《费用选择-固定》; */
    set v_fee_choice = 1;

    /* set @浮动比例# = 0; */
    set v_float_ratio = 0;

    /* [获取表记录变量][公共_期货费用_期货费用模板表][{机构编号}, {费用模板类别}][@机构编号#, @费用模板类别#][{费用模板编号} = @费用模板编号#][4][@费用模板编号#] */
    select co_no, fee_tmplat_kind into v_co_no, v_fee_tmplat_kind from db_pub.tb_fee_futu_fee_tmplat where fee_tmplat_no = v_fee_tmplat_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.18.61.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@费用模板类别# <> 《费用模板类别-代码》][80][@费用模板编号#, @费用模板类别#] */
    if v_fee_tmplat_kind <> 2 then
        
        SET v_error_code = "pubA.18.61.80";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 费用模板类别=", v_fee_tmplat_kind),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 费用模板类别=", v_fee_tmplat_kind);
        end if;
        leave label_pro;
    end if;


    /* [插入表记录][公共_期货费用_合约代码费用模板明细表][字段][字段变量][1][@费用模板编号#, @合约代码编号#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_contrc_code_fee_tmplat_detail(
        create_date, create_time, update_date, 
        update_time, update_times, fee_tmplat_no, co_no, 
        exch_no, contrc_code_no, fee_no, amt_ratio, 
        amt_value, par_value_ratio, par_value_value, max_fee, 
        min_fee, float_ratio, fee_choice, hedge_type, 
        remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_fee_tmplat_no, v_co_no, 
        v_exch_no, v_contrc_code_no, v_fee_no, v_amt_ratio, 
        v_amt_value, v_par_value_ratio, v_par_value_value, v_max_fee, 
        v_min_fee, v_float_ratio, v_fee_choice, v_hedge_type, 
        v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.61.1";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 合约代码编号=", v_contrc_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_fee_tmplat_no, "|", v_exch_no, "|", v_contrc_code_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_hedge_type, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增合约代码费用模板明细"; */
    set v_oper_remark_info = "新增合约代码费用模板明细";

    /* [插入表记录][公共_期货费用_合约代码费用模板明细流水表][字段][字段变量][5][@费用模板编号#, @合约代码编号#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_contrc_code_fee_tmplat_detail_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, oper_menu_no, init_date, co_no, 
        exch_no, contrc_code_no, fee_tmplat_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_oper_menu_no, v_init_date, v_co_no, 
        v_exch_no, v_contrc_code_no, v_fee_tmplat_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.61.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 合约代码编号=", v_contrc_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_修改合约代码费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_ModiContrcCodeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_ModiContrcCodeFeeTmplatDetail(
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
    IN p_contrc_code_no int,
    IN p_fee_no int,
    IN p_amt_ratio decimal(18,12),
    IN p_amt_value decimal(18,4),
    IN p_par_value_ratio decimal(18,12),
    IN p_par_value_value decimal(18,4),
    IN p_max_fee decimal(18,4),
    IN p_min_fee decimal(18,4),
    IN p_hedge_type int,
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
    declare v_contrc_code_no int;
    declare v_fee_no int;
    declare v_amt_ratio decimal(18,12);
    declare v_amt_value decimal(18,4);
    declare v_par_value_ratio decimal(18,12);
    declare v_par_value_value decimal(18,4);
    declare v_max_fee decimal(18,4);
    declare v_min_fee decimal(18,4);
    declare v_hedge_type int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_fee_no = p_fee_no;
    SET v_amt_ratio = p_amt_ratio;
    SET v_amt_value = p_amt_value;
    SET v_par_value_ratio = p_par_value_ratio;
    SET v_par_value_value = p_par_value_value;
    SET v_max_fee = p_max_fee;
    SET v_min_fee = p_min_fee;
    SET v_hedge_type = p_hedge_type;
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
    set v_jour_occur_field = concat("初始化日期", "|", "费用模板编号", "|", "市场编号", "|", "合约代码编号", "|", "费用编号", "|", "金额比例", "|", "金额固定额", "|", "面值比例", "|", "面值固定额", "|", "最高费用", "|", "最低费用", "|", "套保标志", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_fee_tmplat_no, "|", v_exch_no, "|", v_contrc_code_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_hedge_type, "|", v_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_期货费用_合约代码费用模板明细表][{金额比例}=@金额比例#,{金额固定额}=@金额固定额#,{面值比例}=@面值比例#,{面值固定额}=@面值固定额#,{最高费用}=@最高费用#,{最低费用}=@最低费用#,{备注信息}=@备注信息#][{费用模板编号}=@费用模板编号# and {合约代码编号}=@合约代码编号# and {费用编号}=@费用编号# and {套保标志} = @套保标志#][2][@费用模板编号#, @合约代码编号#, @费用编号#,@套保标志#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_fee_contrc_code_fee_tmplat_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, amt_ratio=v_amt_ratio,amt_value=v_amt_value,par_value_ratio=v_par_value_ratio,par_value_value=v_par_value_value,max_fee=v_max_fee,min_fee=v_min_fee,remark_info=v_remark_info where fee_tmplat_no=v_fee_tmplat_no and contrc_code_no=v_contrc_code_no and fee_no=v_fee_no and hedge_type = v_hedge_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.62.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 合约代码编号=", v_contrc_code_no,","," 费用编号=", v_fee_no,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 合约代码编号=", v_contrc_code_no,","," 费用编号=", v_fee_no,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_期货费用_合约代码费用模板明细表][{机构编号}][@机构编号#][{费用模板编号}=@费用模板编号# and {合约代码编号}=@合约代码编号# and {费用编号}=@费用编号# ][4][@费用模板编号#, @合约代码编号#, @费用编号#] */
    select co_no into v_co_no from db_pub.tb_fee_contrc_code_fee_tmplat_detail where fee_tmplat_no=v_fee_tmplat_no and contrc_code_no=v_contrc_code_no and fee_no=v_fee_no  limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.18.62.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 合约代码编号=", v_contrc_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 合约代码编号=", v_contrc_code_no,","," 费用编号=", v_fee_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_fee_tmplat_no, "|", v_exch_no, "|", v_contrc_code_no, "|", v_fee_no, "|", v_amt_ratio, "|", v_amt_value, "|", v_par_value_ratio, "|", v_par_value_value, "|", v_max_fee, "|", v_min_fee, "|", v_hedge_type, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改合约代码费用模板明细"; */
    set v_oper_remark_info = "修改合约代码费用模板明细";

    /* [插入表记录][公共_期货费用_合约代码费用模板明细流水表][字段][字段变量][5][@费用模板编号#, @合约代码编号#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_contrc_code_fee_tmplat_detail_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, oper_menu_no, init_date, co_no, 
        exch_no, contrc_code_no, fee_tmplat_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_oper_menu_no, v_init_date, v_co_no, 
        v_exch_no, v_contrc_code_no, v_fee_tmplat_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.62.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 合约代码编号=", v_contrc_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_删除合约代码费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_DeleteContrcCodeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_DeleteContrcCodeFeeTmplatDetail(
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
    IN p_contrc_code_no int,
    IN p_fee_no int,
    IN p_hedge_type int,
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
    declare v_contrc_code_no int;
    declare v_fee_no int;
    declare v_hedge_type int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_fee_no = p_fee_no;
    SET v_hedge_type = p_hedge_type;
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

    /* [获取表记录变量][公共_期货费用_合约代码费用模板明细表][{机构编号}][@机构编号#][{费用模板编号}=@费用模板编号# and {合约代码编号}=@合约代码编号# and {费用编号}=@费用编号# and {套保标志}=@套保标志#][4][@费用模板编号#, @合约代码编号#, @费用编号#,@套保标志#] */
    select co_no into v_co_no from db_pub.tb_fee_contrc_code_fee_tmplat_detail where fee_tmplat_no=v_fee_tmplat_no and contrc_code_no=v_contrc_code_no and fee_no=v_fee_no and hedge_type=v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.18.63.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 合约代码编号=", v_contrc_code_no,","," 费用编号=", v_fee_no,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 合约代码编号=", v_contrc_code_no,","," 费用编号=", v_fee_no,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_期货费用_合约代码费用模板明细表][{费用模板编号}=@费用模板编号# and {合约代码编号}=@合约代码编号# and {费用编号}=@费用编号# and {套保标志}=@套保标志#][3][@费用模板编号#, @合约代码编号#, @费用编号#,@套保标志#] */
    delete from db_pub.tb_fee_contrc_code_fee_tmplat_detail 
        where fee_tmplat_no=v_fee_tmplat_no and contrc_code_no=v_contrc_code_no and fee_no=v_fee_no and hedge_type=v_hedge_type;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.18.63.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 合约代码编号=", v_contrc_code_no,","," 费用编号=", v_fee_no,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,","," 合约代码编号=", v_contrc_code_no,","," 费用编号=", v_fee_no,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# =" " ; */
    set v_jour_after_occur_info =" " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_期货费用_合约代码费用模板明细流水表][字段][字段变量][5][@费用模板编号#, @合约代码编号#, @费用编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_contrc_code_fee_tmplat_detail_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, oper_menu_no, init_date, co_no, 
        exch_no, contrc_code_no, fee_tmplat_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_oper_menu_no, v_init_date, v_co_no, 
        v_exch_no, v_contrc_code_no, v_fee_tmplat_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.63.5";
        SET v_error_info =  CONCAT(concat("费用模板编号=",v_fee_tmplat_no,","," 合约代码编号=", v_contrc_code_no,","," 费用编号=", v_fee_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_查询合约代码费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_QueryContrcCodeFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_QueryContrcCodeFeeTmplatDetail(
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
    IN p_contrc_code_no int,
    IN p_futu_fee_type int,
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
    declare v_contrc_code_no int;
    declare v_futu_fee_type int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_futu_fee_type = p_futu_fee_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货费用_合约代码费用模板明细表][{记录序号},{费用模板编号},{机构编号},{市场编号},{合约代码编号},{费用编号},{费用编号} div 10000 as {期货费用类型},{费用编号} % 10000 div 100 as {订单方向},{费用编号} % 100 as {开平方向},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{套保标志},{备注信息}][(@机构编号#=0 or {机构编号}=@机构编号#) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@合约代码编号# = 0 or {合约代码编号}  = @合约代码编号#) and (@期货费用类型#=0 or ({费用编号} div 10000 = @期货费用类型#)) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,fee_tmplat_no,co_no,exch_no,contrc_code_no,fee_no,fee_no div 10000 as futu_fee_type,fee_no % 10000 div 100 as order_dir,fee_no % 100 as contrc_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,hedge_type,remark_info from db_pub.tb_fee_contrc_code_fee_tmplat_detail where (v_co_no=0 or co_no=v_co_no) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_code_no = 0 or contrc_code_no  = v_contrc_code_no) and (v_futu_fee_type=0 or (fee_no div 10000 = v_futu_fee_type)) and row_id > v_row_id order by row_id;
    else
        select row_id,fee_tmplat_no,co_no,exch_no,contrc_code_no,fee_no,fee_no div 10000 as futu_fee_type,fee_no % 10000 div 100 as order_dir,fee_no % 100 as contrc_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,hedge_type,remark_info from db_pub.tb_fee_contrc_code_fee_tmplat_detail where (v_co_no=0 or co_no=v_co_no) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_code_no = 0 or contrc_code_no  = v_contrc_code_no) and (v_futu_fee_type=0 or (fee_no div 10000 = v_futu_fee_type)) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_查询合约代码费用模板明细流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_QueryContrcCodeFeeTmplatDetailJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_QueryContrcCodeFeeTmplatDetailJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_fee_tmplat_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_fee_tmplat_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_fee_tmplat_no_str = p_fee_tmplat_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货费用_合约代码费用模板明细流水表][字段][{初始化日期}<=@初始化日期# and (@机构编号#=0 or {机构编号}=@机构编号#) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@合约代码编号# = 0 or {合约代码编号}  = @合约代码编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, oper_menu_no, init_date, 
        co_no, exch_no, contrc_code_no, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_fee_contrc_code_fee_tmplat_detail_jour where init_date<=v_init_date and (v_co_no=0 or co_no=v_co_no) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_code_no = 0 or contrc_code_no  = v_contrc_code_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, oper_menu_no, init_date, 
        co_no, exch_no, contrc_code_no, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub.tb_fee_contrc_code_fee_tmplat_detail_jour where init_date<=v_init_date and (v_co_no=0 or co_no=v_co_no) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_code_no = 0 or contrc_code_no  = v_contrc_code_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_查询历史合约代码费用模板明细流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_QueryContrcCodeFeeTmplatDetailJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_QueryContrcCodeFeeTmplatDetailJour_His(
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
    IN p_fee_tmplat_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_fee_tmplat_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_fee_tmplat_no_str = p_fee_tmplat_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_期货费用_合约代码费用模板明细流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@费用模板编号串# = "; ;" or instr(@费用模板编号串#, concat(";", {费用模板编号}, ";")) > 0) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@合约代码编号# = 0 or {合约代码编号}  = @合约代码编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, oper_menu_no, init_date, 
        co_no, exch_no, contrc_code_no, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_fee_contrc_code_fee_tmplat_detail_jour_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_code_no = 0 or contrc_code_no  = v_contrc_code_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, oper_menu_no, init_date, 
        co_no, exch_no, contrc_code_no, fee_tmplat_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pub_his.tb_fee_contrc_code_fee_tmplat_detail_jour_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_fee_tmplat_no_str = "; ;" or instr(v_fee_tmplat_no_str, concat(";", fee_tmplat_no, ";")) > 0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_code_no = 0 or contrc_code_no  = v_contrc_code_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_新增资产账户期货费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_AddAsacFutuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_AddAsacFutuFeeTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_asset_acco_no int,
    IN p_futu_code_fee_tmplat_no int,
    IN p_futu_type_fee_tmplat_no int,
    IN p_futu_code_out_fee_tmplat_no int,
    IN p_futu_type_out_fee_tmplat_no int,
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
    declare v_futu_code_fee_tmplat_no int;
    declare v_futu_type_fee_tmplat_no int;
    declare v_futu_code_out_fee_tmplat_no int;
    declare v_futu_type_out_fee_tmplat_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_co_no int;
    declare v_futu_code_spec_fee_tmplat_no int;
    declare v_futu_type_spec_fee_tmplat_no int;
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
    SET v_futu_code_fee_tmplat_no = p_futu_code_fee_tmplat_no;
    SET v_futu_type_fee_tmplat_no = p_futu_type_fee_tmplat_no;
    SET v_futu_code_out_fee_tmplat_no = p_futu_code_out_fee_tmplat_no;
    SET v_futu_type_out_fee_tmplat_no = p_futu_type_out_fee_tmplat_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_co_no = 0;
    SET v_futu_code_spec_fee_tmplat_no = 0;
    SET v_futu_type_spec_fee_tmplat_no = 0;
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
    set v_jour_occur_field = concat("初始化日期", "|", "资产账户编号", "|", "期货代码费用模板编号", "|", "期货类型费用模板编号", "|", "期货代码外部费用模板编号", "|", "期货类型外部费用模板编号", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_asset_acco_no, "|", v_futu_code_fee_tmplat_no, "|", v_futu_type_fee_tmplat_no, "|", v_futu_code_out_fee_tmplat_no, "|", v_futu_type_out_fee_tmplat_no, "|", v_menu_no, "|");


    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* set @期货代码特殊费用模板编号# = 0; */
    set v_futu_code_spec_fee_tmplat_no = 0;

    /* set @期货类型特殊费用模板编号# = 0; */
    set v_futu_type_spec_fee_tmplat_no = 0;

    /* [插入重复更新][公共_期货费用_资产账户期货费用模板表][字段][字段变量][{期货代码费用模板编号}=@期货代码费用模板编号#,{期货类型费用模板编号}=@期货类型费用模板编号#][1][@资产账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_asset_acco_futu_fee_tmplat (
        create_date, create_time, update_date, 
        update_time, update_times, asset_acco_no, co_no, 
        futu_code_spec_fee_tmplat_no, futu_type_spec_fee_tmplat_no, futu_code_fee_tmplat_no, futu_type_fee_tmplat_no, 
        futu_code_out_fee_tmplat_no, futu_type_out_fee_tmplat_no) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_asset_acco_no, v_co_no, 
        v_futu_code_spec_fee_tmplat_no, v_futu_type_spec_fee_tmplat_no, v_futu_code_fee_tmplat_no, v_futu_type_fee_tmplat_no, 
        v_futu_code_out_fee_tmplat_no, v_futu_type_out_fee_tmplat_no) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, futu_code_fee_tmplat_no=v_futu_code_fee_tmplat_no,futu_type_fee_tmplat_no=v_futu_type_fee_tmplat_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.71.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_asset_acco_no, "|", v_futu_code_fee_tmplat_no, "|", v_futu_type_fee_tmplat_no, "|", v_futu_code_out_fee_tmplat_no, "|", v_futu_type_out_fee_tmplat_no, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增资产账户期货费用模板"; */
    set v_oper_remark_info = "新增资产账户期货费用模板";

    /* [插入表记录][公共_期货费用_资产账户期货费用模板流水表][字段][字段变量][5][@资产账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_asset_acco_futu_fee_tmplat_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, oper_menu_no, init_date, asset_acco_no, 
        co_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_oper_menu_no, v_init_date, v_asset_acco_no, 
        v_co_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.71.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_修改资产账户期货费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_ModiAsacFutuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_ModiAsacFutuFeeTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_asset_acco_no int,
    IN p_futu_code_fee_tmplat_no int,
    IN p_futu_type_fee_tmplat_no int,
    IN p_futu_code_out_fee_tmplat_no int,
    IN p_futu_type_out_fee_tmplat_no int,
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
    declare v_futu_code_fee_tmplat_no int;
    declare v_futu_type_fee_tmplat_no int;
    declare v_futu_code_out_fee_tmplat_no int;
    declare v_futu_type_out_fee_tmplat_no int;
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
    SET v_futu_code_fee_tmplat_no = p_futu_code_fee_tmplat_no;
    SET v_futu_type_fee_tmplat_no = p_futu_type_fee_tmplat_no;
    SET v_futu_code_out_fee_tmplat_no = p_futu_code_out_fee_tmplat_no;
    SET v_futu_type_out_fee_tmplat_no = p_futu_type_out_fee_tmplat_no;
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
    set v_jour_occur_field = concat("初始化日期", "|", "资产账户编号", "|", "期货代码费用模板编号", "|", "期货类型费用模板编号", "|", "期货代码外部费用模板编号", "|", "期货类型外部费用模板编号", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_asset_acco_no, "|", v_futu_code_fee_tmplat_no, "|", v_futu_type_fee_tmplat_no, "|", v_futu_code_out_fee_tmplat_no, "|", v_futu_type_out_fee_tmplat_no, "|", v_menu_no, "|");


    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* [获取表记录变量][公共_期货费用_资产账户期货费用模板表][{记录序号}][@记录序号#][{资产账户编号}=@资产账户编号# and {机构编号}=@机构编号#][4][@资产账户编号#, @机构编号#] */
    select row_id into v_row_id from db_pub.tb_fee_asset_acco_futu_fee_tmplat where asset_acco_no=v_asset_acco_no and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.18.72.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 机构编号=", v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 机构编号=", v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_期货费用_资产账户期货费用模板表][{期货代码费用模板编号}=@期货代码费用模板编号#,{期货类型费用模板编号}=@期货类型费用模板编号#,{期货代码外部费用模板编号}=@期货代码外部费用模板编号#,{期货类型外部费用模板编号}=@期货类型外部费用模板编号#][{资产账户编号}=@资产账户编号#][2][@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_fee_asset_acco_futu_fee_tmplat set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, futu_code_fee_tmplat_no=v_futu_code_fee_tmplat_no,futu_type_fee_tmplat_no=v_futu_type_fee_tmplat_no,futu_code_out_fee_tmplat_no=v_futu_code_out_fee_tmplat_no,futu_type_out_fee_tmplat_no=v_futu_type_out_fee_tmplat_no where asset_acco_no=v_asset_acco_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.72.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_asset_acco_no, "|", v_futu_code_fee_tmplat_no, "|", v_futu_type_fee_tmplat_no, "|", v_futu_code_out_fee_tmplat_no, "|", v_futu_type_out_fee_tmplat_no, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改资产账户期货费用模板"; */
    set v_oper_remark_info = "修改资产账户期货费用模板";

    /* [插入表记录][公共_期货费用_资产账户期货费用模板流水表][字段][字段变量][5][@资产账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_asset_acco_futu_fee_tmplat_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, oper_menu_no, init_date, asset_acco_no, 
        co_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_oper_menu_no, v_init_date, v_asset_acco_no, 
        v_co_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.72.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_删除资产账户期货费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_DeleteAsacFutuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_DeleteAsacFutuFeeTmplat(
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

    /* [获取表记录变量][公共_期货费用_资产账户期货费用模板表][{记录序号}][@记录序号#][{资产账户编号}=@资产账户编号# and {机构编号}=@机构编号#][4][@资产账户编号#, @机构编号#] */
    select row_id into v_row_id from db_pub.tb_fee_asset_acco_futu_fee_tmplat where asset_acco_no=v_asset_acco_no and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.18.73.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 机构编号=", v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 机构编号=", v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_期货费用_资产账户期货费用模板表][{资产账户编号}=@资产账户编号#][3][@资产账户编号#] */
    delete from db_pub.tb_fee_asset_acco_futu_fee_tmplat 
        where asset_acco_no=v_asset_acco_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.18.73.3";
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

    /* [插入表记录][公共_期货费用_资产账户期货费用模板流水表][字段][字段变量][5][@资产账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_asset_acco_futu_fee_tmplat_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, oper_menu_no, init_date, asset_acco_no, 
        co_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_oper_menu_no, v_init_date, v_asset_acco_no, 
        v_co_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.73.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_查询资产账户期货费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_QueryAsacFutuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_QueryAsacFutuFeeTmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_futu_code_fee_tmplat_str varchar(2048),
    IN p_futu_type_fee_tmplat_str varchar(2048),
    IN p_futu_code_out_fee_tmplat_str varchar(2048),
    IN p_futu_type_out_fee_tmplat_str varchar(2048),
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
    declare v_futu_code_fee_tmplat_str varchar(2048);
    declare v_futu_type_fee_tmplat_str varchar(2048);
    declare v_futu_code_out_fee_tmplat_str varchar(2048);
    declare v_futu_type_out_fee_tmplat_str varchar(2048);
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
    SET v_futu_code_fee_tmplat_str = p_futu_code_fee_tmplat_str;
    SET v_futu_type_fee_tmplat_str = p_futu_type_fee_tmplat_str;
    SET v_futu_code_out_fee_tmplat_str = p_futu_code_out_fee_tmplat_str;
    SET v_futu_type_out_fee_tmplat_str = p_futu_type_out_fee_tmplat_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货费用_资产账户期货费用模板表][字段][(@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and {机构编号} = @操作员机构编号# and (@期货代码费用模板串# = "; ;" or instr(@期货代码费用模板串#, concat(";", {期货代码费用模板编号}, ";")) > 0) and (@期货类型费用模板串# = "; ;" or instr(@期货类型费用模板串#, concat(";", {期货类型费用模板编号}, ";")) > 0) and (@期货代码外部费用模板串# = "; ;" or instr(@期货代码外部费用模板串#, concat(";", {期货代码外部费用模板编号}, ";")) > 0) and (@期货类型外部费用模板串# = "; ;" or instr(@期货类型外部费用模板串#, concat(";", {期货类型外部费用模板编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, asset_acco_no, 
        co_no, futu_code_spec_fee_tmplat_no, futu_type_spec_fee_tmplat_no, futu_code_fee_tmplat_no, 
        futu_type_fee_tmplat_no, futu_code_out_fee_tmplat_no, futu_type_out_fee_tmplat_no from db_pub.tb_fee_asset_acco_futu_fee_tmplat where (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and co_no = v_opor_co_no and (v_futu_code_fee_tmplat_str = "; ;" or instr(v_futu_code_fee_tmplat_str, concat(";", futu_code_fee_tmplat_no, ";")) > 0) and (v_futu_type_fee_tmplat_str = "; ;" or instr(v_futu_type_fee_tmplat_str, concat(";", futu_type_fee_tmplat_no, ";")) > 0) and (v_futu_code_out_fee_tmplat_str = "; ;" or instr(v_futu_code_out_fee_tmplat_str, concat(";", futu_code_out_fee_tmplat_no, ";")) > 0) and (v_futu_type_out_fee_tmplat_str = "; ;" or instr(v_futu_type_out_fee_tmplat_str, concat(";", futu_type_out_fee_tmplat_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, asset_acco_no, 
        co_no, futu_code_spec_fee_tmplat_no, futu_type_spec_fee_tmplat_no, futu_code_fee_tmplat_no, 
        futu_type_fee_tmplat_no, futu_code_out_fee_tmplat_no, futu_type_out_fee_tmplat_no from db_pub.tb_fee_asset_acco_futu_fee_tmplat where (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and co_no = v_opor_co_no and (v_futu_code_fee_tmplat_str = "; ;" or instr(v_futu_code_fee_tmplat_str, concat(";", futu_code_fee_tmplat_no, ";")) > 0) and (v_futu_type_fee_tmplat_str = "; ;" or instr(v_futu_type_fee_tmplat_str, concat(";", futu_type_fee_tmplat_no, ";")) > 0) and (v_futu_code_out_fee_tmplat_str = "; ;" or instr(v_futu_code_out_fee_tmplat_str, concat(";", futu_code_out_fee_tmplat_no, ";")) > 0) and (v_futu_type_out_fee_tmplat_str = "; ;" or instr(v_futu_type_out_fee_tmplat_str, concat(";", futu_type_out_fee_tmplat_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_查询资产账户期货费用模板流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_QueryAsacFutuFeeTmplatJour;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_QueryAsacFutuFeeTmplatJour(
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
    

    /* [获取表记录][公共_期货费用_资产账户期货费用模板流水表][字段][{初始化日期} <= @初始化日期# and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and {机构编号} = @操作员机构编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, oper_menu_no, init_date, 
        asset_acco_no, co_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub.tb_fee_asset_acco_futu_fee_tmplat_jour where init_date <= v_init_date and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and co_no = v_opor_co_no and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, oper_menu_no, init_date, 
        asset_acco_no, co_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub.tb_fee_asset_acco_futu_fee_tmplat_jour where init_date <= v_init_date and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and co_no = v_opor_co_no and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_查询历史资产账户期货费用模板流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_QueryAsacFutuFeeTmplatJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_QueryAsacFutuFeeTmplatJour_His(
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
    

    /* [获取表记录][历史_公共_期货费用_资产账户期货费用模板流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and {机构编号} = @操作员机构编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, oper_menu_no, init_date, 
        asset_acco_no, co_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub_his.tb_fee_asset_acco_futu_fee_tmplat_jour_his where (init_date between v_begin_date and v_end_date) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and co_no = v_opor_co_no and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, oper_menu_no, init_date, 
        asset_acco_no, co_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub_his.tb_fee_asset_acco_futu_fee_tmplat_jour_his where (init_date between v_begin_date and v_end_date) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and co_no = v_opor_co_no and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_查询系统合约类型费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_QuerySysContrcTypeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_QuerySysContrcTypeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_contrc_type_str varchar(2048),
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
    declare v_contrc_type_str varchar(2048);
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
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_fee_no_str = p_fee_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货费用_系统合约类型费用表][{记录序号},{市场编号},{合约类型},{费用编号},{费用编号} div 10000 as {期货费用类型},{费用编号} % 10000 div 100 as {订单方向},{费用编号} % 100 as {开平方向},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][(@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@合约类型串# = "; ;" or instr(@合约类型串#, concat(";", {合约类型}, ";")) > 0) and (@费用编号串# = "; ;" or instr(@费用编号串#, concat(";", {费用编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,exch_no,contrc_type,fee_no,fee_no div 10000 as futu_fee_type,fee_no % 10000 div 100 as order_dir,fee_no % 100 as contrc_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee from db_pub.tb_fee_sys_contrc_type_fee where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id,exch_no,contrc_type,fee_no,fee_no div 10000 as futu_fee_type,fee_no % 10000 div 100 as order_dir,fee_no % 100 as contrc_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee from db_pub.tb_fee_sys_contrc_type_fee where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_type_str = "; ;" or instr(v_contrc_type_str, concat(";", contrc_type, ";")) > 0) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_查询系统合约代码费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_QuerySysContrcCodeFee;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_QuerySysContrcCodeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
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
    declare v_contrc_code_no int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_fee_no_str = p_fee_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_期货费用_系统合约代码费用表][{记录序号},{市场编号},{合约代码编号},{费用编号},{费用编号} div 10000 as {期货费用类型},{费用编号} % 10000 div 100 as {订单方向},{费用编号} % 100 as {开平方向},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][(@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@合约代码编号# = 0 or {合约代码编号}=@合约代码编号#) and (@费用编号串# = "; ;" or instr(@费用编号串#, concat(";", {费用编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,exch_no,contrc_code_no,fee_no,fee_no div 10000 as futu_fee_type,fee_no % 10000 div 100 as order_dir,fee_no % 100 as contrc_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee from db_pub.tb_fee_sys_contrc_code_fee where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id,exch_no,contrc_code_no,fee_no,fee_no div 10000 as futu_fee_type,fee_no % 10000 div 100 as order_dir,fee_no % 100 as contrc_dir,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee from db_pub.tb_fee_sys_contrc_code_fee where (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (v_fee_no_str = "; ;" or instr(v_fee_no_str, concat(";", fee_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_查询费用编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_QueryFeeNo;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_QueryFeeNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_fee_no int,
    IN p_futu_fee_type int,
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
    declare v_futu_fee_type int;
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
    SET v_futu_fee_type = p_futu_fee_type;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][公共_期货费用_费用编号表][字段][(@费用编号# = 0 or {费用编号}=@费用编号#) and (@期货费用类型# = 0 or {期货费用类型}=@期货费用类型#) and (@订单方向# = 0 or {订单方向}=@订单方向#) and (@开平方向# = 0 or {开平方向}=@开平方向#)] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, fee_no, 
        futu_fee_type, order_dir, contrc_dir, remark_info from db_pub.tb_fee_futu_fee_no where (v_fee_no = 0 or fee_no=v_fee_no) and (v_futu_fee_type = 0 or futu_fee_type=v_futu_fee_type) and (v_order_dir = 0 or order_dir=v_order_dir) and (v_contrc_dir = 0 or contrc_dir=v_contrc_dir);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_获取期货保证金参数
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_GetFutuMarginRatio;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_GetFutuMarginRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_contrc_code_no int,
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_hedge_type int,
    IN p_fee_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_margin_ratio decimal(18,12)
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
    declare v_contrc_code_no int;
    declare v_exch_no int;
    declare v_contrc_type int;
    declare v_hedge_type int;
    declare v_fee_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_margin_ratio decimal(18,12);
    declare v_futu_code_spec_fee_tmplat_no int;
    declare v_futu_type_spec_fee_tmplat_no int;
    declare v_futu_code_fee_tmplat_no int;
    declare v_futu_type_fee_tmplat_no int;
    declare v_futu_code_out_fee_tmplat_no int;
    declare v_futu_type_out_fee_tmplat_no int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_exch_no = p_exch_no;
    SET v_contrc_type = p_contrc_type;
    SET v_hedge_type = p_hedge_type;
    SET v_fee_no = p_fee_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_margin_ratio = 0;
    SET v_futu_code_spec_fee_tmplat_no = 0;
    SET v_futu_type_spec_fee_tmplat_no = 0;
    SET v_futu_code_fee_tmplat_no = 0;
    SET v_futu_type_fee_tmplat_no = 0;
    SET v_futu_code_out_fee_tmplat_no = 0;
    SET v_futu_type_out_fee_tmplat_no = 0;
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

    /* [获取表记录变量语句][公共_期货费用_资产账户期货费用模板表][{期货代码特殊费用模板编号}, {期货类型特殊费用模板编号}, {期货代码费用模板编号}, {期货类型费用模板编号}, {期货代码外部费用模板编号}, {期货类型外部费用模板编号}][@期货代码特殊费用模板编号#, @期货类型特殊费用模板编号#, @期货代码费用模板编号#, @期货类型费用模板编号#, @期货代码外部费用模板编号#, @期货类型外部费用模板编号#][{资产账户编号} = @资产账户编号#] */
    select futu_code_spec_fee_tmplat_no, futu_type_spec_fee_tmplat_no, futu_code_fee_tmplat_no, futu_type_fee_tmplat_no, futu_code_out_fee_tmplat_no, futu_type_out_fee_tmplat_no into v_futu_code_spec_fee_tmplat_no, v_futu_type_spec_fee_tmplat_no, v_futu_code_fee_tmplat_no, v_futu_type_fee_tmplat_no, v_futu_code_out_fee_tmplat_no, v_futu_type_out_fee_tmplat_no from db_pub.tb_fee_asset_acco_futu_fee_tmplat where asset_acco_no = v_asset_acco_no limit 1;

    if FOUND_ROWS() = 0 then

        /* set @期货代码特殊费用模板编号# = 0; */
        set v_futu_code_spec_fee_tmplat_no = 0;

        /* set @期货类型特殊费用模板编号# = 0; */
        set v_futu_type_spec_fee_tmplat_no = 0;

        /* set @期货代码费用模板编号# = 0; */
        set v_futu_code_fee_tmplat_no = 0;

        /* set @期货类型费用模板编号# = 0; */
        set v_futu_type_fee_tmplat_no = 0;

        /* set @期货代码外部费用模板编号# = 0; */
        set v_futu_code_out_fee_tmplat_no = 0;

        /* set @期货类型外部费用模板编号# = 0; */
        set v_futu_type_out_fee_tmplat_no = 0;
    end if;
    #置状态位计算结束标志

    /* set @计算结束标志# = 0; */
    set v_calc_end_flag = 0;
    #费用优先级顺序，先个性，再模板，最后系统。期货代码特殊费用模板>期货类型特殊费用模板>期货代码费用模板>期货类型费用模板>系统合约代码费用>系统合约类型费用

    /* if @期货代码特殊费用模板编号# <> 0 and @计算结束标志# = 0 then */
    if v_futu_code_spec_fee_tmplat_no <> 0 and v_calc_end_flag = 0 then

        /* [获取表记录变量语句][公共_期货费用_合约代码费用模板明细表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#,@浮动比例#,@费用选择#][{费用模板编号} = @期货代码特殊费用模板编号# and {合约代码编号} = @合约代码编号# and {费用编号} = @费用编号#] */
        select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee,v_float_ratio,v_fee_choice from db_pub.tb_fee_contrc_code_fee_tmplat_detail where fee_tmplat_no = v_futu_code_spec_fee_tmplat_no and contrc_code_no = v_contrc_code_no and fee_no = v_fee_no limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @计算结束标志# = 1; */
            set v_calc_end_flag = 1;
        end if;
    end if;

    /* if @期货类型特殊费用模板编号# <> 0 and @计算结束标志# = 0 then */
    if v_futu_type_spec_fee_tmplat_no <> 0 and v_calc_end_flag = 0 then

        /* [获取表记录变量语句][公共_期货费用_合约类型费用模板明细表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#,@浮动比例#,@费用选择#][{费用模板编号} = @期货类型特殊费用模板编号# and {市场编号} = @市场编号# and {合约类型} = @合约类型# and {费用编号} = @费用编号#] */
        select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee,v_float_ratio,v_fee_choice from db_pub.tb_fee_contrc_type_fee_tmplat_detail where fee_tmplat_no = v_futu_type_spec_fee_tmplat_no and exch_no = v_exch_no and contrc_type = v_contrc_type and fee_no = v_fee_no limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @计算结束标志# = 1; */
            set v_calc_end_flag = 1;
        end if;
    end if;

    /* if @期货代码费用模板编号# <> 0 and @计算结束标志# = 0 then */
    if v_futu_code_fee_tmplat_no <> 0 and v_calc_end_flag = 0 then

        /* [获取表记录变量语句][公共_期货费用_合约代码费用模板明细表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#,@浮动比例#,@费用选择#][{费用模板编号} = @期货代码费用模板编号# and {合约代码编号} = @合约代码编号# and {费用编号} = @费用编号# and {套保标志} = @套保标志#] */
        select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee,v_float_ratio,v_fee_choice from db_pub.tb_fee_contrc_code_fee_tmplat_detail where fee_tmplat_no = v_futu_code_fee_tmplat_no and contrc_code_no = v_contrc_code_no and fee_no = v_fee_no and hedge_type = v_hedge_type limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @计算结束标志# = 1; */
            set v_calc_end_flag = 1;
        end if;
    end if;

    /* if @期货类型费用模板编号# <> 0 and @计算结束标志# = 0 then */
    if v_futu_type_fee_tmplat_no <> 0 and v_calc_end_flag = 0 then

        /* [获取表记录变量语句][公共_期货费用_合约类型费用模板明细表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#,@浮动比例#,@费用选择#][{费用模板编号} = @期货类型费用模板编号# and {市场编号} = @市场编号# and {合约类型} = @合约类型# and {费用编号} = @费用编号# and {套保标志} = @套保标志#] */
        select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee,v_float_ratio,v_fee_choice from db_pub.tb_fee_contrc_type_fee_tmplat_detail where fee_tmplat_no = v_futu_type_fee_tmplat_no and exch_no = v_exch_no and contrc_type = v_contrc_type and fee_no = v_fee_no and hedge_type = v_hedge_type limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @计算结束标志# = 1; */
            set v_calc_end_flag = 1;
        end if;
    end if;

    /* if @计算结束标志# = 0 then */
    if v_calc_end_flag = 0 then

        /* [获取表记录变量语句][公共_期货费用_系统合约代码费用表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#][{合约代码编号} = @合约代码编号# and {费用编号} = @费用编号#] */
        select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee from db_pub.tb_fee_sys_contrc_code_fee where contrc_code_no = v_contrc_code_no and fee_no = v_fee_no limit 1;

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

        /* [获取表记录变量语句][公共_期货费用_系统合约类型费用表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#][{市场编号} = @市场编号# and {合约类型} = @合约类型# and {费用编号} = @费用编号#] */
        select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee from db_pub.tb_fee_sys_contrc_type_fee where exch_no = v_exch_no and contrc_type = v_contrc_type and fee_no = v_fee_no limit 1;

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

        /* if @期货代码外部费用模板编号# <> 0 then */
        if v_futu_code_out_fee_tmplat_no <> 0 then

            /* [获取表记录变量语句][公共_期货费用_合约代码费用模板明细表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#][{费用模板编号} = @期货代码外部费用模板编号# and {合约代码编号} = @合约代码编号# and {费用编号} = @费用编号#] */
            select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee from db_pub.tb_fee_contrc_code_fee_tmplat_detail where fee_tmplat_no = v_futu_code_out_fee_tmplat_no and contrc_code_no = v_contrc_code_no and fee_no = v_fee_no limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @计算结束标志# = 1; */
                set v_calc_end_flag = 1;
            end if;
        end if;

        /* if @期货类型外部费用模板编号# <> 0 and @计算结束标志# = 0 then */
        if v_futu_type_out_fee_tmplat_no <> 0 and v_calc_end_flag = 0 then

            /* [获取表记录变量语句][公共_期货费用_合约类型费用模板明细表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#][{费用模板编号} = @期货类型外部费用模板编号# and {市场编号} = @市场编号# and {合约类型} = @合约类型# and {费用编号} = @费用编号#] */
            select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee from db_pub.tb_fee_contrc_type_fee_tmplat_detail where fee_tmplat_no = v_futu_type_out_fee_tmplat_no and exch_no = v_exch_no and contrc_type = v_contrc_type and fee_no = v_fee_no limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @计算结束标志# = 1; */
                set v_calc_end_flag = 1;
            end if;
        end if;

        /* if @计算结束标志# = 0 then */
        if v_calc_end_flag = 0 then

            /* [获取表记录变量语句][公共_期货费用_外部合约代码费用表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#][{通道编号} = @通道编号# and {合约代码编号} = @合约代码编号# and {费用编号} = @费用编号#] */
            select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee from db_pub.tb_fee_out_contrc_code_fee where pass_no = v_pass_no and contrc_code_no = v_contrc_code_no and fee_no = v_fee_no limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @计算结束标志# = 1; */
                set v_calc_end_flag = 1;
            end if;
        end if;

        /* if @计算结束标志# = 0 then */
        if v_calc_end_flag = 0 then

            /* [获取表记录变量语句][公共_期货费用_外部合约类型费用表][{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用}][@金额比例#,@金额固定额#,@面值比例#,@面值固定额#,@最高费用#,@最低费用#][{通道编号} = @通道编号# and {市场编号} = @市场编号# and {合约类型} = @合约类型# and {费用编号} = @费用编号#] */
            select amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee into v_amt_ratio,v_amt_value,v_par_value_ratio,v_par_value_value,v_max_fee,v_min_fee from db_pub.tb_fee_out_contrc_type_fee where pass_no = v_pass_no and exch_no = v_exch_no and contrc_type = v_contrc_type and fee_no = v_fee_no limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @计算结束标志# = 1; */
                set v_calc_end_flag = 1;
            end if;
        end if;

        /* set @金额比例# = @浮动比例# + @金额比例#; */
        set v_amt_ratio = v_float_ratio + v_amt_ratio;
    end if;

    /* set @保证金比例#= @金额比例#; */
    set v_margin_ratio= v_amt_ratio;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_margin_ratio = v_margin_ratio;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_模板编号删除期货费用明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_DeleteFutuFeeTmplatByFeeNo;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_DeleteFutuFeeTmplatByFeeNo(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_期货费用_期货费用模板表][字段][字段变量][{费用模板编号}=@费用模板编号#][4][@费用模板编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, fee_tmplat_no, 
        co_no, fee_tmplat_name, fee_tmplat_kind, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_fee_tmplat_no, 
        v_co_no, v_fee_tmplat_name, v_fee_tmplat_kind, v_remark_info from db_pub.tb_fee_futu_fee_tmplat where fee_tmplat_no=v_fee_tmplat_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.18.77.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no);
        end if;
        leave label_pro;
    end if;

    #[删除表记录][公共_期货费用_期货费用模板表][{费用模板编号}=@费用模板编号#][3][@费用模板编号#]
    #set @操作菜单# = @菜单编号#;
    #set @操作功能# = @功能编码#;
    #set @操作备注# = "删除期货费用模板";
    #[插入表记录][公共_期货费用_期货费用模板流水表][字段][字段变量][5][@费用模板编号#, @机构编号#]

    /* if @费用模板类别# = 《费用模板类别-类型》 then */
    if v_fee_tmplat_kind = 1 then

        /* [删除表记录][公共_期货费用_合约类型费用模板明细表][{费用模板编号}=@费用模板编号#][3][@费用模板编号#,@费用模板类别#] */
        delete from db_pub.tb_fee_contrc_type_fee_tmplat_detail 
            where fee_tmplat_no=v_fee_tmplat_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.18.77.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind),"#",v_mysql_message);
            else
                SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind);
            end if;
            leave label_pro;
        end if;

       # [更新表记录][公共_期货费用_资产账户期货费用模板表][{期货类型费用模板编号}=0][{机构编号}=@机构编号#][2][@机构编号#,@费用模板类别#]
    else

        /* [删除表记录][公共_期货费用_合约代码费用模板明细表][{费用模板编号}=@费用模板编号#][3][@费用模板编号#,@费用模板类别#] */
        delete from db_pub.tb_fee_contrc_code_fee_tmplat_detail 
            where fee_tmplat_no=v_fee_tmplat_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.18.77.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind),"#",v_mysql_message);
            else
                SET v_error_info = concat("费用模板编号=",v_fee_tmplat_no,",","费用模板类别=",v_fee_tmplat_kind);
            end if;
            leave label_pro;
        end if;

       # [更新表记录][公共_期货费用_资产账户期货费用模板表][{期货代码费用模板编号}=0][{机构编号}=@机构编号#][2][@机构编号#,@费用模板类别#]
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_期货费用客户端_复制期货费用模板
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_CopyFutuFeeTmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_CopyFutuFeeTmplat(
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
    

    /* [获取表记录变量][公共_期货费用_期货费用模板表][{费用模板类别},{备注信息}][@费用模板类别#,@备注信息#][{机构编号}=@机构编号# and {费用模板编号}=@源费用模板编号#][4][@机构编号#,@源费用模板编号#] */
    select fee_tmplat_kind,remark_info into v_fee_tmplat_kind,v_remark_info from db_pub.tb_fee_futu_fee_tmplat where co_no=v_co_no and fee_tmplat_no=v_source_fee_tmplat_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.18.78.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","源费用模板编号=",v_source_fee_tmplat_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","源费用模板编号=",v_source_fee_tmplat_no);
        end if;
        leave label_pro;
    end if;


    /* [插入表记录][公共_期货费用_期货费用模板表][字段][字段变量][1][@机构编号#, @费用模板名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_futu_fee_tmplat(
        create_date, create_time, update_date, 
        update_time, update_times, fee_tmplat_no, co_no, 
        fee_tmplat_name, fee_tmplat_kind, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_fee_tmplat_no, v_co_no, 
        v_fee_tmplat_name, v_fee_tmplat_kind, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.78.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,","," 费用模板名称=", v_fee_tmplat_name),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增期货费用模板"; */
    set v_oper_remark_info = "新增期货费用模板";

    /* [插入表记录][公共_期货费用_期货费用模板流水表][字段][字段变量][5][@费用模板编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_fee_futu_fee_tmplat_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        fee_tmplat_no, fee_tmplat_name, fee_tmplat_kind, remark_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_fee_tmplat_no, v_fee_tmplat_name, v_fee_tmplat_kind, v_remark_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.18.78.5";
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

# 原子_公共_期货费用客户端_复制期货费用模板明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_feefutuclient_CopyFutuFeeTmplatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_feefutuclient_CopyFutuFeeTmplatDetail(
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

        /* [读取插入表记录][公共_期货费用_合约类型费用模板明细表][公共_期货费用_合约类型费用模板明细表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{费用模板编号},{机构编号},{市场编号},{合约类型},{费用编号},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择},{备注信息}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@费用模板编号#,{机构编号},{市场编号},{合约类型},{费用编号},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择},{备注信息}][{机构编号}=@机构编号# and {费用模板编号}=@源费用模板编号#][1][@机构编号#,@源费用模板编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_fee_contrc_type_fee_tmplat_detail (
            create_date,create_time,update_date,update_time,update_times,fee_tmplat_no,co_no,exch_no,contrc_type,fee_no,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice,remark_info) 
            select 
            v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_fee_tmplat_no,co_no,exch_no,contrc_type,fee_no,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice,remark_info 
            from db_pub.tb_fee_contrc_type_fee_tmplat_detail 
            where co_no=v_co_no and fee_tmplat_no=v_source_fee_tmplat_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.18.79.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","源费用模板编号=",v_source_fee_tmplat_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","源费用模板编号=",v_source_fee_tmplat_no);
            end if;
            leave label_pro;
        end if;


    /* elseif @费用模板类别# = 《费用模板类别-代码》 then */
    elseif v_fee_tmplat_kind = 2 then

        /* [读取插入表记录][公共_期货费用_合约代码费用模板明细表][公共_期货费用_合约代码费用模板明细表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{费用模板编号},{机构编号},{市场编号},{合约代码编号},{费用编号},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择},{备注信息}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@费用模板编号#,{机构编号},{市场编号},{合约代码编号},{费用编号},{金额比例},{金额固定额},{面值比例},{面值固定额},{最高费用},{最低费用},{浮动比例},{费用选择},{备注信息}][{机构编号}=@机构编号# and {费用模板编号}=@源费用模板编号#][1][@机构编号#,@源费用模板编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_fee_contrc_code_fee_tmplat_detail (
            create_date,create_time,update_date,update_time,update_times,fee_tmplat_no,co_no,exch_no,contrc_code_no,fee_no,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice,remark_info) 
            select 
            v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_fee_tmplat_no,co_no,exch_no,contrc_code_no,fee_no,amt_ratio,amt_value,par_value_ratio,par_value_value,max_fee,min_fee,float_ratio,fee_choice,remark_info 
            from db_pub.tb_fee_contrc_code_fee_tmplat_detail 
            where co_no=v_co_no and fee_tmplat_no=v_source_fee_tmplat_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.18.79.1";
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


