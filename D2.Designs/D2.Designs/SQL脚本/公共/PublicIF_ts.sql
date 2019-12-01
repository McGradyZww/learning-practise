DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOper;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取操作员操作权限串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetOperatorOperRights;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetOperatorOperRights(
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
    

    /* 调用【原子_公共_用户_获取操作员操作权限串】*/
    call db_pub.pra_user_GetOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_ctrl_str,
        v_error_code,
        v_error_info,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员操作权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
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

# 事务_公共_公共接口_检查系统状态权限身份获取操作员权限串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperRightsStr;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperRightsStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_busi_ctrl_str varchar(64),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
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
    declare v_menu_no int;
    declare v_busi_ctrl_str varchar(64);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_busi_ctrl_str = p_busi_ctrl_str;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_co_no_rights_str = " ";
    SET v_pd_no_rights_str = " ";
    SET v_exch_group_no_rights_str = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_获取操作员操作权限串】*/
    call db_pub.pra_user_GetOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_ctrl_str,
        v_error_code,
        v_error_info,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员操作权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_co_no_rights_str = v_co_no_rights_str;
    SET p_pd_no_rights_str = v_pd_no_rights_str;
    SET p_exch_group_no_rights_str = v_exch_group_no_rights_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份交易组操作权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperExgpRights;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperExgpRights(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_exgp_busi_config_str varchar(64);
    declare v_trade_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_trade_acco = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份默认交易组编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperDefaultExgpNo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperDefaultExgpNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_pd_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
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
    declare v_menu_no int;
    declare v_pd_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_exch_group_no int;
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_pd_no = p_pd_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_exch_group_no = 0;
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_获取产品默认交易组编号】*/
    call db_pub.pra_user_GetCoDefaultExchGroupNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_exch_group_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取产品默认交易组编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_exch_group_no = v_exch_group_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份操作员状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperOporStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperOporStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_target_opor_no int,
    IN p_opor_status varchar(2),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_target_opor_no int;
    declare v_opor_status varchar(2);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_target_opor_no = p_target_opor_no;
    SET v_opor_status = p_opor_status;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员状态】*/
    call db_pub.pra_user_CheckOperatorStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_opor_status,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份市场
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperExch;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperExch(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_co_no int,
    IN p_exch_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_co_no int;
    declare v_exch_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_co_no = p_co_no;
    SET v_exch_no = p_exch_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_基础_检查市场状态】*/
    call db_pub.pra_base_CheckMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_crncy_type,
        v_exch_crncy_type,
        v_exch_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份机构状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperCoStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperCoStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_co_no int,
    IN p_co_status varchar(2),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_co_no int;
    declare v_co_status varchar(2);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_co_no = p_co_no;
    SET v_co_status = p_co_status;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_基础_检查机构状态】*/
    call db_pub.pra_base_CheckOperatorStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_co_status,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查机构状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份交易组状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperExchGroupStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperExchGroupStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_group_no int,
    IN p_exch_group_status varchar(2),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_group_no int;
    declare v_exch_group_status varchar(2);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_group_status = p_exch_group_status;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查交易组状态】*/
    call db_pub.pra_user_CheckExchGroupStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_group_status,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份操作员产品操作权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperProdOperRights;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperProdOperRights(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_pd_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_pd_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_pd_no = p_pd_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员产品操作权限】*/
    call db_pub.pra_user_CheckOperatorProdOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.10.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员产品操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份交易组操作权限代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperExgpRightsCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperExgpRightsCodeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_stock_code_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_stock_type int,
    OUT p_asset_type int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_stock_code_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_exch_no int;
    declare v_exgp_busi_config_str varchar(64);
    declare v_trade_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_exch_no = 0;
    SET v_exgp_busi_config_str = " ";
    SET v_trade_acco = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @市场编号# = 0; */
    set v_exch_no = 0;

    /* set @证券类型# = 0; */
    set v_stock_type = 0;

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_证券基础数据_获取证券类型资产类型】*/
    call db_pub.pra_basesedt_GetStockTypeAssetType(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_stock_type,
        v_asset_type);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券类型资产类型出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份操作员产品操作权限代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperProdOperRightsCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperProdOperRightsCodeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_pd_no int,
    IN p_stock_code_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_stock_type int,
    OUT p_asset_type int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_pd_no int;
    declare v_stock_code_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_pd_no = p_pd_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员产品操作权限】*/
    call db_pub.pra_user_CheckOperatorProdOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员产品操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_证券基础数据_获取证券类型资产类型】*/
    call db_pub.pra_basesedt_GetStockTypeAssetType(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_stock_type,
        v_asset_type);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券类型资产类型出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查市场状态权限身份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckMarketStatusAuthOper;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckMarketStatusAuthOper(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_stock_type int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_crncy_type varchar(3)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_stock_type int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_crncy_type varchar(3);
    declare v_sys_config_str varchar(64);
    declare v_co_busi_config_str varchar(64);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_trade_date int;
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_exgp_busi_config_str varchar(64);
    declare v_trade_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no = p_exch_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_type = p_stock_type;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_crncy_type = "CNY";
    SET v_sys_config_str = " ";
    SET v_co_busi_config_str = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_trade_acco = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_基础_检查市场状态】*/
    call db_pub.pra_base_CheckMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_crncy_type,
        v_exch_crncy_type,
        v_exch_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @交易日期# = @初始化日期#; */
    set v_trade_date = v_init_date;

    /* 调用【原子_公共_基础_检查交易日期时间】*/
    call db_pub.pra_base_CheckExchDateTime(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_trade_date,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查交易日期时间出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_crncy_type = v_crncy_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份获取数量上限
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperGetMaxQty;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperGetMaxQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_co_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_pd_qty_max int,
    OUT p_max_acco_count int,
    OUT p_opor_qty_max int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_co_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_pd_qty_max int;
    declare v_max_acco_count int;
    declare v_opor_qty_max int;
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_co_no = p_co_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_pd_qty_max = 0;
    SET v_max_acco_count = 0;
    SET v_opor_qty_max = 0;
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_基础_获取数量上限】*/
    call db_pub.pra_base_GetMaxQty(
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
        v_pd_qty_max,
        v_max_acco_count,
        v_opor_qty_max);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取数量上限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_pd_qty_max = v_pd_qty_max;
    SET p_max_acco_count = v_max_acco_count;
    SET p_opor_qty_max = v_opor_qty_max;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取可操作操作员编号串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetAllowOporNoStr;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetAllowOporNoStr(
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
    

    /* 调用【原子_公共_用户_获取可操作操作员编号串】*/
    call db_pub.pra_user_GetAllowOporNoStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_allow_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.15.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取可操作操作员编号串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_allow_opor_no_str = v_allow_opor_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份操作员可操作操作员权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthAllowOporRights;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthAllowOporRights(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
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
    declare v_menu_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_allow_opor_no_str varchar(2048);
    declare v_sys_config_str varchar(64);
    declare v_co_busi_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
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
    SET v_menu_no = p_menu_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_allow_opor_no_str = " ";
    SET v_sys_config_str = " ";
    SET v_co_busi_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_target_opor_no = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.16.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.16.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.16.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号# = @操作员编号#; */
    set v_target_opor_no = v_opor_no;

    /* 调用【原子_公共_用户_获取可操作操作员编号串】*/
    call db_pub.pra_user_GetAllowOporNoStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_allow_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.16.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取可操作操作员编号串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_allow_opor_no_str = v_allow_opor_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份操作员产品操作权限合约信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperProdOperRightsContrcInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperProdOperRightsContrcInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_pd_no int,
    IN p_contrc_code_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_contrc_type int,
    OUT p_asset_type int,
    OUT p_contrc_unit int,
    OUT p_pre_settle_price decimal(16,9),
    OUT p_sett_price decimal(16,9),
    OUT p_comb_code varchar(6)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_pd_no int;
    declare v_contrc_code_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_contrc_unit int;
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_comb_code varchar(6);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_exch_no int;
    declare v_contrc_code varchar(6);
    declare v_comb_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_pd_no = p_pd_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_contrc_unit = 0;
    SET v_pre_settle_price = 0;
    SET v_sett_price = 0;
    SET v_comb_code = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_exch_no = 0;
    SET v_contrc_code = " ";
    SET v_comb_type = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.17.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.17.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.17.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员产品操作权限】*/
    call db_pub.pra_user_CheckOperatorProdOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.17.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员产品操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_期货基础数据_获取编号持仓属性】*/
    call db_pub.pra_basefudt_GetContrcNoPosiInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_contrc_code_no,
        v_error_code,
        v_error_info,
        v_exch_no,
        v_contrc_code,
        v_contrc_type,
        v_asset_type,
        v_contrc_unit,
        v_sett_price,
        v_pre_settle_price);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.17.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货基础数据_获取编号持仓属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @市场编号#<100 then */
    if v_exch_no<100 then

        /* 调用【原子_公共_公共接口_获取保证金优惠组合编码】*/
        call db_pub.pra_pubif_GetCombinationCode(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_contrc_type,
            v_contrc_code,
            v_error_code,
            v_error_info,
            v_comb_code,
            v_comb_type);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取保证金优惠组合编码出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_contrc_type = v_contrc_type;
    SET p_asset_type = v_asset_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_sett_price = v_sett_price;
    SET p_comb_code = v_comb_code;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份交易组操作权限合约信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperExgpRightsContrcInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperExgpRightsContrcInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_contrc_code_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_contrc_type int,
    OUT p_asset_type int,
    OUT p_contrc_unit int,
    OUT p_sett_price decimal(16,9),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_comb_code varchar(6)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_contrc_code_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_contrc_unit int;
    declare v_sett_price decimal(16,9);
    declare v_pre_settle_price decimal(16,9);
    declare v_comb_code varchar(6);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_exgp_busi_config_str varchar(64);
    declare v_trade_acco varchar(32);
    declare v_contrc_code varchar(6);
    declare v_comb_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_contrc_unit = 0;
    SET v_sett_price = 0;
    SET v_pre_settle_price = 0;
    SET v_comb_code = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_exch_no = 0;
    SET v_stock_type = 0;
    SET v_exgp_busi_config_str = " ";
    SET v_trade_acco = " ";
    SET v_contrc_code = " ";
    SET v_comb_type = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.18.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.18.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.18.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.18.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @市场编号# = 0; */
    set v_exch_no = 0;

    /* set @证券类型# = 0; */
    set v_stock_type = 0;

    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.18.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_期货基础数据_获取编号持仓属性】*/
    call db_pub.pra_basefudt_GetContrcNoPosiInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_contrc_code_no,
        v_error_code,
        v_error_info,
        v_exch_no,
        v_contrc_code,
        v_contrc_type,
        v_asset_type,
        v_contrc_unit,
        v_sett_price,
        v_pre_settle_price);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.18.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货基础数据_获取编号持仓属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @市场编号#<100 then */
    if v_exch_no<100 then

        /* 调用【原子_公共_公共接口_获取保证金优惠组合编码】*/
        call db_pub.pra_pubif_GetCombinationCode(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_contrc_type,
            v_contrc_code,
            v_error_code,
            v_error_info,
            v_comb_code,
            v_comb_type);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.18.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取保证金优惠组合编码出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_contrc_type = v_contrc_type;
    SET p_asset_type = v_asset_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_sett_price = v_sett_price;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_comb_code = v_comb_code;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态身份
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAndOper;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAndOper(
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
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64)
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
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.19.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.19.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态身份获取操作员权限串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusOperRightsStr;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusOperRightsStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_ctrl_str varchar(64),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
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
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_co_no_rights_str = " ";
    SET v_pd_no_rights_str = " ";
    SET v_exch_group_no_rights_str = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_获取操作员操作权限串】*/
    call db_pub.pra_user_GetOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_ctrl_str,
        v_error_code,
        v_error_info,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员操作权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_co_no_rights_str = v_co_no_rights_str;
    SET p_pd_no_rights_str = v_pd_no_rights_str;
    SET p_exch_group_no_rights_str = v_exch_group_no_rights_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份交易组状态获取默认交易组编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckStatusGetDefaultExchGroup;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckStatusGetDefaultExchGroup(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_group_no int,
    IN p_exch_group_status varchar(2),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
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
    declare v_menu_no int;
    declare v_exch_group_no int;
    declare v_exch_group_status varchar(2);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_pd_no int;
    declare v_default_exch_group_no int;
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_group_status = p_exch_group_status;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_pd_no = 0;
    SET v_default_exch_group_no = 0;
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查交易组状态】*/
    call db_pub.pra_user_CheckExchGroupStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_group_status,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_交易组获取产品默认交易组编号】*/
    call db_pub.pra_user_GetCoDefaultExchGroup(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_default_exch_group_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_交易组获取产品默认交易组编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_pd_no = v_pd_no;
    SET p_default_exch_group_no = v_default_exch_group_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态身份获取操作员权限串证券代码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusOperRightsStrStockCodeNum;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusOperRightsStrStockCodeNum(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_busi_ctrl_str varchar(64),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_co_no_rights_str varchar(2048),
    OUT p_pd_no_rights_str varchar(2048),
    OUT p_exch_group_no_rights_str varchar(2048),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_par_value decimal(16,9)
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
    declare v_busi_ctrl_str varchar(64);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_busi_ctrl_str = p_busi_ctrl_str;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_co_no_rights_str = " ";
    SET v_pd_no_rights_str = " ";
    SET v_exch_group_no_rights_str = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_获取操作员操作权限串】*/
    call db_pub.pra_user_GetOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_ctrl_str,
        v_error_code,
        v_error_info,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员操作权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_证券基础数据_获取证券代码编号】*/
    call db_pub.pra_basesedt_GetStockCodeNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_par_value);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_co_no_rights_str = v_co_no_rights_str;
    SET p_pd_no_rights_str = v_pd_no_rights_str;
    SET p_exch_group_no_rights_str = v_exch_group_no_rights_str;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_par_value = v_par_value;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份获取证券代码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperGetStockCodeNum;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperGetStockCodeNum(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_par_value decimal(16,9)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.23.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.23.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.23.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_证券基础数据_获取证券代码编号】*/
    call db_pub.pra_basesedt_GetStockCodeNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_par_value);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.23.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_par_value = v_par_value;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_更新交易组历史资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_UpdateExchGroupAssetHis;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_UpdateExchGroupAssetHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_target_exch_group_no int,
    IN p_occur_qty decimal(18,2),
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_target_exch_group_no int;
    declare v_occur_qty decimal(18,2);
    declare v_begin_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_target_exch_group_no = p_target_exch_group_no;
    SET v_occur_qty = p_occur_qty;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_公共接口_更新交易组历史资产】*/
        call db_pub.pra_pubif_UpdateExchGroupAssetHis(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_menu_no,
            v_exch_no,
            v_stock_code,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_target_exch_group_no,
            v_occur_qty,
            v_begin_date,
            v_error_code,
            v_error_info,
            v_stock_code_no);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.24.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_更新交易组历史资产出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取已兑付债券
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetPaidBonds;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetPaidBonds(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_sys_config_str varchar(64);
    declare v_co_busi_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_stock_code_str varchar(4096);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_config_str = " ";
    SET v_co_busi_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_stock_code_str = " ";

    
    label_pro:BEGIN
    
    #该功能已不使用

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
        SET v_error_code = "pubT.24.30.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.30.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.30.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_公共接口_获取已兑付债券】*/
    call db_pub.pra_pubif_GetPaidBonds(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_error_code,
        v_error_info,
        v_stock_code_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.30.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取已兑付债券出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_判断债券是否兑付
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckIfBondPaid;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckIfBondPaid(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_valid_flag int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_valid_flag int;
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_valid_flag = 0;
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份无密码】*/
    call db_pub.pra_user_CheckOperatorAuthNoPwd(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份无密码出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_公共接口_判断债券是否兑付】*/
    call db_pub.pra_pubif_CheckIfBondPaid(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_exch_no,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_valid_flag);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_判断债券是否兑付出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_valid_flag = v_valid_flag;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetStockCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetStockCodeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code varchar(6),
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_par_value decimal(16,9),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_total_stock_issue decimal(18,2),
    OUT p_circl_stock_capit decimal(18,2),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_type_unit int,
    OUT p_report_unit int,
    OUT p_min_unit int,
    OUT p_max_qty decimal(18,2),
    OUT p_min_qty decimal(18,2),
    OUT p_is_order_dir_flag int,
    OUT p_price_up decimal(16,9),
    OUT p_price_down decimal(16,9),
    OUT p_step_price decimal(16,9),
    OUT p_stop_status varchar(2),
    OUT p_hk_stock_flag int
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
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_total_stock_issue decimal(18,2);
    declare v_circl_stock_capit decimal(18,2);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_type_unit int;
    declare v_report_unit int;
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_is_order_dir_flag int;
    declare v_price_up decimal(16,9);
    declare v_price_down decimal(16,9);
    declare v_step_price decimal(16,9);
    declare v_stop_status varchar(2);
    declare v_hk_stock_flag int;
    declare v_stock_name varchar(64);
    declare v_pinyin_short varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_total_stock_issue = 0;
    SET v_circl_stock_capit = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_type_unit = 0;
    SET v_report_unit = 0;
    SET v_min_unit = 0;
    SET v_max_qty = 0;
    SET v_min_qty = 0;
    SET v_is_order_dir_flag = 0;
    SET v_price_up = 0;
    SET v_price_down = 0;
    SET v_step_price = 0;
    SET v_stop_status = "0";
    SET v_hk_stock_flag = 0;
    SET v_stock_name = " ";
    SET v_pinyin_short = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_获取证券代码信息】*/
        call db_pub.pra_basesedt_GetStockCodeInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_stock_code_no,
            v_exch_no,
            v_error_code,
            v_error_info,
            v_stock_code,
            v_stock_name,
            v_pinyin_short,
            v_stock_type,
            v_asset_type,
            v_par_value,
            v_crncy_type,
            v_exch_crncy_type,
            v_total_stock_issue,
            v_circl_stock_capit,
            v_capit_reback_days,
            v_posi_reback_days,
            v_type_unit,
            v_report_unit,
            v_min_unit,
            v_max_qty,
            v_min_qty,
            v_is_order_dir_flag,
            v_price_up,
            v_price_down,
            v_step_price,
            v_stop_status,
            v_hk_stock_flag);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.32.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code = v_stock_code;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_par_value = v_par_value;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_total_stock_issue = v_total_stock_issue;
    SET p_circl_stock_capit = v_circl_stock_capit;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_type_unit = v_type_unit;
    SET p_report_unit = v_report_unit;
    SET p_min_unit = v_min_unit;
    SET p_max_qty = v_max_qty;
    SET p_min_qty = v_min_qty;
    SET p_is_order_dir_flag = v_is_order_dir_flag;
    SET p_price_up = v_price_up;
    SET p_price_down = v_price_down;
    SET p_step_price = v_step_price;
    SET p_stop_status = v_stop_status;
    SET p_hk_stock_flag = v_hk_stock_flag;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_更新交易组资产估值份额
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_UpdateExgpAssetShare;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_UpdateExgpAssetShare(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_evalu_share decimal(18,2),
    IN p_evalu_nav_asset decimal(18,4),
    IN p_begin_evalu_nav_asset decimal(18,4),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_no int,
    OUT p_init_date int
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
    declare v_evalu_share decimal(18,2);
    declare v_evalu_nav_asset decimal(18,4);
    declare v_begin_evalu_nav_asset decimal(18,4);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no int;
    declare v_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_share = p_evalu_share;
    SET v_evalu_nav_asset = p_evalu_nav_asset;
    SET v_begin_evalu_nav_asset = p_begin_evalu_nav_asset;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础_获取系统初始化日期】*/
        call db_pub.pra_base_GetSysInitDate(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info,
            v_init_date);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.33.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取系统初始化日期出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_公共_公共接口_更新交易组资产估值份额】*/
        call db_pub.pra_pubif_UpdateExgpAssetShare(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pd_no,
            v_evalu_share,
            v_evalu_nav_asset,
            v_begin_evalu_nav_asset,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_exch_group_no);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.33.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_更新交易组资产估值份额出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;
    SET p_init_date = v_init_date;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份更新份额
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperUpdateShare;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperUpdateShare(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_occur_share decimal(18,2),
    IN p_oper_remark_info varchar(255),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_pd_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_exch_group_code varchar(32),
    OUT p_exch_group_name varchar(64),
    OUT p_exch_group_status varchar(2),
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
    declare v_menu_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_occur_share decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_exch_group_code varchar(32);
    declare v_exch_group_name varchar(64);
    declare v_exch_group_status varchar(2);
    declare v_exch_group_begin_NAV decimal(18,4);
    declare v_exch_group_pd_share decimal(18,2);
    declare v_update_times int;
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_exgp_busi_config_str varchar(64);
    declare v_trade_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_occur_share = p_occur_share;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_exch_group_code = " ";
    SET v_exch_group_name = " ";
    SET v_exch_group_status = "0";
    SET v_exch_group_begin_NAV = 0;
    SET v_exch_group_pd_share = 0;
    SET v_update_times = 1;
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_trade_acco = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员操作权限】*/
    call db_pub.pra_user_CheckOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_group_no,
        v_oper_rights,
        v_error_code,
        v_error_info,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查交易组操作权限】*/
    call db_pub.pra_user_CheckExchGroupOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_no,
        v_stock_type,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_exgp_busi_config_str,
        v_trade_acco);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组操作权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_公共接口_更新交易组份额】*/
    call db_pub.pra_pubif_UpdateExgpShare(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_occur_share,
        v_menu_no,
        v_oper_remark_info,
        v_error_code,
        v_error_info,
        v_exch_group_code,
        v_exch_group_name,
        v_exch_group_status,
        v_exch_group_begin_NAV,
        v_exch_group_pd_share,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_更新交易组份额出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_pd_no = v_pd_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_exch_group_code = v_exch_group_code;
    SET p_exch_group_name = v_exch_group_name;
    SET p_exch_group_status = v_exch_group_status;
    SET p_exch_group_begin_NAV = v_exch_group_begin_NAV;
    SET p_exch_group_pd_share = v_exch_group_pd_share;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_更新交易组份额
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_UpdateExgpShare;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_UpdateExgpShare(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_occur_share decimal(18,2),
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
    declare v_menu_no int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_occur_share decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_code varchar(32);
    declare v_exch_group_name varchar(64);
    declare v_exch_group_status varchar(2);
    declare v_exch_group_begin_NAV decimal(18,4);
    declare v_exch_group_pd_share decimal(18,2);
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
    SET v_menu_no = p_menu_no;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_occur_share = p_occur_share;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_code = " ";
    SET v_exch_group_name = " ";
    SET v_exch_group_status = "0";
    SET v_exch_group_begin_NAV = 0;
    SET v_exch_group_pd_share = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_更新交易组份额】*/
    call db_pub.pra_pubif_UpdateExgpShare(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_occur_share,
        v_menu_no,
        v_oper_remark_info,
        v_error_code,
        v_error_info,
        v_exch_group_code,
        v_exch_group_name,
        v_exch_group_status,
        v_exch_group_begin_NAV,
        v_exch_group_pd_share,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.35.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_更新交易组份额出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态查询权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusQueryAuth;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusQueryAuth(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.36.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.36.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.36.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验查询权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.24.36.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=3; */
        set v_opor_rights=3;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][208][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.24.36.208";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.36.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态查询权限身份获取操作员权限串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusQueryAuthOperRightsStr;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusQueryAuthOperRightsStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_busi_ctrl_str varchar(64),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
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
    declare v_menu_no int;
    declare v_busi_ctrl_str varchar(64);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_busi_ctrl_str = p_busi_ctrl_str;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_co_no_rights_str = " ";
    SET v_pd_no_rights_str = " ";
    SET v_exch_group_no_rights_str = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.37.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.37.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.37.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验查询权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.24.37.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=3; */
        set v_opor_rights=3;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][208][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.24.37.208";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.37.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_获取操作员操作权限串】*/
    call db_pub.pra_user_GetOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_ctrl_str,
        v_error_code,
        v_error_info,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.37.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员操作权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_co_no_rights_str = v_co_no_rights_str;
    SET p_pd_no_rights_str = v_pd_no_rights_str;
    SET p_exch_group_no_rights_str = v_exch_group_no_rights_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态查询权限身份市场
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusQueryAuthOperExch;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusQueryAuthOperExch(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_co_no int,
    IN p_exch_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_co_no int;
    declare v_exch_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_target_opor_no int;
    declare v_opor_rights_str varchar(16);
    declare v_allow_oper_mac varchar(255);
    declare v_opor_rights int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_co_no = p_co_no;
    SET v_exch_no = p_exch_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_target_opor_no = 0;
    SET v_opor_rights_str = " ";
    SET v_allow_oper_mac = " ";
    SET v_opor_rights = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.38.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.38.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.38.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_基础_检查市场状态】*/
    call db_pub.pra_base_CheckMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_crncy_type,
        v_exch_crncy_type,
        v_exch_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.38.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @目标操作员编号#=@操作员编号#; */
    set v_target_opor_no=v_opor_no;

    /* 调用【原子_公共_用户_获取操作员权限串】*/
    call db_pub.pra_user_GetOporRightsStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_opor_rights_str,
        v_allow_oper_mac);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.38.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #校验指令权限

    /* if (@允许操作MAC#<>" " or @允许操作MAC#<>"") then */
    if (v_allow_oper_mac<>" " or v_allow_oper_mac<>"") then

        /* [检查报错返回][locate(@操作MAC#,@允许操作MAC#)=0][209][@操作员编号#] */
        if locate(v_oper_mac,v_allow_oper_mac)=0 then
            
            SET v_error_code = "pubT.24.38.209";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;


        /* set @操作员权限#=1; */
        set v_opor_rights=1;

        /* [检查报错返回][locate(@操作员权限#,@操作员权限串#)=0][206][@操作员编号#] */
        if locate(v_opor_rights,v_opor_rights_str)=0 then
            
            SET v_error_code = "pubT.24.38.206";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态获取系统配置值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusGetSysConfigValue;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusGetSysConfigValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_config_index int,
    IN p_menu_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_config_value varchar(2048),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_config_index int;
    declare v_menu_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_config_value varchar(2048);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_config_index = p_config_index;
    SET v_menu_no = p_menu_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_config_value = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.39.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.39.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.39.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_公共接口_获取系统配置值】*/
    call db_pub.pra_pubif_GetSysConfigValue(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_config_index,
        v_error_code,
        v_error_info,
        v_config_value);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.39.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取系统配置值出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_config_value = v_config_value;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份获取标准券代码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperGetStockCodeNo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperGetStockCodeNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_stock_code_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_sh_standard_stock_code_no int,
    OUT p_sz_standard_stock_code_no int,
    OUT p_impawn_ratio decimal(18,12)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_stock_code_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_sh_standard_stock_code_no int;
    declare v_sz_standard_stock_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_sh_standard_stock_code_no = 0;
    SET v_sz_standard_stock_code_no = 0;
    SET v_impawn_ratio = 0;
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.40.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.40.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.40.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_公共接口_获取标准券证券代码编号】*/
    call db_pub.pra_pubif_GetStockCodeNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_sh_standard_stock_code_no,
        v_sz_standard_stock_code_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.40.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取标准券证券代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_公共接口_获取债券质押比例】*/
    call db_pub.pra_pubif_GetImpawnRatio(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_impawn_ratio);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.40.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取债券质押比例出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_sh_standard_stock_code_no = v_sh_standard_stock_code_no;
    SET p_sz_standard_stock_code_no = v_sz_standard_stock_code_no;
    SET p_impawn_ratio = v_impawn_ratio;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取港股参考汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetReferenceRate;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetReferenceRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_buy_ref_rate decimal(18,12),
    OUT p_sell_ref_rate decimal(18,12),
    OUT p_sys_config_str varchar(64)
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
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_sys_config_str varchar(64);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_sys_config_str = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.41.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_公共接口_获取港股参考汇率】*/
    call db_pub.pra_pubif_GetReferenceRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_error_code,
        v_error_info,
        v_buy_ref_rate,
        v_sell_ref_rate,
        v_sys_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.41.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取港股参考汇率出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_buy_ref_rate = v_buy_ref_rate;
    SET p_sell_ref_rate = v_sell_ref_rate;
    SET p_sys_config_str = v_sys_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_新增操作员可操作产品
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_AddOporAllowProd;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_AddOporAllowProd(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_新增操作员可操作产品】*/
        call db_pub.pra_userclient_AddOporAllowProd(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_target_opor_no,
            v_co_no,
            v_pd_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.45.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_新增操作员可操作产品出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_注销产品更新交易组状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CloseProductUpdateExgpStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CloseProductUpdateExgpStatus(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_更新操作员可操作产品注销标志】*/
        call db_pub.pra_userclient_UpdateOporAllowProdAbolishStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.46.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_更新操作员可操作产品注销标志出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_公共_用户客户端_注销产品更新交易组状态】*/
        call db_pub.pra_userclient_CloseProductUpdateExgpStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.46.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_注销产品更新交易组状态出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_产品状态变化更新交易组状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_ProdStatusChangeUpdateExgpStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_ProdStatusChangeUpdateExgpStatus(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_用户客户端_产品状态变化更新交易组状态】*/
        call db_pub.pra_userclient_ProdStatusChangeUpdateExgpStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.47.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_产品状态变化更新交易组状态出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_新增交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_AddExchGroupInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_AddExchGroupInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    IN p_futu_default_group_flag int,
    IN p_fina_loan_default_group_flag int,
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
    declare v_init_date int;
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
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_futu_default_group_flag int;
    declare v_fina_loan_default_group_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_weight_value decimal(18,4);
    declare v_trade_acco varchar(32);
    declare v_target_opor_no int;
    declare v_oper_remark_info varchar(255);
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
    SET v_init_date = p_init_date;
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
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_futu_default_group_flag = p_futu_default_group_flag;
    SET v_fina_loan_default_group_flag = p_fina_loan_default_group_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_weight_value = 0;
    SET v_trade_acco = " ";
    SET v_target_opor_no = 0;
    SET v_oper_remark_info = " ";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* set @编号类型# = 《编号类型-交易组编号》; */
    set v_record_no_type = 12;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础_获取机构业务记录编号】*/
        call db_pub.pra_base_GetCoBusiRecordNo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_record_no_type,
            v_error_code,
            v_error_info,
            v_curr_no);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.51.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取机构业务记录编号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @交易组编号# = @当前编号#; */
    set v_exch_group_no = v_curr_no;

    /* [事务开始] */
    START TRANSACTION;

        #通过产品新增默认交易组时将权重值赋0

        /* set @权重值#=0; */
        set v_weight_value=0;

        /* set @交易账户#=" "; */
        set v_trade_acco=" ";

        /* 调用【原子_公共_用户客户端_新增交易组信息】*/
        call db_pub.pra_userclient_AddExchGroupInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_group_no,
            v_co_no,
            v_exch_group_code,
            v_exch_group_name,
            v_default_group_flag,
            v_pd_no,
            v_first_asset,
            v_exch_group_dist_pd_amt,
            v_exch_group_pd_share,
            v_allow_exch,
            v_allow_stock_type,
            v_busi_config_str,
            v_market_price_ratio,
            v_forbid_order_dir,
            v_weight_value,
            v_trade_acco,
            v_remark_info,
            v_menu_no,
            v_futu_default_group_flag,
            v_fina_loan_default_group_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.51.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_新增交易组信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @目标操作员编号# =@操作员编号#; */
        set v_target_opor_no =v_opor_no;

        /* set @操作备注# = "新增交易组信息"; */
        set v_oper_remark_info = "新增交易组信息";

        /* 调用【原子_公共_用户客户端_新增操作员所属交易组】*/
        call db_pub.pra_userclient_AddOporAllowExchGroup(
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
            v_exch_group_no,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_no,
            v_row_id);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.51.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_新增操作员所属交易组出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取产品默认交易组编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetCoDefaultExchGroupNo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetCoDefaultExchGroupNo(
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
    

    /* 调用【原子_公共_用户_获取产品默认交易组编号】*/
    call db_pub.pra_user_GetCoDefaultExchGroupNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_exch_group_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.52.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取产品默认交易组编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取系统初始化日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetSysInitDate;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetSysInitDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int
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
    declare v_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础_获取系统初始化日期】*/
    call db_pub.pra_base_GetSysInitDate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.53.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取系统初始化日期出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取系统初始化日期和下一初始化日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetSysInitDateAndNextInitDate;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetSysInitDateAndNextInitDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_next_init_date int
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
    declare v_init_date int;
    declare v_next_init_date int;
    declare v_tmp_init_date int;
    declare v_fixed_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_next_init_date = 0;
    SET v_tmp_init_date = date_format(curdate(),'%Y%m%d');
    SET v_fixed_date = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础_获取系统初始化日期】*/
    call db_pub.pra_base_GetSysInitDate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.50.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取系统初始化日期出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @临时_初始化日期# = @初始化日期#; */
    set v_tmp_init_date = v_init_date;

    /* set @指定日期# = date_format(date_add(@初始化日期#, interval 1 day), '%Y%m%d'); */
    set v_fixed_date = date_format(date_add(v_init_date, interval 1 day), '%Y%m%d');

    /* 调用【原子_公共_基础_获取系统指定下一交易日】*/
    call db_pub.pra_base_GetSysNextTradeDate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_fixed_date,
        v_error_code,
        v_error_info,
        v_init_date);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.50.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取系统指定下一交易日出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @下日初始化日期# = @初始化日期#; */
    set v_next_init_date = v_init_date;

    /* set @初始化日期# = @临时_初始化日期#; */
    set v_init_date = v_tmp_init_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_next_init_date = v_next_init_date;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查市场状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckMarketStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckMarketStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12)
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
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础_检查市场状态】*/
    call db_pub.pra_base_CheckMarketStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_init_date,
        v_crncy_type,
        v_exch_crncy_type,
        v_exch_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.54.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查市场状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64)
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
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_sys_config_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.55.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取市场本币币种汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetExchMoneyTypeExchRate;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetExchMoneyTypeExchRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12)
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
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础_获取市场本币币种汇率】*/
    call db_pub.pra_base_GetExchMoneyTypeExchRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_crncy_type,
        v_exch_crncy_type,
        v_exch_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.56.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场本币币种汇率出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查和获取同步所需公共信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckAndGetSyncInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckAndGetSyncInfo(
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
    IN p_pass_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_exch_group_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_target_code varchar(6),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_stock_name varchar(64),
    OUT p_bond_qty_unit_set int,
    OUT p_sh_hk_settle_sell_rate decimal(18,12),
    OUT p_sz_hksettle_sell_rate decimal(18,12),
    OUT p_pboc_rate decimal(18,12),
    OUT p_target_code_no int
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
    declare v_pass_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_exch_group_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_target_code varchar(6);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_stock_name varchar(64);
    declare v_bond_qty_unit_set int;
    declare v_sh_hk_settle_sell_rate decimal(18,12);
    declare v_sz_hksettle_sell_rate decimal(18,12);
    declare v_pboc_rate decimal(18,12);
    declare v_target_code_no int;
    declare v_sys_config_str varchar(64);
    declare v_co_status varchar(2);
    declare v_busi_config_str varchar(64);
    declare v_sh_hk_buy_ref_rate decimal(18,12);
    declare v_sh_hk_sell_ref_rate decimal(18,12);
    declare v_sh_hk_settle_buy_rate decimal(18,12);
    declare v_sz_hk_buy_ref_rate decimal(18,12);
    declare v_sz_hk_sell_ref_rate decimal(18,12);
    declare v_sz_hk_settle_buy_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pass_no = p_pass_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_group_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_target_code = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_stock_name = " ";
    SET v_bond_qty_unit_set = 0;
    SET v_sh_hk_settle_sell_rate = 0;
    SET v_sz_hksettle_sell_rate = 0;
    SET v_pboc_rate = 0;
    SET v_target_code_no = 0;
    SET v_sys_config_str = " ";
    SET v_co_status = "0";
    SET v_busi_config_str = " ";
    SET v_sh_hk_buy_ref_rate = 0;
    SET v_sh_hk_sell_ref_rate = 0;
    SET v_sh_hk_settle_buy_rate = 0;
    SET v_sz_hk_buy_ref_rate = 0;
    SET v_sz_hk_sell_ref_rate = 0;
    SET v_sz_hk_settle_buy_rate = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.57.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @机构状态# = 0; */
    set v_co_status = 0;

    /* 调用【原子_公共_基础_检查机构状态返回业务控制配置串】*/
    call db_pub.pra_base_CheckOperatorStatusReturnBusiConfigStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_co_status,
        v_error_code,
        v_error_info,
        v_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.57.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查机构状态返回业务控制配置串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @机构业务控制配置串# = @业务控制配置串#; */
    set v_co_busi_config_str = v_busi_config_str;

    /* 调用【原子_公共_用户_获取产品默认交易组编号】*/
    call db_pub.pra_user_GetCoDefaultExchGroupNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_exch_group_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.57.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取产品默认交易组编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @市场编号# <> 0 and @证券代码# <> " " then */
    if v_exch_no <> 0 and v_stock_code <> " " then

        /* 调用【原子_公共_证券基础数据_获取同步所需证券代码信息】*/
        call db_pub.pra_basesedt_GetStockCodeInfoBySync(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_error_code,
            v_error_info,
            v_stock_code_no,
            v_asset_type,
            v_stock_type,
            v_stock_name,
            v_target_code,
            v_target_code_no);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.57.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取同步所需证券代码信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_公共_基础客户端_获取港股通汇率信息】*/
    call db_pub.pra_baseclient_GetHKRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_sh_hk_buy_ref_rate,
        v_sh_hk_sell_ref_rate,
        v_sh_hk_settle_buy_rate,
        v_sh_hk_settle_sell_rate,
        v_sz_hk_buy_ref_rate,
        v_sz_hk_sell_ref_rate,
        v_sz_hk_settle_buy_rate,
        v_sz_hksettle_sell_rate,
        v_pboc_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.57.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_获取港股通汇率信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_基础_获取通道信息】*/
    call db_pub.pra_base_GetChannelInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.57.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取通道信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_exch_group_no = v_exch_group_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_target_code = v_target_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_stock_name = v_stock_name;
    SET p_bond_qty_unit_set = v_bond_qty_unit_set;
    SET p_sh_hk_settle_sell_rate = v_sh_hk_settle_sell_rate;
    SET p_sz_hksettle_sell_rate = v_sz_hksettle_sell_rate;
    SET p_pboc_rate = v_pboc_rate;
    SET p_target_code_no = v_target_code_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查和获取同步内部核对所需公共信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckAndGetSyncCheckInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckAndGetSyncCheckInfo(
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
    OUT p_exch_group_no int,
    OUT p_co_busi_config_str varchar(64)
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
    declare v_exch_group_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_co_status varchar(2);
    declare v_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_co_status = "0";
    SET v_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* set @机构状态# = 0; */
    set v_co_status = 0;

    /* 调用【原子_公共_基础_检查机构状态返回业务控制配置串】*/
    call db_pub.pra_base_CheckOperatorStatusReturnBusiConfigStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_co_status,
        v_error_code,
        v_error_info,
        v_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.58.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查机构状态返回业务控制配置串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @机构业务控制配置串# = @业务控制配置串#; */
    set v_co_busi_config_str = v_busi_config_str;

    /* 调用【原子_公共_用户_获取产品默认交易组编号】*/
    call db_pub.pra_user_GetCoDefaultExchGroupNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_exch_group_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.58.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取产品默认交易组编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查和获取同步内部核对所需证券代码编号信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckAndGetSyncCheckCodeNoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckAndGetSyncCheckCodeNoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code varchar(6),
    OUT p_stock_name varchar(64),
    OUT p_stock_type int,
    OUT p_asset_type int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_stock_type int;
    declare v_asset_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code = " ";
    SET v_stock_name = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取同步所需证券代码编号信息】*/
    call db_pub.pra_basesedt_GetStockCodeNoInfoBySync(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_stock_code,
        v_stock_name,
        v_stock_type,
        v_asset_type);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.59.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取同步所需证券代码编号信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code = v_stock_code;
    SET p_stock_name = v_stock_name;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取资产更新交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetExchGroupInfoByAssetUpdate;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetExchGroupInfoByAssetUpdate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id_str varchar(2048),
    OUT p_co_no_str varchar(2048),
    OUT p_pd_no_str varchar(2048),
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id_str varchar(2048);
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id_str = " ";
    SET v_co_no_str = " ";
    SET v_pd_no_str = " ";
    SET v_exch_group_no_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_获取资产更新交易组信息】*/
    call db_pub.pra_pubif_GetExchGroupInfoByAssetUpdate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_row_id,
        v_error_code,
        v_error_info,
        v_row_id_str,
        v_co_no_str,
        v_pd_no_str,
        v_exch_group_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.60.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取资产更新交易组信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id_str = v_row_id_str;
    SET p_co_no_str = v_co_no_str;
    SET p_pd_no_str = v_pd_no_str;
    SET p_exch_group_no_str = v_exch_group_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_更新交易组证券资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_UpdateExchGroupSecuAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_UpdateExchGroupSecuAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_crncy_type_str varchar(2048),
    IN p_stock_cash_asset_str varchar(4096),
    IN p_futu_cash_asset_str varchar(4096),
    IN p_stock_asset_str varchar(4096),
    IN p_fund_asset_str varchar(4096),
    IN p_bond_asset_str varchar(4096),
    IN p_repo_asset_str varchar(4096),
    IN p_hk_thrgh_stock_asset_str varchar(4096),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_crncy_type_str varchar(2048);
    declare v_stock_cash_asset_str varchar(4096);
    declare v_futu_cash_asset_str varchar(4096);
    declare v_stock_asset_str varchar(4096);
    declare v_fund_asset_str varchar(4096);
    declare v_bond_asset_str varchar(4096);
    declare v_repo_asset_str varchar(4096);
    declare v_hk_thrgh_stock_asset_str varchar(4096);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_futu_asset decimal(18,4);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_stock_cash_asset decimal(18,4);
    declare v_futu_cash_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
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
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_stock_cash_asset_str = p_stock_cash_asset_str;
    SET v_futu_cash_asset_str = p_futu_cash_asset_str;
    SET v_stock_asset_str = p_stock_asset_str;
    SET v_fund_asset_str = p_fund_asset_str;
    SET v_bond_asset_str = p_bond_asset_str;
    SET v_repo_asset_str = p_repo_asset_str;
    SET v_hk_thrgh_stock_asset_str = p_hk_thrgh_stock_asset_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_futu_asset = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_crncy_type = "CNY";
    SET v_stock_cash_asset = 0;
    SET v_futu_cash_asset = 0;
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_fund_asset = 0;
    SET v_repo_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_money_fund_asset = 0;
    SET v_not_money_fund_asset = 0;
    SET v_futu_long_market_value = 0;
    SET v_futu_short_market_value = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* set @期货资产#=0; */
    set v_futu_asset=0;
    loop_label:loop

        /* if instr(@机构编号串#,";") > 0 then */
        if instr(v_co_no_str,";") > 0 then

            /* set @机构编号#=cast(substring(@机构编号串#,1,LOCATE(";",@机构编号串#)-1) as SIGNED); */
            set v_co_no=cast(substring(v_co_no_str,1,LOCATE(";",v_co_no_str)-1) as SIGNED);

            /* set @产品编号#=cast(substring(@产品编号串#,1,LOCATE(";",@产品编号串#)-1) as SIGNED); */
            set v_pd_no=cast(substring(v_pd_no_str,1,LOCATE(";",v_pd_no_str)-1) as SIGNED);

            /* set @交易组编号#=cast(substring(@交易组编号串#,1,LOCATE(";",@交易组编号串#)-1) as SIGNED); */
            set v_exch_group_no=cast(substring(v_exch_group_no_str,1,LOCATE(";",v_exch_group_no_str)-1) as SIGNED);

            /* set @本币币种#=substring(@本币币种串#,1,LOCATE(";",@本币币种串#)-1); */
            set v_crncy_type=substring(v_crncy_type_str,1,LOCATE(";",v_crncy_type_str)-1);

            /* set @证券现金资产#=cast(substring(@证券现金资产串#,1,LOCATE(";",@证券现金资产串#)-1) as decimal(32,6)); */
            set v_stock_cash_asset=cast(substring(v_stock_cash_asset_str,1,LOCATE(";",v_stock_cash_asset_str)-1) as decimal(32,6));

            /* set @期货现金资产#=cast(substring(@期货现金资产串#,1,LOCATE(";",@期货现金资产串#)-1) as decimal(32,6)); */
            set v_futu_cash_asset=cast(substring(v_futu_cash_asset_str,1,LOCATE(";",v_futu_cash_asset_str)-1) as decimal(32,6));

            /* set @股票资产#=cast(substring(@股票资产串#,1,LOCATE(";",@股票资产串#)-1) as decimal(32,6)); */
            set v_stock_asset=cast(substring(v_stock_asset_str,1,LOCATE(";",v_stock_asset_str)-1) as decimal(32,6));

            /* set @债券资产#=cast(substring(@债券资产串#,1,LOCATE(";",@债券资产串#)-1) as decimal(32,6)); */
            set v_bond_asset=cast(substring(v_bond_asset_str,1,LOCATE(";",v_bond_asset_str)-1) as decimal(32,6));

            /* set @基金资产#=cast(substring(@基金资产串#,1,LOCATE(";",@基金资产串#)-1) as decimal(32,6)); */
            set v_fund_asset=cast(substring(v_fund_asset_str,1,LOCATE(";",v_fund_asset_str)-1) as decimal(32,6));

            /* set @回购资产#=cast(substring(@回购资产串#,1,LOCATE(";",@回购资产串#)-1) as decimal(32,6)); */
            set v_repo_asset=cast(substring(v_repo_asset_str,1,LOCATE(";",v_repo_asset_str)-1) as decimal(32,6));

            /* set @港股通资产#=cast(substring(@港股通资产串#,1,LOCATE(";",@港股通资产串#)-1) as decimal(32,6)); */
            set v_hk_thrgh_stock_asset=cast(substring(v_hk_thrgh_stock_asset_str,1,LOCATE(";",v_hk_thrgh_stock_asset_str)-1) as decimal(32,6));
    #该接口目前没用。先设0

    /* set @货币基金资产#=0; */
    set v_money_fund_asset=0;

    /* set @非货币基金资产#=0; */
    set v_not_money_fund_asset=0;

    /* set @期货多头市值# = 0; */
    set v_futu_long_market_value = 0;

    /* set @期货空头市值# = 0; */
    set v_futu_short_market_value = 0;

                /* 调用【原子_公共_公共接口_更新交易组证券资产】*/
                call db_pub.pra_pubif_UpdateExchGroupSecuAsset(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_co_no,
                    v_pd_no,
                    v_exch_group_no,
                    v_crncy_type,
                    v_stock_cash_asset,
                    v_futu_cash_asset,
                    v_futu_asset,
                    v_stock_asset,
                    v_fund_asset,
                    v_money_fund_asset,
                    v_not_money_fund_asset,
                    v_bond_asset,
                    v_repo_asset,
                    v_hk_thrgh_stock_asset,
                    v_futu_long_market_value,
                    v_futu_short_market_value,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "pubT.24.61.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_更新交易组证券资产出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


            /* set @机构编号串#=substring(@机构编号串#,LOCATE(";",@机构编号串#)+1); */
            set v_co_no_str=substring(v_co_no_str,LOCATE(";",v_co_no_str)+1);

            /* set @产品编号串#=substring(@产品编号串#,LOCATE(";",@产品编号串#)+1); */
            set v_pd_no_str=substring(v_pd_no_str,LOCATE(";",v_pd_no_str)+1);

            /* set @交易组编号串#=substring(@交易组编号串#,LOCATE(";",@交易组编号串#)+1); */
            set v_exch_group_no_str=substring(v_exch_group_no_str,LOCATE(";",v_exch_group_no_str)+1);

            /* set @本币币种串#=substring(@本币币种串#,LOCATE(";",@本币币种串#)+1); */
            set v_crncy_type_str=substring(v_crncy_type_str,LOCATE(";",v_crncy_type_str)+1);

            /* set @证券现金资产串#=substring(@证券现金资产串#,LOCATE(";",@证券现金资产串#)+1); */
            set v_stock_cash_asset_str=substring(v_stock_cash_asset_str,LOCATE(";",v_stock_cash_asset_str)+1);

            /* set @期货现金资产串#=substring(@期货现金资产串#,LOCATE(";",@期货现金资产串#)+1); */
            set v_futu_cash_asset_str=substring(v_futu_cash_asset_str,LOCATE(";",v_futu_cash_asset_str)+1);

            /* set @股票资产串#=substring(@股票资产串#,LOCATE(";",@股票资产串#)+1); */
            set v_stock_asset_str=substring(v_stock_asset_str,LOCATE(";",v_stock_asset_str)+1);

            /* set @债券资产串#=substring(@债券资产串#,LOCATE(";",@债券资产串#)+1); */
            set v_bond_asset_str=substring(v_bond_asset_str,LOCATE(";",v_bond_asset_str)+1);

            /* set @基金资产串#=substring(@基金资产串#,LOCATE(";",@基金资产串#)+1); */
            set v_fund_asset_str=substring(v_fund_asset_str,LOCATE(";",v_fund_asset_str)+1);

            /* set @回购资产串#=substring(@回购资产串#,LOCATE(";",@回购资产串#)+1); */
            set v_repo_asset_str=substring(v_repo_asset_str,LOCATE(";",v_repo_asset_str)+1);

            /* set @港股通资产串#=substring(@港股通资产串#,LOCATE(";",@港股通资产串#)+1); */
            set v_hk_thrgh_stock_asset_str=substring(v_hk_thrgh_stock_asset_str,LOCATE(";",v_hk_thrgh_stock_asset_str)+1);
        else
            leave loop_label;
        end if;
    end loop;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_更新交易组期货资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_UpdateExchGroupFutuAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_UpdateExchGroupFutuAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_crncy_type_str varchar(2048),
    IN p_cash_asset_str varchar(4096),
    IN p_futu_asset_str varchar(4096),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_crncy_type_str varchar(2048);
    declare v_cash_asset_str varchar(4096);
    declare v_futu_asset_str varchar(4096);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_cash_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_cash_asset_str = p_cash_asset_str;
    SET v_futu_asset_str = p_futu_asset_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_crncy_type = "CNY";
    SET v_cash_asset = 0;
    SET v_futu_asset = 0;

    
    label_pro:BEGIN
    
    loop_label:loop

        /* if instr(@机构编号串#,";") > 0 then */
        if instr(v_co_no_str,";") > 0 then

            /* set @机构编号#=cast(substring(@机构编号串#,1,LOCATE(";",@机构编号串#)-1) as SIGNED); */
            set v_co_no=cast(substring(v_co_no_str,1,LOCATE(";",v_co_no_str)-1) as SIGNED);

            /* set @产品编号#=cast(substring(@产品编号串#,1,LOCATE(";",@产品编号串#)-1) as SIGNED); */
            set v_pd_no=cast(substring(v_pd_no_str,1,LOCATE(";",v_pd_no_str)-1) as SIGNED);

            /* set @交易组编号#=cast(substring(@交易组编号串#,1,LOCATE(";",@交易组编号串#)-1) as SIGNED); */
            set v_exch_group_no=cast(substring(v_exch_group_no_str,1,LOCATE(";",v_exch_group_no_str)-1) as SIGNED);

            /* set @本币币种#=substring(@本币币种串#,1,LOCATE(";",@本币币种串#)-1); */
            set v_crncy_type=substring(v_crncy_type_str,1,LOCATE(";",v_crncy_type_str)-1);

            /* set @现金资产#=cast(substring(@现金资产串#,1,LOCATE(";",@现金资产串#)-1) as decimal(32,6)); */
            set v_cash_asset=cast(substring(v_cash_asset_str,1,LOCATE(";",v_cash_asset_str)-1) as decimal(32,6));

            /* set @期货资产#=cast(substring(@期货资产串#,1,LOCATE(";",@期货资产串#)-1) as decimal(32,6)); */
            set v_futu_asset=cast(substring(v_futu_asset_str,1,LOCATE(";",v_futu_asset_str)-1) as decimal(32,6));

            /* [事务开始] */
            START TRANSACTION;


                /* 调用【原子_公共_公共接口_更新交易组期货资产】*/
                call db_pub.pra_pubif_UpdateExchGroupFutuAsset(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_co_no,
                    v_pd_no,
                    v_exch_group_no,
                    v_crncy_type,
                    v_cash_asset,
                    v_futu_asset,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "pubT.24.66.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_更新交易组期货资产出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


            /* [事务结束] */
            COMMIT;


            /* set @机构编号串#=substring(@机构编号串#,LOCATE(";",@机构编号串#)+1); */
            set v_co_no_str=substring(v_co_no_str,LOCATE(";",v_co_no_str)+1);

            /* set @产品编号串#=substring(@产品编号串#,LOCATE(";",@产品编号串#)+1); */
            set v_pd_no_str=substring(v_pd_no_str,LOCATE(";",v_pd_no_str)+1);

            /* set @交易组编号串#=substring(@交易组编号串#,LOCATE(";",@交易组编号串#)+1); */
            set v_exch_group_no_str=substring(v_exch_group_no_str,LOCATE(";",v_exch_group_no_str)+1);

            /* set @本币币种串#=substring(@本币币种串#,LOCATE(";",@本币币种串#)+1); */
            set v_crncy_type_str=substring(v_crncy_type_str,LOCATE(";",v_crncy_type_str)+1);

            /* set @现金资产串#=substring(@现金资产串#,LOCATE(";",@现金资产串#)+1); */
            set v_cash_asset_str=substring(v_cash_asset_str,LOCATE(";",v_cash_asset_str)+1);

            /* set @期货资产串#=substring(@期货资产串#,LOCATE(";",@期货资产串#)+1); */
            set v_futu_asset_str=substring(v_futu_asset_str,LOCATE(";",v_futu_asset_str)+1);
        else
            leave loop_label;
        end if;
    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_更新默认交易组允许投资市场和证券类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_UpdateDefautExchGpAllowExchAndStockType;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_UpdateDefautExchGpAllowExchAndStockType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
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
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_公共接口_更新默认交易组允许投资市场和证券类型】*/
        call db_pub.pra_pubif_UpdateDefautExchGpAllowExchAndStockType(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pd_no,
            v_allow_exch,
            v_allow_stock_type,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.62.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_更新默认交易组允许投资市场和证券类型出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查和获取期货同步所需公共信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckAndGetFutuSyncInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckAndGetFutuSyncInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_contrc_code varchar(6),
    IN p_pass_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_exch_group_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_exch_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_contrc_name varchar(64),
    OUT p_contrc_unit int,
    OUT p_pre_settle_price decimal(16,9),
    OUT p_comb_code varchar(6)
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
    declare v_contrc_code varchar(6);
    declare v_pass_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_exch_group_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_name varchar(64);
    declare v_contrc_unit int;
    declare v_pre_settle_price decimal(16,9);
    declare v_comb_code varchar(6);
    declare v_sys_config_str varchar(64);
    declare v_co_status varchar(2);
    declare v_busi_config_str varchar(64);
    declare v_comb_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_contrc_code = p_contrc_code;
    SET v_pass_no = p_pass_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_group_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_exch_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_contrc_name = " ";
    SET v_contrc_unit = 0;
    SET v_pre_settle_price = 0;
    SET v_comb_code = " ";
    SET v_sys_config_str = " ";
    SET v_co_status = "0";
    SET v_busi_config_str = " ";
    SET v_comb_type = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.63.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @机构状态# = 0; */
    set v_co_status = 0;

    /* 调用【原子_公共_基础_检查机构状态返回业务控制配置串】*/
    call db_pub.pra_base_CheckOperatorStatusReturnBusiConfigStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_co_status,
        v_error_code,
        v_error_info,
        v_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.63.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查机构状态返回业务控制配置串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @机构业务控制配置串# = @业务控制配置串#; */
    set v_co_busi_config_str = v_busi_config_str;

    /* 调用【原子_公共_用户_获取产品默认交易组编号】*/
    call db_pub.pra_user_GetCoDefaultExchGroupNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_exch_group_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.63.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取产品默认交易组编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @合约代码# <> " " then */
    if v_contrc_code <> " " then

        /* 调用【原子_公共_期货基础数据_获取同步所需合约代码信息】*/
        call db_pub.pra_basefudt_GetContrcCodeInfoBySync(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_contrc_code,
            v_error_code,
            v_error_info,
            v_contrc_code_no,
            v_exch_no,
            v_contrc_type,
            v_contrc_name,
            v_contrc_unit,
            v_pre_settle_price);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.63.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货基础数据_获取同步所需合约代码信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* if @市场编号#<100 then */
        if v_exch_no<100 then

            /* 调用【原子_公共_公共接口_获取保证金优惠组合编码】*/
            call db_pub.pra_pubif_GetCombinationCode(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_exch_no,
                v_contrc_type,
                v_contrc_code,
                v_error_code,
                v_error_info,
                v_comb_code,
                v_comb_type);
            if v_error_code = "1" then
                SET v_error_code = "pubT.24.63.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取保证金优惠组合编码出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_exch_group_no = v_exch_group_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_exch_no = v_exch_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_name = v_contrc_name;
    SET p_contrc_unit = v_contrc_unit;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_comb_code = v_comb_code;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查和获取同步内部核对所需合约代码编号信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckAndGetSyncCheckContrcCodeNoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckAndGetSyncCheckContrcCodeNoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_contrc_code varchar(6),
    OUT p_contrc_name varchar(64),
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_pre_settle_price decimal(16,9),
    OUT p_comb_code varchar(6)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_contrc_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_contrc_code varchar(6);
    declare v_contrc_name varchar(64);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_pre_settle_price decimal(16,9);
    declare v_comb_code varchar(6);
    declare v_exch_no int;
    declare v_comb_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_contrc_code = " ";
    SET v_contrc_name = " ";
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_pre_settle_price = 0;
    SET v_comb_code = " ";
    SET v_exch_no = 0;
    SET v_comb_type = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_期货基础数据_获取同步编号代码信息】*/
    call db_pub.pra_basefudt_GetContrcNoInfoBySync(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_contrc_code_no,
        v_error_code,
        v_error_info,
        v_exch_no,
        v_contrc_code,
        v_contrc_type,
        v_contrc_name,
        v_contrc_unit,
        v_pre_settle_price);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.64.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货基础数据_获取同步编号代码信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @市场编号# < 100 then */
    if v_exch_no < 100 then

        /* 调用【原子_公共_公共接口_获取保证金优惠组合编码】*/
        call db_pub.pra_pubif_GetCombinationCode(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_contrc_type,
            v_contrc_code,
            v_error_code,
            v_error_info,
            v_comb_code,
            v_comb_type);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.64.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取保证金优惠组合编码出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_contrc_code = v_contrc_code;
    SET p_contrc_name = v_contrc_name;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_comb_code = v_comb_code;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查港股通交收日期更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckHKSettleDateUpdate;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckHKSettleDateUpdate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_T1_settle_date int,
    OUT p_T2_settle_date int
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
    declare v_record_count int;
    declare v_T1_settle_date int;
    declare v_T2_settle_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_record_count = 0;
    SET v_T1_settle_date = 0;
    SET v_T2_settle_date = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_检查港股通交收日期更新】*/
    call db_pub.pra_pubif_CheckHKSettleDateUpdate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_error_code,
        v_error_info,
        v_record_count,
        v_T1_settle_date,
        v_T2_settle_date);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.67.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_检查港股通交收日期更新出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;
    SET p_T1_settle_date = v_T1_settle_date;
    SET p_T2_settle_date = v_T2_settle_date;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_导入持仓数据系统检查获取基础数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_ImportRecordPosiCheckSysStatusGetBaseData;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_ImportRecordPosiCheckSysStatusGetBaseData(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_crncy_type varchar(3),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_exch_group_no int,
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_settle_sell_rate decimal(18,12)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_crncy_type varchar(3);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_exch_group_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_settle_sell_rate decimal(18,12);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_par_value decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_crncy_type = p_crncy_type;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_exch_group_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_settle_sell_rate = 0;
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.71.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.71.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.71.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_获取产品默认交易组编号】*/
    call db_pub.pra_user_GetCoDefaultExchGroupNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_exch_group_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.71.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取产品默认交易组编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_证券基础数据_获取证券代码编号】*/
    call db_pub.pra_basesedt_GetStockCodeNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_par_value);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.71.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @卖出结算汇率# = 1; */
    set v_settle_sell_rate = 1;

    /* if @本币币种# = 《本币币种-港币》 then */
    if v_crncy_type = "HKD" then

        /* 调用【原子_公共_公共接口_获取港股通汇率】*/
        call db_pub.pra_pubif_GetHKExchRate(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_init_date,
            v_error_code,
            v_error_info,
            v_settle_sell_rate);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.71.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取港股通汇率出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_exch_group_no = v_exch_group_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_settle_sell_rate = v_settle_sell_rate;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取通道编号信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetChannelNoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetChannelNoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_hk_cash_avail_date_type int
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
    declare v_hk_cash_avail_date_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_hk_cash_avail_date_type = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_获取通道编号信息】*/
    call db_pub.pra_pubif_GetChannelNoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_error_code,
        v_error_info,
        v_hk_cash_avail_date_type);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.72.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取通道编号信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_hk_cash_avail_date_type = v_hk_cash_avail_date_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取上一交易日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetPreTradeDate;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetPreTradeDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_last_init_date int
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
    declare v_last_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_获取上一交易日期】*/
    call db_pub.pra_pubif_GetPreTradeDate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_last_init_date);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.73.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取上一交易日期出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_last_init_date = v_last_init_date;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取交易组权重值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetExgpWeightValue;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetExgpWeightValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_weight_value_str varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_group_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_weight_value_str varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_weight_value_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_获取交易组权重值】*/
    call db_pub.pra_pubif_GetExgpWeightValue(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no_str,
        v_error_code,
        v_error_info,
        v_weight_value_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.74.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取交易组权重值出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_weight_value_str = v_weight_value_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_更新港股通结算汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_UpdateHKSettleRate;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_UpdateHKSettleRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sh_hk_settle_buy_rate decimal(18,12),
    IN p_sh_hk_settle_sell_rate decimal(18,12),
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
    declare v_sh_hk_settle_buy_rate decimal(18,12);
    declare v_sh_hk_settle_sell_rate decimal(18,12);
    declare v_sz_hk_settle_buy_rate decimal(18,12);
    declare v_sz_hksettle_sell_rate decimal(18,12);
    declare v_pboc_rate decimal(18,12);
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
    SET v_sh_hk_settle_buy_rate = p_sh_hk_settle_buy_rate;
    SET v_sh_hk_settle_sell_rate = p_sh_hk_settle_sell_rate;
    SET v_sz_hk_settle_buy_rate = p_sz_hk_settle_buy_rate;
    SET v_sz_hksettle_sell_rate = p_sz_hksettle_sell_rate;
    SET v_pboc_rate = p_pboc_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_公共接口_更新港股通结算汇率】*/
        call db_pub.pra_pubif_UpdateHKSettleRate(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_sh_hk_settle_buy_rate,
            v_sh_hk_settle_sell_rate,
            v_sz_hk_settle_buy_rate,
            v_sz_hksettle_sell_rate,
            v_pboc_rate,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.75.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_更新港股通结算汇率出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_更新资产获取交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_UpdateAssetGetExgpInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_UpdateAssetGetExgpInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_更新资产获取交易组信息】*/
    call db_pub.pra_pubif_UpdateAssetGetExgpInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_row_id,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_pd_no,
        v_exch_group_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.76.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_更新资产获取交易组信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_更新交易组证券资产修改版
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_UpdateExchGroupSecuAsset_New;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_UpdateExchGroupSecuAsset_New(
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
    IN p_stock_cash_asset decimal(18,4),
    IN p_futu_cash_asset decimal(18,4),
    IN p_futu_asset decimal(18,4),
    IN p_stock_asset decimal(18,4),
    IN p_fund_asset decimal(18,4),
    IN p_money_fund_asset decimal(18,4),
    IN p_not_money_fund_asset decimal(18,4),
    IN p_bond_asset decimal(18,4),
    IN p_repo_asset decimal(18,4),
    IN p_hk_thrgh_stock_asset decimal(18,4),
    IN p_futu_long_market_value decimal(18,4),
    IN p_futu_short_market_value decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_stock_cash_asset decimal(18,4);
    declare v_futu_cash_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_futu_long_market_value decimal(18,4);
    declare v_futu_short_market_value decimal(18,4);
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
    SET v_stock_cash_asset = p_stock_cash_asset;
    SET v_futu_cash_asset = p_futu_cash_asset;
    SET v_futu_asset = p_futu_asset;
    SET v_stock_asset = p_stock_asset;
    SET v_fund_asset = p_fund_asset;
    SET v_money_fund_asset = p_money_fund_asset;
    SET v_not_money_fund_asset = p_not_money_fund_asset;
    SET v_bond_asset = p_bond_asset;
    SET v_repo_asset = p_repo_asset;
    SET v_hk_thrgh_stock_asset = p_hk_thrgh_stock_asset;
    SET v_futu_long_market_value = p_futu_long_market_value;
    SET v_futu_short_market_value = p_futu_short_market_value;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_公共_公共接口_更新交易组证券资产】*/
    call db_pub.pra_pubif_UpdateExchGroupSecuAsset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_crncy_type,
        v_stock_cash_asset,
        v_futu_cash_asset,
        v_futu_asset,
        v_stock_asset,
        v_fund_asset,
        v_money_fund_asset,
        v_not_money_fund_asset,
        v_bond_asset,
        v_repo_asset,
        v_hk_thrgh_stock_asset,
        v_futu_long_market_value,
        v_futu_short_market_value,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.77.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_更新交易组证券资产出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_事务提交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_TransactionCommit;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_TransactionCommit(
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
    
    commit;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取基金交易到账日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetFundTradeArriveDate;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetFundTradeArriveDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_arrive_date int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_arrive_date int;
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.79.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.79.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.79.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_公共接口_获取基金交易到账日期】*/
    call db_pub.pra_pubif_GetFundTradeArriveDate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_arrive_date);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.79.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取基金交易到账日期出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_arrive_date = v_arrive_date;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取交易组默认标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetExgpDefaultFlag;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetExgpDefaultFlag(
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
    OUT p_default_group_flag int
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
    declare v_default_group_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_default_group_flag = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_获取交易组默认标志】*/
    call db_pub.pra_pubif_GetExgpDefaultFlag(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_error_code,
        v_error_info,
        v_default_group_flag);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.80.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取交易组默认标志出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_default_group_flag = v_default_group_flag;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_查询单个交易组资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_QuerySingleExgpGroupAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_QuerySingleExgpGroupAsset(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_查询单个交易组资产】*/
    call db_pub.pra_userclient_QuerySingleExgpGroupAsset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_crncy_type,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_pd_no,
        v_begin_NAV,
        v_nav_asset,
        v_stock_cash_asset,
        v_stock_asset,
        v_fund_asset,
        v_bond_asset,
        v_futu_asset,
        v_repo_asset,
        v_other_asset,
        v_hk_thrgh_stock_asset,
        v_total_realiz_pandl,
        v_many_days_total_asset,
        v_stat_days);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.81.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_查询单个交易组资产出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
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

# 事务_公共_公共接口_检查系统状态权限身份初始化资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperInitAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperInitAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.82.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.82.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.82.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_公共接口_初始化交易组资产】*/
        call db_pub.pra_pubif_InitExgpAsset(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.82.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_初始化交易组资产出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取机构控制配置串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetCompanyControlStr;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetCompanyControlStr(
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
    OUT p_co_busi_config_str varchar(64)
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
    declare v_co_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_co_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_获取机构控制配置串】*/
    call db_pub.pra_pubif_GetCompanyControlStr(
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
        v_co_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.83.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取机构控制配置串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_更新指定交易组资产估值份额
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_UpdateAppointedExgpAssetShare;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_UpdateAppointedExgpAssetShare(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_evalu_share decimal(18,2),
    IN p_evalu_nav_asset decimal(18,4),
    IN p_begin_evalu_nav_asset decimal(18,4),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int
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
    declare v_exch_group_no int;
    declare v_evalu_share decimal(18,2);
    declare v_evalu_nav_asset decimal(18,4);
    declare v_begin_evalu_nav_asset decimal(18,4);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_evalu_share = p_evalu_share;
    SET v_evalu_nav_asset = p_evalu_nav_asset;
    SET v_begin_evalu_nav_asset = p_begin_evalu_nav_asset;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础_获取系统初始化日期】*/
        call db_pub.pra_base_GetSysInitDate(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info,
            v_init_date);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.84.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取系统初始化日期出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_公共_公共接口_更新指定交易组资产估值份额】*/
        call db_pub.pra_pubif_UpdateAppointedExgpAssetShare(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pd_no,
            v_evalu_share,
            v_evalu_nav_asset,
            v_begin_evalu_nav_asset,
            v_exch_group_no,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.84.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_更新指定交易组资产估值份额出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取证券代码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetStockCodeNo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetStockCodeNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_par_value decimal(16,9)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取证券代码编号】*/
    call db_pub.pra_basesedt_GetStockCodeNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_par_value);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.101.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_par_value = v_par_value;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取证券代码编号串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetStockCodeNoStr;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetStockCodeNoStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_str varchar(4096),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no_str varchar(4096),
    OUT p_stock_type_str varchar(2048),
    OUT p_asset_type_str varchar(2048),
    OUT p_par_value_str varchar(4096)
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
    declare v_stock_code_str varchar(4096);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no_str varchar(4096);
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_par_value_str varchar(4096);
    declare v_split_str varchar(4);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code_str = p_stock_code_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no_str = " ";
    SET v_stock_type_str = " ";
    SET v_asset_type_str = " ";
    SET v_par_value_str = " ";
    SET v_split_str = " ";
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* set @分隔符# = ";"; */
    set v_split_str = ";";

    /* set @证券代码编号串# = ""; */
    set v_stock_code_no_str = "";

    /* set @证券类型串# = ""; */
    set v_stock_type_str = "";

    /* set @资产类型串# = ""; */
    set v_asset_type_str = "";

    /* set @票面面值串# = ""; */
    set v_par_value_str = "";

    /* while LOCATE(@分隔符#,@市场编号串#)<>0   do */
    while LOCATE(v_split_str,v_exch_no_str)<>0   do
        #截取前面每一位

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1)  as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1)  as SIGNED);

        /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
        set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

        /* 调用【原子_公共_证券基础数据_获取证券代码编号】*/
        call db_pub.pra_basesedt_GetStockCodeNo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_error_code,
            v_error_info,
            v_stock_code_no,
            v_stock_type,
            v_asset_type,
            v_par_value);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.109.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码编号出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @证券代码编号串# = concat(@证券代码编号串#,@证券代码编号#,";"); */
        set v_stock_code_no_str = concat(v_stock_code_no_str,v_stock_code_no,";");

        /* set @证券类型串# = concat(@证券类型串#,@证券类型#,";"); */
        set v_stock_type_str = concat(v_stock_type_str,v_stock_type,";");

        /* set @资产类型串# = concat(@资产类型串#,@资产类型#,";"); */
        set v_asset_type_str = concat(v_asset_type_str,v_asset_type,";");

        /* set @票面面值串# = concat(@票面面值串#,@票面面值#,";"); */
        set v_par_value_str = concat(v_par_value_str,v_par_value,";");

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
        set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);
    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no_str = v_stock_code_no_str;
    SET p_stock_type_str = v_stock_type_str;
    SET p_asset_type_str = v_asset_type_str;
    SET p_par_value_str = v_par_value_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取债券付息信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetBondDebtInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetBondDebtInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_exch_no int,
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_crncy_type varchar(3),
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_inteval_days int,
    OUT p_bond_cash_flag int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_query_row_id bigint;
    declare v_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_crncy_type varchar(3);
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_inteval_days int;
    declare v_bond_cash_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_query_row_id = p_query_row_id;
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_crncy_type = "CNY";
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_inteval_days = 0;
    SET v_bond_cash_flag = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_证券基础数据_获取债券付息信息】*/
        call db_pub.pra_basesedt_GetBondDebtInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_query_row_id,
            v_init_date,
            v_error_code,
            v_error_info,
            v_row_id,
            v_exch_no,
            v_stock_code_no,
            v_stock_type,
            v_crncy_type,
            v_par_value,
            v_bond_accr_intrst,
            v_inteval_days,
            v_bond_cash_flag);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.102.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取债券付息信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_exch_no = v_exch_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_crncy_type = v_crncy_type;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_inteval_days = v_inteval_days;
    SET p_bond_cash_flag = v_bond_cash_flag;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取编号债券计提利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetNoBondIntrst;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetNoBondIntrst(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_par_value decimal(16,9)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_par_value decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_bond_accr_intrst = 0;
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取编号债券计提利息】*/
    call db_pub.pra_basesedt_GetNoBondIntrst(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_bond_accr_intrst,
        v_par_value);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.103.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取编号债券计提利息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_par_value = v_par_value;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取编号债券质押比例
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetNoBondImpawnRadio;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetNoBondImpawnRadio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_target_code varchar(6),
    OUT p_target_code_no int,
    OUT p_impawn_ratio decimal(18,12)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_target_code varchar(6);
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_target_code = " ";
    SET v_target_code_no = 0;
    SET v_impawn_ratio = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取编号债券质押比例】*/
    call db_pub.pra_basesedt_GetNoBondImpawnRadio(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_target_code,
        v_target_code_no,
        v_impawn_ratio);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.104.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取编号债券质押比例出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_target_code = v_target_code;
    SET p_target_code_no = v_target_code_no;
    SET p_impawn_ratio = v_impawn_ratio;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取基础证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetBaseStockQuot;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetBaseStockQuot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取基础证券行情】*/
    call db_pub.pra_basesedt_GetBaseStockQuot(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_up_limit_price,
        v_down_limit_price,
        v_last_price);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.105.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取基础证券行情出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取证券代码信息行情汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetStockCodeInfoQuotRate;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetStockCodeInfoQuotRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_exch_no int,
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_last_price decimal(16,9),
    OUT p_fair_price decimal(16,9),
    OUT p_net_price_flag int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_settle_buy_rate decimal(18,12),
    OUT p_crncy_type varchar(3)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_query_row_id bigint;
    declare v_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_last_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_settle_buy_rate decimal(18,12);
    declare v_crncy_type varchar(3);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_query_row_id = p_query_row_id;
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_last_price = 0;
    SET v_fair_price = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_settle_buy_rate = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_获取证券代码信息行情汇率】*/
    call db_pub.pra_pubif_GetStockCodeInfoQuotRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_row_id,
        v_init_date,
        v_error_code,
        v_error_info,
        v_row_id,
        v_exch_no,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_last_price,
        v_fair_price,
        v_net_price_flag,
        v_bond_accr_intrst,
        v_settle_buy_rate,
        v_crncy_type);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.106.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取证券代码信息行情汇率出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_exch_no = v_exch_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_last_price = v_last_price;
    SET p_fair_price = v_fair_price;
    SET p_net_price_flag = v_net_price_flag;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_settle_buy_rate = v_settle_buy_rate;
    SET p_crncy_type = v_crncy_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取编号回购参数信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetNoRepoParamInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetNoRepoParamInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_repo_days int,
    OUT p_repo_first_settle_date int,
    OUT p_repo_back_date int,
    OUT p_cash_capt_days int,
    OUT p_target_code_no int,
    OUT p_target_code varchar(6),
    OUT p_target_code_stock_type int,
    OUT p_target_code_asset_type int
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
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_repo_days int;
    declare v_repo_first_settle_date int;
    declare v_repo_back_date int;
    declare v_cash_capt_days int;
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_repo_days = 0;
    SET v_repo_first_settle_date = 0;
    SET v_repo_back_date = 0;
    SET v_cash_capt_days = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取编号回购参数信息】*/
    call db_pub.pra_basesedt_GetNoRepoParamInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_repo_days,
        v_repo_first_settle_date,
        v_repo_back_date,
        v_cash_capt_days,
        v_target_code_no,
        v_target_code,
        v_target_code_stock_type,
        v_target_code_asset_type);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.107.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取编号回购参数信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_repo_days = v_repo_days;
    SET p_repo_first_settle_date = v_repo_first_settle_date;
    SET p_repo_back_date = v_repo_back_date;
    SET p_cash_capt_days = v_cash_capt_days;
    SET p_target_code_no = v_target_code_no;
    SET p_target_code = v_target_code;
    SET p_target_code_stock_type = v_target_code_stock_type;
    SET p_target_code_asset_type = v_target_code_asset_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取交易代码编号信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetTradeCodeNoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetTradeCodeNoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_trade_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_type int,
    OUT p_asset_type int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_trade_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_type int;
    declare v_asset_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_trade_code_no = p_trade_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取交易代码编号信息】*/
    call db_pub.pra_basesedt_GetTradeCodeNoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_trade_code_no,
        v_error_code,
        v_error_info,
        v_stock_type,
        v_asset_type);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.108.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取交易代码编号信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_开始计划任务
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckTaskStart;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckTaskStart(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_task_no int,
    IN p_exec_count int,
    IN p_exec_date int,
    IN p_exec_time int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_task_no int;
    declare v_exec_count int;
    declare v_exec_date int;
    declare v_exec_time int;
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
    SET v_task_no = p_task_no;
    SET v_exec_count = p_exec_count;
    SET v_exec_date = p_exec_date;
    SET v_exec_time = p_exec_time;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_消息_开始计划任务】*/
        call db_pub.pra_msage_CheckTaskStart(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_task_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.151.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_消息_开始计划任务出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_完成计划任务
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CompleteTask;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CompleteTask(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_task_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_task_strike_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_task_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_task_strike_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_task_no = p_task_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_task_strike_status = "0";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_消息_完成计划任务】*/
        call db_pub.pra_msage_CompleteTask(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_task_no,
            v_error_code,
            v_error_info,
            v_task_strike_status);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.152.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_消息_完成计划任务出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_task_strike_status = v_task_strike_status;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_增加操作日志
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_AddOperLog;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_AddOperLog(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_menu_no int,
    IN p_serv_name varchar(64),
    IN p_oper_mark varchar(2048),
    IN p_log_level int,
    IN p_log_error_code varchar(32),
    IN p_log_error_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_menu_no int;
    declare v_serv_name varchar(64);
    declare v_oper_mark varchar(2048);
    declare v_log_level int;
    declare v_log_error_code varchar(32);
    declare v_log_error_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_config_co_no int;
    declare v_config_no bigint;
    declare v_config_value varchar(2048);
    declare v_tmp_log_level int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_menu_no = p_menu_no;
    SET v_serv_name = p_serv_name;
    SET v_oper_mark = p_oper_mark;
    SET v_log_level = p_log_level;
    SET v_log_error_code = p_log_error_code;
    SET v_log_error_info = p_log_error_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_config_co_no = 0;
    SET v_config_no = 0;
    SET v_config_value = " ";
    SET v_tmp_log_level = 0;

    
    label_pro:BEGIN
    

    /* [检查正常返回][@日志级别# = 0] */
    if v_log_level = 0 then
        leave label_pro;
    end if;

    #取系统配置日志级别

    /* set @配置机构编号# = 0; */
    set v_config_co_no = 0;

    /* set @配置编号# = 4001; */
    set v_config_no = 4001;

    /* 调用【原子_公共_基础_获取系统配置】*/
    call db_pub.pra_base_GetSysConfig(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_config_co_no,
        v_config_no,
        v_error_code,
        v_error_info,
        v_config_value);

    /* if @错误编码# <> '0' then */
    if v_error_code <> '0' then

        /* set @临时_日志级别# = 2; */
        set v_tmp_log_level = 2;
    else

        /* set @临时_日志级别# = @配置值# + 0; */
        set v_tmp_log_level = v_config_value + 0;
    end if;

    /* [检查正常返回][@日志级别# > @临时_日志级别#] */
    if v_log_level > v_tmp_log_level then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_消息_增加操作日志】*/
        call db_pub.pra_msage_AddOperLog(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_menu_no,
            v_oper_mark,
            v_log_level,
            v_log_error_code,
            v_log_error_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.153.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_消息_增加操作日志出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取错误信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetErrorInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetErrorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_log_error_code varchar(32),
    IN p_log_error_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_error_prompt varchar(255),
    OUT p_error_level int,
    OUT p_error_deal varchar(1024)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_log_error_code varchar(32);
    declare v_log_error_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_error_prompt varchar(255);
    declare v_error_level int;
    declare v_error_deal varchar(1024);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_log_error_code = p_log_error_code;
    SET v_log_error_info = p_log_error_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_error_prompt = " ";
    SET v_error_level = 0;
    SET v_error_deal = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_消息_获取错误信息】*/
    call db_pub.pra_msage_GetErrorInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_log_error_code,
        v_log_error_info,
        v_error_code,
        v_error_info,
        v_error_prompt,
        v_error_level,
        v_error_deal);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.154.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_消息_获取错误信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_error_prompt = v_error_prompt;
    SET p_error_level = v_error_level;
    SET p_error_deal = v_error_deal;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取所有错误信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetAllErrorInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetAllErrorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_update_date int,
    IN p_update_time int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_update_date = p_update_date;
    SET v_update_time = p_update_time;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_消息_获取所有错误信息】*/
    call db_pub.pra_msage_GetAllErrorInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_update_date,
        v_update_time,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.155.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_消息_获取所有错误信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_计算证券费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CalcSecuFee;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CalcSecuFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_fee_qty decimal(18,2),
    IN p_fee_price decimal(16,9),
    IN p_net_price_flag int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
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
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
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
    declare v_order_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_fee_qty = p_fee_qty;
    SET v_fee_price = p_fee_price;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
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
    SET v_order_qty = 0;

    
    label_pro:BEGIN
    

    /* set @订单数量# = @费用数量#; */
    set v_order_qty = v_fee_qty;

    /* if @证券类型#>20 and @证券类型#<50 then */
    if v_stock_type>20 and v_stock_type<50 then

        /* if @净价标志# = 《净价标志-净价》 and @债券利率类型#<> 《债券利率类型-零息》 then */
        if v_net_price_flag = 1 and v_bond_rate_type<> 3 then

            /* set @费用价格# = @费用价格# + @债券计提利息#; */
            set v_fee_price = v_fee_price + v_bond_accr_intrst;
        end if;
    end if;

    /* 调用【原子_公共_证券费用_计算证券费用】*/
    call db_pub.pra_feesecu_CalcSecuFee(
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
        v_order_dir,
        v_fee_qty,
        v_fee_price,
        v_order_qty,
        v_error_code,
        v_error_info,
        v_stamp_tax,
        v_trans_fee,
        v_brkage_fee,
        v_SEC_charges,
        v_other_fee,
        v_trade_commis,
        v_other_commis,
        v_trade_tax,
        v_trade_cost_fee,
        v_trade_system_use_fee,
        v_stock_settle_fee);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.201.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

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

# 事务_公共_公共接口_计算证券订单费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CalcSecuOrderFee;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CalcSecuOrderFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_rate_type int,
    IN p_bond_accr_intrst decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_commis decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_stamp_tax decimal(18,4),
    OUT p_trans_fee decimal(18,4),
    OUT p_brkage_fee decimal(18,4),
    OUT p_SEC_charges decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_trade_tax decimal(18,4),
    OUT p_trade_cost_fee decimal(18,4),
    OUT p_trade_system_use_fee decimal(18,4),
    OUT p_stock_settle_fee decimal(18,4),
    OUT p_order_frozen_amt decimal(18,4)
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
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_commis decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_order_frozen_amt decimal(18,4);
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_order_price = p_order_price;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_commis = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_order_frozen_amt = 0;
    SET v_fee_qty = 0;
    SET v_fee_price = 0;

    
    label_pro:BEGIN
    

    /* set @费用数量# = @订单数量#; */
    set v_fee_qty = v_order_qty;

    /* set @费用价格# = @订单价格#; */
    set v_fee_price = v_order_price;

    /* if @证券类型#>20 and @证券类型#<50 then */
    if v_stock_type>20 and v_stock_type<50 then

        /* if @净价标志# = 《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_net_price_flag = 1 and v_bond_rate_type <> 3 then

           /* set @费用价格# = @费用价格# + @债券计提利息#; */
           set v_fee_price = v_fee_price + v_bond_accr_intrst;
        end if;

        /* if @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-融券回购》 then */
        if v_order_dir = 3 or v_order_dir = 4 then

            /* set @费用价格# = @票面面值#; */
            set v_fee_price = v_par_value;
        end if;
    end if;

    /* 调用【原子_公共_证券费用_计算证券费用】*/
    call db_pub.pra_feesecu_CalcSecuFee(
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
        v_order_dir,
        v_fee_qty,
        v_fee_price,
        v_order_qty,
        v_error_code,
        v_error_info,
        v_stamp_tax,
        v_trans_fee,
        v_brkage_fee,
        v_SEC_charges,
        v_other_fee,
        v_trade_commis,
        v_other_commis,
        v_trade_tax,
        v_trade_cost_fee,
        v_trade_system_use_fee,
        v_stock_settle_fee);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.203.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @全部费用# = @交易佣金# + @印花税# + @过户费# + @经手费# + @证管费#  + @其他费用# + @其他佣金# + @交易征费# + @交易费# + @交易系统使用费# + @股份交收费#; */
    set v_all_fee = v_trade_commis + v_stamp_tax + v_trans_fee + v_brkage_fee + v_SEC_charges  + v_other_fee + v_other_commis + v_trade_tax + v_trade_cost_fee + v_trade_system_use_fee + v_stock_settle_fee;

    /* set @订单冻结金额# = @订单价格# * @订单数量# + @全部费用#; */
    set v_order_frozen_amt = v_order_price * v_order_qty + v_all_fee;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_commis = v_trade_commis;
    SET p_all_fee = v_all_fee;
    SET p_stamp_tax = v_stamp_tax;
    SET p_trans_fee = v_trans_fee;
    SET p_brkage_fee = v_brkage_fee;
    SET p_SEC_charges = v_SEC_charges;
    SET p_other_fee = v_other_fee;
    SET p_other_commis = v_other_commis;
    SET p_trade_tax = v_trade_tax;
    SET p_trade_cost_fee = v_trade_cost_fee;
    SET p_trade_system_use_fee = v_trade_system_use_fee;
    SET p_stock_settle_fee = v_stock_settle_fee;
    SET p_order_frozen_amt = v_order_frozen_amt;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_计算证券成交费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CalcSecuStrikeFee;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CalcSecuStrikeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_rate_type int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_order_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_commis decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_stamp_tax decimal(18,4),
    OUT p_trans_fee decimal(18,4),
    OUT p_brkage_fee decimal(18,4),
    OUT p_SEC_charges decimal(18,4),
    OUT p_other_fee decimal(18,4),
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
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_order_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_commis decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_order_qty = p_order_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_commis = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_fee_qty = 0;
    SET v_fee_price = 0;

    
    label_pro:BEGIN
    

    /* set @费用数量# = @成交数量#; */
    set v_fee_qty = v_strike_qty;

    /* set @费用价格# = @成交价格#; */
    set v_fee_price = v_strike_price;

    /* if @证券类型#>20 and @证券类型#<50 then */
    if v_stock_type>20 and v_stock_type<50 then

        /* if @净价标志# = 《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_net_price_flag = 1 and v_bond_rate_type <> 3 then

            /* set @费用价格# = @费用价格# + @债券计提利息#; */
            set v_fee_price = v_fee_price + v_bond_accr_intrst;
        end if;

        /* if @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-融券回购》 then */
        if v_order_dir = 3 or v_order_dir = 4 then

            /* set @费用价格# = @票面面值#; */
            set v_fee_price = v_par_value;
        end if;
    end if;

    /* 调用【原子_公共_证券费用_计算证券费用】*/
    call db_pub.pra_feesecu_CalcSecuFee(
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
        v_order_dir,
        v_fee_qty,
        v_fee_price,
        v_order_qty,
        v_error_code,
        v_error_info,
        v_stamp_tax,
        v_trans_fee,
        v_brkage_fee,
        v_SEC_charges,
        v_other_fee,
        v_trade_commis,
        v_other_commis,
        v_trade_tax,
        v_trade_cost_fee,
        v_trade_system_use_fee,
        v_stock_settle_fee);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.204.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @全部费用# = @交易佣金# + @印花税# + @过户费# + @经手费# + @证管费#  + @其他费用# + @其他佣金# + @交易征费# + @交易费# + @交易系统使用费# + @股份交收费#; */
    set v_all_fee = v_trade_commis + v_stamp_tax + v_trans_fee + v_brkage_fee + v_SEC_charges  + v_other_fee + v_other_commis + v_trade_tax + v_trade_cost_fee + v_trade_system_use_fee + v_stock_settle_fee;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_commis = v_trade_commis;
    SET p_all_fee = v_all_fee;
    SET p_stamp_tax = v_stamp_tax;
    SET p_trans_fee = v_trans_fee;
    SET p_brkage_fee = v_brkage_fee;
    SET p_SEC_charges = v_SEC_charges;
    SET p_other_fee = v_other_fee;
    SET p_other_commis = v_other_commis;
    SET p_trade_tax = v_trade_tax;
    SET p_trade_cost_fee = v_trade_cost_fee;
    SET p_trade_system_use_fee = v_trade_system_use_fee;
    SET p_stock_settle_fee = v_stock_settle_fee;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_计算批量订单费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CalcOrderBatchFee;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CalcOrderBatchFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no_str varchar(4096),
    IN p_stock_type_str varchar(2048),
    IN p_order_dir_str varchar(1024),
    IN p_order_qty_str varchar(4096),
    IN p_order_price_str varchar(4096),
    IN p_net_price_flag_str varchar(2048),
    IN p_bond_rate_type_str varchar(4096),
    IN p_bond_accr_intrst_str varchar(4096),
    IN p_par_value_str varchar(4096),
    IN p_split_str varchar(4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_all_fee_str varchar(4096)
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no_str varchar(4096);
    declare v_stock_type_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_order_qty_str varchar(4096);
    declare v_order_price_str varchar(4096);
    declare v_net_price_flag_str varchar(2048);
    declare v_bond_rate_type_str varchar(4096);
    declare v_bond_accr_intrst_str varchar(4096);
    declare v_par_value_str varchar(4096);
    declare v_split_str varchar(4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_all_fee_str varchar(4096);
    declare v_stock_code_str varchar(4096);
    declare v_exch_no int;
    declare v_order_dir int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_rate_type int;
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_trade_commis decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_qty_str = p_order_qty_str;
    SET v_order_price_str = p_order_price_str;
    SET v_net_price_flag_str = p_net_price_flag_str;
    SET v_bond_rate_type_str = p_bond_rate_type_str;
    SET v_bond_accr_intrst_str = p_bond_accr_intrst_str;
    SET v_par_value_str = p_par_value_str;
    SET v_split_str = p_split_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_all_fee_str = " ";
    SET v_stock_code_str = " ";
    SET v_exch_no = 0;
    SET v_order_dir = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_bond_accr_intrst = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_bond_rate_type = 0;
    SET v_fee_qty = 0;
    SET v_fee_price = 0;
    SET v_trade_commis = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;

    
    label_pro:BEGIN
    

    /* set @全部费用串# = ""; */
    set v_all_fee_str = "";

    /* set @证券代码串# = ""; */
    set v_stock_code_str = "";

    /* if @分隔符# = ' ' then */
    if v_split_str = ' ' then

        /* set @分隔符#= ';'; */
        set v_split_str= ';';
    end if;

    /* while LOCATE(@分隔符#,@证券代码编号串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_no_str)<>0   do
        #截取前面每一位

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @订单方向#=cast(substring(@订单方向串#,1,LOCATE(@分隔符#,@订单方向串#)-1) as SIGNED); */
        set v_order_dir=cast(substring(v_order_dir_str,1,LOCATE(v_split_str,v_order_dir_str)-1) as SIGNED);

        /* set @证券代码编号#=cast(substring(@证券代码编号串#,1,LOCATE(@分隔符#,@证券代码编号串#)-1) as SIGNED); */
        set v_stock_code_no=cast(substring(v_stock_code_no_str,1,LOCATE(v_split_str,v_stock_code_no_str)-1) as SIGNED);

        /* set @证券类型#=cast(substring(@证券类型串#,1,LOCATE(@分隔符#,@证券类型串#)-1) as SIGNED); */
        set v_stock_type=cast(substring(v_stock_type_str,1,LOCATE(v_split_str,v_stock_type_str)-1) as SIGNED);

        /* set @订单价格#=cast(substring(@订单价格串#,1,LOCATE(@分隔符#,@订单价格串#)-1) as decimal(16,9)); */
        set v_order_price=cast(substring(v_order_price_str,1,LOCATE(v_split_str,v_order_price_str)-1) as decimal(16,9));

        /* set @订单数量#=cast(substring(@订单数量串#,1,LOCATE(@分隔符#,@订单数量串#)-1) as decimal(18,2)); */
        set v_order_qty=cast(substring(v_order_qty_str,1,LOCATE(v_split_str,v_order_qty_str)-1) as decimal(18,2));

        /* set @债券计提利息#=cast(substring(@债券计提利息串#,1,LOCATE(@分隔符#,@债券计提利息串#)-1) as decimal(18,12)); */
        set v_bond_accr_intrst=cast(substring(v_bond_accr_intrst_str,1,LOCATE(v_split_str,v_bond_accr_intrst_str)-1) as decimal(18,12));

        /* set @净价标志#=substring(@净价标志串#,1,LOCATE(@分隔符#,@净价标志串#)-1); */
        set v_net_price_flag=substring(v_net_price_flag_str,1,LOCATE(v_split_str,v_net_price_flag_str)-1);

        /* set @票面面值#=cast(substring(@票面面值串#,1,LOCATE(@分隔符#,@票面面值串#)-1) as decimal(16,9)); */
        set v_par_value=cast(substring(v_par_value_str,1,LOCATE(v_split_str,v_par_value_str)-1) as decimal(16,9));

        /* set @债券利率类型#=cast(substring(@债券利率类型串#,1,LOCATE(@分隔符#,@债券利率类型串#)-1) as SIGNED); */
        set v_bond_rate_type=cast(substring(v_bond_rate_type_str,1,LOCATE(v_split_str,v_bond_rate_type_str)-1) as SIGNED);

        /* if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-融券回购》 then */
        if v_order_dir = 1 or v_order_dir = 4 then

            /* set @费用数量# = @订单数量#; */
            set v_fee_qty = v_order_qty;

            /* set @费用价格# = @订单价格#; */
            set v_fee_price = v_order_price;

            /* if @订单方向# = 《订单方向-融资回购》 then */
            if v_order_dir = 3 then

                /* set @费用价格# = @票面面值#; */
                set v_fee_price = v_par_value;
            end if;

            /* if @证券类型#>20 and @证券类型#<50 and @净价标志# = 《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》  then */
            if v_stock_type>20 and v_stock_type<50 and v_net_price_flag = 1 and v_bond_rate_type <> 3  then

                /* set @费用价格# = @费用价格# + @债券计提利息#; */
                set v_fee_price = v_fee_price + v_bond_accr_intrst;
            end if;

            /* set @交易佣金# = 0; */
            set v_trade_commis = 0;

            /* set @全部费用# = 0; */
            set v_all_fee = 0;

            /* set @印花税# = 0; */
            set v_stamp_tax = 0;

            /* set @过户费# = 0; */
            set v_trans_fee = 0;

            /* set @经手费# = 0; */
            set v_brkage_fee = 0;

            /* set @证管费# = 0; */
            set v_SEC_charges = 0;

            /* set @其他费用# = 0; */
            set v_other_fee = 0;

            /* set @其他佣金# = 0; */
            set v_other_commis = 0;

            /* set @交易征费# = 0; */
            set v_trade_tax = 0;

            /* set @交易费# = 0; */
            set v_trade_cost_fee = 0;

            /* set @交易系统使用费# = 0; */
            set v_trade_system_use_fee = 0;

            /* set @股份交收费# = 0; */
            set v_stock_settle_fee = 0;

            /* 调用【原子_公共_证券费用_计算证券费用】*/
            call db_pub.pra_feesecu_CalcSecuFee(
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
                v_order_dir,
                v_fee_qty,
                v_fee_price,
                v_order_qty,
                v_error_code,
                v_error_info,
                v_stamp_tax,
                v_trans_fee,
                v_brkage_fee,
                v_SEC_charges,
                v_other_fee,
                v_trade_commis,
                v_other_commis,
                v_trade_tax,
                v_trade_cost_fee,
                v_trade_system_use_fee,
                v_stock_settle_fee);
            if v_error_code = "1" then
                SET v_error_code = "pubT.24.208.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券费用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

            #if @净价标志# = 《净价标志-净价》 then
              #set @其他费用# = round(@债券计提利息# * @订单数量#,2);
            #end if;

            /* set @全部费用# = @交易佣金# + @印花税# + @过户费# + @经手费# + @证管费#  + @其他费用# + @其他佣金# + @交易征费# + @交易费# + @交易系统使用费# + @股份交收费#; */
            set v_all_fee = v_trade_commis + v_stamp_tax + v_trans_fee + v_brkage_fee + v_SEC_charges  + v_other_fee + v_other_commis + v_trade_tax + v_trade_cost_fee + v_trade_system_use_fee + v_stock_settle_fee;
        end if;

        /* set @全部费用串# = concat(@全部费用串#,@全部费用#,";"); */
        set v_all_fee_str = concat(v_all_fee_str,v_all_fee,";");

        /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
        set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @订单方向串#=substring(@订单方向串#,LOCATE(@分隔符#,@订单方向串#)+1); */
        set v_order_dir_str=substring(v_order_dir_str,LOCATE(v_split_str,v_order_dir_str)+1);

        /* set @订单价格串#=substring(@订单价格串#,LOCATE(@分隔符#,@订单价格串#)+1); */
        set v_order_price_str=substring(v_order_price_str,LOCATE(v_split_str,v_order_price_str)+1);

        /* set @订单数量串#=substring(@订单数量串#,LOCATE(@分隔符#,@订单数量串#)+1); */
        set v_order_qty_str=substring(v_order_qty_str,LOCATE(v_split_str,v_order_qty_str)+1);

        /* set @债券计提利息串#=substring(@债券计提利息串#,LOCATE(@分隔符#,@债券计提利息串#)+1); */
        set v_bond_accr_intrst_str=substring(v_bond_accr_intrst_str,LOCATE(v_split_str,v_bond_accr_intrst_str)+1);

        /* set @净价标志串#=substring(@净价标志串#,LOCATE(@分隔符#,@净价标志串#)+1); */
        set v_net_price_flag_str=substring(v_net_price_flag_str,LOCATE(v_split_str,v_net_price_flag_str)+1);

        /* set @证券类型串#=substring(@证券类型串#,LOCATE(@分隔符#,@证券类型串#)+1); */
        set v_stock_type_str=substring(v_stock_type_str,LOCATE(v_split_str,v_stock_type_str)+1);

        /* set @票面面值串#=substring(@票面面值串#,LOCATE(@分隔符#,@票面面值串#)+1); */
        set v_par_value_str=substring(v_par_value_str,LOCATE(v_split_str,v_par_value_str)+1);

        /* set @证券代码编号串#=substring(@证券代码编号串#,LOCATE(@分隔符#,@证券代码编号串#)+1); */
        set v_stock_code_no_str=substring(v_stock_code_no_str,LOCATE(v_split_str,v_stock_code_no_str)+1);
    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_all_fee_str = v_all_fee_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_计算期货费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CalcFutuFee;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CalcFutuFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_fee_qty decimal(18,2),
    IN p_order_qty decimal(18,2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_fee_price decimal(16,9),
    IN p_contrc_unit int,
    IN p_hedge_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_rece_margin decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_deli_fee decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_other_commis decimal(18,4)
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
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_fee_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_contrc_unit int;
    declare v_hedge_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_rece_margin decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_margin_ratio decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_fee_qty = p_fee_qty;
    SET v_order_qty = p_order_qty;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_fee_price = p_fee_price;
    SET v_contrc_unit = p_contrc_unit;
    SET v_hedge_type = p_hedge_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_rece_margin = 0;
    SET v_trade_commis = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_other_fee = 0;
    SET v_other_commis = 0;
    SET v_service_fee = 0;
    SET v_margin_ratio = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_期货费用_计算期货费用】*/
    call db_pub.pra_feefutu_CalcFutuFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_contrc_code_no,
        v_exch_no,
        v_contrc_type,
        v_order_dir,
        v_contrc_dir,
        v_fee_qty,
        v_order_qty,
        v_wtdraw_qty,
        v_fee_price,
        v_contrc_unit,
        v_hedge_type,
        v_error_code,
        v_error_info,
        v_rece_margin,
        v_trade_commis,
        v_service_fee,
        v_report_fee,
        v_wtdraw_fee,
        v_deli_fee,
        v_other_fee,
        v_other_commis,
        v_margin_ratio);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.251.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货费用_计算期货费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_rece_margin = v_rece_margin;
    SET p_trade_commis = v_trade_commis;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_deli_fee = v_deli_fee;
    SET p_other_fee = v_other_fee;
    SET p_other_commis = v_other_commis;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_计算期货订单费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CalcFutuOrderFee;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CalcFutuOrderFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_order_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    IN p_hedge_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_rece_margin decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_deli_fee decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_all_fee decimal(18,4)
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
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_hedge_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_rece_margin decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_wtdraw_qty decimal(18,2);
    declare v_service_fee decimal(18,4);
    declare v_margin_ratio decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_order_qty = p_order_qty;
    SET v_order_price = p_order_price;
    SET v_hedge_type = p_hedge_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_rece_margin = 0;
    SET v_trade_commis = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_other_fee = 0;
    SET v_other_commis = 0;
    SET v_all_fee = 0;
    SET v_fee_qty = 0;
    SET v_fee_price = 0;
    SET v_wtdraw_qty = 0;
    SET v_service_fee = 0;
    SET v_margin_ratio = 0;

    
    label_pro:BEGIN
    

    /* set @费用数量# = @订单数量#; */
    set v_fee_qty = v_order_qty;

    /* set @费用价格# = @订单价格#; */
    set v_fee_price = v_order_price;

    /* set @撤单数量# = @订单数量#; */
    set v_wtdraw_qty = v_order_qty;

    /* 调用【原子_公共_期货费用_计算期货费用】*/
    call db_pub.pra_feefutu_CalcFutuFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_contrc_code_no,
        v_exch_no,
        v_contrc_type,
        v_order_dir,
        v_contrc_dir,
        v_fee_qty,
        v_order_qty,
        v_wtdraw_qty,
        v_fee_price,
        v_contrc_unit,
        v_hedge_type,
        v_error_code,
        v_error_info,
        v_rece_margin,
        v_trade_commis,
        v_service_fee,
        v_report_fee,
        v_wtdraw_fee,
        v_deli_fee,
        v_other_fee,
        v_other_commis,
        v_margin_ratio);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.253.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货费用_计算期货费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @全部费用# = @交易佣金# + @其他佣金# + @申报费用# + @撤单费用#; */
    set v_all_fee = v_trade_commis + v_other_commis + v_report_fee + v_wtdraw_fee;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_rece_margin = v_rece_margin;
    SET p_trade_commis = v_trade_commis;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_deli_fee = v_deli_fee;
    SET p_other_fee = v_other_fee;
    SET p_other_commis = v_other_commis;
    SET p_all_fee = v_all_fee;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_计算期货成交费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CalcFutuStrikeFee;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CalcFutuStrikeFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_contrc_unit int,
    IN p_order_qty decimal(18,2),
    IN p_hedge_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_margin decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_strike_fee decimal(18,4),
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
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_contrc_unit int;
    declare v_order_qty decimal(18,2);
    declare v_hedge_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_margin decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_margin_ratio decimal(18,12);
    declare v_wtdraw_qty decimal(18,2);
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_other_fee decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_contrc_unit = p_contrc_unit;
    SET v_order_qty = p_order_qty;
    SET v_hedge_type = p_hedge_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_margin = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_strike_fee = 0;
    SET v_margin_ratio = 0;
    SET v_wtdraw_qty = 0;
    SET v_fee_qty = 0;
    SET v_fee_price = 0;
    SET v_rece_margin = 0;
    SET v_service_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_other_fee = 0;

    
    label_pro:BEGIN
    

    /* set @撤单数量# = 0; */
    set v_wtdraw_qty = 0;

    /* set @费用数量# = @成交数量#; */
    set v_fee_qty = v_strike_qty;

    /* set @费用价格# = @成交价格#; */
    set v_fee_price = v_strike_price;

    /* set @保证金比例# = 0.12; */
    set v_margin_ratio = 0.12;

    /* 调用【原子_公共_期货费用_计算期货费用】*/
    call db_pub.pra_feefutu_CalcFutuFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_contrc_code_no,
        v_exch_no,
        v_contrc_type,
        v_order_dir,
        v_contrc_dir,
        v_fee_qty,
        v_order_qty,
        v_wtdraw_qty,
        v_fee_price,
        v_contrc_unit,
        v_hedge_type,
        v_error_code,
        v_error_info,
        v_rece_margin,
        v_trade_commis,
        v_service_fee,
        v_report_fee,
        v_wtdraw_fee,
        v_deli_fee,
        v_other_fee,
        v_other_commis,
        v_margin_ratio);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.254.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货费用_计算期货费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @成交保证金# = @应收保证金#; */
    set v_strike_margin = v_rece_margin;

    /* set @成交费用# = @交易佣金# + @其他佣金#; */
    set v_strike_fee = v_trade_commis + v_other_commis;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_margin = v_strike_margin;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_strike_fee = v_strike_fee;
    SET p_margin_ratio = v_margin_ratio;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取保证金优惠组合编码订单费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetMarginPrefAndFutuOrderFee;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetMarginPrefAndFutuOrderFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_order_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    IN p_hedge_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_rece_margin decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_deli_fee decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_margin_pref int,
    OUT p_comb_code varchar(6),
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
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_hedge_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_rece_margin decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_margin_pref int;
    declare v_comb_code varchar(6);
    declare v_margin_ratio decimal(18,12);
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_wtdraw_qty decimal(18,2);
    declare v_service_fee decimal(18,4);
    declare v_contrc_code varchar(6);
    declare v_contrc_name varchar(64);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_expire_date int;
    declare v_begin_deli_date int;
    declare v_end_deli_date int;
    declare v_deli_price decimal(16,9);
    declare v_comb_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_order_qty = p_order_qty;
    SET v_order_price = p_order_price;
    SET v_hedge_type = p_hedge_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_rece_margin = 0;
    SET v_trade_commis = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_other_fee = 0;
    SET v_other_commis = 0;
    SET v_all_fee = 0;
    SET v_margin_pref = 0;
    SET v_comb_code = " ";
    SET v_margin_ratio = 0;
    SET v_fee_qty = 0;
    SET v_fee_price = 0;
    SET v_wtdraw_qty = 0;
    SET v_service_fee = 0;
    SET v_contrc_code = " ";
    SET v_contrc_name = " ";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_expire_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_deli_date = date_format(curdate(),'%Y%m%d');
    SET v_end_deli_date = date_format(curdate(),'%Y%m%d');
    SET v_deli_price = 0;
    SET v_comb_type = 0;

    
    label_pro:BEGIN
    

    /* set @费用数量# = @订单数量#; */
    set v_fee_qty = v_order_qty;

    /* set @费用价格# = @订单价格#; */
    set v_fee_price = v_order_price;

    /* set @撤单数量# = @订单数量#; */
    set v_wtdraw_qty = v_order_qty;

    /* 调用【原子_公共_期货费用_计算期货费用】*/
    call db_pub.pra_feefutu_CalcFutuFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_contrc_code_no,
        v_exch_no,
        v_contrc_type,
        v_order_dir,
        v_contrc_dir,
        v_fee_qty,
        v_order_qty,
        v_wtdraw_qty,
        v_fee_price,
        v_contrc_unit,
        v_hedge_type,
        v_error_code,
        v_error_info,
        v_rece_margin,
        v_trade_commis,
        v_service_fee,
        v_report_fee,
        v_wtdraw_fee,
        v_deli_fee,
        v_other_fee,
        v_other_commis,
        v_margin_ratio);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.255.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货费用_计算期货费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @全部费用# = @交易佣金# + @其他佣金# + @申报费用# + @撤单费用#; */
    set v_all_fee = v_trade_commis + v_other_commis + v_report_fee + v_wtdraw_fee;

    /* 调用【原子_公共_公共接口_获取代码编号合约代码属性】*/
    call db_pub.pra_pubif_GetCodeNoContrcCodeProp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_contrc_code_no,
        v_error_code,
        v_error_info,
        v_exch_no,
        v_contrc_code,
        v_contrc_name,
        v_contrc_type,
        v_margin_pref,
        v_capit_reback_days,
        v_posi_reback_days,
        v_expire_date,
        v_begin_deli_date,
        v_end_deli_date,
        v_deli_price);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.255.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取代码编号合约代码属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @市场编号#<100 then */
    if v_exch_no<100 then

        /* 调用【原子_公共_公共接口_获取保证金优惠组合编码】*/
        call db_pub.pra_pubif_GetCombinationCode(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_contrc_type,
            v_contrc_code,
            v_error_code,
            v_error_info,
            v_comb_code,
            v_comb_type);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.255.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取保证金优惠组合编码出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_rece_margin = v_rece_margin;
    SET p_trade_commis = v_trade_commis;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_deli_fee = v_deli_fee;
    SET p_other_fee = v_other_fee;
    SET p_other_commis = v_other_commis;
    SET p_all_fee = v_all_fee;
    SET p_margin_pref = v_margin_pref;
    SET p_comb_code = v_comb_code;
    SET p_margin_ratio = v_margin_ratio;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取保证金优惠组合编码
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetMarginPref;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetMarginPref(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comb_code varchar(6),
    OUT p_comb_type int
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
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comb_code varchar(6);
    declare v_comb_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_type = p_contrc_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comb_code = " ";
    SET v_comb_type = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_获取保证金优惠组合编码】*/
    call db_pub.pra_pubif_GetCombinationCode(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_contrc_type,
        v_contrc_code,
        v_error_code,
        v_error_info,
        v_comb_code,
        v_comb_type);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.256.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取保证金优惠组合编码出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comb_code = v_comb_code;
    SET p_comb_type = v_comb_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取合约编号行情价格
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetContrcNoQuotPrice;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetContrcNoQuotPrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_contrc_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pre_settle_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pre_settle_price = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_获取合约编号行情价格】*/
    call db_pub.pra_pubif_GetContrcNoQuotPrice(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_contrc_code_no,
        v_error_code,
        v_error_info,
        v_pre_settle_price,
        v_up_limit_price,
        v_down_limit_price,
        v_last_price);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.501.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取合约编号行情价格出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_注销产品获取批量交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CloseProductGetExgpInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CloseProductGetExgpInfo(
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
    

    /* 调用【原子_公共_用户客户端_注销产品获取批量交易组信息】*/
    call db_pub.pra_userclient_CloseProductGetExgpInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.502.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_注销产品获取批量交易组信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_同步资产计算所需证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_SyncStockCodeInfoByAssetCalc;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_SyncStockCodeInfoByAssetCalc(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_同步资产计算所需证券代码信息】*/
    call db_pub.pra_pubif_SyncStockCodeInfoByAssetCalc(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.999.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_同步资产计算所需证券代码信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取可设置操作员编号串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetAllowSetOporNoStr;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetAllowSetOporNoStr(
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
    

    /* 调用【原子_公共_用户_获取可设置操作员编号串】*/
    call db_pub.pra_user_GetAllowSetOporNoStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_target_opor_no,
        v_error_code,
        v_error_info,
        v_allow_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.209.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取可设置操作员编号串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_allow_opor_no_str = v_allow_opor_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份并校验操作员权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthAndCheckOperRights;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthAndCheckOperRights(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_busi_ctrl_str varchar(64),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_busi_ctrl_str varchar(64);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
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
    SET v_menu_no = p_menu_no;
    SET v_busi_ctrl_str = p_busi_ctrl_str;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_co_no_rights_str = " ";
    SET v_pd_no_rights_str = " ";
    SET v_exch_group_no_rights_str = " ";

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.210.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.210.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.210.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_获取操作员操作权限串】*/
    call db_pub.pra_user_GetOperatorOperRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_ctrl_str,
        v_error_code,
        v_error_info,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.210.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取操作员操作权限串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][instr(@交易组编号权限串#,concat(";",@交易组编号#,";"))=0  or instr(@产品编号权限串#,concat(";",@产品编号#,";"))=0 ][1][concat("该操作员不具有权限",@机构编号#,@产品编号#,@操作员编号#)] */
    if instr(v_exch_group_no_rights_str,concat(";",v_exch_group_no,";"))=0  or instr(v_pd_no_rights_str,concat(";",v_pd_no,";"))=0  then
        
        SET v_error_code = "pubT.24.210.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("该操作员不具有权限",v_co_no,v_pd_no,v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("该操作员不具有权限",v_co_no,v_pd_no,v_opor_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取币种汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetCrncyRate;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetCrncyRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_issue_co int,
    IN p_crncy_type varchar(3),
    IN p_for_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_spot_exch_buy_rate decimal(18,12),
    OUT p_spot_exch_sale_rate decimal(18,12),
    OUT p_china_bank_convert_rate decimal(18,12)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_issue_co int;
    declare v_crncy_type varchar(3);
    declare v_for_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_spot_exch_buy_rate decimal(18,12);
    declare v_spot_exch_sale_rate decimal(18,12);
    declare v_china_bank_convert_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_issue_co = p_issue_co;
    SET v_crncy_type = p_crncy_type;
    SET v_for_crncy_type = p_for_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_spot_exch_buy_rate = 0;
    SET v_spot_exch_sale_rate = 0;
    SET v_china_bank_convert_rate = 0;

    
    label_pro:BEGIN
    

        /* 调用【原子_公共_公共接口_获取币种汇率】*/
        call db_pub.pra_pubif_GetCrncyRate(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_issue_co,
            v_crncy_type,
            v_for_crncy_type,
            v_error_code,
            v_error_info,
            v_spot_exch_buy_rate,
            v_spot_exch_sale_rate,
            v_china_bank_convert_rate);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.211.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取币种汇率出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_spot_exch_buy_rate = v_spot_exch_buy_rate;
    SET p_spot_exch_sale_rate = v_spot_exch_sale_rate;
    SET p_china_bank_convert_rate = v_china_bank_convert_rate;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_查询单个交易组历史资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_QuerySingleExgpGroupAsset_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_QuerySingleExgpGroupAsset_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_crncy_type varchar(3),
    IN p_init_date int,
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
    declare v_init_date int;
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
    declare v_total_cash_asset decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = p_init_date;
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
    SET v_total_cash_asset = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户客户端_获取单条交易组历史资产】*/
    call db_pub.pra_userclient_GetExgpGroupAsset_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_exch_group_no,
        v_crncy_type,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_pd_no,
        v_begin_NAV,
        v_nav_asset,
        v_total_cash_asset,
        v_stock_asset,
        v_fund_asset,
        v_bond_asset,
        v_futu_asset,
        v_repo_asset,
        v_other_asset,
        v_hk_thrgh_stock_asset);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.212.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户客户端_获取单条交易组历史资产出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
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

# 事务_公共_公共接口_获取系统初始化日期和上一初始化日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetSysInitDateAndPreInitDate;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetSysInitDateAndPreInitDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_last_init_date int
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
    declare v_init_date int;
    declare v_last_init_date int;
    declare v_tmp_init_date int;
    declare v_fixed_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_init_date = date_format(curdate(),'%Y%m%d');
    SET v_fixed_date = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础_获取系统初始化日期】*/
    call db_pub.pra_base_GetSysInitDate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.213.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取系统初始化日期出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @临时_初始化日期# = @初始化日期#; */
    set v_tmp_init_date = v_init_date;

    /* set @指定日期# = date_format(date_sub(@初始化日期#, interval 1 day), '%Y%m%d'); */
    set v_fixed_date = date_format(date_sub(v_init_date, interval 1 day), '%Y%m%d');

    /* 调用【原子_公共_基础_获取系统指定上一交易日】*/
    call db_pub.pra_base_GetSysPreTradeDate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_fixed_date,
        v_error_code,
        v_error_info,
        v_init_date);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.213.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取系统指定上一交易日出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @上日初始化日期# = @初始化日期#; */
    set v_last_init_date = v_init_date;

    /* set @初始化日期# = @临时_初始化日期#; */
    set v_init_date = v_tmp_init_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_last_init_date = v_last_init_date;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_查询期货合约行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_QueryFutuContrcQuot;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_QueryFutuContrcQuot(
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
    

    /* 调用【原子_公共_公共接口_查询期货合约行情】*/
    call db_pub.pra_pubif_QueryFutuContrcQuot(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.214.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_查询期货合约行情出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_同步资产计算所需证券代码信息串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_SyncStockCodeInfoByAssetCalcStr;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_SyncStockCodeInfoByAssetCalcStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_row_id bigint,
    OUT p_sync_field1 varchar(10000),
    OUT p_sync_field2 varchar(10000),
    OUT p_sync_field3 varchar(10000),
    OUT p_sync_field4 varchar(10000),
    OUT p_sync_field5 varchar(10000),
    OUT p_sync_field6 varchar(10000),
    OUT p_sync_field7 varchar(10000),
    OUT p_sync_field8 varchar(10000),
    OUT p_sync_field9 varchar(10000),
    OUT p_sync_field10 varchar(10000),
    OUT p_sync_field11 varchar(10000),
    OUT p_sync_field12 varchar(10000),
    OUT p_sync_field13 varchar(10000)
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
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_row_id bigint;
    declare v_sync_field1 varchar(10000);
    declare v_sync_field2 varchar(10000);
    declare v_sync_field3 varchar(10000);
    declare v_sync_field4 varchar(10000);
    declare v_sync_field5 varchar(10000);
    declare v_sync_field6 varchar(10000);
    declare v_sync_field7 varchar(10000);
    declare v_sync_field8 varchar(10000);
    declare v_sync_field9 varchar(10000);
    declare v_sync_field10 varchar(10000);
    declare v_sync_field11 varchar(10000);
    declare v_sync_field12 varchar(10000);
    declare v_sync_field13 varchar(10000);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_row_id = 0;
    SET v_sync_field1 = " ";
    SET v_sync_field2 = " ";
    SET v_sync_field3 = " ";
    SET v_sync_field4 = " ";
    SET v_sync_field5 = " ";
    SET v_sync_field6 = " ";
    SET v_sync_field7 = " ";
    SET v_sync_field8 = " ";
    SET v_sync_field9 = " ";
    SET v_sync_field10 = " ";
    SET v_sync_field11 = " ";
    SET v_sync_field12 = " ";
    SET v_sync_field13 = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_同步资产计算所需证券代码信息串】*/
    call db_pub.pra_pubif_SyncStockCodeInfoByAssetCalcStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info,
        v_curr_row_id,
        v_sync_field1,
        v_sync_field2,
        v_sync_field3,
        v_sync_field4,
        v_sync_field5,
        v_sync_field6,
        v_sync_field7,
        v_sync_field8,
        v_sync_field9,
        v_sync_field10,
        v_sync_field11,
        v_sync_field12,
        v_sync_field13);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.215.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_同步资产计算所需证券代码信息串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_curr_row_id = v_curr_row_id;
    SET p_sync_field1 = v_sync_field1;
    SET p_sync_field2 = v_sync_field2;
    SET p_sync_field3 = v_sync_field3;
    SET p_sync_field4 = v_sync_field4;
    SET p_sync_field5 = v_sync_field5;
    SET p_sync_field6 = v_sync_field6;
    SET p_sync_field7 = v_sync_field7;
    SET p_sync_field8 = v_sync_field8;
    SET p_sync_field9 = v_sync_field9;
    SET p_sync_field10 = v_sync_field10;
    SET p_sync_field11 = v_sync_field11;
    SET p_sync_field12 = v_sync_field12;
    SET p_sync_field13 = v_sync_field13;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_清空篮子剩余份数
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_ClearHedgingBasketCpoies;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_ClearHedgingBasketCpoies(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_batch_no int,
    IN p_init_date int,
    IN p_co_no int,
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
    declare v_comm_batch_no int;
    declare v_init_date int;
    declare v_co_no int;
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
    declare v_record_batch_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
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
    SET v_record_batch_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础客户端_清空篮子剩余份数】*/
        call db_pub.pra_baseclient_ClearHedgingBasketCpoies(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_comm_batch_no,
            v_co_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.216.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_清空篮子剩余份数出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @记录批号# = @指令批号#; */
    set v_record_batch_no = v_comm_batch_no;

    /* 调用【原子_公共_基础客户端_查询对冲篮子信息】*/
    call db_pub.pra_baseclient_QueryHedgingBasket(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_init_date,
        v_record_batch_no,
        v_error_code,
        v_error_info,
        v_row_id,
        v_comm_trd_type,
        v_basket_id,
        v_basket_name,
        v_futu_qty,
        v_spot_qty,
        v_basket_copies,
        v_remain_copies,
        v_cash_replace_amt,
        v_hedging_pankou,
        v_name_base_diff,
        v_basket_base_diff,
        v_track_base_diff,
        v_update_times);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.216.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_查询对冲篮子信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

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

# 事务_公共_公共接口_检查和获取同步所需共同信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckAndGetSyncPubInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckAndGetSyncPubInfo(
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
    IN p_pass_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_exch_group_no int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_target_code varchar(6),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_stock_name varchar(64),
    OUT p_bond_qty_unit_set int
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
    declare v_pass_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_exch_group_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_target_code varchar(6);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_stock_name varchar(64);
    declare v_bond_qty_unit_set int;
    declare v_sys_config_str varchar(64);
    declare v_co_status varchar(2);
    declare v_busi_config_str varchar(64);
    declare v_target_code_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pass_no = p_pass_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_group_no = 0;
    SET v_co_busi_config_str = " ";
    SET v_target_code = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_stock_name = " ";
    SET v_bond_qty_unit_set = 0;
    SET v_sys_config_str = " ";
    SET v_co_status = "0";
    SET v_busi_config_str = " ";
    SET v_target_code_no = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.217.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @机构状态# = 0; */
    set v_co_status = 0;

    /* 调用【原子_公共_基础_检查机构状态返回业务控制配置串】*/
    call db_pub.pra_base_CheckOperatorStatusReturnBusiConfigStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_co_status,
        v_error_code,
        v_error_info,
        v_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.217.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查机构状态返回业务控制配置串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @机构业务控制配置串# = @业务控制配置串#; */
    set v_co_busi_config_str = v_busi_config_str;

    /* 调用【原子_公共_用户_获取产品默认交易组编号】*/
    call db_pub.pra_user_GetCoDefaultExchGroupNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_exch_group_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.217.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取产品默认交易组编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @市场编号# <> 0 and @证券代码# <> " " then */
    if v_exch_no <> 0 and v_stock_code <> " " then

        /* 调用【原子_公共_证券基础数据_获取同步所需证券代码信息】*/
        call db_pub.pra_basesedt_GetStockCodeInfoBySync(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_error_code,
            v_error_info,
            v_stock_code_no,
            v_asset_type,
            v_stock_type,
            v_stock_name,
            v_target_code,
            v_target_code_no);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.217.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取同步所需证券代码信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_公共_基础_获取通道信息】*/
    call db_pub.pra_base_GetChannelInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.217.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取通道信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_exch_group_no = v_exch_group_no;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_target_code = v_target_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_stock_name = v_stock_name;
    SET p_bond_qty_unit_set = v_bond_qty_unit_set;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_查询特殊证券行情计算单位
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_QuerySpecStockQuotCalcUnit;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_QuerySpecStockQuotCalcUnit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_查询特殊证券行情计算单位】*/
    call db_pub.pra_basesedt_QuerySpecStockQuotCalcUnit(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_stock_code_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.218.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_查询特殊证券行情计算单位出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取期货默认组标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetFutuDefaultGroupFlag;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetFutuDefaultGroupFlag(
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
    

    /* 调用【原子_公共_用户_获取期货默认组标志】*/
    call db_pub.pra_user_GetFutuDefaultGroupFlag(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_futu_default_group_flag);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.219.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取期货默认组标志出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_futu_default_group_flag = v_futu_default_group_flag;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取期货默认交易组编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetFutuDefaultExchGroupNo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetFutuDefaultExchGroupNo(
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
    

    /* 调用【原子_公共_用户_获取期货默认交易组编号】*/
    call db_pub.pra_user_GetFutuDefaultExchGroupNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_exch_group_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.220.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_获取期货默认交易组编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取同步资金所需交易组编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetSyncAsacCaptExgpNo;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetSyncAsacCaptExgpNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_default_exch_group_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_default_exch_group_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_获取同步资金所需交易组编号】*/
    call db_pub.pra_pubif_GetSyncAsacCaptExgpNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_default_exch_group_no,
        v_error_code,
        v_error_info,
        v_exch_group_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.221.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取同步资金所需交易组编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取同步资金所需交易组编号串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetSyncAsacCaptExgpNoStr;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetSyncAsacCaptExgpNoStr(
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
    declare v_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_获取同步资金所需交易组编号串】*/
    call db_pub.pra_pubif_GetSyncAsacCaptExgpNoStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_error_code,
        v_error_info,
        v_exch_group_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.222.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取同步资金所需交易组编号串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no_str = v_exch_group_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取当日上市申购代码串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetCurDayBeginTradeAppStockStr;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetCurDayBeginTradeAppStockStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_trade_date int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no_str varchar(4096),
    OUT p_trade_code_no_str varchar(4096)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_begin_trade_date int;
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no_str varchar(4096);
    declare v_trade_code_no_str varchar(4096);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no_str = " ";
    SET v_trade_code_no_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_获取当日上市申购代码串】*/
    call db_pub.pra_pubif_GetCurDayBeginTradeAppStockStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_trade_date,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_stock_code_no_str,
        v_trade_code_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.223.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取当日上市申购代码串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no_str = v_stock_code_no_str;
    SET p_trade_code_no_str = v_trade_code_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取产品下交易组权重值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetExgpWeightValueOfPd;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetExgpWeightValueOfPd(
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
    OUT p_exch_group_no_str varchar(2048),
    OUT p_weight_value_str varchar(255)
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
    declare v_weight_value_str varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_weight_value_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_公共接口_获取产品下交易组权重值】*/
    call db_pub.pra_pubif_GetExgpWeightValueOfPd(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_exch_group_no_str,
        v_weight_value_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.224.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取产品下交易组权重值出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no_str = v_exch_group_no_str;
    SET p_weight_value_str = v_weight_value_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_批量更新交易组份额
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_UpdateExgpShareByBatch;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_UpdateExgpShareByBatch(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no_str varchar(2048),
    IN p_occur_share decimal(18,2),
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
    declare v_menu_no int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no_str varchar(2048);
    declare v_occur_share decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_split_str varchar(4);
    declare v_exch_group_no int;
    declare v_exch_group_code varchar(32);
    declare v_exch_group_name varchar(64);
    declare v_exch_group_status varchar(2);
    declare v_exch_group_begin_NAV decimal(18,4);
    declare v_exch_group_pd_share decimal(18,2);
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
    SET v_menu_no = p_menu_no;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_occur_share = p_occur_share;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_split_str = " ";
    SET v_exch_group_no = 0;
    SET v_exch_group_code = " ";
    SET v_exch_group_name = " ";
    SET v_exch_group_status = "0";
    SET v_exch_group_begin_NAV = 0;
    SET v_exch_group_pd_share = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* set @交易组编号串#=substring(@交易组编号串#,1,length(@交易组编号串#)-1); */
    set v_exch_group_no_str=substring(v_exch_group_no_str,1,length(v_exch_group_no_str)-1);

    /* set @分隔符# = ";"; */
    set v_split_str = ";";

    /* while LOCATE(@分隔符#,@交易组编号串#)<>0   do */
    while LOCATE(v_split_str,v_exch_group_no_str)<>0   do

          /* set @交易组编号#=cast(substring(@交易组编号串#,1,LOCATE(@分隔符#,@交易组编号串#)-1) as SIGNED); */
          set v_exch_group_no=cast(substring(v_exch_group_no_str,1,LOCATE(v_split_str,v_exch_group_no_str)-1) as SIGNED);

         /* 调用【原子_公共_公共接口_更新交易组份额】*/
         call db_pub.pra_pubif_UpdateExgpShare(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_init_date,
             v_co_no,
             v_pd_no,
             v_exch_group_no,
             v_occur_share,
             v_menu_no,
             v_oper_remark_info,
             v_error_code,
             v_error_info,
             v_exch_group_code,
             v_exch_group_name,
             v_exch_group_status,
             v_exch_group_begin_NAV,
             v_exch_group_pd_share,
             v_update_times);
         if v_error_code = "1" then
             SET v_error_code = "pubT.24.225.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_更新交易组份额出现错误！',v_mysql_message);
             end if;
             ROLLBACK;
             leave label_pro;
         elseif v_error_code <> "0" then
             ROLLBACK;
             leave label_pro;
         end if;


          /* set @交易组编号串#=substring(@交易组编号串#,LOCATE(@分隔符#,@交易组编号串#)+1); */
          set v_exch_group_no_str=substring(v_exch_group_no_str,LOCATE(v_split_str,v_exch_group_no_str)+1);
    end while;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_根据产品查询交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_QueryExgpInfoByPd;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_QueryExgpInfoByPd(
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
    

    /* 调用【原子_公共_公共接口_根据产品查询交易组信息】*/
    call db_pub.pra_pubif_QueryExgpInfoByPd(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.226.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_根据产品查询交易组信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取保证金比例
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetMarginRatio;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetMarginRatio(
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
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
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
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_margin_ratio decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_margin_ratio = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_期货费用_获取保证金比例】*/
    call db_pub.pra_feefutu_GetMarginRatio(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_contrc_code_no,
        v_exch_no,
        v_contrc_type,
        v_order_dir,
        v_contrc_dir,
        v_hedge_type,
        v_error_code,
        v_error_info,
        v_margin_ratio);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.227.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货费用_获取保证金比例出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_margin_ratio = v_margin_ratio;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_批量计算证券订单费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_BatchCalcSecuOrderFee;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_BatchCalcSecuOrderFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_corrsp_id_str varchar(2048),
    IN p_pass_no_str varchar(2048),
    IN p_asset_acco_no_str varchar(2048),
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_order_dir_str varchar(1024),
    IN p_order_qty_str varchar(4096),
    IN p_order_price_str varchar(4096),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_rate_type int,
    IN p_bond_accr_intrst decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_corrsp_id_str varchar(2048);
    declare v_pass_no_str varchar(2048);
    declare v_asset_acco_no_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_order_dir_str varchar(1024);
    declare v_order_qty_str varchar(4096);
    declare v_order_price_str varchar(4096);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_split_str varchar(4);
    declare v_corrsp_id bigint;
    declare v_pass_no int;
    declare v_asset_acco_no int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
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
    declare v_all_fee decimal(18,4);
    declare v_order_frozen_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_corrsp_id_str = p_corrsp_id_str;
    SET v_pass_no_str = p_pass_no_str;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_qty_str = p_order_qty_str;
    SET v_order_price_str = p_order_price_str;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_split_str = " ";
    SET v_corrsp_id = 0;
    SET v_pass_no = 0;
    SET v_asset_acco_no = 0;
    SET v_order_dir = 0;
    SET v_order_qty = 0;
    SET v_order_price = 0;
    SET v_fee_qty = 0;
    SET v_fee_price = 0;
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
    SET v_all_fee = 0;
    SET v_order_frozen_amt = 0;

    
    label_pro:BEGIN
    

    /* set @分隔符# = ";"; */
    set v_split_str = ";";
    #创建临时表 保存数据，供结果集返回。
    drop TABLE if EXISTS batch_order_fee;
    create temporary table batch_order_fee ( corrsp_id bigint NOT NULL,trade_commis  decimal(18,4) NOT NULL,all_fee  decimal(18,4) NOT NULL,stamp_tax  decimal(18,4) NOT NULL,trans_fee  decimal(18,4) NOT NULL,brkage_fee  decimal(18,4) NOT NULL,SEC_charges  decimal(18,4) NOT NULL,other_fee  decimal(18,4) NOT NULL,other_commis  decimal(18,4) NOT NULL,trade_tax  decimal(18,4) NOT NULL,trade_cost_fee  decimal(18,4) NOT NULL,trade_system_use_fee  decimal(18,4) NOT NULL,stock_settle_fee  decimal(18,4) NOT NULL,order_frozen_amt  decimal(18,4) NOT NULL);

    /* while LOCATE(@分隔符#,@对应序号串#) <> 0  do */
    while LOCATE(v_split_str,v_corrsp_id_str) <> 0  do

          /* set @对应序号#=cast(substring(@对应序号串#,1,LOCATE(@分隔符#,@对应序号串#)-1)as SIGNED); */
          set v_corrsp_id=cast(substring(v_corrsp_id_str,1,LOCATE(v_split_str,v_corrsp_id_str)-1)as SIGNED);

          /* set @通道编号#=cast(substring(@通道编号串#,1,LOCATE(@分隔符#,@通道编号串#)-1) as SIGNED); */
          set v_pass_no=cast(substring(v_pass_no_str,1,LOCATE(v_split_str,v_pass_no_str)-1) as SIGNED);

          /* set @资产账户编号#=cast(substring(@资产账户编号串#,1,LOCATE(@分隔符#,@资产账户编号串#)-1) as SIGNED); */
          set v_asset_acco_no=cast(substring(v_asset_acco_no_str,1,LOCATE(v_split_str,v_asset_acco_no_str)-1) as SIGNED);

          /* set @订单方向#=cast(substring(@通道编号串#,1,LOCATE(@分隔符#,@通道编号串#)-1) as SIGNED); */
          set v_order_dir=cast(substring(v_pass_no_str,1,LOCATE(v_split_str,v_pass_no_str)-1) as SIGNED);

          /* set @订单数量#=cast(substring(@订单数量串#,1,LOCATE(@分隔符#,@订单数量串#)-1) as decimal(18,2)); */
          set v_order_qty=cast(substring(v_order_qty_str,1,LOCATE(v_split_str,v_order_qty_str)-1) as decimal(18,2));

          /* set @订单价格#=cast(substring(@订单价格串#,1,LOCATE(@分隔符#,@订单价格串#)-1) as decimal(16,9)); */
          set v_order_price=cast(substring(v_order_price_str,1,LOCATE(v_split_str,v_order_price_str)-1) as decimal(16,9));

           /* set @费用数量# = @订单数量#; */
           set v_fee_qty = v_order_qty;

           /* set @费用价格# = @订单价格#; */
           set v_fee_price = v_order_price;

           /* if @证券类型#>20 and @证券类型#<50 then */
           if v_stock_type>20 and v_stock_type<50 then

                  /* if @净价标志# = 《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
                  if v_net_price_flag = 1 and v_bond_rate_type <> 3 then

                      /* set @费用价格# = @费用价格# + @债券计提利息#; */
                      set v_fee_price = v_fee_price + v_bond_accr_intrst;
                 end if;

                 /* if @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-融券回购》 then */
                 if v_order_dir = 3 or v_order_dir = 4 then

                     /* set @费用价格# = @票面面值#; */
                     set v_fee_price = v_par_value;
                 end if;
           end if;

           /* 调用【原子_公共_证券费用_计算证券费用】*/
           call db_pub.pra_feesecu_CalcSecuFee(
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
               v_order_dir,
               v_fee_qty,
               v_fee_price,
               v_order_qty,
               v_error_code,
               v_error_info,
               v_stamp_tax,
               v_trans_fee,
               v_brkage_fee,
               v_SEC_charges,
               v_other_fee,
               v_trade_commis,
               v_other_commis,
               v_trade_tax,
               v_trade_cost_fee,
               v_trade_system_use_fee,
               v_stock_settle_fee);
           if v_error_code = "1" then
               SET v_error_code = "pubT.24.228.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券费用出现错误！',v_mysql_message);
               end if;
               leave label_pro;
           elseif v_error_code <> "0" then
               leave label_pro;
           end if;


           /* set @全部费用# = @交易佣金# + @印花税# + @过户费# + @经手费# + @证管费#  + @其他费用# + @其他佣金# + @交易征费# + @交易费# + @交易系统使用费# + @股份交收费#; */
           set v_all_fee = v_trade_commis + v_stamp_tax + v_trans_fee + v_brkage_fee + v_SEC_charges  + v_other_fee + v_other_commis + v_trade_tax + v_trade_cost_fee + v_trade_system_use_fee + v_stock_settle_fee;

           /* set @订单冻结金额# = @订单价格# * @订单数量# + @全部费用#; */
           set v_order_frozen_amt = v_order_price * v_order_qty + v_all_fee;
    #插入临时表

          /* insert into batch_order_fee ( corrsp_id,trade_commis ,all_fee ,stamp_tax ,trans_fee ,brkage_fee ,SEC_charges ,other_fee ,other_commis ,trade_tax ,trade_cost_fee ,trade_system_use_fee ,stock_settle_fee ,order_frozen_amt )values (@对应序号#,@交易佣金#,@全部费用#,@印花税#,@过户费#,@经手费#,@证管费#,@其他费用#,@其他佣金#,@交易征费#,@交易费#,@交易系统使用费#,@股份交收费#,@订单冻结金额#); */
          insert into batch_order_fee ( corrsp_id,trade_commis ,all_fee ,stamp_tax ,trans_fee ,brkage_fee ,SEC_charges ,other_fee ,other_commis ,trade_tax ,trade_cost_fee ,trade_system_use_fee ,stock_settle_fee ,order_frozen_amt )values (v_corrsp_id,v_trade_commis,v_all_fee,v_stamp_tax,v_trans_fee,v_brkage_fee,v_SEC_charges,v_other_fee,v_other_commis,v_trade_tax,v_trade_cost_fee,v_trade_system_use_fee,v_stock_settle_fee,v_order_frozen_amt);

          /* set @对应序号串#=substring(@对应序号串#,LOCATE(@分隔符#,@对应序号串#)+1); */
          set v_corrsp_id_str=substring(v_corrsp_id_str,LOCATE(v_split_str,v_corrsp_id_str)+1);

          /* set @通道编号串#=substring(@通道编号串#,LOCATE(@分隔符#,@通道编号串#)+1); */
          set v_pass_no_str=substring(v_pass_no_str,LOCATE(v_split_str,v_pass_no_str)+1);

          /* set @资产账户编号串#=substring(@资产账户编号串#,LOCATE(@分隔符#,@资产账户编号串#)+1); */
          set v_asset_acco_no_str=substring(v_asset_acco_no_str,LOCATE(v_split_str,v_asset_acco_no_str)+1);

          /* set @订单方向串#=substring(@订单方向串#,LOCATE(@分隔符#,@订单方向串#)+1); */
          set v_order_dir_str=substring(v_order_dir_str,LOCATE(v_split_str,v_order_dir_str)+1);

          /* set @订单数量串#=substring(@订单数量串#,LOCATE(@分隔符#,@订单数量串#)+1); */
          set v_order_qty_str=substring(v_order_qty_str,LOCATE(v_split_str,v_order_qty_str)+1);

          /* set @订单价格串#=substring(@订单价格串#,LOCATE(@分隔符#,@订单价格串#)+1); */
          set v_order_price_str=substring(v_order_price_str,LOCATE(v_split_str,v_order_price_str)+1);
    end while;
    select corrsp_id,trade_commis ,all_fee ,stamp_tax ,trans_fee ,brkage_fee ,SEC_charges ,other_fee ,other_commis ,trade_tax ,trade_cost_fee ,trade_system_use_fee ,stock_settle_fee ,order_frozen_amt from batch_order_fee;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_获取市场指定下一初始化日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_GetExchSpecNextInitDate;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_GetExchSpecNextInitDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_fixed_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_next_init_date int
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
    declare v_fixed_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_next_init_date int;
    declare v_exch_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_fixed_date = p_fixed_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_next_init_date = 0;
    SET v_exch_init_date = 0;

    
    label_pro:BEGIN
    

    /* set @指定日期# = date_format(date_add(@指定日期#, interval 1 day), '%Y%m%d'); */
    set v_fixed_date = date_format(date_add(v_fixed_date, interval 1 day), '%Y%m%d');

    /* 调用【原子_公共_基础_获取市场指定下一交易日】*/
    call db_pub.pra_base_GetExchSpecNextExchDate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_fixed_date,
        v_error_code,
        v_error_info,
        v_exch_init_date);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.229.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场指定下一交易日出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @下日初始化日期# = @市场初始化日期#; */
    set v_next_init_date = v_exch_init_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_next_init_date = v_next_init_date;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查系统状态权限身份获取数量上限无密码
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckSysStatusAuthOperGetMaxQtyWithoutPwd;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckSysStatusAuthOperGetMaxQtyWithoutPwd(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_co_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_pd_qty_max int,
    OUT p_max_acco_count int,
    OUT p_opor_qty_max int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_co_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_pd_qty_max int;
    declare v_max_acco_count int;
    declare v_opor_qty_max int;
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_co_no = p_co_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_pd_qty_max = 0;
    SET v_max_acco_count = 0;
    SET v_opor_qty_max = 0;
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.24.230.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份无密码】*/
    call db_pub.pra_user_CheckOperatorAuthNoPwd(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.230.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份无密码出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.230.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_基础_获取数量上限】*/
    call db_pub.pra_base_GetMaxQty(
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
        v_pd_qty_max,
        v_max_acco_count,
        v_opor_qty_max);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.230.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取数量上限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_pd_qty_max = v_pd_qty_max;
    SET p_max_acco_count = v_max_acco_count;
    SET p_opor_qty_max = v_opor_qty_max;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_检查交易组状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_CheckExchGroupStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_CheckExchGroupStatus(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_用户_检查交易组状态】*/
    call db_pub.pra_user_CheckExchGroupStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_group_no,
        v_exch_group_status,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.24.231.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查交易组状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_公共接口_更新系统状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pubif_UpdateSysStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pubif_UpdateSysStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_sys_status varchar(2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_update_times int,
    OUT p_old_sys_status varchar(2)
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
    declare v_sys_status varchar(2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_times int;
    declare v_old_sys_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_sys_status = p_sys_status;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_times = 1;
    SET v_old_sys_status = "0";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_公共接口_更新系统状态】*/
        call db_pub.pra_pubif_UpdateSysStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_sys_status,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_update_times,
            v_old_sys_status);
        if v_error_code = "1" then
            SET v_error_code = "pubT.24.232.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_更新系统状态出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_update_times = v_update_times;
    SET p_old_sys_status = v_old_sys_status;

END;;


