DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_获取机器日期时间
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_GetMachDateTime;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_GetMachDateTime(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_mach_date int,
    OUT p_mach_time int
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
    declare v_mach_date int;
    declare v_mach_time int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_mach_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@机器日期#] */
    select date_format(curdate(),'%Y%m%d') into v_mach_date;


    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_mach_date = v_mach_date;
    SET p_mach_time = v_mach_time;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_修改机构信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_ModiCoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_ModiCoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_co_name varchar(64),
    IN p_conta_addr varchar(255),
    IN p_conta_name varchar(64),
    IN p_phone_number varchar(16),
    IN p_comm_appr_oper int,
    IN p_market_price_ratio decimal(18,12),
    IN p_base_crncy_type varchar(3),
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
    declare v_co_name varchar(64);
    declare v_conta_addr varchar(255);
    declare v_conta_name varchar(64);
    declare v_phone_number varchar(16);
    declare v_comm_appr_oper int;
    declare v_market_price_ratio decimal(18,12);
    declare v_base_crncy_type varchar(3);
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
    SET v_co_no = p_co_no;
    SET v_co_name = p_co_name;
    SET v_conta_addr = p_conta_addr;
    SET v_conta_name = p_conta_name;
    SET v_phone_number = p_phone_number;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_base_crncy_type = p_base_crncy_type;
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
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "机构名称", "|", "联系地址", "|", "联系人", "|", "电话", "|", "指令审批操作员", "|", "市价冻结浮动比例", "|", "基础币种", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_co_name, "|", v_conta_addr, "|", v_conta_name, "|", v_phone_number, "|", v_comm_appr_oper, "|", v_market_price_ratio, "|", v_base_crncy_type, "|", v_oper_remark_info, "|", v_menu_no, "|");

    #[更新表记录][公共_基础_机构信息表][{机构名称}=@机构名称#,{联系地址}=@联系地址#,{联系人}=@联系人#,{电话}=@电话#, {指令审批操作员}=@指令审批操作员#,{市价冻结浮动比例}=@市价冻结浮动比例#,{多账户交易分配设置}=@多账户交易分配设置#,{多账户交易账户选择}=@多账户交易账户选择#,{多账户交易数量设置}=@多账户交易数量设置#,{基础币种}=@基础币种#][{机构编号}=@机构编号#][2][@机构编号#]

    /* [更新表记录][公共_基础_机构信息表][{机构名称}=@机构名称#,{联系地址}=@联系地址#,{联系人}=@联系人#,{电话}=@电话#, {指令审批操作员}=@指令审批操作员#,{市价冻结浮动比例}=@市价冻结浮动比例#,{基础币种}=@基础币种#][{机构编号}=@机构编号#][2][@机构编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_co_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, co_name=v_co_name,conta_addr=v_conta_addr,conta_name=v_conta_name,phone_number=v_phone_number, comm_appr_oper=v_comm_appr_oper,market_price_ratio=v_market_price_ratio,base_crncy_type=v_base_crncy_type where co_no=v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.17.12.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_基础_机构信息表][{记录序号}][@记录序号#][{机构编号}=@机构编号#][4][@机构编号#] */
    select row_id into v_row_id from db_pub.tb_base_co_info where co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.17.12.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_co_name, "|", v_conta_addr, "|", v_conta_name, "|", v_phone_number, "|", v_comm_appr_oper, "|", v_market_price_ratio, "|", v_base_crncy_type, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_机构信息流水表][字段][字段变量][5][@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_co_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.17.12.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_修改机构业务控制配置串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_UpdateCoBusiConfigStr;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_UpdateCoBusiConfigStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_config_index int,
    IN p_config_value varchar(2048),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_busi_config_str varchar(64),
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
    declare v_co_no int;
    declare v_config_index int;
    declare v_config_value varchar(2048);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_config_str varchar(64);
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_co_no = p_co_no;
    SET v_config_index = p_config_index;
    SET v_config_value = p_config_value;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_config_str = " ";
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取流水变动][{配置位},{配置值},{业务控制配置串}][@配置位#,@配置值#,@业务控制配置串#] */
    set v_jour_occur_field = concat("配置位","|","配置值","|","业务控制配置串","|");
    set v_jour_occur_info = concat(v_config_index,"|",v_config_value,"|",v_busi_config_str,"|");


    /* [锁定获取表记录变量][公共_基础_机构信息表][{业务控制配置串}][@业务控制配置串#][{机构编号}=@机构编号#][4][@机构编号#] */
    select busi_config_str into v_busi_config_str from db_pub.tb_base_co_info where co_no=v_co_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.17.13.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* set @业务控制配置串# = concat(left(@业务控制配置串#, @配置位#-1), left(@配置值#,1), right(@业务控制配置串#,LENGTH(@业务控制配置串#)-@配置位#)); */
    set v_busi_config_str = concat(left(v_busi_config_str, v_config_index-1), left(v_config_value,1), right(v_busi_config_str,LENGTH(v_busi_config_str)-v_config_index));

    /* [更新表记录][公共_基础_机构信息表][{业务控制配置串}=@业务控制配置串#][{机构编号}=@机构编号#][2][@机构编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_co_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, busi_config_str=v_busi_config_str where co_no=v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.17.13.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@配置位#,@配置值#,@业务控制配置串#] */
    set v_jour_after_occur_info = concat(v_config_index,"|",v_config_value,"|",v_busi_config_str,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_机构信息流水表][字段][字段变量][5][@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_co_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.17.13.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取表记录变量语句][公共_基础_机构信息表][{业务控制配置串},{更新次数}][@业务控制配置串#,@更新次数#][{机构编号}=@机构编号#] */
    select busi_config_str,update_times into v_busi_config_str,v_update_times from db_pub.tb_base_co_info where co_no=v_co_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_config_str = v_busi_config_str;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_查询机构信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_QueryCoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_QueryCoInfo(
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
    

    /* [获取表全记录][公共_基础_机构信息表][{记录序号},{机构编号},{机构名称},{机构类型},{创建日期},{联系地址},{联系人},{电话},{产品数量上限},{账户数量上限},{操作员数量上限},{机构状态},{允许投资市场},{允许操作证券类型},{业务控制配置串},{指令审批操作员},{市价冻结浮动比例},{多账户交易分配设置},{多账户交易账户选择},{多账户交易数量设置},{金纳算法策略设置},{基础币种}][{机构编号}=@机构编号#] */
    select row_id,co_no,co_name,co_type,create_date,conta_addr,conta_name,phone_number,pd_qty_max,max_acco_count,opor_qty_max,co_status,allow_exch,allow_stock_type,busi_config_str,comm_appr_oper,market_price_ratio,mul_acco_trd_assign_set,mul_acco_trd_choice,mul_acco_trd_qty_set,genus_algo_strategy_set,base_crncy_type from db_pub.tb_base_co_info where co_no=v_co_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_查询系统配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_QuerySysConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_QuerySysConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_config_no_str varchar(2048),
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
    declare v_config_no_str varchar(2048);
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
    SET v_config_no_str = p_config_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_系统配置表][{记录序号},{机构编号},{配置编号},{配置名称},{配置选择模式},{配置值},{字典字段名},{配置说明}][{机构编号}=@机构编号# and (@配置编号串# = "; ;" or instr(@配置编号串#, concat(";", {配置编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,co_no,config_no,config_name,config_choice_type,config_value,dict_field_name,config_memo from db_pub.tb_base_sys_config where co_no=v_co_no and (v_config_no_str = "; ;" or instr(v_config_no_str, concat(";", config_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id,co_no,config_no,config_name,config_choice_type,config_value,dict_field_name,config_memo from db_pub.tb_base_sys_config where co_no=v_co_no and (v_config_no_str = "; ;" or instr(v_config_no_str, concat(";", config_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_查询机构汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_QueryCoExchRate;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_QueryCoExchRate(
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
    

    /* [获取表全记录][公共_基础_机构汇率表][{记录序号},{机构编号},{外币币种},{本币币种},{购汇汇率},{售汇汇率}][{机构编号} = @机构编号#] */
    select row_id,co_no,for_crncy_type,crncy_type,buy_exch_rate,sale_exch_rate from db_pub.tb_base_co_exch_rate where co_no = v_co_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_获取港股通汇率信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_GetHKRate;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_GetHKRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_sh_hk_buy_ref_rate decimal(18,12),
    OUT p_sh_hk_sell_ref_rate decimal(18,12),
    OUT p_sh_hk_settle_buy_rate decimal(18,12),
    OUT p_sh_hk_settle_sell_rate decimal(18,12),
    OUT p_sz_hk_buy_ref_rate decimal(18,12),
    OUT p_sz_hk_sell_ref_rate decimal(18,12),
    OUT p_sz_hk_settle_buy_rate decimal(18,12),
    OUT p_sz_hksettle_sell_rate decimal(18,12),
    OUT p_pboc_rate decimal(18,12)
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
    declare v_sh_hk_buy_ref_rate decimal(18,12);
    declare v_sh_hk_sell_ref_rate decimal(18,12);
    declare v_sh_hk_settle_buy_rate decimal(18,12);
    declare v_sh_hk_settle_sell_rate decimal(18,12);
    declare v_sz_hk_buy_ref_rate decimal(18,12);
    declare v_sz_hk_sell_ref_rate decimal(18,12);
    declare v_sz_hk_settle_buy_rate decimal(18,12);
    declare v_sz_hksettle_sell_rate decimal(18,12);
    declare v_pboc_rate decimal(18,12);
    declare v_init_date int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sh_hk_buy_ref_rate = 0;
    SET v_sh_hk_sell_ref_rate = 0;
    SET v_sh_hk_settle_buy_rate = 0;
    SET v_sh_hk_settle_sell_rate = 0;
    SET v_sz_hk_buy_ref_rate = 0;
    SET v_sz_hk_sell_ref_rate = 0;
    SET v_sz_hk_settle_buy_rate = 0;
    SET v_sz_hksettle_sell_rate = 0;
    SET v_pboc_rate = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][{初始化日期}][@初始化日期#][1=1][4][" "] */
    select init_date into v_init_date from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.17.117.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* set @市场编号# = 《市场编号-沪港通证券交易所》; */
    set v_exch_no = 3;

    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入参考汇率},{卖出参考汇率}][@沪港通买入参考汇率#,@沪港通卖出参考汇率#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# and {买入参考汇率}<>0 and {卖出参考汇率}<>0 order by {初始化日期} desc] */
    select buy_ref_rate,sell_ref_rate into v_sh_hk_buy_ref_rate,v_sh_hk_sell_ref_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date and buy_ref_rate<>0 and sell_ref_rate<>0 order by init_date desc limit 1;


    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@沪港通买入结算汇率#,@沪港通卖出结算汇率#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# and {买入结算汇率}<>0 and {卖出结算汇率}<>0 order by {初始化日期} desc] */
    select settle_buy_rate,settle_sell_rate into v_sh_hk_settle_buy_rate,v_sh_hk_settle_sell_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date and settle_buy_rate<>0 and settle_sell_rate<>0 order by init_date desc limit 1;


    /* [获取表记录变量语句][公共_基础_港股通汇率表][{中国人行汇率}][@中国人行汇率#][{市场编号} = @市场编号# and {中国人行汇率} <> 0 and {初始化日期} <= @初始化日期#  order by {初始化日期} desc] */
    select pboc_rate into v_pboc_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and pboc_rate <> 0 and init_date <= v_init_date  order by init_date desc limit 1;


    /* set @市场编号# = 《市场编号-深港通证券交易所》; */
    set v_exch_no = 4;

    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入参考汇率},{卖出参考汇率}][@深港通买入参考汇率#,@深港通卖出参考汇率#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# and {买入参考汇率}<>0 and {卖出参考汇率}<>0 order by {初始化日期} desc] */
    select buy_ref_rate,sell_ref_rate into v_sz_hk_buy_ref_rate,v_sz_hk_sell_ref_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date and buy_ref_rate<>0 and sell_ref_rate<>0 order by init_date desc limit 1;


    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@深港通买入结算汇率#,@深港通卖出结算汇率#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# and {买入结算汇率}<>0 and {卖出结算汇率}<>0 order by {初始化日期} desc] */
    select settle_buy_rate,settle_sell_rate into v_sz_hk_settle_buy_rate,v_sz_hksettle_sell_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date and settle_buy_rate<>0 and settle_sell_rate<>0 order by init_date desc limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_sh_hk_buy_ref_rate = v_sh_hk_buy_ref_rate;
    SET p_sh_hk_sell_ref_rate = v_sh_hk_sell_ref_rate;
    SET p_sh_hk_settle_buy_rate = v_sh_hk_settle_buy_rate;
    SET p_sh_hk_settle_sell_rate = v_sh_hk_settle_sell_rate;
    SET p_sz_hk_buy_ref_rate = v_sz_hk_buy_ref_rate;
    SET p_sz_hk_sell_ref_rate = v_sz_hk_sell_ref_rate;
    SET p_sz_hk_settle_buy_rate = v_sz_hk_settle_buy_rate;
    SET p_sz_hksettle_sell_rate = v_sz_hksettle_sell_rate;
    SET p_pboc_rate = v_pboc_rate;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_更新港股通额度信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_UpdateHKLimitInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_UpdateHKLimitInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_begin_limit decimal(18,4),
    IN p_remain_limit decimal(18,4),
    IN p_limit_status int,
    IN p_remark_info varchar(255),
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
    declare v_begin_limit decimal(18,4);
    declare v_remain_limit decimal(18,4);
    declare v_limit_status int;
    declare v_remark_info varchar(255);
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
    SET v_begin_limit = p_begin_limit;
    SET v_remain_limit = p_remain_limit;
    SET v_limit_status = p_limit_status;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [插入重复更新][公共_基础_港股通额度表][字段][字段变量][{当日初始额度}=@当日初始额度#,{当日剩余额度}=@当日剩余额度#,{额度状态}=@额度状态#,{备注信息}=@备注信息#][1][@市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_hk_limit_info (
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, begin_limit, 
        remain_limit, limit_status, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_no, v_begin_limit, 
        v_remain_limit, v_limit_status, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, begin_limit=v_begin_limit,remain_limit=v_remain_limit,limit_status=v_limit_status,remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.17.118.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_基础_港股通额度表][{更新次数}][@更新次数#][{市场编号}=@市场编号#][4][@市场编号#] */
    select update_times into v_update_times from db_pub.tb_base_hk_limit_info where exch_no=v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.17.118.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
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

# 原子_公共_基础客户端_查询港股通额度信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_QueryHKLimitInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_QueryHKLimitInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    declare v_exch_no int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][公共_基础_港股通额度表][字段][@市场编号#=0 or {市场编号}=@市场编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        begin_limit, remain_limit, limit_status, remark_info from db_pub.tb_base_hk_limit_info where v_exch_no=0 or exch_no=v_exch_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_上线通道
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_LoginChannel;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_LoginChannel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_online_status int;
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
    SET v_pass_no = p_pass_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_online_status = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][公共_基础_通道信息表][{在线状态}][@在线状态#][{通道编号}=@通道编号#][4][@通道编号#] */
    select online_status into v_online_status from db_pub.tb_base_channel_info where pass_no=v_pass_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.17.154.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@在线状态#<>《在线状态-离线》][82][@通道编号#] */
    if v_online_status<>2 then
        
        SET v_error_code = "pubA.17.154.82";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_基础_通道信息表][{在线状态}=《在线状态-在线》][{通道编号}=@通道编号#][2][@通道编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_channel_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, online_status=1 where pass_no=v_pass_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.17.154.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_下线通道
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_LogoutChannel;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_LogoutChannel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_online_status int;
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
    SET v_pass_no = p_pass_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_online_status = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_通道信息表][{在线状态}][@在线状态#][{通道编号}=@通道编号#][4][@通道编号#] */
    select online_status into v_online_status from db_pub.tb_base_channel_info where pass_no=v_pass_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.17.155.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_基础_通道信息表][{在线状态}=《在线状态-离线》][{通道编号}=@通道编号#][2][@通道编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_channel_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, online_status=2 where pass_no=v_pass_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.17.155.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_查询数据字典
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_QueryDictionary;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_QueryDictionary(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_dict_no int,
    IN p_dict_item_name varchar(64),
    IN p_dict_field_name varchar(32),
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
    declare v_dict_no int;
    declare v_dict_item_name varchar(64);
    declare v_dict_field_name varchar(32);
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
    SET v_dict_no = p_dict_no;
    SET v_dict_item_name = p_dict_item_name;
    SET v_dict_field_name = p_dict_field_name;
    SET v_time_stamp = p_time_stamp;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_数据字典表][{记录序号},{字典编号},{字典名称},{字典字段名},{字典项名称},{字典项值},{时间戳}][(@字典编号# = 0 or {字典编号}=@字典编号#) and (@字典项名称# = " " or {字典项名称}=@字典项名称#) and (@字典字段名# = " " or {字典字段名}=@字典字段名#) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,dict_no,dict_name,dict_field_name,dict_item_name,dict_item_value,time_stamp from db_pub.tb_base_dictionary where (v_dict_no = 0 or dict_no=v_dict_no) and (v_dict_item_name = " " or dict_item_name=v_dict_item_name) and (v_dict_field_name = " " or dict_field_name=v_dict_field_name) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
        select row_id,dict_no,dict_name,dict_field_name,dict_item_name,dict_item_value,time_stamp from db_pub.tb_base_dictionary where (v_dict_no = 0 or dict_no=v_dict_no) and (v_dict_item_name = " " or dict_item_name=v_dict_item_name) and (v_dict_field_name = " " or dict_field_name=v_dict_field_name) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_查询业务标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_QueryBusiFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_QueryBusiFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_type int,
    IN p_busi_sub_type int,
    IN p_busi_flag int,
    IN p_busi_name varchar(64),
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
    declare v_busi_type int;
    declare v_busi_sub_type int;
    declare v_busi_flag int;
    declare v_busi_name varchar(64);
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
    SET v_busi_type = p_busi_type;
    SET v_busi_sub_type = p_busi_sub_type;
    SET v_busi_flag = p_busi_flag;
    SET v_busi_name = p_busi_name;
    SET v_time_stamp = p_time_stamp;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_基础_业务标志表][{记录序号},{业务类别},{业务子类},{业务标志},{业务名称},{时间戳}][(@业务类别# = 0 or {业务类别}=@业务类别#) and (@业务子类# = 0 or {业务子类}=@业务子类#) and (@业务标志# = 0 or {业务标志}=@业务标志#) and (@业务名称# = " " or {业务名称}=@业务名称#) and (@时间戳# = 0 or {时间戳} > @时间戳#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,busi_type,busi_sub_type,busi_flag,busi_name,time_stamp from db_pub.tb_base_busiflag where (v_busi_type = 0 or busi_type=v_busi_type) and (v_busi_sub_type = 0 or busi_sub_type=v_busi_sub_type) and (v_busi_flag = 0 or busi_flag=v_busi_flag) and (v_busi_name = " " or busi_name=v_busi_name) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id;
    else
        select row_id,busi_type,busi_sub_type,busi_flag,busi_name,time_stamp from db_pub.tb_base_busiflag where (v_busi_type = 0 or busi_type=v_busi_type) and (v_busi_sub_type = 0 or busi_sub_type=v_busi_sub_type) and (v_busi_flag = 0 or busi_flag=v_busi_flag) and (v_busi_name = " " or busi_name=v_busi_name) and (v_time_stamp = 0 or time_stamp > v_time_stamp) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_获取所需港股通汇率信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_GetHKRatePurposely;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_GetHKRatePurposely(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_sh_hk_buy_ref_rate decimal(18,12),
    OUT p_sh_hk_sell_ref_rate decimal(18,12),
    OUT p_sh_hk_settle_buy_rate decimal(18,12),
    OUT p_sh_hk_settle_sell_rate decimal(18,12),
    OUT p_sz_hk_buy_ref_rate decimal(18,12),
    OUT p_sz_hk_sell_ref_rate decimal(18,12),
    OUT p_sz_hk_settle_buy_rate decimal(18,12),
    OUT p_sz_hksettle_sell_rate decimal(18,12),
    OUT p_busin_date int,
    OUT p_pboc_rate decimal(18,12)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_query_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sh_hk_buy_ref_rate decimal(18,12);
    declare v_sh_hk_sell_ref_rate decimal(18,12);
    declare v_sh_hk_settle_buy_rate decimal(18,12);
    declare v_sh_hk_settle_sell_rate decimal(18,12);
    declare v_sz_hk_buy_ref_rate decimal(18,12);
    declare v_sz_hk_sell_ref_rate decimal(18,12);
    declare v_sz_hk_settle_buy_rate decimal(18,12);
    declare v_sz_hksettle_sell_rate decimal(18,12);
    declare v_busin_date int;
    declare v_pboc_rate decimal(18,12);
    declare v_init_date int;
    declare v_exch_no int;
    declare v_tmp_busin_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_query_date = p_query_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sh_hk_buy_ref_rate = 0;
    SET v_sh_hk_sell_ref_rate = 0;
    SET v_sh_hk_settle_buy_rate = 0;
    SET v_sh_hk_settle_sell_rate = 0;
    SET v_sz_hk_buy_ref_rate = 0;
    SET v_sz_hk_sell_ref_rate = 0;
    SET v_sz_hk_settle_buy_rate = 0;
    SET v_sz_hksettle_sell_rate = 0;
    SET v_busin_date = 0;
    SET v_pboc_rate = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_no = 0;
    SET v_tmp_busin_date = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][{初始化日期}][@初始化日期#][1=1][4][" "] */
    select init_date into v_init_date from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.17.120.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* if @查询日期#=0  then */
    if v_query_date=0  then

         /* set @市场编号# = 《市场编号-沪港通证券交易所》; */
         set v_exch_no = 3;

         /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入参考汇率},{卖出参考汇率},{中国人行汇率},{初始化日期}][@沪港通买入参考汇率#,@沪港通卖出参考汇率#,@中国人行汇率#,@业务日期#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期#  order by {初始化日期} desc] */
         select buy_ref_rate,sell_ref_rate,pboc_rate,init_date into v_sh_hk_buy_ref_rate,v_sh_hk_sell_ref_rate,v_pboc_rate,v_busin_date from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date  order by init_date desc limit 1;


         /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@沪港通买入结算汇率#,@沪港通卖出结算汇率#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期#  order by {初始化日期} desc] */
         select settle_buy_rate,settle_sell_rate into v_sh_hk_settle_buy_rate,v_sh_hk_settle_sell_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date  order by init_date desc limit 1;


         /* set @市场编号# = 《市场编号-深港通证券交易所》; */
         set v_exch_no = 4;

         /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入参考汇率},{卖出参考汇率},{中国人行汇率},{初始化日期}][@深港通买入参考汇率#,@深港通卖出参考汇率#,@中国人行汇率#,@临时_业务日期#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期#  order by {初始化日期} desc] */
         select buy_ref_rate,sell_ref_rate,pboc_rate,init_date into v_sz_hk_buy_ref_rate,v_sz_hk_sell_ref_rate,v_pboc_rate,v_tmp_busin_date from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date  order by init_date desc limit 1;


         /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@深港通买入结算汇率#,@深港通卖出结算汇率#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# order by {初始化日期} desc] */
         select settle_buy_rate,settle_sell_rate into v_sz_hk_settle_buy_rate,v_sz_hksettle_sell_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date order by init_date desc limit 1;


         /* [检查报错返回][@业务日期#<>@临时_业务日期#][4][@业务日期#,@临时_业务日期#,"该日期缺少汇率"] */
         if v_busin_date<>v_tmp_busin_date then
             
             SET v_error_code = "pubA.17.120.4";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("业务日期=",v_busin_date,",","临时_业务日期=",v_tmp_busin_date,",","该日期缺少汇率"),"#",v_mysql_message);
             else
                 SET v_error_info = concat("业务日期=",v_busin_date,",","临时_业务日期=",v_tmp_busin_date,",","该日期缺少汇率");
             end if;
             leave label_pro;
         end if;

    else

         /* set @市场编号# = 《市场编号-沪港通证券交易所》; */
         set v_exch_no = 3;

         /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入参考汇率},{卖出参考汇率},{中国人行汇率}][@沪港通买入参考汇率#,@沪港通卖出参考汇率#,@中国人行汇率#][{市场编号} = @市场编号# and {初始化日期} = @查询日期#  ] */
         select buy_ref_rate,sell_ref_rate,pboc_rate into v_sh_hk_buy_ref_rate,v_sh_hk_sell_ref_rate,v_pboc_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date = v_query_date   limit 1;


         /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@沪港通买入结算汇率#,@沪港通卖出结算汇率#][{市场编号} = @市场编号# and {初始化日期} = @查询日期# ] */
         select settle_buy_rate,settle_sell_rate into v_sh_hk_settle_buy_rate,v_sh_hk_settle_sell_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date = v_query_date  limit 1;


         /* set @市场编号# = 《市场编号-深港通证券交易所》; */
         set v_exch_no = 4;

         /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入参考汇率},{卖出参考汇率},{中国人行汇率}][@深港通买入参考汇率#,@深港通卖出参考汇率#,@中国人行汇率#][{市场编号} = @市场编号# and {初始化日期} = @查询日期# ] */
         select buy_ref_rate,sell_ref_rate,pboc_rate into v_sz_hk_buy_ref_rate,v_sz_hk_sell_ref_rate,v_pboc_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date = v_query_date  limit 1;


         /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@深港通买入结算汇率#,@深港通卖出结算汇率#][{市场编号} = @市场编号# and {初始化日期} = @查询日期#] */
         select settle_buy_rate,settle_sell_rate into v_sz_hk_settle_buy_rate,v_sz_hksettle_sell_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date = v_query_date limit 1;


         /* set @业务日期#=@查询日期#; */
         set v_busin_date=v_query_date;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_sh_hk_buy_ref_rate = v_sh_hk_buy_ref_rate;
    SET p_sh_hk_sell_ref_rate = v_sh_hk_sell_ref_rate;
    SET p_sh_hk_settle_buy_rate = v_sh_hk_settle_buy_rate;
    SET p_sh_hk_settle_sell_rate = v_sh_hk_settle_sell_rate;
    SET p_sz_hk_buy_ref_rate = v_sz_hk_buy_ref_rate;
    SET p_sz_hk_sell_ref_rate = v_sz_hk_sell_ref_rate;
    SET p_sz_hk_settle_buy_rate = v_sz_hk_settle_buy_rate;
    SET p_sz_hksettle_sell_rate = v_sz_hksettle_sell_rate;
    SET p_busin_date = v_busin_date;
    SET p_pboc_rate = v_pboc_rate;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_新增所需港股通汇率信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_AddHKRatePurposely;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_AddHKRatePurposely(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_sh_hk_buy_ref_rate decimal(18,12),
    IN p_sh_hk_sell_ref_rate decimal(18,12),
    IN p_sh_hk_settle_buy_rate decimal(18,12),
    IN p_sh_hk_settle_sell_rate decimal(18,12),
    IN p_sz_hk_buy_ref_rate decimal(18,12),
    IN p_sz_hk_sell_ref_rate decimal(18,12),
    IN p_sz_hk_settle_buy_rate decimal(18,12),
    IN p_sz_hksettle_sell_rate decimal(18,12),
    IN p_pboc_rate decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_sh_hk_buy_ref_rate decimal(18,12);
    declare v_sh_hk_sell_ref_rate decimal(18,12);
    declare v_sh_hk_settle_buy_rate decimal(18,12);
    declare v_sh_hk_settle_sell_rate decimal(18,12);
    declare v_sz_hk_buy_ref_rate decimal(18,12);
    declare v_sz_hk_sell_ref_rate decimal(18,12);
    declare v_sz_hk_settle_buy_rate decimal(18,12);
    declare v_sz_hksettle_sell_rate decimal(18,12);
    declare v_pboc_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_for_crncy_type varchar(3);
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_record_count int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
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
    SET v_sh_hk_buy_ref_rate = p_sh_hk_buy_ref_rate;
    SET v_sh_hk_sell_ref_rate = p_sh_hk_sell_ref_rate;
    SET v_sh_hk_settle_buy_rate = p_sh_hk_settle_buy_rate;
    SET v_sh_hk_settle_sell_rate = p_sh_hk_settle_sell_rate;
    SET v_sz_hk_buy_ref_rate = p_sz_hk_buy_ref_rate;
    SET v_sz_hk_sell_ref_rate = p_sz_hk_sell_ref_rate;
    SET v_sz_hk_settle_buy_rate = p_sz_hk_settle_buy_rate;
    SET v_sz_hksettle_sell_rate = p_sz_hksettle_sell_rate;
    SET v_pboc_rate = p_pboc_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_for_crncy_type = "CNY";
    SET v_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_record_count = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @外币币种#="HKD"; */
    set v_for_crncy_type="HKD";

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @市场编号#=3; */
    set v_exch_no=3;

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* set @买入参考汇率# = @沪港通买入参考汇率#; */
    set v_buy_ref_rate = v_sh_hk_buy_ref_rate;

    /* set @卖出参考汇率# = @沪港通卖出参考汇率#; */
    set v_sell_ref_rate = v_sh_hk_sell_ref_rate;

    /* set @买入结算汇率# = @沪港通买入结算汇率#; */
    set v_settle_buy_rate = v_sh_hk_settle_buy_rate;

    /* set @卖出结算汇率# = @沪港通卖出结算汇率#; */
    set v_settle_sell_rate = v_sh_hk_settle_sell_rate;

    /* [获取表记录数量][公共_基础_港股通汇率表][@记录个数#][{初始化日期}=@初始化日期# and {市场编号}=@市场编号#] */
    select count(1) into v_record_count from db_pub.tb_base_hk_exch_rate where init_date=v_init_date and exch_no=v_exch_no;


    /* [检查报错返回][@记录个数# >0][1][concat("已存在一条当日的港股通汇率记录！","日期:",@初始化日期#)] */
    if v_record_count >0 then
        
        SET v_error_code = "pubA.17.121.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("已存在一条当日的港股通汇率记录！","日期:",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("已存在一条当日的港股通汇率记录！","日期:",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* if @记录个数# =0  then */
    if v_record_count =0  then

             /* [插入表记录][公共_基础_港股通汇率表][字段][字段变量][1][@初始化日期#,@市场编号#]; */
             set v_create_date = date_format(curdate(),'%Y%m%d');
             set v_create_time = date_format(curtime(),'%H%i%s');
             set v_update_date = v_create_date;
             set v_update_time = v_create_time;
             set v_update_times = 1;
             insert into db_pub.tb_base_hk_exch_rate(
                 create_date, create_time, update_date, 
                 update_time, update_times, init_date, exch_no, 
                 for_crncy_type, crncy_type, buy_ref_rate, sell_ref_rate, 
                 settle_buy_rate, settle_sell_rate, pboc_rate) 
             value( 
                 v_create_date, v_create_time, v_update_date, 
                 v_update_time, v_update_times, v_init_date, v_exch_no, 
                 v_for_crncy_type, v_crncy_type, v_buy_ref_rate, v_sell_ref_rate, 
                 v_settle_buy_rate, v_settle_sell_rate, v_pboc_rate);
             if v_error_code = "1" then
                         
                 SET v_error_code = "pubA.17.121.1";
                 SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no),"#",v_mysql_message);
                 leave label_pro;
             end if;

    end if;

    /* set @市场编号#=4 ; */
    set v_exch_no=4 ;

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* set @买入参考汇率# = @深港通买入参考汇率#; */
    set v_buy_ref_rate = v_sz_hk_buy_ref_rate;

    /* set @卖出参考汇率# = @深港通卖出参考汇率#; */
    set v_sell_ref_rate = v_sz_hk_sell_ref_rate;

    /* set @买入结算汇率# = @深港通买入结算汇率#; */
    set v_settle_buy_rate = v_sz_hk_settle_buy_rate;

    /* set @卖出结算汇率# = @深港通卖出结算汇率#; */
    set v_settle_sell_rate = v_sz_hksettle_sell_rate;

    /* [获取表记录数量][公共_基础_港股通汇率表][@记录个数#][{初始化日期}=@初始化日期# and {市场编号}=@市场编号#] */
    select count(1) into v_record_count from db_pub.tb_base_hk_exch_rate where init_date=v_init_date and exch_no=v_exch_no;


    /* [检查报错返回][@记录个数# >0][1][concat("已存在一条当日的港股通汇率记录！","日期:",@初始化日期#)] */
    if v_record_count >0 then
        
        SET v_error_code = "pubA.17.121.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("已存在一条当日的港股通汇率记录！","日期:",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("已存在一条当日的港股通汇率记录！","日期:",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* if @记录个数# =0  then */
    if v_record_count =0  then

             /* [插入表记录][公共_基础_港股通汇率表][字段][字段变量][1][@初始化日期#,@市场编号#]; */
             set v_create_date = date_format(curdate(),'%Y%m%d');
             set v_create_time = date_format(curtime(),'%H%i%s');
             set v_update_date = v_create_date;
             set v_update_time = v_create_time;
             set v_update_times = 1;
             insert into db_pub.tb_base_hk_exch_rate(
                 create_date, create_time, update_date, 
                 update_time, update_times, init_date, exch_no, 
                 for_crncy_type, crncy_type, buy_ref_rate, sell_ref_rate, 
                 settle_buy_rate, settle_sell_rate, pboc_rate) 
             value( 
                 v_create_date, v_create_time, v_update_date, 
                 v_update_time, v_update_times, v_init_date, v_exch_no, 
                 v_for_crncy_type, v_crncy_type, v_buy_ref_rate, v_sell_ref_rate, 
                 v_settle_buy_rate, v_settle_sell_rate, v_pboc_rate);
             if v_error_code = "1" then
                         
                 SET v_error_code = "pubA.17.121.1";
                 SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no),"#",v_mysql_message);
                 leave label_pro;
             end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_修改所需港股通汇率信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_EditHKRatePurposely;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_EditHKRatePurposely(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_sh_hk_buy_ref_rate decimal(18,12),
    IN p_sh_hk_sell_ref_rate decimal(18,12),
    IN p_sh_hk_settle_buy_rate decimal(18,12),
    IN p_sh_hk_settle_sell_rate decimal(18,12),
    IN p_sz_hk_buy_ref_rate decimal(18,12),
    IN p_sz_hk_sell_ref_rate decimal(18,12),
    IN p_sz_hk_settle_buy_rate decimal(18,12),
    IN p_sz_hksettle_sell_rate decimal(18,12),
    IN p_pboc_rate decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_sh_hk_buy_ref_rate decimal(18,12);
    declare v_sh_hk_sell_ref_rate decimal(18,12);
    declare v_sh_hk_settle_buy_rate decimal(18,12);
    declare v_sh_hk_settle_sell_rate decimal(18,12);
    declare v_sz_hk_buy_ref_rate decimal(18,12);
    declare v_sz_hk_sell_ref_rate decimal(18,12);
    declare v_sz_hk_settle_buy_rate decimal(18,12);
    declare v_sz_hksettle_sell_rate decimal(18,12);
    declare v_pboc_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
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
    SET v_sh_hk_buy_ref_rate = p_sh_hk_buy_ref_rate;
    SET v_sh_hk_sell_ref_rate = p_sh_hk_sell_ref_rate;
    SET v_sh_hk_settle_buy_rate = p_sh_hk_settle_buy_rate;
    SET v_sh_hk_settle_sell_rate = p_sh_hk_settle_sell_rate;
    SET v_sz_hk_buy_ref_rate = p_sz_hk_buy_ref_rate;
    SET v_sz_hk_sell_ref_rate = p_sz_hk_sell_ref_rate;
    SET v_sz_hk_settle_buy_rate = p_sz_hk_settle_buy_rate;
    SET v_sz_hksettle_sell_rate = p_sz_hksettle_sell_rate;
    SET v_pboc_rate = p_pboc_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @市场编号#=3; */
    set v_exch_no=3;

    /* [更新表记录][公共_基础_港股通汇率表][{买入参考汇率}=@沪港通买入参考汇率#,{卖出参考汇率}=@沪港通卖出参考汇率#,{买入结算汇率}=@沪港通买入结算汇率#,{卖出结算汇率}=@沪港通卖出结算汇率#,{中国人行汇率}=@中国人行汇率#][{初始化日期}=@初始化日期# and {市场编号}=@市场编号#][2][@初始化日期#,@市场编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_hk_exch_rate set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, buy_ref_rate=v_sh_hk_buy_ref_rate,sell_ref_rate=v_sh_hk_sell_ref_rate,settle_buy_rate=v_sh_hk_settle_buy_rate,settle_sell_rate=v_sh_hk_settle_sell_rate,pboc_rate=v_pboc_rate where init_date=v_init_date and exch_no=v_exch_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.17.122.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* set @市场编号#=4; */
    set v_exch_no=4;

    /* [更新表记录][公共_基础_港股通汇率表][{买入参考汇率}=@深港通买入参考汇率#,{卖出参考汇率}=@深港通卖出参考汇率#,{买入结算汇率}=@深港通买入结算汇率#,{卖出结算汇率}=@深港通卖出结算汇率#,{中国人行汇率}=@中国人行汇率#][{初始化日期}=@初始化日期# and {市场编号}=@市场编号#][2][@初始化日期#,@市场编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_hk_exch_rate set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, buy_ref_rate=v_sz_hk_buy_ref_rate,sell_ref_rate=v_sz_hk_sell_ref_rate,settle_buy_rate=v_sz_hk_settle_buy_rate,settle_sell_rate=v_sz_hksettle_sell_rate,pboc_rate=v_pboc_rate where init_date=v_init_date and exch_no=v_exch_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.17.122.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_修改新股代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_EditNewStockInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_EditNewStockInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_apply_date int,
    IN p_apply_limit decimal(18,2),
    IN p_begin_trade_date int,
    IN p_issue_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_apply_date int;
    declare v_apply_limit decimal(18,2);
    declare v_begin_trade_date int;
    declare v_issue_price decimal(16,9);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_apply_date = p_apply_date;
    SET v_apply_limit = p_apply_limit;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_issue_price = p_issue_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_证券基础数据_证券新股代码信息表][{申购日期}=@申购日期#,{申购上限}=@申购上限#,{上市日期}=@上市日期#,{发行价}=@发行价#][{市场编号}=@市场编号# and {交易代码}=@证券代码#][2][@证券代码#,@市场编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_new_stock_code_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, apply_date=v_apply_date,apply_limit=v_apply_limit,begin_trade_date=v_begin_trade_date,issue_price=v_issue_price where exch_no=v_exch_no and trade_code=v_stock_code;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.17.123.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码=",v_stock_code,",","市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码=",v_stock_code,",","市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_修改可转债代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_EditConvertibleBbondInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_EditConvertibleBbondInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_apply_date int,
    IN p_apply_limit decimal(18,2),
    IN p_begin_trade_date int,
    IN p_issue_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_apply_date int;
    declare v_apply_limit decimal(18,2);
    declare v_begin_trade_date int;
    declare v_issue_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_apply_date = p_apply_date;
    SET v_apply_limit = p_apply_limit;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_issue_price = p_issue_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_trade_code = " ";

    
    label_pro:BEGIN
    
    #进来的 证券代码 实际为 申购代码。

    /* [更新表记录][公共_证券基础数据_可转债代码信息表][{申购日期}=@申购日期#,{申购上限}=@申购上限#,{上市日期}=@上市日期#,{发行价}=@发行价#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][2][@证券代码#,@市场编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_convertible_bond_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, apply_date=v_apply_date,apply_limit=v_apply_limit,begin_trade_date=v_begin_trade_date,issue_price=v_issue_price where exch_no=v_exch_no and stock_code=v_stock_code;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.17.124.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码=",v_stock_code,",","市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码=",v_stock_code,",","市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_可转债代码信息表][{交易代码}][@交易代码#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][2][@证券代码#,@市场编号#] */
    select trade_code into v_trade_code from db_pub.tb_basesedt_convertible_bond_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.17.124.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码=",v_stock_code,",","市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码=",v_stock_code,",","市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_证券基础数据_债券属性信息表][{上市日期}=@上市日期#,{发行价}=@发行价#][{市场编号}=@市场编号# and {证券代码}=@交易代码#][2][@交易代码#,@市场编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_basesedt_bond_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_trade_date=v_begin_trade_date,issue_price=v_issue_price where exch_no=v_exch_no and stock_code=v_trade_code;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.17.124.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易代码=",v_trade_code,",","市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易代码=",v_trade_code,",","市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_新增对冲篮子信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_AddHedgingBasket;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_AddHedgingBasket(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_record_batch_no int,
    IN p_co_no int,
    IN p_comm_trd_type int,
    IN p_basket_id bigint,
    IN p_basket_name varchar(64),
    IN p_futu_qty decimal(18,2),
    IN p_spot_qty decimal(18,2),
    IN p_basket_copies decimal(18,2),
    IN p_cash_replace_amt decimal(18,4),
    IN p_hedging_pankou decimal(18,4),
    IN p_name_base_diff decimal(18,4),
    IN p_basket_base_diff decimal(18,4),
    IN p_track_base_diff decimal(18,4),
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
    declare v_init_date int;
    declare v_record_batch_no int;
    declare v_co_no int;
    declare v_comm_trd_type int;
    declare v_basket_id bigint;
    declare v_basket_name varchar(64);
    declare v_futu_qty decimal(18,2);
    declare v_spot_qty decimal(18,2);
    declare v_basket_copies decimal(18,2);
    declare v_cash_replace_amt decimal(18,4);
    declare v_hedging_pankou decimal(18,4);
    declare v_name_base_diff decimal(18,4);
    declare v_basket_base_diff decimal(18,4);
    declare v_track_base_diff decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_remain_copies decimal(18,2);
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
    SET v_record_batch_no = p_record_batch_no;
    SET v_co_no = p_co_no;
    SET v_comm_trd_type = p_comm_trd_type;
    SET v_basket_id = p_basket_id;
    SET v_basket_name = p_basket_name;
    SET v_futu_qty = p_futu_qty;
    SET v_spot_qty = p_spot_qty;
    SET v_basket_copies = p_basket_copies;
    SET v_cash_replace_amt = p_cash_replace_amt;
    SET v_hedging_pankou = p_hedging_pankou;
    SET v_name_base_diff = p_name_base_diff;
    SET v_basket_base_diff = p_basket_base_diff;
    SET v_track_base_diff = p_track_base_diff;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_remain_copies = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @篮子剩余份数#=@篮子份数#; */
    set v_remain_copies=v_basket_copies;

    /* [插入表记录][公共_基础客户端_对冲篮子信息表][字段][字段变量][1][@机构编号#,@记录批号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_baseclient_hedgingbasket(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        record_batch_no, comm_trd_type, basket_id, basket_name, 
        futu_qty, spot_qty, basket_copies, remain_copies, 
        cash_replace_amt, hedging_pankou, name_base_diff, basket_base_diff, 
        track_base_diff) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_record_batch_no, v_comm_trd_type, v_basket_id, v_basket_name, 
        v_futu_qty, v_spot_qty, v_basket_copies, v_remain_copies, 
        v_cash_replace_amt, v_hedging_pankou, v_name_base_diff, v_basket_base_diff, 
        v_track_base_diff);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.17.125.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","记录批号=",v_record_batch_no),"#",v_mysql_message);
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

# 原子_公共_基础客户端_查询对冲篮子信息结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_QueryHedgingBasketList;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_QueryHedgingBasketList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_trd_type int,
    IN p_record_batch_no int,
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
    declare v_co_no int;
    declare v_comm_trd_type int;
    declare v_record_batch_no int;
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
    SET v_co_no = p_co_no;
    SET v_comm_trd_type = p_comm_trd_type;
    SET v_record_batch_no = p_record_batch_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][公共_基础客户端_对冲篮子信息表][字段][({机构编号}=@机构编号# or @机构编号# =0 )  and (@指令交易标志#=0 or {指令交易标志} = @指令交易标志#) and (@记录批号# =0 or {记录批号} = @记录批号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, record_batch_no, comm_trd_type, basket_id, 
            basket_name, futu_qty, spot_qty, basket_copies, 
            remain_copies, cash_replace_amt, hedging_pankou, name_base_diff, 
            basket_base_diff, track_base_diff from db_pub.tb_baseclient_hedgingbasket where (co_no=v_co_no or v_co_no =0 )  and (v_comm_trd_type=0 or comm_trd_type = v_comm_trd_type) and (v_record_batch_no =0 or record_batch_no = v_record_batch_no) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, record_batch_no, comm_trd_type, basket_id, 
            basket_name, futu_qty, spot_qty, basket_copies, 
            remain_copies, cash_replace_amt, hedging_pankou, name_base_diff, 
            basket_base_diff, track_base_diff from db_pub.tb_baseclient_hedgingbasket where (co_no=v_co_no or v_co_no =0 )  and (v_comm_trd_type=0 or comm_trd_type = v_comm_trd_type) and (v_record_batch_no =0 or record_batch_no = v_record_batch_no) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][公共_基础客户端_对冲篮子信息表][字段][({机构编号}=@机构编号# or @机构编号# =0 )  and (@指令交易标志#=0 or {指令交易标志} = @指令交易标志#) and (@记录批号# =0 or {记录批号} = @记录批号#) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, record_batch_no, comm_trd_type, basket_id, 
            basket_name, futu_qty, spot_qty, basket_copies, 
            remain_copies, cash_replace_amt, hedging_pankou, name_base_diff, 
            basket_base_diff, track_base_diff from db_pub.tb_baseclient_hedgingbasket where (co_no=v_co_no or v_co_no =0 )  and (v_comm_trd_type=0 or comm_trd_type = v_comm_trd_type) and (v_record_batch_no =0 or record_batch_no = v_record_batch_no) and row_id<v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, record_batch_no, comm_trd_type, basket_id, 
            basket_name, futu_qty, spot_qty, basket_copies, 
            remain_copies, cash_replace_amt, hedging_pankou, name_base_diff, 
            basket_base_diff, track_base_diff from db_pub.tb_baseclient_hedgingbasket where (co_no=v_co_no or v_co_no =0 )  and (v_comm_trd_type=0 or comm_trd_type = v_comm_trd_type) and (v_record_batch_no =0 or record_batch_no = v_record_batch_no) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_查询历史对冲篮子信息结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_QueryHisHedgingBasketList;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_QueryHisHedgingBasketList(
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
    IN p_comm_trd_type int,
    IN p_record_batch_no int,
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
    declare v_comm_trd_type int;
    declare v_record_batch_no int;
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
    SET v_comm_trd_type = p_comm_trd_type;
    SET v_record_batch_no = p_record_batch_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_基础客户端_对冲篮子信息表][字段][({机构编号}=@机构编号# or @机构编号# =0 )  and (@指令交易标志#=0 or {指令交易标志} = @指令交易标志#) and (@记录批号# =0 or {记录批号} = @记录批号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, record_batch_no, comm_trd_type, basket_id, 
        basket_name, futu_qty, spot_qty, basket_copies, 
        remain_copies, cash_replace_amt, hedging_pankou, name_base_diff, 
        basket_base_diff, track_base_diff from db_pub_his.tb_baseclient_hedgingbasket_his where (co_no=v_co_no or v_co_no =0 )  and (v_comm_trd_type=0 or comm_trd_type = v_comm_trd_type) and (v_record_batch_no =0 or record_batch_no = v_record_batch_no) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, record_batch_no, comm_trd_type, basket_id, 
        basket_name, futu_qty, spot_qty, basket_copies, 
        remain_copies, cash_replace_amt, hedging_pankou, name_base_diff, 
        basket_base_diff, track_base_diff from db_pub_his.tb_baseclient_hedgingbasket_his where (co_no=v_co_no or v_co_no =0 )  and (v_comm_trd_type=0 or comm_trd_type = v_comm_trd_type) and (v_record_batch_no =0 or record_batch_no = v_record_batch_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_修改对冲篮子信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_ModiHedgingBasket;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_ModiHedgingBasket(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_record_batch_no int,
    IN p_init_date int,
    IN p_co_no int,
    IN p_basket_copies decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_record_batch_no int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_basket_copies decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_basket_copies decimal(18,2);
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
    SET v_record_batch_no = p_record_batch_no;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_basket_copies = p_basket_copies;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_basket_copies = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_基础客户端_对冲篮子信息表][{篮子剩余份数}][@临时_篮子份数#][{初始化日期}=@初始化日期# and {记录批号}=@记录批号# and {机构编号}=@机构编号#][1] */
    select remain_copies into v_tmp_basket_copies from db_pub.tb_baseclient_hedgingbasket where init_date=v_init_date and record_batch_no=v_record_batch_no and co_no=v_co_no limit 1;


    /* [更新表记录][公共_基础客户端_对冲篮子信息表][{篮子剩余份数}=(case when (@临时_篮子份数# - @篮子份数#) >=0 then (@临时_篮子份数# - @篮子份数#) else 0 end)][{初始化日期} = @初始化日期# and {记录批号} = @记录批号# and {机构编号} = @机构编号#][1][@记录批号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_baseclient_hedgingbasket set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, remain_copies=(case when (v_tmp_basket_copies - v_basket_copies) >=0 then (v_tmp_basket_copies - v_basket_copies) else 0 end) where init_date = v_init_date and record_batch_no = v_record_batch_no and co_no = v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.17.128.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录批号=",v_record_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录批号=",v_record_batch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_查询对冲篮子信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_QueryHedgingBasket;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_QueryHedgingBasket(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_init_date int,
    IN p_record_batch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_comm_trd_type int,
    OUT p_basket_id bigint,
    OUT p_basket_name varchar(64),
    OUT p_futu_qty decimal(18,2),
    OUT p_spot_qty decimal(18,2),
    OUT p_basket_copies decimal(18,2),
    OUT p_remain_copies decimal(18,2),
    OUT p_cash_replace_amt decimal(18,4),
    OUT p_hedging_pankou decimal(18,4),
    OUT p_name_base_diff decimal(18,4),
    OUT p_basket_base_diff decimal(18,4),
    OUT p_track_base_diff decimal(18,4),
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
    declare v_co_no int;
    declare v_init_date int;
    declare v_record_batch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_comm_trd_type int;
    declare v_basket_id bigint;
    declare v_basket_name varchar(64);
    declare v_futu_qty decimal(18,2);
    declare v_spot_qty decimal(18,2);
    declare v_basket_copies decimal(18,2);
    declare v_remain_copies decimal(18,2);
    declare v_cash_replace_amt decimal(18,4);
    declare v_hedging_pankou decimal(18,4);
    declare v_name_base_diff decimal(18,4);
    declare v_basket_base_diff decimal(18,4);
    declare v_track_base_diff decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_init_date = p_init_date;
    SET v_record_batch_no = p_record_batch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_comm_trd_type = 0;
    SET v_basket_id = 0;
    SET v_basket_name = " ";
    SET v_futu_qty = 0;
    SET v_spot_qty = 0;
    SET v_basket_copies = 0;
    SET v_remain_copies = 0;
    SET v_cash_replace_amt = 0;
    SET v_hedging_pankou = 0;
    SET v_name_base_diff = 0;
    SET v_basket_base_diff = 0;
    SET v_track_base_diff = 0;
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_基础客户端_对冲篮子信息表][字段][字段变量][{初始化日期}=@初始化日期# and {记录批号}=@记录批号# and {机构编号}=@机构编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, record_batch_no, comm_trd_type, basket_id, 
        basket_name, futu_qty, spot_qty, basket_copies, 
        remain_copies, cash_replace_amt, hedging_pankou, name_base_diff, 
        basket_base_diff, track_base_diff into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_record_batch_no, v_comm_trd_type, v_basket_id, 
        v_basket_name, v_futu_qty, v_spot_qty, v_basket_copies, 
        v_remain_copies, v_cash_replace_amt, v_hedging_pankou, v_name_base_diff, 
        v_basket_base_diff, v_track_base_diff from db_pub.tb_baseclient_hedgingbasket where init_date=v_init_date and record_batch_no=v_record_batch_no and co_no=v_co_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_comm_trd_type = v_comm_trd_type;
    SET p_basket_id = v_basket_id;
    SET p_basket_name = v_basket_name;
    SET p_futu_qty = v_futu_qty;
    SET p_spot_qty = v_spot_qty;
    SET p_basket_copies = v_basket_copies;
    SET p_remain_copies = v_remain_copies;
    SET p_cash_replace_amt = v_cash_replace_amt;
    SET p_hedging_pankou = v_hedging_pankou;
    SET p_name_base_diff = v_name_base_diff;
    SET p_basket_base_diff = v_basket_base_diff;
    SET p_track_base_diff = v_track_base_diff;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_归档公共基础客户端数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_BackUpClientData;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_BackUpClientData(
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
    declare v_table_name varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_table_name = " ";

    
    label_pro:BEGIN
    

    /* set @数据表名称# = "~公共_基础客户端_对冲篮子信息表^"; */
    set v_table_name = "db_pub.tb_baseclient_hedgingbasket";

    /* [数据归历史][公共_基础客户端_对冲篮子信息表][字段][{初始化日期}<=@初始化日期#][1010][@初始化日期#,@数据表名称#] */
    insert into db_pub_his.tb_baseclient_hedgingbasket_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, record_batch_no, comm_trd_type, basket_id, 
        basket_name, futu_qty, spot_qty, basket_copies, 
        remain_copies, cash_replace_amt, hedging_pankou, name_base_diff, 
        basket_base_diff, track_base_diff) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, record_batch_no, comm_trd_type, basket_id, 
        basket_name, futu_qty, spot_qty, basket_copies, 
        remain_copies, cash_replace_amt, hedging_pankou, name_base_diff, 
        basket_base_diff, track_base_diff 
        from db_pub.tb_baseclient_hedgingbasket 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.17.130.1010";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_基础客户端_对冲篮子信息表][1=1][3][@初始化日期#,@数据表名称#] */
    delete from db_pub.tb_baseclient_hedgingbasket 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.17.130.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_基础客户端_清空篮子剩余份数
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_baseclient_ClearHedgingBasketCpoies;;
DELIMITER ;;
CREATE PROCEDURE pra_baseclient_ClearHedgingBasketCpoies(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_comm_batch_no int,
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
    declare v_init_date int;
    declare v_comm_batch_no int;
    declare v_co_no int;
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
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_co_no = p_co_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_基础客户端_对冲篮子信息表][{篮子剩余份数} = 0 ][{记录批号}=@指令批号# and {初始化日期} = @初始化日期# and {机构编号} = @机构编号#][2][@指令批号#,@初始化日期#,@机构编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_baseclient_hedgingbasket set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, remain_copies = 0  where record_batch_no=v_comm_batch_no and init_date = v_init_date and co_no = v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.17.131.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令批号=",v_comm_batch_no,",","初始化日期=",v_init_date,",","机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令批号=",v_comm_batch_no,",","初始化日期=",v_init_date,",","机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


