DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_账户_获取市场业务记录编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoac_GetMarketBusiRecordNo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoac_GetMarketBusiRecordNo(
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

    /* [插入重复更新][产品外盘期货_账户_市场业务记录编号表][字段][字段变量][{当前编号} = {当前编号} + 1][1][@市场编号#, @编号类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoac_market_busi_record_no (
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, record_no_type, 
        curr_no) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_no, v_record_no_type, 
        v_curr_no) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_no = curr_no + 1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.1.901.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 编号类型=", v_record_no_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 编号类型=", v_record_no_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][产品外盘期货_账户_市场业务记录编号表][{当前编号}][@当前编号#][{市场编号} = @市场编号# and {编号类型} = @编号类型#] */
    select curr_no into v_curr_no from db_pdfofu.tb_pdfoac_market_busi_record_no where exch_no = v_exch_no and record_no_type = v_record_no_type limit 1;


    /* set @当前编号# = @市场编号# * 10000 + @当前编号#; */
    set v_curr_no = v_exch_no * 10000 + v_curr_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_curr_no = v_curr_no;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_账户_检查外盘期货账户存在
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoac_CheckFoFutuAccoExists;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoac_CheckFoFutuAccoExists(
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
    IN p_futu_acco varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_futu_acco varchar(16);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco = p_futu_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [记录已存在][产品外盘期货_账户_外盘期货账户信息表][@记录个数#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {市场编号}=@市场编号# and {交易编码}=@交易编码#][164][@资产账户编号#,@市场编号#,@交易编码#] */
    select count(1) into v_record_count from db_pdfofu.tb_pdfoac_fofutuacco where co_no=v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and exch_no=v_exch_no and futu_acco=v_futu_acco limit 1;
    if v_record_count > 0 then
                
        SET v_error_code = "pdfofuA.1.40.164";
        SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","交易编码=",v_futu_acco);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_账户_新增外盘期货账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoac_AddFoFutuAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoac_AddFoFutuAccoInfo(
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
    IN p_futu_acco_no int,
    IN p_exch_no int,
    IN p_futu_acco varchar(16),
    IN p_futu_acco_name varchar(64),
    IN p_allow_contrc_type varchar(2048),
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
    declare v_futu_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco varchar(16);
    declare v_futu_acco_name varchar(64);
    declare v_allow_contrc_type varchar(2048);
    declare v_busi_limit_str varchar(2048);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_futu_acco_status varchar(2);
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco = p_futu_acco;
    SET v_futu_acco_name = p_futu_acco_name;
    SET v_allow_contrc_type = p_allow_contrc_type;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_futu_acco_status = "0";
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
    

    /* [获取流水变动][字段][字段变量]; */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "资产账户编号", "|", "交易编码编号", "|", "市场编号", "|", "交易编码", "|", "交易编码名称", "|", "允许操作合约类型", "|", "业务限制串", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_futu_acco_no, "|", v_exch_no, "|", v_futu_acco, "|", v_futu_acco_name, "|", v_allow_contrc_type, "|", v_busi_limit_str, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @交易编码状态# =《交易编码状态-正常》; */
    set v_futu_acco_status ="1";

    /* [插入表记录][产品外盘期货_账户_外盘期货账户信息表][字段][字段变量][1][@资产账户编号#,@交易编码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoac_fofutuacco(
        create_date, create_time, update_date, 
        update_time, update_times, futu_acco_no, co_no, 
        pd_no, asset_acco_no, exch_no, futu_acco, 
        futu_acco_name, futu_acco_status, allow_contrc_type, busi_limit_str, 
        remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_futu_acco_no, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_futu_acco, 
        v_futu_acco_name, v_futu_acco_status, v_allow_contrc_type, v_busi_limit_str, 
        v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.1.41.1";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量]; */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_futu_acco_no, "|", v_exch_no, "|", v_futu_acco, "|", v_futu_acco_name, "|", v_allow_contrc_type, "|", v_busi_limit_str, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增外盘期货账户信息"; */
    set v_oper_remark_info = "新增外盘期货账户信息";

    /* [插入表记录][产品外盘期货_账户_外盘期货账户信息流水表][字段][字段变量][5][@资产账户编号#,@交易编码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoac_fofutuaccojour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, futu_acco_no, exch_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_futu_acco_no, v_exch_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.1.41.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_账户_修改外盘期货账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoac_ModiFoFutuAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoac_ModiFoFutuAccoInfo(
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
    IN p_futu_acco_no int,
    IN p_exch_no int,
    IN p_futu_acco_name varchar(64),
    IN p_allow_contrc_type varchar(2048),
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
    declare v_futu_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_name varchar(64);
    declare v_allow_contrc_type varchar(2048);
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_name = p_futu_acco_name;
    SET v_allow_contrc_type = p_allow_contrc_type;
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
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "资产账户编号", "|", "交易编码编号", "|", "市场编号", "|", "交易编码名称", "|", "允许操作合约类型", "|", "业务限制串", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_futu_acco_no, "|", v_exch_no, "|", v_futu_acco_name, "|", v_allow_contrc_type, "|", v_busi_limit_str, "|", v_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][产品外盘期货_账户_外盘期货账户信息表][{交易编码名称}=@交易编码名称#, {允许操作合约类型}=@允许操作合约类型#, {业务限制串}=@业务限制串#,{备注信息}=@备注信息#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号#][2][@资产账户编号#,@交易编码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoac_fofutuacco set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, futu_acco_name=v_futu_acco_name, allow_contrc_type=v_allow_contrc_type, busi_limit_str=v_busi_limit_str,remark_info=v_remark_info where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.1.42.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_账户_外盘期货账户信息表][{记录序号}][@记录序号#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号#][4][@资产账户编号#,@交易编码编号#] */
    select row_id into v_row_id from db_pdfofu.tb_pdfoac_fofutuacco where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.1.42.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_futu_acco_no, "|", v_exch_no, "|", v_futu_acco_name, "|", v_allow_contrc_type, "|", v_busi_limit_str, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改期货账户信息"; */
    set v_oper_remark_info = "修改期货账户信息";

    /* [插入表记录][产品外盘期货_账户_外盘期货账户信息流水表][字段][字段变量][5][@资产账户编号#,@交易编码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoac_fofutuaccojour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, futu_acco_no, exch_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_futu_acco_no, v_exch_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.1.42.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_账户_删除外盘期货账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoac_DeleteFoFutuAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoac_DeleteFoFutuAccoInfo(
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
    IN p_futu_acco_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_futu_acco_no int;
    declare v_exch_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_exch_no = p_exch_no;
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

    /* set @流水变动信息# = " "; */
    set v_jour_occur_info = " ";

    /* [获取表记录变量][产品外盘期货_账户_外盘期货账户信息表][{记录序号}][@记录序号#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号#][4][@资产账户编号#,@交易编码编号#] */
    select row_id into v_row_id from db_pdfofu.tb_pdfoac_fofutuacco where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.1.43.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品外盘期货_账户_外盘期货账户信息表][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号#][3][@资产账户编号#,@交易编码编号#] */
    delete from db_pdfofu.tb_pdfoac_fofutuacco 
        where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfofuA.1.43.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# = " " ; */
    set v_jour_after_occur_info = " " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品外盘期货_账户_外盘期货账户信息流水表][字段][字段变量][5][@资产账户编号#,@交易编码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoac_fofutuaccojour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, futu_acco_no, exch_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_futu_acco_no, v_exch_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.1.43.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_账户_查询外盘期货账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoac_QueryFoFutuAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoac_QueryFoFutuAccoInfo(
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
    IN p_futu_acco_no int,
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_status_str varchar(64),
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
    declare v_futu_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_status_str varchar(64);
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_status_str = p_futu_acco_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品外盘期货_账户_外盘期货账户信息表][字段][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易编码状态串# = "; ;" or instr(@交易编码状态串#, concat(";",{交易编码状态},";"))>0) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号},";"))>0) and (@交易编码编号# = 0 or {交易编码编号}=@交易编码编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, futu_acco_no, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco, futu_acco_name, futu_acco_status, allow_contrc_type, 
        busi_limit_str, remark_info from db_pdfofu.tb_pdfoac_fofutuacco where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_futu_acco_status_str = "; ;" or instr(v_futu_acco_status_str, concat(";",futu_acco_status,";"))>0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no,";"))>0) and (v_futu_acco_no = 0 or futu_acco_no=v_futu_acco_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, futu_acco_no, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco, futu_acco_name, futu_acco_status, allow_contrc_type, 
        busi_limit_str, remark_info from db_pdfofu.tb_pdfoac_fofutuacco where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_futu_acco_status_str = "; ;" or instr(v_futu_acco_status_str, concat(";",futu_acco_status,";"))>0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no,";"))>0) and (v_futu_acco_no = 0 or futu_acco_no=v_futu_acco_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_账户_查询外盘期货账户信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoac_QueryFoFutuAccoInfoJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoac_QueryFoFutuAccoInfoJour(
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
    IN p_futu_acco_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_futu_acco_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品外盘期货_账户_外盘期货账户信息流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号},";"))>0) and (@交易编码编号# = 0 or {交易编码编号}=@交易编码编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, futu_acco_no, 
        exch_no, jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfofu.tb_pdfoac_fofutuaccojour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no,";"))>0) and (v_futu_acco_no = 0 or futu_acco_no=v_futu_acco_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, futu_acco_no, 
        exch_no, jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfofu.tb_pdfoac_fofutuaccojour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no,";"))>0) and (v_futu_acco_no = 0 or futu_acco_no=v_futu_acco_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_账户_查询历史外盘期货账户信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoac_QueryFoFutuAccoInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoac_QueryFoFutuAccoInfoJour_His(
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
    IN p_futu_acco_no int,
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
    declare v_futu_acco_no int;
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品外盘期货_账户_外盘期货账户信息流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号},";"))>0) and (@交易编码编号# = 0 or {交易编码编号}=@交易编码编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, futu_acco_no, 
        exch_no, jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfofu_his.tb_pdfoac_fofutuaccojour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no,";"))>0) and (v_futu_acco_no = 0 or futu_acco_no=v_futu_acco_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, futu_acco_no, 
        exch_no, jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfofu_his.tb_pdfoac_fofutuaccojour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no,";"))>0) and (v_futu_acco_no = 0 or futu_acco_no=v_futu_acco_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_账户_更新外盘期货账户状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoac_UpdateFoFutuAccoStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoac_UpdateFoFutuAccoStatus(
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
    IN p_futu_acco_no int,
    IN p_exch_no int,
    IN p_futu_acco_status varchar(2),
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
    declare v_futu_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_status varchar(2);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_status = p_futu_acco_status;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
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
    

    /* [获取流水变动][{交易编码状态}][@交易编码状态#]; */
    set v_jour_occur_field = concat("交易编码状态","|");
    set v_jour_occur_info = concat(v_futu_acco_status,"|");


    /* [更新表记录][产品外盘期货_账户_外盘期货账户信息表][{交易编码状态}=@交易编码状态#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号#][2][@资产账户编号#,@交易编码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoac_fofutuacco set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, futu_acco_status=v_futu_acco_status where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.1.47.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_账户_外盘期货账户信息表][{交易编码状态}][@交易编码状态#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号#][4][@资产账户编号#,@交易编码编号#] */
    select futu_acco_status into v_futu_acco_status from db_pdfofu.tb_pdfoac_fofutuacco where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.1.47.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@交易编码状态#]; */
    set v_jour_after_occur_info = concat(v_futu_acco_status,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "更新外盘期货账户状态"; */
    set v_oper_remark_info = "更新外盘期货账户状态";

    /* [插入表记录][产品外盘期货_账户_外盘期货账户信息流水表][字段][字段变量][5][@资产账户编号#,@交易编码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoac_fofutuaccojour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, futu_acco_no, exch_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_futu_acco_no, v_exch_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.1.47.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_账户_检查外盘期货账户状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoac_CheckFoFutuAccoStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoac_CheckFoFutuAccoStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_futu_acco_no int,
    IN p_futu_acco_status varchar(2),
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
    declare v_futu_acco_no int;
    declare v_futu_acco_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_tmp_futu_acco_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_futu_acco_status = p_futu_acco_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_tmp_futu_acco_status = "0";

    
    label_pro:BEGIN
    
    #对外盘期货账户状态进行检查

    /* [获取表记录变量][产品外盘期货_账户_外盘期货账户信息表][{交易编码状态},{机构编号}][@临时_交易编码状态#,@机构编号#][{产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号#][4][@资产账户编号#,@交易编码编号#] */
    select futu_acco_status,co_no into v_tmp_futu_acco_status,v_co_no from db_pdfofu.tb_pdfoac_fofutuacco where pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.1.48.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@交易编码状态# = 0 and @临时_交易编码状态# = 《交易编码状态-冻结》][121][@交易编码编号#,@交易编码状态#,@临时_交易编码状态#] */
    if v_futu_acco_status = 0 and v_tmp_futu_acco_status = "2" then
        
        SET v_error_code = "pdfofuA.1.48.121";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易编码编号=",v_futu_acco_no,",","交易编码状态=",v_futu_acco_status,",","临时_交易编码状态=",v_tmp_futu_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易编码编号=",v_futu_acco_no,",","交易编码状态=",v_futu_acco_status,",","临时_交易编码状态=",v_tmp_futu_acco_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@交易编码状态# = 0 and @临时_交易编码状态# = 《交易编码状态-注销》][122][@交易编码编号#,@交易编码状态#,@临时_交易编码状态#] */
    if v_futu_acco_status = 0 and v_tmp_futu_acco_status = "3" then
        
        SET v_error_code = "pdfofuA.1.48.122";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易编码编号=",v_futu_acco_no,",","交易编码状态=",v_futu_acco_status,",","临时_交易编码状态=",v_tmp_futu_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易编码编号=",v_futu_acco_no,",","交易编码状态=",v_futu_acco_status,",","临时_交易编码状态=",v_tmp_futu_acco_status);
        end if;
        leave label_pro;
    end if;

    #冻结产品检查

    /* [检查报错返回][@交易编码状态# = 《交易编码状态-冻结》 and @临时_交易编码状态# = 《交易编码状态-冻结》][161][@资产账户编号#,@交易编码编号#,@交易编码状态#,@临时_交易编码状态#] */
    if v_futu_acco_status = "2" and v_tmp_futu_acco_status = "2" then
        
        SET v_error_code = "pdfofuA.1.48.161";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","交易编码状态=",v_futu_acco_status,",","临时_交易编码状态=",v_tmp_futu_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","交易编码状态=",v_futu_acco_status,",","临时_交易编码状态=",v_tmp_futu_acco_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@交易编码状态# = 《交易编码状态-冻结》 and @临时_交易编码状态# = 《交易编码状态-注销》][162][@资产账户编号#,@交易编码编号#,@交易编码状态#,@临时_交易编码状态#] */
    if v_futu_acco_status = "2" and v_tmp_futu_acco_status = "3" then
        
        SET v_error_code = "pdfofuA.1.48.162";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","交易编码状态=",v_futu_acco_status,",","临时_交易编码状态=",v_tmp_futu_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","交易编码状态=",v_futu_acco_status,",","临时_交易编码状态=",v_tmp_futu_acco_status);
        end if;
        leave label_pro;
    end if;

    #恢复产品检查

    /* [检查报错返回][@交易编码状态# = 《交易编码状态-正常》 and @临时_交易编码状态# = 《交易编码状态-正常》][163][@资产账户编号#,@交易编码编号#,@交易编码状态#,@临时_交易编码状态#] */
    if v_futu_acco_status = "1" and v_tmp_futu_acco_status = "1" then
        
        SET v_error_code = "pdfofuA.1.48.163";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","交易编码状态=",v_futu_acco_status,",","临时_交易编码状态=",v_tmp_futu_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","交易编码状态=",v_futu_acco_status,",","临时_交易编码状态=",v_tmp_futu_acco_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@交易编码状态# = 《交易编码状态-正常》 and @临时_交易编码状态# = 《交易编码状态-注销》][162][@资产账户编号#,@交易编码编号#,@交易编码状态#,@临时_交易编码状态#] */
    if v_futu_acco_status = "1" and v_tmp_futu_acco_status = "3" then
        
        SET v_error_code = "pdfofuA.1.48.162";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","交易编码状态=",v_futu_acco_status,",","临时_交易编码状态=",v_tmp_futu_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","交易编码状态=",v_futu_acco_status,",","临时_交易编码状态=",v_tmp_futu_acco_status);
        end if;
        leave label_pro;
    end if;

    #注销产品检查

    /* [检查报错返回][@交易编码状态# = 《交易编码状态-注销》 and @临时_交易编码状态# = 《交易编码状态-冻结》][161][@资产账户编号#,@交易编码编号#,@交易编码状态#,@临时_交易编码状态#] */
    if v_futu_acco_status = "3" and v_tmp_futu_acco_status = "2" then
        
        SET v_error_code = "pdfofuA.1.48.161";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","交易编码状态=",v_futu_acco_status,",","临时_交易编码状态=",v_tmp_futu_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","交易编码状态=",v_futu_acco_status,",","临时_交易编码状态=",v_tmp_futu_acco_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@交易编码状态# = 《交易编码状态-注销》 and @临时_交易编码状态# = 《交易编码状态-注销》][162][@资产账户编号#,@交易编码编号#,@交易编码状态#,@临时_交易编码状态#] */
    if v_futu_acco_status = "3" and v_tmp_futu_acco_status = "3" then
        
        SET v_error_code = "pdfofuA.1.48.162";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","交易编码状态=",v_futu_acco_status,",","临时_交易编码状态=",v_tmp_futu_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","交易编码状态=",v_futu_acco_status,",","临时_交易编码状态=",v_tmp_futu_acco_status);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_账户_查询外盘期货账户列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoac_QueryFoFutuAccoList;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoac_QueryFoFutuAccoList(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* [获取表全记录][产品外盘期货_账户_外盘期货账户信息表][字段][{机构编号}=@机构编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, futu_acco_no, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco, futu_acco_name, futu_acco_status, allow_contrc_type, 
        busi_limit_str, remark_info from db_pdfofu.tb_pdfoac_fofutuacco where co_no=v_co_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


