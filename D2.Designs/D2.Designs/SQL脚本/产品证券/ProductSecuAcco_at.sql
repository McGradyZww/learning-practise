DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_获取市场业务记录编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_GetMarketBusiRecordNo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_GetMarketBusiRecordNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_record_no_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_no bigint
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
    declare v_record_no_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_no bigint;
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
    SET v_record_no_type = p_record_no_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @当前编号# = 1; */
    set v_curr_no = 1;

    /* [插入重复更新][产品证券_账户_市场业务记录编号表][字段][字段变量][{当前编号} = {当前编号} + 1][1][@市场编号#, @编号类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseac_market_busi_record_no (
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, record_no_type, 
        curr_no) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_no, v_record_no_type, 
        v_curr_no) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_no = curr_no + 1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.901.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 编号类型=", v_record_no_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 编号类型=", v_record_no_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][产品证券_账户_市场业务记录编号表][{当前编号}][@当前编号#][{市场编号} = @市场编号# and {编号类型} = @编号类型#] */
    select curr_no into v_curr_no from db_pdsecu.tb_pdseac_market_busi_record_no where exch_no = v_exch_no and record_no_type = v_record_no_type limit 1;


    /* set @当前编号# = @市场编号# * 1000000 + @当前编号#; */
    set v_curr_no = v_exch_no * 1000000 + v_curr_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_curr_no = v_curr_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_检查证券账户存在
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_CheckSecuAccoExists;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_CheckSecuAccoExists(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_registration_agency varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_registration_agency = p_registration_agency;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [记录已存在][产品证券_账户_证券账户信息表][@记录个数#][{资产账户编号}=@资产账户编号# and {市场编号}=@市场编号# and {股东代码}=@股东代码# and {登记机构} = @登记机构#][144][@资产账户编号#,@市场编号#,@股东代码#] */
    select count(1) into v_record_count from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no=v_asset_acco_no and exch_no=v_exch_no and stock_acco=v_stock_acco and registration_agency = v_registration_agency limit 1;
    if v_record_count > 0 then
                
        SET v_error_code = "pdsecuA.1.40.144";
        SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_新增证券账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_AddSecuAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_AddSecuAccoInfo(
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
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_acco_name varchar(64),
    IN p_stock_acco_apoint_status varchar(2),
    IN p_allow_stock_type varchar(2048),
    IN p_busi_limit_str varchar(2048),
    IN p_registration_agency varchar(32),
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
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_acco_name varchar(64);
    declare v_stock_acco_apoint_status varchar(2);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_limit_str varchar(2048);
    declare v_registration_agency varchar(32);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_stock_acco_status varchar(2);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_acco_name = p_stock_acco_name;
    SET v_stock_acco_apoint_status = p_stock_acco_apoint_status;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_registration_agency = p_registration_agency;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_stock_acco_status = "0";
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
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "资产账户编号", "|", "股东代码编号", "|", "市场编号", "|", "股东代码", "|", "股东代码名称", "|", "股东指定状态", "|", "允许操作证券类型", "|", "业务限制串", "|", "登记机构", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_stock_acco_no, "|", v_exch_no, "|", v_stock_acco, "|", v_stock_acco_name, "|", v_stock_acco_apoint_status, "|", v_allow_stock_type, "|", v_busi_limit_str, "|", v_registration_agency, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @股东代码状态# =《股东代码状态-正常》; */
    set v_stock_acco_status ="1";

    /* [插入表记录][产品证券_账户_证券账户信息表][字段][字段变量][1][@资产账户编号#,@市场编号#,@股东代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseac_secu_acco(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, stock_acco_no, exch_no, stock_acco, 
        stock_acco_name, stock_acco_status, stock_acco_apoint_status, allow_stock_type, 
        busi_limit_str, registration_agency, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_stock_acco_no, v_exch_no, v_stock_acco, 
        v_stock_acco_name, v_stock_acco_status, v_stock_acco_apoint_status, v_allow_stock_type, 
        v_busi_limit_str, v_registration_agency, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.41.1";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_stock_acco_no, "|", v_exch_no, "|", v_stock_acco, "|", v_stock_acco_name, "|", v_stock_acco_apoint_status, "|", v_allow_stock_type, "|", v_busi_limit_str, "|", v_registration_agency, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增证券账户信息"; */
    set v_oper_remark_info = "新增证券账户信息";

    /* [插入表记录][产品证券_账户_证券账户信息流水表][字段][字段变量][5][@资产账户编号#,@市场编号#,@股东代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseac_secu_acco_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, stock_acco_no, exch_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_stock_acco_no, v_exch_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.41.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_修改证券账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_ModiSecuAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_ModiSecuAccoInfo(
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
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_name varchar(64),
    IN p_stock_acco_apoint_status varchar(2),
    IN p_allow_stock_type varchar(2048),
    IN p_busi_limit_str varchar(2048),
    IN p_registration_agency varchar(32),
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
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_name varchar(64);
    declare v_stock_acco_apoint_status varchar(2);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_limit_str varchar(2048);
    declare v_registration_agency varchar(32);
    declare v_remark_info varchar(255);
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_name = p_stock_acco_name;
    SET v_stock_acco_apoint_status = p_stock_acco_apoint_status;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_registration_agency = p_registration_agency;
    SET v_remark_info = p_remark_info;
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
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量]; */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "资产账户编号", "|", "股东代码编号", "|", "市场编号", "|", "股东代码名称", "|", "股东指定状态", "|", "允许操作证券类型", "|", "业务限制串", "|", "登记机构", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_stock_acco_no, "|", v_exch_no, "|", v_stock_acco_name, "|", v_stock_acco_apoint_status, "|", v_allow_stock_type, "|", v_busi_limit_str, "|", v_registration_agency, "|", v_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][产品证券_账户_证券账户信息表][{股东代码名称}=@股东代码名称#, {股东指定状态}=@股东指定状态#, {允许操作证券类型}=@允许操作证券类型#,{业务限制串}=@业务限制串#,{备注信息}=@备注信息#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {登记机构} = @登记机构#][2][@资产账户编号#,@股东代码编号#,@登记机构#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseac_secu_acco set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_acco_name=v_stock_acco_name, stock_acco_apoint_status=v_stock_acco_apoint_status, allow_stock_type=v_allow_stock_type,busi_limit_str=v_busi_limit_str,remark_info=v_remark_info where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and registration_agency = v_registration_agency;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.42.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","登记机构=",v_registration_agency),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","登记机构=",v_registration_agency);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_账户_证券账户信息表][{记录序号}][@记录序号#][{资产账户编号}=@资产账户编号# and {市场编号}=@市场编号# and {股东代码编号}=@股东代码编号# and {登记机构} = @登记机构#][4][@资产账户编号#,@市场编号#,@股东代码编号#,@登记机构#] */
    select row_id into v_row_id from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no=v_asset_acco_no and exch_no=v_exch_no and stock_acco_no=v_stock_acco_no and registration_agency = v_registration_agency limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.1.42.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码编号=",v_stock_acco_no,",","登记机构=",v_registration_agency),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码编号=",v_stock_acco_no,",","登记机构=",v_registration_agency);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量]; */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_stock_acco_no, "|", v_exch_no, "|", v_stock_acco_name, "|", v_stock_acco_apoint_status, "|", v_allow_stock_type, "|", v_busi_limit_str, "|", v_registration_agency, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改证券账户信息"; */
    set v_oper_remark_info = "修改证券账户信息";

    /* [插入表记录][产品证券_账户_证券账户信息流水表][字段][字段变量][5][@资产账户编号#,@股东代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseac_secu_acco_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, stock_acco_no, exch_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_stock_acco_no, v_exch_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.42.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_删除证券账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_DeleteSecuAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_DeleteSecuAccoInfo(
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
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
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
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_exch_no int;
    declare v_table_row_id bigint;
    declare v_stock_acco varchar(16);
    declare v_stock_acco_name varchar(64);
    declare v_stock_acco_status varchar(2);
    declare v_stock_acco_apoint_status varchar(2);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_limit_str varchar(2048);
    declare v_registration_agency varchar(32);
    declare v_tmp_remark_info varchar(255);
    declare v_table_field_value varchar(10000);
    declare v_table_uni_index_value varchar(10000);
    declare v_table_name varchar(64);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_posi_id bigint;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_exch_no = 0;
    SET v_table_row_id = 0;
    SET v_stock_acco = " ";
    SET v_stock_acco_name = " ";
    SET v_stock_acco_status = "0";
    SET v_stock_acco_apoint_status = "0";
    SET v_allow_stock_type = " ";
    SET v_busi_limit_str = " ";
    SET v_registration_agency = " ";
    SET v_tmp_remark_info = " ";
    SET v_table_field_value = " ";
    SET v_table_uni_index_value = " ";
    SET v_table_name = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_posi_id = 0;
    SET v_jour_after_occur_info = " ";

    
    label_pro:BEGIN
    

    /* set @流水变动字段# = " "; */
    set v_jour_occur_field = " ";

    /* set @流水变动信息# = " "; */
    set v_jour_occur_info = " ";

    /* [获取表记录变量][产品证券_账户_证券账户信息表][{市场编号},{记录序号},{股东代码},{股东代码名称},{股东代码状态},{股东指定状态},{允许操作证券类型},{业务限制串},{登记机构},{备注信息}][@市场编号#,@表记录序号#,@股东代码#,@股东代码名称#,@股东代码状态#,@股东指定状态#,@允许操作证券类型#,@业务限制串#,@登记机构#,@临时_备注信息#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号#][4][@资产账户编号#,@股东代码编号#] */
    select exch_no,row_id,stock_acco,stock_acco_name,stock_acco_status,stock_acco_apoint_status,allow_stock_type,busi_limit_str,registration_agency,remark_info into v_exch_no,v_table_row_id,v_stock_acco,v_stock_acco_name,v_stock_acco_status,v_stock_acco_apoint_status,v_allow_stock_type,v_busi_limit_str,v_registration_agency,v_tmp_remark_info from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.1.43.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no);
        end if;
        leave label_pro;
    end if;

    #删除流水记录

    /* set @表字段值# =  concat("|机构编号:",@机构编号#,"|产品编号:",@产品编号#,"|资产账户编号:",@资产账户编号#,"|股东代码编号:",@股东代码编号#,"|市场编号:",@市场编号#,"|股东代码:",@股东代码#,"|股东代码名称:",@股东代码名称#,"|股东代码状态:",@股东代码状态#,"|股东指定状态:",@股东指定状态#,"|允许操作证券类型:",@允许操作证券类型#,"|业务限制串:",@业务限制串#,"|登记机构:",@登记机构#,"|备注信息:",@临时_备注信息#); */
    set v_table_field_value =  concat("|机构编号:",v_co_no,"|产品编号:",v_pd_no,"|资产账户编号:",v_asset_acco_no,"|股东代码编号:",v_stock_acco_no,"|市场编号:",v_exch_no,"|股东代码:",v_stock_acco,"|股东代码名称:",v_stock_acco_name,"|股东代码状态:",v_stock_acco_status,"|股东指定状态:",v_stock_acco_apoint_status,"|允许操作证券类型:",v_allow_stock_type,"|业务限制串:",v_busi_limit_str,"|登记机构:",v_registration_agency,"|备注信息:",v_tmp_remark_info);

    /* set @表唯一索引值# = concat("|资产账户编号:",@资产账户编号#,"|市场编号:",@市场编号#,"|股东代码编号:",@股东代码编号#,"|登记机构:",@登记机构#); */
    set v_table_uni_index_value = concat("|资产账户编号:",v_asset_acco_no,"|市场编号:",v_exch_no,"|股东代码编号:",v_stock_acco_no,"|登记机构:",v_registration_agency);

    /* set @数据表名称# = "tb_pdseac_secu_acco"; */
    set v_table_name = "tb_pdseac_secu_acco";

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_账户_产品证券库删除流水表][字段][字段变量][5][@数据表名称#, @持仓序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_pdsecu_delete_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, table_name, 
        table_row_id, table_field_value, table_uni_index_value) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_table_name, 
        v_table_row_id, v_table_field_value, v_table_uni_index_value);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.43.5";
        SET v_error_info =  CONCAT(concat("数据表名称=",v_table_name,","," 持仓序号=", v_posi_id),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_账户_证券账户信息表][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号#][3][@资产账户编号#,@股东代码编号#] */
    delete from db_pdsecu.tb_pdseac_secu_acco 
        where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.1.43.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# = " " ; */
    set v_jour_after_occur_info = " " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_账户_证券账户信息流水表][字段][字段变量][5][@资产账户编号#,@股东代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseac_secu_acco_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, stock_acco_no, exch_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_stock_acco_no, v_exch_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.43.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_查询证券账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_QuerySecuAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_QuerySecuAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_status_str varchar(64),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_status_str varchar(64);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_status_str = p_stock_acco_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_账户_证券账户信息表][字段][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (instr(@产品编号权限串#, concat(";",{产品编号},";")) > 0 or @产品编号权限串# = "; ;") and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@股东代码编号# = 0 or {股东代码编号}=@股东代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号},";"))>0) and (@股东代码状态串# = "; ;" or instr(@股东代码状态串#, concat(";", {股东代码状态},";"))>0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, stock_acco_no, exch_no, 
        stock_acco, stock_acco_name, stock_acco_status, stock_acco_apoint_status, 
        allow_stock_type, busi_limit_str, registration_agency, remark_info from db_pdsecu.tb_pdseac_secu_acco where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 or v_pd_no_rights_str = "; ;") and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_stock_acco_no = 0 or stock_acco_no=v_stock_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no,";"))>0) and (v_stock_acco_status_str = "; ;" or instr(v_stock_acco_status_str, concat(";", stock_acco_status,";"))>0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, stock_acco_no, exch_no, 
        stock_acco, stock_acco_name, stock_acco_status, stock_acco_apoint_status, 
        allow_stock_type, busi_limit_str, registration_agency, remark_info from db_pdsecu.tb_pdseac_secu_acco where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 or v_pd_no_rights_str = "; ;") and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_stock_acco_no = 0 or stock_acco_no=v_stock_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no,";"))>0) and (v_stock_acco_status_str = "; ;" or instr(v_stock_acco_status_str, concat(";", stock_acco_status,";"))>0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_查询证券账户信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_QuerySecuAccoInfoJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_QuerySecuAccoInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_账户_证券账户信息流水表][字段][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@股东代码编号# = 0 or {股东代码编号}=@股东代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号},";"))>0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, stock_acco_no, 
        exch_no, jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdsecu.tb_pdseac_secu_acco_jour where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_stock_acco_no = 0 or stock_acco_no=v_stock_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no,";"))>0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, stock_acco_no, 
        exch_no, jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdsecu.tb_pdseac_secu_acco_jour where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_stock_acco_no = 0 or stock_acco_no=v_stock_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no,";"))>0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_查询历史证券账户信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_QuerySecuAccoInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_QuerySecuAccoInfoJour_His(
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
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品证券_账户_证券账户信息流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@股东代码编号# = 0 or {股东代码编号}=@股东代码编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号},";"))>0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, stock_acco_no, 
        exch_no, jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdsecu_his.tb_pdseac_secu_acco_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_stock_acco_no = 0 or stock_acco_no=v_stock_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no,";"))>0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, stock_acco_no, 
        exch_no, jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdsecu_his.tb_pdseac_secu_acco_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_stock_acco_no = 0 or stock_acco_no=v_stock_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no,";"))>0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_更新证券账户状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_UpdateSecuAccoStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_UpdateSecuAccoStatus(
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
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_stock_acco_status varchar(2),
    IN p_registration_agency varchar(32),
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
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco_status varchar(2);
    declare v_registration_agency varchar(32);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_exch_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco_status = p_stock_acco_status;
    SET v_registration_agency = p_registration_agency;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_exch_no = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][{股东代码状态}][@股东代码状态#]; */
    set v_jour_occur_field = concat("股东代码状态","|");
    set v_jour_occur_info = concat(v_stock_acco_status,"|");


    /* [更新表记录][产品证券_账户_证券账户信息表][{股东代码状态}=@股东代码状态#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {登记机构} = @登记机构#][2][@资产账户编号#,@股东代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseac_secu_acco set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_acco_status=v_stock_acco_status where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and registration_agency = v_registration_agency;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.47.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_账户_证券账户信息表][{股东代码状态},{市场编号}][@股东代码状态#,@市场编号#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {登记机构} = @登记机构#][4][@资产账户编号#,@股东代码编号#] */
    select stock_acco_status,exch_no into v_stock_acco_status,v_exch_no from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and registration_agency = v_registration_agency limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.1.47.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@股东代码状态#]; */
    set v_jour_after_occur_info = concat(v_stock_acco_status,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "更新证券账户状态"; */
    set v_oper_remark_info = "更新证券账户状态";

    /* [插入表记录][产品证券_账户_证券账户信息流水表][字段][字段变量][5][@资产账户编号#,@股东代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseac_secu_acco_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, stock_acco_no, exch_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_stock_acco_no, v_exch_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.47.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_检查证券账户状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_CheckSecuAccoStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_CheckSecuAccoStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_stock_acco_status varchar(2),
    IN p_registration_agency varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco_status varchar(2);
    declare v_registration_agency varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_tmp_stock_acco_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco_status = p_stock_acco_status;
    SET v_registration_agency = p_registration_agency;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_tmp_stock_acco_status = "0";

    
    label_pro:BEGIN
    
    #对证券账户状态进行检查

    /* [获取表记录变量][产品证券_账户_证券账户信息表][{股东代码状态},{机构编号}][@临时_股东代码状态#,@机构编号#][{产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {登记机构} = @登记机构#][4][@产品编号#,@资产账户编号#,@股东代码编号#,@登记机构#] */
    select stock_acco_status,co_no into v_tmp_stock_acco_status,v_co_no from db_pdsecu.tb_pdseac_secu_acco where pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and registration_agency = v_registration_agency limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.1.48.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","登记机构=",v_registration_agency),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","登记机构=",v_registration_agency);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@股东代码状态# = 0 and @临时_股东代码状态# = 《股东代码状态-冻结》][141][@资产账户编号#,@股东代码编号#,@股东代码状态#,@临时_股东代码状态#] */
    if v_stock_acco_status = 0 and v_tmp_stock_acco_status = "2" then
        
        SET v_error_code = "pdsecuA.1.48.141";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","股东代码状态=",v_stock_acco_status,",","临时_股东代码状态=",v_tmp_stock_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","股东代码状态=",v_stock_acco_status,",","临时_股东代码状态=",v_tmp_stock_acco_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@股东代码状态# = 0 and @临时_股东代码状态# = 《股东代码状态-注销》][142][@资产账户编号#,@股东代码编号#,@股东代码状态#,@临时_股东代码状态#] */
    if v_stock_acco_status = 0 and v_tmp_stock_acco_status = "3" then
        
        SET v_error_code = "pdsecuA.1.48.142";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","股东代码状态=",v_stock_acco_status,",","临时_股东代码状态=",v_tmp_stock_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","股东代码状态=",v_stock_acco_status,",","临时_股东代码状态=",v_tmp_stock_acco_status);
        end if;
        leave label_pro;
    end if;

    #冻结产品证券账户检查

    /* [检查报错返回][@股东代码状态# = 《股东代码状态-冻结》 and @临时_股东代码状态# = 《股东代码状态-冻结》][141][@资产账户编号#,@股东代码编号#,@股东代码状态#,@临时_股东代码状态#] */
    if v_stock_acco_status = "2" and v_tmp_stock_acco_status = "2" then
        
        SET v_error_code = "pdsecuA.1.48.141";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","股东代码状态=",v_stock_acco_status,",","临时_股东代码状态=",v_tmp_stock_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","股东代码状态=",v_stock_acco_status,",","临时_股东代码状态=",v_tmp_stock_acco_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@股东代码状态# = 《股东代码状态-冻结》 and @临时_股东代码状态# = 《股东代码状态-注销》][142][@资产账户编号#,@股东代码编号#,@股东代码状态#,@临时_股东代码状态#] */
    if v_stock_acco_status = "2" and v_tmp_stock_acco_status = "3" then
        
        SET v_error_code = "pdsecuA.1.48.142";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","股东代码状态=",v_stock_acco_status,",","临时_股东代码状态=",v_tmp_stock_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","股东代码状态=",v_stock_acco_status,",","临时_股东代码状态=",v_tmp_stock_acco_status);
        end if;
        leave label_pro;
    end if;

    #恢复产品证券账户检查

    /* [检查报错返回][@股东代码状态# = 《股东代码状态-正常》 and @临时_股东代码状态# = 《股东代码状态-正常》][143][@资产账户编号#,@股东代码编号#,@股东代码状态#,@临时_股东代码状态#] */
    if v_stock_acco_status = "1" and v_tmp_stock_acco_status = "1" then
        
        SET v_error_code = "pdsecuA.1.48.143";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","股东代码状态=",v_stock_acco_status,",","临时_股东代码状态=",v_tmp_stock_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","股东代码状态=",v_stock_acco_status,",","临时_股东代码状态=",v_tmp_stock_acco_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@股东代码状态# = 《股东代码状态-正常》 and @临时_股东代码状态# = 《股东代码状态-注销》][142][@资产账户编号#,@股东代码编号#,@股东代码状态#,@临时_股东代码状态#] */
    if v_stock_acco_status = "1" and v_tmp_stock_acco_status = "3" then
        
        SET v_error_code = "pdsecuA.1.48.142";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","股东代码状态=",v_stock_acco_status,",","临时_股东代码状态=",v_tmp_stock_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","股东代码状态=",v_stock_acco_status,",","临时_股东代码状态=",v_tmp_stock_acco_status);
        end if;
        leave label_pro;
    end if;

    #注销产品证券账户检查

    /* [检查报错返回][@股东代码状态# = 《股东代码状态-注销》 and @临时_股东代码状态# = 《股东代码状态-冻结》][141][@资产账户编号#,@股东代码编号#,@股东代码状态#,@临时_股东代码状态#] */
    if v_stock_acco_status = "3" and v_tmp_stock_acco_status = "2" then
        
        SET v_error_code = "pdsecuA.1.48.141";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","股东代码状态=",v_stock_acco_status,",","临时_股东代码状态=",v_tmp_stock_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","股东代码状态=",v_stock_acco_status,",","临时_股东代码状态=",v_tmp_stock_acco_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@股东代码状态# = 《股东代码状态-注销》 and @临时_股东代码状态# = 《股东代码状态-注销》][142][@资产账户编号#,@股东代码编号#,@股东代码状态#,@临时_股东代码状态#] */
    if v_stock_acco_status = "3" and v_tmp_stock_acco_status = "3" then
        
        SET v_error_code = "pdsecuA.1.48.142";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","股东代码状态=",v_stock_acco_status,",","临时_股东代码状态=",v_tmp_stock_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","股东代码状态=",v_stock_acco_status,",","临时_股东代码状态=",v_tmp_stock_acco_status);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_查询证券账户列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_QuerySecuAccoList;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_QuerySecuAccoList(
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
    

    /* [获取表全记录][产品证券_账户_证券账户信息表][字段][{机构编号}=@操作员机构编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, stock_acco_no, exch_no, 
        stock_acco, stock_acco_name, stock_acco_status, stock_acco_apoint_status, 
        allow_stock_type, busi_limit_str, registration_agency, remark_info from db_pdsecu.tb_pdseac_secu_acco where co_no=v_opor_co_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_新增证券账户自动打新配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_InsertSecuAccoNewStockConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_InsertSecuAccoNewStockConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_target_opor_no int,
    IN p_begin_time int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_target_opor_no int;
    declare v_begin_time int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_target_opor_no = p_target_opor_no;
    SET v_begin_time = p_begin_time;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @操作员编号# = @目标操作员编号#; */
    set v_opor_no = v_target_opor_no;

    /* [插入表记录][产品证券_账户_证券账户自动打新配置表][字段][字段变量][1][@机构编号#,@产品编号#,@资产账户编号#,@股东代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseac_secu_acco_new_stock_config(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, stock_acco_no, exch_no, opor_no, 
        begin_time) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_stock_acco_no, v_exch_no, v_opor_no, 
        v_begin_time);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.61.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_更新证券账户自动打新配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_UpdateSecuAccoNewStockConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_UpdateSecuAccoNewStockConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_acco_no int,
    IN p_target_opor_no int,
    IN p_begin_time int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_acco_no int;
    declare v_target_opor_no int;
    declare v_begin_time int;
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_target_opor_no = p_target_opor_no;
    SET v_begin_time = p_begin_time;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_账户_证券账户自动打新配置表][{操作员编号}=@目标操作员编号#, {开始时间}=@开始时间#][{股东代码编号}=@股东代码编号#][2][@股东代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseac_secu_acco_new_stock_config set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, opor_no=v_target_opor_no, begin_time=v_begin_time where stock_acco_no=v_stock_acco_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.62.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("股东代码编号=",v_stock_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_删除证券账户自动打新配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_DeleteSecuAccoNewStockConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_DeleteSecuAccoNewStockConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_acco_no int;
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][产品证券_账户_证券账户自动打新配置表][{股东代码编号}=@股东代码编号#][3][@股东代码编号#] */
    delete from db_pdsecu.tb_pdseac_secu_acco_new_stock_config 
        where stock_acco_no=v_stock_acco_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.1.63.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("股东代码编号=",v_stock_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_查询证券账户自动打新配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_QuerySecuAccoNewStockConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_QuerySecuAccoNewStockConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录两表关联][产品证券_账户_证券账户自动打新配置表][产品证券_账户_证券账户信息表][a.{记录序号},a.{机构编号},a.{产品编号},a.{资产账户编号},a.{股东代码编号},a.{市场编号},a.{操作员编号},a.{开始时间}][(@机构编号#=0 or a.{机构编号}=@机构编号#) and (@产品编号#=0 or a.{产品编号}=@产品编号#) and (@资产账户编号#=0 or a.{资产账户编号}=@资产账户编号#) and (@市场编号#=0 or a.{市场编号}=@市场编号#) and (@股东代码编号#=0 or a.{股东代码编号}=@股东代码编号#) and a.{记录序号}>@记录序号# and a.{股东代码编号}=b.{股东代码编号} and a.{资产账户编号}=b.{资产账户编号} and instr(b.{业务限制串},《业务限制-限制打新》)=0 and b.{股东代码状态}=《股东代码状态-正常》][@指定行数#] */
    if v_row_count = -1 then
        select a.row_id,a.co_no,a.pd_no,a.asset_acco_no,a.stock_acco_no,a.exch_no,a.opor_no,a.begin_time from db_pdsecu.tb_pdseac_secu_acco_new_stock_config a,db_pdsecu.tb_pdseac_secu_acco b where (v_co_no=0 or a.co_no=v_co_no) and (v_pd_no=0 or a.pd_no=v_pd_no) and (v_asset_acco_no=0 or a.asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or a.exch_no=v_exch_no) and (v_stock_acco_no=0 or a.stock_acco_no=v_stock_acco_no) and a.row_id>v_row_id and a.stock_acco_no=b.stock_acco_no and a.asset_acco_no=b.asset_acco_no and instr(b.busi_limit_str,1)=0 and b.stock_acco_status="1";
    else
        select a.row_id,a.co_no,a.pd_no,a.asset_acco_no,a.stock_acco_no,a.exch_no,a.opor_no,a.begin_time from db_pdsecu.tb_pdseac_secu_acco_new_stock_config a,db_pdsecu.tb_pdseac_secu_acco b where (v_co_no=0 or a.co_no=v_co_no) and (v_pd_no=0 or a.pd_no=v_pd_no) and (v_asset_acco_no=0 or a.asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or a.exch_no=v_exch_no) and (v_stock_acco_no=0 or a.stock_acco_no=v_stock_acco_no) and a.row_id>v_row_id and a.stock_acco_no=b.stock_acco_no and a.asset_acco_no=b.asset_acco_no and instr(b.busi_limit_str,1)=0 and b.stock_acco_status="1" limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_检查组合对应交易组存在
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_CheckComboExgpExists;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_CheckComboExgpExists(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_combo_code varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_no int,
    OUT p_pd_no int
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
    declare v_combo_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no int;
    declare v_pd_no int;
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
    SET v_combo_code = p_combo_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;
    SET v_pd_no = 0;
    SET v_row_id = 0;

    
    label_pro:BEGIN
    
    #先去当前表中获取组合代码对应的交易组,如果当前表中找不到记录,那就去历史表中找,如果历史表还找不到记录,那就是这个组合,没有对应的交易组

    /* [获取表记录变量语句][产品证券_账户_组合交易组表][{记录序号},{产品编号},{交易组编号}][@记录序号#,@产品编号#,@交易组编号#][{机构编号}=@机构编号# and {组合代码}=@组合代码# and {交易组编号}<>0 and {证券代码编号}<>0] */
    select row_id,pd_no,exch_group_no into v_row_id,v_pd_no,v_exch_group_no from db_pdsecu.tb_pdseac_Comb_Exgp where co_no=v_co_no and combo_code=v_combo_code and exch_group_no<>0 and stock_code_no<>0 limit 1;


    /* if @记录序号#=0 then */
    if v_row_id=0 then

        /* [获取表记录变量语句][历史_产品证券_账户_组合交易组表][{记录序号},{产品编号},{交易组编号}][@记录序号#,@产品编号#,@交易组编号#][{机构编号}=@机构编号# and {组合代码}=@组合代码# and {交易组编号}<>0 and {证券代码编号}<>0] */
        select row_id,pd_no,exch_group_no into v_row_id,v_pd_no,v_exch_group_no from db_pdsecu_his.tb_pdseac_Comb_Exgp_his where co_no=v_co_no and combo_code=v_combo_code and exch_group_no<>0 and stock_code_no<>0 limit 1;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;
    SET p_pd_no = v_pd_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_归档产品证券账户数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_BackUpPdSecuAccoData;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_BackUpPdSecuAccoData(
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
    

    /* [数据归历史][产品证券_账户_证券账户信息流水表][字段][{初始化日期}<=@初始化日期#][301][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseac_secu_acco_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, stock_acco_no, 
        exch_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, stock_acco_no, 
        exch_no, jour_occur_field, jour_after_occur_info, oper_remark_info 
        from db_pdsecu.tb_pdseac_secu_acco_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.99.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_账户_证券账户信息流水表][{初始化日期}<=@初始化日期#][302][@初始化日期#] */
    delete from db_pdsecu.tb_pdseac_secu_acco_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.1.99.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_账户_组合交易组表][字段][{组合状态}=《组合状态-失效》 and {交易组编号}<>0 and {证券代码编号}<>0][302][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseac_Comb_Exgp_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, combo_code, stock_code_no, 
        posi_qty, deal_status, combo_status) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, combo_code, stock_code_no, 
        posi_qty, deal_status, combo_status 
        from db_pdsecu.tb_pdseac_Comb_Exgp 
        where combo_status="2" and exch_group_no<>0 and stock_code_no<>0;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.99.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_账户_组合交易组表][{组合状态}=《组合状态-失效》 and {交易组编号}<>0 and {证券代码编号}<>0][301][@初始化日期#] */
    delete from db_pdsecu.tb_pdseac_Comb_Exgp 
        where combo_status="2" and exch_group_no<>0 and stock_code_no<>0;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.1.99.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_账户_产品证券库删除流水表][字段][{初始化日期}<=@初始化日期#][302c][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_pdsecu_delete_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        table_name, table_row_id, table_field_value, table_uni_index_value) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        table_name, table_row_id, table_field_value, table_uni_index_value 
        from db_pdsecu.tb_pdseca_pdsecu_delete_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.99.302c";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_账户_产品证券库删除流水表][{初始化日期}<=@初始化日期#][301c][@初始化日期#] */
    delete from db_pdsecu.tb_pdseca_pdsecu_delete_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.1.99.301c";
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
use db_pdsecu;;

# 原子_产品证券_账户_查询报盘所需证券账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_QueryStockAccoByTrans;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_QueryStockAccoByTrans(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no_str varchar(2048);
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
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][产品证券_账户_证券账户信息表][{资产账户编号},{股东代码编号},{市场编号},{股东代码}][instr(@资产账户编号串#,concat(";",{资产账户编号},";"))>0 and {股东代码状态}=《股东代码状态-正常》 order by {资产账户编号}] */
    select asset_acco_no,stock_acco_no,exch_no,stock_acco from db_pdsecu.tb_pdseac_secu_acco where instr(v_asset_acco_no_str,concat(";",asset_acco_no,";"))>0 and stock_acco_status="1" order by asset_acco_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_获取港股通代码股东市场编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_GetHKCodeExchNo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_GetHKCodeExchNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_stock_acco varchar(16),
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_stock_acco varchar(16);
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_acco = p_stock_acco;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [表记录变量不检验][产品证券_账户_证券账户信息表][count(1)][@记录个数#][{资产账户编号}=@资产账户编号# and {市场编号} =@市场编号# and {股东代码}=@股东代码# and {股东代码状态}<>《股东代码状态-注销》] */
    select count(1) into v_record_count from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no=v_asset_acco_no and exch_no =v_exch_no and stock_acco=v_stock_acco and stock_acco_status<>"3" limit 1;


    /* [检查报错返回][@记录个数# = 0][85][@股东代码#,@市场编号#] */
    if v_record_count = 0 then
        
        SET v_error_code = "pdsecuA.1.502.85";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("股东代码=",v_stock_acco,",","市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("股东代码=",v_stock_acco,",","市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@记录个数# > 1][86][@股东代码#,@市场编号#] */
    if v_record_count > 1 then
        
        SET v_error_code = "pdsecuA.1.502.86";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("股东代码=",v_stock_acco,",","市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("股东代码=",v_stock_acco,",","市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_更新证券账户股东信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_UpdateSecuAccoStockHoldersInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_UpdateSecuAccoStockHoldersInfo(
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
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_acco_no int,
    IN p_stock_acco_name varchar(64),
    IN p_stock_acco_status varchar(2),
    IN p_stock_acco_apoint_status varchar(2),
    IN p_allow_stock_type varchar(2048),
    IN p_busi_limit_str varchar(2048),
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_stock_acco_name varchar(64);
    declare v_stock_acco_status varchar(2);
    declare v_stock_acco_apoint_status varchar(2);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_limit_str varchar(2048);
    declare v_remark_info varchar(255);
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco_name = p_stock_acco_name;
    SET v_stock_acco_status = p_stock_acco_status;
    SET v_stock_acco_apoint_status = p_stock_acco_apoint_status;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_remark_info = p_remark_info;
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
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量]; */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "资产账户编号", "|", "市场编号", "|", "股东代码", "|", "股东代码编号", "|", "股东代码名称", "|", "股东代码状态", "|", "股东指定状态", "|", "允许操作证券类型", "|", "业务限制串", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_exch_no, "|", v_stock_acco, "|", v_stock_acco_no, "|", v_stock_acco_name, "|", v_stock_acco_status, "|", v_stock_acco_apoint_status, "|", v_allow_stock_type, "|", v_busi_limit_str, "|", v_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][产品证券_账户_证券账户信息表][{股东代码}=@股东代码#,{股东代码编号}=@股东代码编号#,{股东代码名称}=@股东代码名称#,{股东代码状态}=@股东代码状态#, {股东指定状态}=@股东指定状态#,{备注信息}=@备注信息#][{资产账户编号}=@资产账户编号# and {市场编号}=@市场编号#][2][@资产账户编号#,@市场编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseac_secu_acco set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_acco=v_stock_acco,stock_acco_no=v_stock_acco_no,stock_acco_name=v_stock_acco_name,stock_acco_status=v_stock_acco_status, stock_acco_apoint_status=v_stock_acco_apoint_status,remark_info=v_remark_info where asset_acco_no=v_asset_acco_no and exch_no=v_exch_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.711.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_账户_证券账户信息表][{记录序号}][@记录序号#][{资产账户编号}=@资产账户编号# and {市场编号}=@市场编号# and {股东代码编号}=@股东代码编号#][4][@资产账户编号#,@市场编号#,@股东代码编号#] */
    select row_id into v_row_id from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no=v_asset_acco_no and exch_no=v_exch_no and stock_acco_no=v_stock_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.1.711.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码编号=",v_stock_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量]; */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_exch_no, "|", v_stock_acco, "|", v_stock_acco_no, "|", v_stock_acco_name, "|", v_stock_acco_status, "|", v_stock_acco_apoint_status, "|", v_allow_stock_type, "|", v_busi_limit_str, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "同步更新证券账户信息"; */
    set v_oper_remark_info = "同步更新证券账户信息";

    /* [插入表记录][产品证券_账户_证券账户信息流水表][字段][字段变量][5][@资产账户编号#,@市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseac_secu_acco_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, stock_acco_no, exch_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_stock_acco_no, v_exch_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.711.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_判断和获取证券账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_JudgeAndGetSecuAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_JudgeAndGetSecuAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_stock_acco_no int
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
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_stock_acco_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_stock_acco_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录数量][产品证券_账户_证券账户信息表][@记录个数#][{资产账户编号}=@资产账户编号# and {市场编号}=@市场编号#] */
    select count(1) into v_record_count from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no=v_asset_acco_no and exch_no=v_exch_no;


    /* if @记录个数# > 0 then */
    if v_record_count > 0 then

           /* [获取表记录变量语句][产品证券_账户_证券账户信息表][{股东代码编号}][@股东代码编号#][{资产账户编号}=@资产账户编号# and {市场编号}=@市场编号#] */
           select stock_acco_no into v_stock_acco_no from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no=v_asset_acco_no and exch_no=v_exch_no limit 1;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;
    SET p_stock_acco_no = v_stock_acco_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_同步新增证券账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_SyncAddSecuAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_SyncAddSecuAccoInfo(
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
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_acco_name varchar(64),
    IN p_stock_acco_status varchar(2),
    IN p_stock_acco_apoint_status varchar(2),
    IN p_allow_stock_type varchar(2048),
    IN p_busi_limit_str varchar(2048),
    IN p_registration_agency varchar(32),
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
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_acco_name varchar(64);
    declare v_stock_acco_status varchar(2);
    declare v_stock_acco_apoint_status varchar(2);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_limit_str varchar(2048);
    declare v_registration_agency varchar(32);
    declare v_remark_info varchar(255);
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_acco_name = p_stock_acco_name;
    SET v_stock_acco_status = p_stock_acco_status;
    SET v_stock_acco_apoint_status = p_stock_acco_apoint_status;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_registration_agency = p_registration_agency;
    SET v_remark_info = p_remark_info;
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
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "资产账户编号", "|", "股东代码编号", "|", "市场编号", "|", "股东代码", "|", "股东代码名称", "|", "股东代码状态", "|", "股东指定状态", "|", "允许操作证券类型", "|", "业务限制串", "|", "登记机构", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_stock_acco_no, "|", v_exch_no, "|", v_stock_acco, "|", v_stock_acco_name, "|", v_stock_acco_status, "|", v_stock_acco_apoint_status, "|", v_allow_stock_type, "|", v_busi_limit_str, "|", v_registration_agency, "|", v_remark_info, "|", v_menu_no, "|");


    /* [插入表记录][产品证券_账户_证券账户信息表][字段][字段变量][1][@资产账户编号#,@市场编号#,@股东代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseac_secu_acco(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, stock_acco_no, exch_no, stock_acco, 
        stock_acco_name, stock_acco_status, stock_acco_apoint_status, allow_stock_type, 
        busi_limit_str, registration_agency, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_stock_acco_no, v_exch_no, v_stock_acco, 
        v_stock_acco_name, v_stock_acco_status, v_stock_acco_apoint_status, v_allow_stock_type, 
        v_busi_limit_str, v_registration_agency, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.713.1";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_stock_acco_no, "|", v_exch_no, "|", v_stock_acco, "|", v_stock_acco_name, "|", v_stock_acco_status, "|", v_stock_acco_apoint_status, "|", v_allow_stock_type, "|", v_busi_limit_str, "|", v_registration_agency, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "同步新增证券账户信息"; */
    set v_oper_remark_info = "同步新增证券账户信息";

    /* [插入表记录][产品证券_账户_证券账户信息流水表][字段][字段变量][5][@资产账户编号#,@市场编号#,@股东代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseac_secu_acco_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, stock_acco_no, exch_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_stock_acco_no, v_exch_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.713.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_判断资产账户能否注销
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_CheckAsacIfCance;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_CheckAsacIfCance(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int
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
    declare v_asset_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_invest_type int;
    declare v_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_pre_settle_amt decimal(18,4);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_invest_type = 0;
    SET v_crncy_type = "CNY";
    SET v_row_id = 0;
    SET v_pre_settle_amt = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @记录个数#=0; */
    set v_record_count=0;

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";
        #先校验资金是否有待交收金额

        /* [获取表记录变量语句][产品证券_资金_资产账户资金表][{记录序号},{待交收金额}][@记录序号#,@待交收金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
        select row_id,pre_settle_amt into v_row_id,v_pre_settle_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

           #如果有待交收金额,则不允许注销交易组

          /* if (@记录序号#<>0 and @待交收金额#<>0) then */
          if (v_row_id<>0 and v_pre_settle_amt<>0) then

            /* set @记录个数#=1; */
            set v_record_count=1;
          end if;
        #然后校验持仓是否有待交收数量和冻结数量

        /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][sum({记录序号}),sum({待交收数量}),sum({冻结数量}),sum({解冻数量})][@记录序号#,@待交收数量#,@冻结数量#,@解冻数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}<>0 and {证券代码编号}<>" " and {投资类型}=@投资类型#] */
        select sum(row_id),sum(pre_settle_qty),sum(frozen_qty),sum(unfroz_qty) into v_row_id,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no<>0 and stock_code_no<>" " and invest_type=v_invest_type limit 1;

        #若有待交收数量或者冻结数量,则不允许注销交易组

        /* if (@记录序号#<>0 and (@待交收数量#<>0 or @冻结数量#<>0 or @解冻数量#<>0)) then */
        if (v_row_id<>0 and (v_pre_settle_qty<>0 or v_frozen_qty<>0 or v_unfroz_qty<>0)) then

            /* set @记录个数#=1; */
            set v_record_count=1;
          end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_注销资产账户回退资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_CancelAsacRollBackCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_CancelAsacRollBackCapital(
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
    IN p_asset_acco_no int,
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_amt decimal(18,4),
    OUT p_amt_check_diff decimal(18,4),
    OUT p_total_rece_amt decimal(18,4),
    OUT p_total_payab_amt decimal(18,4),
    OUT p_total_change_amt decimal(18,4)
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
    declare v_asset_acco_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_exch_group_no_str varchar(2048);
    declare v_tmp_curr_amt decimal(18,4);
    declare v_tmp_amt_check_diff decimal(18,4);
    declare v_tmp_total_rece_amt decimal(18,4);
    declare v_tmp_total_payab_amt decimal(18,4);
    declare v_tmp_total_change_amt decimal(18,4);
    declare v_row_id bigint;
    declare v_begin_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_exch_group_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_change_amt = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_group_no_str = " ";
    SET v_tmp_curr_amt = 0;
    SET v_tmp_amt_check_diff = 0;
    SET v_tmp_total_rece_amt = 0;
    SET v_tmp_total_payab_amt = 0;
    SET v_tmp_total_change_amt = 0;
    SET v_row_id = 0;
    SET v_begin_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    
    #转移资金

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @交易组编号串#=" "; */
    set v_exch_group_no_str=" ";

    /* set @临时_当前金额# = 0; */
    set v_tmp_curr_amt = 0;

    /* set @临时_金额核对差额# = 0; */
    set v_tmp_amt_check_diff = 0;

    /* set @临时_累计应收金额# = 0; */
    set v_tmp_total_rece_amt = 0;

    /* set @临时_累计应付金额# = 0; */
    set v_tmp_total_payab_amt = 0;

    /* set @临时_红冲蓝补金额# = 0; */
    set v_tmp_total_change_amt = 0;

    /* set @记录序号#=0; */
    set v_row_id=0;

    /* [获取表记录变量语句][产品证券_资金_资产账户资金表][{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{红冲蓝补金额},{实现盈亏},{利率},{利息积数},{待入账利息}][@记录序号#,@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#][{机构编号}=@机构编号# and  {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
    select row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_rece_amt,total_payab_amt,total_change_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt into v_row_id,v_begin_amt,v_curr_amt,v_frozen_amt,v_unfroz_amt,v_pre_settle_amt,v_shsz_avail_change_amt,v_hk_avail_change_amt,v_amt_check_diff,v_T_hk_buy_total_amt,v_T_hk_sell_total_amt,v_T1_hk_buy_total_amt,v_T1_hk_sell_total_amt,v_total_rece_amt,v_total_payab_amt,v_total_change_amt,v_realize_pandl,v_intrst_rate,v_intrst_base_amt,v_pre_entry_intrst_amt from db_pdsecu.tb_pdseca_asac_capit where co_no=v_co_no and  asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


    /* set @临时_当前金额# = @当前金额#; */
    set v_tmp_curr_amt = v_curr_amt;

    /* set @临时_金额核对差额# = @金额核对差额#; */
    set v_tmp_amt_check_diff = v_amt_check_diff;

    /* set @临时_累计应收金额# = @累计应收金额#; */
    set v_tmp_total_rece_amt = v_total_rece_amt;

    /* set @临时_累计应付金额# = @累计应付金额#; */
    set v_tmp_total_payab_amt = v_total_payab_amt;

    /* set @临时_红冲蓝补金额# = @红冲蓝补金额#; */
    set v_tmp_total_change_amt = v_total_change_amt;

    /* [获取流水变动][{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{红冲蓝补金额},{实现盈亏},{利率},{利息积数},{待入账利息}][@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#] */
    set v_jour_occur_field = concat("期初金额","|","当前金额","|","冻结金额","|","解冻金额","|","待交收金额","|","沪深可用调整金额","|","港股通可用调整金额","|","金额核对差额","|","T日当日港股买入金额","|","T日当日港股卖出金额","|","T1日当日港股买入金额","|","T1日当日港股卖出金额","|","累计应收金额","|","累计应付金额","|","红冲蓝补金额","|","实现盈亏","|","利率","|","利息积数","|","待入账利息","|");
    set v_jour_occur_info = concat(v_begin_amt,"|",v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|",v_pre_settle_amt,"|",v_shsz_avail_change_amt,"|",v_hk_avail_change_amt,"|",v_amt_check_diff,"|",v_T_hk_buy_total_amt,"|",v_T_hk_sell_total_amt,"|",v_T1_hk_buy_total_amt,"|",v_T1_hk_sell_total_amt,"|",v_total_rece_amt,"|",v_total_payab_amt,"|",v_total_change_amt,"|",v_realize_pandl,"|",v_intrst_rate,"|",v_intrst_base_amt,"|",v_pre_entry_intrst_amt,"|");


    /* if @记录序号#<>0 then */
    if v_row_id<>0 then

          /* [更新表记录][产品证券_资金_资产账户资金表][{期初金额}=0,{当前金额}=0,{冻结金额}=0,{解冻金额}=0,{待交收金额}=0,{沪深可用调整金额}=0,{港股通可用调整金额}=0,{金额核对差额}=0,{T日当日港股买入金额}=0,{T日当日港股卖出金额}=0,{T1日当日港股买入金额}=0,{T1日当日港股卖出金额}=0,{累计应收金额}=0,{累计应付金额}=0,{红冲蓝补金额}=0,{实现盈亏}=0,{利率}=0,{利息积数}=0,{待入账利息}=0][{记录序号}=@记录序号#][2][@记录序号#] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt=0,curr_amt=0,frozen_amt=0,unfroz_amt=0,pre_settle_amt=0,shsz_avail_change_amt=0,hk_avail_change_amt=0,amt_check_diff=0,T_hk_buy_total_amt=0,T_hk_sell_total_amt=0,T1_hk_buy_total_amt=0,T1_hk_sell_total_amt=0,total_rece_amt=0,total_payab_amt=0,total_change_amt=0,realize_pandl=0,intrst_rate=0,intrst_base_amt=0,pre_entry_intrst_amt=0 where row_id=v_row_id;
          if v_error_code = "1" then
                      
              SET v_error_code = "pdsecuA.1.715.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
              else
                  SET v_error_info = concat("记录序号=",v_row_id);
              end if;
              leave label_pro;
          end if;


          /* [获取表记录变量语句][产品证券_资金_资产账户资金表][{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{红冲蓝补金额},{实现盈亏},{利率},{利息积数},{待入账利息}][@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#][{机构编号}=@机构编号# and  {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
          select begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_rece_amt,total_payab_amt,total_change_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt into v_begin_amt,v_curr_amt,v_frozen_amt,v_unfroz_amt,v_pre_settle_amt,v_shsz_avail_change_amt,v_hk_avail_change_amt,v_amt_check_diff,v_T_hk_buy_total_amt,v_T_hk_sell_total_amt,v_T1_hk_buy_total_amt,v_T1_hk_sell_total_amt,v_total_rece_amt,v_total_payab_amt,v_total_change_amt,v_realize_pandl,v_intrst_rate,v_intrst_base_amt,v_pre_entry_intrst_amt from db_pdsecu.tb_pdseca_asac_capit where co_no=v_co_no and  asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


          /* [获取流水后信息][@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#] */
          set v_jour_after_occur_info = concat(v_begin_amt,"|",v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|",v_pre_settle_amt,"|",v_shsz_avail_change_amt,"|",v_hk_avail_change_amt,"|",v_amt_check_diff,"|",v_T_hk_buy_total_amt,"|",v_T_hk_sell_total_amt,"|",v_T1_hk_buy_total_amt,"|",v_T1_hk_sell_total_amt,"|",v_total_rece_amt,"|",v_total_payab_amt,"|",v_total_change_amt,"|",v_realize_pandl,"|",v_intrst_rate,"|",v_intrst_base_amt,"|",v_pre_entry_intrst_amt,"|");


           /* set @变动金额#=-1*@临时_当前金额#; */
           set v_occur_amt=-1*v_tmp_curr_amt;

           /* set @变动后金额#=0; */
           set v_occur_end_amt=0;

           /* set @业务标志# = 《业务标志-资金回退》; */
           set v_busi_flag = 1005003;

           /* set @操作菜单# = @菜单编号#; */
           set v_oper_menu_no = v_menu_no;

           /* set @操作功能# = @功能编码#; */
           set v_oper_func_code = v_func_code;

           /* set @操作备注#="注销资产账户资金回退"; */
           set v_oper_remark_info="注销资产账户资金回退";

           /* [插入表记录][产品证券_资金_资产账户资金流水表][字段][字段变量][1][@本币币种#,@资产账户编号#] */
           set v_create_date = date_format(curdate(),'%Y%m%d');
           set v_create_time = date_format(curtime(),'%H%i%s');
           set v_update_date = v_create_date;
           set v_update_time = v_create_time;
           set v_update_times = 1;
           insert into db_pdsecu.tb_pdseca_asac_capit_jour(
               create_date, create_time, update_date, 
               update_time, update_times, opor_co_no, opor_no, 
               oper_mac, oper_ip_addr, oper_info, oper_way, 
               oper_menu_no, oper_func_code, init_date, co_no, 
               pd_no, asset_acco_no, crncy_type, busi_flag, 
               occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
               oper_remark_info) 
           value( 
               v_create_date, v_create_time, v_update_date, 
               v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
               v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
               v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
               v_pd_no, v_asset_acco_no, v_crncy_type, v_busi_flag, 
               v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
               v_oper_remark_info);
           if v_error_code = "1" then
                       
               SET v_error_code = "pdsecuA.1.715.1";
               SET v_error_info =  CONCAT(concat("本币币种=",v_crncy_type,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
               leave label_pro;
           end if;


           /* [获取表记录变量语句][产品证券_资金_资产账户资金表][{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{红冲蓝补金额},{实现盈亏},{利率},{利息积数},{待入账利息}][@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#][{机构编号}=@机构编号# and  {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
           select begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_rece_amt,total_payab_amt,total_change_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt into v_begin_amt,v_curr_amt,v_frozen_amt,v_unfroz_amt,v_pre_settle_amt,v_shsz_avail_change_amt,v_hk_avail_change_amt,v_amt_check_diff,v_T_hk_buy_total_amt,v_T_hk_sell_total_amt,v_T1_hk_buy_total_amt,v_T1_hk_sell_total_amt,v_total_rece_amt,v_total_payab_amt,v_total_change_amt,v_realize_pandl,v_intrst_rate,v_intrst_base_amt,v_pre_entry_intrst_amt from db_pdsecu.tb_pdseca_asac_capit where co_no=v_co_no and  asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


           /* [声明游标][产品证券_资金_交易组资金表][字段][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][cursor_exgpcapital] */
           cursor_exgpcapital:BEGIN
           DECLARE v_cursor_done int default false;
           DECLARE cursor_exgpcapital CURSOR FOR
               select row_id, create_date, create_time, 
               update_date, update_time, update_times, co_no, 
               pd_no, asset_acco_no, exch_group_no, crncy_type, 
               begin_amt, curr_amt, frozen_amt, unfroz_amt, 
               pre_settle_amt, shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, 
               T_hk_buy_total_amt, T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, 
               total_rece_amt, total_payab_amt, total_change_amt, realize_pandl, 
               intrst_rate, intrst_base_amt, pre_entry_intrst_amt 
               from db_pdsecu.tb_pdseca_exgp_capit 
               where co_no = v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
           DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


           /* [打开游标][字段变量][cursor_exgpcapital][loop_exgpcapital] */
           open cursor_exgpcapital;
           loop_exgpcapital: LOOP
           fetch cursor_exgpcapital into v_row_id, v_create_date, v_create_time, 
               v_update_date, v_update_time, v_update_times, v_co_no, 
               v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
               v_begin_amt, v_curr_amt, v_frozen_amt, v_unfroz_amt, 
               v_pre_settle_amt, v_shsz_avail_change_amt, v_hk_avail_change_amt, v_amt_check_diff, 
               v_T_hk_buy_total_amt, v_T_hk_sell_total_amt, v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, 
               v_total_rece_amt, v_total_payab_amt, v_total_change_amt, v_realize_pandl, 
               v_intrst_rate, v_intrst_base_amt, v_pre_entry_intrst_amt;
               IF v_cursor_done THEN
                   LEAVE loop_exgpcapital;
               END IF;


                  /* [更新表记录][产品证券_资金_交易组资金表][{期初金额}=0,{当前金额}=0,{冻结金额}=0,{解冻金额}=0,{待交收金额}=0,{沪深可用调整金额}=0,{港股通可用调整金额}=0,{金额核对差额}=0,{T日当日港股买入金额}=0,{T日当日港股卖出金额}=0,{T1日当日港股买入金额}=0,{T1日当日港股卖出金额}=0,{累计应收金额}=0,{累计应付金额}=0,{红冲蓝补金额}=0,{实现盈亏}=0,{利率}=0,{利息积数}=0,{待入账利息}=0][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@交易组编号#,@资产账户编号#,@本币币种#] */
                  set v_update_date = date_format(curdate(),'%Y%m%d');
                  set v_update_time = date_format(curtime(),'%H%i%s');
                  update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt=0,curr_amt=0,frozen_amt=0,unfroz_amt=0,pre_settle_amt=0,shsz_avail_change_amt=0,hk_avail_change_amt=0,amt_check_diff=0,T_hk_buy_total_amt=0,T_hk_sell_total_amt=0,T1_hk_buy_total_amt=0,T1_hk_sell_total_amt=0,total_rece_amt=0,total_payab_amt=0,total_change_amt=0,realize_pandl=0,intrst_rate=0,intrst_base_amt=0,pre_entry_intrst_amt=0 where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
                  if v_error_code = "1" then
                              
                      SET v_error_code = "pdsecuA.1.715.2";
                      if v_mysql_message <> "" then
                          SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                      else
                          SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                      end if;
                      close cursor_exgpcapital;
                      leave label_pro;
                  end if;


                  /* [获取流水变动][{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{红冲蓝补金额},{实现盈亏},{利率},{利息积数},{待入账利息}][@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#] */
                  set v_jour_occur_field = concat("期初金额","|","当前金额","|","冻结金额","|","解冻金额","|","待交收金额","|","沪深可用调整金额","|","港股通可用调整金额","|","金额核对差额","|","T日当日港股买入金额","|","T日当日港股卖出金额","|","T1日当日港股买入金额","|","T1日当日港股卖出金额","|","累计应收金额","|","累计应付金额","|","红冲蓝补金额","|","实现盈亏","|","利率","|","利息积数","|","待入账利息","|");
                  set v_jour_occur_info = concat(v_begin_amt,"|",v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|",v_pre_settle_amt,"|",v_shsz_avail_change_amt,"|",v_hk_avail_change_amt,"|",v_amt_check_diff,"|",v_T_hk_buy_total_amt,"|",v_T_hk_sell_total_amt,"|",v_T1_hk_buy_total_amt,"|",v_T1_hk_sell_total_amt,"|",v_total_rece_amt,"|",v_total_payab_amt,"|",v_total_change_amt,"|",v_realize_pandl,"|",v_intrst_rate,"|",v_intrst_base_amt,"|",v_pre_entry_intrst_amt,"|");


                  /* set @变动金额#=-1*@当前金额#; */
                  set v_occur_amt=-1*v_curr_amt;

                  /* set @变动后金额#=0; */
                  set v_occur_end_amt=0;

                  /* [获取表记录变量语句][产品证券_资金_交易组资金表][{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{红冲蓝补金额},{实现盈亏},{利率},{利息积数},{待入账利息}][@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#][{机构编号}=@机构编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
                  select begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_rece_amt,total_payab_amt,total_change_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt into v_begin_amt,v_curr_amt,v_frozen_amt,v_unfroz_amt,v_pre_settle_amt,v_shsz_avail_change_amt,v_hk_avail_change_amt,v_amt_check_diff,v_T_hk_buy_total_amt,v_T_hk_sell_total_amt,v_T1_hk_buy_total_amt,v_T1_hk_sell_total_amt,v_total_rece_amt,v_total_payab_amt,v_total_change_amt,v_realize_pandl,v_intrst_rate,v_intrst_base_amt,v_pre_entry_intrst_amt from db_pdsecu.tb_pdseca_exgp_capit where co_no=v_co_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


                  /* [获取流水后信息][@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#] */
                  set v_jour_after_occur_info = concat(v_begin_amt,"|",v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|",v_pre_settle_amt,"|",v_shsz_avail_change_amt,"|",v_hk_avail_change_amt,"|",v_amt_check_diff,"|",v_T_hk_buy_total_amt,"|",v_T_hk_sell_total_amt,"|",v_T1_hk_buy_total_amt,"|",v_T1_hk_sell_total_amt,"|",v_total_rece_amt,"|",v_total_payab_amt,"|",v_total_change_amt,"|",v_realize_pandl,"|",v_intrst_rate,"|",v_intrst_base_amt,"|",v_pre_entry_intrst_amt,"|");


                  /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][1][@交易组编号#,@本币币种#,@资产账户编号#] */
                  set v_create_date = date_format(curdate(),'%Y%m%d');
                  set v_create_time = date_format(curtime(),'%H%i%s');
                  set v_update_date = v_create_date;
                  set v_update_time = v_create_time;
                  set v_update_times = 1;
                  insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
                      create_date, create_time, update_date, 
                      update_time, update_times, opor_co_no, opor_no, 
                      oper_mac, oper_ip_addr, oper_info, oper_way, 
                      oper_menu_no, oper_func_code, init_date, co_no, 
                      pd_no, asset_acco_no, exch_group_no, crncy_type, 
                      busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
                      jour_after_occur_info, oper_remark_info) 
                  value( 
                      v_create_date, v_create_time, v_update_date, 
                      v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                      v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                      v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                      v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
                      v_busi_flag, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
                      v_jour_after_occur_info, v_oper_remark_info);
                  if v_error_code = "1" then
                              
                      SET v_error_code = "pdsecuA.1.715.1";
                      SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
                      close cursor_exgpcapital;
                      leave label_pro;
                  end if;


                  /* set @交易组编号串#=concat(@交易组编号串#,";",@交易组编号#); */
                  set v_exch_group_no_str=concat(v_exch_group_no_str,";",v_exch_group_no);

            /* [关闭游标][cursor_exgpcapital] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_exgpcapital;
            end cursor_exgpcapital;

    end if;

    /* set @当前金额# = @临时_当前金额#; */
    set v_curr_amt = v_tmp_curr_amt;

    /* set @金额核对差额# = @临时_金额核对差额#; */
    set v_amt_check_diff = v_tmp_amt_check_diff;

    /* set @累计应收金额# = @临时_累计应收金额#; */
    set v_total_rece_amt = v_tmp_total_rece_amt;

    /* set @累计应付金额# = @临时_累计应付金额#; */
    set v_total_payab_amt = v_tmp_total_payab_amt;

    /* set @红冲蓝补金额# = @临时_红冲蓝补金额#; */
    set v_total_change_amt = v_tmp_total_change_amt;

    /* set @交易组编号串#=concat(@交易组编号串#,";"); */
    set v_exch_group_no_str=concat(v_exch_group_no_str,";");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_curr_amt = v_curr_amt;
    SET p_amt_check_diff = v_amt_check_diff;
    SET p_total_rece_amt = v_total_rece_amt;
    SET p_total_payab_amt = v_total_payab_amt;
    SET p_total_change_amt = v_total_change_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_注销资产账户回退持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_CancelAsacRollBackPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_CancelAsacRollBackPosi(
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
    IN p_asset_acco_no int,
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
    declare v_asset_acco_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_invest_type int;
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_occur_qty decimal(18,2);
    declare v_occur_end_qty decimal(18,2);
    declare v_jour_after_occur_info varchar(2048);
    declare v_exch_group_no int;
    declare v_posi_id bigint;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_strike_date int;
    declare v_release_date int;
    declare v_deal_status varchar(2);
    declare v_occur_price decimal(16,9);
    declare v_occur_end_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_invest_type = 0;
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_occur_qty = 0;
    SET v_occur_end_qty = 0;
    SET v_jour_after_occur_info = " ";
    SET v_exch_group_no = 0;
    SET v_posi_id = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_fair_price = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_release_date = 0;
    SET v_deal_status = "0";
    SET v_occur_price = 0;
    SET v_occur_end_price = 0;

    
    label_pro:BEGIN
    
    #转移持仓

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @业务标志# = 《业务标志-持仓回退》; */
    set v_busi_flag = 1104005;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注#="注销资产账户持仓回退"; */
    set v_oper_remark_info="注销资产账户持仓回退";
    #先将资产账户下的持仓废掉

    /* [获取流水变动][{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
    set v_jour_occur_field = concat("期初数量","|","当前数量","|","待交收数量","|","冻结数量","|","解冻数量","|","成本金额","|","实现盈亏","|","利息成本金额","|","利息收益","|");
    set v_jour_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_pre_settle_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


    /* [声明游标][产品证券_持仓_资产账户持仓表][字段][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#][cursor_asacposi] */
    cursor_asacposi:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_asacposi CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, invest_type, 
        begin_qty, curr_qty, pre_settle_qty, frozen_qty, 
        unfroz_qty, posi_qty_check_diff, cost_amt, realize_pandl, 
        intrst_cost_amt, intrst_pandl 
        from db_pdsecu.tb_pdsepo_asac_posi 
        where co_no = v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_asacposi][loop_asacposi] */
    open cursor_asacposi;
    loop_asacposi: LOOP
    fetch cursor_asacposi into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_type, v_asset_type, v_invest_type, 
        v_begin_qty, v_curr_qty, v_pre_settle_qty, v_frozen_qty, 
        v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, 
        v_intrst_cost_amt, v_intrst_pandl;
        IF v_cursor_done THEN
            LEAVE loop_asacposi;
        END IF;


            /* [更新表记录][产品证券_持仓_资产账户持仓表][{期初数量}=0,{当前数量}=0,{待交收数量}=0,{冻结数量}=0,{解冻数量}=0,{成本金额}=0,{实现盈亏}=0,{利息成本金额}=0,{利息收益}=0][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][2][@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty=0,curr_qty=0,pre_settle_qty=0,frozen_qty=0,unfroz_qty=0,cost_amt=0,realize_pandl=0,intrst_cost_amt=0,intrst_pandl=0 where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.1.716.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                close cursor_asacposi;
                leave label_pro;
            end if;


            /* set @变动数量#=-1*@当前数量#; */
            set v_occur_qty=-1*v_curr_qty;

            /* set @变动后数量# = 0; */
            set v_occur_end_qty = 0;

            /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
            select begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl into v_begin_qty,v_curr_qty,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty,v_cost_amt,v_realize_pandl,v_intrst_cost_amt,v_intrst_pandl from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;


            /* [获取流水后信息][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
            set v_jour_after_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_pre_settle_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


            /* [插入表记录][产品证券_持仓_资产账户持仓流水表][字段][字段变量][1][@初始化日期#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_asac_posi_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, asset_acco_no, exch_no, stock_acco_no, 
                stock_code_no, busi_flag, occur_qty, occur_end_qty, 
                jour_occur_field, jour_after_occur_info, oper_remark_info, invest_type) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
                v_stock_code_no, v_busi_flag, v_occur_qty, v_occur_end_qty, 
                v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, v_invest_type);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.1.716.1";
                SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                close cursor_asacposi;
                leave label_pro;
            end if;


    /* [关闭游标][cursor_asacposi] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_asacposi;
    end cursor_asacposi;

    #再将资产账户下相关交易组的持仓废掉

    /* [获取流水变动][{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
    set v_jour_occur_field = concat("期初数量","|","当前数量","|","待交收数量","|","冻结数量","|","解冻数量","|","成本金额","|","实现盈亏","|","利息成本金额","|","利息收益","|");
    set v_jour_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_pre_settle_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


    /* [声明游标][产品证券_持仓_交易组持仓表][字段][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#][cursor_exgpposi] */
    cursor_exgpposi:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_exgpposi CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        invest_type, begin_qty, curr_qty, pre_settle_qty, 
        frozen_qty, unfroz_qty, posi_qty_check_diff, cost_amt, 
        realize_pandl, intrst_cost_amt, intrst_pandl 
        from db_pdsecu.tb_pdsepo_exgp_posi 
        where co_no = v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_exgpposi][loop_exgpposi] */
    open cursor_exgpposi;
    loop_exgpposi: LOOP
    fetch cursor_exgpposi into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_type, v_asset_type, 
        v_invest_type, v_begin_qty, v_curr_qty, v_pre_settle_qty, 
        v_frozen_qty, v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, 
        v_realize_pandl, v_intrst_cost_amt, v_intrst_pandl;
        IF v_cursor_done THEN
            LEAVE loop_exgpposi;
        END IF;


            /* [更新表记录][产品证券_持仓_交易组持仓表][{期初数量}=0,{当前数量}=0,{待交收数量}=0,{冻结数量}=0,{解冻数量}=0,{成本金额}=0,{实现盈亏}=0,{利息成本金额}=0,{利息收益}=0][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty=0,curr_qty=0,pre_settle_qty=0,frozen_qty=0,unfroz_qty=0,cost_amt=0,realize_pandl=0,intrst_cost_amt=0,intrst_pandl=0 where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.1.716.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                close cursor_exgpposi;
                leave label_pro;
            end if;


            /* set @变动数量#=-1*@当前数量#; */
            set v_occur_qty=-1*v_curr_qty;

            /* set @变动后数量# = 0; */
            set v_occur_end_qty = 0;

            /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
            select begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl into v_begin_qty,v_curr_qty,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty,v_cost_amt,v_realize_pandl,v_intrst_cost_amt,v_intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;


            /* [获取流水后信息][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
            set v_jour_after_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_pre_settle_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


            /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][1][@初始化日期#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_exgp_posi_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, exch_group_no, asset_acco_no, exch_no, 
                stock_acco_no, stock_code_no, busi_flag, occur_qty, 
                occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
                invest_type) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
                v_stock_acco_no, v_stock_code_no, v_busi_flag, v_occur_qty, 
                v_occur_end_qty, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, 
                v_invest_type);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.1.716.1";
                SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                close cursor_exgpposi;
                leave label_pro;
            end if;


    /* [关闭游标][cursor_exgpposi] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_exgpposi;
    end cursor_exgpposi;

    #再将资产账户下大宗交易的持仓废掉

    /* set @操作备注#="注销资产账户持仓回退"; */
    set v_oper_remark_info="注销资产账户持仓回退";

    /* [声明游标][产品证券_持仓_大宗交易持仓表][字段][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#][cursor_blockposi] */
    cursor_blockposi:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_blockposi CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, posi_id, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, strike_qty, 
        strike_price, fair_price, strike_date, release_date, 
        deal_status 
        from db_pdsecu.tb_pdsepo_block_trade_posi 
        where co_no = v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_blockposi][loop_blockposi] */
    open cursor_blockposi;
    loop_blockposi: LOOP
    fetch cursor_blockposi into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_posi_id, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_strike_qty, 
        v_strike_price, v_fair_price, v_strike_date, v_release_date, 
        v_deal_status;
        IF v_cursor_done THEN
            LEAVE loop_blockposi;
        END IF;


            /* [更新表记录][产品证券_持仓_大宗交易持仓表][{成交价格}=0,{成交数量}=0,{公允价格}=0][{持仓序号}=@持仓序号#][2][@持仓序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_block_trade_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_price=0,strike_qty=0,fair_price=0 where posi_id=v_posi_id;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.1.716.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("持仓序号=",v_posi_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("持仓序号=",v_posi_id);
                end if;
                close cursor_blockposi;
                leave label_pro;
            end if;


            /* set @变动数量#= -1*@成交数量#; */
            set v_occur_qty= -1*v_strike_qty;

            /* set @变动价格#= -1*@成交价格#; */
            set v_occur_price= -1*v_strike_price;

            /* set @变动后数量# = 0; */
            set v_occur_end_qty = 0;

            /* set @变动后价格# = 0; */
            set v_occur_end_price = 0;

            /* set @流水变动字段# = "|公允价格"; */
            set v_jour_occur_field = "|公允价格";

            /* set @流水后信息# = "|0"; */
            set v_jour_after_occur_info = "|0";

            /* [插入表记录][产品证券_持仓_大宗交易持仓流水表][字段][字段变量][1][@初始化日期#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_block_trade_posi_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, exch_group_no, asset_acco_no, exch_no, 
                stock_acco_no, stock_code_no, occur_qty, occur_end_qty, 
                occur_price, occur_end_price, jour_occur_field, jour_after_occur_info, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
                v_stock_acco_no, v_stock_code_no, v_occur_qty, v_occur_end_qty, 
                v_occur_price, v_occur_end_price, v_jour_occur_field, v_jour_after_occur_info, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.1.716.1";
                SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                close cursor_blockposi;
                leave label_pro;
            end if;


    /* [关闭游标][cursor_blockposi] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_blockposi;
    end cursor_blockposi;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_查询资产账户下所有交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_QueryAsacAllExgpCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_QueryAsacAllExgpCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][产品证券_资金_交易组资金表][{记录序号} as {交易组资金序号},{交易组编号},{期初金额} as {交易组期初金额},{当前金额} as {交易组当前金额},{冻结金额} as {交易组冻结金额},{解冻金额}  as {交易组解冻金额},{待交收金额} as {交易组待交收金额},{沪深可用调整金额} as {交易组沪深可用调整金额},{港股通可用调整金额} as {交易组港股通可用调整金额},{金额核对差额} as {交易组金额核对差额},{T日当日港股买入金额} as {交易组T日当日港股买入金额},{T日当日港股卖出金额} as {交易组T日当日港股卖出金额},{T1日当日港股买入金额} as {交易组T1日当日港股买入金额},{T1日当日港股卖出金额} as {交易组T1日当日港股卖出金额},{累计应收金额} as {交易组累计应收金额},{累计应付金额} as {交易组累计应付金额},{实现盈亏} as {交易组实现盈亏},{利率} as {交易组利率},{利息积数} as {交易组利息积数},{待入账利息} as {交易组待入账利息},{更新次数}][{机构编号}=@机构编号# and {资产账户编号}=@资产账户编号# and {产品编号}=@产品编号# and {本币币种}=@本币币种#][@指定行数#] */
    if v_row_count = -1 then
        select row_id as exgp_cash_id,exch_group_no,begin_amt as exgp_begin_amt,curr_amt as exgp_curr_amt,frozen_amt as exgp_frozen_amt,unfroz_amt  as exgp_unfroz_amt,pre_settle_amt as exgp_pre_settle_amt,shsz_avail_change_amt as exgp_shsz_avail_change_amt,hk_avail_change_amt as exgp_hk_avail_change_amt,amt_check_diff as exgp_amt_check_diff,T_hk_buy_total_amt as exgp_T_hk_buy_total_amt,T_hk_sell_total_amt as exgp_T_hk_sell_total_amt,T1_hk_buy_total_amt as exgp_T1_hk_buy_total_amt,T1_hk_sell_total_amt as exgp_T1_hk_sell_total_amt,total_rece_amt as exch_group_total_rece_amt,total_payab_amt as exch_group_total_payab_amt,realize_pandl as exgp_realize_pandl,intrst_rate as exch_group_intrst_rate,intrst_base_amt as exch_group_intrst_base_amt,pre_entry_intrst_amt as exch_group_pre_entry_intrst_amt,update_times from db_pdsecu.tb_pdseca_exgp_capit where co_no=v_co_no and asset_acco_no=v_asset_acco_no and pd_no=v_pd_no and crncy_type=v_crncy_type;
    else
        select row_id as exgp_cash_id,exch_group_no,begin_amt as exgp_begin_amt,curr_amt as exgp_curr_amt,frozen_amt as exgp_frozen_amt,unfroz_amt  as exgp_unfroz_amt,pre_settle_amt as exgp_pre_settle_amt,shsz_avail_change_amt as exgp_shsz_avail_change_amt,hk_avail_change_amt as exgp_hk_avail_change_amt,amt_check_diff as exgp_amt_check_diff,T_hk_buy_total_amt as exgp_T_hk_buy_total_amt,T_hk_sell_total_amt as exgp_T_hk_sell_total_amt,T1_hk_buy_total_amt as exgp_T1_hk_buy_total_amt,T1_hk_sell_total_amt as exgp_T1_hk_sell_total_amt,total_rece_amt as exch_group_total_rece_amt,total_payab_amt as exch_group_total_payab_amt,realize_pandl as exgp_realize_pandl,intrst_rate as exch_group_intrst_rate,intrst_base_amt as exch_group_intrst_base_amt,pre_entry_intrst_amt as exch_group_pre_entry_intrst_amt,update_times from db_pdsecu.tb_pdseca_exgp_capit where co_no=v_co_no and asset_acco_no=v_asset_acco_no and pd_no=v_pd_no and crncy_type=v_crncy_type limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_查询资产账户下所有交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_QueryAsacAllExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_QueryAsacAllExgpPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_asset_acco_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][产品证券_持仓_交易组持仓表][{记录序号} as {交易组持仓序号},{交易组编号},{市场编号},{股东代码编号},{证券代码编号},{证券类型} as {交易组证券类型},{资产类型} as {交易组资产类型},{投资类型} as {交易组投资类型},{期初数量} as {交易组期初数量},{当前数量} as {交易组当前数量},{待交收数量} as {交易组待交收数量},{冻结数量} as {交易组冻结数量},{解冻数量} as {交易组解冻数量},{持仓核对差额} as {交易组持仓核对差额},{成本金额} as {交易组成本金额},{实现盈亏} as {交易组实现盈亏},{利息成本金额} as {交易组利息成本金额},{利息收益} as {交易组利息收益},{更新次数}][{机构编号}=@机构编号# and {资产账户编号}=@资产账户编号# and {产品编号}=@产品编号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id as exgp_posi_id,exch_group_no,exch_no,stock_acco_no,stock_code_no,stock_type as exch_group_stock_type,asset_type as exch_group_asset_type,invest_type as exgp_invest_type,begin_qty as exch_group_begin_qty,curr_qty as exgp_curr_qty,pre_settle_qty as exgp_pre_settle_qty,frozen_qty as exgp_frozen_qty,unfroz_qty as exgp_unfroz_qty,posi_qty_check_diff as exgp_posi_qty_check_diff,cost_amt as exgp_cost_amt,realize_pandl as exgp_realize_pandl,intrst_cost_amt as exgp_intrst_cost_amt,intrst_pandl as exgp_intrst_pandl,update_times from db_pdsecu.tb_pdsepo_exgp_posi where co_no=v_co_no and asset_acco_no=v_asset_acco_no and pd_no=v_pd_no;
    else
        select row_id as exgp_posi_id,exch_group_no,exch_no,stock_acco_no,stock_code_no,stock_type as exch_group_stock_type,asset_type as exch_group_asset_type,invest_type as exgp_invest_type,begin_qty as exch_group_begin_qty,curr_qty as exgp_curr_qty,pre_settle_qty as exgp_pre_settle_qty,frozen_qty as exgp_frozen_qty,unfroz_qty as exgp_unfroz_qty,posi_qty_check_diff as exgp_posi_qty_check_diff,cost_amt as exgp_cost_amt,realize_pandl as exgp_realize_pandl,intrst_cost_amt as exgp_intrst_cost_amt,intrst_pandl as exgp_intrst_pandl,update_times from db_pdsecu.tb_pdsepo_exgp_posi where co_no=v_co_no and asset_acco_no=v_asset_acco_no and pd_no=v_pd_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_查询资产账户下所有大宗交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_QueryAsacAllBlockTradePosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_QueryAsacAllBlockTradePosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_asset_acco_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][产品证券_持仓_大宗交易持仓表][字段][{机构编号}=@机构编号# and {资产账户编号}=@资产账户编号# and {产品编号}=@产品编号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, posi_id, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, strike_qty, 
        strike_price, fair_price, strike_date, release_date, 
        deal_status from db_pdsecu.tb_pdsepo_block_trade_posi where co_no=v_co_no and asset_acco_no=v_asset_acco_no and pd_no=v_pd_no;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, posi_id, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, strike_qty, 
        strike_price, fair_price, strike_date, release_date, 
        deal_status from db_pdsecu.tb_pdsepo_block_trade_posi where co_no=v_co_no and asset_acco_no=v_asset_acco_no and pd_no=v_pd_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_获取股东代码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_GetHoldersNo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_GetHoldersNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_acco varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_acco_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_acco varchar(16);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_stock_acco = p_stock_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_账户_证券账户信息表][{股东代码编号}][@股东代码编号#][{股东代码} = @股东代码#][1][@股东代码#] */
    select stock_acco_no into v_stock_acco_no from db_pdsecu.tb_pdseac_secu_acco where stock_acco = v_stock_acco limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.1.720.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("股东代码=",v_stock_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("股东代码=",v_stock_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_acco_no = v_stock_acco_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_资产账户获取股东代码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_AsacGetStockAccoNo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_AsacGetStockAccoNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_acco_no int
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
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_no int;
    declare v_record_count int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_no = 0;
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_账户_证券账户信息表][count(1),{股东代码编号}][@记录个数#,@股东代码编号#][{资产账户编号} = @资产账户编号# and {市场编号} = @市场编号# and {股东代码状态} = 《股东代码状态-正常》][4][@资产账户编号#, @市场编号#] */
    select count(1),stock_acco_no into v_record_count,v_stock_acco_no from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no = v_asset_acco_no and exch_no = v_exch_no and stock_acco_status = "1" limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.1.721.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 市场编号=", v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@记录个数# <> 1][2][concat("资帐账户在该市场正常的股东代码个数不唯一",@资产账户编号#,@市场编号#)] */
    if v_record_count <> 1 then
        
        SET v_error_code = "pdsecuA.1.721.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资帐账户在该市场正常的股东代码个数不唯一",v_asset_acco_no,v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资帐账户在该市场正常的股东代码个数不唯一",v_asset_acco_no,v_exch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_acco_no = v_stock_acco_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_判断股东代码能否注销
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_CheckStockAccoIfCancel;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_CheckStockAccoIfCancel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int
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
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_invest_type int;
    declare v_row_id bigint;
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_tmp_row_id bigint;
    declare v_tmp_pre_settle_qty decimal(18,2);
    declare v_tmp_frozen_qty decimal(18,2);
    declare v_tmp_unfroz_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_invest_type = 0;
    SET v_row_id = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_tmp_row_id = 0;
    SET v_tmp_pre_settle_qty = 0;
    SET v_tmp_frozen_qty = 0;
    SET v_tmp_unfroz_qty = 0;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @记录个数#=0; */
    set v_record_count=0;
        #然后校验持仓是否有待交收数量和冻结数量

        /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][sum({记录序号}),sum({待交收数量}),sum({冻结数量}),sum({解冻数量})][@记录序号#,@待交收数量#,@冻结数量#,@解冻数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}<>" " and {投资类型}=@投资类型#] */
        select sum(row_id),sum(pre_settle_qty),sum(frozen_qty),sum(unfroz_qty) into v_row_id,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no<>" " and invest_type=v_invest_type limit 1;

        #若有待交收数量或者冻结数量,则不允许注销交易组

        /* if (@记录序号#<>0 and (@待交收数量#<>0 or @冻结数量#<>0 or @解冻数量#<>0)) then */
        if (v_row_id<>0 and (v_pre_settle_qty<>0 or v_frozen_qty<>0 or v_unfroz_qty<>0)) then

            /* set @记录个数#=1; */
            set v_record_count=1;
          end if;

    /* set @临时_记录序号#=0; */
    set v_tmp_row_id=0;

    /* set @临时_待交收数量#=0; */
    set v_tmp_pre_settle_qty=0;

    /* set @临时_冻结数量#=0; */
    set v_tmp_frozen_qty=0;

    /* set @临时_解冻数量#=0; */
    set v_tmp_unfroz_qty=0;
       # [获取表记录变量语句][产品证券_持仓_交易组持仓表][sum({记录序号}),sum({待交收数量}),sum({冻结数量}),sum({解冻数量})][@临时_记录序号#,@临时_待交收数量#,@临时_冻结数量#,@临时_解冻数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}<>" " and {投资类型}=@投资类型#]

        /* select sum({记录序号}),sum({待交收数量}),sum({冻结数量}),sum({解冻数量}) into @临时_记录序号#,@临时_待交收数量#,@临时_冻结数量#,@临时_解冻数量#  from  ~产品证券_持仓_交易组持仓表^  where {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}<>" " and {投资类型}=@投资类型#; */
        select sum(row_id),sum(pre_settle_qty),sum(frozen_qty),sum(unfroz_qty) into v_tmp_row_id,v_tmp_pre_settle_qty,v_tmp_frozen_qty,v_tmp_unfroz_qty  from  db_pdsecu.tb_pdsepo_exgp_posi  where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no<>" " and invest_type=v_invest_type;
        #若有待交收数量或者冻结数量,则不允许注销交易组

        /* if (@临时_记录序号#<>0 and (@临时_待交收数量#<>0 or @临时_冻结数量#<>0 or @临时_解冻数量#<>0)) then */
        if (v_tmp_row_id<>0 and (v_tmp_pre_settle_qty<>0 or v_tmp_frozen_qty<>0 or v_tmp_unfroz_qty<>0)) then

            /* set @记录个数#=1; */
            set v_record_count=1;
          end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_注销股东代码回退持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_CancelStockAccoRollBackPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_CancelStockAccoRollBackPosi(
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
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
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
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_invest_type int;
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_occur_qty decimal(18,2);
    declare v_occur_end_qty decimal(18,2);
    declare v_jour_after_occur_info varchar(2048);
    declare v_exch_group_no int;
    declare v_posi_id bigint;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_strike_date int;
    declare v_release_date int;
    declare v_deal_status varchar(2);
    declare v_occur_price decimal(16,9);
    declare v_occur_end_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_invest_type = 0;
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_occur_qty = 0;
    SET v_occur_end_qty = 0;
    SET v_jour_after_occur_info = " ";
    SET v_exch_group_no = 0;
    SET v_posi_id = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_fair_price = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_release_date = 0;
    SET v_deal_status = "0";
    SET v_occur_price = 0;
    SET v_occur_end_price = 0;

    
    label_pro:BEGIN
    
    #转移持仓

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @业务标志# = 《业务标志-持仓回退》; */
    set v_busi_flag = 1104005;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注#="注销股东代码持仓回退"; */
    set v_oper_remark_info="注销股东代码持仓回退";
    #先将资产账户下的持仓废掉

    /* [获取流水变动][{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
    set v_jour_occur_field = concat("期初数量","|","当前数量","|","待交收数量","|","冻结数量","|","解冻数量","|","成本金额","|","实现盈亏","|","利息成本金额","|","利息收益","|");
    set v_jour_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_pre_settle_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


    /* [声明游标][产品证券_持仓_资产账户持仓表][字段][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号#][cursor_asacposi] */
    cursor_asacposi:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_asacposi CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, invest_type, 
        begin_qty, curr_qty, pre_settle_qty, frozen_qty, 
        unfroz_qty, posi_qty_check_diff, cost_amt, realize_pandl, 
        intrst_cost_amt, intrst_pandl 
        from db_pdsecu.tb_pdsepo_asac_posi 
        where co_no = v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_asacposi][loop_asacposi] */
    open cursor_asacposi;
    loop_asacposi: LOOP
    fetch cursor_asacposi into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_type, v_asset_type, v_invest_type, 
        v_begin_qty, v_curr_qty, v_pre_settle_qty, v_frozen_qty, 
        v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, 
        v_intrst_cost_amt, v_intrst_pandl;
        IF v_cursor_done THEN
            LEAVE loop_asacposi;
        END IF;


            /* [更新表记录][产品证券_持仓_资产账户持仓表][{期初数量}=0,{当前数量}=0,{待交收数量}=0,{冻结数量}=0,{解冻数量}=0,{成本金额}=0,{实现盈亏}=0,{利息成本金额}=0,{利息收益}=0][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][2][@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty=0,curr_qty=0,pre_settle_qty=0,frozen_qty=0,unfroz_qty=0,cost_amt=0,realize_pandl=0,intrst_cost_amt=0,intrst_pandl=0 where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.1.723.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                close cursor_asacposi;
                leave label_pro;
            end if;


            /* set @变动数量#=-1*@当前数量#; */
            set v_occur_qty=-1*v_curr_qty;

            /* set @变动后数量# = 0; */
            set v_occur_end_qty = 0;

            /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
            select begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl into v_begin_qty,v_curr_qty,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty,v_cost_amt,v_realize_pandl,v_intrst_cost_amt,v_intrst_pandl from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;


            /* [获取流水后信息][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
            set v_jour_after_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_pre_settle_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


            /* [插入表记录][产品证券_持仓_资产账户持仓流水表][字段][字段变量][1][@初始化日期#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_asac_posi_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, asset_acco_no, exch_no, stock_acco_no, 
                stock_code_no, busi_flag, occur_qty, occur_end_qty, 
                jour_occur_field, jour_after_occur_info, oper_remark_info, invest_type) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
                v_stock_code_no, v_busi_flag, v_occur_qty, v_occur_end_qty, 
                v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, v_invest_type);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.1.723.1";
                SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                close cursor_asacposi;
                leave label_pro;
            end if;


    /* [关闭游标][cursor_asacposi] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_asacposi;
    end cursor_asacposi;

    #再将资产账户下相关交易组的持仓废掉

    /* [获取流水变动][{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
    set v_jour_occur_field = concat("期初数量","|","当前数量","|","待交收数量","|","冻结数量","|","解冻数量","|","成本金额","|","实现盈亏","|","利息成本金额","|","利息收益","|");
    set v_jour_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_pre_settle_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


    /* [声明游标][产品证券_持仓_交易组持仓表][字段][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号#][cursor_exgpposi] */
    cursor_exgpposi:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_exgpposi CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        invest_type, begin_qty, curr_qty, pre_settle_qty, 
        frozen_qty, unfroz_qty, posi_qty_check_diff, cost_amt, 
        realize_pandl, intrst_cost_amt, intrst_pandl 
        from db_pdsecu.tb_pdsepo_exgp_posi 
        where co_no = v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_exgpposi][loop_exgpposi] */
    open cursor_exgpposi;
    loop_exgpposi: LOOP
    fetch cursor_exgpposi into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_type, v_asset_type, 
        v_invest_type, v_begin_qty, v_curr_qty, v_pre_settle_qty, 
        v_frozen_qty, v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, 
        v_realize_pandl, v_intrst_cost_amt, v_intrst_pandl;
        IF v_cursor_done THEN
            LEAVE loop_exgpposi;
        END IF;


            /* [更新表记录][产品证券_持仓_交易组持仓表][{期初数量}=0,{当前数量}=0,{待交收数量}=0,{冻结数量}=0,{解冻数量}=0,{成本金额}=0,{实现盈亏}=0,{利息成本金额}=0,{利息收益}=0][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty=0,curr_qty=0,pre_settle_qty=0,frozen_qty=0,unfroz_qty=0,cost_amt=0,realize_pandl=0,intrst_cost_amt=0,intrst_pandl=0 where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.1.723.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                close cursor_exgpposi;
                leave label_pro;
            end if;


            /* set @变动数量#=-1*@当前数量#; */
            set v_occur_qty=-1*v_curr_qty;

            /* set @变动后数量# = 0; */
            set v_occur_end_qty = 0;

            /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
            select begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl into v_begin_qty,v_curr_qty,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty,v_cost_amt,v_realize_pandl,v_intrst_cost_amt,v_intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;


            /* [获取流水后信息][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
            set v_jour_after_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_pre_settle_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


            /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][1][@初始化日期#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_exgp_posi_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, exch_group_no, asset_acco_no, exch_no, 
                stock_acco_no, stock_code_no, busi_flag, occur_qty, 
                occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
                invest_type) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
                v_stock_acco_no, v_stock_code_no, v_busi_flag, v_occur_qty, 
                v_occur_end_qty, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, 
                v_invest_type);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.1.723.1";
                SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                close cursor_exgpposi;
                leave label_pro;
            end if;


    /* [关闭游标][cursor_exgpposi] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_exgpposi;
    end cursor_exgpposi;

    #再将资产账户下大宗交易的持仓废掉

    /* set @操作备注#="注销股东代码持仓回退"; */
    set v_oper_remark_info="注销股东代码持仓回退";

    /* [声明游标][产品证券_持仓_大宗交易持仓表][字段][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号#][cursor_blockposi] */
    cursor_blockposi:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_blockposi CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, posi_id, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, strike_qty, 
        strike_price, fair_price, strike_date, release_date, 
        deal_status 
        from db_pdsecu.tb_pdsepo_block_trade_posi 
        where co_no = v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_blockposi][loop_blockposi] */
    open cursor_blockposi;
    loop_blockposi: LOOP
    fetch cursor_blockposi into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_posi_id, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_strike_qty, 
        v_strike_price, v_fair_price, v_strike_date, v_release_date, 
        v_deal_status;
        IF v_cursor_done THEN
            LEAVE loop_blockposi;
        END IF;


            /* [更新表记录][产品证券_持仓_大宗交易持仓表][{成交价格}=0,{成交数量}=0,{公允价格}=0][{持仓序号}=@持仓序号#][2][@持仓序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_block_trade_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_price=0,strike_qty=0,fair_price=0 where posi_id=v_posi_id;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.1.723.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("持仓序号=",v_posi_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("持仓序号=",v_posi_id);
                end if;
                close cursor_blockposi;
                leave label_pro;
            end if;


            /* set @变动数量#= -1*@成交数量#; */
            set v_occur_qty= -1*v_strike_qty;

            /* set @变动价格#= -1*@成交价格#; */
            set v_occur_price= -1*v_strike_price;

            /* set @变动后数量# = 0; */
            set v_occur_end_qty = 0;

            /* set @变动后价格# = 0; */
            set v_occur_end_price = 0;

            /* set @流水变动字段# = "|公允价格"; */
            set v_jour_occur_field = "|公允价格";

            /* set @流水后信息# = "|0"; */
            set v_jour_after_occur_info = "|0";

            /* [插入表记录][产品证券_持仓_大宗交易持仓流水表][字段][字段变量][1][@初始化日期#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_block_trade_posi_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, exch_group_no, asset_acco_no, exch_no, 
                stock_acco_no, stock_code_no, occur_qty, occur_end_qty, 
                occur_price, occur_end_price, jour_occur_field, jour_after_occur_info, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
                v_stock_acco_no, v_stock_code_no, v_occur_qty, v_occur_end_qty, 
                v_occur_price, v_occur_end_price, v_jour_occur_field, v_jour_after_occur_info, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.1.723.1";
                SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                close cursor_blockposi;
                leave label_pro;
            end if;


    /* [关闭游标][cursor_blockposi] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_blockposi;
    end cursor_blockposi;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_新增证券账户自动逆回购配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_AddSecuAccoAutoReverseRepoConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_AddSecuAccoAutoReverseRepoConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_target_opor_no int,
    IN p_begin_time int,
    IN p_avail_cash decimal(18,4),
    IN p_intrst_ratio decimal(18,12),
    IN p_mul_acco_trd_qty int,
    IN p_exec_price_type int,
    IN p_task_status varchar(2),
    IN p_order_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_target_opor_no int;
    declare v_begin_time int;
    declare v_avail_cash decimal(18,4);
    declare v_intrst_ratio decimal(18,12);
    declare v_mul_acco_trd_qty int;
    declare v_exec_price_type int;
    declare v_task_status varchar(2);
    declare v_order_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_stock_acco_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_opor_no = p_target_opor_no;
    SET v_begin_time = p_begin_time;
    SET v_avail_cash = p_avail_cash;
    SET v_intrst_ratio = p_intrst_ratio;
    SET v_mul_acco_trd_qty = p_mul_acco_trd_qty;
    SET v_exec_price_type = p_exec_price_type;
    SET v_task_status = p_task_status;
    SET v_order_no = p_order_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_stock_acco_no = 0;

    
    label_pro:BEGIN
    

    /* set @操作员编号# = @目标操作员编号#; */
    set v_opor_no = v_target_opor_no;

    /* [插入表记录][产品证券_账户_证券账户自动逆回购配置表][字段][字段变量][1][@机构编号#,@产品编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseac_secu_acco_reverse_repo_config(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, stock_code_no, exch_no, 
        opor_no, begin_time, avail_cash, intrst_ratio, 
        mul_acco_trd_qty, exec_price_type, task_status, order_no) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_stock_code_no, v_exch_no, 
        v_opor_no, v_begin_time, v_avail_cash, v_intrst_ratio, 
        v_mul_acco_trd_qty, v_exec_price_type, v_task_status, v_order_no);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.724.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_修改证券账户自动逆回购配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_ModiSecuAccoAutoReverseRepoConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_ModiSecuAccoAutoReverseRepoConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_target_opor_no int,
    IN p_begin_time int,
    IN p_avail_cash decimal(18,4),
    IN p_intrst_ratio decimal(18,12),
    IN p_mul_acco_trd_qty int,
    IN p_exec_price_type int,
    IN p_task_status varchar(2),
    IN p_order_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_target_opor_no int;
    declare v_begin_time int;
    declare v_avail_cash decimal(18,4);
    declare v_intrst_ratio decimal(18,12);
    declare v_mul_acco_trd_qty int;
    declare v_exec_price_type int;
    declare v_task_status varchar(2);
    declare v_order_no int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_opor_no = p_target_opor_no;
    SET v_begin_time = p_begin_time;
    SET v_avail_cash = p_avail_cash;
    SET v_intrst_ratio = p_intrst_ratio;
    SET v_mul_acco_trd_qty = p_mul_acco_trd_qty;
    SET v_exec_price_type = p_exec_price_type;
    SET v_task_status = p_task_status;
    SET v_order_no = p_order_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_账户_证券账户自动逆回购配置表][{操作员编号}=@目标操作员编号#, {开始时间}=@开始时间#,{可用资金}=@可用资金#,{年利率}=@年利率#,{多账户交易数量}=@多账户交易数量#,{执行价格类型}=@执行价格类型#,{任务状态}=@任务状态#,{订单编号}=@订单编号#][{资产账户编号}=@资产账户编号#  and {证券代码编号}=@证券代码编号# and {交易组编号}=@交易组编号#][2][@机构编号#,@产品编号#,@资产账户编号#,@证券代码编号#,@交易组编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseac_secu_acco_reverse_repo_config set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, opor_no=v_target_opor_no, begin_time=v_begin_time,avail_cash=v_avail_cash,intrst_ratio=v_intrst_ratio,mul_acco_trd_qty=v_mul_acco_trd_qty,exec_price_type=v_exec_price_type,task_status=v_task_status,order_no=v_order_no where asset_acco_no=v_asset_acco_no  and stock_code_no=v_stock_code_no and exch_group_no=v_exch_group_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.1.725.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_删除证券账户自动逆回购配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_DeleteSecuAccoAutoReverseRepoConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_DeleteSecuAccoAutoReverseRepoConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][产品证券_账户_证券账户自动逆回购配置表][{资产账户编号}=@资产账户编号#  and {证券代码编号}=@证券代码编号# and {交易组编号}=@交易组编号#][3][@机构编号#,@产品编号#,@资产账户编号#,@证券代码编号#,@交易组编号#] */
    delete from db_pdsecu.tb_pdseac_secu_acco_reverse_repo_config 
        where asset_acco_no=v_asset_acco_no  and stock_code_no=v_stock_code_no and exch_group_no=v_exch_group_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.1.726.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户_查询证券账户自动逆回购配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseac_QuerySecuAccoAutoReverseRepoConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseac_QuerySecuAccoAutoReverseRepoConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_账户_证券账户自动逆回购配置表][{记录序号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{证券代码编号},{市场编号},{操作员编号},{开始时间},{可用资金},{年利率},{多账户交易数量},{执行价格类型},{任务状态},{订单编号}][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@市场编号#=0 or {市场编号}=@市场编号#)  and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and {记录序号}>@记录序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id,co_no,pd_no,exch_group_no,asset_acco_no,stock_code_no,exch_no,opor_no,begin_time,avail_cash,intrst_ratio,mul_acco_trd_qty,exec_price_type,task_status,order_no from db_pdsecu.tb_pdseac_secu_acco_reverse_repo_config where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or exch_no=v_exch_no)  and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and row_id>v_row_id;
    else
        select row_id,co_no,pd_no,exch_group_no,asset_acco_no,stock_code_no,exch_no,opor_no,begin_time,avail_cash,intrst_ratio,mul_acco_trd_qty,exec_price_type,task_status,order_no from db_pdsecu.tb_pdseac_secu_acco_reverse_repo_config where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or exch_no=v_exch_no)  and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and row_id>v_row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


