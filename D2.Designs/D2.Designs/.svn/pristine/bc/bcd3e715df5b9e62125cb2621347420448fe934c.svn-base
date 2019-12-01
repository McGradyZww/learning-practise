DELIMITER ;;
use db_pub;;

# 事务_公共_基础客户端_获取机器日期时间
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_GetMachDateTime;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_GetMachDateTime(
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
    

    /* 调用【原子_公共_基础客户端_获取机器日期时间】*/
    call db_pub.pra_baseclient_GetMachDateTime(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_mach_date,
        v_mach_time);
    if v_error_code = "1" then
        SET v_error_code = "pubT.17.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_获取机器日期时间出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_mach_date = v_mach_date;
    SET p_mach_time = v_mach_time;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_基础客户端_修改机构信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_ModiCoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_ModiCoInfo(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础客户端_修改机构信息】*/
        call db_pub.pra_baseclient_ModiCoInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_co_name,
            v_conta_addr,
            v_conta_name,
            v_phone_number,
            v_comm_appr_oper,
            v_market_price_ratio,
            v_base_crncy_type,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.17.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_修改机构信息出现错误！',v_mysql_message);
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

# 事务_公共_基础客户端_修改机构业务控制配置串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_UpdateCoBusiConfigStr;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_UpdateCoBusiConfigStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_config_index int;
    declare v_config_value varchar(2048);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_config_str varchar(64);
    declare v_update_times int;
    declare v_co_no int;
    declare v_co_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_config_index = p_config_index;
    SET v_config_value = p_config_value;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_config_str = " ";
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_co_status = "0";

    
    label_pro:BEGIN
    

    /* [检查报错返回][length(@配置值#) <> 1 or @配置值# = " "][14][@配置位#,@配置值#] */
    if length(v_config_value) <> 1 or v_config_value = " " then
        
        SET v_error_code = "pubT.17.13.14";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("配置位=",v_config_index,",","配置值=",v_config_value),"#",v_mysql_message);
        else
            SET v_error_info = concat("配置位=",v_config_index,",","配置值=",v_config_value);
        end if;
        leave label_pro;
    end if;


    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* set @机构状态# = 0; */
    set v_co_status = 0;

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
        SET v_error_code = "pubT.17.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查机构状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础客户端_修改机构业务控制配置串】*/
        call db_pub.pra_baseclient_UpdateCoBusiConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_config_index,
            v_config_value,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_busi_config_str,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pubT.17.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_修改机构业务控制配置串出现错误！',v_mysql_message);
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
    SET p_busi_config_str = v_busi_config_str;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_基础客户端_查询机构信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_QueryCoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_QueryCoInfo(
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
    

    /* 调用【原子_公共_基础客户端_查询机构信息】*/
    call db_pub.pra_baseclient_QueryCoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.17.18.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_查询机构信息出现错误！',v_mysql_message);
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

# 事务_公共_基础客户端_查询系统配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_QuerySysConfig;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_QuerySysConfig(
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
    

    /* [变量补分隔符][@配置编号串#] */
    set v_config_no_str = concat(";", v_config_no_str,";");


    /* 调用【原子_公共_基础客户端_查询系统配置】*/
    call db_pub.pra_baseclient_QuerySysConfig(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_config_no_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.17.32.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_查询系统配置出现错误！',v_mysql_message);
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

# 事务_公共_基础客户端_查询机构汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_QueryCoExchRate;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_QueryCoExchRate(
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
    

    /* 调用【原子_公共_基础客户端_查询机构汇率】*/
    call db_pub.pra_baseclient_QueryCoExchRate(
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
        SET v_error_code = "pubT.17.38.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_查询机构汇率出现错误！',v_mysql_message);
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

# 事务_公共_基础客户端_获取港股通汇率信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_GetHKRate;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_GetHKRate(
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
    OUT p_sz_hksettle_sell_rate decimal(18,12)
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.17.117.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_获取港股通汇率信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
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

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_基础客户端_更新港股通额度信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_UpdateHKLimitInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_UpdateHKLimitInfo(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础客户端_更新港股通额度信息】*/
        call db_pub.pra_baseclient_UpdateHKLimitInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_begin_limit,
            v_remain_limit,
            v_limit_status,
            v_remark_info,
            v_error_code,
            v_error_info,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pubT.17.118.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_更新港股通额度信息出现错误！',v_mysql_message);
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

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_基础客户端_查询港股通额度信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_QueryHKLimitInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_QueryHKLimitInfo(
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
    

    /* 调用【原子_公共_基础客户端_查询港股通额度信息】*/
    call db_pub.pra_baseclient_QueryHKLimitInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.17.119.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_查询港股通额度信息出现错误！',v_mysql_message);
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

# 事务_公共_基础客户端_上线通道
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_LoginChannel;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_LoginChannel(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础客户端_上线通道】*/
        call db_pub.pra_baseclient_LoginChannel(
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
            SET v_error_code = "pubT.17.154.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_上线通道出现错误！',v_mysql_message);
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

# 事务_公共_基础客户端_下线通道
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_LogoutChannel;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_LogoutChannel(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础客户端_下线通道】*/
        call db_pub.pra_baseclient_LogoutChannel(
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
            SET v_error_code = "pubT.17.155.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_下线通道出现错误！',v_mysql_message);
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

# 事务_公共_基础客户端_查询数据字典
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_QueryDictionary;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_QueryDictionary(
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
    

    /* 调用【原子_公共_基础客户端_查询数据字典】*/
    call db_pub.pra_baseclient_QueryDictionary(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_dict_no,
        v_dict_item_name,
        v_dict_field_name,
        v_time_stamp,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.17.180.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_查询数据字典出现错误！',v_mysql_message);
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

# 事务_公共_基础客户端_查询业务标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_QueryBusiFlag;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_QueryBusiFlag(
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
    

    /* 调用【原子_公共_基础客户端_查询业务标志】*/
    call db_pub.pra_baseclient_QueryBusiFlag(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_type,
        v_busi_sub_type,
        v_busi_flag,
        v_busi_name,
        v_time_stamp,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.17.181.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_查询业务标志出现错误！',v_mysql_message);
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

# 事务_公共_基础客户端_获取所需港股通汇率信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_GetHKRatePurposely;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_GetHKRatePurposely(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础客户端_获取所需港股通汇率信息】*/
    call db_pub.pra_baseclient_GetHKRatePurposely(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_date,
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
        v_busin_date,
        v_pboc_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.17.120.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_获取所需港股通汇率信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
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

# 事务_公共_基础客户端_新增所需港股通汇率信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_AddHKRatePurposely;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_AddHKRatePurposely(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础客户端_新增所需港股通汇率信息】*/
        call db_pub.pra_baseclient_AddHKRatePurposely(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_sh_hk_buy_ref_rate,
            v_sh_hk_sell_ref_rate,
            v_sh_hk_settle_buy_rate,
            v_sh_hk_settle_sell_rate,
            v_sz_hk_buy_ref_rate,
            v_sz_hk_sell_ref_rate,
            v_sz_hk_settle_buy_rate,
            v_sz_hksettle_sell_rate,
            v_pboc_rate,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.17.121.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_新增所需港股通汇率信息出现错误！',v_mysql_message);
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

# 事务_公共_基础客户端_修改所需港股通汇率信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_EditHKRatePurposely;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_EditHKRatePurposely(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础客户端_修改所需港股通汇率信息】*/
        call db_pub.pra_baseclient_EditHKRatePurposely(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_sh_hk_buy_ref_rate,
            v_sh_hk_sell_ref_rate,
            v_sh_hk_settle_buy_rate,
            v_sh_hk_settle_sell_rate,
            v_sz_hk_buy_ref_rate,
            v_sz_hk_sell_ref_rate,
            v_sz_hk_settle_buy_rate,
            v_sz_hksettle_sell_rate,
            v_pboc_rate,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.17.122.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_修改所需港股通汇率信息出现错误！',v_mysql_message);
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

# 事务_公共_基础客户端_修改新股代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_EditNewStockInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_EditNewStockInfo(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础客户端_修改新股代码信息】*/
        call db_pub.pra_baseclient_EditNewStockInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_apply_date,
            v_apply_limit,
            v_begin_trade_date,
            v_issue_price,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.17.123.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_修改新股代码信息出现错误！',v_mysql_message);
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

# 事务_公共_基础客户端_修改可转债代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_EditConvertibleBbondInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_EditConvertibleBbondInfo(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础客户端_修改可转债代码信息】*/
        call db_pub.pra_baseclient_EditConvertibleBbondInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_apply_date,
            v_apply_limit,
            v_begin_trade_date,
            v_issue_price,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.17.124.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_修改可转债代码信息出现错误！',v_mysql_message);
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

# 事务_公共_基础客户端_新增对冲篮子信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_AddHedgingBasket;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_AddHedgingBasket(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础客户端_新增对冲篮子信息】*/
        call db_pub.pra_baseclient_AddHedgingBasket(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_record_batch_no,
            v_co_no,
            v_comm_trd_type,
            v_basket_id,
            v_basket_name,
            v_futu_qty,
            v_spot_qty,
            v_basket_copies,
            v_cash_replace_amt,
            v_hedging_pankou,
            v_name_base_diff,
            v_basket_base_diff,
            v_track_base_diff,
            v_error_code,
            v_error_info,
            v_row_id);
        if v_error_code = "1" then
            SET v_error_code = "pubT.17.125.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_新增对冲篮子信息出现错误！',v_mysql_message);
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

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_基础客户端_查询对冲篮子信息结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_QueryHedgingBasketList;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_QueryHedgingBasketList(
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
    

        /* 调用【原子_公共_基础客户端_查询对冲篮子信息结果集】*/
        call db_pub.pra_baseclient_QueryHedgingBasketList(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_comm_trd_type,
            v_record_batch_no,
            v_row_id,
            v_row_count,
            v_sort_type,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.17.126.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_查询对冲篮子信息结果集出现错误！',v_mysql_message);
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

# 事务_公共_基础客户端_查询历史对冲篮子信息结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_QueryHisHedgingBasketList;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_QueryHisHedgingBasketList(
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
    

        /* 调用【原子_公共_基础客户端_查询历史对冲篮子信息结果集】*/
        call db_pub.pra_baseclient_QueryHisHedgingBasketList(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_begin_date,
            v_end_date,
            v_co_no,
            v_comm_trd_type,
            v_record_batch_no,
            v_row_id,
            v_row_count,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.17.127.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_查询历史对冲篮子信息结果集出现错误！',v_mysql_message);
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

# 事务_公共_基础客户端_修改对冲篮子信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_ModiHedgingBasket;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_ModiHedgingBasket(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_基础客户端_修改对冲篮子信息】*/
        call db_pub.pra_baseclient_ModiHedgingBasket(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_record_batch_no,
            v_init_date,
            v_co_no,
            v_basket_copies,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pubT.17.128.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础客户端_修改对冲篮子信息出现错误！',v_mysql_message);
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

# 事务_公共_基础客户端_查询对冲篮子信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_QueryHedgingBasket;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_QueryHedgingBasket(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

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
        SET v_error_code = "pubT.17.129.999";
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

# 事务_公共_基础客户端_清空篮子剩余份数
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_baseclient_ClearHedgingBasketCpoies;;
DELIMITER ;;
CREATE PROCEDURE prt_baseclient_ClearHedgingBasketCpoies(
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
            SET v_error_code = "pubT.17.130.999";
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
        SET v_error_code = "pubT.17.130.999";
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


