DELIMITER ;;
use db_pub;;

# 原子_公共_用户_新增操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_AddOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_user_AddOperatorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_co_no int,
    IN p_opor_name varchar(64),
    IN p_opor_type int,
    IN p_target_opor_pwd varchar(64),
    IN p_conta_addr varchar(255),
    IN p_oper_rights int,
    IN p_phone_number varchar(16),
    IN p_email varchar(255),
    IN p_is_trader int,
    IN p_trader_no int,
    IN p_allow_login_type varchar(64),
    IN p_allow_oper_ip_addr varchar(255),
    IN p_allow_oper_mac varchar(255),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    IN p_opor_qty_max int,
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
    declare v_target_opor_no int;
    declare v_co_no int;
    declare v_opor_name varchar(64);
    declare v_opor_type int;
    declare v_target_opor_pwd varchar(64);
    declare v_conta_addr varchar(255);
    declare v_oper_rights int;
    declare v_phone_number varchar(16);
    declare v_email varchar(255);
    declare v_is_trader int;
    declare v_trader_no int;
    declare v_allow_login_type varchar(64);
    declare v_allow_oper_ip_addr varchar(255);
    declare v_allow_oper_mac varchar(255);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_opor_qty_max int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_opor int;
    declare v_tmp_opor_no int;
    declare v_opor_pwd varchar(64);
    declare v_opor_status varchar(2);
    declare v_manage_nolgn_opor_orders int;
    declare v_index_value int;
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_co_no = p_co_no;
    SET v_opor_name = p_opor_name;
    SET v_opor_type = p_opor_type;
    SET v_target_opor_pwd = p_target_opor_pwd;
    SET v_conta_addr = p_conta_addr;
    SET v_oper_rights = p_oper_rights;
    SET v_phone_number = p_phone_number;
    SET v_email = p_email;
    SET v_is_trader = p_is_trader;
    SET v_trader_no = p_trader_no;
    SET v_allow_login_type = p_allow_login_type;
    SET v_allow_oper_ip_addr = p_allow_oper_ip_addr;
    SET v_allow_oper_mac = p_allow_oper_mac;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_opor_qty_max = p_opor_qty_max;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_opor = 0;
    SET v_tmp_opor_no = 0;
    SET v_opor_pwd = " ";
    SET v_opor_status = "0";
    SET v_manage_nolgn_opor_orders = 0;
    SET v_index_value = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @记录个数#=0; */
    set v_record_count=0;

    /* [获取表记录数量][公共_用户_操作员信息表][@记录个数#][{机构编号}=@机构编号# and {操作员状态}<>"3"] */
    select count(1) into v_record_count from db_pub.tb_user_opor_info where co_no=v_co_no and opor_status<>"3";


    /* [检查报错返回][@记录个数#>=@操作员数量上限# and @操作员数量上限#<> 0][32][@机构编号#] */
    if v_record_count>=v_opor_qty_max and v_opor_qty_max<> 0 then
        
        SET v_error_code = "pubA.5.1.32";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "目标操作员编号", "|", "机构编号", "|", "操作员名称", "|", "操作员类型", "|", "目标操作员密码", "|", "联系地址", "|", "操作权限", "|", "电话", "|", "EMAIL", "|", "是否交易员", "|", "交易员编号", "|", "允许登录方式", "|", "允许操作IP", "|", "允许操作MAC", "|", "操作备注", "|", "菜单编号", "|", "操作员数量上限", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_target_opor_no, "|", v_co_no, "|", v_opor_name, "|", v_opor_type, "|", v_target_opor_pwd, "|", v_conta_addr, "|", v_oper_rights, "|", v_phone_number, "|", v_email, "|", v_is_trader, "|", v_trader_no, "|", v_allow_login_type, "|", v_allow_oper_ip_addr, "|", v_allow_oper_mac, "|", v_oper_remark_info, "|", v_menu_no, "|", v_opor_qty_max, "|");


    /* set @创建者# = @操作员编号#; */
    set v_create_opor = v_opor_no;

    /* set @临时_操作员编号# = @操作员编号#; */
    set v_tmp_opor_no = v_opor_no;

    /* set @操作员编号# = @目标操作员编号#; */
    set v_opor_no = v_target_opor_no;

    /* [操作员密码加密][@目标操作员密码#] */
    set v_target_opor_pwd = MD5(concat("LDOSM",v_target_opor_pwd));


    /* set @操作员密码# = @目标操作员密码#; */
    set v_opor_pwd = v_target_opor_pwd;

    /* set @操作员状态# = 《操作员状态-正常》; */
    set v_opor_status = "1";

    /* set @管理非登录操作员订单#=0; */
    set v_manage_nolgn_opor_orders=0;

    /* set @索引值# = 0; */
    set v_index_value = 0;

    /* [插入表记录][公共_用户_操作员信息表][字段][字段变量][1][@目标操作员编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_info(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, opor_no, 
        opor_name, opor_type, opor_pwd, opor_status, 
        create_opor, conta_addr, oper_rights, phone_number, 
        email, is_trader, trader_no, allow_login_type, 
        allow_oper_ip_addr, allow_oper_mac, index_value, manage_nolgn_opor_orders) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_opor_no, 
        v_opor_name, v_opor_type, v_opor_pwd, v_opor_status, 
        v_create_opor, v_conta_addr, v_oper_rights, v_phone_number, 
        v_email, v_is_trader, v_trader_no, v_allow_login_type, 
        v_allow_oper_ip_addr, v_allow_oper_mac, v_index_value, v_manage_nolgn_opor_orders);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.1.1";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_target_opor_no, "|", v_co_no, "|", v_opor_name, "|", v_opor_type, "|", v_target_opor_pwd, "|", v_conta_addr, "|", v_oper_rights, "|", v_phone_number, "|", v_email, "|", v_is_trader, "|", v_trader_no, "|", v_allow_login_type, "|", v_allow_oper_ip_addr, "|", v_allow_oper_mac, "|", v_oper_remark_info, "|", v_menu_no, "|", v_opor_qty_max, "|");


    /* set @操作员编号# = @临时_操作员编号#; */
    set v_opor_no = v_tmp_opor_no;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_用户_操作员信息流水表][字段][字段变量][5][@目标操作员编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        target_opor_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_target_opor_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.1.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_修改操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_ModiOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_user_ModiOperatorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_opor_name varchar(64),
    IN p_opor_type int,
    IN p_conta_addr varchar(255),
    IN p_phone_number varchar(16),
    IN p_email varchar(255),
    IN p_is_trader int,
    IN p_trader_no int,
    IN p_allow_login_type varchar(64),
    IN p_allow_oper_ip_addr varchar(255),
    IN p_allow_oper_mac varchar(255),
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
    declare v_target_opor_no int;
    declare v_opor_name varchar(64);
    declare v_opor_type int;
    declare v_conta_addr varchar(255);
    declare v_phone_number varchar(16);
    declare v_email varchar(255);
    declare v_is_trader int;
    declare v_trader_no int;
    declare v_allow_login_type varchar(64);
    declare v_allow_oper_ip_addr varchar(255);
    declare v_allow_oper_mac varchar(255);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_tmp_opor_no int;
    declare v_row_id bigint;
    declare v_co_no int;
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_opor_name = p_opor_name;
    SET v_opor_type = p_opor_type;
    SET v_conta_addr = p_conta_addr;
    SET v_phone_number = p_phone_number;
    SET v_email = p_email;
    SET v_is_trader = p_is_trader;
    SET v_trader_no = p_trader_no;
    SET v_allow_login_type = p_allow_login_type;
    SET v_allow_oper_ip_addr = p_allow_oper_ip_addr;
    SET v_allow_oper_mac = p_allow_oper_mac;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_opor_no = 0;
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "目标操作员编号", "|", "操作员名称", "|", "操作员类型", "|", "联系地址", "|", "电话", "|", "EMAIL", "|", "是否交易员", "|", "交易员编号", "|", "允许登录方式", "|", "允许操作IP", "|", "允许操作MAC", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_target_opor_no, "|", v_opor_name, "|", v_opor_type, "|", v_conta_addr, "|", v_phone_number, "|", v_email, "|", v_is_trader, "|", v_trader_no, "|", v_allow_login_type, "|", v_allow_oper_ip_addr, "|", v_allow_oper_mac, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][公共_用户_操作员信息表][{操作员名称}=@操作员名称#,{操作员类型}=@操作员类型#,{联系地址}=@联系地址#,{电话}=@电话#,{EMAIL}=@EMAIL#,{是否交易员}=@是否交易员#,{交易员编号}=@交易员编号#,{允许登录方式}=@允许登录方式#,{允许操作IP}=@允许操作IP#,{允许操作MAC}=@允许操作MAC#][{操作员编号}=@目标操作员编号#][2][@目标操作员编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, opor_name=v_opor_name,opor_type=v_opor_type,conta_addr=v_conta_addr,phone_number=v_phone_number,email=v_email,is_trader=v_is_trader,trader_no=v_trader_no,allow_login_type=v_allow_login_type,allow_oper_ip_addr=v_allow_oper_ip_addr,allow_oper_mac=v_allow_oper_mac where opor_no=v_target_opor_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.2.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;


    /* set @临时_操作员编号# = @操作员编号#; */
    set v_tmp_opor_no = v_opor_no;

    /* [获取表记录变量][公共_用户_操作员信息表][{记录序号},{机构编号}][@记录序号#,@机构编号#][{操作员编号}=@目标操作员编号#][4][@目标操作员编号#] */
    select row_id,co_no into v_row_id,v_co_no from db_pub.tb_user_opor_info where opor_no=v_target_opor_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.2.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_target_opor_no, "|", v_opor_name, "|", v_opor_type, "|", v_conta_addr, "|", v_phone_number, "|", v_email, "|", v_is_trader, "|", v_trader_no, "|", v_allow_login_type, "|", v_allow_oper_ip_addr, "|", v_allow_oper_mac, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @操作员编号# = @临时_操作员编号#; */
    set v_opor_no = v_tmp_opor_no;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_用户_操作员信息流水表][字段][字段变量][5][@目标操作员编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        target_opor_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_target_opor_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.2.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_获取操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_GetOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_user_GetOperatorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_opor_type int,
    OUT p_opor_name varchar(64),
    OUT p_oper_rights int,
    OUT p_is_trader int,
    OUT p_trader_no int,
    OUT p_allow_login_type varchar(64),
    OUT p_allow_oper_ip_addr varchar(255),
    OUT p_allow_oper_mac varchar(255),
    OUT p_conta_addr varchar(255),
    OUT p_phone_number varchar(16),
    OUT p_email varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_query_opor_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_opor_type int;
    declare v_opor_name varchar(64);
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_trader_no int;
    declare v_allow_login_type varchar(64);
    declare v_allow_oper_ip_addr varchar(255);
    declare v_allow_oper_mac varchar(255);
    declare v_conta_addr varchar(255);
    declare v_phone_number varchar(16);
    declare v_email varchar(255);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_opor_pwd varchar(64);
    declare v_opor_status varchar(2);
    declare v_create_opor int;
    declare v_index_value int;
    declare v_manage_nolgn_opor_orders int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_query_opor_no = p_query_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_opor_type = 0;
    SET v_opor_name = " ";
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_trader_no = 0;
    SET v_allow_login_type = " ";
    SET v_allow_oper_ip_addr = " ";
    SET v_allow_oper_mac = " ";
    SET v_conta_addr = " ";
    SET v_phone_number = " ";
    SET v_email = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_opor_pwd = " ";
    SET v_opor_status = "0";
    SET v_create_opor = 0;
    SET v_index_value = 0;
    SET v_manage_nolgn_opor_orders = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_用户_操作员信息表][字段][字段变量][{操作员编号}=@查询操作员编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, opor_name, opor_type, opor_pwd, 
        opor_status, create_opor, conta_addr, oper_rights, 
        phone_number, email, is_trader, trader_no, 
        allow_login_type, allow_oper_ip_addr, allow_oper_mac, index_value, 
        manage_nolgn_opor_orders into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_opor_no, v_opor_name, v_opor_type, v_opor_pwd, 
        v_opor_status, v_create_opor, v_conta_addr, v_oper_rights, 
        v_phone_number, v_email, v_is_trader, v_trader_no, 
        v_allow_login_type, v_allow_oper_ip_addr, v_allow_oper_mac, v_index_value, 
        v_manage_nolgn_opor_orders from db_pub.tb_user_opor_info where opor_no=v_query_opor_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_opor_type = v_opor_type;
    SET p_opor_name = v_opor_name;
    SET p_oper_rights = v_oper_rights;
    SET p_is_trader = v_is_trader;
    SET p_trader_no = v_trader_no;
    SET p_allow_login_type = v_allow_login_type;
    SET p_allow_oper_ip_addr = v_allow_oper_ip_addr;
    SET p_allow_oper_mac = v_allow_oper_mac;
    SET p_conta_addr = v_conta_addr;
    SET p_phone_number = v_phone_number;
    SET p_email = v_email;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_查询操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_QueryOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_user_QueryOperatorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_co_no int,
    IN p_is_trader int,
    IN p_opor_type_str varchar(64),
    IN p_opor_status_str varchar(64),
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
    declare v_query_opor_no int;
    declare v_co_no int;
    declare v_is_trader int;
    declare v_opor_type_str varchar(64);
    declare v_opor_status_str varchar(64);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_co_no = p_co_no;
    SET v_is_trader = p_is_trader;
    SET v_opor_type_str = p_opor_type_str;
    SET v_opor_status_str = p_opor_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #[获取表记录][公共_用户_操作员信息表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@查询操作员编号# = 0 or {操作员编号}=@查询操作员编号#) and (@是否交易员# = 0 or {是否交易员}=@是否交易员#) and (@操作员类型串# = "; ;" or instr(@操作员类型串#, concat(";", {操作员类型}, ";")) > 0) and (@操作员状态串# = "; ;" or instr(@操作员状态串#, concat(";", {操作员状态}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]
    #允许登录MAC 在oper_info表，允许操作MAC 从权限表取。

    /* if @指定行数# = -1 then */
    if v_row_count = -1 then

        /* SELECT a.{记录序号},a.{创建日期},a.{创建时间},a.{更新日期},a.{更新时间},a.{机构编号},a.{操作员编号},a.{操作员名称},a.{操作员类型},a.{操作员密码},a.{操作员状态},a.{创建者},a.{联系地址},a.{操作权限},a.{电话},a.{EMAIL},a.{是否交易员},a.{交易员编号},a.{允许登录方式},a.{允许操作IP},a.{允许操作MAC} AS {允许登录MAC},a.{管理非登录操作员订单},IFNULL(b.{允许操作MAC}," ") AS {允许操作MAC},IFNULL(b.{操作员权限串}," ") AS {操作员权限串}  FROM ~公共_用户_操作员信息表^  a
LEFT JOIN 
~公共_用户_操作员权限表^  b
ON a.{操作员编号}= b.{操作员编号}
WHERE
(@机构编号#=0 or a.{机构编号}=@机构编号#) and (@查询操作员编号# = 0 or a.{操作员编号}=@查询操作员编号#) and (@是否交易员# = 0 or a.{是否交易员}=@是否交易员#) and (@操作员类型串# = "; ;" or instr(@操作员类型串#, concat(";", a.{操作员类型}, ";")) > 0) and (@操作员状态串# = "; ;" or instr(@操作员状态串#, concat(";", a.{操作员状态}, ";")) > 0) and a.{记录序号} > @记录序号# order by a.{记录序号}; */
        SELECT a.row_id,a.create_date,a.create_time,a.update_date,a.update_time,a.co_no,a.opor_no,a.opor_name,a.opor_type,a.opor_pwd,a.opor_status,a.create_opor,a.conta_addr,a.oper_rights,a.phone_number,a.email,a.is_trader,a.trader_no,a.allow_login_type,a.allow_oper_ip_addr,a.allow_oper_mac AS allow_login_mac,a.manage_nolgn_opor_orders,IFNULL(b.allow_oper_mac," ") AS allow_oper_mac,IFNULL(b.opor_rights_str," ") AS opor_rights_str  FROM db_pub.tb_user_opor_info  a
        LEFT JOIN 
        db_pub.tb_user_opor_rights  b
        ON a.opor_no= b.opor_no
        WHERE
        (v_co_no=0 or a.co_no=v_co_no) and (v_query_opor_no = 0 or a.opor_no=v_query_opor_no) and (v_is_trader = 0 or a.is_trader=v_is_trader) and (v_opor_type_str = "; ;" or instr(v_opor_type_str, concat(";", a.opor_type, ";")) > 0) and (v_opor_status_str = "; ;" or instr(v_opor_status_str, concat(";", a.opor_status, ";")) > 0) and a.row_id > v_row_id order by a.row_id;
    else

        /* SELECT a.{记录序号},a.{创建日期},a.{创建时间},a.{更新日期},a.{更新时间},a.{机构编号},a.{操作员编号},a.{操作员名称},a.{操作员类型},a.{操作员密码},a.{操作员状态},a.{创建者},a.{联系地址},a.{操作权限},a.{电话},a.{EMAIL},a.{是否交易员},a.{交易员编号},a.{允许登录方式},a.{允许操作IP},a.{允许操作MAC} AS {允许登录MAC},a.{管理非登录操作员订单},IFNULL(b.{允许操作MAC}," ") AS {允许操作MAC},IFNULL(b.{操作员权限串}," ") AS {操作员权限串} FROM ~公共_用户_操作员信息表^  a
LEFT JOIN 
~公共_用户_操作员权限表^  b
ON a.{操作员编号}= b.{操作员编号}
WHERE
(@机构编号#=0 or a.{机构编号}=@机构编号#) and (@查询操作员编号# = 0 or a.{操作员编号}=@查询操作员编号#) and (@是否交易员# = 0 or a.{是否交易员}=@是否交易员#) and (@操作员类型串# = "; ;" or instr(@操作员类型串#, concat(";", a.{操作员类型}, ";")) > 0) and (@操作员状态串# = "; ;" or instr(@操作员状态串#, concat(";", a.{操作员状态}, ";")) > 0) and a.{记录序号} > @记录序号# order by a.{记录序号} LIMIT @指定行数#; */
        SELECT a.row_id,a.create_date,a.create_time,a.update_date,a.update_time,a.co_no,a.opor_no,a.opor_name,a.opor_type,a.opor_pwd,a.opor_status,a.create_opor,a.conta_addr,a.oper_rights,a.phone_number,a.email,a.is_trader,a.trader_no,a.allow_login_type,a.allow_oper_ip_addr,a.allow_oper_mac AS allow_login_mac,a.manage_nolgn_opor_orders,IFNULL(b.allow_oper_mac," ") AS allow_oper_mac,IFNULL(b.opor_rights_str," ") AS opor_rights_str FROM db_pub.tb_user_opor_info  a
        LEFT JOIN 
        db_pub.tb_user_opor_rights  b
        ON a.opor_no= b.opor_no
        WHERE
        (v_co_no=0 or a.co_no=v_co_no) and (v_query_opor_no = 0 or a.opor_no=v_query_opor_no) and (v_is_trader = 0 or a.is_trader=v_is_trader) and (v_opor_type_str = "; ;" or instr(v_opor_type_str, concat(";", a.opor_type, ";")) > 0) and (v_opor_status_str = "; ;" or instr(v_opor_status_str, concat(";", a.opor_status, ";")) > 0) and a.row_id > v_row_id order by a.row_id LIMIT v_row_count;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_检查操作员状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_CheckOperatorStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_user_CheckOperatorStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_target_opor_no int,
    IN p_opor_status varchar(2),
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
    declare v_target_opor_no int;
    declare v_opor_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_opor_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_target_opor_no = p_target_opor_no;
    SET v_opor_status = p_opor_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_opor_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_操作员信息表][{操作员状态}][@临时_操作员状态#][{操作员编号}=@目标操作员编号#][4][@目标操作员编号#] */
    select opor_status into v_tmp_opor_status from db_pub.tb_user_opor_info where opor_no=v_target_opor_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.5.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;

    #操作员状态检查

    /* [检查报错返回][@操作员状态# = 0 and @临时_操作员状态# = 《操作员状态-冻结》][61][@目标操作员编号#] */
    if v_opor_status = 0 and v_tmp_opor_status = "2" then
        
        SET v_error_code = "pubA.5.5.61";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@操作员状态# = 0 and @临时_操作员状态# = 《操作员状态-注销》][62][@目标操作员编号#] */
    if v_opor_status = 0 and v_tmp_opor_status = "3" then
        
        SET v_error_code = "pubA.5.5.62";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;

    #冻结操作员检查

    /* [检查报错返回][@操作员状态# = 《操作员状态-冻结》 and @临时_操作员状态# = 《操作员状态-冻结》][61][@目标操作员编号#] */
    if v_opor_status = "2" and v_tmp_opor_status = "2" then
        
        SET v_error_code = "pubA.5.5.61";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@操作员状态# = 《操作员状态-冻结》 and @临时_操作员状态# = 《操作员状态-注销》][62][@目标操作员编号#] */
    if v_opor_status = "2" and v_tmp_opor_status = "3" then
        
        SET v_error_code = "pubA.5.5.62";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;

    #恢复操作员检查

    /* [检查报错返回][@操作员状态# = 《操作员状态-正常》 and @临时_操作员状态# = 《操作员状态-正常》][63][@目标操作员编号#] */
    if v_opor_status = "1" and v_tmp_opor_status = "1" then
        
        SET v_error_code = "pubA.5.5.63";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@操作员状态# = 《操作员状态-正常》 and @临时_操作员状态# = 《操作员状态-注销》][62][@目标操作员编号#] */
    if v_opor_status = "1" and v_tmp_opor_status = "3" then
        
        SET v_error_code = "pubA.5.5.62";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;

    #注销操作员检查

    /* [检查报错返回][@操作员状态# = 《操作员状态-注销》 and @临时_操作员状态# = 《操作员状态-冻结》][61][@目标操作员编号#] */
    if v_opor_status = "3" and v_tmp_opor_status = "2" then
        
        SET v_error_code = "pubA.5.5.61";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@操作员状态# = 《操作员状态-注销》 and @临时_操作员状态# = 《操作员状态-注销》][62][@目标操作员编号#] */
    if v_opor_status = "3" and v_tmp_opor_status = "3" then
        
        SET v_error_code = "pubA.5.5.62";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_更新操作员状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_UpdateOperatorStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_user_UpdateOperatorStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_opor_status varchar(2),
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
    declare v_target_opor_no int;
    declare v_opor_status varchar(2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_co_no int;
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_opor_status = p_opor_status;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][{操作员状态}][@操作员状态#] */
    set v_jour_occur_field = concat("操作员状态","|");
    set v_jour_occur_info = concat(v_opor_status,"|");


    /* [更新表记录][公共_用户_操作员信息表][{操作员状态}=@操作员状态#][{操作员编号}=@目标操作员编号#][2][@目标操作员编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, opor_status=v_opor_status where opor_no=v_target_opor_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.6.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;

    #解冻操作员的时候将该操作员对应的登录错误次数置为0

    /* if @操作员状态#=《操作员状态-正常》 then */
    if v_opor_status="1" then

        /* [获取表记录变量语句][公共_用户_操作员登录信息表][{记录序号}][@记录序号#][{操作员编号}=@目标操作员编号# and {操作方式}=1] */
        select row_id into v_row_id from db_pub.tb_user_opor_login_info where opor_no=v_target_opor_no and oper_way=1 limit 1;


        /* if @记录序号#<>0 then */
        if v_row_id<>0 then

            /* [更新表记录][公共_用户_操作员登录信息表][{登录错误次数}=0][{记录序号}=@记录序号#][2][@记录序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pub.tb_user_opor_login_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, login_error_count=0 where row_id=v_row_id;
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.5.6.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("记录序号=",v_row_id);
                end if;
                leave label_pro;
            end if;

        end if;
    end if;

    /* [获取表记录变量][公共_用户_操作员信息表][{机构编号}][@机构编号#][{操作员编号}=@目标操作员编号#][4][@目标操作员编号#] */
    select co_no into v_co_no from db_pub.tb_user_opor_info where opor_no=v_target_opor_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.6.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@操作员状态#] */
    set v_jour_after_occur_info = concat(v_opor_status,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_用户_操作员信息流水表][字段][字段变量][5][@目标操作员编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        target_opor_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_target_opor_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.6.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_检查操作员身份
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_CheckOperatorAuth;;
DELIMITER ;;
CREATE PROCEDURE pra_user_CheckOperatorAuth(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_opor_type int,
    OUT p_oper_rights int,
    OUT p_is_trader int,
    OUT p_online_opor_no_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_opor_old_pwd varchar(64);
    declare v_opor_status varchar(2);
    declare v_trader_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_opor_old_pwd = " ";
    SET v_opor_status = "0";
    SET v_trader_no = 0;

    
    label_pro:BEGIN
    
    #检查操作员是否存在

    /* [获取表记录变量][公共_用户_操作员信息表][{操作员密码},{操作员状态}, {操作员类型}, {是否交易员}, {操作权限}, {交易员编号}][@操作员原密码#,@操作员状态#, @操作员类型#, @是否交易员#, @操作权限#, @交易员编号#][{操作员编号} = @操作员编号# and {机构编号} = @操作员机构编号#][4][@操作员机构编号#,@操作员编号#] */
    select opor_pwd,opor_status, opor_type, is_trader, oper_rights, trader_no into v_opor_old_pwd,v_opor_status, v_opor_type, v_is_trader, v_oper_rights, v_trader_no from db_pub.tb_user_opor_info where opor_no = v_opor_no and co_no = v_opor_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.7.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员机构编号=",v_opor_co_no,",","操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员机构编号=",v_opor_co_no,",","操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;

    #如果操作员状态非正常，报错返回

    /* [检查报错返回][@操作员状态# = 《操作员状态-冻结》][61][@操作员编号#,@操作员状态#] */
    if v_opor_status = "2" then
        
        SET v_error_code = "pubA.5.7.61";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","操作员状态=",v_opor_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","操作员状态=",v_opor_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@操作员状态# = 《操作员状态-注销》][62][@操作员编号#,@操作员状态#] */
    if v_opor_status = "3" then
        
        SET v_error_code = "pubA.5.7.62";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","操作员状态=",v_opor_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","操作员状态=",v_opor_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@操作员状态# <> 《操作员状态-正常》][64][@操作员编号#,@操作员状态#] */
    if v_opor_status <> "1" then
        
        SET v_error_code = "pubA.5.7.64";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","操作员状态=",v_opor_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","操作员状态=",v_opor_status);
        end if;
        leave label_pro;
    end if;

    #校验操作员密码

    /* [操作员密码加密][@操作员密码#] */
    set v_opor_pwd = MD5(concat("LDOSM",v_opor_pwd));


    /* [检查报错返回][@操作员密码# <> @操作员原密码#][808][@操作员编号#] */
    if v_opor_pwd <> v_opor_old_pwd then
        
        SET v_error_code = "pubA.5.7.808";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;

    #公共_用户_操作员登录信息表

    /* select group_concat(opor_no separator ';') into @在线操作员编号串# from ~公共_用户_操作员登录信息表^ where {机构编号}=@操作员机构编号# and {在线状态} = 《在线状态-在线》  and {操作方式} = 《操作方式-交易端》; */
    select group_concat(opor_no separator ';') into v_online_opor_no_str from db_pub.tb_user_opor_login_info where co_no=v_opor_co_no and online_status = 1  and oper_way = "1";
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_opor_type = v_opor_type;
    SET p_oper_rights = v_oper_rights;
    SET p_is_trader = v_is_trader;
    SET p_online_opor_no_str = v_online_opor_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_校验操作员密码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_CheckOperatorPassword;;
DELIMITER ;;
CREATE PROCEDURE pra_user_CheckOperatorPassword(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_opor_old_pwd varchar(64),
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
    declare v_opor_old_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_opor_pwd varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_opor_old_pwd = p_opor_old_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_opor_pwd = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_操作员信息表][{操作员密码}][@操作员密码#][{操作员编号}=@操作员编号#][4][@操作员编号#] */
    select opor_pwd into v_opor_pwd from db_pub.tb_user_opor_info where opor_no=v_opor_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.8.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [操作员密码加密][@操作员原密码#] */
    set v_opor_old_pwd = MD5(concat("LDOSM",v_opor_old_pwd));


    /* [检查报错返回][@操作员原密码# <> @操作员密码#][211][@操作员编号#] */
    if v_opor_old_pwd <> v_opor_pwd then
        
        SET v_error_code = "pubA.5.8.211";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_修改操作员密码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_UpdateOperatorPassword;;
DELIMITER ;;
CREATE PROCEDURE pra_user_UpdateOperatorPassword(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_opor_new_pwd varchar(64),
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
    declare v_target_opor_no int;
    declare v_opor_new_pwd varchar(64);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_change_pwd_flag int;
    declare v_co_no int;
    declare v_opor_pwd varchar(64);
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_opor_new_pwd = p_opor_new_pwd;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_change_pwd_flag = 0;
    SET v_co_no = 0;
    SET v_opor_pwd = " ";
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][{操作员密码}][@操作员新密码#] */
    set v_jour_occur_field = concat("操作员密码","|");
    set v_jour_occur_info = concat(v_opor_new_pwd,"|");


    /* [操作员密码加密][@操作员新密码#] */
    set v_opor_new_pwd = MD5(concat("LDOSM",v_opor_new_pwd));


    /* [更新表记录][公共_用户_操作员信息表][{操作员密码}=@操作员新密码#][{操作员编号}=@目标操作员编号#][2][@操作员编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, opor_pwd=v_opor_new_pwd where opor_no=v_target_opor_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.9.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;

    #重置密码后需要设置为需改密,修改密码后需要设置为不需改密

    /* if @操作备注# like  "%重置操作员密码%" then */
    if v_oper_remark_info like  "%重置操作员密码%" then

        /* set @改密标志#=1; */
        set v_change_pwd_flag=1;

    /* elseif @操作备注# like "%修改操作员密码%" then */
    elseif v_oper_remark_info like "%修改操作员密码%" then

        /* set @改密标志#=2; */
        set v_change_pwd_flag=2;
    end if;

    /* [更新表记录][公共_用户_操作员登录信息表][{改密标志}=@改密标志#][{操作员编号}=@目标操作员编号# and ({操作方式}=1 or {操作方式}=2)][2][@操作员编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_login_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, change_pwd_flag=v_change_pwd_flag where opor_no=v_target_opor_no and (oper_way=1 or oper_way=2);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.9.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_用户_操作员信息表][{机构编号},{操作员密码}][@机构编号#,@操作员密码#][{操作员编号}=@目标操作员编号#][4][@操作员编号#] */
    select co_no,opor_pwd into v_co_no,v_opor_pwd from db_pub.tb_user_opor_info where opor_no=v_target_opor_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.9.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@操作员密码#] */
    set v_jour_after_occur_info = concat(v_opor_pwd,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_用户_操作员信息流水表][字段][字段变量][5][concat("操作员编号=",@目标操作员编号#)] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        target_opor_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_target_opor_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.9.5";
        SET v_error_info =  CONCAT(concat("操作员编号=",v_target_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_查询操作员信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_QueryOperatorInfoJour;;
DELIMITER ;;
CREATE PROCEDURE pra_user_QueryOperatorInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_target_opor_no int,
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
    declare v_target_opor_no int;
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_用户_操作员信息流水表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@目标操作员编号# = 0 or {目标操作员编号}=@目标操作员编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, target_opor_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub.tb_user_opor_info_jour where (v_co_no=0 or co_no=v_co_no) and (v_target_opor_no = 0 or target_opor_no=v_target_opor_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, target_opor_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub.tb_user_opor_info_jour where (v_co_no=0 or co_no=v_co_no) and (v_target_opor_no = 0 or target_opor_no=v_target_opor_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_查询历史操作员信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_QueryOperatorInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_user_QueryOperatorInfoJour_His(
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
    IN p_target_opor_no int,
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
    declare v_target_opor_no int;
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_用户_操作员信息流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@目标操作员编号# = 0 or {目标操作员编号}=@目标操作员编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, target_opor_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub_his.tb_user_opor_info_jour_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_target_opor_no = 0 or target_opor_no=v_target_opor_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, target_opor_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pub_his.tb_user_opor_info_jour_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_target_opor_no = 0 or target_opor_no=v_target_opor_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_检查操作员存在
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_CheckOperatorExists;;
DELIMITER ;;
CREATE PROCEDURE pra_user_CheckOperatorExists(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_target_opor_no int,
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
    declare v_target_opor_no int;
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_操作员信息表][{机构编号}][@机构编号#][{操作员编号} = @目标操作员编号#][65][@目标操作员编号#] */
    select co_no into v_co_no from db_pub.tb_user_opor_info where opor_no = v_target_opor_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.13.65";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_获取操作员编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_GetOperatorNo;;
DELIMITER ;;
CREATE PROCEDURE pra_user_GetOperatorNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_target_opor_no int
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
    declare v_target_opor_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_target_opor_no = 0;

    
    label_pro:BEGIN
    

    /* [声明游标][公共_用户_操作员信息表][{操作员编号}][{机构编号} = @机构编号# and {操作员编号} > {机构编号}*10000 order by {操作员编号}][cursor_operator] */
    cursor_operator:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_operator CURSOR FOR
        select opor_no 
        from db_pub.tb_user_opor_info 
        where co_no = v_co_no and opor_no > co_no*10000 order by opor_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* set @目标操作员编号# = @机构编号# * 10000 + 1; */
    set v_target_opor_no = v_co_no * 10000 + 1;

    /* [打开游标][@操作员编号#][cursor_operator][loop_operator] */
    open cursor_operator;
    loop_operator: LOOP
    fetch cursor_operator into v_opor_no;
        IF v_cursor_done THEN
            LEAVE loop_operator;
        END IF;


        /* if @目标操作员编号# <> @操作员编号# then */
        if v_target_opor_no <> v_opor_no then

            /* [退出循环][loop_operator] */
            LEAVE loop_operator;

        end if;

       /* set @目标操作员编号# = @目标操作员编号# + 1; */
       set v_target_opor_no = v_target_opor_no + 1;

    /* [关闭游标][cursor_operator] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_operator;
    end cursor_operator;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_target_opor_no = v_target_opor_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_获取可操作操作员编号串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_GetAllowOporNoStr;;
DELIMITER ;;
CREATE PROCEDURE pra_user_GetAllowOporNoStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_target_opor_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_allow_opor_no_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_target_opor_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_allow_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_target_opor_no = p_target_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_allow_opor_no_str = " ";

    
    label_pro:BEGIN
    

    /* set @可操作操作员编号串# = " "; */
    set v_allow_opor_no_str = " ";

    /* [获取表记录串][公共_用户_操作员可操作操作员表][{可操作操作员编号} SEPARATOR ";"][@可操作操作员编号串#][{操作员编号}=@目标操作员编号#] */
    select group_concat(allow_opor_no SEPARATOR ";") into v_allow_opor_no_str from db_pub.tb_user_opor_allow_opor where opor_no=v_target_opor_no;


    /* set @可操作操作员编号串# = if(@可操作操作员编号串# is null,concat(@操作员编号#,""),concat(@可操作操作员编号串#,";",@操作员编号#)); */
    set v_allow_opor_no_str = if(v_allow_opor_no_str is null,concat(v_opor_no,""),concat(v_allow_opor_no_str,";",v_opor_no));

    /* set @可操作操作员编号串# = concat(";",@可操作操作员编号串#,";"); */
    set v_allow_opor_no_str = concat(";",v_allow_opor_no_str,";");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_allow_opor_no_str = v_allow_opor_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_操作员登录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_OperatorLogin;;
DELIMITER ;;
CREATE PROCEDURE pra_user_OperatorLogin(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_target_opor_pwd varchar(64),
    IN p_client_version varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_opor_name varchar(64),
    OUT p_opor_type int,
    OUT p_opor_pwd varchar(64),
    OUT p_oper_rights int,
    OUT p_is_trader int,
    OUT p_trader_no int,
    OUT p_allow_oper_ip_addr varchar(255),
    OUT p_allow_oper_mac varchar(255),
    OUT p_allow_login_type varchar(64),
    OUT p_online_status int,
    OUT p_login_count int,
    OUT p_login_error_count int,
    OUT p_init_date int,
    OUT p_last_login_ip varchar(32),
    OUT p_last_login_mac varchar(32),
    OUT p_last_login_date int,
    OUT p_last_login_time int,
    OUT p_co_type int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_target_opor_pwd varchar(64);
    declare v_client_version varchar(16);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_opor_name varchar(64);
    declare v_opor_type int;
    declare v_opor_pwd varchar(64);
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_trader_no int;
    declare v_allow_oper_ip_addr varchar(255);
    declare v_allow_oper_mac varchar(255);
    declare v_allow_login_type varchar(64);
    declare v_online_status int;
    declare v_login_count int;
    declare v_login_error_count int;
    declare v_init_date int;
    declare v_last_login_ip varchar(32);
    declare v_last_login_mac varchar(32);
    declare v_last_login_date int;
    declare v_last_login_time int;
    declare v_co_type int;
    declare v_change_pwd_flag int;
    declare v_opor_status varchar(2);
    declare v_sys_config_str varchar(64);
    declare v_co_busi_config_str varchar(64);
    declare v_mach_date int;
    declare v_mach_time int;
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
    SET v_target_opor_pwd = p_target_opor_pwd;
    SET v_client_version = p_client_version;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_opor_name = " ";
    SET v_opor_type = 0;
    SET v_opor_pwd = " ";
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_trader_no = 0;
    SET v_allow_oper_ip_addr = " ";
    SET v_allow_oper_mac = " ";
    SET v_allow_login_type = " ";
    SET v_online_status = 0;
    SET v_login_count = 0;
    SET v_login_error_count = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_last_login_ip = " ";
    SET v_last_login_mac = " ";
    SET v_last_login_date = date_format(curdate(),'%Y%m%d');
    SET v_last_login_time = 0;
    SET v_co_type = 0;
    SET v_change_pwd_flag = 0;
    SET v_opor_status = "0";
    SET v_sys_config_str = " ";
    SET v_co_busi_config_str = " ";
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #先获取操作员信息。包括密码等，以用于校验和传出参数

    /* set @改密标志#=0; */
    set v_change_pwd_flag=0;

    /* [获取表记录变量][公共_用户_操作员信息表][{机构编号},{操作员名称},{操作员类型},{操作员密码},{操作权限},{是否交易员},{交易员编号},{允许操作IP},{允许操作MAC},{允许登录方式},{操作员状态}][@机构编号#, @操作员名称#, @操作员类型#, @操作员密码#, @操作权限#, @是否交易员#, @交易员编号#, @允许操作IP#, @允许操作MAC#, @允许登录方式#, @操作员状态#][{操作员编号}=@操作员编号#][65][@操作员编号#] */
    select co_no,opor_name,opor_type,opor_pwd,oper_rights,is_trader,trader_no,allow_oper_ip_addr,allow_oper_mac,allow_login_type,opor_status into v_co_no, v_opor_name, v_opor_type, v_opor_pwd, v_oper_rights, v_is_trader, v_trader_no, v_allow_oper_ip_addr, v_allow_oper_mac, v_allow_login_type, v_opor_status from db_pub.tb_user_opor_info where opor_no=v_opor_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.21.65";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作员机构编号# = @机构编号#; */
    set v_opor_co_no = v_co_no;

    /* 调用【原子_公共_基础_检查系统状态】*/
    call db_pub.pra_base_CheckSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date,
        v_sys_config_str,
        v_co_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubA.5.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@操作员状态# = 《操作员状态-冻结》][61][@操作员编号#] */
    if v_opor_status = "2" then
        
        SET v_error_code = "pubA.5.21.61";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@操作员状态# = 《操作员状态-注销》][62][@操作员编号#] */
    if v_opor_status = "3" then
        
        SET v_error_code = "pubA.5.21.62";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_公共_基础_获取机构类型】*/
    call db_pub.pra_base_GetCoType(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_error_code,
        v_error_info,
        v_co_type);
    if v_error_code = "1" then
        SET v_error_code = "pubA.5.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取机构类型出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #获取上次登录信息，不处理报错

    /* [获取表记录变量语句][公共_用户_操作员登录信息表][{登录次数}, {登录错误次数}, {操作IP}, {操作MAC}, {更新日期}, {更新时间}][@登录次数#, @登录错误次数#, @上次登录IP#, @上次登录MAC#, @上次登录日期#, @上次登录时间#][{操作员编号}=@操作员编号# and {操作方式}=@操作方式#][4][@操作员编号#,@操作方式#] */
    select login_count, login_error_count, oper_ip_addr, oper_mac, update_date, update_time into v_login_count, v_login_error_count, v_last_login_ip, v_last_login_mac, v_last_login_date, v_last_login_time from db_pub.tb_user_opor_login_info where opor_no=v_opor_no and oper_way=v_oper_way limit 1;

    if FOUND_ROWS() = 0 then

        /* set @登录次数# = 1; */
        set v_login_count = 1;

        /* set @登录错误次数# = 0; */
        set v_login_error_count = 0;

        /* set @上次登录IP# = " "; */
        set v_last_login_ip = " ";

        /* set @上次登录MAC# = " "; */
        set v_last_login_mac = " ";

        /* set @上次登录日期# = 0; */
        set v_last_login_date = 0;

        /* set @上次登录时间# = 0; */
        set v_last_login_time = 0;
    end if;

    /* [检查报错返回][@登录错误次数# >= 5][212][@登录错误次数#] */
    if v_login_error_count >= 5 then
        
        SET v_error_code = "pubA.5.21.212";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("登录错误次数=",v_login_error_count),"#",v_mysql_message);
        else
            SET v_error_info = concat("登录错误次数=",v_login_error_count);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][instr(concat(";",@允许登录方式#,";"), concat(";",@操作方式#,";")) = 0][213][@允许登录方式#] */
    if instr(concat(";",v_allow_login_type,";"), concat(";",v_oper_way,";")) = 0 then
        
        SET v_error_code = "pubA.5.21.213";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("允许登录方式=",v_allow_login_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("允许登录方式=",v_allow_login_type);
        end if;
        leave label_pro;
    end if;

    #客户端登录校验绑定的ip地址和mac地址

    /* if (@操作方式# = 《操作方式-交易端》 or @操作方式# = 《操作方式-管理端》) then */
    if (v_oper_way = "1" or v_oper_way = "2") then

        /* if @允许操作IP# <> " " then */
        if v_allow_oper_ip_addr <> " " then

            /* [检查报错返回][locate(@操作IP#,@允许操作IP#)=0][214]["IP地址不符，登录失败"] */
            if locate(v_oper_ip_addr,v_allow_oper_ip_addr)=0 then
                
                SET v_error_code = "pubA.5.21.214";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT("IP地址不符，登录失败","#",v_mysql_message);
                else
                    SET v_error_info = "IP地址不符，登录失败";
                end if;
                leave label_pro;
            end if;

        end if;

        /* if @允许操作MAC# <> " " then */
        if v_allow_oper_mac <> " " then

            /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][215]["MAC地址不符，登录失败"] */
            if locate(v_oper_mac,v_allow_oper_mac)=0 then
                
                SET v_error_code = "pubA.5.21.215";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT("MAC地址不符，登录失败","#",v_mysql_message);
                else
                    SET v_error_info = "MAC地址不符，登录失败";
                end if;
                leave label_pro;
            end if;

        end if;
    end if;

    /* set @改密标志#=0; */
    set v_change_pwd_flag=0;

    /* set @机器日期# = date_format(curdate(),'%Y%m%d'); */
    set v_mach_date = date_format(curdate(),'%Y%m%d');

    /* set @机器时间# = date_format(curtime(),'%H%i%s'); */
    set v_mach_time = date_format(curtime(),'%H%i%s');

    /* if @目标操作员密码# is null or @目标操作员密码# <> @操作员密码# then */
    if v_target_opor_pwd is null or v_target_opor_pwd <> v_opor_pwd then

        /* set @在线状态# = 《在线状态-离线》; */
        set v_online_status = 2;

        /* [插入重复更新][公共_用户_操作员登录信息表][字段][字段变量][{在线状态} = @在线状态#, {登录错误次数} = {登录错误次数} + 1][1][@操作员编号#,@操作方式#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_opor_login_info (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, opor_no, 
            oper_info, oper_way, online_status, login_count, 
            login_error_count, client_version, oper_ip_addr, oper_mac, 
            change_pwd_flag) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_opor_no, 
            v_oper_info, v_oper_way, v_online_status, v_login_count, 
            v_login_error_count, v_client_version, v_oper_ip_addr, v_oper_mac, 
            v_change_pwd_flag) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, online_status = v_online_status, login_error_count = login_error_count + 1;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.5.21.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","操作方式=",v_oper_way),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no,",","操作方式=",v_oper_way);
            end if;
            leave label_pro;
        end if;


        /* set @登录错误次数# = @登录错误次数# + 1; */
        set v_login_error_count = v_login_error_count + 1;

        /* [检查报错返回][1=1][211][@操作员编号#] */
        if 1=1 then
            
            SET v_error_code = "pubA.5.21.211";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    else

        /* set @在线状态# = 《在线状态-在线》; */
        set v_online_status = 1;

        /* [插入重复更新][公共_用户_操作员登录信息表][字段][字段变量][{在线状态} = @在线状态#, {登录次数} = {登录次数} + 1, {登录错误次数} = 0, {客户端版本} = @客户端版本#, {操作IP} = @操作IP#, {操作MAC} = @操作MAC#][1][@操作员编号#,@操作方式#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_opor_login_info (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, opor_no, 
            oper_info, oper_way, online_status, login_count, 
            login_error_count, client_version, oper_ip_addr, oper_mac, 
            change_pwd_flag) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_opor_no, 
            v_oper_info, v_oper_way, v_online_status, v_login_count, 
            v_login_error_count, v_client_version, v_oper_ip_addr, v_oper_mac, 
            v_change_pwd_flag) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, online_status = v_online_status, login_count = login_count + 1, login_error_count = 0, client_version = v_client_version, oper_ip_addr = v_oper_ip_addr, oper_mac = v_oper_mac;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.5.21.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","操作方式=",v_oper_way),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no,",","操作方式=",v_oper_way);
            end if;
            leave label_pro;
        end if;


        /* set @登录次数# = @登录次数# + 1; */
        set v_login_count = v_login_count + 1;
    end if;

    /* [插入重复更新][公共_用户_操作员登录地址信息表][字段][字段变量][{操作IP}=@操作IP#][1][@操作员编号#,@操作MAC#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_login_address_info (
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, oper_info, 
        oper_mac, oper_ip_addr) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_oper_info, 
        v_oper_mac, v_oper_ip_addr) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, oper_ip_addr=v_oper_ip_addr;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","操作MAC=",v_oper_mac),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","操作MAC=",v_oper_mac);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_opor_name = v_opor_name;
    SET p_opor_type = v_opor_type;
    SET p_opor_pwd = v_opor_pwd;
    SET p_oper_rights = v_oper_rights;
    SET p_is_trader = v_is_trader;
    SET p_trader_no = v_trader_no;
    SET p_allow_oper_ip_addr = v_allow_oper_ip_addr;
    SET p_allow_oper_mac = v_allow_oper_mac;
    SET p_allow_login_type = v_allow_login_type;
    SET p_online_status = v_online_status;
    SET p_login_count = v_login_count;
    SET p_login_error_count = v_login_error_count;
    SET p_init_date = v_init_date;
    SET p_last_login_ip = v_last_login_ip;
    SET p_last_login_mac = v_last_login_mac;
    SET p_last_login_date = v_last_login_date;
    SET p_last_login_time = v_last_login_time;
    SET p_co_type = v_co_type;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_操作员退出
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_OperatorLogout;;
DELIMITER ;;
CREATE PROCEDURE pra_user_OperatorLogout(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_用户_操作员登录信息表][{在线状态}=2][{操作员编号}=@操作员编号# and {操作方式}=@操作方式#][2][@操作员编号#,@操作方式#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_login_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, online_status=2 where opor_no=v_opor_no and oper_way=v_oper_way;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.22.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","操作方式=",v_oper_way),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","操作方式=",v_oper_way);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_新增操作员可操作机构
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_AddOporAllowCo;;
DELIMITER ;;
CREATE PROCEDURE pra_user_AddOporAllowCo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_co_no int,
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
    declare v_target_opor_no int;
    declare v_co_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_rights int;
    declare v_abolish_status varchar(2);
    declare v_tmp_opor_no int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_co_no = p_co_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_rights = 0;
    SET v_abolish_status = "0";
    SET v_tmp_opor_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @操作权限# = 《操作权限-管理》; */
    set v_oper_rights = 2;

    /* set @注销标志# = 0; */
    set v_abolish_status = 0;

    /* set @临时_操作员编号# = @操作员编号#; */
    set v_tmp_opor_no = v_opor_no;

    /* set @操作员编号# = @目标操作员编号#; */
    set v_opor_no = v_target_opor_no;

    /* [插入表记录][公共_用户_操作员可操作机构表][字段][字段变量][1][@目标操作员编号#,@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_allow_co(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        abolish_status, oper_rights) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_co_no, 
        v_abolish_status, v_oper_rights);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.41.1";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no,",","机构编号=",v_co_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @操作员编号# = @临时_操作员编号#; */
    set v_opor_no = v_tmp_opor_no;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_用户_操作员可操作机构流水表][字段][字段变量][5][@目标操作员编号#,@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_allow_co_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, target_opor_no, 
        co_no, oper_rights, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_target_opor_no, 
        v_co_no, v_oper_rights, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.41.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no,",","机构编号=",v_co_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_删除操作员可操作机构
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_DeleteOporAllowCo;;
DELIMITER ;;
CREATE PROCEDURE pra_user_DeleteOporAllowCo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_co_no int,
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
    declare v_target_opor_no int;
    declare v_co_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_rights int;
    declare v_table_row_id bigint;
    declare v_abolish_status varchar(2);
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_co_no = p_co_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_rights = 0;
    SET v_table_row_id = 0;
    SET v_abolish_status = "0";
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

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_操作员可操作机构表][{操作权限},{记录序号},{注销标志}][@操作权限#,@表记录序号#,@注销标志#][{操作员编号} = @目标操作员编号# and {机构编号} = @机构编号#][4][@目标操作员编号#,@机构编号#] */
    select oper_rights,row_id,abolish_status into v_oper_rights,v_table_row_id,v_abolish_status from db_pub.tb_user_opor_allow_co where opor_no = v_target_opor_no and co_no = v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.42.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no,",","机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no,",","机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    #删除流水记录

    /* set @表字段值# =  concat("|操作员编号:",@目标操作员编号#,"|机构编号:",@机构编号#,"|注销标志:",@注销标志#,"|操作权限:",@操作权限#); */
    set v_table_field_value =  concat("|操作员编号:",v_target_opor_no,"|机构编号:",v_co_no,"|注销标志:",v_abolish_status,"|操作权限:",v_oper_rights);

    /* set @表唯一索引值# = concat("|操作员编号:",@目标操作员编号#,"|机构编号:",@机构编号#); */
    set v_table_uni_index_value = concat("|操作员编号:",v_target_opor_no,"|机构编号:",v_co_no);

    /* set @数据表名称# = "tb_user_opor_allow_co"; */
    set v_table_name = "tb_user_opor_allow_co";

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_基础_公共库删除流水表][字段][字段变量][5][@数据表名称#, @表记录序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_base_pub_delete_jour(
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
                
        SET v_error_code = "pubA.5.42.5";
        SET v_error_info =  CONCAT(concat("数据表名称=",v_table_name,","," 表记录序号=", v_table_row_id),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [删除表记录][公共_用户_操作员可操作机构表][{操作员编号} = @目标操作员编号# and {机构编号} = @机构编号#][3][@目标操作员编号#,@机构编号#] */
    delete from db_pub.tb_user_opor_allow_co 
        where opor_no = v_target_opor_no and co_no = v_co_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.5.42.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no,",","机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no,",","机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_用户_操作员可操作机构流水表][字段][字段变量][5][@目标操作员编号#,@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_allow_co_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, target_opor_no, 
        co_no, oper_rights, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_target_opor_no, 
        v_co_no, v_oper_rights, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.42.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no,",","机构编号=",v_co_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_查询操作员可操作机构
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_QueryOporAllowCo;;
DELIMITER ;;
CREATE PROCEDURE pra_user_QueryOporAllowCo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
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
    declare v_query_opor_no int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_用户_操作员可操作机构表][字段][{操作员编号}=@查询操作员编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, abolish_status, oper_rights from db_pub.tb_user_opor_allow_co where opor_no=v_query_opor_no and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, abolish_status, oper_rights from db_pub.tb_user_opor_allow_co where opor_no=v_query_opor_no and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_更新操作员可操作机构注销标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_UpdateOporAllowCoAbolishStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_user_UpdateOporAllowCoAbolishStatus(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_用户_操作员可操作机构表][{注销标志}=1][{机构编号}=@机构编号#][2][@机构编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_allow_co set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, abolish_status=1 where co_no=v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.45.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_查询全部交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_QueryAllExchGroup;;
DELIMITER ;;
CREATE PROCEDURE pra_user_QueryAllExchGroup(
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
    IN p_exch_group_status varchar(2),
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
    declare v_exch_group_status varchar(2);
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
    SET v_exch_group_status = p_exch_group_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][公共_用户_交易组信息表][{交易组编号},{机构编号},{交易组编码},{交易组名称},{交易组状态},{默认组标志},{产品编号}][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@交易组状态#=" " or {交易组状态}=@交易组状态#)] */
    select exch_group_no,co_no,exch_group_code,exch_group_name,exch_group_status,default_group_flag,pd_no from db_pub.tb_user_exch_group_info where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_exch_group_status=" " or exch_group_status=v_exch_group_status);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_归档公共用户数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_BackUpBaseUserData;;
DELIMITER ;;
CREATE PROCEDURE pra_user_BackUpBaseUserData(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [数据归历史][公共_用户_操作员信息流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_user_opor_info_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, target_opor_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, target_opor_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info 
        from db_pub.tb_user_opor_info_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.101.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_用户_操作员信息流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_user_opor_info_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.5.101.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_用户_操作员可操作机构流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_user_opor_allow_co_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        target_opor_no, co_no, oper_rights, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        target_opor_no, co_no, oper_rights, oper_remark_info 
        from db_pub.tb_user_opor_allow_co_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.101.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_用户_操作员可操作机构流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_user_opor_allow_co_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.5.101.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_用户_操作员可操作产品流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_user_opor_allow_prod_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        target_opor_no, co_no, pd_no, oper_rights, 
        oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        target_opor_no, co_no, pd_no, oper_rights, 
        oper_remark_info 
        from db_pub.tb_user_opor_allow_prod_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.101.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_用户_操作员可操作产品流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_user_opor_allow_prod_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.5.101.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_用户_历史交易组信息表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pub_his.tb_user_exch_group_info_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.5.101.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][公共_用户_交易组信息表][字段][302][@初始化日期#] */
    insert into db_pub_his.tb_user_exch_group_info_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, exch_group_no, co_no, 
        exch_group_code, exch_group_name, exch_group_status, default_group_flag, 
        pd_no, first_asset, exch_group_dist_pd_amt, exch_group_pd_share, 
        pre_exch_group_pd_share, pre_nav, begin_NAV, allow_exch, 
        allow_stock_type, busi_config_str, market_price_ratio, forbid_order_dir, 
        weight_value, trade_acco, remark_info, abolish_date, 
        futu_default_group_flag, fina_loan_default_group_flag) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, exch_group_no, co_no, 
        exch_group_code, exch_group_name, exch_group_status, default_group_flag, 
        pd_no, first_asset, exch_group_dist_pd_amt, exch_group_pd_share, 
        pre_exch_group_pd_share, pre_nav, begin_NAV, allow_exch, 
        allow_stock_type, busi_config_str, market_price_ratio, forbid_order_dir, 
        weight_value, trade_acco, remark_info, abolish_date, 
        futu_default_group_flag, fina_loan_default_group_flag 
        from db_pub.tb_user_exch_group_info;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.101.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_用户_交易组信息流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_user_exch_group_info_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pub.tb_user_exch_group_info_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.101.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_用户_交易组信息流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_user_exch_group_info_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.5.101.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_用户_操作员所属交易组流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_user_opor_exch_group_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        target_opor_no, co_no, pd_no, exch_group_no, 
        oper_rights, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        target_opor_no, co_no, pd_no, exch_group_no, 
        oper_rights, oper_remark_info 
        from db_pub.tb_user_opor_exch_group_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.101.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_用户_操作员所属交易组流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_user_opor_exch_group_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.5.101.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][公共_用户_操作员可操作操作员流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_user_opor_allow_opor_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        target_opor_no, co_no, allow_opor_no, oper_rights, 
        oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        target_opor_no, co_no, allow_opor_no, oper_rights, 
        oper_remark_info 
        from db_pub.tb_user_opor_allow_opor_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.101.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_用户_操作员可操作操作员流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_user_opor_allow_opor_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.5.101.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #新增表归档 modify bywjp20181025

    /* [数据归历史][公共_用户_操作员可设置操作员流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pub_his.tb_user_opor_allowset_opor_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        target_opor_no, co_no, allow_opor_no, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        target_opor_no, co_no, allow_opor_no, oper_remark_info 
        from db_pub.tb_user_opor_allowset_opor_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.101.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_用户_操作员可设置操作员流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pub.tb_user_opor_allowset_opor_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.5.101.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_用户_交易组资产表][{累计实现收益}={累计实现收益} + {期初净资产} - {净资产},{统计天数} = {统计天数} +1,{多日总资产} = {多日总资产}+{净资产}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_exch_group_asset set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, total_realiz_pandl=total_realiz_pandl + begin_NAV - nav_asset,stat_days = stat_days +1,many_days_total_asset = many_days_total_asset+nav_asset where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.101.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_用户_历史交易组资产表][{初始化日期}=@初始化日期#][3][@初始化日期#] */
    delete from db_pub_his.tb_user_exch_group_asset_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.5.101.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][公共_用户_交易组资产表][字段][1=1][1][@初始化日期#] */
    insert into db_pub_his.tb_user_exch_group_asset_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, crncy_type, begin_NAV, nav_asset, 
        total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
        fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
        futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
        total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
        evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
        futu_short_market_value) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, crncy_type, begin_NAV, nav_asset, 
        total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
        fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
        futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
        total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
        evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
        futu_short_market_value 
        from db_pub.tb_user_exch_group_asset;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.101.1=1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(1,"#",v_mysql_message);
            else
                SET v_error_info = 1;
            end if;
        leave label_pro;
    end if;

    #置期初值重复做了，在初始化产品证券 时也做了置值。

    /* [更新表记录][公共_用户_交易组资产表][{期初净资产}={净资产},{期初估值净资产}={估值净资产}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_exch_group_asset set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_NAV=nav_asset,begin_evalu_nav_asset=evalu_nav_asset where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.101.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_用户_交易组信息表][{昨日交易组产品份额}={交易组产品份额}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_exch_group_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_exch_group_pd_share=exch_group_pd_share where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.101.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* update ~公共_用户_交易组信息表^ a, ~公共_用户_交易组资产表^ b set a.{昨日净值}=round(ifnull(b.{净资产}/a.{交易组产品份额},0),4),a.{期初净资产}=b.{净资产},a.{更新次数}=a.{更新次数}+1 where a.{交易组编号}=b.{交易组编号} and b.{本币币种}="CNY"; */
    update db_pub.tb_user_exch_group_info a, db_pub.tb_user_exch_group_asset b set a.pre_nav=round(ifnull(b.nav_asset/a.exch_group_pd_share,0),4),a.begin_NAV=b.nav_asset,a.update_times=a.update_times+1 where a.exch_group_no=b.exch_group_no and b.crncy_type="CNY";
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_查询全部操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_QueryAllOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_user_QueryAllOperatorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_co_no int,
    IN p_is_trader int,
    IN p_opor_status_str varchar(64),
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
    declare v_query_opor_no int;
    declare v_co_no int;
    declare v_is_trader int;
    declare v_opor_status_str varchar(64);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_co_no = p_co_no;
    SET v_is_trader = p_is_trader;
    SET v_opor_status_str = p_opor_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_用户_操作员信息表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@查询操作员编号# = 0 or {操作员编号}=@查询操作员编号#) and (@是否交易员# = 0 or {是否交易员}=@是否交易员#) and (@操作员状态串# = " " or instr(@操作员状态串#, concat(";", {操作员状态}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, opor_name, opor_type, opor_pwd, 
        opor_status, create_opor, conta_addr, oper_rights, 
        phone_number, email, is_trader, trader_no, 
        allow_login_type, allow_oper_ip_addr, allow_oper_mac, index_value, 
        manage_nolgn_opor_orders from db_pub.tb_user_opor_info where (v_co_no = 0 or co_no=v_co_no) and (v_query_opor_no = 0 or opor_no=v_query_opor_no) and (v_is_trader = 0 or is_trader=v_is_trader) and (v_opor_status_str = " " or instr(v_opor_status_str, concat(";", opor_status, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, opor_name, opor_type, opor_pwd, 
        opor_status, create_opor, conta_addr, oper_rights, 
        phone_number, email, is_trader, trader_no, 
        allow_login_type, allow_oper_ip_addr, allow_oper_mac, index_value, 
        manage_nolgn_opor_orders from db_pub.tb_user_opor_info where (v_co_no = 0 or co_no=v_co_no) and (v_query_opor_no = 0 or opor_no=v_query_opor_no) and (v_is_trader = 0 or is_trader=v_is_trader) and (v_opor_status_str = " " or instr(v_opor_status_str, concat(";", opor_status, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_检查操作员操作权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_CheckOperatorOperRights;;
DELIMITER ;;
CREATE PROCEDURE pra_user_CheckOperatorOperRights(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_oper_rights int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_exch_group_no int;
    declare v_oper_rights int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_tmp_oper_rights int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_oper_rights = p_oper_rights;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_tmp_oper_rights = 0;

    
    label_pro:BEGIN
    
    #入参参数 操作权限没有作用

    /* set @临时_操作权限# = @操作权限#; */
    set v_tmp_oper_rights = v_oper_rights;
    #如果机构编号不为0，则检查操作员机构相关数据权限

    /* if @机构编号# <> 0 then */
    if v_co_no <> 0 then
        #操作非本机构

        /* if @机构编号# <> @操作员机构编号# then */
        if v_co_no <> v_opor_co_no then

             /* if  @操作员机构编号#<>9999  then */
             if  v_opor_co_no<>9999  then
                 #如果操作员是交易员，则限制操作员只能操作本机构的业务
                 #[检查报错返回][@是否交易员# = 《是否交易员-是》][1][@操作员机构编号#,@操作员编号#]
                #检查操作员机构的操作权限

                /* [获取表记录变量][公共_用户_操作员可操作机构表][{操作权限}][@操作权限#][{操作员编号} = @操作员编号# and {机构编号} = @机构编号#][220][@操作员编号#,@机构编号#] */
                select oper_rights into v_oper_rights from db_pub.tb_user_opor_allow_co where opor_no = v_opor_no and co_no = v_co_no limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.5.301.220";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","机构编号=",v_co_no),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("操作员编号=",v_opor_no,",","机构编号=",v_co_no);
                    end if;
                    leave label_pro;
                end if;

                #[检查报错返回][@操作权限# <> 《操作权限-管理》 and @操作权限# <> @临时_操作权限#][216][@操作员编号#,@机构编号#,@操作权限#]
             end if;
        end if;
    end if;
    #如果交易组编号不为0，则通过交易组编号获得产品编号，进行权限校验

    /* set @产品编号# = 0; */
    set v_pd_no = 0;

    /* if @交易组编号# <> 0 then */
    if v_exch_group_no <> 0 then

        /* [获取表记录变量][公共_用户_交易组信息表][{产品编号}][@产品编号#][{交易组编号} = @交易组编号#][4][@交易组编号#] */
        select pd_no into v_pd_no from db_pub.tb_user_exch_group_info where exch_group_no = v_exch_group_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.5.301.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no);
            end if;
            leave label_pro;
        end if;

    end if;
    #如果产品编号不为0，则检查操作员产品相关数据权限

    /* if @产品编号# <> 0 then */
    if v_pd_no <> 0 then
            #检查操作员产品的操作权限

       /* if  @操作员机构编号# <> 9999  then */
       if  v_opor_co_no <> 9999  then

            /* [获取表记录变量][公共_用户_操作员可操作产品表][{操作权限}][@操作权限#][{操作员编号} = @操作员编号# and {产品编号} = @产品编号#][221][@操作员编号#,@产品编号#] */
            select oper_rights into v_oper_rights from db_pub.tb_user_opor_allow_prod where opor_no = v_opor_no and pd_no = v_pd_no limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.5.301.221";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("操作员编号=",v_opor_no,",","产品编号=",v_pd_no);
                end if;
                leave label_pro;
            end if;

            #[检查报错返回][@操作权限# <> 《操作权限-管理》 and @操作权限# <> @临时_操作权限#][216][@操作员编号#,@产品编号#,@操作权限#]
       end if;
    end if;
    #如果交易组编号不为0，则检查操作员交易组相关数据权限

    /* if @交易组编号# <> 0 then */
    if v_exch_group_no <> 0 then
            #检查操作员交易组的操作权限

       /* if  @操作员机构编号# <> 9999  then */
       if  v_opor_co_no <> 9999  then

            /* [获取表记录变量][公共_用户_操作员所属交易组表][{操作权限}][@操作权限#][{操作员编号} = @操作员编号# and {交易组编号} = @交易组编号#][222][@操作员编号#,@交易组编号#] */
            select oper_rights into v_oper_rights from db_pub.tb_user_opor_exch_group where opor_no = v_opor_no and exch_group_no = v_exch_group_no limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.5.301.222";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("操作员编号=",v_opor_no,",","交易组编号=",v_exch_group_no);
                end if;
                leave label_pro;
            end if;

            #[检查报错返回][@操作权限# <> 《操作权限-管理》 and @操作权限# <> @临时_操作权限#][216][@操作员编号#,@交易组编号#]
       end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_检查操作员产品操作权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_CheckOperatorProdOperRights;;
DELIMITER ;;
CREATE PROCEDURE pra_user_CheckOperatorProdOperRights(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_rights int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_rights = 0;

    
    label_pro:BEGIN
    
    #检查操作员产品的操作权限

    /* if  @操作员机构编号# <> 9999  then */
    if  v_opor_co_no <> 9999  then

        /* [获取表记录变量][公共_用户_操作员可操作产品表][{操作权限}][@操作权限#][{操作员编号} = @操作员编号# and {产品编号} = @产品编号#][221][@操作员编号#,@产品编号#] */
        select oper_rights into v_oper_rights from db_pub.tb_user_opor_allow_prod where opor_no = v_opor_no and pd_no = v_pd_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.5.302.221";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no,",","产品编号=",v_pd_no);
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

# 原子_公共_用户_检查交易组操作权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_CheckExchGroupOperRights;;
DELIMITER ;;
CREATE PROCEDURE pra_user_CheckExchGroupOperRights(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int,
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_trade_acco varchar(32)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_exgp_busi_config_str varchar(64);
    declare v_trade_acco varchar(32);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_exch_group_code varchar(32);
    declare v_exch_group_name varchar(64);
    declare v_exch_group_status varchar(2);
    declare v_default_group_flag int;
    declare v_first_asset decimal(18,4);
    declare v_exch_group_dist_pd_amt decimal(18,4);
    declare v_exch_group_pd_share decimal(18,2);
    declare v_pre_exch_group_pd_share decimal(18,2);
    declare v_pre_nav decimal(18,4);
    declare v_begin_NAV decimal(18,4);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_config_str varchar(64);
    declare v_market_price_ratio decimal(18,12);
    declare v_forbid_order_dir varchar(64);
    declare v_weight_value decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_abolish_date int;
    declare v_futu_default_group_flag int;
    declare v_fina_loan_default_group_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_exgp_busi_config_str = " ";
    SET v_trade_acco = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_exch_group_code = " ";
    SET v_exch_group_name = " ";
    SET v_exch_group_status = "0";
    SET v_default_group_flag = 0;
    SET v_first_asset = 0;
    SET v_exch_group_dist_pd_amt = 0;
    SET v_exch_group_pd_share = 0;
    SET v_pre_exch_group_pd_share = 0;
    SET v_pre_nav = 0;
    SET v_begin_NAV = 0;
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_busi_config_str = " ";
    SET v_market_price_ratio = 0;
    SET v_forbid_order_dir = " ";
    SET v_weight_value = 0;
    SET v_remark_info = " ";
    SET v_abolish_date = 0;
    SET v_futu_default_group_flag = 0;
    SET v_fina_loan_default_group_flag = 0;

    
    label_pro:BEGIN
    
    #检查交易组是否存在

    /* [获取表记录变量][公共_用户_交易组信息表][字段][字段变量][{交易组编号} = @交易组编号#][4][@交易组编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_group_no, 
        co_no, exch_group_code, exch_group_name, exch_group_status, 
        default_group_flag, pd_no, first_asset, exch_group_dist_pd_amt, 
        exch_group_pd_share, pre_exch_group_pd_share, pre_nav, begin_NAV, 
        allow_exch, allow_stock_type, busi_config_str, market_price_ratio, 
        forbid_order_dir, weight_value, trade_acco, remark_info, 
        abolish_date, futu_default_group_flag, fina_loan_default_group_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_exch_group_no, 
        v_co_no, v_exch_group_code, v_exch_group_name, v_exch_group_status, 
        v_default_group_flag, v_pd_no, v_first_asset, v_exch_group_dist_pd_amt, 
        v_exch_group_pd_share, v_pre_exch_group_pd_share, v_pre_nav, v_begin_NAV, 
        v_allow_exch, v_allow_stock_type, v_busi_config_str, v_market_price_ratio, 
        v_forbid_order_dir, v_weight_value, v_trade_acco, v_remark_info, 
        v_abolish_date, v_futu_default_group_flag, v_fina_loan_default_group_flag from db_pub.tb_user_exch_group_info where exch_group_no = v_exch_group_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.303.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    #如果输入参数的产品编号为0，则产品编号取交易组编号对应的产品编号
    #如果交易组状态非正常，报错返回

    /* [检查报错返回][@交易组状态# = 《交易组状态-冻结》][71][@交易组编号#] */
    if v_exch_group_status = "2" then
        
        SET v_error_code = "pubA.5.303.71";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@交易组状态# = 《交易组状态-注销》][72][@交易组编号#] */
    if v_exch_group_status = "3" then
        
        SET v_error_code = "pubA.5.303.72";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    #如果传入的市场编号有值，检查是否可操作

    /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][77][@市场编号#,@允许投资市场#] */
    if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
        
        SET v_error_code = "pubA.5.303.77";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
        end if;
        leave label_pro;
    end if;

    #如果传入的证券类型有值，检查是否可操作

    /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][78][@证券类型#,@允许操作证券类型#] */
    if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
        
        SET v_error_code = "pubA.5.303.78";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
        end if;
        leave label_pro;
    end if;


    /* set @交易组业务控制配置串#=@业务控制配置串#; */
    set v_exgp_busi_config_str=v_busi_config_str;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_trade_acco = v_trade_acco;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_获取操作员操作权限串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_GetOperatorOperRights;;
DELIMITER ;;
CREATE PROCEDURE pra_user_GetOperatorOperRights(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_ctrl_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no_rights_str varchar(2048),
    OUT p_pd_no_rights_str varchar(2048),
    OUT p_exch_group_no_rights_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_busi_ctrl_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_busi_ctrl_str = p_busi_ctrl_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no_rights_str = " ";
    SET v_pd_no_rights_str = " ";
    SET v_exch_group_no_rights_str = " ";

    
    label_pro:BEGIN
    

    /* set @机构编号权限串# = " "; */
    set v_co_no_rights_str = " ";

    /* set @产品编号权限串# = " "; */
    set v_pd_no_rights_str = " ";

    /* set @交易组编号权限串# = " "; */
    set v_exch_group_no_rights_str = " ";
    #获取操作员可操作机构

    /* if SUBSTRING(@业务控制串#, 1, 1) = "1" then */
    if SUBSTRING(v_busi_ctrl_str, 1, 1) = "1" then

        /* [获取表记录变量语句][公共_用户_操作员可操作机构表][group_concat({机构编号} SEPARATOR ';')][@机构编号权限串#][{操作员编号} = @操作员编号# and {注销标志} = 0] */
        select group_concat(co_no SEPARATOR ';') into v_co_no_rights_str from db_pub.tb_user_opor_allow_co where opor_no = v_opor_no and abolish_status = 0 limit 1;


        /* set @机构编号权限串# = ifnull(@机构编号权限串#," "); */
        set v_co_no_rights_str = ifnull(v_co_no_rights_str," ");
        #缺省机构编号串需加上操作员机构编号，对本机构缺省有权限

        /* set @机构编号权限串# = concat(";", @操作员机构编号#, ";", @机构编号权限串#, ";"); */
        set v_co_no_rights_str = concat(";", v_opor_co_no, ";", v_co_no_rights_str, ";");

    /* elseif SUBSTRING(@业务控制串#, 1, 1) = "2" then */
    elseif SUBSTRING(v_busi_ctrl_str, 1, 1) = "2" then

        /* [获取表记录变量语句][公共_用户_操作员可操作机构表][group_concat({机构编号} SEPARATOR ';')][@机构编号权限串#][{操作员编号} = @操作员编号#] */
        select group_concat(co_no SEPARATOR ';') into v_co_no_rights_str from db_pub.tb_user_opor_allow_co where opor_no = v_opor_no limit 1;


        /* set @机构编号权限串# = ifnull(@机构编号权限串#," "); */
        set v_co_no_rights_str = ifnull(v_co_no_rights_str," ");

        /* set @机构编号权限串# = concat(";", @操作员机构编号#, ";", @机构编号权限串#, ";"); */
        set v_co_no_rights_str = concat(";", v_opor_co_no, ";", v_co_no_rights_str, ";");
    end if;
    #获取操作员可操作产品

    /* if SUBSTRING(@业务控制串#, 2, 1) = "1" then */
    if SUBSTRING(v_busi_ctrl_str, 2, 1) = "1" then

        /* [获取表记录变量语句][公共_用户_操作员可操作产品表][group_concat({产品编号} SEPARATOR ';')][@产品编号权限串#][{操作员编号} = @操作员编号# and {注销标志} = 0] */
        select group_concat(pd_no SEPARATOR ';') into v_pd_no_rights_str from db_pub.tb_user_opor_allow_prod where opor_no = v_opor_no and abolish_status = 0 limit 1;


        /* set @产品编号权限串# = ifnull(@产品编号权限串#," "); */
        set v_pd_no_rights_str = ifnull(v_pd_no_rights_str," ");

        /* set @产品编号权限串# = concat(";",@产品编号权限串#, ";"); */
        set v_pd_no_rights_str = concat(";",v_pd_no_rights_str, ";");

    /* elseif SUBSTRING(@业务控制串#, 2, 1) = "2" then */
    elseif SUBSTRING(v_busi_ctrl_str, 2, 1) = "2" then

        /* [获取表记录变量语句][公共_用户_操作员可操作产品表][group_concat({产品编号} SEPARATOR ';')][@产品编号权限串#][{操作员编号} = @操作员编号#] */
        select group_concat(pd_no SEPARATOR ';') into v_pd_no_rights_str from db_pub.tb_user_opor_allow_prod where opor_no = v_opor_no limit 1;


        /* set @产品编号权限串# = ifnull(@产品编号权限串#," "); */
        set v_pd_no_rights_str = ifnull(v_pd_no_rights_str," ");

        /* set @产品编号权限串# = concat(";",@产品编号权限串#, ";"); */
        set v_pd_no_rights_str = concat(";",v_pd_no_rights_str, ";");
    end if;
    #获取操作员所属交易组

    /* if SUBSTRING(@业务控制串#, 3, 1) = "1" then */
    if SUBSTRING(v_busi_ctrl_str, 3, 1) = "1" then

        /* [获取表记录变量语句][公共_用户_操作员所属交易组表][group_concat({交易组编号} SEPARATOR ';')][@交易组编号权限串#][{操作员编号} = @操作员编号# and {注销标志} = 0] */
        select group_concat(exch_group_no SEPARATOR ';') into v_exch_group_no_rights_str from db_pub.tb_user_opor_exch_group where opor_no = v_opor_no and abolish_status = 0 limit 1;


        /* set @交易组编号权限串# = ifnull(@交易组编号权限串#," "); */
        set v_exch_group_no_rights_str = ifnull(v_exch_group_no_rights_str," ");

        /* set @交易组编号权限串# = concat(";",@交易组编号权限串#, ";"); */
        set v_exch_group_no_rights_str = concat(";",v_exch_group_no_rights_str, ";");

    /* elseif SUBSTRING(@业务控制串#, 3, 1) = "2" then */
    elseif SUBSTRING(v_busi_ctrl_str, 3, 1) = "2" then

        /* [获取表记录变量语句][公共_用户_操作员所属交易组表][group_concat({交易组编号} SEPARATOR ';')][@交易组编号权限串#][{操作员编号} = @操作员编号#] */
        select group_concat(exch_group_no SEPARATOR ';') into v_exch_group_no_rights_str from db_pub.tb_user_opor_exch_group where opor_no = v_opor_no limit 1;


        /* set @交易组编号权限串# = ifnull(@交易组编号权限串#," "); */
        set v_exch_group_no_rights_str = ifnull(v_exch_group_no_rights_str," ");

        /* set @交易组编号权限串# = concat(";",@交易组编号权限串#, ";"); */
        set v_exch_group_no_rights_str = concat(";",v_exch_group_no_rights_str, ";");
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no_rights_str = v_co_no_rights_str;
    SET p_pd_no_rights_str = v_pd_no_rights_str;
    SET p_exch_group_no_rights_str = v_exch_group_no_rights_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_获取产品默认交易组编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_GetCoDefaultExchGroupNo;;
DELIMITER ;;
CREATE PROCEDURE pra_user_GetCoDefaultExchGroupNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_no int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_交易组信息表][{交易组编号}][@交易组编号#][{产品编号} = @产品编号# and {默认组标志} = 《默认组标志-是》][4][@产品编号#] */
    select exch_group_no into v_exch_group_no from db_pub.tb_user_exch_group_info where pd_no = v_pd_no and default_group_flag = 1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.305.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_检查交易组状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_CheckExchGroupStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_user_CheckExchGroupStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_exch_group_status varchar(2),
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
    declare v_exch_group_no int;
    declare v_exch_group_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_exch_group_status varchar(2);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_group_status = p_exch_group_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_exch_group_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_交易组信息表][{交易组状态},{机构编号}][@临时_交易组状态#,@机构编号#][{交易组编号}=@交易组编号#][4][@交易组编号#] */
    select exch_group_status,co_no into v_tmp_exch_group_status,v_co_no from db_pub.tb_user_exch_group_info where exch_group_no=v_exch_group_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.306.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    #交易组状态检查

    /* [检查报错返回][@交易组状态# = "0" and @临时_交易组状态# = 《交易组状态-冻结》][71][@交易组编号#,@交易组状态#,@临时_交易组状态#] */
    if v_exch_group_status = "0" and v_tmp_exch_group_status = "2" then
        
        SET v_error_code = "pubA.5.306.71";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易组状态=",v_exch_group_status,",","临时_交易组状态=",v_tmp_exch_group_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易组状态=",v_exch_group_status,",","临时_交易组状态=",v_tmp_exch_group_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@交易组状态# = "0" and @临时_交易组状态# = 《交易组状态-注销》][72][@交易组编号#,@交易组状态#,@临时_交易组状态#] */
    if v_exch_group_status = "0" and v_tmp_exch_group_status = "3" then
        
        SET v_error_code = "pubA.5.306.72";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易组状态=",v_exch_group_status,",","临时_交易组状态=",v_tmp_exch_group_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易组状态=",v_exch_group_status,",","临时_交易组状态=",v_tmp_exch_group_status);
        end if;
        leave label_pro;
    end if;

    #冻结交易组检查

    /* [检查报错返回][@交易组状态# = 《交易组状态-冻结》 and @临时_交易组状态# = 《交易组状态-冻结》][71][@交易组编号#,@交易组状态#,@临时_交易组状态#] */
    if v_exch_group_status = "2" and v_tmp_exch_group_status = "2" then
        
        SET v_error_code = "pubA.5.306.71";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易组状态=",v_exch_group_status,",","临时_交易组状态=",v_tmp_exch_group_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易组状态=",v_exch_group_status,",","临时_交易组状态=",v_tmp_exch_group_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@交易组状态# = 《交易组状态-冻结》 and @临时_交易组状态# = 《交易组状态-注销》][72][@交易组编号#,@交易组状态#,@临时_交易组状态#] */
    if v_exch_group_status = "2" and v_tmp_exch_group_status = "3" then
        
        SET v_error_code = "pubA.5.306.72";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易组状态=",v_exch_group_status,",","临时_交易组状态=",v_tmp_exch_group_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易组状态=",v_exch_group_status,",","临时_交易组状态=",v_tmp_exch_group_status);
        end if;
        leave label_pro;
    end if;

    #恢复交易组检查

    /* [检查报错返回][@交易组状态# = 《交易组状态-正常》 and @临时_交易组状态# = 《交易组状态-正常》][73][@交易组编号#,@交易组状态#,@临时_交易组状态#] */
    if v_exch_group_status = "1" and v_tmp_exch_group_status = "1" then
        
        SET v_error_code = "pubA.5.306.73";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易组状态=",v_exch_group_status,",","临时_交易组状态=",v_tmp_exch_group_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易组状态=",v_exch_group_status,",","临时_交易组状态=",v_tmp_exch_group_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@交易组状态# = 《交易组状态-正常》 and @临时_交易组状态# = 《交易组状态-注销》][72][@交易组编号#,@交易组状态#,@临时_交易组状态#] */
    if v_exch_group_status = "1" and v_tmp_exch_group_status = "3" then
        
        SET v_error_code = "pubA.5.306.72";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易组状态=",v_exch_group_status,",","临时_交易组状态=",v_tmp_exch_group_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易组状态=",v_exch_group_status,",","临时_交易组状态=",v_tmp_exch_group_status);
        end if;
        leave label_pro;
    end if;

    #注销交易组检查

    /* [检查报错返回][@交易组状态# = 《交易组状态-注销》 and @临时_交易组状态# = 《交易组状态-冻结》][71][@交易组编号#,@交易组状态#,@临时_交易组状态#] */
    if v_exch_group_status = "3" and v_tmp_exch_group_status = "2" then
        
        SET v_error_code = "pubA.5.306.71";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易组状态=",v_exch_group_status,",","临时_交易组状态=",v_tmp_exch_group_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易组状态=",v_exch_group_status,",","临时_交易组状态=",v_tmp_exch_group_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@交易组状态# = 《交易组状态-注销》 and @临时_交易组状态# = 《交易组状态-注销》][72][@交易组编号#,@交易组状态#,@临时_交易组状态#] */
    if v_exch_group_status = "3" and v_tmp_exch_group_status = "3" then
        
        SET v_error_code = "pubA.5.306.72";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易组状态=",v_exch_group_status,",","临时_交易组状态=",v_tmp_exch_group_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易组状态=",v_exch_group_status,",","临时_交易组状态=",v_tmp_exch_group_status);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_交易组获取产品默认交易组编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_GetCoDefaultExchGroup;;
DELIMITER ;;
CREATE PROCEDURE pra_user_GetCoDefaultExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int,
    OUT p_default_exch_group_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_default_exch_group_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_default_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_交易组信息表][{产品编号}][@产品编号#][{交易组编号} = @交易组编号#][4][@交易组编号#] */
    select pd_no into v_pd_no from db_pub.tb_user_exch_group_info where exch_group_no = v_exch_group_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.307.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_用户_交易组信息表][{交易组编号}][@默认交易组编号#][{产品编号} = @产品编号# and {默认组标志} = 《默认组标志-是》][4][@产品编号#] */
    select exch_group_no into v_default_exch_group_no from db_pub.tb_user_exch_group_info where pd_no = v_pd_no and default_group_flag = 1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.307.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;
    SET p_default_exch_group_no = v_default_exch_group_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_获取操作员权限串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_GetOporRightsStr;;
DELIMITER ;;
CREATE PROCEDURE pra_user_GetOporRightsStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_target_opor_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_opor_rights_str varchar(16),
    OUT p_allow_oper_mac varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_target_opor_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_target_opor_no = p_target_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";

    
    label_pro:BEGIN
    

    /* set @操作员权限串#=" "; */
    set v_opor_rights_str=" ";

    /* set @允许操作MAC#=" "; */
    set v_allow_oper_mac=" ";

    /* [获取表记录变量语句][公共_用户_操作员权限表][{操作员权限串},{允许操作MAC}][@操作员权限串#,@允许操作MAC#][{操作员编号}=@目标操作员编号#] */
    select opor_rights_str,allow_oper_mac into v_opor_rights_str,v_allow_oper_mac from db_pub.tb_user_opor_rights where opor_no=v_target_opor_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_opor_rights_str = v_opor_rights_str;
    SET p_allow_oper_mac = v_allow_oper_mac;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_获取操作员交易组权限串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_GetOporExgpRightsStr;;
DELIMITER ;;
CREATE PROCEDURE pra_user_GetOporExgpRightsStr(
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
    

    /* select opor_no  as {操作员编号}, replace(GROUP_CONCAT(exch_group_no),",",";") as {交易组编号权限串} from tb_user_opor_exch_group  group by opor_no; */
    select opor_no  as opor_no, replace(GROUP_CONCAT(exch_group_no),",",";") as exch_group_no_rights_str from tb_user_opor_exch_group  group by opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_获取操作员交易组权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_GetOporExgpRights;;
DELIMITER ;;
CREATE PROCEDURE pra_user_GetOporExgpRights(
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
    

    /* [获取表全记录][公共_用户_操作员所属交易组表][字段][1=1] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, pd_no, exch_group_no, abolish_status, 
        oper_rights from db_pub.tb_user_opor_exch_group where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_获取可设置操作员编号串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_GetAllowSetOporNoStr;;
DELIMITER ;;
CREATE PROCEDURE pra_user_GetAllowSetOporNoStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_target_opor_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_allow_opor_no_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_target_opor_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_allow_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_target_opor_no = p_target_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_allow_opor_no_str = " ";

    
    label_pro:BEGIN
    

    /* set @可操作操作员编号串# = " "; */
    set v_allow_opor_no_str = " ";

    /* [获取表记录串][公共_用户_操作员可设置操作员表][{可操作操作员编号} SEPARATOR ";"][@可操作操作员编号串#][{操作员编号}=@目标操作员编号#] */
    select group_concat(allow_opor_no SEPARATOR ";") into v_allow_opor_no_str from db_pub.tb_user_opor_allowset_opor where opor_no=v_target_opor_no;


    /* set @可操作操作员编号串# = if(@可操作操作员编号串# is null,concat(@目标操作员编号#,""),concat(@可操作操作员编号串#,";",@目标操作员编号#)); */
    set v_allow_opor_no_str = if(v_allow_opor_no_str is null,concat(v_target_opor_no,""),concat(v_allow_opor_no_str,";",v_target_opor_no));

    /* set @可操作操作员编号串# = concat(";",@可操作操作员编号串#,";"); */
    set v_allow_opor_no_str = concat(";",v_allow_opor_no_str,";");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_allow_opor_no_str = v_allow_opor_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_获取期货默认组标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_GetFutuDefaultGroupFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_user_GetFutuDefaultGroupFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_futu_default_group_flag int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_futu_default_group_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_futu_default_group_flag = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_交易组信息表][{期货默认组标志}][@期货默认组标志#][{产品编号} = @产品编号#][4][@产品编号#] */
    select futu_default_group_flag into v_futu_default_group_flag from db_pub.tb_user_exch_group_info where pd_no = v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.312.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_futu_default_group_flag = v_futu_default_group_flag;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_获取期货默认交易组编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_GetFutuDefaultExchGroupNo;;
DELIMITER ;;
CREATE PROCEDURE pra_user_GetFutuDefaultExchGroupNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_no int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_用户_交易组信息表][{交易组编号}][@交易组编号#][{产品编号} = @产品编号# and {期货默认组标志} = 《期货默认组标志-是》] */
    select exch_group_no into v_exch_group_no from db_pub.tb_user_exch_group_info where pd_no = v_pd_no and futu_default_group_flag = 1 limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_查询操作员可设置操作员
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_QueryOporAllowSetOpor;;
DELIMITER ;;
CREATE PROCEDURE pra_user_QueryOporAllowSetOpor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
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
    declare v_query_opor_no int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_co_no = p_co_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_用户_操作员可设置操作员表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{操作员编号},{可操作操作员编号}][{机构编号}=@机构编号# and (@查询操作员编号# = 0 or {操作员编号}=@查询操作员编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,opor_no,allow_opor_no from db_pub.tb_user_opor_allowset_opor where co_no=v_co_no and (v_query_opor_no = 0 or opor_no=v_query_opor_no) and row_id > v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,opor_no,allow_opor_no from db_pub.tb_user_opor_allowset_opor where co_no=v_co_no and (v_query_opor_no = 0 or opor_no=v_query_opor_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_检查操作员身份无密码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_CheckOperatorAuthNoPwd;;
DELIMITER ;;
CREATE PROCEDURE pra_user_CheckOperatorAuthNoPwd(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_opor_type int,
    OUT p_oper_rights int,
    OUT p_is_trader int
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
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_opor_old_pwd varchar(64);
    declare v_opor_status varchar(2);
    declare v_trader_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_opor_old_pwd = " ";
    SET v_opor_status = "0";
    SET v_trader_no = 0;

    
    label_pro:BEGIN
    
    #检查操作员是否存在

    /* [获取表记录变量][公共_用户_操作员信息表][{操作员密码},{操作员状态}, {操作员类型}, {是否交易员}, {操作权限}, {交易员编号}][@操作员原密码#,@操作员状态#, @操作员类型#, @是否交易员#, @操作权限#, @交易员编号#][{操作员编号} = @操作员编号# and {机构编号} = @操作员机构编号#][4][@操作员机构编号#,@操作员编号#] */
    select opor_pwd,opor_status, opor_type, is_trader, oper_rights, trader_no into v_opor_old_pwd,v_opor_status, v_opor_type, v_is_trader, v_oper_rights, v_trader_no from db_pub.tb_user_opor_info where opor_no = v_opor_no and co_no = v_opor_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.315.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员机构编号=",v_opor_co_no,",","操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员机构编号=",v_opor_co_no,",","操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;

    #如果操作员状态非正常，报错返回

    /* [检查报错返回][@操作员状态# = 《操作员状态-冻结》][61][@操作员编号#,@操作员状态#] */
    if v_opor_status = "2" then
        
        SET v_error_code = "pubA.5.315.61";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","操作员状态=",v_opor_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","操作员状态=",v_opor_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@操作员状态# = 《操作员状态-注销》][62][@操作员编号#,@操作员状态#] */
    if v_opor_status = "3" then
        
        SET v_error_code = "pubA.5.315.62";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","操作员状态=",v_opor_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","操作员状态=",v_opor_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@操作员状态# <> 《操作员状态-正常》][64][@操作员编号#,@操作员状态#] */
    if v_opor_status <> "1" then
        
        SET v_error_code = "pubA.5.315.64";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","操作员状态=",v_opor_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","操作员状态=",v_opor_status);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_opor_type = v_opor_type;
    SET p_oper_rights = v_oper_rights;
    SET p_is_trader = v_is_trader;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_更新交易组禁止订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_UpdateExchGroupForbidOrderDir;;
DELIMITER ;;
CREATE PROCEDURE pra_user_UpdateExchGroupForbidOrderDir(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_forbid_order_dir varchar(64),
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
    declare v_exch_group_no int;
    declare v_forbid_order_dir varchar(64);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_dir_str varchar(1024);
    declare v_pd_no int;
    declare v_split_str varchar(4);
    declare v_order_dir int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_occur_field varchar(2048);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_forbid_order_dir = p_forbid_order_dir;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_dir_str = " ";
    SET v_pd_no = 0;
    SET v_split_str = " ";
    SET v_order_dir = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_交易组信息表][{禁止订单方向},{产品编号}][@订单方向串#,@产品编号#][{机构编号}=@机构编号# and {交易组编号}=@交易组编号#][4][@机构编号#,@交易组编号#] */
    select forbid_order_dir,pd_no into v_order_dir_str,v_pd_no from db_pub.tb_user_exch_group_info where co_no=v_co_no and exch_group_no=v_exch_group_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.316.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* set @分隔符# = ";"; */
    set v_split_str = ";";

    /* if @订单方向串# = " " or @禁止订单方向# = " "  then */
    if v_order_dir_str = " " or v_forbid_order_dir = " "  then

         /* set @订单方向串# = @禁止订单方向#; */
         set v_order_dir_str = v_forbid_order_dir;
    else

         /* set @禁止订单方向# = concat(@禁止订单方向#,";"); */
         set v_forbid_order_dir = concat(v_forbid_order_dir,";");

         /* while LOCATE(@分隔符#,@禁止订单方向#)  <> 0  do */
         while LOCATE(v_split_str,v_forbid_order_dir)  <> 0  do

               /* set @订单方向# = cast(substring(@禁止订单方向#,1,LOCATE(@分隔符#,@禁止订单方向#)-1)as SIGNED); */
               set v_order_dir = cast(substring(v_forbid_order_dir,1,LOCATE(v_split_str,v_forbid_order_dir)-1)as SIGNED);

                      /* if (LOCATE(concat(";",@订单方向#,";"),concat(";",@订单方向串#,";") )= 0)then */
                      if (LOCATE(concat(";",v_order_dir,";"),concat(";",v_order_dir_str,";") )= 0)then

                           /* set @订单方向串# = concat(@订单方向串#,";",@订单方向#); */
                           set v_order_dir_str = concat(v_order_dir_str,";",v_order_dir);
                      end if;

               /* set @禁止订单方向#=substring(@禁止订单方向#,LOCATE(@分隔符#,@禁止订单方向#)+1); */
               set v_forbid_order_dir=substring(v_forbid_order_dir,LOCATE(v_split_str,v_forbid_order_dir)+1);
          end while;
    end if;

    /* [更新表记录][公共_用户_交易组信息表][{禁止订单方向}=@订单方向串#][{机构编号}=@机构编号# and {交易组编号}=@交易组编号#][2][@机构编号#,@交易组编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_exch_group_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, forbid_order_dir=v_order_dir_str where co_no=v_co_no and exch_group_no=v_exch_group_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.316.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* set @流水变动字段# = "|禁止订单方向"; */
    set v_jour_occur_field = "|禁止订单方向";

    /* set @流水后信息# = concat("|",@订单方向串#); */
    set v_jour_after_occur_info = concat("|",v_order_dir_str);

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_用户_交易组信息流水表][字段][字段变量][5][@交易组编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_exch_group_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.5.316.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户_检查交易组限制信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_CheckExchGroupLimitInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_user_CheckExchGroupLimitInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_order_dir int,
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
    declare v_exch_group_no int;
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_exch_group_code varchar(32);
    declare v_exch_group_name varchar(64);
    declare v_exch_group_status varchar(2);
    declare v_default_group_flag int;
    declare v_pd_no int;
    declare v_first_asset decimal(18,4);
    declare v_exch_group_dist_pd_amt decimal(18,4);
    declare v_exch_group_pd_share decimal(18,2);
    declare v_pre_exch_group_pd_share decimal(18,2);
    declare v_pre_nav decimal(18,4);
    declare v_begin_NAV decimal(18,4);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_config_str varchar(64);
    declare v_market_price_ratio decimal(18,12);
    declare v_forbid_order_dir varchar(64);
    declare v_weight_value decimal(18,4);
    declare v_trade_acco varchar(32);
    declare v_remark_info varchar(255);
    declare v_abolish_date int;
    declare v_futu_default_group_flag int;
    declare v_fina_loan_default_group_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_group_no = p_exch_group_no;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_exch_group_code = " ";
    SET v_exch_group_name = " ";
    SET v_exch_group_status = "0";
    SET v_default_group_flag = 0;
    SET v_pd_no = 0;
    SET v_first_asset = 0;
    SET v_exch_group_dist_pd_amt = 0;
    SET v_exch_group_pd_share = 0;
    SET v_pre_exch_group_pd_share = 0;
    SET v_pre_nav = 0;
    SET v_begin_NAV = 0;
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_busi_config_str = " ";
    SET v_market_price_ratio = 0;
    SET v_forbid_order_dir = " ";
    SET v_weight_value = 0;
    SET v_trade_acco = " ";
    SET v_remark_info = " ";
    SET v_abolish_date = 0;
    SET v_futu_default_group_flag = 0;
    SET v_fina_loan_default_group_flag = 0;

    
    label_pro:BEGIN
    
    #检查交易组是否存在

    /* [获取表记录变量][公共_用户_交易组信息表][字段][字段变量][{交易组编号} = @交易组编号#][4][@交易组编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_group_no, 
        co_no, exch_group_code, exch_group_name, exch_group_status, 
        default_group_flag, pd_no, first_asset, exch_group_dist_pd_amt, 
        exch_group_pd_share, pre_exch_group_pd_share, pre_nav, begin_NAV, 
        allow_exch, allow_stock_type, busi_config_str, market_price_ratio, 
        forbid_order_dir, weight_value, trade_acco, remark_info, 
        abolish_date, futu_default_group_flag, fina_loan_default_group_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_exch_group_no, 
        v_co_no, v_exch_group_code, v_exch_group_name, v_exch_group_status, 
        v_default_group_flag, v_pd_no, v_first_asset, v_exch_group_dist_pd_amt, 
        v_exch_group_pd_share, v_pre_exch_group_pd_share, v_pre_nav, v_begin_NAV, 
        v_allow_exch, v_allow_stock_type, v_busi_config_str, v_market_price_ratio, 
        v_forbid_order_dir, v_weight_value, v_trade_acco, v_remark_info, 
        v_abolish_date, v_futu_default_group_flag, v_fina_loan_default_group_flag from db_pub.tb_user_exch_group_info where exch_group_no = v_exch_group_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.5.317.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

        #禁止订单方向检查

        /* if @禁止订单方向#<>" " then */
        if v_forbid_order_dir<>" " then

            /* [检查报错返回][instr(concat(";",@禁止订单方向#,";"),concat(";",@订单方向#,";"))>0][639][@订单方向#] */
            if instr(concat(";",v_forbid_order_dir,";"),concat(";",v_order_dir,";"))>0 then
                
                SET v_error_code = "pubA.5.317.639";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单方向=",v_order_dir),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单方向=",v_order_dir);
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

# 原子_公共_用户_查询交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_user_QueryExchGroupInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_user_QueryExchGroupInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_default_group_flag int,
    IN p_pd_no int,
    IN p_exch_group_status_str varchar(64),
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
    declare v_exch_group_no int;
    declare v_default_group_flag int;
    declare v_pd_no int;
    declare v_exch_group_status_str varchar(64);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_default_group_flag = p_default_group_flag;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_status_str = p_exch_group_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

        /* [获取表记录][公共_用户_交易组信息表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{交易组编号},{机构编号},{交易组编码},{交易组名称},{交易组状态},{默认组标志},{产品编号},{原始资产},{昨日净值},{分配产品资金},{交易组产品份额},{允许投资市场},{允许操作证券类型},{业务控制配置串},{市价冻结浮动比例},{禁止订单方向},{交易账户},{权重值},{备注信息},{期货默认组标志},{融资融券默认组标志}][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@默认组标志# = 0 or {默认组标志}=@默认组标志#) and (@产品编号# = 0 or {产品编号}=@产品编号#)  and (@交易组状态串# = "; ;" or instr(@交易组状态串#, concat(";", {交易组状态}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id,create_date,create_time,update_date,update_time,exch_group_no,co_no,exch_group_code,exch_group_name,exch_group_status,default_group_flag,pd_no,first_asset,pre_nav,exch_group_dist_pd_amt,exch_group_pd_share,allow_exch,allow_stock_type,busi_config_str,market_price_ratio,forbid_order_dir,trade_acco,weight_value,remark_info,futu_default_group_flag,fina_loan_default_group_flag from db_pub.tb_user_exch_group_info where (v_co_no = 0 or co_no=v_co_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_default_group_flag = 0 or default_group_flag=v_default_group_flag) and (v_pd_no = 0 or pd_no=v_pd_no)  and (v_exch_group_status_str = "; ;" or instr(v_exch_group_status_str, concat(";", exch_group_status, ";")) > 0) and row_id > v_row_id order by row_id;
        else
            select row_id,create_date,create_time,update_date,update_time,exch_group_no,co_no,exch_group_code,exch_group_name,exch_group_status,default_group_flag,pd_no,first_asset,pre_nav,exch_group_dist_pd_amt,exch_group_pd_share,allow_exch,allow_stock_type,busi_config_str,market_price_ratio,forbid_order_dir,trade_acco,weight_value,remark_info,futu_default_group_flag,fina_loan_default_group_flag from db_pub.tb_user_exch_group_info where (v_co_no = 0 or co_no=v_co_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_default_group_flag = 0 or default_group_flag=v_default_group_flag) and (v_pd_no = 0 or pd_no=v_pd_no)  and (v_exch_group_status_str = "; ;" or instr(v_exch_group_status_str, concat(";", exch_group_status, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


