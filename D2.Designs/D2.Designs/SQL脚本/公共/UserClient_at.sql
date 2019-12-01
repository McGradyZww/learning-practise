DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_新增操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_AddOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_AddOperatorInfo(
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
    IN p_index_value int,
    IN p_manage_nolgn_opor_orders int,
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
    declare v_index_value int;
    declare v_manage_nolgn_opor_orders int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_opor int;
    declare v_tmp_opor_no int;
    declare v_opor_pwd varchar(64);
    declare v_opor_status varchar(2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;
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
    SET v_index_value = p_index_value;
    SET v_manage_nolgn_opor_orders = p_manage_nolgn_opor_orders;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_opor = 0;
    SET v_tmp_opor_no = 0;
    SET v_opor_pwd = " ";
    SET v_opor_status = "0";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @记录个数#=0; */
    set v_record_count=0;

    /* [获取表记录数量][公共_用户_操作员信息表][@记录个数#][{机构编号}=@机构编号# and {操作员状态}<>"3"] */
    select count(1) into v_record_count from db_pub.tb_user_opor_info where co_no=v_co_no and opor_status<>"3";


    /* [检查报错返回][@记录个数#>=@操作员数量上限#][32][@机构编号#] */
    if v_record_count>=v_opor_qty_max then
        
        SET v_error_code = "pubA.19.1.32";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "目标操作员编号", "|", "机构编号", "|", "操作员名称", "|", "操作员类型", "|", "目标操作员密码", "|", "联系地址", "|", "操作权限", "|", "电话", "|", "EMAIL", "|", "是否交易员", "|", "交易员编号", "|", "允许登录方式", "|", "允许操作IP", "|", "允许操作MAC", "|", "操作备注", "|", "菜单编号", "|", "操作员数量上限", "|", "索引值", "|", "管理非登录操作员订单", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_target_opor_no, "|", v_co_no, "|", v_opor_name, "|", v_opor_type, "|", v_target_opor_pwd, "|", v_conta_addr, "|", v_oper_rights, "|", v_phone_number, "|", v_email, "|", v_is_trader, "|", v_trader_no, "|", v_allow_login_type, "|", v_allow_oper_ip_addr, "|", v_allow_oper_mac, "|", v_oper_remark_info, "|", v_menu_no, "|", v_opor_qty_max, "|", v_index_value, "|", v_manage_nolgn_opor_orders, "|");


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
    #set @管理非登录操作员订单#=0;

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
                
        SET v_error_code = "pubA.19.1.1";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_用户_操作员信息表][字段][字段变量][{操作员编号}=@目标操作员编号#][4][@目标操作员编号#] */
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
        v_manage_nolgn_opor_orders from db_pub.tb_user_opor_info where opor_no=v_target_opor_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.1.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_target_opor_no, "|", v_co_no, "|", v_opor_name, "|", v_opor_type, "|", v_target_opor_pwd, "|", v_conta_addr, "|", v_oper_rights, "|", v_phone_number, "|", v_email, "|", v_is_trader, "|", v_trader_no, "|", v_allow_login_type, "|", v_allow_oper_ip_addr, "|", v_allow_oper_mac, "|", v_oper_remark_info, "|", v_menu_no, "|", v_opor_qty_max, "|", v_index_value, "|", v_manage_nolgn_opor_orders, "|");


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
                
        SET v_error_code = "pubA.19.1.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_修改操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_ModiOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_ModiOperatorInfo(
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
    IN p_manage_nolgn_opor_orders int,
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
    declare v_manage_nolgn_opor_orders int;
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_co_no = p_co_no;
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
    SET v_manage_nolgn_opor_orders = p_manage_nolgn_opor_orders;
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
    set v_jour_occur_field = concat("初始化日期", "|", "目标操作员编号", "|", "机构编号", "|", "操作员名称", "|", "操作员类型", "|", "联系地址", "|", "电话", "|", "EMAIL", "|", "是否交易员", "|", "交易员编号", "|", "允许登录方式", "|", "允许操作IP", "|", "允许操作MAC", "|", "操作备注", "|", "菜单编号", "|", "管理非登录操作员订单", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_target_opor_no, "|", v_co_no, "|", v_opor_name, "|", v_opor_type, "|", v_conta_addr, "|", v_phone_number, "|", v_email, "|", v_is_trader, "|", v_trader_no, "|", v_allow_login_type, "|", v_allow_oper_ip_addr, "|", v_allow_oper_mac, "|", v_oper_remark_info, "|", v_menu_no, "|", v_manage_nolgn_opor_orders, "|");


    /* [更新表记录][公共_用户_操作员信息表][{操作员名称}=@操作员名称#,{操作员类型}=@操作员类型#,{联系地址}=@联系地址#,{电话}=@电话#,{EMAIL}=@EMAIL#,{是否交易员}=@是否交易员#,{交易员编号}=@交易员编号#,{允许登录方式}=@允许登录方式#,{允许操作IP}=@允许操作IP#,{允许操作MAC}=@允许操作MAC#][{操作员编号}=@目标操作员编号#][2][@目标操作员编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, opor_name=v_opor_name,opor_type=v_opor_type,conta_addr=v_conta_addr,phone_number=v_phone_number,email=v_email,is_trader=v_is_trader,trader_no=v_trader_no,allow_login_type=v_allow_login_type,allow_oper_ip_addr=v_allow_oper_ip_addr,allow_oper_mac=v_allow_oper_mac where opor_no=v_target_opor_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.2.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;


    /* if @管理非登录操作员订单# <> 0 then */
    if v_manage_nolgn_opor_orders <> 0 then

        /* [更新表记录][公共_用户_操作员信息表][{管理非登录操作员订单}=@管理非登录操作员订单#][{操作员编号}=@目标操作员编号#][2][@目标操作员编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pub.tb_user_opor_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, manage_nolgn_opor_orders=v_manage_nolgn_opor_orders where opor_no=v_target_opor_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.19.2.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [获取表记录变量][公共_用户_操作员信息表][{记录序号}][@记录序号#][{操作员编号}=@目标操作员编号#][4][@目标操作员编号#] */
    select row_id into v_row_id from db_pub.tb_user_opor_info where opor_no=v_target_opor_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.2.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_target_opor_no, "|", v_co_no, "|", v_opor_name, "|", v_opor_type, "|", v_conta_addr, "|", v_phone_number, "|", v_email, "|", v_is_trader, "|", v_trader_no, "|", v_allow_login_type, "|", v_allow_oper_ip_addr, "|", v_allow_oper_mac, "|", v_oper_remark_info, "|", v_menu_no, "|", v_manage_nolgn_opor_orders, "|");


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
                
        SET v_error_code = "pubA.19.2.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryOperatorInfo(
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
    
    #[获取表记录][公共_用户_操作员信息表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{机构编号},{操作员编号},{操作员名称},{操作员类型},{操作员密码},{操作员状态},{创建者},{联系地址},{操作权限},{电话},{EMAIL},{是否交易员},{交易员编号},{允许登录方式},{允许操作IP},{允许操作MAC},{管理非登录操作员订单}][{机构编号}=@机构编号# and (@查询操作员编号# = 0 or {操作员编号}=@查询操作员编号#) and (@是否交易员# = 0 or {是否交易员}=@是否交易员#) and (@操作员类型串# = "; ;" or instr(@操作员类型串#, concat(";", {操作员类型}, ";")) > 0) and (@操作员状态串# = "; ;" or instr(@操作员状态串#, concat(";", {操作员状态}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]
    #允许登录MAC 在oper_info表，允许操作MAC 从权限表取。

    /* if @指定行数# = -1 then */
    if v_row_count = -1 then

        /* SELECT a.{记录序号},a.{创建日期},a.{创建时间},a.{更新日期},a.{更新时间},a.{机构编号},a.{操作员编号},a.{操作员名称},a.{操作员类型},a.{操作员密码},a.{操作员状态},a.{创建者},a.{联系地址},a.{操作权限},a.{电话},a.{EMAIL},a.{是否交易员},a.{交易员编号},a.{允许登录方式},a.{允许操作IP},a.{允许操作MAC} AS {允许登录MAC},a.{索引值},a.{管理非登录操作员订单},IFNULL(b.{允许操作MAC}," ") AS {允许操作MAC},IFNULL(b.{操作员权限串}," ") AS {操作员权限串} FROM ~公共_用户_操作员信息表^  a
LEFT JOIN 
~公共_用户_操作员权限表^  b
ON a.{操作员编号}= b.{操作员编号}
WHERE
a.{机构编号}=@机构编号# and (@查询操作员编号# = 0 or a.{操作员编号}=@查询操作员编号#) and (@是否交易员# = 0 or a.{是否交易员}=@是否交易员#) and (@操作员类型串# = "; ;" or instr(@操作员类型串#, concat(";", a.{操作员类型}, ";")) > 0) and (@操作员状态串# = "; ;" or instr(@操作员状态串#, concat(";", a.{操作员状态}, ";")) > 0) and a.{记录序号} > @记录序号# order by if(a.{索引值}<>0,a.{索引值},a.{操作员编号}); */
        SELECT a.row_id,a.create_date,a.create_time,a.update_date,a.update_time,a.co_no,a.opor_no,a.opor_name,a.opor_type,a.opor_pwd,a.opor_status,a.create_opor,a.conta_addr,a.oper_rights,a.phone_number,a.email,a.is_trader,a.trader_no,a.allow_login_type,a.allow_oper_ip_addr,a.allow_oper_mac AS allow_login_mac,a.index_value,a.manage_nolgn_opor_orders,IFNULL(b.allow_oper_mac," ") AS allow_oper_mac,IFNULL(b.opor_rights_str," ") AS opor_rights_str FROM db_pub.tb_user_opor_info  a
        LEFT JOIN 
        db_pub.tb_user_opor_rights  b
        ON a.opor_no= b.opor_no
        WHERE
        a.co_no=v_co_no and (v_query_opor_no = 0 or a.opor_no=v_query_opor_no) and (v_is_trader = 0 or a.is_trader=v_is_trader) and (v_opor_type_str = "; ;" or instr(v_opor_type_str, concat(";", a.opor_type, ";")) > 0) and (v_opor_status_str = "; ;" or instr(v_opor_status_str, concat(";", a.opor_status, ";")) > 0) and a.row_id > v_row_id order by if(a.index_value<>0,a.index_value,a.opor_no);
    else

        /* SELECT a.{记录序号},a.{创建日期},a.{创建时间},a.{更新日期},a.{更新时间},a.{机构编号},a.{操作员编号},a.{操作员名称},a.{操作员类型},a.{操作员密码},a.{操作员状态},a.{创建者},a.{联系地址},a.{操作权限},a.{电话},a.{EMAIL},a.{是否交易员},a.{交易员编号},a.{允许登录方式},a.{允许操作IP},a.{允许操作MAC} AS {允许登录MAC},a.{索引值},a.{管理非登录操作员订单},IFNULL(b.{允许操作MAC}," ") AS {允许操作MAC},IFNULL(b.{操作员权限串}," ") AS {操作员权限串} FROM ~公共_用户_操作员信息表^  a
LEFT JOIN 
~公共_用户_操作员权限表^  b
ON a.{操作员编号}= b.{操作员编号}
WHERE
a.{机构编号}=@机构编号# and (@查询操作员编号# = 0 or a.{操作员编号}=@查询操作员编号#) and (@是否交易员# = 0 or a.{是否交易员}=@是否交易员#) and (@操作员类型串# = "; ;" or instr(@操作员类型串#, concat(";", a.{操作员类型}, ";")) > 0) and (@操作员状态串# = "; ;" or instr(@操作员状态串#, concat(";", a.{操作员状态}, ";")) > 0) and a.{记录序号} > @记录序号# order by if(a.{索引值}<>0,a.{索引值},a.{操作员编号}) LIMIT @指定行数#; */
        SELECT a.row_id,a.create_date,a.create_time,a.update_date,a.update_time,a.co_no,a.opor_no,a.opor_name,a.opor_type,a.opor_pwd,a.opor_status,a.create_opor,a.conta_addr,a.oper_rights,a.phone_number,a.email,a.is_trader,a.trader_no,a.allow_login_type,a.allow_oper_ip_addr,a.allow_oper_mac AS allow_login_mac,a.index_value,a.manage_nolgn_opor_orders,IFNULL(b.allow_oper_mac," ") AS allow_oper_mac,IFNULL(b.opor_rights_str," ") AS opor_rights_str FROM db_pub.tb_user_opor_info  a
        LEFT JOIN 
        db_pub.tb_user_opor_rights  b
        ON a.opor_no= b.opor_no
        WHERE
        a.co_no=v_co_no and (v_query_opor_no = 0 or a.opor_no=v_query_opor_no) and (v_is_trader = 0 or a.is_trader=v_is_trader) and (v_opor_type_str = "; ;" or instr(v_opor_type_str, concat(";", a.opor_type, ";")) > 0) and (v_opor_status_str = "; ;" or instr(v_opor_status_str, concat(";", a.opor_status, ";")) > 0) and a.row_id > v_row_id order by if(a.index_value<>0,a.index_value,a.opor_no) LIMIT v_row_count;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_更新操作员状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_UpdateOperatorStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_UpdateOperatorStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
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
    declare v_co_no int;
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


    /* [更新表记录][公共_用户_操作员信息表][{操作员状态}=@操作员状态#][{操作员编号}=@目标操作员编号# and {机构编号}=@机构编号#][2][@目标操作员编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, opor_status=v_opor_status where opor_no=v_target_opor_no and co_no=v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.6.2";
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
                        
                SET v_error_code = "pubA.19.6.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("记录序号=",v_row_id);
                end if;
                leave label_pro;
            end if;

        end if;
    end if;

    /* [获取表记录变量][公共_用户_操作员信息表][{机构编号}, {操作员状态}][@机构编号#, @操作员状态#][{操作员编号}=@目标操作员编号#][4][@目标操作员编号#] */
    select co_no, opor_status into v_co_no, v_opor_status from db_pub.tb_user_opor_info where opor_no=v_target_opor_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.6.4";
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
                
        SET v_error_code = "pubA.19.6.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_校验操作员密码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_CheckOperatorPassword;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_CheckOperatorPassword(
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
                
        SET v_error_code = "pubA.19.8.4";
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
        
        SET v_error_code = "pubA.19.8.211";
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

# 原子_公共_用户客户端_修改操作员密码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_UpdateOperatorPassword;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_UpdateOperatorPassword(
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
    declare v_opor_old_pwd varchar(64);
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
    SET v_opor_old_pwd = " ";
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
    

    /* [获取流水变动][{操作员密码}][@操作员原密码#] */
    set v_jour_occur_field = concat("操作员密码","|");
    set v_jour_occur_info = concat(v_opor_old_pwd,"|");


    /* [操作员密码加密][@操作员新密码#] */
    set v_opor_new_pwd = MD5(concat("LDOSM",v_opor_new_pwd));


    /* [更新表记录][公共_用户_操作员信息表][{操作员密码}=@操作员新密码#][{操作员编号}=@目标操作员编号#][2][@操作员编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, opor_pwd=v_opor_new_pwd where opor_no=v_target_opor_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.9.2";
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

    /* [更新表记录][公共_用户_操作员登录信息表][{改密标志}=@改密标志#][{操作员编号}=@目标操作员编号# ][2][@操作员编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_login_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, change_pwd_flag=v_change_pwd_flag where opor_no=v_target_opor_no ;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.9.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_用户_操作员信息表][{机构编号}, {操作员密码}][@机构编号#, @操作员密码#][{操作员编号}=@目标操作员编号#][4][@操作员编号#] */
    select co_no, opor_pwd into v_co_no, v_opor_pwd from db_pub.tb_user_opor_info where opor_no=v_target_opor_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.9.4";
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
                
        SET v_error_code = "pubA.19.9.5";
        SET v_error_info =  CONCAT(concat("操作员编号=",v_target_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询操作员信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryOperatorInfoJour;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryOperatorInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_init_date int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_target_opor_no = p_target_opor_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_用户_操作员信息流水表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{操作菜单},{操作功能},{初始化日期},{机构编号},{目标操作员编号},{流水变动字段},{流水后信息},{操作备注}][{初始化日期}<=@初始化日期# and {操作员机构编号}=@操作员机构编号# and {机构编号}=@机构编号# and (@目标操作员编号# = 0 or {目标操作员编号}=@目标操作员编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_menu_no,oper_func_code,init_date,co_no,target_opor_no,jour_occur_field,jour_after_occur_info,oper_remark_info from db_pub.tb_user_opor_info_jour where init_date<=v_init_date and opor_co_no=v_opor_co_no and co_no=v_co_no and (v_target_opor_no = 0 or target_opor_no=v_target_opor_no) and row_id > v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_menu_no,oper_func_code,init_date,co_no,target_opor_no,jour_occur_field,jour_after_occur_info,oper_remark_info from db_pub.tb_user_opor_info_jour where init_date<=v_init_date and opor_co_no=v_opor_co_no and co_no=v_co_no and (v_target_opor_no = 0 or target_opor_no=v_target_opor_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询历史操作员信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryOperatorInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryOperatorInfoJour_His(
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
    

    /* [获取表记录][历史_公共_用户_操作员信息流水表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{操作菜单},{操作功能},{初始化日期},{机构编号},{目标操作员编号},{流水变动字段},{流水后信息},{操作备注}][({初始化日期} between @开始日期# and @结束日期#) and {操作员机构编号}=@操作员机构编号# and {机构编号}=@机构编号# and (@目标操作员编号# = 0 or {目标操作员编号}=@目标操作员编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_menu_no,oper_func_code,init_date,co_no,target_opor_no,jour_occur_field,jour_after_occur_info,oper_remark_info from db_pub_his.tb_user_opor_info_jour_his where (init_date between v_begin_date and v_end_date) and opor_co_no=v_opor_co_no and co_no=v_co_no and (v_target_opor_no = 0 or target_opor_no=v_target_opor_no) and row_id > v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_menu_no,oper_func_code,init_date,co_no,target_opor_no,jour_occur_field,jour_after_occur_info,oper_remark_info from db_pub_his.tb_user_opor_info_jour_his where (init_date between v_begin_date and v_end_date) and opor_co_no=v_opor_co_no and co_no=v_co_no and (v_target_opor_no = 0 or target_opor_no=v_target_opor_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_检查操作员存在
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_CheckOperatorExists;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_CheckOperatorExists(
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
                
        SET v_error_code = "pubA.19.13.65";
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

# 原子_公共_用户客户端_获取操作员编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_GetOperatorNo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_GetOperatorNo(
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

# 原子_公共_用户客户端_查询操作员列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryOperatorList;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryOperatorList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_co_no = p_co_no;
    SET v_is_trader = p_is_trader;
    SET v_opor_status_str = p_opor_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_用户_操作员信息表][{记录序号},{机构编号},{操作员编号},{操作员名称},{操作员状态},{是否交易员}][{机构编号}=@机构编号# and (@是否交易员# = 0 or {是否交易员}=@是否交易员#) and (@操作员状态串# = "; ;" or instr(@操作员状态串#, concat(";", {操作员状态}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,co_no,opor_no,opor_name,opor_status,is_trader from db_pub.tb_user_opor_info where co_no=v_co_no and (v_is_trader = 0 or is_trader=v_is_trader) and (v_opor_status_str = "; ;" or instr(v_opor_status_str, concat(";", opor_status, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id,co_no,opor_no,opor_name,opor_status,is_trader from db_pub.tb_user_opor_info where co_no=v_co_no and (v_is_trader = 0 or is_trader=v_is_trader) and (v_opor_status_str = "; ;" or instr(v_opor_status_str, concat(";", opor_status, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_新增操作员权限信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_AddOperatorRightsInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_AddOperatorRightsInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_allow_oper_mac varchar(255),
    IN p_opor_rights_str varchar(16),
    IN p_menu_no int,
    IN p_oper_remark_info varchar(255),
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
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights_str varchar(16);
    declare v_menu_no int;
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_opor_no int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_allow_oper_mac = p_allow_oper_mac;
    SET v_opor_rights_str = p_opor_rights_str;
    SET v_menu_no = p_menu_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_opor_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_jour_after_occur_info = " ";

    
    label_pro:BEGIN
    

    /* set @临时_操作员编号#=@操作员编号#; */
    set v_tmp_opor_no=v_opor_no;

    /* set @操作员编号#=@目标操作员编号#; */
    set v_opor_no=v_target_opor_no;

    /* [插入表记录][公共_用户_操作员权限表][字段][字段变量][1][@目标操作员编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_rights(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, allow_oper_mac, 
        opor_rights_str) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_allow_oper_mac, 
        v_opor_rights_str);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.16.1";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水变动][{允许操作MAC},{操作员权限串}][@允许操作MAC#,@操作员权限串#] */
    set v_jour_occur_field = concat("允许操作MAC","|","操作员权限串","|");
    set v_jour_occur_info = concat(v_allow_oper_mac,"|",v_opor_rights_str,"|");


    /* set @操作菜单#=@菜单编号#; */
    set v_oper_menu_no=v_menu_no;

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* [获取流水后信息][@允许操作MAC#,@操作员权限串#] */
    set v_jour_after_occur_info = concat(v_allow_oper_mac,"|",v_opor_rights_str,"|");


    /* set @操作员编号#=@临时_操作员编号#; */
    set v_opor_no=v_tmp_opor_no;

    /* [插入表记录][公共_用户_操作员权限流水表][字段][字段变量][1][@初始化日期#,@目标操作员编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_rights_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, target_opor_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_target_opor_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.16.1";
        SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_修改操作员权限信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_ModiOperatorRightsInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_ModiOperatorRightsInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_allow_oper_mac varchar(255),
    IN p_opor_rights_str varchar(16),
    IN p_menu_no int,
    IN p_oper_remark_info varchar(255),
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
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights_str varchar(16);
    declare v_menu_no int;
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_jour_after_occur_info varchar(2048);
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
    SET v_allow_oper_mac = p_allow_oper_mac;
    SET v_opor_rights_str = p_opor_rights_str;
    SET v_menu_no = p_menu_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_jour_after_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #set @操作员编号#=@目标操作员编号#;
    #[变量补分隔符][@操作员权限串#]

    /* [更新表记录][公共_用户_操作员权限表][{允许操作MAC}=@允许操作MAC#,{操作员权限串}=@操作员权限串#][{操作员编号}=@目标操作员编号#][2][@目标操作员编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_rights set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, allow_oper_mac=v_allow_oper_mac,opor_rights_str=v_opor_rights_str where opor_no=v_target_opor_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.17.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水变动][{允许操作MAC},{操作员权限串}][@允许操作MAC#,@操作员权限串#] */
    set v_jour_occur_field = concat("允许操作MAC","|","操作员权限串","|");
    set v_jour_occur_info = concat(v_allow_oper_mac,"|",v_opor_rights_str,"|");


    /* set @操作菜单#=@菜单编号#; */
    set v_oper_menu_no=v_menu_no;

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* [获取流水后信息][@允许操作MAC#,@操作员权限串#] */
    set v_jour_after_occur_info = concat(v_allow_oper_mac,"|",v_opor_rights_str,"|");


    /* [插入表记录][公共_用户_操作员权限流水表][字段][字段变量][1][@初始化日期#,@目标操作员编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_rights_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, target_opor_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_target_opor_no, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.17.1";
        SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","目标操作员编号=",v_target_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询操作员权限信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryOperatorRightsInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryOperatorRightsInfo(
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
    OUT p_allow_oper_mac varchar(255),
    OUT p_opor_rights_str varchar(16)
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
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights_str varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_allow_oper_mac = " ";
    SET v_opor_rights_str = " ";

    
    label_pro:BEGIN
    

    /* set @允许操作MAC#=" "; */
    set v_allow_oper_mac=" ";

    /* set @操作员权限串#=" "; */
    set v_opor_rights_str=" ";

    /* [获取表记录变量语句][公共_用户_操作员权限表][{允许操作MAC},{操作员权限串}][@允许操作MAC#,@操作员权限串#][{操作员编号}=@目标操作员编号#] */
    select allow_oper_mac,opor_rights_str into v_allow_oper_mac,v_opor_rights_str from db_pub.tb_user_opor_rights where opor_no=v_target_opor_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_allow_oper_mac = v_allow_oper_mac;
    SET p_opor_rights_str = v_opor_rights_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询操作员登录地址信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryOperatorLoginAddressInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryOperatorLoginAddressInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_target_opor_no int,
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    
    #set @操作员编号#=@目标操作员编号#;
    #set @操作MAC#=" ";
    #set @操作IP#=" ";

    /* set @指定行数#=100; */
    set v_row_count=100;

    /* [获取表记录][公共_用户_操作员登录地址信息表][{操作MAC},{操作IP}][{操作员编号}=@目标操作员编号# and {操作MAC}<>" "][@指定行数#] */
    if v_row_count = -1 then
        select oper_mac,oper_ip_addr from db_pub.tb_user_opor_login_address_info where opor_no=v_target_opor_no and oper_mac<>" ";
    else
        select oper_mac,oper_ip_addr from db_pub.tb_user_opor_login_address_info where opor_no=v_target_opor_no and oper_mac<>" " limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_操作员登录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_OperatorLogin;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_OperatorLogin(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_target_opor_pwd varchar(64),
    IN p_client_version varchar(16),
    IN p_config_value varchar(2048),
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
    OUT p_last_oper_info varchar(255),
    OUT p_co_type int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_change_pwd_flag int
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
    declare v_config_value varchar(2048);
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
    declare v_last_oper_info varchar(255);
    declare v_co_type int;
    declare v_co_busi_config_str varchar(64);
    declare v_change_pwd_flag int;
    declare v_opor_status varchar(2);
    declare v_sys_config_str varchar(64);
    declare v_target_opor_no int;
    declare v_menu_no int;
    declare v_oper_remark_info varchar(255);
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
    SET v_config_value = p_config_value;
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
    SET v_last_oper_info = " ";
    SET v_co_type = 0;
    SET v_co_busi_config_str = " ";
    SET v_change_pwd_flag = 0;
    SET v_opor_status = "0";
    SET v_sys_config_str = " ";
    SET v_target_opor_no = 0;
    SET v_menu_no = 0;
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #先获取操作员信息。包括密码等，以用于校验和传出参数

    /* set @改密标志#=0; */
    set v_change_pwd_flag=0;

    /* [获取表记录变量][公共_用户_操作员信息表][{机构编号},{操作员名称},{操作员类型},{操作员密码},{操作权限},{是否交易员},{交易员编号},{允许操作IP},{允许操作MAC},{允许登录方式},{操作员状态}][@机构编号#, @操作员名称#, @操作员类型#, @操作员密码#, @操作权限#, @是否交易员#, @交易员编号#, @允许操作IP#, @允许操作MAC#, @允许登录方式#,@操作员状态#][{操作员编号}=@操作员编号#][65][@操作员编号#] */
    select co_no,opor_name,opor_type,opor_pwd,oper_rights,is_trader,trader_no,allow_oper_ip_addr,allow_oper_mac,allow_login_type,opor_status into v_co_no, v_opor_name, v_opor_type, v_opor_pwd, v_oper_rights, v_is_trader, v_trader_no, v_allow_oper_ip_addr, v_allow_oper_mac, v_allow_login_type,v_opor_status from db_pub.tb_user_opor_info where opor_no=v_opor_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.21.65";
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
        SET v_error_code = "pubA.19.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@操作员状态# = 《操作员状态-冻结》][61][@操作员编号#] */
    if v_opor_status = "2" then
        
        SET v_error_code = "pubA.19.21.61";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@操作员状态# = 《操作员状态-注销》][62][@操作员编号#] */
    if v_opor_status = "3" then
        
        SET v_error_code = "pubA.19.21.62";
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
        SET v_error_code = "pubA.19.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取机构类型出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #获取上次登录信息，不处理报错

    /* [获取表记录变量语句][公共_用户_操作员登录信息表][{登录次数}, {登录错误次数}, {操作IP}, {操作MAC}, {更新日期}, {更新时间},{改密标志},{操作信息}][@登录次数#, @登录错误次数#, @上次登录IP#, @上次登录MAC#, @上次登录日期#, @上次登录时间#,@改密标志#,@上次操作信息#][{操作员编号}=@操作员编号# and {操作方式}=@操作方式#] */
    select login_count, login_error_count, oper_ip_addr, oper_mac, update_date, update_time,change_pwd_flag,oper_info into v_login_count, v_login_error_count, v_last_login_ip, v_last_login_mac, v_last_login_date, v_last_login_time,v_change_pwd_flag,v_last_oper_info from db_pub.tb_user_opor_login_info where opor_no=v_opor_no and oper_way=v_oper_way limit 1;

    #首次登录需要改密,设置改密标志为1
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

        /* set @改密标志#=1; */
        set v_change_pwd_flag=1;

        /* set @上次操作信息# = " "; */
        set v_last_oper_info = " ";
        #若管理端或交易端有任一记录,则取该记录.

        /* [获取表记录变量语句][公共_用户_操作员登录信息表][{改密标志}][@改密标志#][{操作员编号}=@操作员编号# and {操作方式}=3-@操作方式#] */
        select change_pwd_flag into v_change_pwd_flag from db_pub.tb_user_opor_login_info where opor_no=v_opor_no and oper_way=3-v_oper_way limit 1;


        /* if (FOUND_ROWS() = 0 and (@操作方式#=1 or @操作方式#=2)) then */
        if (FOUND_ROWS() = 0 and (v_oper_way=1 or v_oper_way=2)) then

            /* set @改密标志#=1; */
            set v_change_pwd_flag=1;
        end if;
    end if;
    #[检查报错返回][@登录错误次数# >= 5][212][@登录错误次数#]
    #校验密码的错误次数使用oper_way为1的那条记录

    /* [获取表记录变量语句][公共_用户_操作员登录信息表][{登录错误次数}][@登录错误次数#][{操作员编号}=@操作员编号# and {操作方式}=1][4][@操作员编号#] */
    select login_error_count into v_login_error_count from db_pub.tb_user_opor_login_info where opor_no=v_opor_no and oper_way=1 limit 1;


    /* [检查报错返回][@登录错误次数# >= 5][212][@登录错误次数#] */
    if v_login_error_count >= 5 then
        
        SET v_error_code = "pubA.19.21.212";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("登录错误次数=",v_login_error_count),"#",v_mysql_message);
        else
            SET v_error_info = concat("登录错误次数=",v_login_error_count);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][instr(concat(";",@允许登录方式#,";"), concat(";",@操作方式#,";")) = 0][213][@允许登录方式#] */
    if instr(concat(";",v_allow_login_type,";"), concat(";",v_oper_way,";")) = 0 then
        
        SET v_error_code = "pubA.19.21.213";
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
                
                SET v_error_code = "pubA.19.21.214";
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
                
                SET v_error_code = "pubA.19.21.215";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT("MAC地址不符，登录失败","#",v_mysql_message);
                else
                    SET v_error_info = "MAC地址不符，登录失败";
                end if;
                leave label_pro;
            end if;

        end if;
    end if;
    #set @机器日期# = date_format(curdate(),'%Y%m%d');
    #set @机器时间# = date_format(curtime(),'%H%i%s');

    /* if @目标操作员密码# is null or @目标操作员密码# <> @操作员密码# then */
    if v_target_opor_pwd is null or v_target_opor_pwd <> v_opor_pwd then

        /* set @在线状态# = 《在线状态-离线》; */
        set v_online_status = 2;

        /* set @登录错误次数# = @登录错误次数#+1; */
        set v_login_error_count = v_login_error_count+1;
        #错误次数达到限制,冻结操作员 !

        /* if (@登录错误次数#=5 or @登录错误次数#>5) then */
        if (v_login_error_count=5 or v_login_error_count>5) then

            /* set @目标操作员编号#=@操作员编号#; */
            set v_target_opor_no=v_opor_no;

            /* set @操作员状态#=2; */
            set v_opor_status=2;

            /* set @菜单编号#=0; */
            set v_menu_no=0;

            /* set @操作备注#="错误密码次数达到限制冻结操作员 !"; */
            set v_oper_remark_info="错误密码次数达到限制冻结操作员 !";

            /* 调用【原子_公共_用户客户端_更新操作员状态】*/
            call db_pub.pra_userclient_UpdateOperatorStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_co_no,
                v_target_opor_no,
                v_opor_status,
                v_oper_remark_info,
                v_menu_no,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pubA.19.21.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_更新操作员状态出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        end if;

        /* set @操作方式#=1; */
        set v_oper_way=1;

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
                    
            SET v_error_code = "pubA.19.21.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","操作方式=",v_oper_way),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no,",","操作方式=",v_oper_way);
            end if;
            leave label_pro;
        end if;

        #注意 : 此处提交是为了将上述的登录错误次数更新进去,当前只将错误次数写入操作方式为1的记录
        commit;

        /* [检查报错返回][1=1][211][@操作员编号#,@登录错误次数#] */
        if 1=1 then
            
            SET v_error_code = "pubA.19.21.211";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","登录错误次数=",v_login_error_count),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no,",","登录错误次数=",v_login_error_count);
            end if;
            leave label_pro;
        end if;

    else

        /* set @在线状态# = 《在线状态-在线》; */
        set v_online_status = 1;

        /* set @登录错误次数#=0; */
        set v_login_error_count=0;

        /* [插入重复更新][公共_用户_操作员登录信息表][字段][字段变量][{在线状态} = @在线状态#, {登录次数} = {登录次数} + 1, {登录错误次数} = 0, {客户端版本} = @客户端版本#, {操作IP} = @操作IP#, {操作MAC} = @操作MAC#,{操作信息}=@操作信息#][1][@操作员编号#,@操作方式#] */
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
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, online_status = v_online_status, login_count = login_count + 1, login_error_count = 0, client_version = v_client_version, oper_ip_addr = v_oper_ip_addr, oper_mac = v_oper_mac,oper_info=v_oper_info;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.19.21.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","操作方式=",v_oper_way),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no,",","操作方式=",v_oper_way);
            end if;
            leave label_pro;
        end if;


        /* if @操作方式#<>1 then */
        if v_oper_way<>1 then

            /* set @操作方式#=1; */
            set v_oper_way=1;

            /* [插入重复更新][公共_用户_操作员登录信息表][字段][字段变量][{登录错误次数} = 0][1][@操作员编号#,@操作方式#] */
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
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, login_error_count = 0;
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.19.21.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","操作方式=",v_oper_way),"#",v_mysql_message);
                else
                    SET v_error_info = concat("操作员编号=",v_opor_no,",","操作方式=",v_oper_way);
                end if;
                leave label_pro;
            end if;

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
                
        SET v_error_code = "pubA.19.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","操作MAC=",v_oper_mac),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","操作MAC=",v_oper_mac);
        end if;
        leave label_pro;
    end if;

    #如果系统配置是不改密,那么返回给客户端或管理端的改密标志为2,即不改密

    /* if @配置值#=2 then */
    if v_config_value=2 then

        /* set @改密标志#=2; */
        set v_change_pwd_flag=2;
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
    SET p_last_oper_info = v_last_oper_info;
    SET p_co_type = v_co_type;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_change_pwd_flag = v_change_pwd_flag;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_操作员退出
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_OperatorLogout;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_OperatorLogout(
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
                
        SET v_error_code = "pubA.19.22.2";
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

# 原子_公共_用户客户端_设置操作员配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_SetOperatorParam;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_SetOperatorParam(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_config_no bigint,
    IN p_config_value varchar(2048),
    IN p_config_name varchar(64),
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
    declare v_config_no bigint;
    declare v_config_value varchar(2048);
    declare v_config_name varchar(64);
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
    SET v_config_no = p_config_no;
    SET v_config_value = p_config_value;
    SET v_config_name = p_config_name;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][公共_用户_操作员配置表][字段][字段变量][{配置值}=@配置值#,{配置名称}=@配置名称#][1][@配置编号#,@配置值#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_param (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, opor_no, 
        config_no, config_name, config_value) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_opor_no, 
        v_config_no, v_config_name, v_config_value) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, config_value=v_config_value,config_name=v_config_name;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.31.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("配置编号=",v_config_no,",","配置值=",v_config_value),"#",v_mysql_message);
        else
            SET v_error_info = concat("配置编号=",v_config_no,",","配置值=",v_config_value);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询操作员配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryOperatorParam;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryOperatorParam(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_opor_no_str varchar(2048),
    IN p_config_no bigint,
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
    declare v_opor_no_str varchar(2048);
    declare v_config_no bigint;
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
    SET v_opor_no_str = p_opor_no_str;
    SET v_config_no = p_config_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @操作员编号串# = “ ” then */
    if v_opor_no_str = " " then

       /* set @操作员编号串# = concat(";",@操作员编号#,";"); */
       set v_opor_no_str = concat(";",v_opor_no,";");
    end if;

    /* set @操作员编号串# = concat(";",@操作员编号串#,";"); */
    set v_opor_no_str = concat(";",v_opor_no_str,";");

    /* [获取表记录][公共_用户_操作员配置表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{配置编号},{配置名称},{配置值}][instr(@操作员编号串#, concat(";",{操作员编号},";"))>0 and (@配置编号# = 0 or {配置编号}=@配置编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,config_no,config_name,config_value from db_pub.tb_user_opor_param where instr(v_opor_no_str, concat(";",opor_no,";"))>0 and (v_config_no = 0 or config_no=v_config_no) and row_id > v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,config_no,config_name,config_value from db_pub.tb_user_opor_param where instr(v_opor_no_str, concat(";",opor_no,";"))>0 and (v_config_no = 0 or config_no=v_config_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_保存操作员表格显示
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_SaveOporDbGridLayout;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_SaveOporDbGridLayout(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_parent_panel varchar(64),
    IN p_dbgrid_name varchar(64),
    IN p_dbgrid_conf_str varchar(4096),
    IN p_client_type int,
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
    declare v_parent_panel varchar(64);
    declare v_dbgrid_name varchar(64);
    declare v_dbgrid_conf_str varchar(4096);
    declare v_client_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_tmp_dbgrid_conf_str varchar(4096);
    declare v_dbgrid_key varchar(64);
    declare v_dbgrid_field varchar(64);
    declare v_field_width int;
    declare v_field_order int;
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
    SET v_parent_panel = p_parent_panel;
    SET v_dbgrid_name = p_dbgrid_name;
    SET v_dbgrid_conf_str = p_dbgrid_conf_str;
    SET v_client_type = p_client_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_tmp_dbgrid_conf_str = " ";
    SET v_dbgrid_key = " ";
    SET v_dbgrid_field = " ";
    SET v_field_width = 0;
    SET v_field_order = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* [删除表记录][公共_用户_操作员表格显示保存表][{操作员编号}=@操作员编号# and {表格名称}=@表格名称# and {客户端类型}=@客户端类型# and {父窗体}=@父窗体#][3][@操作员编号#,@表格名称#,@客户端类型#,@父窗体#] */
    delete from db_pub.tb_user_opor_dbgrid_layout 
        where opor_no=v_opor_no and dbgrid_name=v_dbgrid_name and client_type=v_client_type and parent_panel=v_parent_panel;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.19.33.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","表格名称=",v_dbgrid_name,",","客户端类型=",v_client_type,",","父窗体=",v_parent_panel),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","表格名称=",v_dbgrid_name,",","客户端类型=",v_client_type,",","父窗体=",v_parent_panel);
        end if;
        leave label_pro;
    end if;

    loop_label:loop

        /* set @临时_表格配置串# = SUBSTRING_INDEX(@表格配置串#,"|",1); */
        set v_tmp_dbgrid_conf_str = SUBSTRING_INDEX(v_dbgrid_conf_str,"|",1);

        /* set @表格键值# = SUBSTRING_INDEX(@临时_表格配置串#,",",1); */
        set v_dbgrid_key = SUBSTRING_INDEX(v_tmp_dbgrid_conf_str,",",1);

        /* set @临时_表格配置串# = SUBSTRING(@临时_表格配置串#,INSTR(@临时_表格配置串#,",")+1); */
        set v_tmp_dbgrid_conf_str = SUBSTRING(v_tmp_dbgrid_conf_str,INSTR(v_tmp_dbgrid_conf_str,",")+1);

        /* set @表格字段# = SUBSTRING_INDEX(@临时_表格配置串#,",",1); */
        set v_dbgrid_field = SUBSTRING_INDEX(v_tmp_dbgrid_conf_str,",",1);

        /* set @临时_表格配置串# = SUBSTRING(@临时_表格配置串#,INSTR(@临时_表格配置串#,",")+1); */
        set v_tmp_dbgrid_conf_str = SUBSTRING(v_tmp_dbgrid_conf_str,INSTR(v_tmp_dbgrid_conf_str,",")+1);

        /* set @字段宽度# = SUBSTRING_INDEX(@临时_表格配置串#,",",1); */
        set v_field_width = SUBSTRING_INDEX(v_tmp_dbgrid_conf_str,",",1);

        /* set @字段列号# = SUBSTRING(@临时_表格配置串#,INSTR(@临时_表格配置串#,",")+1); */
        set v_field_order = SUBSTRING(v_tmp_dbgrid_conf_str,INSTR(v_tmp_dbgrid_conf_str,",")+1);

        /* [插入表记录][公共_用户_操作员表格显示保存表][字段][字段变量][1][@机构编号#,@操作员编号#,@父窗体#,@表格名称#,@表格键值#,@表格字段#,@字段宽度#,@字段列号#,@客户端类型#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_opor_dbgrid_layout(
            create_date, create_time, update_date, 
            update_time, update_times, co_no, opor_no, 
            parent_panel, dbgrid_name, dbgrid_key, dbgrid_field, 
            field_width, field_order, client_type) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_opor_no, 
            v_parent_panel, v_dbgrid_name, v_dbgrid_key, v_dbgrid_field, 
            v_field_width, v_field_order, v_client_type);
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.19.33.1";
            SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no,",","父窗体=",v_parent_panel,",","表格名称=",v_dbgrid_name,",","表格键值=",v_dbgrid_key,",","表格字段=",v_dbgrid_field,",","字段宽度=",v_field_width,",","字段列号=",v_field_order,",","客户端类型=",v_client_type),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* if INSTR(@表格配置串#,"|")=0 THEN */
        if INSTR(v_dbgrid_conf_str,"|")=0 THEN
            leave loop_label;
        else

            /* set @表格配置串# = substring(@表格配置串#,INSTR(@表格配置串#,"|")+1); */
            set v_dbgrid_conf_str = substring(v_dbgrid_conf_str,INSTR(v_dbgrid_conf_str,"|")+1);
        end if;
    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询操作员表格显示
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryOporDbGridLayout;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryOporDbGridLayout(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_client_type int,
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
    declare v_client_type int;
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
    SET v_client_type = p_client_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数#=-1; */
    set v_row_count=-1;

    /* [获取表记录][公共_用户_操作员表格显示保存表][{机构编号},{操作员编号},{父窗体},{表格名称},{表格键值},{表格字段},{字段宽度},{字段列号},{客户端类型}][{操作员编号}=@操作员编号# and {客户端类型}=@客户端类型# order by {表格名称},{字段列号}][@指定行数#] */
    if v_row_count = -1 then
        select co_no,opor_no,parent_panel,dbgrid_name,dbgrid_key,dbgrid_field,field_width,field_order,client_type from db_pub.tb_user_opor_dbgrid_layout where opor_no=v_opor_no and client_type=v_client_type order by dbgrid_name,field_order;
    else
        select co_no,opor_no,parent_panel,dbgrid_name,dbgrid_key,dbgrid_field,field_width,field_order,client_type from db_pub.tb_user_opor_dbgrid_layout where opor_no=v_opor_no and client_type=v_client_type order by dbgrid_name,field_order limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_新增操作员可操作产品
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_AddOporAllowProd;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_AddOporAllowProd(
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
    IN p_pd_no int,
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
    declare v_pd_no int;
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
    SET v_pd_no = p_pd_no;
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

    /* [插入重复更新][公共_用户_操作员可操作产品表][字段][字段变量][{机构编号}=@机构编号#][1][@目标操作员编号#,@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_allow_prod (
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        pd_no, abolish_status, oper_rights) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_co_no, 
        v_pd_no, v_abolish_status, v_oper_rights) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.45.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作员编号# = @临时_操作员编号#; */
    set v_opor_no = v_tmp_opor_no;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_用户_操作员可操作产品流水表][字段][字段变量][5][@目标操作员编号#,@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_allow_prod_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, target_opor_no, 
        co_no, pd_no, oper_rights, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_target_opor_no, 
        v_co_no, v_pd_no, v_oper_rights, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.45.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_删除操作员可操作产品
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_DeleteOporAllowProd;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_DeleteOporAllowProd(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_pd_no int,
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
    declare v_pd_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
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
    

    /* [获取表记录变量语句][公共_用户_操作员可操作产品表][{机构编号},{操作权限},{记录序号},{注销标志}][@机构编号#,@操作权限#,@表记录序号#,@注销标志#][{操作员编号} = @目标操作员编号# and {产品编号} = @产品编号#] */
    select co_no,oper_rights,row_id,abolish_status into v_co_no,v_oper_rights,v_table_row_id,v_abolish_status from db_pub.tb_user_opor_allow_prod where opor_no = v_target_opor_no and pd_no = v_pd_no limit 1;


    /* [检查正常返回][FOUND_ROWS() = 0] */
    if FOUND_ROWS() = 0 then
        leave label_pro;
    end if;

    #删除流水记录

    /* set @表字段值# =  concat("|操作员编号:",@目标操作员编号#,"|机构编号:",@机构编号#,"|产品编号:",@产品编号#,"|注销标志:",@注销标志#,"|操作权限:",@操作权限#); */
    set v_table_field_value =  concat("|操作员编号:",v_target_opor_no,"|机构编号:",v_co_no,"|产品编号:",v_pd_no,"|注销标志:",v_abolish_status,"|操作权限:",v_oper_rights);

    /* set @表唯一索引值# = concat("|操作员编号:",@目标操作员编号#,"|产品编号:",@产品编号#); */
    set v_table_uni_index_value = concat("|操作员编号:",v_target_opor_no,"|产品编号:",v_pd_no);

    /* set @数据表名称# = "tb_user_opor_allow_prod"; */
    set v_table_name = "tb_user_opor_allow_prod";

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
                
        SET v_error_code = "pubA.19.46.5";
        SET v_error_info =  CONCAT(concat("数据表名称=",v_table_name,","," 表记录序号=", v_table_row_id),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [删除表记录][公共_用户_操作员可操作产品表][{操作员编号} = @目标操作员编号# and {产品编号} = @产品编号#][3][@目标操作员编号#,@产品编号#] */
    delete from db_pub.tb_user_opor_allow_prod 
        where opor_no = v_target_opor_no and pd_no = v_pd_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.19.46.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_用户_操作员可操作产品流水表][字段][字段变量][5][@目标操作员编号#,@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_allow_prod_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, target_opor_no, 
        co_no, pd_no, oper_rights, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_target_opor_no, 
        v_co_no, v_pd_no, v_oper_rights, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.46.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询操作员可操作产品
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryOporAllowProd;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryOporAllowProd(
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
    

    /* if @查询操作员编号# =0  then */
    if v_query_opor_no =0  then

        /* [获取表记录][公共_用户_操作员可操作产品表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{操作员编号},{产品编号},{操作权限}][{机构编号}=@操作员机构编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id,create_date,create_time,update_date,update_time,opor_no,pd_no,oper_rights from db_pub.tb_user_opor_allow_prod where co_no=v_opor_co_no and row_id > v_row_id order by row_id;
        else
            select row_id,create_date,create_time,update_date,update_time,opor_no,pd_no,oper_rights from db_pub.tb_user_opor_allow_prod where co_no=v_opor_co_no and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][公共_用户_操作员可操作产品表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{操作员编号},{产品编号},{操作权限}][{操作员编号}=@查询操作员编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id,create_date,create_time,update_date,update_time,opor_no,pd_no,oper_rights from db_pub.tb_user_opor_allow_prod where opor_no=v_query_opor_no and row_id > v_row_id order by row_id;
        else
            select row_id,create_date,create_time,update_date,update_time,opor_no,pd_no,oper_rights from db_pub.tb_user_opor_allow_prod where opor_no=v_query_opor_no and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_更新操作员可操作产品注销标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_UpdateOporAllowProdAbolishStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_UpdateOporAllowProdAbolishStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_用户_操作员可操作产品表][{注销标志}=1][{机构编号}=@机构编号# and {产品编号}=@产品编号#][2][@机构编号#,@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_allow_prod set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, abolish_status=1 where co_no=v_co_no and pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.49.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_新增交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_AddExchGroupInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_AddExchGroupInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_group_no int,
    IN p_co_no int,
    IN p_exch_group_code varchar(32),
    IN p_exch_group_name varchar(64),
    IN p_default_group_flag int,
    IN p_pd_no int,
    IN p_first_asset decimal(18,4),
    IN p_exch_group_dist_pd_amt decimal(18,4),
    IN p_exch_group_pd_share decimal(18,2),
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_busi_config_str varchar(64),
    IN p_market_price_ratio decimal(18,12),
    IN p_forbid_order_dir varchar(64),
    IN p_weight_value decimal(18,4),
    IN p_trade_acco varchar(32),
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    IN p_futu_default_group_flag int,
    IN p_fina_loan_default_group_flag int,
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
    declare v_exch_group_no int;
    declare v_co_no int;
    declare v_exch_group_code varchar(32);
    declare v_exch_group_name varchar(64);
    declare v_default_group_flag int;
    declare v_pd_no int;
    declare v_first_asset decimal(18,4);
    declare v_exch_group_dist_pd_amt decimal(18,4);
    declare v_exch_group_pd_share decimal(18,2);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_config_str varchar(64);
    declare v_market_price_ratio decimal(18,12);
    declare v_forbid_order_dir varchar(64);
    declare v_weight_value decimal(18,4);
    declare v_trade_acco varchar(32);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_futu_default_group_flag int;
    declare v_fina_loan_default_group_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_tmp_opor_no int;
    declare v_abolish_date int;
    declare v_pre_exch_group_pd_share decimal(18,2);
    declare v_pre_nav decimal(18,4);
    declare v_begin_NAV decimal(18,4);
    declare v_exch_group_status varchar(2);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_code = p_exch_group_code;
    SET v_exch_group_name = p_exch_group_name;
    SET v_default_group_flag = p_default_group_flag;
    SET v_pd_no = p_pd_no;
    SET v_first_asset = p_first_asset;
    SET v_exch_group_dist_pd_amt = p_exch_group_dist_pd_amt;
    SET v_exch_group_pd_share = p_exch_group_pd_share;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_busi_config_str = p_busi_config_str;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_forbid_order_dir = p_forbid_order_dir;
    SET v_weight_value = p_weight_value;
    SET v_trade_acco = p_trade_acco;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_futu_default_group_flag = p_futu_default_group_flag;
    SET v_fina_loan_default_group_flag = p_fina_loan_default_group_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_tmp_opor_no = 0;
    SET v_abolish_date = 0;
    SET v_pre_exch_group_pd_share = 0;
    SET v_pre_nav = 0;
    SET v_begin_NAV = 0;
    SET v_exch_group_status = "0";
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
    set v_jour_occur_field = concat("初始化日期", "|", "交易组编号", "|", "机构编号", "|", "交易组编码", "|", "交易组名称", "|", "默认组标志", "|", "产品编号", "|", "原始资产", "|", "分配产品资金", "|", "交易组产品份额", "|", "允许投资市场", "|", "允许操作证券类型", "|", "业务控制配置串", "|", "市价冻结浮动比例", "|", "禁止订单方向", "|", "权重值", "|", "交易账户", "|", "备注信息", "|", "菜单编号", "|", "期货默认组标志", "|", "融资融券默认组标志", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_exch_group_no, "|", v_co_no, "|", v_exch_group_code, "|", v_exch_group_name, "|", v_default_group_flag, "|", v_pd_no, "|", v_first_asset, "|", v_exch_group_dist_pd_amt, "|", v_exch_group_pd_share, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_busi_config_str, "|", v_market_price_ratio, "|", v_forbid_order_dir, "|", v_weight_value, "|", v_trade_acco, "|", v_remark_info, "|", v_menu_no, "|", v_futu_default_group_flag, "|", v_fina_loan_default_group_flag, "|");


    /* set @临时_操作员编号# = @操作员编号#; */
    set v_tmp_opor_no = v_opor_no;

    /* set @注销日期# = 0; */
    set v_abolish_date = 0;

    /* set @昨日交易组产品份额# = 0; */
    set v_pre_exch_group_pd_share = 0;

    /* set @昨日净值# = 0; */
    set v_pre_nav = 0;

    /* set @期初净资产# = 0; */
    set v_begin_NAV = 0;

    /* set @交易组状态# = 《交易组状态-正常》; */
    set v_exch_group_status = "1";

    /* [插入表记录][公共_用户_交易组信息表][字段][字段变量][1][@机构编号#,@交易组编码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_exch_group_info(
        create_date, create_time, update_date, 
        update_time, update_times, exch_group_no, co_no, 
        exch_group_code, exch_group_name, exch_group_status, default_group_flag, 
        pd_no, first_asset, exch_group_dist_pd_amt, exch_group_pd_share, 
        pre_exch_group_pd_share, pre_nav, begin_NAV, allow_exch, 
        allow_stock_type, busi_config_str, market_price_ratio, forbid_order_dir, 
        weight_value, trade_acco, remark_info, abolish_date, 
        futu_default_group_flag, fina_loan_default_group_flag) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_group_no, v_co_no, 
        v_exch_group_code, v_exch_group_name, v_exch_group_status, v_default_group_flag, 
        v_pd_no, v_first_asset, v_exch_group_dist_pd_amt, v_exch_group_pd_share, 
        v_pre_exch_group_pd_share, v_pre_nav, v_begin_NAV, v_allow_exch, 
        v_allow_stock_type, v_busi_config_str, v_market_price_ratio, v_forbid_order_dir, 
        v_weight_value, v_trade_acco, v_remark_info, v_abolish_date, 
        v_futu_default_group_flag, v_fina_loan_default_group_flag);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.51.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","交易组编码=",v_exch_group_code),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_exch_group_no, "|", v_co_no, "|", v_exch_group_code, "|", v_exch_group_name, "|", v_default_group_flag, "|", v_pd_no, "|", v_first_asset, "|", v_exch_group_dist_pd_amt, "|", v_exch_group_pd_share, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_busi_config_str, "|", v_market_price_ratio, "|", v_forbid_order_dir, "|", v_weight_value, "|", v_trade_acco, "|", v_remark_info, "|", v_menu_no, "|", v_futu_default_group_flag, "|", v_fina_loan_default_group_flag, "|");


    /* set @操作员编号# = @临时_操作员编号#; */
    set v_opor_no = v_tmp_opor_no;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增交易组信息"; */
    set v_oper_remark_info = "新增交易组信息";

    /* [插入表记录][公共_用户_交易组信息流水表][字段][字段变量][5][@机构编号#,@交易组编号#] */
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
                
        SET v_error_code = "pubA.19.51.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #对份额的流水单独记录,20180625

    /* set @操作备注# = "份额变动"; */
    set v_oper_remark_info = "份额变动";

    /* set @流水变动字段#=@交易组产品份额#; */
    set v_jour_occur_field=v_exch_group_pd_share;

    /* set @流水后信息#=@交易组产品份额#; */
    set v_jour_after_occur_info=v_exch_group_pd_share;

    /* [插入表记录][公共_用户_交易组信息流水表][字段][字段变量][5][@机构编号#,@交易组编号#] */
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
                
        SET v_error_code = "pubA.19.51.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_修改交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_ModiExchGroupInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_ModiExchGroupInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_group_no int,
    IN p_co_no int,
    IN p_exch_group_code varchar(32),
    IN p_exch_group_name varchar(64),
    IN p_first_asset decimal(18,4),
    IN p_exch_group_dist_pd_amt decimal(18,4),
    IN p_exch_group_pd_share decimal(18,2),
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_busi_config_str varchar(64),
    IN p_market_price_ratio decimal(18,12),
    IN p_forbid_order_dir varchar(64),
    IN p_weight_value decimal(18,4),
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    IN p_futu_default_group_flag int,
    IN p_fina_loan_default_group_flag int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int,
    OUT p_exch_group_status varchar(2),
    OUT p_default_group_flag int,
    OUT p_exch_group_begin_NAV decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_co_no int;
    declare v_exch_group_code varchar(32);
    declare v_exch_group_name varchar(64);
    declare v_first_asset decimal(18,4);
    declare v_exch_group_dist_pd_amt decimal(18,4);
    declare v_exch_group_pd_share decimal(18,2);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_config_str varchar(64);
    declare v_market_price_ratio decimal(18,12);
    declare v_forbid_order_dir varchar(64);
    declare v_weight_value decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_futu_default_group_flag int;
    declare v_fina_loan_default_group_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_exch_group_status varchar(2);
    declare v_default_group_flag int;
    declare v_exch_group_begin_NAV decimal(18,4);
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_row_id bigint;
    declare v_tmp_exch_group_pd_share decimal(18,2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_exch_group_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_code = p_exch_group_code;
    SET v_exch_group_name = p_exch_group_name;
    SET v_first_asset = p_first_asset;
    SET v_exch_group_dist_pd_amt = p_exch_group_dist_pd_amt;
    SET v_exch_group_pd_share = p_exch_group_pd_share;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_busi_config_str = p_busi_config_str;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_forbid_order_dir = p_forbid_order_dir;
    SET v_weight_value = p_weight_value;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_futu_default_group_flag = p_futu_default_group_flag;
    SET v_fina_loan_default_group_flag = p_fina_loan_default_group_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_exch_group_status = "0";
    SET v_default_group_flag = 0;
    SET v_exch_group_begin_NAV = 0;
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_row_id = 0;
    SET v_tmp_exch_group_pd_share = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_exch_group_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "交易组编号", "|", "机构编号", "|", "交易组编码", "|", "交易组名称", "|", "原始资产", "|", "分配产品资金", "|", "交易组产品份额", "|", "允许投资市场", "|", "允许操作证券类型", "|", "业务控制配置串", "|", "市价冻结浮动比例", "|", "禁止订单方向", "|", "权重值", "|", "备注信息", "|", "菜单编号", "|", "期货默认组标志", "|", "融资融券默认组标志", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_exch_group_no, "|", v_co_no, "|", v_exch_group_code, "|", v_exch_group_name, "|", v_first_asset, "|", v_exch_group_dist_pd_amt, "|", v_exch_group_pd_share, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_busi_config_str, "|", v_market_price_ratio, "|", v_forbid_order_dir, "|", v_weight_value, "|", v_remark_info, "|", v_menu_no, "|", v_futu_default_group_flag, "|", v_fina_loan_default_group_flag, "|");


    /* [获取表记录变量][公共_用户_交易组信息表][{记录序号},{交易组产品份额}][@记录序号#,@临时_交易组产品份额#][{交易组编号}=@交易组编号#  and {机构编号}=@机构编号#][4][@机构编号#,@交易组编号#] */
    select row_id,exch_group_pd_share into v_row_id,v_tmp_exch_group_pd_share from db_pub.tb_user_exch_group_info where exch_group_no=v_exch_group_no  and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.52.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_用户_交易组信息表][{交易组名称}=@交易组名称#,{原始资产}=@原始资产#,{分配产品资金}=@分配产品资金#,{交易组产品份额}=@交易组产品份额#,{允许投资市场}=@允许投资市场#,{允许操作证券类型}=@允许操作证券类型#,{业务控制配置串}=@业务控制配置串#, {市价冻结浮动比例}=@市价冻结浮动比例#,{禁止订单方向}=@禁止订单方向#,{权重值}=@权重值#, {备注信息}=@备注信息#,{期货默认组标志} = @期货默认组标志#,{融资融券默认组标志} = @融资融券默认组标志#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_exch_group_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, exch_group_name=v_exch_group_name,first_asset=v_first_asset,exch_group_dist_pd_amt=v_exch_group_dist_pd_amt,exch_group_pd_share=v_exch_group_pd_share,allow_exch=v_allow_exch,allow_stock_type=v_allow_stock_type,busi_config_str=v_busi_config_str, market_price_ratio=v_market_price_ratio,forbid_order_dir=v_forbid_order_dir,weight_value=v_weight_value, remark_info=v_remark_info,futu_default_group_flag = v_futu_default_group_flag,fina_loan_default_group_flag = v_fina_loan_default_group_flag where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.52.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_用户_交易组信息表][{产品编号},{交易组状态},{默认组标志},{期初净资产},{更新次数},{期货默认组标志},{融资融券默认组标志}][@产品编号#,@交易组状态#,@默认组标志#,@交易组期初净资产#,@交易组更新次数#,@期货默认组标志#,@融资融券默认组标志#][{记录序号}=@记录序号#][4][@记录序号#] */
    select pd_no,exch_group_status,default_group_flag,begin_NAV,update_times,futu_default_group_flag,fina_loan_default_group_flag into v_pd_no,v_exch_group_status,v_default_group_flag,v_exch_group_begin_NAV,v_exch_group_update_times,v_futu_default_group_flag,v_fina_loan_default_group_flag from db_pub.tb_user_exch_group_info where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.52.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_exch_group_no, "|", v_co_no, "|", v_exch_group_code, "|", v_exch_group_name, "|", v_first_asset, "|", v_exch_group_dist_pd_amt, "|", v_exch_group_pd_share, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_busi_config_str, "|", v_market_price_ratio, "|", v_forbid_order_dir, "|", v_weight_value, "|", v_remark_info, "|", v_menu_no, "|", v_futu_default_group_flag, "|", v_fina_loan_default_group_flag, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改交易组信息"; */
    set v_oper_remark_info = "修改交易组信息";

    /* [插入表记录][公共_用户_交易组信息流水表][字段][字段变量][5][@机构编号#,@交易组编号#] */
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
                
        SET v_error_code = "pubA.19.52.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #单独记录份额的变动流水,20180625

    /* if @交易组产品份额#<>@临时_交易组产品份额# then */
    if v_exch_group_pd_share<>v_tmp_exch_group_pd_share then

        /* set @流水变动字段#=@交易组产品份额#-@临时_交易组产品份额#; */
        set v_jour_occur_field=v_exch_group_pd_share-v_tmp_exch_group_pd_share;

        /* set @流水后信息#=@交易组产品份额#; */
        set v_jour_after_occur_info=v_exch_group_pd_share;

        /* set @操作备注#="份额变动"; */
        set v_oper_remark_info="份额变动";

        /* [插入表记录][公共_用户_交易组信息流水表][字段][字段变量][5][@机构编号#,@交易组编号#] */
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
                    
            SET v_error_code = "pubA.19.52.5";
            SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;

    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_status = v_exch_group_status;
    SET p_default_group_flag = v_default_group_flag;
    SET p_exch_group_begin_NAV = v_exch_group_begin_NAV;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryExchGroupInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryExchGroupInfo(
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
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @操作员机构编号# = 9999 then */
    if v_opor_co_no = 9999 then

        /* [获取表记录][公共_用户_交易组信息表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{交易组编号},{机构编号},{交易组编码},{交易组名称},{交易组状态},{默认组标志},{产品编号},{原始资产},{昨日净值},{分配产品资金},{交易组产品份额},{允许投资市场},{允许操作证券类型},{业务控制配置串},{市价冻结浮动比例},{禁止订单方向},{交易账户},{权重值},{备注信息},{期货默认组标志},{融资融券默认组标志}][{机构编号}=@机构编号# and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@默认组标志# = 0 or {默认组标志}=@默认组标志#) and (@产品编号# = 0 or {产品编号}=@产品编号#)  and (@交易组状态串# = "; ;" or instr(@交易组状态串#, concat(";", {交易组状态}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id,create_date,create_time,update_date,update_time,exch_group_no,co_no,exch_group_code,exch_group_name,exch_group_status,default_group_flag,pd_no,first_asset,pre_nav,exch_group_dist_pd_amt,exch_group_pd_share,allow_exch,allow_stock_type,busi_config_str,market_price_ratio,forbid_order_dir,trade_acco,weight_value,remark_info,futu_default_group_flag,fina_loan_default_group_flag from db_pub.tb_user_exch_group_info where co_no=v_co_no and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_default_group_flag = 0 or default_group_flag=v_default_group_flag) and (v_pd_no = 0 or pd_no=v_pd_no)  and (v_exch_group_status_str = "; ;" or instr(v_exch_group_status_str, concat(";", exch_group_status, ";")) > 0) and row_id > v_row_id order by row_id;
        else
            select row_id,create_date,create_time,update_date,update_time,exch_group_no,co_no,exch_group_code,exch_group_name,exch_group_status,default_group_flag,pd_no,first_asset,pre_nav,exch_group_dist_pd_amt,exch_group_pd_share,allow_exch,allow_stock_type,busi_config_str,market_price_ratio,forbid_order_dir,trade_acco,weight_value,remark_info,futu_default_group_flag,fina_loan_default_group_flag from db_pub.tb_user_exch_group_info where co_no=v_co_no and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_default_group_flag = 0 or default_group_flag=v_default_group_flag) and (v_pd_no = 0 or pd_no=v_pd_no)  and (v_exch_group_status_str = "; ;" or instr(v_exch_group_status_str, concat(";", exch_group_status, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][公共_用户_交易组信息表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{交易组编号},{机构编号},{交易组编码},{交易组名称},{交易组状态},{默认组标志},{产品编号},{原始资产},{昨日净值},{分配产品资金},{交易组产品份额},{允许投资市场},{允许操作证券类型},{业务控制配置串},{市价冻结浮动比例},{禁止订单方向},{交易账户},{权重值},{备注信息},{期货默认组标志},{融资融券默认组标志}][{机构编号}=@机构编号# and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@默认组标志# = 0 or {默认组标志}=@默认组标志#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@交易组状态串# = "; ;" or instr(@交易组状态串#, concat(";", {交易组状态}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id,create_date,create_time,update_date,update_time,exch_group_no,co_no,exch_group_code,exch_group_name,exch_group_status,default_group_flag,pd_no,first_asset,pre_nav,exch_group_dist_pd_amt,exch_group_pd_share,allow_exch,allow_stock_type,busi_config_str,market_price_ratio,forbid_order_dir,trade_acco,weight_value,remark_info,futu_default_group_flag,fina_loan_default_group_flag from db_pub.tb_user_exch_group_info where co_no=v_co_no and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_default_group_flag = 0 or default_group_flag=v_default_group_flag) and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_exch_group_status_str = "; ;" or instr(v_exch_group_status_str, concat(";", exch_group_status, ";")) > 0) and row_id > v_row_id order by row_id;
        else
            select row_id,create_date,create_time,update_date,update_time,exch_group_no,co_no,exch_group_code,exch_group_name,exch_group_status,default_group_flag,pd_no,first_asset,pre_nav,exch_group_dist_pd_amt,exch_group_pd_share,allow_exch,allow_stock_type,busi_config_str,market_price_ratio,forbid_order_dir,trade_acco,weight_value,remark_info,futu_default_group_flag,fina_loan_default_group_flag from db_pub.tb_user_exch_group_info where co_no=v_co_no and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_default_group_flag = 0 or default_group_flag=v_default_group_flag) and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_exch_group_status_str = "; ;" or instr(v_exch_group_status_str, concat(";", exch_group_status, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_检查交易组状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_CheckExchGroupStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_CheckExchGroupStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_exch_group_status varchar(2),
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
    declare v_exch_group_no int;
    declare v_exch_group_status varchar(2);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_exch_group_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_exch_group_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_交易组信息表][{交易组状态}][@临时_交易组状态#][{交易组编号}=@交易组编号#][74][@交易组编号#] */
    select exch_group_status into v_tmp_exch_group_status from db_pub.tb_user_exch_group_info where exch_group_no=v_exch_group_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.55.74";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    #交易组状态检查

    /* [检查报错返回][@交易组状态# = 0 and @临时_交易组状态# = 《交易组状态-冻结》][71][@交易组编号#] */
    if v_exch_group_status = 0 and v_tmp_exch_group_status = "2" then
        
        SET v_error_code = "pubA.19.55.71";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@交易组状态# = 0 and @临时_交易组状态# = 《交易组状态-注销》][72][@交易组编号#] */
    if v_exch_group_status = 0 and v_tmp_exch_group_status = "3" then
        
        SET v_error_code = "pubA.19.55.72";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    #冻结交易组检查

    /* [检查报错返回][@交易组状态# = 《交易组状态-冻结》 and @临时_交易组状态# = 《交易组状态-冻结》][71][@交易组编号#] */
    if v_exch_group_status = "2" and v_tmp_exch_group_status = "2" then
        
        SET v_error_code = "pubA.19.55.71";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@交易组状态# = 《交易组状态-冻结》 and @临时_交易组状态# = 《交易组状态-注销》][72][@交易组编号#] */
    if v_exch_group_status = "2" and v_tmp_exch_group_status = "3" then
        
        SET v_error_code = "pubA.19.55.72";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    #恢复交易组检查

    /* [检查报错返回][@交易组状态# = 《交易组状态-正常》 and @临时_交易组状态# = 《交易组状态-正常》][73][@交易组编号#] */
    if v_exch_group_status = "1" and v_tmp_exch_group_status = "1" then
        
        SET v_error_code = "pubA.19.55.73";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@交易组状态# = 《交易组状态-正常》 and @临时_交易组状态# = 《交易组状态-注销》][72][@交易组编号#] */
    if v_exch_group_status = "1" and v_tmp_exch_group_status = "3" then
        
        SET v_error_code = "pubA.19.55.72";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    #注销交易组检查

    /* [检查报错返回][@交易组状态# = 《交易组状态-注销》 and @临时_交易组状态# = 《交易组状态-冻结》][71][@交易组编号#] */
    if v_exch_group_status = "3" and v_tmp_exch_group_status = "2" then
        
        SET v_error_code = "pubA.19.55.71";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@交易组状态# = 《交易组状态-注销》 and @临时_交易组状态# = 《交易组状态-注销》][72][@交易组编号#] */
    if v_exch_group_status = "3" and v_tmp_exch_group_status = "3" then
        
        SET v_error_code = "pubA.19.55.72";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_更新交易组状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_UpdateExceGroupStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_UpdateExceGroupStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_group_no int,
    IN p_exch_group_status varchar(2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_code varchar(32),
    OUT p_exch_group_name varchar(64),
    OUT p_default_group_flag int,
    OUT p_exch_group_begin_NAV decimal(18,4),
    OUT p_exch_group_pd_share decimal(18,2),
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
    declare v_exch_group_no int;
    declare v_exch_group_status varchar(2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_code varchar(32);
    declare v_exch_group_name varchar(64);
    declare v_default_group_flag int;
    declare v_exch_group_begin_NAV decimal(18,4);
    declare v_exch_group_pd_share decimal(18,2);
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_exch_group_update_times int;
    declare v_abolish_date int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_group_status = p_exch_group_status;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_code = " ";
    SET v_exch_group_name = " ";
    SET v_default_group_flag = 0;
    SET v_exch_group_begin_NAV = 0;
    SET v_exch_group_pd_share = 0;
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_exch_group_update_times = 0;
    SET v_abolish_date = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][{交易组状态}][@交易组状态#] */
    set v_jour_occur_field = concat("交易组状态","|");
    set v_jour_occur_info = concat(v_exch_group_status,"|");


    /* [获取表记录变量][公共_用户_交易组信息表][{机构编号}, {产品编号}, {交易组编码},{交易组名称},{默认组标志},{期初净资产},{交易组产品份额},{更新次数}+1][@机构编号#, @产品编号#, @交易组编码#,@交易组名称#,@默认组标志#,@交易组期初净资产#,@交易组产品份额#,@交易组更新次数#][{交易组编号}=@交易组编号# and {机构编号}=@操作员机构编号#][4][@操作员机构编号#,@交易组编号#] */
    select co_no, pd_no, exch_group_code,exch_group_name,default_group_flag,begin_NAV,exch_group_pd_share,update_times+1 into v_co_no, v_pd_no, v_exch_group_code,v_exch_group_name,v_default_group_flag,v_exch_group_begin_NAV,v_exch_group_pd_share,v_exch_group_update_times from db_pub.tb_user_exch_group_info where exch_group_no=v_exch_group_no and co_no=v_opor_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.56.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员机构编号=",v_opor_co_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员机构编号=",v_opor_co_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@交易组状态#=《交易组状态-注销》 and @默认组标志# = 《默认组标志-是》][81][@交易组编号#] */
    if v_exch_group_status="3" and v_default_group_flag = 1 then
        
        SET v_error_code = "pubA.19.56.81";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* if @交易组状态# <> 《交易组状态-注销》 then */
    if v_exch_group_status <> "3" then

        /* set @注销日期# = 0; */
        set v_abolish_date = 0;
    else

        /* set @注销日期# = @初始化日期#; */
        set v_abolish_date = v_init_date;
    end if;

    /* [更新表记录][公共_用户_交易组信息表][{交易组状态}=@交易组状态#,{注销日期}=@注销日期#][{交易组编号}=@交易组编号# and {机构编号}=@操作员机构编号#][2][@操作员机构编号#,@交易组编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_exch_group_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, exch_group_status=v_exch_group_status,abolish_date=v_abolish_date where exch_group_no=v_exch_group_no and co_no=v_opor_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.56.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员机构编号=",v_opor_co_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员机构编号=",v_opor_co_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


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
                
        SET v_error_code = "pubA.19.56.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_code = v_exch_group_code;
    SET p_exch_group_name = v_exch_group_name;
    SET p_default_group_flag = v_default_group_flag;
    SET p_exch_group_begin_NAV = v_exch_group_begin_NAV;
    SET p_exch_group_pd_share = v_exch_group_pd_share;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_注销产品更新交易组状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_CloseProductUpdateExgpStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_CloseProductUpdateExgpStatus(
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_用户_交易组信息表][{交易组状态}=《交易组状态-注销》,{注销日期}=@初始化日期#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][2][@机构编号#,@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_exch_group_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, exch_group_status="3",abolish_date=v_init_date where co_no=v_co_no and pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.57.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_用户_操作员所属交易组表][{注销标志}=1][{机构编号}=@机构编号# and {产品编号}=@产品编号#][2][@机构编号#,@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_exch_group set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, abolish_status=1 where co_no=v_co_no and pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.57.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_产品状态变化更新交易组状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_ProdStatusChangeUpdateExgpStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_ProdStatusChangeUpdateExgpStatus(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_status varchar(2);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_status = p_exch_group_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #更新的交易组状态为: 冻结状态 或者是 正常状态

    /* [更新表记录][公共_用户_交易组信息表][{交易组状态}=@交易组状态#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组状态}<>《交易组状态-注销》][2][@机构编号#,@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_exch_group_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, exch_group_status=v_exch_group_status where co_no=v_co_no and pd_no=v_pd_no and exch_group_status<>"3";
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.95.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询交易组信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryExchGroupInfoJour;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryExchGroupInfoJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_pd_no int,
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
    declare v_pd_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_用户_交易组信息流水表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{操作菜单},{操作功能},{初始化日期},{机构编号},{交易组编号},{流水变动字段},{流水后信息},{操作备注}][{机构编号}=@机构编号# and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_menu_no,oper_func_code,init_date,co_no,exch_group_no,jour_occur_field,jour_after_occur_info,oper_remark_info from db_pub.tb_user_exch_group_info_jour where co_no=v_co_no and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_pd_no = 0 or pd_no=v_pd_no) and row_id > v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_menu_no,oper_func_code,init_date,co_no,exch_group_no,jour_occur_field,jour_after_occur_info,oper_remark_info from db_pub.tb_user_exch_group_info_jour where co_no=v_co_no and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_pd_no = 0 or pd_no=v_pd_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询历史交易组信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryExchGroupInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryExchGroupInfoJour_His(
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
    IN p_exch_group_no int,
    IN p_pd_no int,
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
    declare v_exch_group_no int;
    declare v_pd_no int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_公共_用户_交易组信息流水表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{操作菜单},{操作功能},{初始化日期},{机构编号},{交易组编号},{流水变动字段},{流水后信息},{操作备注}][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_menu_no,oper_func_code,init_date,co_no,exch_group_no,jour_occur_field,jour_after_occur_info,oper_remark_info from db_pub_his.tb_user_exch_group_info_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_pd_no = 0 or pd_no=v_pd_no) and row_id > v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_menu_no,oper_func_code,init_date,co_no,exch_group_no,jour_occur_field,jour_after_occur_info,oper_remark_info from db_pub_his.tb_user_exch_group_info_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_pd_no = 0 or pd_no=v_pd_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_设置默认交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_SetDefaultExchGroup;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_SetDefaultExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_group_no int,
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
    declare v_exch_group_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "交易组编号", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_exch_group_no, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [获取表记录变量][公共_用户_交易组信息表][{机构编号},{产品编号}][@机构编号#,@产品编号#][{交易组编号} = @交易组编号#][4][@交易组编号#] */
    select co_no,pd_no into v_co_no,v_pd_no from db_pub.tb_user_exch_group_info where exch_group_no = v_exch_group_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.60.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_用户_交易组信息表][{默认组标志} = 《默认组标志-是》][{交易组编号} = @交易组编号#][2][@交易组编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_exch_group_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, default_group_flag = 1 where exch_group_no = v_exch_group_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.60.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_用户_交易组信息表][{默认组标志} = 《默认组标志-否》][{交易组编号} <> @交易组编号# and {产品编号} = @产品编号#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_exch_group_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, default_group_flag = 2 where exch_group_no <> v_exch_group_no and pd_no = v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.60.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_exch_group_no, "|", v_oper_remark_info, "|", v_menu_no, "|");


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
                
        SET v_error_code = "pubA.19.60.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询可见交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryRightsExchGroup;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryRightsExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][公共_用户_交易组信息表][{机构编号},{产品编号},{交易组编号},{交易组编码},{交易组名称},{交易组状态},{默认组标志}][{机构编号}=@操作员机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";")) and {交易组状态}=《交易组状态-正常》] */
    select co_no,pd_no,exch_group_no,exch_group_code,exch_group_name,exch_group_status,default_group_flag from db_pub.tb_user_exch_group_info where co_no=v_opor_co_no and (v_pd_no=0 or pd_no=v_pd_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";")) and exch_group_status="1";

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_新增操作员所属交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_AddOporAllowExchGroup;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_AddOporAllowExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_target_opor_no int,
    IN p_exch_group_no int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int,
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
    declare v_co_no int;
    declare v_target_opor_no int;
    declare v_exch_group_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_row_id bigint;
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
    SET v_co_no = p_co_no;
    SET v_target_opor_no = p_target_opor_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_row_id = 0;
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

    /* [获取表记录变量][公共_用户_交易组信息表][{产品编号}][@产品编号#][{交易组编号}=@交易组编号# and {机构编号}=@机构编号#][4][@机构编号#,@交易组编号#] */
    select pd_no into v_pd_no from db_pub.tb_user_exch_group_info where exch_group_no=v_exch_group_no and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.61.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* set @注销标志# = 0; */
    set v_abolish_status = 0;

    /* set @临时_操作员编号# = @操作员编号#; */
    set v_tmp_opor_no = v_opor_no;

    /* set @操作员编号# = @目标操作员编号#; */
    set v_opor_no = v_target_opor_no;

    /* [插入重复更新][公共_用户_操作员所属交易组表][字段][字段变量][{机构编号}=@机构编号#,{产品编号}=@产品编号#][1][@目标操作员编号#,@交易组编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_exch_group (
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        pd_no, exch_group_no, abolish_status, oper_rights) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_co_no, 
        v_pd_no, v_exch_group_no, v_abolish_status, v_oper_rights) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no,pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.61.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [获取记录序号][@记录序号#] */
    select LAST_INSERT_ID() into v_row_id;

    #[记录不存在插入表记录][公共_用户_操作员可操作产品表][字段][字段变量][{操作员编号}=@操作员编号# and {产品编号}=@产品编号#][1][@目标操作员编号#,@产品编号#]

    /* [插入重复更新][公共_用户_操作员可操作产品表][字段][字段变量][{更新日期}=@初始化日期#][1][@目标操作员编号#,@交易组编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_allow_prod (
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        pd_no, abolish_status, oper_rights) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_co_no, 
        v_pd_no, v_abolish_status, v_oper_rights) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, update_date=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.61.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作员编号# = @临时_操作员编号#; */
    set v_opor_no = v_tmp_opor_no;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_用户_操作员所属交易组流水表][字段][字段变量][5][@目标操作员编号#,@交易组编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_exch_group_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, target_opor_no, 
        co_no, pd_no, exch_group_no, oper_rights, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_target_opor_no, 
        v_co_no, v_pd_no, v_exch_group_no, v_oper_rights, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.61.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_删除操作员所属交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_DeleteOporAllowExchGroup;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_DeleteOporAllowExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_target_opor_no int,
    IN p_exch_group_no int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_pd_no int,
    OUT p_oper_rights int,
    OUT p_abolish_status varchar(2),
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
    declare v_target_opor_no int;
    declare v_exch_group_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_pd_no int;
    declare v_oper_rights int;
    declare v_abolish_status varchar(2);
    declare v_update_times int;
    declare v_tmp_pd_no int;
    declare v_table_row_id bigint;
    declare v_table_field_value varchar(10000);
    declare v_table_uni_index_value varchar(10000);
    declare v_table_name varchar(64);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_record_count int;
    declare v_tmp_oper_rights int;
    declare v_tmp_abolish_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_pd_no = 0;
    SET v_oper_rights = 0;
    SET v_abolish_status = "0";
    SET v_update_times = 1;
    SET v_tmp_pd_no = 0;
    SET v_table_row_id = 0;
    SET v_table_field_value = " ";
    SET v_table_uni_index_value = " ";
    SET v_table_name = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_record_count = 0;
    SET v_tmp_oper_rights = 0;
    SET v_tmp_abolish_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_用户_操作员所属交易组表][{记录序号},{操作权限},{注销标志},{更新次数},{产品编号}][@记录序号#,@操作权限#,@注销标志#,@更新次数#,@临时_产品编号#][{操作员编号} = @目标操作员编号# and {交易组编号} = @交易组编号#] */
    select row_id,oper_rights,abolish_status,update_times,pd_no into v_row_id,v_oper_rights,v_abolish_status,v_update_times,v_tmp_pd_no from db_pub.tb_user_opor_exch_group where opor_no = v_target_opor_no and exch_group_no = v_exch_group_no limit 1;


    /* [检查正常返回][FOUND_ROWS() = 0] */
    if FOUND_ROWS() = 0 then
        leave label_pro;
    end if;

    #删除流水记录

    /* set @表记录序号# = @记录序号#; */
    set v_table_row_id = v_row_id;

    /* set @表字段值# =  concat("|操作员编号:",@目标操作员编号#,"|机构编号:",@机构编号#,"|产品编号:",@临时_产品编号#,"|交易组编号:",@交易组编号#,"|注销标志:",@注销标志#,"|操作权限:",@操作权限#); */
    set v_table_field_value =  concat("|操作员编号:",v_target_opor_no,"|机构编号:",v_co_no,"|产品编号:",v_tmp_pd_no,"|交易组编号:",v_exch_group_no,"|注销标志:",v_abolish_status,"|操作权限:",v_oper_rights);

    /* set @表唯一索引值# = concat("|操作员编号:",@目标操作员编号#,"|交易组编号:",@交易组编号#); */
    set v_table_uni_index_value = concat("|操作员编号:",v_target_opor_no,"|交易组编号:",v_exch_group_no);

    /* set @数据表名称# = "tb_user_opor_exch_group"; */
    set v_table_name = "tb_user_opor_exch_group";

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
                
        SET v_error_code = "pubA.19.62.5";
        SET v_error_info =  CONCAT(concat("数据表名称=",v_table_name,","," 表记录序号=", v_table_row_id),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [删除表记录][公共_用户_操作员所属交易组表][{操作员编号} = @目标操作员编号# and {交易组编号} = @交易组编号#][3][@目标操作员编号#,@交易组编号#] */
    delete from db_pub.tb_user_opor_exch_group 
        where opor_no = v_target_opor_no and exch_group_no = v_exch_group_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.19.62.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_用户_交易组信息表][{产品编号}][@产品编号#][{交易组编号}=@交易组编号# and {机构编号}=@机构编号#][4][@机构编号#,@交易组编号#] */
    select pd_no into v_pd_no from db_pub.tb_user_exch_group_info where exch_group_no=v_exch_group_no and co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.62.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录数量][公共_用户_操作员所属交易组表][@记录个数#][{操作员编号}=@目标操作员编号# and {产品编号}=@产品编号#] */
    select count(1) into v_record_count from db_pub.tb_user_opor_exch_group where opor_no=v_target_opor_no and pd_no=v_pd_no;


    /* if @记录个数#=0 then */
    if v_record_count=0 then

        /* [获取表记录变量语句][公共_用户_操作员可操作产品表][{操作权限},{记录序号},{注销标志}][@临时_操作权限#,@表记录序号#,@临时_注销标志#][{操作员编号} = @目标操作员编号# and {产品编号} = @产品编号#] */
        select oper_rights,row_id,abolish_status into v_tmp_oper_rights,v_table_row_id,v_tmp_abolish_status from db_pub.tb_user_opor_allow_prod where opor_no = v_target_opor_no and pd_no = v_pd_no limit 1;

        #删除流水记录

        /* set @表字段值# =  concat("|操作员编号:",@目标操作员编号#,"|机构编号:",@机构编号#,"|产品编号:",@产品编号#,"|注销标志:",@临时_注销标志#,"|操作权限:",@临时_操作权限#); */
        set v_table_field_value =  concat("|操作员编号:",v_target_opor_no,"|机构编号:",v_co_no,"|产品编号:",v_pd_no,"|注销标志:",v_tmp_abolish_status,"|操作权限:",v_tmp_oper_rights);

        /* set @表唯一索引值# = concat("|操作员编号:",@目标操作员编号#,"|产品编号:",@产品编号#); */
        set v_table_uni_index_value = concat("|操作员编号:",v_target_opor_no,"|产品编号:",v_pd_no);

        /* set @数据表名称# = "tb_user_opor_allow_prod"; */
        set v_table_name = "tb_user_opor_allow_prod";

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
                    
            SET v_error_code = "pubA.19.62.5";
            SET v_error_info =  CONCAT(concat("数据表名称=",v_table_name,","," 表记录序号=", v_table_row_id),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* [删除表记录][公共_用户_操作员可操作产品表][{操作员编号}=@目标操作员编号# and {产品编号}=@产品编号#][3][@目标操作员编号#,@产品编号#] */
        delete from db_pub.tb_user_opor_allow_prod 
            where opor_no=v_target_opor_no and pd_no=v_pd_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "pubA.19.62.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("目标操作员编号=",v_target_opor_no,",","产品编号=",v_pd_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_用户_操作员所属交易组流水表][字段][字段变量][5][@目标操作员编号#,@交易组编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_exch_group_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, target_opor_no, 
        co_no, pd_no, exch_group_no, oper_rights, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_target_opor_no, 
        v_co_no, v_pd_no, v_exch_group_no, v_oper_rights, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.62.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_pd_no = v_pd_no;
    SET p_oper_rights = v_oper_rights;
    SET p_abolish_status = v_abolish_status;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询操作员所属交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryOporAllowExchGroup;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryOporAllowExchGroup(
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
    

    /* if @查询操作员编号# =0 then */
    if v_query_opor_no =0 then

         /* [获取表记录][公共_用户_操作员所属交易组表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{操作员编号},{交易组编号},{操作权限}][{机构编号}=@操作员机构编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
         if v_row_count = -1 then
             select row_id,create_date,create_time,update_date,update_time,opor_no,exch_group_no,oper_rights from db_pub.tb_user_opor_exch_group where co_no=v_opor_co_no and row_id > v_row_id order by row_id;
         else
             select row_id,create_date,create_time,update_date,update_time,opor_no,exch_group_no,oper_rights from db_pub.tb_user_opor_exch_group where co_no=v_opor_co_no and row_id > v_row_id order by row_id limit v_row_count;
         end if;

    else

         /* [获取表记录][公共_用户_操作员所属交易组表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{操作员编号},{交易组编号},{操作权限}][{操作员编号}=@查询操作员编号# and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
         if v_row_count = -1 then
             select row_id,create_date,create_time,update_date,update_time,opor_no,exch_group_no,oper_rights from db_pub.tb_user_opor_exch_group where opor_no=v_query_opor_no and row_id > v_row_id order by row_id;
         else
             select row_id,create_date,create_time,update_date,update_time,opor_no,exch_group_no,oper_rights from db_pub.tb_user_opor_exch_group where opor_no=v_query_opor_no and row_id > v_row_id order by row_id limit v_row_count;
         end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_更新操作员所属交易组注销标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_UpdateOporAllowExchGroupAbolishStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_UpdateOporAllowExchGroupAbolishStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_group_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_oper_rights int,
    OUT p_exch_group_update_times int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_oper_rights int;
    declare v_exch_group_update_times int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_oper_rights = 0;
    SET v_exch_group_update_times = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_用户_操作员所属交易组表][{记录序号},{操作权限},{更新次数}][@记录序号#,@操作权限#,@交易组更新次数#][{操作员编号} = @操作员编号# and {交易组编号} = @交易组编号#] */
    select row_id,oper_rights,update_times into v_row_id,v_oper_rights,v_exch_group_update_times from db_pub.tb_user_opor_exch_group where opor_no = v_opor_no and exch_group_no = v_exch_group_no limit 1;


    /* [更新表记录][公共_用户_操作员所属交易组表][{注销标志}=1][{机构编号}=@机构编号# and {交易组编号}=@交易组编号#][2][@机构编号#,@交易组编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_exch_group set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, abolish_status=1 where co_no=v_co_no and exch_group_no=v_exch_group_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.63.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_oper_rights = v_oper_rights;
    SET p_exch_group_update_times = v_exch_group_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_新增产品账户交易组组别
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_InsertProductUnitExchGroup;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_InsertProductUnitExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_group_no int,
    IN p_co_no int,
    IN p_group_name varchar(64),
    IN p_remark_info varchar(255),
    IN p_pd_account_group_type int,
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
    declare v_group_no int;
    declare v_co_no int;
    declare v_group_name varchar(64);
    declare v_remark_info varchar(255);
    declare v_pd_account_group_type int;
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
    SET v_group_no = p_group_no;
    SET v_co_no = p_co_no;
    SET v_group_name = p_group_name;
    SET v_remark_info = p_remark_info;
    SET v_pd_account_group_type = p_pd_account_group_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][公共_用户_产品账户交易组组别表][字段][字段变量][1][@组别编号#,@机构编号#,@组别名称#,@备注信息#,@产品账户组类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_prod_exch_group(
        create_date, create_time, update_date, 
        update_time, update_times, group_no, opor_no, 
        co_no, group_name, pd_account_group_type, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_group_no, v_opor_no, 
        v_co_no, v_group_name, v_pd_account_group_type, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.65.1";
        SET v_error_info =  CONCAT(concat("组别编号=",v_group_no,",","机构编号=",v_co_no,",","组别名称=",v_group_name,",","备注信息=",v_remark_info,",","产品账户组类型=",v_pd_account_group_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_修改产品账户交易组组别
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_UpdateProductUnitExchGroup;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_UpdateProductUnitExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_group_no int,
    IN p_group_name varchar(64),
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
    declare v_group_no int;
    declare v_group_name varchar(64);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_opor_no int;
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
    SET v_group_no = p_group_no;
    SET v_group_name = p_group_name;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_opor_no = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_产品账户交易组组别表][{操作员编号}][@临时_操作员编号#][{组别编号}=@组别编号#][4][@组别编号#] */
    select opor_no into v_tmp_opor_no from db_pub.tb_user_opor_prod_exch_group where group_no=v_group_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.66.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("组别编号=",v_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("组别编号=",v_group_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@临时_操作员编号#<>@操作员编号#][216][@操作员编号#] */
    if v_tmp_opor_no<>v_opor_no then
        
        SET v_error_code = "pubA.19.66.216";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_用户_产品账户交易组组别表][{组别名称}=@组别名称#,{备注信息}=@备注信息#][{组别编号}=@组别编号#][2][@组别编号#,@组别名称#,@备注信息#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_prod_exch_group set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, group_name=v_group_name,remark_info=v_remark_info where group_no=v_group_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.66.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("组别编号=",v_group_no,",","组别名称=",v_group_name,",","备注信息=",v_remark_info),"#",v_mysql_message);
        else
            SET v_error_info = concat("组别编号=",v_group_no,",","组别名称=",v_group_name,",","备注信息=",v_remark_info);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_删除产品账户交易组组别
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_DeleteProductUnitExchGroup;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_DeleteProductUnitExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_group_no int,
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
    declare v_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_opor_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_group_no = p_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_opor_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_产品账户交易组组别表][{操作员编号}][@临时_操作员编号#][{组别编号}=@组别编号#][4][@组别编号#] */
    select opor_no into v_tmp_opor_no from db_pub.tb_user_opor_prod_exch_group where group_no=v_group_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.67.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("组别编号=",v_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("组别编号=",v_group_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@临时_操作员编号#<>@操作员编号#][216][@操作员编号#] */
    if v_tmp_opor_no<>v_opor_no then
        
        SET v_error_code = "pubA.19.67.216";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_用户_产品账户交易组组别表][{组别编号}=@组别编号#][3][@组别编号#] */
    delete from db_pub.tb_user_opor_prod_exch_group 
        where group_no=v_group_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.19.67.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("组别编号=",v_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("组别编号=",v_group_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][公共_用户_产品账户交易组组别明细表][{组别编号}=@组别编号#][3][@组别编号#] */
    delete from db_pub.tb_user_opor_prod_exch_group_detail 
        where group_no=v_group_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.19.67.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("组别编号=",v_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("组别编号=",v_group_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询产品账户交易组组别
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryProductUnitExchGroup;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryProductUnitExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_group_no int,
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
    declare v_group_no int;
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
    SET v_group_no = p_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][公共_用户_产品账户交易组组别表][{记录序号},{组别编号},{操作员编号},{机构编号},{组别名称},{备注信息},{产品账户组类型}][{操作员编号}=@操作员编号# and (@组别编号#=0 or {组别编号}=@组别编号#)] */
    select row_id,group_no,opor_no,co_no,group_name,remark_info,pd_account_group_type from db_pub.tb_user_opor_prod_exch_group where opor_no=v_opor_no and (v_group_no=0 or group_no=v_group_no);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_新增产品账户交易组组别明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_InsertProductUnitExchGroupDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_InsertProductUnitExchGroupDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_group_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
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
    declare v_group_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_weight_ratio decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_opor_no int;
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
    SET v_group_no = p_group_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_weight_ratio = p_weight_ratio;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_opor_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_产品账户交易组组别表][{操作员编号}][@临时_操作员编号#][{组别编号}=@组别编号#][4][@组别编号#] */
    select opor_no into v_tmp_opor_no from db_pub.tb_user_opor_prod_exch_group where group_no=v_group_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.69.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("组别编号=",v_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("组别编号=",v_group_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@临时_操作员编号#<>@操作员编号#][216][@操作员编号#] */
    if v_tmp_opor_no<>v_opor_no then
        
        SET v_error_code = "pubA.19.69.216";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [插入表记录][公共_用户_产品账户交易组组别明细表][字段][字段变量][1][@组别编号#,@机构编号#,@产品编号#,@资产账户编号#,@交易组编号#,@权重比例#,@备注信息#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_prod_exch_group_detail(
        create_date, create_time, update_date, 
        update_time, update_times, group_no, opor_no, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        weight_ratio, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_group_no, v_opor_no, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_weight_ratio, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.69.1";
        SET v_error_info =  CONCAT(concat("组别编号=",v_group_no,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","权重比例=",v_weight_ratio,",","备注信息=",v_remark_info),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_修改产品账户交易组组别明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_UpdateProductUnitExchGroupDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_UpdateProductUnitExchGroupDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_group_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
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
    declare v_group_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_weight_ratio decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
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
    SET v_group_no = p_group_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_weight_ratio = p_weight_ratio;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_产品账户交易组组别明细表][{记录序号}][@记录序号#][{组别编号}=@组别编号# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {操作员编号}=@操作员编号#][4][@组别编号#,@机构编号#,@产品编号#,@资产账户编号#,@交易组编号#,@操作员编号#] */
    select row_id into v_row_id from db_pub.tb_user_opor_prod_exch_group_detail where group_no=v_group_no and co_no=v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and opor_no=v_opor_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.70.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("组别编号=",v_group_no,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("组别编号=",v_group_no,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_用户_产品账户交易组组别明细表][{权重比例}=@权重比例#,{备注信息}=@备注信息#][{组别编号}=@组别编号# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {操作员编号}=@操作员编号#][2][@组别编号#,@机构编号#,@产品编号#,@资产账户编号#,@交易组编号#,@操作员编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_prod_exch_group_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, weight_ratio=v_weight_ratio,remark_info=v_remark_info where group_no=v_group_no and co_no=v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and opor_no=v_opor_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.70.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("组别编号=",v_group_no,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("组别编号=",v_group_no,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_删除产品账户交易组组别明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_DeleteProductUnitExchGroupDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_DeleteProductUnitExchGroupDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_group_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
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
    declare v_group_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
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
    SET v_group_no = p_group_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][公共_用户_产品账户交易组组别明细表][{组别编号}=@组别编号# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {操作员编号}=@操作员编号#][3][@组别编号#,@机构编号#,@产品编号#,@资产账户编号#,@交易组编号#,@操作员编号#] */
    delete from db_pub.tb_user_opor_prod_exch_group_detail 
        where group_no=v_group_no and co_no=v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and opor_no=v_opor_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.19.71.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("组别编号=",v_group_no,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("组别编号=",v_group_no,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询产品账户交易组组别明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryProductUnitExchGroupDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryProductUnitExchGroupDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_group_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_part_no int,
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
    declare v_group_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_part_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
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
    SET v_group_no = p_group_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_part_no = p_part_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表全记录][公共_用户_产品账户交易组组别明细表][{组别编号},{操作员编号},{机构编号},{产品编号},{资产账户编号},{交易组编号},{权重比例},{备注信息}][{操作员编号}=@操作员编号# and (@组别编号#=0 or {组别编号}=@组别编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#)] */
    select group_no,opor_no,co_no,pd_no,asset_acco_no,exch_group_no,weight_ratio,remark_info from db_pub.tb_user_opor_prod_exch_group_detail where opor_no=v_opor_no and (v_group_no=0 or group_no=v_group_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_新增操作员可操作操作员
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_AddOporAllowOpor;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_AddOporAllowOpor(
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
    IN p_allow_opor_no int,
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
    declare v_allow_opor_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_rights int;
    declare v_opor_status varchar(2);
    declare v_abolish_status varchar(2);
    declare v_tmp_opor_no int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pd_no int;
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
    SET v_allow_opor_no = p_allow_opor_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_rights = 0;
    SET v_opor_status = "0";
    SET v_abolish_status = "0";
    SET v_tmp_opor_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pd_no = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @操作权限# = 《操作权限-管理》; */
    set v_oper_rights = 2;

    /* [获取表记录变量][公共_用户_操作员信息表][{操作员状态}][@操作员状态#][{操作员编号}=@可操作操作员编号#][4][@可操作操作员编号#] */
    select opor_status into v_opor_status from db_pub.tb_user_opor_info where opor_no=v_allow_opor_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.74.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("可操作操作员编号=",v_allow_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("可操作操作员编号=",v_allow_opor_no);
        end if;
        leave label_pro;
    end if;


    /* if @操作员状态# = 《操作员状态-注销》 then */
    if v_opor_status = "3" then

        /* set @注销标志# = 1; */
        set v_abolish_status = 1;
    else

        /* set @注销标志# = 0; */
        set v_abolish_status = 0;
    end if;

    /* set @临时_操作员编号# = @操作员编号#; */
    set v_tmp_opor_no = v_opor_no;

    /* set @操作员编号# = @目标操作员编号#; */
    set v_opor_no = v_target_opor_no;

    /* [插入重复更新][公共_用户_操作员可操作操作员表][字段][字段变量][{机构编号}=@机构编号#][1][@目标操作员编号#,@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_allow_opor (
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        allow_opor_no, abolish_status, oper_rights) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_co_no, 
        v_allow_opor_no, v_abolish_status, v_oper_rights) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.74.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作员编号# = @临时_操作员编号#; */
    set v_opor_no = v_tmp_opor_no;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_用户_操作员可操作操作员流水表][字段][字段变量][5][@目标操作员编号#,@可操作操作员编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_allow_opor_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, target_opor_no, 
        co_no, allow_opor_no, oper_rights, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_target_opor_no, 
        v_co_no, v_allow_opor_no, v_oper_rights, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.74.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no,",","可操作操作员编号=",v_allow_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_删除操作员可操作操作员
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_DeleteOporAllowOpor;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_DeleteOporAllowOpor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_allow_opor_no int,
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
    declare v_allow_opor_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_oper_rights int;
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
    SET v_allow_opor_no = p_allow_opor_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_oper_rights = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_用户_操作员可操作操作员表][{机构编号},{操作权限}][@机构编号#,@操作权限#][{操作员编号} = @目标操作员编号# and {可操作操作员编号} = @可操作操作员编号#] */
    select co_no,oper_rights into v_co_no,v_oper_rights from db_pub.tb_user_opor_allow_opor where opor_no = v_target_opor_no and allow_opor_no = v_allow_opor_no limit 1;


    /* [检查正常返回][FOUND_ROWS() = 0] */
    if FOUND_ROWS() = 0 then
        leave label_pro;
    end if;


    /* [删除表记录][公共_用户_操作员可操作操作员表][{操作员编号} = @目标操作员编号# and {可操作操作员编号} = @可操作操作员编号#][3][@目标操作员编号#,@可操作操作员编号#] */
    delete from db_pub.tb_user_opor_allow_opor 
        where opor_no = v_target_opor_no and allow_opor_no = v_allow_opor_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.19.75.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no,",","可操作操作员编号=",v_allow_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no,",","可操作操作员编号=",v_allow_opor_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_用户_操作员可操作操作员流水表][字段][字段变量][5][@目标操作员编号#,@可操作操作员编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_allow_opor_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, target_opor_no, 
        co_no, allow_opor_no, oper_rights, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_target_opor_no, 
        v_co_no, v_allow_opor_no, v_oper_rights, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.75.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no,",","可操作操作员编号=",v_allow_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询操作员可操作操作员
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryOporAllowOpor;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryOporAllowOpor(
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
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_allow_opor_no_str varchar(2048);
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
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_用户_操作员可操作操作员表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{操作员编号},{可操作操作员编号},{操作权限}][{机构编号}=@操作员机构编号# and ((@查询操作员编号# = 0 and instr(@可操作操作员编号串#, concat(";",{操作员编号},";"))>0 ) or {操作员编号} = @查询操作员编号#) and {注销标志}=0 and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,opor_no,allow_opor_no,oper_rights from db_pub.tb_user_opor_allow_opor where co_no=v_opor_co_no and ((v_query_opor_no = 0 and instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0 ) or opor_no = v_query_opor_no) and abolish_status=0 and row_id > v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,opor_no,allow_opor_no,oper_rights from db_pub.tb_user_opor_allow_opor where co_no=v_opor_co_no and ((v_query_opor_no = 0 and instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0 ) or opor_no = v_query_opor_no) and abolish_status=0 and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_更新操作员可操作操作员注销标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_UpdateOporAllowOporAbolishStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_UpdateOporAllowOporAbolishStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_allow_opor_no int,
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
    declare v_allow_opor_no int;
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
    SET v_allow_opor_no = p_allow_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_用户_操作员可操作操作员表][{注销标志}=1][{可操作操作员编号}=@可操作操作员编号#][2][@可操作操作员编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_allow_opor set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, abolish_status=1 where allow_opor_no=v_allow_opor_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.77.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("可操作操作员编号=",v_allow_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("可操作操作员编号=",v_allow_opor_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询交易组历史资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryExgpGroupAsset_His;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryExgpGroupAsset_His(
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
    IN p_exch_group_no int,
    IN p_crncy_type varchar(3),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_用户_历史交易组资产表][{初始化日期},{记录序号},{机构编号},{产品编号},{交易组编号},{本币币种},{期初净资产},{净资产},{总现金资产},{股票资产},{基金资产},{货币基金资产},{非货币基金资产},{债券资产},{期货资产},{回购资产},{其他资产},{港股通资产},{证券现金资产},{期货现金资产}][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@本币币种# = " " or {本币币种}=@本币币种#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select init_date,row_id,co_no,pd_no,exch_group_no,crncy_type,begin_NAV,nav_asset,total_cash_asset,stock_asset,fund_asset,money_fund_asset,not_money_fund_asset,bond_asset,futu_asset,repo_asset,other_asset,hk_thrgh_stock_asset,stock_cash_asset,futu_cash_asset from db_pub_his.tb_user_exch_group_asset_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type = " " or crncy_type=v_crncy_type) and row_id > v_row_id order by row_id;
    else
        select init_date,row_id,co_no,pd_no,exch_group_no,crncy_type,begin_NAV,nav_asset,total_cash_asset,stock_asset,fund_asset,money_fund_asset,not_money_fund_asset,bond_asset,futu_asset,repo_asset,other_asset,hk_thrgh_stock_asset,stock_cash_asset,futu_cash_asset from db_pub_his.tb_user_exch_group_asset_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type = " " or crncy_type=v_crncy_type) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询交易组资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryExgpGroupAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryExgpGroupAsset(
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
    IN p_crncy_type varchar(3),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @操作员机构编号# = 9999 then */
    if v_opor_co_no = 9999 then

        /* [获取表记录][公共_用户_交易组资产表][{记录序号},{机构编号},{产品编号},{交易组编号},{本币币种},{期初净资产},{净资产},{总现金资产},{股票资产},{基金资产},{货币基金资产},{非货币基金资产},{债券资产},{期货资产},{回购资产},{其他资产},{港股通资产},{期初估值净资产},{估值净资产},{期货多头市值},{期货空头市值},{证券现金资产},{期货现金资产}][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and  (@本币币种# = " " or {本币币种}=@本币币种#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id,co_no,pd_no,exch_group_no,crncy_type,begin_NAV,nav_asset,total_cash_asset,stock_asset,fund_asset,money_fund_asset,not_money_fund_asset,bond_asset,futu_asset,repo_asset,other_asset,hk_thrgh_stock_asset,begin_evalu_nav_asset,evalu_nav_asset,futu_long_market_value,futu_short_market_value,stock_cash_asset,futu_cash_asset from db_pub.tb_user_exch_group_asset where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and  (v_crncy_type = " " or crncy_type=v_crncy_type) and row_id > v_row_id order by row_id;
        else
            select row_id,co_no,pd_no,exch_group_no,crncy_type,begin_NAV,nav_asset,total_cash_asset,stock_asset,fund_asset,money_fund_asset,not_money_fund_asset,bond_asset,futu_asset,repo_asset,other_asset,hk_thrgh_stock_asset,begin_evalu_nav_asset,evalu_nav_asset,futu_long_market_value,futu_short_market_value,stock_cash_asset,futu_cash_asset from db_pub.tb_user_exch_group_asset where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and  (v_crncy_type = " " or crncy_type=v_crncy_type) and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][公共_用户_交易组资产表][{记录序号},{机构编号},{产品编号},{交易组编号},{本币币种},{期初净资产},{净资产},{总现金资产},{股票资产},{基金资产},{货币基金资产},{非货币基金资产},{债券资产},{期货资产},{回购资产},{其他资产},{港股通资产},{期初估值净资产},{估值净资产},{期货多头市值},{期货空头市值},{证券现金资产},{期货现金资产}][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@本币币种# = " " or {本币币种}=@本币币种#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id,co_no,pd_no,exch_group_no,crncy_type,begin_NAV,nav_asset,total_cash_asset,stock_asset,fund_asset,money_fund_asset,not_money_fund_asset,bond_asset,futu_asset,repo_asset,other_asset,hk_thrgh_stock_asset,begin_evalu_nav_asset,evalu_nav_asset,futu_long_market_value,futu_short_market_value,stock_cash_asset,futu_cash_asset from db_pub.tb_user_exch_group_asset where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type = " " or crncy_type=v_crncy_type) and row_id > v_row_id order by row_id;
        else
            select row_id,co_no,pd_no,exch_group_no,crncy_type,begin_NAV,nav_asset,total_cash_asset,stock_asset,fund_asset,money_fund_asset,not_money_fund_asset,bond_asset,futu_asset,repo_asset,other_asset,hk_thrgh_stock_asset,begin_evalu_nav_asset,evalu_nav_asset,futu_long_market_value,futu_short_market_value,stock_cash_asset,futu_cash_asset from db_pub.tb_user_exch_group_asset where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type = " " or crncy_type=v_crncy_type) and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询交易组资产历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryExgpGroupAssetHis;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryExgpGroupAssetHis(
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
    IN p_exch_group_no int,
    IN p_crncy_type varchar(3),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_用户_历史交易组资产表][{记录序号},{机构编号},{产品编号},{交易组编号},{本币币种},{期初净资产},{净资产}, {总现金资产},{股票资产},{基金资产},{货币基金资产},{非货币基金资产},{债券资产},{期货资产},{回购资产},{其他资产},{港股通资产},{期货多头市值},{期货空头市值},{证券现金资产},{期货现金资产}][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@本币币种# = " " or {本币币种}=@本币币种#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,co_no,pd_no,exch_group_no,crncy_type,begin_NAV,nav_asset, total_cash_asset,stock_asset,fund_asset,money_fund_asset,not_money_fund_asset,bond_asset,futu_asset,repo_asset,other_asset,hk_thrgh_stock_asset,futu_long_market_value,futu_short_market_value,stock_cash_asset,futu_cash_asset from db_pub_his.tb_user_exch_group_asset_his where init_date=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type = " " or crncy_type=v_crncy_type) and row_id > v_row_id order by row_id;
    else
        select row_id,co_no,pd_no,exch_group_no,crncy_type,begin_NAV,nav_asset, total_cash_asset,stock_asset,fund_asset,money_fund_asset,not_money_fund_asset,bond_asset,futu_asset,repo_asset,other_asset,hk_thrgh_stock_asset,futu_long_market_value,futu_short_market_value,stock_cash_asset,futu_cash_asset from db_pub_his.tb_user_exch_group_asset_his where init_date=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type = " " or crncy_type=v_crncy_type) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_获取交易组最大净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_GetExgpMaxNav;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_GetExgpMaxNav(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_nav_asset decimal(18,4)
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
    declare v_begin_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_nav_asset decimal(18,4);
    declare v_tmp_nav_asset decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_nav_asset = 0;
    SET v_tmp_nav_asset = 0;

    
    label_pro:BEGIN
    

    /* set @净资产#=0; */
    set v_nav_asset=0;

    /* select max({净资产}) into @净资产# from ~公共_用户_历史交易组资产表^ where {交易组编号}=@交易组编号# and {本币币种}="CNY" and {初始化日期}>=@开始日期#; */
    select max(nav_asset) into v_nav_asset from db_pub_his.tb_user_exch_group_asset_his where exch_group_no=v_exch_group_no and crncy_type="CNY" and init_date>=v_begin_date;

    /* set @临时_净资产#=0; */
    set v_tmp_nav_asset=0;

    /* [获取表记录变量语句][公共_用户_交易组资产表][{净资产}][@临时_净资产#][{交易组编号}=@交易组编号# and {本币币种}="CNY"] */
    select nav_asset into v_tmp_nav_asset from db_pub.tb_user_exch_group_asset where exch_group_no=v_exch_group_no and crncy_type="CNY" limit 1;


    /* set @净资产#=GREATEST(@净资产#,@临时_净资产#); */
    set v_nav_asset=GREATEST(v_nav_asset,v_tmp_nav_asset);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_nav_asset = v_nav_asset;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_获取交易组最大单位净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_GetExgpMaxPerNav;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_GetExgpMaxPerNav(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_unit_nav decimal(18,4)
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
    declare v_begin_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_unit_nav decimal(18,4);
    declare v_pre_nav decimal(18,4);
    declare v_tmp_pre_nav decimal(18,4);
    declare v_exch_group_pd_share decimal(18,2);
    declare v_nav_asset decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_unit_nav = 0;
    SET v_pre_nav = 0;
    SET v_tmp_pre_nav = 0;
    SET v_exch_group_pd_share = 0;
    SET v_nav_asset = 0;

    
    label_pro:BEGIN
    

    /* set @昨日净值#=0; */
    set v_pre_nav=0;

    /* select max({昨日净值}) into @昨日净值# from ~公共_用户_历史交易组信息表^ where {交易组编号}=@交易组编号# and {初始化日期}>@开始日期#; */
    select max(pre_nav) into v_pre_nav from db_pub_his.tb_user_exch_group_info_his where exch_group_no=v_exch_group_no and init_date>v_begin_date;

    /* set @临时_昨日净值#=0; */
    set v_tmp_pre_nav=0;

    /* set @交易组产品份额#=0; */
    set v_exch_group_pd_share=0;

    /* set @净资产#=0; */
    set v_nav_asset=0;

    /* [获取表记录变量语句][公共_用户_交易组信息表][{交易组产品份额},{昨日净值}][@交易组产品份额#,@临时_昨日净值#][{交易组编号}=@交易组编号#] */
    select exch_group_pd_share,pre_nav into v_exch_group_pd_share,v_tmp_pre_nav from db_pub.tb_user_exch_group_info where exch_group_no=v_exch_group_no limit 1;


    /* [获取表记录变量语句][公共_用户_交易组资产表][{净资产}][@净资产#][{交易组编号}=@交易组编号# and {本币币种}="CNY"] */
    select nav_asset into v_nav_asset from db_pub.tb_user_exch_group_asset where exch_group_no=v_exch_group_no and crncy_type="CNY" limit 1;


    /* set @单位净值#=round(IFNULL((@净资产#/@交易组产品份额#),0),4); */
    set v_unit_nav=round(IFNULL((v_nav_asset/v_exch_group_pd_share),0),4);

    /* set @单位净值#=GREATEST(@昨日净值#,@临时_昨日净值#,@单位净值#); */
    set v_unit_nav=GREATEST(v_pre_nav,v_tmp_pre_nav,v_unit_nav);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_unit_nav = v_unit_nav;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_获取默认交易组个数
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_GetDefaultExgpCount;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_GetDefaultExgpCount(
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
    declare v_pd_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录数量][公共_用户_交易组信息表][@记录个数#][{产品编号} = @产品编号# and {默认组标志} = 《默认组标志-是》] */
    select count(1) into v_record_count from db_pub.tb_user_exch_group_info where pd_no = v_pd_no and default_group_flag = 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询交易组份额变动流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryExgpShareOccurJour;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryExgpShareOccurJour(
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
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数#=-1; */
    set v_row_count=-1;

    /* [获取表记录][公共_用户_交易组信息流水表][{初始化日期},create_time,{机构编号},{产品编号},{交易组编号},{操作员编号},{流水变动字段},{流水后信息}][{机构编号}=@机构编号# and ({产品编号}=@产品编号# or @产品编号#=0) and ({交易组编号}=@交易组编号# or @交易组编号#=0)  and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and {初始化日期}<>0 and {操作备注}="份额变动" order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select init_date,create_time,co_no,pd_no,exch_group_no,opor_no,jour_occur_field,jour_after_occur_info from db_pub.tb_user_exch_group_info_jour where co_no=v_co_no and (pd_no=v_pd_no or v_pd_no=0) and (exch_group_no=v_exch_group_no or v_exch_group_no=0)  and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and init_date<>0 and oper_remark_info="份额变动" order by row_id;
    else
        select init_date,create_time,co_no,pd_no,exch_group_no,opor_no,jour_occur_field,jour_after_occur_info from db_pub.tb_user_exch_group_info_jour where co_no=v_co_no and (pd_no=v_pd_no or v_pd_no=0) and (exch_group_no=v_exch_group_no or v_exch_group_no=0)  and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and init_date<>0 and oper_remark_info="份额变动" order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询交易组份额变动流水历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryExgpShareOccurJourHis;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryExgpShareOccurJourHis(
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
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数#=-1; */
    set v_row_count=-1;

    /* [获取表记录][历史_公共_用户_交易组信息流水表][{初始化日期},create_time,{机构编号},{产品编号},{交易组编号},{操作员编号},{流水变动字段},{流水后信息}][{机构编号}=@机构编号# and ({产品编号}=@产品编号# or @产品编号#=0) and ({交易组编号}=@交易组编号# or @交易组编号#=0)  and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and {初始化日期}>=@开始日期# and {初始化日期}<=@结束日期# and {操作备注}="份额变动" order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select init_date,create_time,co_no,pd_no,exch_group_no,opor_no,jour_occur_field,jour_after_occur_info from db_pub_his.tb_user_exch_group_info_jour_his where co_no=v_co_no and (pd_no=v_pd_no or v_pd_no=0) and (exch_group_no=v_exch_group_no or v_exch_group_no=0)  and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and init_date>=v_begin_date and init_date<=v_end_date and oper_remark_info="份额变动" order by row_id;
    else
        select init_date,create_time,co_no,pd_no,exch_group_no,opor_no,jour_occur_field,jour_after_occur_info from db_pub_his.tb_user_exch_group_info_jour_his where co_no=v_co_no and (pd_no=v_pd_no or v_pd_no=0) and (exch_group_no=v_exch_group_no or v_exch_group_no=0)  and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and init_date>=v_begin_date and init_date<=v_end_date and oper_remark_info="份额变动" order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询单个交易组资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QuerySingleExgpGroupAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QuerySingleExgpGroupAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_begin_NAV decimal(18,4),
    OUT p_nav_asset decimal(18,4),
    OUT p_stock_cash_asset decimal(18,4),
    OUT p_stock_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_futu_asset decimal(18,4),
    OUT p_repo_asset decimal(18,4),
    OUT p_other_asset decimal(18,4),
    OUT p_hk_thrgh_stock_asset decimal(18,4),
    OUT p_total_realiz_pandl decimal(18,4),
    OUT p_many_days_total_asset decimal(18,4),
    OUT p_stat_days int
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
    declare v_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_begin_NAV decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_stock_cash_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_total_realiz_pandl decimal(18,4);
    declare v_many_days_total_asset decimal(18,4);
    declare v_stat_days int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_total_cash_asset decimal(18,4);
    declare v_futu_cash_asset decimal(18,4);
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_begin_evalu_nav_asset decimal(18,4);
    declare v_evalu_nav_asset decimal(18,4);
    declare v_total_fina_debt decimal(18,4);
    declare v_total_loan_debt decimal(18,4);
    declare v_futu_long_market_value decimal(18,4);
    declare v_futu_short_market_value decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_begin_NAV = 0;
    SET v_nav_asset = 0;
    SET v_stock_cash_asset = 0;
    SET v_stock_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_futu_asset = 0;
    SET v_repo_asset = 0;
    SET v_other_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_total_realiz_pandl = 0;
    SET v_many_days_total_asset = 0;
    SET v_stat_days = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_total_cash_asset = 0;
    SET v_futu_cash_asset = 0;
    SET v_money_fund_asset = 0;
    SET v_not_money_fund_asset = 0;
    SET v_begin_evalu_nav_asset = 0;
    SET v_evalu_nav_asset = 0;
    SET v_total_fina_debt = 0;
    SET v_total_loan_debt = 0;
    SET v_futu_long_market_value = 0;
    SET v_futu_short_market_value = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_用户_交易组资产表][字段][字段变量][{交易组编号} = @交易组编号# and {本币币种} = @本币币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, crncy_type, begin_NAV, 
        nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
        stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
        bond_asset, futu_asset, repo_asset, other_asset, 
        hk_thrgh_stock_asset, total_realiz_pandl, many_days_total_asset, stat_days, 
        begin_evalu_nav_asset, evalu_nav_asset, total_fina_debt, total_loan_debt, 
        futu_long_market_value, futu_short_market_value into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_crncy_type, v_begin_NAV, 
        v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
        v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
        v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
        v_hk_thrgh_stock_asset, v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, 
        v_begin_evalu_nav_asset, v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, 
        v_futu_long_market_value, v_futu_short_market_value from db_pub.tb_user_exch_group_asset where exch_group_no = v_exch_group_no and crncy_type = v_crncy_type limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_begin_NAV = v_begin_NAV;
    SET p_nav_asset = v_nav_asset;
    SET p_stock_cash_asset = v_stock_cash_asset;
    SET p_stock_asset = v_stock_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_futu_asset = v_futu_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_other_asset = v_other_asset;
    SET p_hk_thrgh_stock_asset = v_hk_thrgh_stock_asset;
    SET p_total_realiz_pandl = v_total_realiz_pandl;
    SET p_many_days_total_asset = v_many_days_total_asset;
    SET p_stat_days = v_stat_days;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询可见交易员列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryTraderViews;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryTraderViews(
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
    

    /* SELECT
 a.{交易组编号},
 b.{操作员编号},
 b.{操作员名称}
FROM
 ~公共_用户_操作员所属交易组表^ a,
 ~公共_用户_操作员可操作产品表^ c,
 ~公共_用户_操作员信息表^ b
WHERE
 b.{机构编号} = @机构编号#
AND b.{是否交易员} = 《是否交易员-是》
AND b.{操作员状态} = 《操作员状态-正常》
AND c.{机构编号} = b.{机构编号}
AND c.{操作员编号} = b.{操作员编号}
AND c.{注销标志} <> "1"
AND a.{机构编号} = c.{机构编号}
AND a.{产品编号} = c.{产品编号}
AND a.{操作员编号} = b.{操作员编号}
AND a.{机构编号} = b.{机构编号}
AND a.{注销标志} <> "1"; */
    SELECT
     a.exch_group_no,
     b.opor_no,
     b.opor_name
    FROM
     db_pub.tb_user_opor_exch_group a,
     db_pub.tb_user_opor_allow_prod c,
     db_pub.tb_user_opor_info b
    WHERE
     b.co_no = v_co_no
    AND b.is_trader = 1
    AND b.opor_status = "1"
    AND c.co_no = b.co_no
    AND c.opor_no = b.opor_no
    AND c.abolish_status <> "1"
    AND a.co_no = c.co_no
    AND a.pd_no = c.pd_no
    AND a.opor_no = b.opor_no
    AND a.co_no = b.co_no
    AND a.abolish_status <> "1";
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询自动打新交易组列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryExchGroupByAutoNewStock;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryExchGroupByAutoNewStock(
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
    

    /* [获取表全记录][公共_用户_交易组信息表][{机构编号},{产品编号},{交易组编号},{交易组编码},{交易组名称}][(@机构编号# = 0 or {机构编号}=@机构编号#) and {默认组标志}=《默认组标志-是》 and {交易组状态}=《交易组状态-正常》] */
    select co_no,pd_no,exch_group_no,exch_group_code,exch_group_name from db_pub.tb_user_exch_group_info where (v_co_no = 0 or co_no=v_co_no) and default_group_flag=1 and exch_group_status="1";

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_注销产品获取批量交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_CloseProductGetExgpInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_CloseProductGetExgpInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][公共_用户_操作员所属交易组表][{记录序号},{操作员编号},{机构编号},{产品编号},{交易组编号},{操作权限},{更新次数}][{机构编号}=@机构编号# and {产品编号}=@产品编号#] */
    select row_id,opor_no,co_no,pd_no,exch_group_no,oper_rights,update_times from db_pub.tb_user_opor_exch_group where co_no=v_co_no and pd_no=v_pd_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_获取可操作该产品操作员编号串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_GetOperatorNoByProdNo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_GetOperatorNoByProdNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_target_pd_no int,
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
    declare v_target_pd_no int;
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
    SET v_target_pd_no = p_target_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_allow_opor_no_str = " ";

    
    label_pro:BEGIN
    

    /* set @可操作操作员编号串# = " "; */
    set v_allow_opor_no_str = " ";

    /* [获取表记录变量语句][公共_用户_操作员可操作产品表][group_concat({操作员编号} SEPARATOR ';')][@可操作操作员编号串#][{产品编号}=@目标产品编号#] */
    select group_concat(opor_no SEPARATOR ';') into v_allow_opor_no_str from db_pub.tb_user_opor_allow_prod where pd_no=v_target_pd_no limit 1;


    /* set @可操作操作员编号串# = ifnull(@可操作操作员编号串#," "); */
    set v_allow_opor_no_str = ifnull(v_allow_opor_no_str," ");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_allow_opor_no_str = v_allow_opor_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_新增期现对冲组合
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_InsertFutuSecuHedg;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_InsertFutuSecuHedg(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_trd_type int,
    IN p_hedg_name varchar(255),
    IN p_futu_exch_group_no int,
    IN p_futu_asset_acco_no int,
    IN p_futu_order_pd_no int,
    IN p_secu_exch_group_no int,
    IN p_secu_asset_acco_no int,
    IN p_secu_order_pd_no int,
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
    declare v_comm_trd_type int;
    declare v_hedg_name varchar(255);
    declare v_futu_exch_group_no int;
    declare v_futu_asset_acco_no int;
    declare v_futu_order_pd_no int;
    declare v_secu_exch_group_no int;
    declare v_secu_asset_acco_no int;
    declare v_secu_order_pd_no int;
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
    SET v_comm_trd_type = p_comm_trd_type;
    SET v_hedg_name = p_hedg_name;
    SET v_futu_exch_group_no = p_futu_exch_group_no;
    SET v_futu_asset_acco_no = p_futu_asset_acco_no;
    SET v_futu_order_pd_no = p_futu_order_pd_no;
    SET v_secu_exch_group_no = p_secu_exch_group_no;
    SET v_secu_asset_acco_no = p_secu_asset_acco_no;
    SET v_secu_order_pd_no = p_secu_order_pd_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][公共_用户_期现对冲组合表][字段][字段变量][1][@机构编号#,@期货产品编号#,@期货资产账户编号#,@期货交易组编号#,@证券产品编号#,@证券资产账户编号#,@证券交易组编号#,@备注信息#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_fuse_hedg(
        create_date, create_time, update_date, 
        update_time, update_times, comm_trd_type, opor_no, 
        co_no, hedg_name, futu_exch_group_no, futu_asset_acco_no, 
        futu_order_pd_no, secu_exch_group_no, secu_asset_acco_no, secu_order_pd_no, 
        remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_comm_trd_type, v_opor_no, 
        v_co_no, v_hedg_name, v_futu_exch_group_no, v_futu_asset_acco_no, 
        v_futu_order_pd_no, v_secu_exch_group_no, v_secu_asset_acco_no, v_secu_order_pd_no, 
        v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.301.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","期货产品编号=",v_futu_order_pd_no,",","期货资产账户编号=",v_futu_asset_acco_no,",","期货交易组编号=",v_futu_exch_group_no,",","证券产品编号=",v_secu_order_pd_no,",","证券资产账户编号=",v_secu_asset_acco_no,",","证券交易组编号=",v_secu_exch_group_no,",","备注信息=",v_remark_info),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_删除期现对冲组合
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_DeleteFutuSecuHedg;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_DeleteFutuSecuHedg(
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
    

    /* [删除表记录][公共_用户_期现对冲组合表][{记录序号}=@记录序号#][3][@记录序号#] */
    delete from db_pub.tb_user_opor_fuse_hedg 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.19.303.3";
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

# 原子_公共_用户客户端_查询期现对冲组合
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryFutuSecuHedg;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryFutuSecuHedg(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_comm_trd_type int,
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
    declare v_comm_trd_type int;
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
    SET v_comm_trd_type = p_comm_trd_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][公共_用户_期现对冲组合表][{记录序号},{指令交易标志},{对冲组合名称},{操作员编号},{机构编号},{期货产品编号},{期货资产账户编号},{期货交易组编号},{证券产品编号},{证券资产账户编号},{证券交易组编号},{备注信息}][ ({机构编号}=@操作员机构编号#)  and (@指令交易标志#=0 or {指令交易标志}= @指令交易标志# ) and ({操作员编号}=@查询操作员编号# or @查询操作员编号# =0)] */
    select row_id,comm_trd_type,hedg_name,opor_no,co_no,futu_order_pd_no,futu_asset_acco_no,futu_exch_group_no,secu_order_pd_no,secu_asset_acco_no,secu_exch_group_no,remark_info from db_pub.tb_user_opor_fuse_hedg where  (co_no=v_opor_co_no)  and (v_comm_trd_type=0 or comm_trd_type= v_comm_trd_type ) and (opor_no=v_query_opor_no or v_query_opor_no =0);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_新增期现对冲方案信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_InsertFutuSecuHedgPlanInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_InsertFutuSecuHedgPlanInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_trd_type int,
    IN p_hedg_plan_name varchar(255),
    IN p_contrc_code_no int,
    IN p_futu_qty decimal(18,2),
    IN p_basket_qty decimal(18,2),
    IN p_basket_id bigint,
    IN p_plan_type int,
    IN p_hedg_no bigint,
    IN p_hedging_pankou decimal(18,4),
    IN p_futu_price_offset decimal(16,9),
    IN p_price_offset decimal(16,9),
    IN p_target_base_diff decimal(18,4),
    IN p_template_base_diff decimal(18,4),
    IN p_up_value_ratio decimal(18,12),
    IN p_down_value_ratio decimal(18,12),
    IN p_stop_value_ratio decimal(18,12),
    IN p_cash_replace_amt decimal(18,4),
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
    declare v_comm_trd_type int;
    declare v_hedg_plan_name varchar(255);
    declare v_contrc_code_no int;
    declare v_futu_qty decimal(18,2);
    declare v_basket_qty decimal(18,2);
    declare v_basket_id bigint;
    declare v_plan_type int;
    declare v_hedg_no bigint;
    declare v_hedging_pankou decimal(18,4);
    declare v_futu_price_offset decimal(16,9);
    declare v_price_offset decimal(16,9);
    declare v_target_base_diff decimal(18,4);
    declare v_template_base_diff decimal(18,4);
    declare v_up_value_ratio decimal(18,12);
    declare v_down_value_ratio decimal(18,12);
    declare v_stop_value_ratio decimal(18,12);
    declare v_cash_replace_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_contrc_code varchar(6);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_hedg_plan_name = p_hedg_plan_name;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_futu_qty = p_futu_qty;
    SET v_basket_qty = p_basket_qty;
    SET v_basket_id = p_basket_id;
    SET v_plan_type = p_plan_type;
    SET v_hedg_no = p_hedg_no;
    SET v_hedging_pankou = p_hedging_pankou;
    SET v_futu_price_offset = p_futu_price_offset;
    SET v_price_offset = p_price_offset;
    SET v_target_base_diff = p_target_base_diff;
    SET v_template_base_diff = p_template_base_diff;
    SET v_up_value_ratio = p_up_value_ratio;
    SET v_down_value_ratio = p_down_value_ratio;
    SET v_stop_value_ratio = p_stop_value_ratio;
    SET v_cash_replace_amt = p_cash_replace_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_contrc_code = " ";

    
    label_pro:BEGIN
    

    /* [插入表记录][公共_用户_期现对冲方案信息表][字段][字段变量][1][@机构编号#,@合约代码#,@对冲组合编号#,@篮子序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_fuse_plan_info(
        create_date, create_time, update_date, 
        update_time, update_times, comm_trd_type, opor_no, 
        co_no, hedg_plan_name, contrc_code_no, futu_qty, 
        basket_qty, basket_id, plan_type, hedg_no, 
        hedging_pankou, futu_price_offset, price_offset, target_base_diff, 
        template_base_diff, up_value_ratio, down_value_ratio, stop_value_ratio, 
        cash_replace_amt, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_comm_trd_type, v_opor_no, 
        v_co_no, v_hedg_plan_name, v_contrc_code_no, v_futu_qty, 
        v_basket_qty, v_basket_id, v_plan_type, v_hedg_no, 
        v_hedging_pankou, v_futu_price_offset, v_price_offset, v_target_base_diff, 
        v_template_base_diff, v_up_value_ratio, v_down_value_ratio, v_stop_value_ratio, 
        v_cash_replace_amt, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.401.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","合约代码=",v_contrc_code,",","对冲组合编号=",v_hedg_no,",","篮子序号=",v_basket_id),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_修改期现对冲方案信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_UpdateFutuSecuHedgPlanInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_UpdateFutuSecuHedgPlanInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_hedg_plan_name varchar(255),
    IN p_futu_qty decimal(18,2),
    IN p_basket_qty decimal(18,2),
    IN p_hedging_pankou decimal(18,4),
    IN p_futu_price_offset decimal(16,9),
    IN p_price_offset decimal(16,9),
    IN p_target_base_diff decimal(18,4),
    IN p_template_base_diff decimal(18,4),
    IN p_up_value_ratio decimal(18,12),
    IN p_down_value_ratio decimal(18,12),
    IN p_stop_value_ratio decimal(18,12),
    IN p_cash_replace_amt decimal(18,4),
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
    declare v_row_id bigint;
    declare v_hedg_plan_name varchar(255);
    declare v_futu_qty decimal(18,2);
    declare v_basket_qty decimal(18,2);
    declare v_hedging_pankou decimal(18,4);
    declare v_futu_price_offset decimal(16,9);
    declare v_price_offset decimal(16,9);
    declare v_target_base_diff decimal(18,4);
    declare v_template_base_diff decimal(18,4);
    declare v_up_value_ratio decimal(18,12);
    declare v_down_value_ratio decimal(18,12);
    declare v_stop_value_ratio decimal(18,12);
    declare v_cash_replace_amt decimal(18,4);
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
    SET v_row_id = p_row_id;
    SET v_hedg_plan_name = p_hedg_plan_name;
    SET v_futu_qty = p_futu_qty;
    SET v_basket_qty = p_basket_qty;
    SET v_hedging_pankou = p_hedging_pankou;
    SET v_futu_price_offset = p_futu_price_offset;
    SET v_price_offset = p_price_offset;
    SET v_target_base_diff = p_target_base_diff;
    SET v_template_base_diff = p_template_base_diff;
    SET v_up_value_ratio = p_up_value_ratio;
    SET v_down_value_ratio = p_down_value_ratio;
    SET v_stop_value_ratio = p_stop_value_ratio;
    SET v_cash_replace_amt = p_cash_replace_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_用户_期现对冲方案信息表][{期货手数}=@期货手数#,{对冲计划名称}=@对冲计划名称#,{篮子数量}=@篮子数量#,{对冲盘口}=@对冲盘口#,{期货价格偏移量}=@期货价格偏移量#,{价格偏移量}=@价格偏移量#,{标的基差}=@标的基差#,{模板基差}=@模板基差#,{现货涨停市值比例}=@现货涨停市值比例#,{现货跌停市值比例}=@现货跌停市值比例#,{现货停牌市值比例}=@现货停牌市值比例#,{现金替代金额}=@现金替代金额#,{备注信息}=@备注信息#][{记录序号}=@记录序号# ][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_fuse_plan_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, futu_qty=v_futu_qty,hedg_plan_name=v_hedg_plan_name,basket_qty=v_basket_qty,hedging_pankou=v_hedging_pankou,futu_price_offset=v_futu_price_offset,price_offset=v_price_offset,target_base_diff=v_target_base_diff,template_base_diff=v_template_base_diff,up_value_ratio=v_up_value_ratio,down_value_ratio=v_down_value_ratio,stop_value_ratio=v_stop_value_ratio,cash_replace_amt=v_cash_replace_amt,remark_info=v_remark_info where row_id=v_row_id ;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.402.2";
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

# 原子_公共_用户客户端_删除期现对冲方案信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_DeleteFutuSecuHedgPlanInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_DeleteFutuSecuHedgPlanInfo(
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
    

    /* [删除表记录][公共_用户_期现对冲方案信息表][{记录序号}=@记录序号#][3][@记录序号#] */
    delete from db_pub.tb_user_opor_fuse_plan_info 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.19.403.3";
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

# 原子_公共_用户客户端_查询期现对冲方案信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryFutuSecuHedgPlanInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryFutuSecuHedgPlanInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_comm_trd_type int,
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
    declare v_comm_trd_type int;
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
    SET v_comm_trd_type = p_comm_trd_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][公共_用户_期现对冲方案信息表][{记录序号},{指令交易标志},{对冲计划名称},{操作员编号},{机构编号},{合约代码编号},{期货手数},{篮子数量},{篮子序号},{监控类型},{对冲组合编号},{对冲盘口},{期货价格偏移量},{价格偏移量},{标的基差},{模板基差},{现货涨停市值比例},{现货跌停市值比例},{现货停牌市值比例},{现金替代金额},{备注信息}][ ({机构编号}=@操作员机构编号#) and (@指令交易标志#=0 or {指令交易标志}= @指令交易标志# ) and ({操作员编号} = @查询操作员编号# or @查询操作员编号# = 0)] */
    select row_id,comm_trd_type,hedg_plan_name,opor_no,co_no,contrc_code_no,futu_qty,basket_qty,basket_id,plan_type,hedg_no,hedging_pankou,futu_price_offset,price_offset,target_base_diff,template_base_diff,up_value_ratio,down_value_ratio,stop_value_ratio,cash_replace_amt,remark_info from db_pub.tb_user_opor_fuse_plan_info where  (co_no=v_opor_co_no) and (v_comm_trd_type=0 or comm_trd_type= v_comm_trd_type ) and (opor_no = v_query_opor_no or v_query_opor_no = 0);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_新增操作员可设置操作员
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_AddOporAllowSetOpor;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_AddOporAllowSetOpor(
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
    IN p_allow_opor_no int,
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
    declare v_allow_opor_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_allow_opor_no = p_allow_opor_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_opor_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    
    #set @操作权限# = 《操作权限-管理》;
    #[获取表记录变量][公共_用户_操作员信息表][{操作员状态}][@操作员状态#][{操作员编号}=@可操作操作员编号#][4][@可操作操作员编号#]

    /* set @临时_操作员编号# = @操作员编号#; */
    set v_tmp_opor_no = v_opor_no;

    /* set @操作员编号# = @目标操作员编号#; */
    set v_opor_no = v_target_opor_no;

    /* [插入表记录][公共_用户_操作员可设置操作员表][字段][字段变量][1][@目标操作员编号#,@可操作操作员编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_allowset_opor(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        allow_opor_no) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_co_no, 
        v_allow_opor_no);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.501.1";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no,",","可操作操作员编号=",v_allow_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @操作员编号# = @临时_操作员编号#; */
    set v_opor_no = v_tmp_opor_no;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_用户_操作员可设置操作员流水表][字段][字段变量][5][@目标操作员编号#,@可操作操作员编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_allowset_opor_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, target_opor_no, 
        co_no, allow_opor_no, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_target_opor_no, 
        v_co_no, v_allow_opor_no, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.501.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no,",","可操作操作员编号=",v_allow_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_删除操作员可设置操作员
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_DeleteOporAllowSetOpor;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_DeleteOporAllowSetOpor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_target_opor_no int,
    IN p_allow_opor_no int,
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
    declare v_allow_opor_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
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
    SET v_allow_opor_no = p_allow_opor_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_用户_操作员可设置操作员表][{机构编号}][@机构编号#][{操作员编号} = @目标操作员编号# and {可操作操作员编号} = @可操作操作员编号#] */
    select co_no into v_co_no from db_pub.tb_user_opor_allowset_opor where opor_no = v_target_opor_no and allow_opor_no = v_allow_opor_no limit 1;


    /* [检查正常返回][FOUND_ROWS() = 0] */
    if FOUND_ROWS() = 0 then
        leave label_pro;
    end if;


    /* [删除表记录][公共_用户_操作员可设置操作员表][{操作员编号} = @目标操作员编号# and {可操作操作员编号} = @可操作操作员编号#][3][@目标操作员编号#,@可操作操作员编号#] */
    delete from db_pub.tb_user_opor_allowset_opor 
        where opor_no = v_target_opor_no and allow_opor_no = v_allow_opor_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pubA.19.502.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标操作员编号=",v_target_opor_no,",","可操作操作员编号=",v_allow_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标操作员编号=",v_target_opor_no,",","可操作操作员编号=",v_allow_opor_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][公共_用户_操作员可设置操作员流水表][字段][字段变量][5][@目标操作员编号#,@可操作操作员编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_opor_allowset_opor_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, target_opor_no, 
        co_no, allow_opor_no, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_target_opor_no, 
        v_co_no, v_allow_opor_no, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.502.5";
        SET v_error_info =  CONCAT(concat("目标操作员编号=",v_target_opor_no,",","可操作操作员编号=",v_allow_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询操作员可设置操作员
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryOporAllowSetOpor;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryOporAllowSetOpor(
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
    

    /* [获取表记录][公共_用户_操作员可设置操作员表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{操作员编号},{可操作操作员编号}][{机构编号}=@操作员机构编号# and (@查询操作员编号# = 0 or {操作员编号}=@查询操作员编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,opor_no,allow_opor_no from db_pub.tb_user_opor_allowset_opor where co_no=v_opor_co_no and (v_query_opor_no = 0 or opor_no=v_query_opor_no) and row_id > v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,opor_no,allow_opor_no from db_pub.tb_user_opor_allowset_opor where co_no=v_opor_co_no and (v_query_opor_no = 0 or opor_no=v_query_opor_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_更新操作员可设置操作员注销标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_UpdateOporAllowSetOporAbolishStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_UpdateOporAllowSetOporAbolishStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_allow_opor_no int,
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
    declare v_allow_opor_no int;
    declare v_opor_status varchar(2);
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
    SET v_allow_opor_no = p_allow_opor_no;
    SET v_opor_status = p_opor_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_用户_操作员可设置操作员表][{操作员状态}=@操作员状态#][{可操作操作员编号}=@可操作操作员编号#][2][@可操作操作员编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_allowset_opor set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, opor_status=v_opor_status where allow_opor_no=v_allow_opor_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.504.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("可操作操作员编号=",v_allow_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("可操作操作员编号=",v_allow_opor_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_获取单条交易组历史资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_GetExgpGroupAsset_His;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_GetExgpGroupAsset_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_group_no int,
    IN p_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_begin_NAV decimal(18,4),
    OUT p_nav_asset decimal(18,4),
    OUT p_total_cash_asset decimal(18,4),
    OUT p_stock_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_futu_asset decimal(18,4),
    OUT p_repo_asset decimal(18,4),
    OUT p_other_asset decimal(18,4),
    OUT p_hk_thrgh_stock_asset decimal(18,4)
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
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_begin_NAV decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_total_cash_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_stock_cash_asset decimal(18,4);
    declare v_futu_cash_asset decimal(18,4);
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_total_realiz_pandl decimal(18,4);
    declare v_many_days_total_asset decimal(18,4);
    declare v_stat_days int;
    declare v_begin_evalu_nav_asset decimal(18,4);
    declare v_evalu_nav_asset decimal(18,4);
    declare v_total_fina_debt decimal(18,4);
    declare v_total_loan_debt decimal(18,4);
    declare v_exch_crncy_type varchar(3);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_begin_NAV = 0;
    SET v_nav_asset = 0;
    SET v_total_cash_asset = 0;
    SET v_stock_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_futu_asset = 0;
    SET v_repo_asset = 0;
    SET v_other_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_stock_cash_asset = 0;
    SET v_futu_cash_asset = 0;
    SET v_money_fund_asset = 0;
    SET v_not_money_fund_asset = 0;
    SET v_total_realiz_pandl = 0;
    SET v_many_days_total_asset = 0;
    SET v_stat_days = 0;
    SET v_begin_evalu_nav_asset = 0;
    SET v_evalu_nav_asset = 0;
    SET v_total_fina_debt = 0;
    SET v_total_loan_debt = 0;
    SET v_exch_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_历史交易组资产表][字段][字段变量][{初始化日期} = @初始化日期# and  (@交易组编号# = 0 or {交易组编号}=@交易组编号#)  and (@本币币种# = " " or {本币币种}=@本币币种#)][1][@初始化日期#,@交易组编号#,@交易币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, crncy_type, 
        begin_NAV, nav_asset, total_cash_asset, stock_cash_asset, 
        futu_cash_asset, stock_asset, fund_asset, money_fund_asset, 
        not_money_fund_asset, bond_asset, futu_asset, repo_asset, 
        other_asset, hk_thrgh_stock_asset, total_realiz_pandl, many_days_total_asset, 
        stat_days, begin_evalu_nav_asset, evalu_nav_asset, total_fina_debt, 
        total_loan_debt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_crncy_type, 
        v_begin_NAV, v_nav_asset, v_total_cash_asset, v_stock_cash_asset, 
        v_futu_cash_asset, v_stock_asset, v_fund_asset, v_money_fund_asset, 
        v_not_money_fund_asset, v_bond_asset, v_futu_asset, v_repo_asset, 
        v_other_asset, v_hk_thrgh_stock_asset, v_total_realiz_pandl, v_many_days_total_asset, 
        v_stat_days, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_total_fina_debt, 
        v_total_loan_debt from db_pub_his.tb_user_exch_group_asset_his where init_date = v_init_date and  (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and (v_crncy_type = " " or crncy_type=v_crncy_type) limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.19.505.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","交易币种=",v_exch_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_begin_NAV = v_begin_NAV;
    SET p_nav_asset = v_nav_asset;
    SET p_total_cash_asset = v_total_cash_asset;
    SET p_stock_asset = v_stock_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_futu_asset = v_futu_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_other_asset = v_other_asset;
    SET p_hk_thrgh_stock_asset = v_hk_thrgh_stock_asset;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_获取注销交易组串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_GetCancelExgpStr;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_GetCancelExgpStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_no_str varchar(2048)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no_str varchar(2048);
    declare v_mach_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no_str = " ";
    SET v_mach_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@机器日期#] */
    select date_format(curdate(),'%Y%m%d') into v_mach_date;


    /* SELECT GROUP_CONCAT({交易组编号} SEPARATOR ";")  into @交易组编号串# FROM  ~公共_用户_交易组信息表^ WHERE {机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and {交易组状态}=《交易组状态-注销》 and {注销日期}<@机器日期#; */
    SELECT GROUP_CONCAT(exch_group_no SEPARATOR ";")  into v_exch_group_no_str FROM  db_pub.tb_user_exch_group_info WHERE co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and exch_group_status="3" and abolish_date<v_mach_date;

    /* set @交易组编号串#=concat(";",@交易组编号串#,";"); */
    set v_exch_group_no_str=concat(";",v_exch_group_no_str,";");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no_str = v_exch_group_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_查询基金产品行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_QueryFundPdQuot;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_QueryFundPdQuot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数# = -1  then */
    if v_row_count = -1  then

        /* select  a.*,ifnull(b.{最新价},0) AS {最新价}  from ~公共_证券基础数据_基金产品对照表^ a  left join ~公共_证券基础数据_证券行情表^  b on  a.{证券代码编号}=b.{证券代码编号}  where (@市场编号#=0 or a.{市场编号}=@市场编号#) and (@证券代码#=" " or a.{证券代码}=@证券代码#) and  a.{机构编号}=@机构编号# and (@产品编号#=0 or a.{产品编号}=@产品编号#) and a.{记录序号}>@记录序号#; */
        select  a.*,ifnull(b.last_price,0) AS last_price  from db_pub.tb_basesedt_fund_pd_comparision a  left join db_pub.tb_basesedt_stock_quot  b on  a.stock_code_no=b.stock_code_no  where (v_exch_no=0 or a.exch_no=v_exch_no) and (v_stock_code=" " or a.stock_code=v_stock_code) and  a.co_no=v_co_no and (v_pd_no=0 or a.pd_no=v_pd_no) and a.row_id>v_row_id;
    else

        /* select  a.*,ifnull(b.{最新价},0) AS {最新价}  from ~公共_证券基础数据_基金产品对照表^ a  left join ~公共_证券基础数据_证券行情表^  b on  a.{证券代码编号}=b.{证券代码编号}  where (@市场编号#=0 or a.{市场编号}=@市场编号#) and (@证券代码#=" " or a.{证券代码}=@证券代码#) and  a.{机构编号}=@机构编号# and (@产品编号#=0 or a.{产品编号}=@产品编号#) and a.{记录序号}>@记录序号#  limit  @指定行数#; */
        select  a.*,ifnull(b.last_price,0) AS last_price  from db_pub.tb_basesedt_fund_pd_comparision a  left join db_pub.tb_basesedt_stock_quot  b on  a.stock_code_no=b.stock_code_no  where (v_exch_no=0 or a.exch_no=v_exch_no) and (v_stock_code=" " or a.stock_code=v_stock_code) and  a.co_no=v_co_no and (v_pd_no=0 or a.pd_no=v_pd_no) and a.row_id>v_row_id  limit  v_row_count;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_用户客户端_修改操作员索引值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_ModiOporIndex;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_ModiOporIndex(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_target_opor_no int,
    IN p_index_value int,
    IN p_oper_remark_info varchar(255),
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
    declare v_target_opor_no int;
    declare v_index_value int;
    declare v_oper_remark_info varchar(255);
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
    SET v_co_no = p_co_no;
    SET v_target_opor_no = p_target_opor_no;
    SET v_index_value = p_index_value;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_用户_操作员信息表][{索引值}=@索引值#][{操作员编号}=@目标操作员编号#][2][@目标操作员编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_opor_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, index_value=v_index_value where opor_no=v_target_opor_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.19.508.2";
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

# 原子_公共_用户客户端_重置操作员登录错误次数
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_userclient_ResetLoginErrorCount;;
DELIMITER ;;
CREATE PROCEDURE pra_userclient_ResetLoginErrorCount(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_target_opor_no int,
    IN p_query_oper_way varchar(2),
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
    declare v_query_oper_way varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_login_error_count int;
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
    SET v_target_opor_no = p_target_opor_no;
    SET v_query_oper_way = p_query_oper_way;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_login_error_count = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #[获取表记录变量][公共_用户_操作员信息表][{机构编号},{操作员名称},{操作员类型},{操作员密码},{操作权限},{是否交易员},{交易员编号},{允许操作IP},{允许操作MAC},{允许登录方式},{操作员状态}][@机构编号#, @操作员名称#, @操作员类型#, @操作员密码#, @操作权限#, @是否交易员#, @交易员编号#, @允许操作IP#, @允许操作MAC#, @允许登录方式#,@操作员状态#][{操作员编号}=@操作员编号#][65][@操作员编号#]
    #[检查报错返回][@操作员状态# = 《操作员状态-冻结》][61][@操作员编号#]
    #[检查报错返回][@操作员状态# = 《操作员状态-注销》][62][@操作员编号#]

    /* set @登录错误次数# = 0; */
    set v_login_error_count = 0;
    #默认更新 管理端 和 投资端 次数。

    /* if @查询操作方式# = " "  then */
    if v_query_oper_way = " "  then

        /* [更新表记录][公共_用户_操作员登录信息表][{登录错误次数} = @登录错误次数#][{操作员编号}=@目标操作员编号# and {操作方式}=《操作方式-交易端》][2][@操作员编号#,@查询操作方式#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pub.tb_user_opor_login_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, login_error_count = v_login_error_count where opor_no=v_target_opor_no and oper_way="1";
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.19.509.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","查询操作方式=",v_query_oper_way),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no,",","查询操作方式=",v_query_oper_way);
            end if;
            leave label_pro;
        end if;


        /* [更新表记录][公共_用户_操作员登录信息表][{登录错误次数} = @登录错误次数#][{操作员编号}=@目标操作员编号# and {操作方式}=《操作方式-管理端》][2][@操作员编号#,@查询操作方式#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pub.tb_user_opor_login_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, login_error_count = v_login_error_count where opor_no=v_target_opor_no and oper_way="2";
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.19.509.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","查询操作方式=",v_query_oper_way),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no,",","查询操作方式=",v_query_oper_way);
            end if;
            leave label_pro;
        end if;

    else

        /* [更新表记录][公共_用户_操作员登录信息表][{登录错误次数} = @登录错误次数#][{操作员编号}=@目标操作员编号# and {操作方式}=@查询操作方式#][2][@操作员编号#,@查询操作方式#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pub.tb_user_opor_login_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, login_error_count = v_login_error_count where opor_no=v_target_opor_no and oper_way=v_query_oper_way;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.19.509.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","查询操作方式=",v_query_oper_way),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no,",","查询操作方式=",v_query_oper_way);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


