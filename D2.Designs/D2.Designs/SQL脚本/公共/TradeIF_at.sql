DELIMITER ;;
use db_pub;;

# 原子_公共_交易接口_检查指令系统状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_trdif_CheckApprSysStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_trdif_CheckApprSysStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_co_comm_appr_oper int,
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
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_sys_config_str varchar(64);
    declare v_sys_status varchar(2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_co_name varchar(64);
    declare v_co_flname varchar(255);
    declare v_co_type int;
    declare v_reg_code varchar(16);
    declare v_reg_addr varchar(32);
    declare v_found_date int;
    declare v_reg_date int;
    declare v_conta_addr varchar(255);
    declare v_conta_name varchar(64);
    declare v_phone_number varchar(16);
    declare v_email varchar(255);
    declare v_pd_qty_max int;
    declare v_max_acco_count int;
    declare v_opor_qty_max int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_config_str varchar(64);
    declare v_comm_appr_oper int;
    declare v_market_price_ratio decimal(18,12);
    declare v_mul_acco_trd_assign_set varchar(64);
    declare v_mul_acco_trd_choice int;
    declare v_mul_acco_trd_qty_set varchar(64);
    declare v_genus_algo_strategy_set varchar(64);
    declare v_base_crncy_type varchar(3);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_co_comm_appr_oper = 0;
    SET v_sys_config_str = " ";
    SET v_sys_status = "0";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_co_name = " ";
    SET v_co_flname = " ";
    SET v_co_type = 0;
    SET v_reg_code = " ";
    SET v_reg_addr = " ";
    SET v_found_date = date_format(curdate(),'%Y%m%d');
    SET v_reg_date = date_format(curdate(),'%Y%m%d');
    SET v_conta_addr = " ";
    SET v_conta_name = " ";
    SET v_phone_number = " ";
    SET v_email = " ";
    SET v_pd_qty_max = 0;
    SET v_max_acco_count = 0;
    SET v_opor_qty_max = 0;
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_busi_config_str = " ";
    SET v_comm_appr_oper = 0;
    SET v_market_price_ratio = 0;
    SET v_mul_acco_trd_assign_set = " ";
    SET v_mul_acco_trd_choice = 0;
    SET v_mul_acco_trd_qty_set = " ";
    SET v_genus_algo_strategy_set = " ";
    SET v_base_crncy_type = "CNY";
    SET v_co_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][{系统状态},{初始化日期},{系统控制配置串}][@系统状态#,@初始化日期#,@系统控制配置串#][1=1][4][" "] */
    select sys_status,init_date,sys_config_str into v_sys_status,v_init_date,v_sys_config_str from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.6.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@系统状态# = 《系统状态-停止》][6][@系统状态#] */
    if v_sys_status = "2" then
        
        SET v_error_code = "pubA.25.6.6";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("系统状态=",v_sys_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("系统状态=",v_sys_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@系统状态# = 《系统状态-维护》][7]["系统维护中"] */
    if v_sys_status = "3" then
        
        SET v_error_code = "pubA.25.6.7";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("系统维护中","#",v_mysql_message);
        else
            SET v_error_info = "系统维护中";
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_基础_机构信息表][字段][字段变量][{机构编号}=@操作员机构编号#][4][@操作员机构编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        co_name, co_flname, co_type, reg_code, 
        reg_addr, found_date, reg_date, conta_addr, 
        conta_name, phone_number, email, pd_qty_max, 
        max_acco_count, opor_qty_max, allow_exch, allow_stock_type, 
        busi_config_str, comm_appr_oper, market_price_ratio, mul_acco_trd_assign_set, 
        mul_acco_trd_choice, mul_acco_trd_qty_set, genus_algo_strategy_set, base_crncy_type, 
        co_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_co_name, v_co_flname, v_co_type, v_reg_code, 
        v_reg_addr, v_found_date, v_reg_date, v_conta_addr, 
        v_conta_name, v_phone_number, v_email, v_pd_qty_max, 
        v_max_acco_count, v_opor_qty_max, v_allow_exch, v_allow_stock_type, 
        v_busi_config_str, v_comm_appr_oper, v_market_price_ratio, v_mul_acco_trd_assign_set, 
        v_mul_acco_trd_choice, v_mul_acco_trd_qty_set, v_genus_algo_strategy_set, v_base_crncy_type, 
        v_co_status from db_pub.tb_base_co_info where co_no=v_opor_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.6.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 《机构状态-冻结》][54]["机构已冻结"] */
    if v_co_status = "2" then
        
        SET v_error_code = "pubA.25.6.54";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("机构已冻结","#",v_mysql_message);
        else
            SET v_error_info = "机构已冻结";
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 《机构状态-注销》][55]["机构已注销"] */
    if v_co_status = "3" then
        
        SET v_error_code = "pubA.25.6.55";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("机构已注销","#",v_mysql_message);
        else
            SET v_error_info = "机构已注销";
        end if;
        leave label_pro;
    end if;

    #检查机构级业务限制
    #如果传入的市场编号有值，检查是否可操作

    /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][56][@市场编号#,@允许投资市场#] */
    if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
        
        SET v_error_code = "pubA.25.6.56";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
        end if;
        leave label_pro;
    end if;

    #如果传入的证券类型有值，检查是否可操作

    /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][57][@证券类型#,@允许操作证券类型#] */
    if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
        
        SET v_error_code = "pubA.25.6.57";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
        end if;
        leave label_pro;
    end if;


    /* set @机构业务控制配置串# = @业务控制配置串#; */
    set v_co_busi_config_str = v_busi_config_str;

    /* set @机构指令审批操作员# = @指令审批操作员#; */
    set v_co_comm_appr_oper = v_comm_appr_oper;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_co_comm_appr_oper = v_co_comm_appr_oper;
    SET p_sys_config_str = v_sys_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_交易接口_检查交易系统状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_trdif_CheckTrdSysStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_trdif_CheckTrdSysStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_sys_config_str varchar(64),
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
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_sys_config_str varchar(64);
    declare v_co_busi_config_str varchar(64);
    declare v_sys_status varchar(2);
    declare v_co_status varchar(2);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_type = p_stock_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_config_str = " ";
    SET v_co_busi_config_str = " ";
    SET v_sys_status = "0";
    SET v_co_status = "0";
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][{系统状态},{初始化日期},{系统控制配置串}][@系统状态#,@初始化日期#,@系统控制配置串#][1=1][4][" "] */
    select sys_status,init_date,sys_config_str into v_sys_status,v_init_date,v_sys_config_str from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.7.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@系统状态# = 《系统状态-停止》][6][@系统状态#] */
    if v_sys_status = "2" then
        
        SET v_error_code = "pubA.25.7.6";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("系统状态=",v_sys_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("系统状态=",v_sys_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@系统状态# = 《系统状态-维护》][7]["系统维护中"] */
    if v_sys_status = "3" then
        
        SET v_error_code = "pubA.25.7.7";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("系统维护中","#",v_mysql_message);
        else
            SET v_error_info = "系统维护中";
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_基础_机构信息表][{机构状态},{业务控制配置串},{允许投资市场},{允许操作证券类型}][@机构状态#,@机构业务控制配置串#,@允许投资市场#,@允许操作证券类型#][{机构编号}=@操作员机构编号#][4][@操作员机构编号#] */
    select co_status,busi_config_str,allow_exch,allow_stock_type into v_co_status,v_co_busi_config_str,v_allow_exch,v_allow_stock_type from db_pub.tb_base_co_info where co_no=v_opor_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.7.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 《机构状态-冻结》][54]["机构已冻结"] */
    if v_co_status = "2" then
        
        SET v_error_code = "pubA.25.7.54";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("机构已冻结","#",v_mysql_message);
        else
            SET v_error_info = "机构已冻结";
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 《机构状态-注销》][55]["机构已注销"] */
    if v_co_status = "3" then
        
        SET v_error_code = "pubA.25.7.55";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("机构已注销","#",v_mysql_message);
        else
            SET v_error_info = "机构已注销";
        end if;
        leave label_pro;
    end if;

    #如果传入的市场编号有值，检查是否可操作

    /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][56][@市场编号#,@允许投资市场#] */
    if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
        
        SET v_error_code = "pubA.25.7.56";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
        end if;
        leave label_pro;
    end if;

    #如果传入的证券类型有值，检查是否可操作

    /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][57][@证券类型#,@允许操作证券类型#] */
    if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
        
        SET v_error_code = "pubA.25.7.57";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_sys_config_str = v_sys_config_str;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_交易接口_检查交易系统状态权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_trdif_CheckTrdSysStatusAuth;;
DELIMITER ;;
CREATE PROCEDURE pra_trdif_CheckTrdSysStatusAuth(
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
    OUT p_co_busi_config_str varchar(64),
    OUT p_allow_exch varchar(64),
    OUT p_allow_stock_type varchar(2048),
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
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_sys_config_str varchar(64);
    declare v_sys_status varchar(2);
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_sys_config_str = " ";
    SET v_sys_status = "0";
    SET v_co_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][{系统状态},{初始化日期},{系统控制配置串}][@系统状态#,@初始化日期#,@系统控制配置串#][1=1][4][" "] */
    select sys_status,init_date,sys_config_str into v_sys_status,v_init_date,v_sys_config_str from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.8.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@系统状态# = 《系统状态-停止》][6][@系统状态#] */
    if v_sys_status = "2" then
        
        SET v_error_code = "pubA.25.8.6";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("系统状态=",v_sys_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("系统状态=",v_sys_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@系统状态# = 《系统状态-维护》][7]["系统维护中"] */
    if v_sys_status = "3" then
        
        SET v_error_code = "pubA.25.8.7";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("系统维护中","#",v_mysql_message);
        else
            SET v_error_info = "系统维护中";
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_基础_机构信息表][{机构状态},{业务控制配置串},{允许投资市场},{允许操作证券类型}][@机构状态#,@机构业务控制配置串#,@允许投资市场#,@允许操作证券类型#][{机构编号}=@操作员机构编号#][4][@操作员机构编号#] */
    select co_status,busi_config_str,allow_exch,allow_stock_type into v_co_status,v_co_busi_config_str,v_allow_exch,v_allow_stock_type from db_pub.tb_base_co_info where co_no=v_opor_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.8.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 《机构状态-冻结》][54]["机构已冻结"] */
    if v_co_status = "2" then
        
        SET v_error_code = "pubA.25.8.54";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("机构已冻结","#",v_mysql_message);
        else
            SET v_error_info = "机构已冻结";
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@机构状态# = 《机构状态-注销》][55]["机构已注销"] */
    if v_co_status = "3" then
        
        SET v_error_code = "pubA.25.8.55";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("机构已注销","#",v_mysql_message);
        else
            SET v_error_info = "机构已注销";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_allow_exch = v_allow_exch;
    SET p_allow_stock_type = v_allow_stock_type;
    SET p_sys_config_str = v_sys_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_交易接口_检查基金转换指令业务属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_trdif_CheckFundTransApprProp;;
DELIMITER ;;
CREATE PROCEDURE pra_trdif_CheckFundTransApprProp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_target_stock_code varchar(6),
    IN p_comm_dir int,
    IN p_comm_qty decimal(18,2),
    IN p_comm_limit_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_target_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_par_value decimal(16,9),
    OUT p_subscription_trade_mark int,
    OUT p_purchase_trade_mark int,
    OUT p_rede_trade_mark int,
    OUT p_first_minimum_amt decimal(18,4),
    OUT p_minimum_purchase_amt decimal(18,4),
    OUT p_minimum_subscription_amt decimal(18,4),
    OUT p_minimum_rede_share decimal(18,2),
    OUT p_minimum_holding_share decimal(18,2),
    OUT p_minimum_turning_out_share decimal(18,2),
    OUT p_target_subscription_trade_mark int,
    OUT p_target_purchase_trade_mark int,
    OUT p_target_rede_trade_mark int,
    OUT p_target_first_minimum_amt decimal(18,4),
    OUT p_target_minimum_purchase_amt decimal(18,4),
    OUT p_target_minimum_subscription_amt decimal(18,4),
    OUT p_target_minimum_rede_share decimal(18,2),
    OUT p_target_minimum_holding_share decimal(18,2),
    OUT p_target_minimum_turning_out_share decimal(18,2),
    OUT p_fund_manager varchar(64),
    OUT p_target_fund_manager varchar(64),
    OUT p_charging_method int,
    OUT p_target_charging_method int
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
    declare v_target_stock_code varchar(6);
    declare v_comm_dir int;
    declare v_comm_qty decimal(18,2);
    declare v_comm_limit_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_target_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_par_value decimal(16,9);
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_minimum_turning_out_share decimal(18,2);
    declare v_target_subscription_trade_mark int;
    declare v_target_purchase_trade_mark int;
    declare v_target_rede_trade_mark int;
    declare v_target_first_minimum_amt decimal(18,4);
    declare v_target_minimum_purchase_amt decimal(18,4);
    declare v_target_minimum_subscription_amt decimal(18,4);
    declare v_target_minimum_rede_share decimal(18,2);
    declare v_target_minimum_holding_share decimal(18,2);
    declare v_target_minimum_turning_out_share decimal(18,2);
    declare v_fund_manager varchar(64);
    declare v_target_fund_manager varchar(64);
    declare v_charging_method int;
    declare v_target_charging_method int;
    declare v_price_type int;
    declare v_stop_status varchar(2);
    declare v_tmp_stop_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_target_stock_code = p_target_stock_code;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_par_value = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_minimum_turning_out_share = 0;
    SET v_target_subscription_trade_mark = 0;
    SET v_target_purchase_trade_mark = 0;
    SET v_target_rede_trade_mark = 0;
    SET v_target_first_minimum_amt = 0;
    SET v_target_minimum_purchase_amt = 0;
    SET v_target_minimum_subscription_amt = 0;
    SET v_target_minimum_rede_share = 0;
    SET v_target_minimum_holding_share = 0;
    SET v_target_minimum_turning_out_share = 0;
    SET v_fund_manager = " ";
    SET v_target_fund_manager = " ";
    SET v_charging_method = 0;
    SET v_target_charging_method = 0;
    SET v_price_type = 0;
    SET v_stop_status = "0";
    SET v_tmp_stop_status = "0";

    
    label_pro:BEGIN
    

    /* set @价格类型# = 《价格类型-限价》; */
    set v_price_type = 1;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}, {证券类型}, {资产类型}, {本币币种}, {交易币种}, {资金回转天数}, {持仓回转天数}, {票面面值}, {停牌标志}][@证券代码编号#, @证券类型#, @资产类型#, @本币币种#, @交易币种#, @资金回转天数#, @持仓回转天数#, @票面面值#, @停牌标志#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#, @证券代码#] */
    select stock_code_no, stock_type, asset_type, crncy_type, exch_crncy_type, capit_reback_days, posi_reback_days, par_value, stop_status into v_stock_code_no, v_stock_type, v_asset_type, v_crncy_type, v_exch_crncy_type, v_capit_reback_days, v_posi_reback_days, v_par_value, v_stop_status from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.9.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@停牌标志# <> 《停牌标志-正常》][8][@证券代码#] */
    if v_stop_status <> "1" then
        
        SET v_error_code = "pubA.25.9.8";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}, {停牌标志}][@目标证券代码编号#, @临时_停牌标志#][{市场编号}=@市场编号# and {证券代码}=@目标证券代码#][4][@市场编号#, @目标证券代码#] */
    select stock_code_no, stop_status into v_target_stock_code_no, v_tmp_stop_status from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_target_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.9.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 目标证券代码=", v_target_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 目标证券代码=", v_target_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@临时_停牌标志# <> 《停牌标志-正常》][8][@目标证券代码#] */
    if v_tmp_stop_status <> "1" then
        
        SET v_error_code = "pubA.25.9.8";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标证券代码=",v_target_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标证券代码=",v_target_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_基金属性信息表][{认购交易标志},{申购交易标志},{赎回交易标志},{首次最低金额},{最低申购金额},{最低认购金额},{最低赎回份额},{最低持有份额},{基金管理人},{收费方式},{最低转出份额}][@认购交易标志#,@申购交易标志#,@赎回交易标志#,@首次最低金额#,@最低申购金额#,@最低认购金额#,@最低赎回份额#,@最低持有份额#,@基金管理人#,@收费方式#,@最低转出份额#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
    select subscription_trade_mark,purchase_trade_mark,rede_trade_mark,first_minimum_amt,minimum_purchase_amt,minimum_subscription_amt,minimum_rede_share,minimum_holding_share,fund_manager,charging_method,minimum_turning_out_share into v_subscription_trade_mark,v_purchase_trade_mark,v_rede_trade_mark,v_first_minimum_amt,v_minimum_purchase_amt,v_minimum_subscription_amt,v_minimum_rede_share,v_minimum_holding_share,v_fund_manager,v_charging_method,v_minimum_turning_out_share from db_pub.tb_basesedt_fund_info where stock_code_no=v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.9.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_基金属性信息表][{认购交易标志},{申购交易标志},{赎回交易标志},{首次最低金额},{最低申购金额},{最低认购金额},{最低赎回份额},{最低持有份额},{基金管理人},{收费方式},{最低转出份额}][@目标认购交易标志#,@目标申购交易标志#,@目标赎回交易标志#,@目标首次最低金额#,@目标最低申购金额#,@目标最低认购金额#,@目标最低赎回份额#,@目标最低持有份额#,@目标基金管理人#,@目标收费方式#,@目标最低转出份额#][{证券代码编号}=@目标证券代码编号#][4][@目标证券代码编号#] */
    select subscription_trade_mark,purchase_trade_mark,rede_trade_mark,first_minimum_amt,minimum_purchase_amt,minimum_subscription_amt,minimum_rede_share,minimum_holding_share,fund_manager,charging_method,minimum_turning_out_share into v_target_subscription_trade_mark,v_target_purchase_trade_mark,v_target_rede_trade_mark,v_target_first_minimum_amt,v_target_minimum_purchase_amt,v_target_minimum_subscription_amt,v_target_minimum_rede_share,v_target_minimum_holding_share,v_target_fund_manager,v_target_charging_method,v_target_minimum_turning_out_share from db_pub.tb_basesedt_fund_info where stock_code_no=v_target_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.9.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标证券代码编号=",v_target_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标证券代码编号=",v_target_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_par_value = v_par_value;
    SET p_subscription_trade_mark = v_subscription_trade_mark;
    SET p_purchase_trade_mark = v_purchase_trade_mark;
    SET p_rede_trade_mark = v_rede_trade_mark;
    SET p_first_minimum_amt = v_first_minimum_amt;
    SET p_minimum_purchase_amt = v_minimum_purchase_amt;
    SET p_minimum_subscription_amt = v_minimum_subscription_amt;
    SET p_minimum_rede_share = v_minimum_rede_share;
    SET p_minimum_holding_share = v_minimum_holding_share;
    SET p_minimum_turning_out_share = v_minimum_turning_out_share;
    SET p_target_subscription_trade_mark = v_target_subscription_trade_mark;
    SET p_target_purchase_trade_mark = v_target_purchase_trade_mark;
    SET p_target_rede_trade_mark = v_target_rede_trade_mark;
    SET p_target_first_minimum_amt = v_target_first_minimum_amt;
    SET p_target_minimum_purchase_amt = v_target_minimum_purchase_amt;
    SET p_target_minimum_subscription_amt = v_target_minimum_subscription_amt;
    SET p_target_minimum_rede_share = v_target_minimum_rede_share;
    SET p_target_minimum_holding_share = v_target_minimum_holding_share;
    SET p_target_minimum_turning_out_share = v_target_minimum_turning_out_share;
    SET p_fund_manager = v_fund_manager;
    SET p_target_fund_manager = v_target_fund_manager;
    SET p_charging_method = v_charging_method;
    SET p_target_charging_method = v_target_charging_method;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_交易接口_检查交易市场状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_trdif_CheckTrdMarketStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_trdif_CheckTrdMarketStatus(
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
    OUT p_buy_ref_rate decimal(18,12),
    OUT p_sell_ref_rate decimal(18,12)
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
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_status int;
    declare v_sys_status varchar(2);
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
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_status = 0;
    SET v_sys_status = "0";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_市场信息表][{本币币种},{交易币种},{市场状态},{初始化日期}][@本币币种#,@交易币种#,@市场状态#,@初始化日期#][{市场编号}=@市场编号#][1][@市场编号#] */
    select crncy_type,exch_crncy_type,exch_status,init_date into v_crncy_type,v_exch_crncy_type,v_exch_status,v_init_date from db_pub.tb_base_exch_info where exch_no=v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.10.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@市场状态# = 《市场状态-关闭》][6][@系统状态#] */
    if v_exch_status = 2 then
        
        SET v_error_code = "pubA.25.10.6";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("系统状态=",v_sys_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("系统状态=",v_sys_status);
        end if;
        leave label_pro;
    end if;

    #如果市场是上交所或者深交所 , 那么将市场赋值为3,去取港股的参考汇率
    #if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 then
       # set @市场编号#=3;
    #end if;
    #if @市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号# = 《市场编号-深港通证券交易所》 then
       # [获取表记录变量][公共_基础_港股通汇率表][{记录序号},{买入参考汇率},{卖出参考汇率}][@记录序号#,@买入参考汇率#,@卖出参考汇率#][{市场编号} = @市场编号# and {初始化日期} = @初始化日期#][4][concat(@初始化日期#,"的港股通汇率数据不存在 !")]
    #else
     #   set @买入参考汇率# = 1;
      #  set @卖出参考汇率# = 1;
    #end if;
    #A股也得获取汇率，下A股单时，算港股资金可用 Modify by wjp 20190619

    /* [获取表记录变量语句][公共_基础_港股通汇率表][ifnull({记录序号},0),{买入参考汇率},{卖出参考汇率}][@记录序号#,@买入参考汇率#,@卖出参考汇率#][{市场编号} = 《市场编号-沪港通证券交易所》 and {初始化日期} = @初始化日期#] */
    select ifnull(row_id,0),buy_ref_rate,sell_ref_rate into v_row_id,v_buy_ref_rate,v_sell_ref_rate from db_pub.tb_base_hk_exch_rate where exch_no = 3 and init_date = v_init_date limit 1;


    /* if @记录序号#=0 then */
    if v_row_id=0 then

        /* set @买入参考汇率# = 1; */
        set v_buy_ref_rate = 1;

        /* set @卖出参考汇率# = 1; */
        set v_sell_ref_rate = 1;

       /* [检查报错返回][@市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号# = 《市场编号-深港通证券交易所》][4][concat(@初始化日期#,"的港股通汇率数据不存在 !")] */
       if v_exch_no = 3 or v_exch_no = 4 then
           
           SET v_error_code = "pubA.25.10.4";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat(v_init_date,"的港股通汇率数据不存在 !"),"#",v_mysql_message);
           else
               SET v_error_info = concat(v_init_date,"的港股通汇率数据不存在 !");
           end if;
           leave label_pro;
       end if;

    end if;
    #if @本币币种# <> @交易币种# and @机构编号# <>0 then
    #    [获取表记录变量语句][公共_基础_机构汇率表][{购汇汇率}][@汇率#][{机构编号}=@机构编号# and {外币币种}=@交易币种# and {本币币种}=@本币币种#]
    #    if FOUND_ROWS() = 0 then
    #        set @汇率# = 1;
    #    end if;
    #else
    #    set @汇率# = 1;
    #end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_buy_ref_rate = v_buy_ref_rate;
    SET p_sell_ref_rate = v_sell_ref_rate;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_交易接口_检查证券指令业务属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_trdif_CheckSecuApprProp;;
DELIMITER ;;
CREATE PROCEDURE pra_trdif_CheckSecuApprProp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_comm_dir int,
    IN p_comm_qty decimal(18,2),
    IN p_comm_limit_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_bond_rate_type int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_min_unit int,
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9),
    OUT p_target_code_no int,
    OUT p_target_code varchar(6),
    OUT p_target_code_stock_type int,
    OUT p_target_code_asset_type int,
    OUT p_trade_code_no int,
    OUT p_trade_code varchar(6),
    OUT p_trade_code_stock_type int,
    OUT p_trade_code_asset_type int,
    OUT p_pre_close_price decimal(16,9),
    OUT p_subscription_trade_mark int,
    OUT p_purchase_trade_mark int,
    OUT p_rede_trade_mark int,
    OUT p_first_minimum_amt decimal(18,4),
    OUT p_minimum_purchase_amt decimal(18,4),
    OUT p_minimum_subscription_amt decimal(18,4),
    OUT p_minimum_rede_share decimal(18,2),
    OUT p_minimum_holding_share decimal(18,2),
    OUT p_minimum_turning_out_share decimal(18,2)
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
    declare v_comm_dir int;
    declare v_comm_qty decimal(18,2);
    declare v_comm_limit_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code_no int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_pre_close_price decimal(16,9);
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_minimum_turning_out_share decimal(18,2);
    declare v_price_type int;
    declare v_min_qty decimal(18,2);
    declare v_max_qty decimal(18,2);
    declare v_stop_status varchar(2);
    declare v_is_order_dir_flag int;
    declare v_hk_stock_flag int;
    declare v_apply_date int;
    declare v_apply_limit decimal(18,2);
    declare v_fina_marg_ratio decimal(18,12);
    declare v_secu_loan_marg_ratio decimal(18,12);
    declare v_fina_status varchar(2);
    declare v_secu_loan_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_comm_dir = p_comm_dir;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_pre_close_price = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_minimum_turning_out_share = 0;
    SET v_price_type = 0;
    SET v_min_qty = 0;
    SET v_max_qty = 0;
    SET v_stop_status = "0";
    SET v_is_order_dir_flag = 0;
    SET v_hk_stock_flag = 0;
    SET v_apply_date = 0;
    SET v_apply_limit = 0;
    SET v_fina_marg_ratio = 0;
    SET v_secu_loan_marg_ratio = 0;
    SET v_fina_status = "0";
    SET v_secu_loan_status = "0";

    
    label_pro:BEGIN
    

    /* set @价格类型# = 《价格类型-限价》; */
    set v_price_type = 1;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}, {证券类型}, {资产类型}, {本币币种}, {交易币种}, {资金回转天数}, {持仓回转天数}, {票面面值}, {最小单位}, {最小数量}, {最大数量}, {停牌标志}, {区分订单方向标志}, {港股通标的}][@证券代码编号#, @证券类型#, @资产类型#, @本币币种#, @交易币种#, @资金回转天数#, @持仓回转天数#, @票面面值#, @最小单位#, @最小数量#, @最大数量#, @停牌标志#, @区分订单方向标志#, @港股通标的#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#, @证券代码#] */
    select stock_code_no, stock_type, asset_type, crncy_type, exch_crncy_type, capit_reback_days, posi_reback_days, par_value, min_unit, min_qty, max_qty, stop_status, is_order_dir_flag, hk_stock_flag into v_stock_code_no, v_stock_type, v_asset_type, v_crncy_type, v_exch_crncy_type, v_capit_reback_days, v_posi_reback_days, v_par_value, v_min_unit, v_min_qty, v_max_qty, v_stop_status, v_is_order_dir_flag, v_hk_stock_flag from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.11.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code);
        end if;
        leave label_pro;
    end if;

    #停牌票，客户端做提示。[检查报错返回][@停牌标志# <> 《停牌标志-正常》][8][@证券代码#]
    #债券的卖出最小单位为1,20180626

    /* if @证券类型#>=21 and @证券类型#<=45 and @指令方向#=2 then */
    if v_stock_type>=21 and v_stock_type<=45 and v_comm_dir=2 then

        /* set @最小单位#=1; */
        set v_min_unit=1;
    end if;

    /* if @指令方向#=《指令方向-融资回购》 or @指令方向#=《指令方向-融券回购》 or @指令方向#=《指令方向-质押提交》 or @指令方向#=《指令方向-质押转回》 or @指令方向#=《指令方向-新股申购》 then */
    if v_comm_dir=3 or v_comm_dir=4 or v_comm_dir=21 or v_comm_dir=22 or v_comm_dir=11 then

        /* [获取表记录变量][公共_证券基础数据_证券代码映射表][{交易代码},{标的代码}][@交易代码#,@标的代码#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
        select trade_code,target_code into v_trade_code,v_target_code from db_pub.tb_basesedt_code_map where stock_code_no=v_stock_code_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.11.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型},{资产类型}][@交易代码编号#,@交易代码证券类型#,@交易代码资产类型#][{市场编号}=@市场编号# and {证券代码}=@交易代码#][4][@市场编号#,@交易代码#] */
        select stock_code_no,stock_type,asset_type into v_trade_code_no,v_trade_code_stock_type,v_trade_code_asset_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_trade_code limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.11.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型},{资产类型}][@标的代码编号#,@标的代码证券类型#,@标的代码资产类型#][{市场编号}=@市场编号# and {证券代码}=@标的代码#][4][@市场编号#,@标的代码#] */
        select stock_code_no,stock_type,asset_type into v_target_code_no,v_target_code_stock_type,v_target_code_asset_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_target_code limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.11.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","标的代码=",v_target_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","标的代码=",v_target_code);
            end if;
            leave label_pro;
        end if;


        /* if @指令方向#=《指令方向-新股申购》 then */
        if v_comm_dir=11 then

            /* [获取表记录变量语句][公共_证券基础数据_证券新股代码信息表][{申购日期},{申购上限}][@申购日期#,@申购上限#][{证券代码编号}=@证券代码编号#] */
            select apply_date,apply_limit into v_apply_date,v_apply_limit from db_pub.tb_basesedt_new_stock_code_info where stock_code_no=v_stock_code_no limit 1;


            /* [检查报错返回][@申购上限# >0 and @申购上限# < @指令数量#][772][@申购上限#,@指令数量#] */
            if v_apply_limit >0 and v_apply_limit < v_comm_qty then
                
                SET v_error_code = "pubA.25.11.772";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("申购上限=",v_apply_limit,",","指令数量=",v_comm_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("申购上限=",v_apply_limit,",","指令数量=",v_comm_qty);
                end if;
                leave label_pro;
            end if;

        end if;
    else

        /* set @标的代码编号# = @证券代码编号#; */
        set v_target_code_no = v_stock_code_no;

        /* set @标的代码# = @证券代码#; */
        set v_target_code = v_stock_code;

        /* set @标的代码证券类型# = @证券类型#; */
        set v_target_code_stock_type = v_stock_type;

        /* set @标的代码资产类型# = @资产类型#; */
        set v_target_code_asset_type = v_asset_type;

        /* set @交易代码编号# = @证券代码编号#; */
        set v_trade_code_no = v_stock_code_no;

        /* set @交易代码# = @证券代码#; */
        set v_trade_code = v_stock_code;

        /* set @交易代码证券类型# = @证券类型#; */
        set v_trade_code_stock_type = v_stock_type;

        /* set @交易代码资产类型# = @资产类型#; */
        set v_trade_code_asset_type = v_asset_type;
    end if;
    #如果不是新股申购，需要继续检查

    /* if @指令方向# = 《订单方向-新股申购》 then */
    if v_comm_dir = 11 then

        /* [检查报错返回][@价格类型# <> 《价格类型-限价》][701][@价格类型#,@指令方向#] */
        if v_price_type <> 1 then
            
            SET v_error_code = "pubA.25.11.701";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("价格类型=",v_price_type,",","指令方向=",v_comm_dir),"#",v_mysql_message);
            else
                SET v_error_info = concat("价格类型=",v_price_type,",","指令方向=",v_comm_dir);
            end if;
            leave label_pro;
        end if;

    else

        /* if @区分订单方向标志# = 《区分订单方向标志-是》 then */
        if v_is_order_dir_flag = 1 then

            /* if @市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号#=《市场编号-深港通证券交易所》 then */
            if v_exch_no = 3 or v_exch_no=4 then

                /* [检查报错返回][@指令方向# = 《指令方向-买入》 and @港股通标的#=《港股通标的-不是》][22][@市场编号#,@证券代码#] */
                if v_comm_dir = 1 and v_hk_stock_flag=2 then
                    
                    SET v_error_code = "pubA.25.11.22";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                    end if;
                    leave label_pro;
                end if;


                /* [获取表记录变量][公共_证券基础数据_证券代码订单方向表][{最小单位},{最小数量},{最大数量}][@最小单位#,@最小数量#,@最大数量#][{证券代码编号}=@证券代码编号# and {订单方向}=@指令方向#][4][@证券代码编号#,@指令方向#] */
                select min_unit,min_qty,max_qty into v_min_unit,v_min_qty,v_max_qty from db_pub.tb_basesedt_stock_code_order_dir where stock_code_no=v_stock_code_no and order_dir=v_comm_dir limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.11.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,",","指令方向=",v_comm_dir),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("证券代码编号=",v_stock_code_no,",","指令方向=",v_comm_dir);
                    end if;
                    leave label_pro;
                end if;

            else

                /* [获取表记录变量][公共_证券基础数据_证券类型订单方向表][{最小单位},{最小数量},{最大数量}][@最小单位#,@最小数量#,@最大数量#][{市场编号}=@市场编号# and {证券类型}=@证券类型# and {订单方向}=@指令方向#][4][@市场编号#,@证券类型#,@指令方向#] */
                select min_unit,min_qty,max_qty into v_min_unit,v_min_qty,v_max_qty from db_pub.tb_basesedt_stock_type_order_dir where exch_no=v_exch_no and stock_type=v_stock_type and order_dir=v_comm_dir limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.11.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券类型=",v_stock_type,",","指令方向=",v_comm_dir),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("市场编号=",v_exch_no,",","证券类型=",v_stock_type,",","指令方向=",v_comm_dir);
                    end if;
                    leave label_pro;
                end if;


               /* if  @证券代码#>=688000  and @证券代码#<=688999  and  @市场编号# = 《市场编号-上海证券交易所》   then */
               if  v_stock_code>=688000  and v_stock_code<=688999  and  v_exch_no = 1   then

                    /* set @最大数量#=100000; */
                    set v_max_qty=100000;

                    /* if  (@指令方向# = 《指令方向-买入》 or  @指令方向# = 《指令方向-融资买入》)  then */
                    if  (v_comm_dir = 1 or  v_comm_dir = 5)  then

                          /* set @最小单位#=1; */
                          set v_min_unit=1;

                          /* set @最小数量#=200; */
                          set v_min_qty=200;
                    end if;
               end if;
            end if;
        end if;

        /* if (@指令方向#<>《指令方向-基金申购》 and @指令方向#<>《指令方向-基金赎回》  and @指令方向#<>《指令方向-基金转换》) then */
        if (v_comm_dir<>9 and v_comm_dir<>10  and v_comm_dir<>12) then
            #如果不是新股申购，需要继续检查

            /* [检查报错返回][mod(@指令数量#, @最小单位#) > 0][9][@证券代码#] */
            if mod(v_comm_qty, v_min_unit) > 0 then
                
                SET v_error_code = "pubA.25.11.9";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("证券代码=",v_stock_code);
                end if;
                leave label_pro;
            end if;


            /* [检查报错返回][@指令数量# < @最小数量#][10][@证券代码#] */
            if v_comm_qty < v_min_qty then
                
                SET v_error_code = "pubA.25.11.10";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("证券代码=",v_stock_code);
                end if;
                leave label_pro;
            end if;

            #指令不校验最大[检查报错返回][@指令数量# > @最大数量#][16][@证券代码#]
        else

            /* [获取表记录变量][公共_证券基础数据_基金属性信息表][{认购交易标志},{申购交易标志},{赎回交易标志},{首次最低金额},{最低认购金额},{最低申购金额},{最低赎回份额},{最低持有份额},{最低转出份额}][@认购交易标志#,@申购交易标志#,@赎回交易标志#,@首次最低金额#,@最低认购金额#,@最低申购金额#,@最低赎回份额#,@最低持有份额#,@最低转出份额#][@市场编号#={市场编号} and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
            select subscription_trade_mark,purchase_trade_mark,rede_trade_mark,first_minimum_amt,minimum_subscription_amt,minimum_purchase_amt,minimum_rede_share,minimum_holding_share,minimum_turning_out_share into v_subscription_trade_mark,v_purchase_trade_mark,v_rede_trade_mark,v_first_minimum_amt,v_minimum_subscription_amt,v_minimum_purchase_amt,v_minimum_rede_share,v_minimum_holding_share,v_minimum_turning_out_share from db_pub.tb_basesedt_fund_info where v_exch_no=exch_no and stock_code=v_stock_code limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.25.11.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                end if;
                leave label_pro;
            end if;

        end if;
        #如果是债券类业务

        /* if @证券类型# > 20 and @证券类型# < 50 then */
        if v_stock_type > 20 and v_stock_type < 50 then

            /* [检查报错返回][@价格类型# <> 《价格类型-限价》 ][703][@价格类型#,@证券类型#] */
            if v_price_type <> 1  then
                
                SET v_error_code = "pubA.25.11.703";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("价格类型=",v_price_type,",","证券类型=",v_stock_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("价格类型=",v_price_type,",","证券类型=",v_stock_type);
                end if;
                leave label_pro;
            end if;


            /* if @指令方向# = 《指令方向-质押提交》 or @指令方向# = 《指令方向-质押转回》 then */
            if v_comm_dir = 21 or v_comm_dir = 22 then

                /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{债券利率类型}, {债券计提利息}, {票面面值},{质押比例},{净价标志},{计息天数}][@债券利率类型#, @债券计提利息#, @票面面值#,@质押比例#,@净价标志#,@计息天数#][{市场编号}=@市场编号# and {证券代码}=@交易代码#][4][@市场编号#,@交易代码#] */
                select bond_rate_type, bond_accr_intrst, par_value,impawn_ratio,net_price_flag,intrst_days into v_bond_rate_type, v_bond_accr_intrst, v_par_value,v_impawn_ratio,v_net_price_flag,v_intrst_days from db_pub.tb_basesedt_bond_info where exch_no=v_exch_no and stock_code=v_trade_code limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.11.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code);
                    end if;
                    leave label_pro;
                end if;


                /* [检查报错返回][@质押比例# = 0][13][@质押比例#] */
                if v_impawn_ratio = 0 then
                    
                    SET v_error_code = "pubA.25.11.13";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("质押比例=",v_impawn_ratio),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("质押比例=",v_impawn_ratio);
                    end if;
                    leave label_pro;
                end if;

            else

                /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{债券利率类型}, {债券计提利息}, {票面面值},{质押比例},{净价标志},{计息天数}][@债券利率类型#, @债券计提利息#, @票面面值#,@质押比例#,@净价标志#,@计息天数#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
                select bond_rate_type, bond_accr_intrst, par_value,impawn_ratio,net_price_flag,intrst_days into v_bond_rate_type, v_bond_accr_intrst, v_par_value,v_impawn_ratio,v_net_price_flag,v_intrst_days from db_pub.tb_basesedt_bond_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.11.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                    end if;
                    leave label_pro;
                end if;

            end if;
        end if;

        /* if @指令方向# <> 《指令方向-质押提交》 and @指令方向# <> 《指令方向-质押转回》 and @指令方向# <>《指令方向-新股申购》 then */
        if v_comm_dir <> 21 and v_comm_dir <> 22 and v_comm_dir <>11 then

            /* [获取表记录变量][公共_证券基础数据_证券行情表][{涨停价},{跌停价},{最新价},{昨收盘价}][@涨停价#,@跌停价#,@最新价#,@昨收盘价#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
            select up_limit_price,down_limit_price,last_price,pre_close_price into v_up_limit_price,v_down_limit_price,v_last_price,v_pre_close_price from db_pub.tb_basesedt_stock_quot where stock_code_no=v_stock_code_no limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.25.11.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;


            /* if @证券类型# > 20 and @证券类型# < 50 then */
            if v_stock_type > 20 and v_stock_type < 50 then

                /* set @涨停价# = 0; */
                set v_up_limit_price = 0;

                /* set @跌停价# = 0; */
                set v_down_limit_price = 0;
            end if;

          /* if  @证券代码#>=688000  and @证券代码#<=688999  and  @市场编号# = 《市场编号-上海证券交易所》   then */
          if  v_stock_code>=688000  and v_stock_code<=688999  and  v_exch_no = 1   then

           /* set @涨停价#=0; */
           set v_up_limit_price=0;

           /* set @跌停价#=0; */
           set v_down_limit_price=0;
         end if;
            #if @指令限价# <> 0 then
               # [检查报错返回][@涨停价# > 0 and @指令限价# > @涨停价#][11][@指令限价#,@涨停价#]
              #  [检查报错返回][@跌停价# > 0 and @指令限价# < @跌停价#][12][@指令限价#,@跌停价#]
            #end if;
        end if;

        /* [检查报错返回][@价格类型# = 《价格类型-限价》 and @指令限价# < 0][702][@价格类型#,@指令限价#] */
        if v_price_type = 1 and v_comm_limit_price < 0 then
            
            SET v_error_code = "pubA.25.11.702";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("价格类型=",v_price_type,",","指令限价=",v_comm_limit_price),"#",v_mysql_message);
            else
                SET v_error_info = concat("价格类型=",v_price_type,",","指令限价=",v_comm_limit_price);
            end if;
            leave label_pro;
        end if;

    end if;
    #两融校验

    /* set @融资保证金比例# = 0; */
    set v_fina_marg_ratio = 0;

    /* set @融券保证金比例# = 0; */
    set v_secu_loan_marg_ratio = 0;

    /* if @指令方向# = 《指令方向-融资买入》 then */
    if v_comm_dir = 5 then

        /* [获取表记录变量][公共_融资融券基础数据_融资融券标的证券表][{融资状态}][@融资状态#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
        select fina_status into v_fina_status from db_pub.tb_basesemdt_secu_margin_underly_secu where stock_code_no=v_stock_code_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.11.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@融资状态# <> 《融资状态-正常》][28][@融资状态#] */
        if v_fina_status <> "1" then
            
            SET v_error_code = "pubA.25.11.28";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("融资状态=",v_fina_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("融资状态=",v_fina_status);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @指令方向# = 《指令方向-融券卖出》 then */
    if v_comm_dir = 6 then

        /* [获取表记录变量][公共_融资融券基础数据_融资融券标的证券表][{融券状态}][@融券状态#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
        select secu_loan_status into v_secu_loan_status from db_pub.tb_basesemdt_secu_margin_underly_secu where stock_code_no=v_stock_code_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.11.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@融券状态# <> 《融券状态-正常》][28][@融券状态#] */
        if v_secu_loan_status <> "1" then
            
            SET v_error_code = "pubA.25.11.28";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("融券状态=",v_secu_loan_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("融券状态=",v_secu_loan_status);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_min_unit = v_min_unit;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;
    SET p_target_code_no = v_target_code_no;
    SET p_target_code = v_target_code;
    SET p_target_code_stock_type = v_target_code_stock_type;
    SET p_target_code_asset_type = v_target_code_asset_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_trade_code = v_trade_code;
    SET p_trade_code_stock_type = v_trade_code_stock_type;
    SET p_trade_code_asset_type = v_trade_code_asset_type;
    SET p_pre_close_price = v_pre_close_price;
    SET p_subscription_trade_mark = v_subscription_trade_mark;
    SET p_purchase_trade_mark = v_purchase_trade_mark;
    SET p_rede_trade_mark = v_rede_trade_mark;
    SET p_first_minimum_amt = v_first_minimum_amt;
    SET p_minimum_purchase_amt = v_minimum_purchase_amt;
    SET p_minimum_subscription_amt = v_minimum_subscription_amt;
    SET p_minimum_rede_share = v_minimum_rede_share;
    SET p_minimum_holding_share = v_minimum_holding_share;
    SET p_minimum_turning_out_share = v_minimum_turning_out_share;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_交易接口_检查交易组操作批量权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_trdif_CheckExchGroupOperBatchRights;;
DELIMITER ;;
CREATE PROCEDURE pra_trdif_CheckExchGroupOperBatchRights(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_split_str varchar(4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int,
    OUT p_exgp_busi_config_str varchar(64)
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_split_str varchar(4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_exgp_busi_config_str varchar(64);
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
    declare v_trade_acco varchar(32);
    declare v_remark_info varchar(255);
    declare v_abolish_date int;
    declare v_futu_default_group_flag int;
    declare v_fina_loan_default_group_flag int;
    declare v_exch_no int;
    declare v_stock_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_split_str = p_split_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_exgp_busi_config_str = " ";
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
    SET v_trade_acco = " ";
    SET v_remark_info = " ";
    SET v_abolish_date = 0;
    SET v_futu_default_group_flag = 0;
    SET v_fina_loan_default_group_flag = 0;
    SET v_exch_no = 0;
    SET v_stock_type = 0;

    
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
                
        SET v_error_code = "pubA.25.14.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    #如果输入参数的产品编号为0，则产品编号取交易组编号对应的产品编号

    /* if @分隔符# = ' ' then */
    if v_split_str = ' ' then

        /* set @分隔符#= ';'; */
        set v_split_str= ';';
    end if;

    /* while LOCATE(@分隔符#,@市场编号串#) <>0   do */
    while LOCATE(v_split_str,v_exch_no_str) <>0   do
        #截取前面每一位

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @证券类型#=cast(substring(@证券类型串#,1,LOCATE(@分隔符#,@证券类型串#)-1) as SIGNED); */
        set v_stock_type=cast(substring(v_stock_type_str,1,LOCATE(v_split_str,v_stock_type_str)-1) as SIGNED);
        #如果交易组状态非正常，报错返回

        /* [检查报错返回][@交易组状态# <> 《交易组状态-正常》][75][@交易组编号#] */
        if v_exch_group_status <> "1" then
            
            SET v_error_code = "pubA.25.14.75";
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
            
            SET v_error_code = "pubA.25.14.77";
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
            
            SET v_error_code = "pubA.25.14.78";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
            end if;
            leave label_pro;
        end if;


        /* set @证券类型串#=substring(@证券类型串#,LOCATE(@分隔符#,@证券类型串#)+1); */
        set v_stock_type_str=substring(v_stock_type_str,LOCATE(v_split_str,v_stock_type_str)+1);

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);
    end while;

    /* set @交易组业务控制配置串#=@业务控制配置串#; */
    set v_exgp_busi_config_str=v_busi_config_str;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_交易接口_检查基金转换交易业务属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_trdif_CheckFundTransExchProp;;
DELIMITER ;;
CREATE PROCEDURE pra_trdif_CheckFundTransExchProp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_target_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_target_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_subscription_trade_mark int,
    OUT p_purchase_trade_mark int,
    OUT p_rede_trade_mark int,
    OUT p_first_minimum_amt decimal(18,4),
    OUT p_minimum_purchase_amt decimal(18,4),
    OUT p_minimum_subscription_amt decimal(18,4),
    OUT p_minimum_rede_share decimal(18,2),
    OUT p_minimum_holding_share decimal(18,2),
    OUT p_minimum_turning_out_share decimal(18,2),
    OUT p_fund_manager varchar(64),
    OUT p_charging_method int,
    OUT p_target_subscription_trade_mark int,
    OUT p_target_purchase_trade_mark int,
    OUT p_target_rede_trade_mark int,
    OUT p_target_first_minimum_amt decimal(18,4),
    OUT p_target_minimum_purchase_amt decimal(18,4),
    OUT p_target_minimum_subscription_amt decimal(18,4),
    OUT p_target_minimum_rede_share decimal(18,2),
    OUT p_target_minimum_holding_share decimal(18,2),
    OUT p_target_minimum_turning_out_share decimal(18,2),
    OUT p_target_fund_manager varchar(64),
    OUT p_target_charging_method int
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
    declare v_target_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_target_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_minimum_turning_out_share decimal(18,2);
    declare v_fund_manager varchar(64);
    declare v_charging_method int;
    declare v_target_subscription_trade_mark int;
    declare v_target_purchase_trade_mark int;
    declare v_target_rede_trade_mark int;
    declare v_target_first_minimum_amt decimal(18,4);
    declare v_target_minimum_purchase_amt decimal(18,4);
    declare v_target_minimum_subscription_amt decimal(18,4);
    declare v_target_minimum_rede_share decimal(18,2);
    declare v_target_minimum_holding_share decimal(18,2);
    declare v_target_minimum_turning_out_share decimal(18,2);
    declare v_target_fund_manager varchar(64);
    declare v_target_charging_method int;
    declare v_stop_status varchar(2);
    declare v_tmp_stop_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_target_stock_code = p_target_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_minimum_turning_out_share = 0;
    SET v_fund_manager = " ";
    SET v_charging_method = 0;
    SET v_target_subscription_trade_mark = 0;
    SET v_target_purchase_trade_mark = 0;
    SET v_target_rede_trade_mark = 0;
    SET v_target_first_minimum_amt = 0;
    SET v_target_minimum_purchase_amt = 0;
    SET v_target_minimum_subscription_amt = 0;
    SET v_target_minimum_rede_share = 0;
    SET v_target_minimum_holding_share = 0;
    SET v_target_minimum_turning_out_share = 0;
    SET v_target_fund_manager = " ";
    SET v_target_charging_method = 0;
    SET v_stop_status = "0";
    SET v_tmp_stop_status = "0";

    
    label_pro:BEGIN
    
    #如果价格类型是市价，则根据配置设置订单价格

    /* if @价格类型# = 0 then */
    if v_price_type = 0 then

        /* set @价格类型# = 《价格类型-限价》; */
        set v_price_type = 1;
    end if;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}, {证券类型}, {资产类型}, {本币币种}, {交易币种}, {资金回转天数}, {持仓回转天数}, {停牌标志}][@证券代码编号#, @证券类型#, @资产类型#, @本币币种#, @交易币种#, @资金回转天数#, @持仓回转天数#, @停牌标志#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#, @证券代码#] */
    select stock_code_no, stock_type, asset_type, crncy_type, exch_crncy_type, capit_reback_days, posi_reback_days, stop_status into v_stock_code_no, v_stock_type, v_asset_type, v_crncy_type, v_exch_crncy_type, v_capit_reback_days, v_posi_reback_days, v_stop_status from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.20.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@停牌标志# <> 《停牌标志-正常》][8][@证券代码#] */
    if v_stop_status <> "1" then
        
        SET v_error_code = "pubA.25.20.8";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}, {停牌标志}][@目标证券代码编号#, @临时_停牌标志#][{市场编号}=@市场编号# and {证券代码}=@目标证券代码#][4][@市场编号#, @目标证券代码#] */
    select stock_code_no, stop_status into v_target_stock_code_no, v_tmp_stop_status from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_target_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.20.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 目标证券代码=", v_target_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 目标证券代码=", v_target_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@临时_停牌标志# <> 《停牌标志-正常》][8][@目标证券代码#] */
    if v_tmp_stop_status <> "1" then
        
        SET v_error_code = "pubA.25.20.8";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标证券代码=",v_target_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标证券代码=",v_target_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_基金属性信息表][{认购交易标志},{申购交易标志},{赎回交易标志},{首次最低金额},{最低申购金额},{最低认购金额},{最低赎回份额},{最低持有份额},{基金管理人},{收费方式},{最低转出份额}][@认购交易标志#,@申购交易标志#,@赎回交易标志#,@首次最低金额#,@最低申购金额#,@最低认购金额#,@最低赎回份额#,@最低持有份额#,@基金管理人#,@收费方式#,@最低转出份额#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
    select subscription_trade_mark,purchase_trade_mark,rede_trade_mark,first_minimum_amt,minimum_purchase_amt,minimum_subscription_amt,minimum_rede_share,minimum_holding_share,fund_manager,charging_method,minimum_turning_out_share into v_subscription_trade_mark,v_purchase_trade_mark,v_rede_trade_mark,v_first_minimum_amt,v_minimum_purchase_amt,v_minimum_subscription_amt,v_minimum_rede_share,v_minimum_holding_share,v_fund_manager,v_charging_method,v_minimum_turning_out_share from db_pub.tb_basesedt_fund_info where stock_code_no=v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.20.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_基金属性信息表][{认购交易标志},{申购交易标志},{赎回交易标志},{首次最低金额},{最低申购金额},{最低认购金额},{最低赎回份额},{最低持有份额},{基金管理人},{收费方式},{最低转出份额}][@目标认购交易标志#,@目标申购交易标志#,@目标赎回交易标志#,@目标首次最低金额#,@目标最低申购金额#,@目标最低认购金额#,@目标最低赎回份额#,@目标最低持有份额#,@目标基金管理人#,@目标收费方式#,@目标最低转出份额#][{证券代码编号}=@目标证券代码编号#][4][@目标证券代码编号#] */
    select subscription_trade_mark,purchase_trade_mark,rede_trade_mark,first_minimum_amt,minimum_purchase_amt,minimum_subscription_amt,minimum_rede_share,minimum_holding_share,fund_manager,charging_method,minimum_turning_out_share into v_target_subscription_trade_mark,v_target_purchase_trade_mark,v_target_rede_trade_mark,v_target_first_minimum_amt,v_target_minimum_purchase_amt,v_target_minimum_subscription_amt,v_target_minimum_rede_share,v_target_minimum_holding_share,v_target_fund_manager,v_target_charging_method,v_target_minimum_turning_out_share from db_pub.tb_basesedt_fund_info where stock_code_no=v_target_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.20.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("目标证券代码编号=",v_target_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("目标证券代码编号=",v_target_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_subscription_trade_mark = v_subscription_trade_mark;
    SET p_purchase_trade_mark = v_purchase_trade_mark;
    SET p_rede_trade_mark = v_rede_trade_mark;
    SET p_first_minimum_amt = v_first_minimum_amt;
    SET p_minimum_purchase_amt = v_minimum_purchase_amt;
    SET p_minimum_subscription_amt = v_minimum_subscription_amt;
    SET p_minimum_rede_share = v_minimum_rede_share;
    SET p_minimum_holding_share = v_minimum_holding_share;
    SET p_minimum_turning_out_share = v_minimum_turning_out_share;
    SET p_fund_manager = v_fund_manager;
    SET p_charging_method = v_charging_method;
    SET p_target_subscription_trade_mark = v_target_subscription_trade_mark;
    SET p_target_purchase_trade_mark = v_target_purchase_trade_mark;
    SET p_target_rede_trade_mark = v_target_rede_trade_mark;
    SET p_target_first_minimum_amt = v_target_first_minimum_amt;
    SET p_target_minimum_purchase_amt = v_target_minimum_purchase_amt;
    SET p_target_minimum_subscription_amt = v_target_minimum_subscription_amt;
    SET p_target_minimum_rede_share = v_target_minimum_rede_share;
    SET p_target_minimum_holding_share = v_target_minimum_holding_share;
    SET p_target_minimum_turning_out_share = v_target_minimum_turning_out_share;
    SET p_target_fund_manager = v_target_fund_manager;
    SET p_target_charging_method = v_target_charging_method;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_交易接口_检查证券交易业务属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_trdif_CheckSecuExchProp;;
DELIMITER ;;
CREATE PROCEDURE pra_trdif_CheckSecuExchProp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_bond_rate_type int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_min_unit int,
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9),
    OUT p_target_code_no int,
    OUT p_target_code varchar(6),
    OUT p_target_code_stock_type int,
    OUT p_target_code_asset_type int,
    OUT p_trade_code_no int,
    OUT p_trade_code varchar(6),
    OUT p_trade_code_stock_type int,
    OUT p_trade_code_asset_type int,
    OUT p_bond_qty_unit_set int,
    OUT p_apply_date int,
    OUT p_subscription_trade_mark int,
    OUT p_purchase_trade_mark int,
    OUT p_rede_trade_mark int,
    OUT p_first_minimum_amt decimal(18,4),
    OUT p_minimum_purchase_amt decimal(18,4),
    OUT p_minimum_subscription_amt decimal(18,4),
    OUT p_minimum_rede_share decimal(18,2),
    OUT p_minimum_holding_share decimal(18,2)
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
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code_no int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_bond_qty_unit_set int;
    declare v_apply_date int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_max_qty decimal(18,2);
    declare v_stop_status varchar(2);
    declare v_is_order_dir_flag int;
    declare v_hk_stock_flag int;
    declare v_apply_limit decimal(18,2);
    declare v_pass_no int;
    declare v_fina_marg_ratio decimal(18,12);
    declare v_secu_loan_marg_ratio decimal(18,12);
    declare v_fina_status varchar(2);
    declare v_secu_loan_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_bond_qty_unit_set = 0;
    SET v_apply_date = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_min_qty = 0;
    SET v_max_qty = 0;
    SET v_stop_status = "0";
    SET v_is_order_dir_flag = 0;
    SET v_hk_stock_flag = 0;
    SET v_apply_limit = 0;
    SET v_pass_no = 0;
    SET v_fina_marg_ratio = 0;
    SET v_secu_loan_marg_ratio = 0;
    SET v_fina_status = "0";
    SET v_secu_loan_status = "0";

    
    label_pro:BEGIN
    
    #如果价格类型是市价，则根据配置设置订单价格

    /* if @价格类型# = 0 then */
    if v_price_type = 0 then

        /* set @价格类型# = 《价格类型-限价》; */
        set v_price_type = 1;
    end if;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}, {证券类型}, {资产类型}, {本币币种}, {交易币种}, {资金回转天数}, {持仓回转天数}, {票面面值}, {最小单位}, {最小数量}, {最大数量}, {停牌标志}, {区分订单方向标志},{港股通标的}][@证券代码编号#, @证券类型#, @资产类型#, @本币币种#, @交易币种#, @资金回转天数#, @持仓回转天数#, @票面面值#, @最小单位#, @最小数量#, @最大数量#, @停牌标志#, @区分订单方向标志#,@港股通标的#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#, @证券代码#] */
    select stock_code_no, stock_type, asset_type, crncy_type, exch_crncy_type, capit_reback_days, posi_reback_days, par_value, min_unit, min_qty, max_qty, stop_status, is_order_dir_flag,hk_stock_flag into v_stock_code_no, v_stock_type, v_asset_type, v_crncy_type, v_exch_crncy_type, v_capit_reback_days, v_posi_reback_days, v_par_value, v_min_unit, v_min_qty, v_max_qty, v_stop_status, v_is_order_dir_flag,v_hk_stock_flag from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.21.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code);
        end if;
        leave label_pro;
    end if;

    #停牌校验暂时去掉， Modify by wjp 20190617
    #[检查报错返回][@停牌标志# <> 《停牌标志-正常》][8][@证券代码#]
    #债券的卖出最小单位为1,20180626

    /* if @证券类型#>=21 and @证券类型#<=45 and @订单方向#=2 then */
    if v_stock_type>=21 and v_stock_type<=45 and v_order_dir=2 then

        /* set @最小单位#=1; */
        set v_min_unit=1;
    end if;

    /* if @订单方向# <>《订单方向-质押提交》 and @订单方向# <>《订单方向-质押转回》 and @订单方向#<>《订单方向-新股申购》 then */
    if v_order_dir <>21 and v_order_dir <>22 and v_order_dir<>11 then

        /* [获取表记录变量][公共_证券基础数据_证券行情表][{涨停价},{跌停价},{最新价}][@涨停价#,@跌停价#,@最新价#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4a][@市场编号#, @证券代码#] */
        select up_limit_price,down_limit_price,last_price into v_up_limit_price,v_down_limit_price,v_last_price from db_pub.tb_basesedt_stock_quot where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.21.4a";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code);
            end if;
            leave label_pro;
        end if;


        /* if  @证券代码#>=688000  and @证券代码#<=688999  and  @市场编号# = 《市场编号-上海证券交易所》   then */
        if  v_stock_code>=688000  and v_stock_code<=688999  and  v_exch_no = 1   then

           /* set @涨停价#=0; */
           set v_up_limit_price=0;

           /* set @跌停价#=0; */
           set v_down_limit_price=0;
      end if;
    end if;

    /* set @申购日期# = 0; */
    set v_apply_date = 0;

    /* if @订单方向#=《订单方向-融资回购》 or @订单方向#=《订单方向-融券回购》 or @订单方向#=《订单方向-质押提交》 or @订单方向#=《订单方向-质押转回》 or @订单方向#=《订单方向-新股申购》 then */
    if v_order_dir=3 or v_order_dir=4 or v_order_dir=21 or v_order_dir=22 or v_order_dir=11 then

        /* [获取表记录变量][公共_证券基础数据_证券代码映射表][{交易代码},{标的代码}][@交易代码#,@标的代码#][{证券代码编号}=@证券代码编号#][4b][@证券代码编号#] */
        select trade_code,target_code into v_trade_code,v_target_code from db_pub.tb_basesedt_code_map where stock_code_no=v_stock_code_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.21.4b";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型},{资产类型}][@交易代码编号#,@交易代码证券类型#,@交易代码资产类型#][{市场编号}=@市场编号# and {证券代码}=@交易代码#][4c][@市场编号#,@交易代码#] */
        select stock_code_no,stock_type,asset_type into v_trade_code_no,v_trade_code_stock_type,v_trade_code_asset_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_trade_code limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.21.4c";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型},{资产类型}][@标的代码编号#,@标的代码证券类型#,@标的代码资产类型#][{市场编号}=@市场编号# and {证券代码}=@标的代码#][4d][@市场编号#,@标的代码#] */
        select stock_code_no,stock_type,asset_type into v_target_code_no,v_target_code_stock_type,v_target_code_asset_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_target_code limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.21.4d";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","标的代码=",v_target_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","标的代码=",v_target_code);
            end if;
            leave label_pro;
        end if;


        /* if @订单方向#=《订单方向-新股申购》 then */
        if v_order_dir=11 then

            /* [获取表记录变量语句][公共_证券基础数据_证券新股代码信息表][{申购日期},{申购上限}][@申购日期#,@申购上限#][{证券代码编号}=@证券代码编号#] */
            select apply_date,apply_limit into v_apply_date,v_apply_limit from db_pub.tb_basesedt_new_stock_code_info where stock_code_no=v_stock_code_no limit 1;


            /* [检查报错返回][@申购上限# >0 and @申购上限# < @订单数量#][772][@申购上限#,@订单数量#] */
            if v_apply_limit >0 and v_apply_limit < v_order_qty then
                
                SET v_error_code = "pubA.25.21.772";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("申购上限=",v_apply_limit,",","订单数量=",v_order_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("申购上限=",v_apply_limit,",","订单数量=",v_order_qty);
                end if;
                leave label_pro;
            end if;

        end if;
    else

        /* if @订单方向#=《订单方向-买入》 then */
        if v_order_dir=1 then

            /* [获取表记录变量语句][公共_证券基础数据_证券新股代码信息表][{申购日期}][@申购日期#][{证券代码编号}=@证券代码编号#] */
            select apply_date into v_apply_date from db_pub.tb_basesedt_new_stock_code_info where stock_code_no=v_stock_code_no limit 1;

        end if;

        /* set @标的代码编号# = @证券代码编号#; */
        set v_target_code_no = v_stock_code_no;

        /* set @标的代码# = @证券代码#; */
        set v_target_code = v_stock_code;

        /* set @标的代码证券类型# = @证券类型#; */
        set v_target_code_stock_type = v_stock_type;

        /* set @标的代码资产类型# = @资产类型#; */
        set v_target_code_asset_type = v_asset_type;

        /* set @交易代码编号# = @证券代码编号#; */
        set v_trade_code_no = v_stock_code_no;

        /* set @交易代码# = @证券代码#; */
        set v_trade_code = v_stock_code;

        /* set @交易代码证券类型# = @证券类型#; */
        set v_trade_code_stock_type = v_stock_type;

        /* set @交易代码资产类型# = @资产类型#; */
        set v_trade_code_asset_type = v_asset_type;
    end if;
    #如果不是新股申购，需要继续检查

    /* if @订单方向# = 《订单方向-新股申购》 then */
    if v_order_dir = 11 then

        /* [检查报错返回][@价格类型# <> 《价格类型-限价》][701][@价格类型#,@订单方向#] */
        if v_price_type <> 1 then
            
            SET v_error_code = "pubA.25.21.701";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("价格类型=",v_price_type,",","订单方向=",v_order_dir),"#",v_mysql_message);
            else
                SET v_error_info = concat("价格类型=",v_price_type,",","订单方向=",v_order_dir);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@订单数量#  = 0][10][@订单数量#] */
        if v_order_qty  = 0 then
            
            SET v_error_code = "pubA.25.21.10";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单数量=",v_order_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单数量=",v_order_qty);
            end if;
            leave label_pro;
        end if;

    else

        /* if @区分订单方向标志# = 《区分订单方向标志-是》 then */
        if v_is_order_dir_flag = 1 then

            /* if @市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号#=《市场编号-深港通证券交易所》 then */
            if v_exch_no = 3 or v_exch_no=4 then

                /* [检查报错返回][@订单方向# = 《订单方向-买入》 and @港股通标的#=《港股通标的-不是》][22][@市场编号#,@证券代码#] */
                if v_order_dir = 1 and v_hk_stock_flag=2 then
                    
                    SET v_error_code = "pubA.25.21.22";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                    end if;
                    leave label_pro;
                end if;


                /* [获取表记录变量][公共_证券基础数据_证券代码订单方向表][{最小单位},{最小数量},{最大数量}][@最小单位#,@最小数量#,@最大数量#][{证券代码编号}=@证券代码编号# and {订单方向}=@订单方向#][4e][@证券代码编号#,@订单方向#] */
                select min_unit,min_qty,max_qty into v_min_unit,v_min_qty,v_max_qty from db_pub.tb_basesedt_stock_code_order_dir where stock_code_no=v_stock_code_no and order_dir=v_order_dir limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.21.4e";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("证券代码编号=",v_stock_code_no,",","订单方向=",v_order_dir);
                    end if;
                    leave label_pro;
                end if;

            else

                /* [获取表记录变量][公共_证券基础数据_证券类型订单方向表][{最小单位},{最小数量},{最大数量}][@最小单位#,@最小数量#,@最大数量#][{市场编号}=@市场编号# and {证券类型}=@证券类型# and {订单方向}=@订单方向#][4f][@市场编号#,@证券类型#,@订单方向#] */
                select min_unit,min_qty,max_qty into v_min_unit,v_min_qty,v_max_qty from db_pub.tb_basesedt_stock_type_order_dir where exch_no=v_exch_no and stock_type=v_stock_type and order_dir=v_order_dir limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.21.4f";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券类型=",v_stock_type,",","订单方向=",v_order_dir),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("市场编号=",v_exch_no,",","证券类型=",v_stock_type,",","订单方向=",v_order_dir);
                    end if;
                    leave label_pro;
                end if;


               /* if     @证券代码#>=688000  and @证券代码#<=688999  and  @市场编号# = 《市场编号-上海证券交易所》   then */
               if     v_stock_code>=688000  and v_stock_code<=688999  and  v_exch_no = 1   then

                    /* set @最大数量#=100000; */
                    set v_max_qty=100000;

                    /* if   (@订单方向# = 《订单方向-买入》 or  @订单方向# = 《订单方向-融资买入》)  then */
                    if   (v_order_dir = 1 or  v_order_dir = 5)  then

                          /* set @最小单位#=1; */
                          set v_min_unit=1;

                          /* set @最小数量#=200; */
                          set v_min_qty=200;
                    end if;
               end if;
            end if;
        end if;
        #基金的申购赎回不需要校验最小单位数量

        /* if (@订单方向# <> 《订单方向-基金申购》 and @订单方向# <> 《订单方向-基金赎回》 and @订单方向# <> 《订单方向-基金转换》) then */
        if (v_order_dir <> 9 and v_order_dir <> 10 and v_order_dir <> 12) then
            #如果不是新股申购，需要继续检查
            #休外指令成交，不判断成交数量   |补单也不校验。

            /* if @功能编码# <> "tdsecuL.5.52"  and  @功能编码# <>"tdsecuL.5.53" and  (@功能编码# <>"tdsecuL.5.31" and @订单方向# <>《订单方向-卖出》) then */
            if v_func_code <> "tdsecuL.5.52"  and  v_func_code <>"tdsecuL.5.53" and  (v_func_code <>"tdsecuL.5.31" and v_order_dir <>2) then

                /* [检查报错返回][mod(@订单数量#, @最小单位#) > 0][9][@证券代码#] */
                if mod(v_order_qty, v_min_unit) > 0 then
                    
                    SET v_error_code = "pubA.25.21.9";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("证券代码=",v_stock_code);
                    end if;
                    leave label_pro;
                end if;


                /* [检查报错返回][@订单数量# < @最小数量#][10][@证券代码#] */
                if v_order_qty < v_min_qty then
                    
                    SET v_error_code = "pubA.25.21.10";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("证券代码=",v_stock_code);
                    end if;
                    leave label_pro;
                end if;

            end if;

             /* if  (@功能编码# not in  ("tdsecuL.11.11","tdsecuL.11.12","tdsecuL.11.13","tdsecuL.11.14")  and @功能编码# not in ("tdsecuL.5.52","tdsecuL.5.53")  and  (@功能编码# <>"tdsecuL.5.31" and @订单方向# <>《订单方向-卖出》)) then */
             if  (v_func_code not in  ("tdsecuL.11.11","tdsecuL.11.12","tdsecuL.11.13","tdsecuL.11.14")  and v_func_code not in ("tdsecuL.5.52","tdsecuL.5.53")  and  (v_func_code <>"tdsecuL.5.31" and v_order_dir <>2)) then

                 /* [检查报错返回][(@市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号#=《市场编号-深港通证券交易所》) and (@订单方向#=《订单方向-买入》 or @订单方向#=《订单方向-卖出》) and (@订单数量#/@最小单位# > 3000)][21][@市场编号#,@证券代码#] */
                 if (v_exch_no = 3 or v_exch_no=4) and (v_order_dir=1 or v_order_dir=2) and (v_order_qty/v_min_unit > 3000) then
                     
                     SET v_error_code = "pubA.25.21.21";
                     if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                     else
                         SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                     end if;
                     leave label_pro;
                 end if;

                #新增策略，体外指令成交均不校验。

                /* [检查报错返回][@订单数量# > @最大数量# and @功能编码#<> "rksecuL.4.66" ][16][@证券代码#] */
                if v_order_qty > v_max_qty and v_func_code<> "rksecuL.4.66"  then
                    
                    SET v_error_code = "pubA.25.21.16";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("证券代码=",v_stock_code);
                    end if;
                    leave label_pro;
                end if;

            end if;
        else

            /* [获取表记录变量][公共_证券基础数据_基金属性信息表][{认购交易标志},{申购交易标志},{赎回交易标志},{首次最低金额},{最低认购金额},{最低申购金额},{最低赎回份额},{最低持有份额}][@认购交易标志#,@申购交易标志#,@赎回交易标志#,@首次最低金额#,@最低认购金额#,@最低申购金额#,@最低赎回份额#,@最低持有份额#][@市场编号#={市场编号} and @证券代码#={证券代码}][4g][@市场编号#,@证券代码#] */
            select subscription_trade_mark,purchase_trade_mark,rede_trade_mark,first_minimum_amt,minimum_subscription_amt,minimum_purchase_amt,minimum_rede_share,minimum_holding_share into v_subscription_trade_mark,v_purchase_trade_mark,v_rede_trade_mark,v_first_minimum_amt,v_minimum_subscription_amt,v_minimum_purchase_amt,v_minimum_rede_share,v_minimum_holding_share from db_pub.tb_basesedt_fund_info where v_exch_no=exch_no and v_stock_code=stock_code limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.25.21.4g";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                end if;
                leave label_pro;
            end if;

        end if;
        #如果是债券类业务

        /* if @证券类型# > 20 and @证券类型# < 50 then */
        if v_stock_type > 20 and v_stock_type < 50 then
            #金纳插件特殊处理

            /* [检查报错返回][@价格类型# <> 《价格类型-限价》  and @功能编码#  <> "tdsecuL.11.11"][703][@价格类型#,@证券类型#] */
            if v_price_type <> 1  and v_func_code  <> "tdsecuL.11.11" then
                
                SET v_error_code = "pubA.25.21.703";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("价格类型=",v_price_type,",","证券类型=",v_stock_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("价格类型=",v_price_type,",","证券类型=",v_stock_type);
                end if;
                leave label_pro;
            end if;


            /* if @订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-质押转回》 then */
            if v_order_dir = 21 or v_order_dir = 22 then

                /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{债券利率类型}, {债券计提利息}, {票面面值},{质押比例},{净价标志},{计息天数}][@债券利率类型#, @债券计提利息#, @票面面值#,@质押比例#,@净价标志#,@计息天数#][{市场编号}=@市场编号# and {证券代码}=@交易代码#][4h][@市场编号#,@交易代码#] */
                select bond_rate_type, bond_accr_intrst, par_value,impawn_ratio,net_price_flag,intrst_days into v_bond_rate_type, v_bond_accr_intrst, v_par_value,v_impawn_ratio,v_net_price_flag,v_intrst_days from db_pub.tb_basesedt_bond_info where exch_no=v_exch_no and stock_code=v_trade_code limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.21.4h";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code);
                    end if;
                    leave label_pro;
                end if;


                /* [检查报错返回][@质押比例# = 0][13][@质押比例#] */
                if v_impawn_ratio = 0 then
                    
                    SET v_error_code = "pubA.25.21.13";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("质押比例=",v_impawn_ratio),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("质押比例=",v_impawn_ratio);
                    end if;
                    leave label_pro;
                end if;

            else

                /* if @订单方向# <> 《订单方向-可转债申购》 then */
                if v_order_dir <> 13 then

                    /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{债券利率类型}, {债券计提利息}, {票面面值},{质押比例},{净价标志},{计息天数}][@债券利率类型#, @债券计提利息#, @票面面值#,@质押比例#,@净价标志#,@计息天数#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4i][@市场编号#,@证券代码#] */
                    select bond_rate_type, bond_accr_intrst, par_value,impawn_ratio,net_price_flag,intrst_days into v_bond_rate_type, v_bond_accr_intrst, v_par_value,v_impawn_ratio,v_net_price_flag,v_intrst_days from db_pub.tb_basesedt_bond_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
                    if FOUND_ROWS() = 0 then
                                
                        SET v_error_code = "pubA.25.21.4i";
                        if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                        else
                            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                        end if;
                        leave label_pro;
                    end if;

                end if;
            end if;
        end if;
    end if;

    /* set @债券数量单位配置# = 1; */
    set v_bond_qty_unit_set = 1;

    /* if (@订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-卖出》) and @证券类型# > 20 and @证券类型# < 50 and @通道编号#<>0 then */
    if (v_order_dir = 1 or v_order_dir = 2) and v_stock_type > 20 and v_stock_type < 50 and v_pass_no<>0 then
        #获取通道债券数量单位配置

        /* [获取表记录变量][公共_基础_通道信息表][{债券数量单位配置}][@债券数量单位配置#][{通道编号}=@通道编号#][4j][@通道编号#] */
        select bond_qty_unit_set into v_bond_qty_unit_set from db_pub.tb_base_channel_info where pass_no=v_pass_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.21.4j";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no);
            end if;
            leave label_pro;
        end if;

    end if;
    #两融校验

    /* set @融资保证金比例# = 0; */
    set v_fina_marg_ratio = 0;

    /* set @融券保证金比例# = 0; */
    set v_secu_loan_marg_ratio = 0;

    /* if @订单方向# = 《订单方向-融资买入》 then */
    if v_order_dir = 5 then

        /* [获取表记录变量][公共_融资融券基础数据_融资融券标的证券表][{融资状态}][@融资状态#][{证券代码编号}=@证券代码编号#][4k]["该证券不是融资融券标的",@证券代码编号#] */
        select fina_status into v_fina_status from db_pub.tb_basesemdt_secu_margin_underly_secu where stock_code_no=v_stock_code_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.21.4k";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("该证券不是融资融券标的",",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("该证券不是融资融券标的",",","证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@融资状态# <> 《融资状态-正常》][28][@融资状态#] */
        if v_fina_status <> "1" then
            
            SET v_error_code = "pubA.25.21.28";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("融资状态=",v_fina_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("融资状态=",v_fina_status);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向# = 《订单方向-融券卖出》 then */
    if v_order_dir = 6 then

        /* [获取表记录变量][公共_融资融券基础数据_融资融券标的证券表][{融券状态}][@融券状态#][{证券代码编号}=@证券代码编号#][4l]["该证券不是融资融券标的",@证券代码编号#] */
        select secu_loan_status into v_secu_loan_status from db_pub.tb_basesemdt_secu_margin_underly_secu where stock_code_no=v_stock_code_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.21.4l";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("该证券不是融资融券标的",",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("该证券不是融资融券标的",",","证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@融券状态# <> 《融券状态-正常》][28][@融券状态#] */
        if v_secu_loan_status <> "1" then
            
            SET v_error_code = "pubA.25.21.28";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("融券状态=",v_secu_loan_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("融券状态=",v_secu_loan_status);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_min_unit = v_min_unit;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;
    SET p_target_code_no = v_target_code_no;
    SET p_target_code = v_target_code;
    SET p_target_code_stock_type = v_target_code_stock_type;
    SET p_target_code_asset_type = v_target_code_asset_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_trade_code = v_trade_code;
    SET p_trade_code_stock_type = v_trade_code_stock_type;
    SET p_trade_code_asset_type = v_trade_code_asset_type;
    SET p_bond_qty_unit_set = v_bond_qty_unit_set;
    SET p_apply_date = v_apply_date;
    SET p_subscription_trade_mark = v_subscription_trade_mark;
    SET p_purchase_trade_mark = v_purchase_trade_mark;
    SET p_rede_trade_mark = v_rede_trade_mark;
    SET p_first_minimum_amt = v_first_minimum_amt;
    SET p_minimum_purchase_amt = v_minimum_purchase_amt;
    SET p_minimum_subscription_amt = v_minimum_subscription_amt;
    SET p_minimum_rede_share = v_minimum_rede_share;
    SET p_minimum_holding_share = v_minimum_holding_share;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_交易接口_检查回报业务控制
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_trdif_CheckRspBusiControl;;
DELIMITER ;;
CREATE PROCEDURE pra_trdif_CheckRspBusiControl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_pass_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
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
    declare v_exch_no int;
    declare v_pass_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_bond_qty_unit_set int;
    declare v_mach_time int;
    declare v_sys_status varchar(2);
    declare v_exch_status int;
    declare v_no_exch_date_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pass_no = p_pass_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_bond_qty_unit_set = 0;
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_sys_status = "0";
    SET v_exch_status = 0;
    SET v_no_exch_date_str = " ";

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;

    #检查系统状态

    /* [获取表记录变量][公共_基础_系统信息表][{系统状态},{初始化日期}][@系统状态#,@初始化日期#][1=1][4][" "] */
    select sys_status,init_date into v_sys_status,v_init_date from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.31.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@系统状态# = 《系统状态-停止》][6][@系统状态#] */
    if v_sys_status = "2" then
        
        SET v_error_code = "pubA.25.31.6";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("系统状态=",v_sys_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("系统状态=",v_sys_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@系统状态# = 《系统状态-维护》][7]["系统维护中"] */
    if v_sys_status = "3" then
        
        SET v_error_code = "pubA.25.31.7";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("系统维护中","#",v_mysql_message);
        else
            SET v_error_info = "系统维护中";
        end if;
        leave label_pro;
    end if;

    #检查市场状态

    /* [获取表记录变量][公共_基础_市场信息表][{本币币种},{交易币种},{市场状态},{初始化日期},{非交易日期串}][@本币币种#,@交易币种#,@市场状态#,@初始化日期#,@非交易日期串#][{市场编号}=@市场编号#][1][@市场编号#] */
    select crncy_type,exch_crncy_type,exch_status,init_date,no_exch_date_str into v_crncy_type,v_exch_crncy_type,v_exch_status,v_init_date,v_no_exch_date_str from db_pub.tb_base_exch_info where exch_no=v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.31.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;

    #[检查报错返回][@市场状态# = 《市场状态-关闭》][6][@系统状态#]
    #检查市场日期
    #[获取表记录变量][公共_基础_市场信息表][{非交易日期串}][@非交易日期串#][{市场编号} = @市场编号#][1][@市场编号#]
    #[检查报错返回][dayofweek(@初始化日期#) = 7 or dayofweek(@初始化日期#) = 1 or instr(@非交易日期串#, concat(";", @初始化日期#, ";")) > 0][704][@初始化日期#]
    #检查市场时间
    #[获取表记录数量][公共_基础_交易时间表][@记录个数#][{市场编号}=@市场编号#]
    #[检查正常返回][@记录个数#=0]
    #[记录不存在][公共_基础_交易时间表][@记录个数#][{开始时间}<=@机器时间# and @机器时间#<={结束时间} and {市场编号} = @市场编号#][705][@机器时间#]
    #获取通道债券数量单位配置

    /* if @通道编号#<>0 then */
    if v_pass_no<>0 then

        /* [获取表记录变量][公共_基础_通道信息表][{债券数量单位配置}][@债券数量单位配置#][{通道编号}=@通道编号#][4][@通道编号#] */
        select bond_qty_unit_set into v_bond_qty_unit_set from db_pub.tb_base_channel_info where pass_no=v_pass_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.31.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_bond_qty_unit_set = v_bond_qty_unit_set;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_交易接口_检查成交回报业务控制
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_trdif_CheckStrikeRspBusiControl;;
DELIMITER ;;
CREATE PROCEDURE pra_trdif_CheckStrikeRspBusiControl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_pass_no int,
    IN p_order_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_sys_config_str varchar(64),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_buy_ref_rate decimal(18,12),
    OUT p_sell_ref_rate decimal(18,12),
    OUT p_bond_qty_unit_set int,
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_apply_date int
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
    declare v_pass_no int;
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_sys_config_str varchar(64);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_bond_qty_unit_set int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_apply_date int;
    declare v_mach_time int;
    declare v_sys_status varchar(2);
    declare v_exch_status int;
    declare v_no_exch_date_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pass_no = p_pass_no;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_config_str = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_bond_qty_unit_set = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_apply_date = 0;
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_sys_status = "0";
    SET v_exch_status = 0;
    SET v_no_exch_date_str = " ";

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;

    #检查系统状态

    /* [获取表记录变量][公共_基础_系统信息表][{系统状态},{初始化日期},{系统控制配置串}][@系统状态#,@初始化日期#,@系统控制配置串#][1=1][4][" "] */
    select sys_status,init_date,sys_config_str into v_sys_status,v_init_date,v_sys_config_str from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.32.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@系统状态# = 《系统状态-停止》][6][@系统状态#] */
    if v_sys_status = "2" then
        
        SET v_error_code = "pubA.25.32.6";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("系统状态=",v_sys_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("系统状态=",v_sys_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@系统状态# = 《系统状态-维护》][7]["系统维护中"] */
    if v_sys_status = "3" then
        
        SET v_error_code = "pubA.25.32.7";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("系统维护中","#",v_mysql_message);
        else
            SET v_error_info = "系统维护中";
        end if;
        leave label_pro;
    end if;

    #检查市场状态

    /* [获取表记录变量][公共_基础_市场信息表][{本币币种},{交易币种},{市场状态},{初始化日期},{非交易日期串}][@本币币种#,@交易币种#,@市场状态#,@初始化日期#,@非交易日期串#][{市场编号}=@市场编号#][1][@市场编号#] */
    select crncy_type,exch_crncy_type,exch_status,init_date,no_exch_date_str into v_crncy_type,v_exch_crncy_type,v_exch_status,v_init_date,v_no_exch_date_str from db_pub.tb_base_exch_info where exch_no=v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.32.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;

    #[检查报错返回][@市场状态# = 《市场状态-关闭》][6][@系统状态#]
    #港股通汇率

    /* if @市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号# = 《市场编号-深港通证券交易所》 then */
    if v_exch_no = 3 or v_exch_no = 4 then

        /* [获取表记录变量][公共_基础_港股通汇率表][{买入参考汇率},{卖出参考汇率}][@买入参考汇率#,@卖出参考汇率#][{市场编号} = @市场编号# and {初始化日期} = @初始化日期#][4][@市场编号#,@初始化日期#] */
        select buy_ref_rate,sell_ref_rate into v_buy_ref_rate,v_sell_ref_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date = v_init_date limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.32.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","初始化日期=",v_init_date);
            end if;
            leave label_pro;
        end if;

    else

        /* set @买入参考汇率# = 1; */
        set v_buy_ref_rate = 1;

        /* set @卖出参考汇率# = 1; */
        set v_sell_ref_rate = 1;
    end if;
    #检查市场日期
    #[获取表记录变量][公共_基础_市场信息表][{非交易日期串}][@非交易日期串#][{市场编号} = @市场编号#][1][@市场编号#]
    #[检查报错返回][dayofweek(@初始化日期#) = 7 or dayofweek(@初始化日期#) = 1 or instr(@非交易日期串#, concat(";", @初始化日期#, ";")) > 0][704][@初始化日期#]
    #检查市场时间
    #[获取表记录数量][公共_基础_交易时间表][@记录个数#][{市场编号}=@市场编号#]
    #[检查正常返回][@记录个数#=0]
    #[记录不存在][公共_基础_交易时间表][@记录个数#][{开始时间}<=@机器时间# and @机器时间#<={结束时间} and {市场编号} = @市场编号#][705][@机器时间#]
    #获取通道债券数量单位配置

    /* if @通道编号#<>0 then */
    if v_pass_no<>0 then

        /* [获取表记录变量][公共_基础_通道信息表][{债券数量单位配置}][@债券数量单位配置#][{通道编号}=@通道编号#][4][@通道编号#] */
        select bond_qty_unit_set into v_bond_qty_unit_set from db_pub.tb_base_channel_info where pass_no=v_pass_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.32.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型}][@证券代码编号#,@证券类型#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#, @证券代码#] */
    select stock_code_no,stock_type into v_stock_code_no,v_stock_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.32.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* set @申购日期# = 0; */
    set v_apply_date = 0;

    /* if @订单方向# =《订单方向-买入》 or @订单方向#= 《订单方向-新股申购》 then */
    if v_order_dir =1 or v_order_dir= 11 then

        /* [获取表记录变量语句][公共_证券基础数据_证券新股代码信息表][{申购日期}][@申购日期#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
        select apply_date into v_apply_date from db_pub.tb_basesedt_new_stock_code_info where stock_code_no=v_stock_code_no limit 1;

    end if;

    /* if @订单方向# =《订单方向-可转债申购》 then */
    if v_order_dir =13 then

        /* [获取表记录变量语句][公共_证券基础数据_可转债代码信息表][{申购日期}][@申购日期#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
        select apply_date into v_apply_date from db_pub.tb_basesedt_convertible_bond_info where stock_code_no=v_stock_code_no limit 1;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_sys_config_str = v_sys_config_str;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_buy_ref_rate = v_buy_ref_rate;
    SET p_sell_ref_rate = v_sell_ref_rate;
    SET p_bond_qty_unit_set = v_bond_qty_unit_set;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_apply_date = v_apply_date;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_交易接口_检查证券回报业务控制
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_trdif_CheckSecuRspBusiControl;;
DELIMITER ;;
CREATE PROCEDURE pra_trdif_CheckSecuRspBusiControl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_pass_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_sys_config_str varchar(64),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_buy_ref_rate decimal(18,12),
    OUT p_sell_ref_rate decimal(18,12),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_net_price_flag int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_min_unit int
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
    declare v_pass_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_sys_config_str varchar(64);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_min_unit int;
    declare v_mach_time int;
    declare v_sys_status varchar(2);
    declare v_exch_status int;
    declare v_no_exch_date_str varchar(2048);
    declare v_bond_qty_unit_set int;
    declare v_asset_type int;
    declare v_min_qty decimal(18,2);
    declare v_max_qty decimal(18,2);
    declare v_stop_status varchar(2);
    declare v_is_order_dir_flag int;
    declare v_trade_code varchar(6);
    declare v_target_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_intrst_days int;
    declare v_hk_stock_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pass_no = p_pass_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_config_str = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_min_unit = 0;
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_sys_status = "0";
    SET v_exch_status = 0;
    SET v_no_exch_date_str = " ";
    SET v_bond_qty_unit_set = 0;
    SET v_asset_type = 0;
    SET v_min_qty = 0;
    SET v_max_qty = 0;
    SET v_stop_status = "0";
    SET v_is_order_dir_flag = 0;
    SET v_trade_code = " ";
    SET v_target_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_intrst_days = 0;
    SET v_hk_stock_flag = 0;

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;

    #检查系统状态

    /* [获取表记录变量][公共_基础_系统信息表][{系统状态},{初始化日期},{系统控制配置串}][@系统状态#,@初始化日期#,@系统控制配置串#][1=1][4][" "] */
    select sys_status,init_date,sys_config_str into v_sys_status,v_init_date,v_sys_config_str from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@系统状态# = 《系统状态-停止》][6][@系统状态#] */
    if v_sys_status = "2" then
        
        SET v_error_code = "pubA.25.33.6";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("系统状态=",v_sys_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("系统状态=",v_sys_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@系统状态# = 《系统状态-维护》][7]["系统维护中"] */
    if v_sys_status = "3" then
        
        SET v_error_code = "pubA.25.33.7";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("系统维护中","#",v_mysql_message);
        else
            SET v_error_info = "系统维护中";
        end if;
        leave label_pro;
    end if;

    #检查市场状态

    /* [获取表记录变量][公共_基础_市场信息表][{本币币种},{交易币种},{市场状态},{初始化日期},{非交易日期串}][@本币币种#,@交易币种#,@市场状态#,@初始化日期#,@非交易日期串#][{市场编号}=@市场编号#][1][@市场编号#] */
    select crncy_type,exch_crncy_type,exch_status,init_date,no_exch_date_str into v_crncy_type,v_exch_crncy_type,v_exch_status,v_init_date,v_no_exch_date_str from db_pub.tb_base_exch_info where exch_no=v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.33.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;

    #[检查报错返回][@市场状态# = 《市场状态-关闭》][6][@系统状态#]
    #港股通汇率

    /* if @市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号# = 《市场编号-深港通证券交易所》 then */
    if v_exch_no = 3 or v_exch_no = 4 then

        /* [获取表记录变量][公共_基础_港股通汇率表][{买入参考汇率},{卖出参考汇率}][@买入参考汇率#,@卖出参考汇率#][{市场编号} = @市场编号# and {初始化日期} = @初始化日期#][4][@市场编号#,@初始化日期#] */
        select buy_ref_rate,sell_ref_rate into v_buy_ref_rate,v_sell_ref_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date = v_init_date limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.33.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","初始化日期=",v_init_date);
            end if;
            leave label_pro;
        end if;

    else

        /* set @买入参考汇率# = 1; */
        set v_buy_ref_rate = 1;

        /* set @卖出参考汇率# = 1; */
        set v_sell_ref_rate = 1;
    end if;
    #检查市场日期
    #[获取表记录变量][公共_基础_市场信息表][{非交易日期串}][@非交易日期串#][{市场编号} = @市场编号#][1][@市场编号#]
    #[检查报错返回][dayofweek(@初始化日期#) = 7 or dayofweek(@初始化日期#) = 1 or instr(@非交易日期串#, concat(";", @初始化日期#, ";")) > 0][704][@初始化日期#]
    #检查市场时间
    #[获取表记录数量][公共_基础_交易时间表][@记录个数#][{市场编号}=@市场编号#]
    #[检查正常返回][@记录个数#=0]
    #[记录不存在][公共_基础_交易时间表][@记录个数#][{开始时间}<=@机器时间# and @机器时间#<={结束时间} and {市场编号} = @市场编号#][705][@机器时间#]
    #获取通道债券数量单位配置

    /* if @通道编号#<>0 then */
    if v_pass_no<>0 then

        /* [获取表记录变量][公共_基础_通道信息表][{债券数量单位配置}][@债券数量单位配置#][{通道编号}=@通道编号#][4][@通道编号#] */
        select bond_qty_unit_set into v_bond_qty_unit_set from db_pub.tb_base_channel_info where pass_no=v_pass_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.33.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}, {证券类型}, {资产类型}, {本币币种}, {交易币种}, {资金回转天数}, {持仓回转天数}, {票面面值}, {最小单位}, {最小数量}, {最大数量}, {停牌标志}, {区分订单方向标志}][@证券代码编号#, @证券类型#, @资产类型#, @本币币种#, @交易币种#, @资金回转天数#, @持仓回转天数#, @票面面值#, @最小单位#, @最小数量#, @最大数量#, @停牌标志#, @区分订单方向标志#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#, @证券代码#] */
    select stock_code_no, stock_type, asset_type, crncy_type, exch_crncy_type, capit_reback_days, posi_reback_days, par_value, min_unit, min_qty, max_qty, stop_status, is_order_dir_flag into v_stock_code_no, v_stock_type, v_asset_type, v_crncy_type, v_exch_crncy_type, v_capit_reback_days, v_posi_reback_days, v_par_value, v_min_unit, v_min_qty, v_max_qty, v_stop_status, v_is_order_dir_flag from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* if @订单方向#=《订单方向-融资回购》 or @订单方向#=《订单方向-融券回购》 or @订单方向#=《订单方向-质押提交》 or @订单方向#=《订单方向-质押转回》 or @订单方向#=《订单方向-新股申购》 then */
    if v_order_dir=3 or v_order_dir=4 or v_order_dir=21 or v_order_dir=22 or v_order_dir=11 then

        /* [获取表记录变量][公共_证券基础数据_证券代码映射表][{交易代码},{标的代码}][@交易代码#,@标的代码#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
        select trade_code,target_code into v_trade_code,v_target_code from db_pub.tb_basesedt_code_map where stock_code_no=v_stock_code_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.33.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型},{资产类型}][@交易代码编号#,@交易代码证券类型#,@交易代码资产类型#][{市场编号}=@市场编号# and {证券代码}=@交易代码#][4][@市场编号#,@交易代码#] */
        select stock_code_no,stock_type,asset_type into v_trade_code_no,v_trade_code_stock_type,v_trade_code_asset_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_trade_code limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.33.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型},{资产类型}][@标的代码编号#,@标的代码证券类型#,@标的代码资产类型#][{市场编号}=@市场编号# and {证券代码}=@标的代码#][4][@市场编号#,@标的代码#] */
        select stock_code_no,stock_type,asset_type into v_target_code_no,v_target_code_stock_type,v_target_code_asset_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_target_code limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.33.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","标的代码=",v_target_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","标的代码=",v_target_code);
            end if;
            leave label_pro;
        end if;

    else

        /* set @标的代码# = @证券代码#; */
        set v_target_code = v_stock_code;

        /* set @交易代码# = @证券代码#; */
        set v_trade_code = v_stock_code;

        /* set @标的代码编号# = @证券代码编号#; */
        set v_target_code_no = v_stock_code_no;

        /* set @交易代码编号# = @证券代码编号#; */
        set v_trade_code_no = v_stock_code_no;
    end if;

    /* if @证券类型#>20 and @证券类型#<50 then */
    if v_stock_type>20 and v_stock_type<50 then

        /* if @订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-质押转回》 then */
        if v_order_dir = 21 or v_order_dir = 22 then

            /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{债券利率类型}, {债券计提利息}, {计息天数}, {票面面值},{质押比例},{净价标志}][@债券利率类型#,@债券计提利息#,@计息天数#, @票面面值#,@质押比例#,@净价标志#][{市场编号}=@市场编号# and {证券代码}=@交易代码#][4][@市场编号#,@交易代码#] */
            select bond_rate_type, bond_accr_intrst, intrst_days, par_value,impawn_ratio,net_price_flag into v_bond_rate_type,v_bond_accr_intrst,v_intrst_days, v_par_value,v_impawn_ratio,v_net_price_flag from db_pub.tb_basesedt_bond_info where exch_no=v_exch_no and stock_code=v_trade_code limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.25.33.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code);
                end if;
                leave label_pro;
            end if;


            /* [检查报错返回][@质押比例# = 0][13][@质押比例#] */
            if v_impawn_ratio = 0 then
                
                SET v_error_code = "pubA.25.33.13";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("质押比例=",v_impawn_ratio),"#",v_mysql_message);
                else
                    SET v_error_info = concat("质押比例=",v_impawn_ratio);
                end if;
                leave label_pro;
            end if;

        else

            /* if @订单方向# <> 《订单方向-可转债申购》 then */
            if v_order_dir <> 13 then

                /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{债券利率类型}, {债券计提利息}, {计息天数}, {票面面值},{质押比例},{净价标志}][@债券利率类型#,@债券计提利息#,@计息天数#, @票面面值#,@质押比例#,@净价标志#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
                select bond_rate_type, bond_accr_intrst, intrst_days, par_value,impawn_ratio,net_price_flag into v_bond_rate_type,v_bond_accr_intrst,v_intrst_days, v_par_value,v_impawn_ratio,v_net_price_flag from db_pub.tb_basesedt_bond_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.33.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                    end if;
                    leave label_pro;
                end if;

            end if;
        end if;
    end if;

    /* if @区分订单方向标志# = 《区分订单方向标志-是》 then */
    if v_is_order_dir_flag = 1 then

        /* if @市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号#=《市场编号-深港通证券交易所》 then */
        if v_exch_no = 3 or v_exch_no=4 then

            /* [检查报错返回][@订单方向# = 《订单方向-买入》 and @港股通标的#=《港股通标的-不是》][22][@市场编号#,@证券代码#] */
            if v_order_dir = 1 and v_hk_stock_flag=2 then
                
                SET v_error_code = "pubA.25.33.22";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                end if;
                leave label_pro;
            end if;


            /* [获取表记录变量][公共_证券基础数据_证券代码订单方向表][{最小单位},{最小数量},{最大数量}][@最小单位#,@最小数量#,@最大数量#][{证券代码编号}=@证券代码编号# and {订单方向}=@订单方向#][4][@证券代码编号#,@订单方向#] */
            select min_unit,min_qty,max_qty into v_min_unit,v_min_qty,v_max_qty from db_pub.tb_basesedt_stock_code_order_dir where stock_code_no=v_stock_code_no and order_dir=v_order_dir limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.25.33.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
                else
                    SET v_error_info = concat("证券代码编号=",v_stock_code_no,",","订单方向=",v_order_dir);
                end if;
                leave label_pro;
            end if;

        else

            /* [获取表记录变量][公共_证券基础数据_证券类型订单方向表][{最小单位},{最小数量},{最大数量}][@最小单位#,@最小数量#,@最大数量#][{市场编号}=@市场编号# and {证券类型}=@证券类型# and {订单方向}=@订单方向#][4][@市场编号#,@证券类型#,@订单方向#] */
            select min_unit,min_qty,max_qty into v_min_unit,v_min_qty,v_max_qty from db_pub.tb_basesedt_stock_type_order_dir where exch_no=v_exch_no and stock_type=v_stock_type and order_dir=v_order_dir limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.25.33.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券类型=",v_stock_type,",","订单方向=",v_order_dir),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,",","证券类型=",v_stock_type,",","订单方向=",v_order_dir);
                end if;
                leave label_pro;
            end if;


               /* if  @证券代码#>=688000  and @证券代码#<=688999  and  @市场编号# = 《市场编号-上海证券交易所》   then */
               if  v_stock_code>=688000  and v_stock_code<=688999  and  v_exch_no = 1   then

                    /* set @最大数量#=100000; */
                    set v_max_qty=100000;

                    /* if  (@订单方向# = 《订单方向-买入》 or  @订单方向# = 《订单方向-融资买入》) then */
                    if  (v_order_dir = 1 or  v_order_dir = 5) then

                          /* set @最小单位#=1; */
                          set v_min_unit=1;

                          /* set @最小数量#=200; */
                          set v_min_qty=200;
                    end if;
               end if;
        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_sys_config_str = v_sys_config_str;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_buy_ref_rate = v_buy_ref_rate;
    SET p_sell_ref_rate = v_sell_ref_rate;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_net_price_flag = v_net_price_flag;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_min_unit = v_min_unit;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_交易接口_批量检查基金转换指令业务属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_trdif_BatchCheckFundTransApprProp;;
DELIMITER ;;
CREATE PROCEDURE pra_trdif_BatchCheckFundTransApprProp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_target_stock_code varchar(6),
    IN p_comm_dir int,
    IN p_comm_qty decimal(18,2),
    IN p_comm_limit_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_target_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_bond_rate_type int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_min_unit int,
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9),
    OUT p_target_code_no int,
    OUT p_target_code varchar(6),
    OUT p_target_code_stock_type int,
    OUT p_target_code_asset_type int,
    OUT p_trade_code_no int,
    OUT p_trade_code varchar(6),
    OUT p_trade_code_stock_type int,
    OUT p_trade_code_asset_type int,
    OUT p_pre_close_price decimal(16,9),
    OUT p_subscription_trade_mark int,
    OUT p_purchase_trade_mark int,
    OUT p_rede_trade_mark int,
    OUT p_first_minimum_amt decimal(18,4),
    OUT p_minimum_purchase_amt decimal(18,4),
    OUT p_minimum_subscription_amt decimal(18,4),
    OUT p_minimum_rede_share decimal(18,2),
    OUT p_minimum_holding_share decimal(18,2),
    OUT p_minimum_turning_out_share decimal(18,2),
    OUT p_fund_manager varchar(64),
    OUT p_charging_method int,
    OUT p_registration_agency varchar(32),
    OUT p_target_subscription_trade_mark int,
    OUT p_target_purchase_trade_mark int,
    OUT p_target_rede_trade_mark int,
    OUT p_target_first_minimum_amt decimal(18,4),
    OUT p_target_minimum_purchase_amt decimal(18,4),
    OUT p_target_minimum_subscription_amt decimal(18,4),
    OUT p_target_minimum_rede_share decimal(18,2),
    OUT p_target_minimum_holding_share decimal(18,2),
    OUT p_target_minimum_turning_out_share decimal(18,2),
    OUT p_target_fund_manager varchar(64),
    OUT p_target_charging_method int,
    OUT p_target_registration_agency varchar(32)
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
    declare v_target_stock_code varchar(6);
    declare v_comm_dir int;
    declare v_comm_qty decimal(18,2);
    declare v_comm_limit_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_target_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code_no int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_pre_close_price decimal(16,9);
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_minimum_turning_out_share decimal(18,2);
    declare v_fund_manager varchar(64);
    declare v_charging_method int;
    declare v_registration_agency varchar(32);
    declare v_target_subscription_trade_mark int;
    declare v_target_purchase_trade_mark int;
    declare v_target_rede_trade_mark int;
    declare v_target_first_minimum_amt decimal(18,4);
    declare v_target_minimum_purchase_amt decimal(18,4);
    declare v_target_minimum_subscription_amt decimal(18,4);
    declare v_target_minimum_rede_share decimal(18,2);
    declare v_target_minimum_holding_share decimal(18,2);
    declare v_target_minimum_turning_out_share decimal(18,2);
    declare v_target_fund_manager varchar(64);
    declare v_target_charging_method int;
    declare v_target_registration_agency varchar(32);
    declare v_price_type int;
    declare v_min_qty decimal(18,2);
    declare v_max_qty decimal(18,2);
    declare v_stop_status varchar(2);
    declare v_is_order_dir_flag int;
    declare v_hk_stock_flag int;
    declare v_apply_date int;
    declare v_apply_limit decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_target_stock_code = p_target_stock_code;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_qty = p_comm_qty;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_pre_close_price = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_minimum_turning_out_share = 0;
    SET v_fund_manager = " ";
    SET v_charging_method = 0;
    SET v_registration_agency = " ";
    SET v_target_subscription_trade_mark = 0;
    SET v_target_purchase_trade_mark = 0;
    SET v_target_rede_trade_mark = 0;
    SET v_target_first_minimum_amt = 0;
    SET v_target_minimum_purchase_amt = 0;
    SET v_target_minimum_subscription_amt = 0;
    SET v_target_minimum_rede_share = 0;
    SET v_target_minimum_holding_share = 0;
    SET v_target_minimum_turning_out_share = 0;
    SET v_target_fund_manager = " ";
    SET v_target_charging_method = 0;
    SET v_target_registration_agency = " ";
    SET v_price_type = 0;
    SET v_min_qty = 0;
    SET v_max_qty = 0;
    SET v_stop_status = "0";
    SET v_is_order_dir_flag = 0;
    SET v_hk_stock_flag = 0;
    SET v_apply_date = 0;
    SET v_apply_limit = 0;

    
    label_pro:BEGIN
    

    /* set @价格类型# = 《价格类型-限价》; */
    set v_price_type = 1;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}, {证券类型}, {资产类型}, {本币币种}, {交易币种}, {资金回转天数}, {持仓回转天数}, {票面面值}, {最小单位}, {最小数量}, {最大数量}, {停牌标志}, {区分订单方向标志}, {港股通标的}][@证券代码编号#, @证券类型#, @资产类型#, @本币币种#, @交易币种#, @资金回转天数#, @持仓回转天数#, @票面面值#, @最小单位#, @最小数量#, @最大数量#, @停牌标志#, @区分订单方向标志#, @港股通标的#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#, @证券代码#] */
    select stock_code_no, stock_type, asset_type, crncy_type, exch_crncy_type, capit_reback_days, posi_reback_days, par_value, min_unit, min_qty, max_qty, stop_status, is_order_dir_flag, hk_stock_flag into v_stock_code_no, v_stock_type, v_asset_type, v_crncy_type, v_exch_crncy_type, v_capit_reback_days, v_posi_reback_days, v_par_value, v_min_unit, v_min_qty, v_max_qty, v_stop_status, v_is_order_dir_flag, v_hk_stock_flag from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.34.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@停牌标志# <> 《停牌标志-正常》][8][@证券代码#] */
    if v_stop_status <> "1" then
        
        SET v_error_code = "pubA.25.34.8";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* if @目标证券代码#<>" " then */
    if v_target_stock_code<>" " then

        /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}, {停牌标志}][@目标证券代码编号#, @停牌标志#][{市场编号}=@市场编号# and {证券代码}=@目标证券代码#][4][@市场编号#, @目标证券代码#] */
        select stock_code_no, stop_status into v_target_stock_code_no, v_stop_status from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_target_stock_code limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.34.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 目标证券代码=", v_target_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,","," 目标证券代码=", v_target_stock_code);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@停牌标志# <> 《停牌标志-正常》][8][@目标证券代码#] */
        if v_stop_status <> "1" then
            
            SET v_error_code = "pubA.25.34.8";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("目标证券代码=",v_target_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("目标证券代码=",v_target_stock_code);
            end if;
            leave label_pro;
        end if;

    end if;
    #债券的卖出最小单位为1,20180626

    /* if @证券类型#>=21 and @证券类型#<=45 and @指令方向#=2 then */
    if v_stock_type>=21 and v_stock_type<=45 and v_comm_dir=2 then

        /* set @最小单位#=1; */
        set v_min_unit=1;
    end if;

    /* if @指令方向#=《指令方向-融资回购》 or @指令方向#=《指令方向-融券回购》 or @指令方向#=《指令方向-质押提交》 or @指令方向#=《指令方向-质押转回》 or @指令方向#=《指令方向-新股申购》 then */
    if v_comm_dir=3 or v_comm_dir=4 or v_comm_dir=21 or v_comm_dir=22 or v_comm_dir=11 then

        /* [获取表记录变量][公共_证券基础数据_证券代码映射表][{交易代码},{标的代码}][@交易代码#,@标的代码#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
        select trade_code,target_code into v_trade_code,v_target_code from db_pub.tb_basesedt_code_map where stock_code_no=v_stock_code_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.34.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型},{资产类型}][@交易代码编号#,@交易代码证券类型#,@交易代码资产类型#][{市场编号}=@市场编号# and {证券代码}=@交易代码#][4][@市场编号#,@交易代码#] */
        select stock_code_no,stock_type,asset_type into v_trade_code_no,v_trade_code_stock_type,v_trade_code_asset_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_trade_code limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.34.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型},{资产类型}][@标的代码编号#,@标的代码证券类型#,@标的代码资产类型#][{市场编号}=@市场编号# and {证券代码}=@标的代码#][4][@市场编号#,@标的代码#] */
        select stock_code_no,stock_type,asset_type into v_target_code_no,v_target_code_stock_type,v_target_code_asset_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_target_code limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.34.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","标的代码=",v_target_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","标的代码=",v_target_code);
            end if;
            leave label_pro;
        end if;


        /* if @指令方向#=《指令方向-新股申购》 then */
        if v_comm_dir=11 then

            /* [获取表记录变量语句][公共_证券基础数据_证券新股代码信息表][{申购日期},{申购上限}][@申购日期#,@申购上限#][{证券代码编号}=@证券代码编号#] */
            select apply_date,apply_limit into v_apply_date,v_apply_limit from db_pub.tb_basesedt_new_stock_code_info where stock_code_no=v_stock_code_no limit 1;


            /* [检查报错返回][@申购上限# >0 and @申购上限# < @指令数量#][772][@申购上限#,@指令数量#] */
            if v_apply_limit >0 and v_apply_limit < v_comm_qty then
                
                SET v_error_code = "pubA.25.34.772";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("申购上限=",v_apply_limit,",","指令数量=",v_comm_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("申购上限=",v_apply_limit,",","指令数量=",v_comm_qty);
                end if;
                leave label_pro;
            end if;

        end if;
    else

        /* set @标的代码编号# = @证券代码编号#; */
        set v_target_code_no = v_stock_code_no;

        /* set @标的代码# = @证券代码#; */
        set v_target_code = v_stock_code;

        /* set @标的代码证券类型# = @证券类型#; */
        set v_target_code_stock_type = v_stock_type;

        /* set @标的代码资产类型# = @资产类型#; */
        set v_target_code_asset_type = v_asset_type;

        /* set @交易代码编号# = @证券代码编号#; */
        set v_trade_code_no = v_stock_code_no;

        /* set @交易代码# = @证券代码#; */
        set v_trade_code = v_stock_code;

        /* set @交易代码证券类型# = @证券类型#; */
        set v_trade_code_stock_type = v_stock_type;

        /* set @交易代码资产类型# = @资产类型#; */
        set v_trade_code_asset_type = v_asset_type;
    end if;
    #如果不是新股申购，需要继续检查

    /* if @指令方向# = 《订单方向-新股申购》 then */
    if v_comm_dir = 11 then

        /* [检查报错返回][@价格类型# <> 《价格类型-限价》][701][@价格类型#,@指令方向#] */
        if v_price_type <> 1 then
            
            SET v_error_code = "pubA.25.34.701";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("价格类型=",v_price_type,",","指令方向=",v_comm_dir),"#",v_mysql_message);
            else
                SET v_error_info = concat("价格类型=",v_price_type,",","指令方向=",v_comm_dir);
            end if;
            leave label_pro;
        end if;

    else

        /* if @区分订单方向标志# = 《区分订单方向标志-是》 then */
        if v_is_order_dir_flag = 1 then

            /* if @市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号#=《市场编号-深港通证券交易所》 then */
            if v_exch_no = 3 or v_exch_no=4 then

                /* [检查报错返回][@指令方向# = 《指令方向-买入》 and @港股通标的#=《港股通标的-不是》][22][@市场编号#,@证券代码#] */
                if v_comm_dir = 1 and v_hk_stock_flag=2 then
                    
                    SET v_error_code = "pubA.25.34.22";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                    end if;
                    leave label_pro;
                end if;


                /* [获取表记录变量][公共_证券基础数据_证券代码订单方向表][{最小单位},{最小数量},{最大数量}][@最小单位#,@最小数量#,@最大数量#][{证券代码编号}=@证券代码编号# and {订单方向}=@指令方向#][4][@证券代码编号#,@指令方向#] */
                select min_unit,min_qty,max_qty into v_min_unit,v_min_qty,v_max_qty from db_pub.tb_basesedt_stock_code_order_dir where stock_code_no=v_stock_code_no and order_dir=v_comm_dir limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.34.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,",","指令方向=",v_comm_dir),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("证券代码编号=",v_stock_code_no,",","指令方向=",v_comm_dir);
                    end if;
                    leave label_pro;
                end if;

            else

                /* [获取表记录变量][公共_证券基础数据_证券类型订单方向表][{最小单位},{最小数量},{最大数量}][@最小单位#,@最小数量#,@最大数量#][{市场编号}=@市场编号# and {证券类型}=@证券类型# and {订单方向}=@指令方向#][4][@市场编号#,@证券类型#,@指令方向#] */
                select min_unit,min_qty,max_qty into v_min_unit,v_min_qty,v_max_qty from db_pub.tb_basesedt_stock_type_order_dir where exch_no=v_exch_no and stock_type=v_stock_type and order_dir=v_comm_dir limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.34.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券类型=",v_stock_type,",","指令方向=",v_comm_dir),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("市场编号=",v_exch_no,",","证券类型=",v_stock_type,",","指令方向=",v_comm_dir);
                    end if;
                    leave label_pro;
                end if;

            end if;
        end if;

        /* if (@指令方向#<>《指令方向-基金申购》 and @指令方向#<>《指令方向-基金赎回》 and @指令方向#<>《指令方向-基金转换》) then */
        if (v_comm_dir<>9 and v_comm_dir<>10 and v_comm_dir<>12) then
            #如果不是新股申购，需要继续检查

            /* [检查报错返回][mod(@指令数量#, @最小单位#) > 0][9][@证券代码#] */
            if mod(v_comm_qty, v_min_unit) > 0 then
                
                SET v_error_code = "pubA.25.34.9";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("证券代码=",v_stock_code);
                end if;
                leave label_pro;
            end if;


            /* [检查报错返回][@指令数量# < @最小数量#][10][@证券代码#] */
            if v_comm_qty < v_min_qty then
                
                SET v_error_code = "pubA.25.34.10";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("证券代码=",v_stock_code);
                end if;
                leave label_pro;
            end if;

            #指令不校验最大[检查报错返回][@指令数量# > @最大数量#][16][@证券代码#]
        else

            /* [获取表记录变量][公共_证券基础数据_基金属性信息表][{认购交易标志},{申购交易标志},{赎回交易标志},{首次最低金额},{最低认购金额},{最低申购金额},{最低赎回份额},{最低持有份额},{最低转出份额},{基金管理人},{收费方式},{登记机构}][@认购交易标志#,@申购交易标志#,@赎回交易标志#,@首次最低金额#,@最低认购金额#,@最低申购金额#,@最低赎回份额#,@最低持有份额#,@最低转出份额#,@基金管理人#,@收费方式#,@登记机构#][@市场编号#={市场编号} and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
            select subscription_trade_mark,purchase_trade_mark,rede_trade_mark,first_minimum_amt,minimum_subscription_amt,minimum_purchase_amt,minimum_rede_share,minimum_holding_share,minimum_turning_out_share,fund_manager,charging_method,registration_agency into v_subscription_trade_mark,v_purchase_trade_mark,v_rede_trade_mark,v_first_minimum_amt,v_minimum_subscription_amt,v_minimum_purchase_amt,v_minimum_rede_share,v_minimum_holding_share,v_minimum_turning_out_share,v_fund_manager,v_charging_method,v_registration_agency from db_pub.tb_basesedt_fund_info where v_exch_no=exch_no and stock_code=v_stock_code limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.25.34.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                end if;
                leave label_pro;
            end if;


            /* if @目标证券代码#<>" " then */
            if v_target_stock_code<>" " then

                /* [获取表记录变量][公共_证券基础数据_基金属性信息表][{认购交易标志},{申购交易标志},{赎回交易标志},{首次最低金额},{最低认购金额},{最低申购金额},{最低赎回份额},{最低持有份额},{最低转出份额},{基金管理人},{收费方式},{登记机构}][@目标认购交易标志#,@目标申购交易标志#,@目标赎回交易标志#,@目标首次最低金额#,@目标最低认购金额#,@目标最低申购金额#,@目标最低赎回份额#,@目标最低持有份额#,@目标最低转出份额#,@目标基金管理人#,@目标收费方式#,@目标登记机构#][{证券代码编号}=@目标证券代码编号#][4][@目标证券代码#] */
                select subscription_trade_mark,purchase_trade_mark,rede_trade_mark,first_minimum_amt,minimum_subscription_amt,minimum_purchase_amt,minimum_rede_share,minimum_holding_share,minimum_turning_out_share,fund_manager,charging_method,registration_agency into v_target_subscription_trade_mark,v_target_purchase_trade_mark,v_target_rede_trade_mark,v_target_first_minimum_amt,v_target_minimum_subscription_amt,v_target_minimum_purchase_amt,v_target_minimum_rede_share,v_target_minimum_holding_share,v_target_minimum_turning_out_share,v_target_fund_manager,v_target_charging_method,v_target_registration_agency from db_pub.tb_basesedt_fund_info where stock_code_no=v_target_stock_code_no limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.34.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("目标证券代码=",v_target_stock_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("目标证券代码=",v_target_stock_code);
                    end if;
                    leave label_pro;
                end if;

            end if;
        end if;
        #如果是债券类业务

        /* if @证券类型# > 20 and @证券类型# < 50 then */
        if v_stock_type > 20 and v_stock_type < 50 then

            /* [检查报错返回][@价格类型# <> 《价格类型-限价》 ][703][@价格类型#,@证券类型#] */
            if v_price_type <> 1  then
                
                SET v_error_code = "pubA.25.34.703";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("价格类型=",v_price_type,",","证券类型=",v_stock_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("价格类型=",v_price_type,",","证券类型=",v_stock_type);
                end if;
                leave label_pro;
            end if;


            /* if @指令方向# = 《指令方向-质押提交》 or @指令方向# = 《指令方向-质押转回》 then */
            if v_comm_dir = 21 or v_comm_dir = 22 then

                /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{债券利率类型}, {债券计提利息}, {票面面值},{质押比例},{净价标志},{计息天数}][@债券利率类型#, @债券计提利息#, @票面面值#,@质押比例#,@净价标志#,@计息天数#][{市场编号}=@市场编号# and {证券代码}=@交易代码#][4][@市场编号#,@交易代码#] */
                select bond_rate_type, bond_accr_intrst, par_value,impawn_ratio,net_price_flag,intrst_days into v_bond_rate_type, v_bond_accr_intrst, v_par_value,v_impawn_ratio,v_net_price_flag,v_intrst_days from db_pub.tb_basesedt_bond_info where exch_no=v_exch_no and stock_code=v_trade_code limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.34.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code);
                    end if;
                    leave label_pro;
                end if;


                /* [检查报错返回][@质押比例# = 0][13][@质押比例#] */
                if v_impawn_ratio = 0 then
                    
                    SET v_error_code = "pubA.25.34.13";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("质押比例=",v_impawn_ratio),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("质押比例=",v_impawn_ratio);
                    end if;
                    leave label_pro;
                end if;

            else

                /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{债券利率类型}, {债券计提利息}, {票面面值},{质押比例},{净价标志},{计息天数}][@债券利率类型#, @债券计提利息#, @票面面值#,@质押比例#,@净价标志#,@计息天数#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
                select bond_rate_type, bond_accr_intrst, par_value,impawn_ratio,net_price_flag,intrst_days into v_bond_rate_type, v_bond_accr_intrst, v_par_value,v_impawn_ratio,v_net_price_flag,v_intrst_days from db_pub.tb_basesedt_bond_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.34.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                    end if;
                    leave label_pro;
                end if;

            end if;
        end if;

        /* if @指令方向# <> 《指令方向-质押提交》 and @指令方向# <> 《指令方向-质押转回》 and @指令方向# <>《指令方向-新股申购》 then */
        if v_comm_dir <> 21 and v_comm_dir <> 22 and v_comm_dir <>11 then

            /* [获取表记录变量][公共_证券基础数据_证券行情表][{涨停价},{跌停价},{最新价},{昨收盘价}][@涨停价#,@跌停价#,@最新价#,@昨收盘价#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
            select up_limit_price,down_limit_price,last_price,pre_close_price into v_up_limit_price,v_down_limit_price,v_last_price,v_pre_close_price from db_pub.tb_basesedt_stock_quot where stock_code_no=v_stock_code_no limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.25.34.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;


            /* if @证券类型# > 20 and @证券类型# < 50 then */
            if v_stock_type > 20 and v_stock_type < 50 then

                /* set @涨停价# = 0; */
                set v_up_limit_price = 0;

                /* set @跌停价# = 0; */
                set v_down_limit_price = 0;
            end if;

            /* if @指令限价# <> 0 then */
            if v_comm_limit_price <> 0 then

                /* [检查报错返回][@涨停价# > 0 and @指令限价# > @涨停价#][11][@指令限价#,@涨停价#] */
                if v_up_limit_price > 0 and v_comm_limit_price > v_up_limit_price then
                    
                    SET v_error_code = "pubA.25.34.11";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("指令限价=",v_comm_limit_price,",","涨停价=",v_up_limit_price),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("指令限价=",v_comm_limit_price,",","涨停价=",v_up_limit_price);
                    end if;
                    leave label_pro;
                end if;


                /* [检查报错返回][@跌停价# > 0 and @指令限价# < @跌停价#][12][@指令限价#,@跌停价#] */
                if v_down_limit_price > 0 and v_comm_limit_price < v_down_limit_price then
                    
                    SET v_error_code = "pubA.25.34.12";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("指令限价=",v_comm_limit_price,",","跌停价=",v_down_limit_price),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("指令限价=",v_comm_limit_price,",","跌停价=",v_down_limit_price);
                    end if;
                    leave label_pro;
                end if;

            end if;
        end if;

        /* [检查报错返回][@价格类型# = 《价格类型-限价》 and @指令限价# < 0][702][@价格类型#,@指令限价#] */
        if v_price_type = 1 and v_comm_limit_price < 0 then
            
            SET v_error_code = "pubA.25.34.702";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("价格类型=",v_price_type,",","指令限价=",v_comm_limit_price),"#",v_mysql_message);
            else
                SET v_error_info = concat("价格类型=",v_price_type,",","指令限价=",v_comm_limit_price);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_min_unit = v_min_unit;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;
    SET p_target_code_no = v_target_code_no;
    SET p_target_code = v_target_code;
    SET p_target_code_stock_type = v_target_code_stock_type;
    SET p_target_code_asset_type = v_target_code_asset_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_trade_code = v_trade_code;
    SET p_trade_code_stock_type = v_trade_code_stock_type;
    SET p_trade_code_asset_type = v_trade_code_asset_type;
    SET p_pre_close_price = v_pre_close_price;
    SET p_subscription_trade_mark = v_subscription_trade_mark;
    SET p_purchase_trade_mark = v_purchase_trade_mark;
    SET p_rede_trade_mark = v_rede_trade_mark;
    SET p_first_minimum_amt = v_first_minimum_amt;
    SET p_minimum_purchase_amt = v_minimum_purchase_amt;
    SET p_minimum_subscription_amt = v_minimum_subscription_amt;
    SET p_minimum_rede_share = v_minimum_rede_share;
    SET p_minimum_holding_share = v_minimum_holding_share;
    SET p_minimum_turning_out_share = v_minimum_turning_out_share;
    SET p_fund_manager = v_fund_manager;
    SET p_charging_method = v_charging_method;
    SET p_registration_agency = v_registration_agency;
    SET p_target_subscription_trade_mark = v_target_subscription_trade_mark;
    SET p_target_purchase_trade_mark = v_target_purchase_trade_mark;
    SET p_target_rede_trade_mark = v_target_rede_trade_mark;
    SET p_target_first_minimum_amt = v_target_first_minimum_amt;
    SET p_target_minimum_purchase_amt = v_target_minimum_purchase_amt;
    SET p_target_minimum_subscription_amt = v_target_minimum_subscription_amt;
    SET p_target_minimum_rede_share = v_target_minimum_rede_share;
    SET p_target_minimum_holding_share = v_target_minimum_holding_share;
    SET p_target_minimum_turning_out_share = v_target_minimum_turning_out_share;
    SET p_target_fund_manager = v_target_fund_manager;
    SET p_target_charging_method = v_target_charging_method;
    SET p_target_registration_agency = v_target_registration_agency;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_交易接口_批量检查基金转换交易业务属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_trdif_BatchCheckFundTransExchProp;;
DELIMITER ;;
CREATE PROCEDURE pra_trdif_BatchCheckFundTransExchProp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_target_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_price_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_target_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_bond_rate_type int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_min_unit int,
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9),
    OUT p_target_code_no int,
    OUT p_target_code varchar(6),
    OUT p_target_code_stock_type int,
    OUT p_target_code_asset_type int,
    OUT p_trade_code_no int,
    OUT p_trade_code varchar(6),
    OUT p_trade_code_stock_type int,
    OUT p_trade_code_asset_type int,
    OUT p_bond_qty_unit_set int,
    OUT p_apply_date int,
    OUT p_subscription_trade_mark int,
    OUT p_purchase_trade_mark int,
    OUT p_rede_trade_mark int,
    OUT p_first_minimum_amt decimal(18,4),
    OUT p_minimum_purchase_amt decimal(18,4),
    OUT p_minimum_subscription_amt decimal(18,4),
    OUT p_minimum_rede_share decimal(18,2),
    OUT p_minimum_holding_share decimal(18,2),
    OUT p_minimum_turning_out_share decimal(18,2),
    OUT p_fund_manager varchar(64),
    OUT p_charging_method int,
    OUT p_registration_agency varchar(32),
    OUT p_target_subscription_trade_mark int,
    OUT p_target_purchase_trade_mark int,
    OUT p_target_rede_trade_mark int,
    OUT p_target_first_minimum_amt decimal(18,4),
    OUT p_target_minimum_purchase_amt decimal(18,4),
    OUT p_target_minimum_subscription_amt decimal(18,4),
    OUT p_target_minimum_rede_share decimal(18,2),
    OUT p_target_minimum_holding_share decimal(18,2),
    OUT p_target_minimum_turning_out_share decimal(18,2),
    OUT p_target_fund_manager varchar(64),
    OUT p_target_charging_method int,
    OUT p_target_registration_agency varchar(32)
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
    declare v_target_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_price_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_target_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_min_unit int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_target_code_stock_type int;
    declare v_target_code_asset_type int;
    declare v_trade_code_no int;
    declare v_trade_code varchar(6);
    declare v_trade_code_stock_type int;
    declare v_trade_code_asset_type int;
    declare v_bond_qty_unit_set int;
    declare v_apply_date int;
    declare v_subscription_trade_mark int;
    declare v_purchase_trade_mark int;
    declare v_rede_trade_mark int;
    declare v_first_minimum_amt decimal(18,4);
    declare v_minimum_purchase_amt decimal(18,4);
    declare v_minimum_subscription_amt decimal(18,4);
    declare v_minimum_rede_share decimal(18,2);
    declare v_minimum_holding_share decimal(18,2);
    declare v_minimum_turning_out_share decimal(18,2);
    declare v_fund_manager varchar(64);
    declare v_charging_method int;
    declare v_registration_agency varchar(32);
    declare v_target_subscription_trade_mark int;
    declare v_target_purchase_trade_mark int;
    declare v_target_rede_trade_mark int;
    declare v_target_first_minimum_amt decimal(18,4);
    declare v_target_minimum_purchase_amt decimal(18,4);
    declare v_target_minimum_subscription_amt decimal(18,4);
    declare v_target_minimum_rede_share decimal(18,2);
    declare v_target_minimum_holding_share decimal(18,2);
    declare v_target_minimum_turning_out_share decimal(18,2);
    declare v_target_fund_manager varchar(64);
    declare v_target_charging_method int;
    declare v_target_registration_agency varchar(32);
    declare v_min_qty decimal(18,2);
    declare v_max_qty decimal(18,2);
    declare v_stop_status varchar(2);
    declare v_is_order_dir_flag int;
    declare v_hk_stock_flag int;
    declare v_apply_limit decimal(18,2);
    declare v_pass_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_target_stock_code = p_target_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_price_type = p_price_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_target_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_min_unit = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_target_code_stock_type = 0;
    SET v_target_code_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_trade_code = " ";
    SET v_trade_code_stock_type = 0;
    SET v_trade_code_asset_type = 0;
    SET v_bond_qty_unit_set = 0;
    SET v_apply_date = 0;
    SET v_subscription_trade_mark = 0;
    SET v_purchase_trade_mark = 0;
    SET v_rede_trade_mark = 0;
    SET v_first_minimum_amt = 0;
    SET v_minimum_purchase_amt = 0;
    SET v_minimum_subscription_amt = 0;
    SET v_minimum_rede_share = 0;
    SET v_minimum_holding_share = 0;
    SET v_minimum_turning_out_share = 0;
    SET v_fund_manager = " ";
    SET v_charging_method = 0;
    SET v_registration_agency = " ";
    SET v_target_subscription_trade_mark = 0;
    SET v_target_purchase_trade_mark = 0;
    SET v_target_rede_trade_mark = 0;
    SET v_target_first_minimum_amt = 0;
    SET v_target_minimum_purchase_amt = 0;
    SET v_target_minimum_subscription_amt = 0;
    SET v_target_minimum_rede_share = 0;
    SET v_target_minimum_holding_share = 0;
    SET v_target_minimum_turning_out_share = 0;
    SET v_target_fund_manager = " ";
    SET v_target_charging_method = 0;
    SET v_target_registration_agency = " ";
    SET v_min_qty = 0;
    SET v_max_qty = 0;
    SET v_stop_status = "0";
    SET v_is_order_dir_flag = 0;
    SET v_hk_stock_flag = 0;
    SET v_apply_limit = 0;
    SET v_pass_no = 0;

    
    label_pro:BEGIN
    
    #如果价格类型是市价，则根据配置设置订单价格

    /* if @价格类型# = 0 then */
    if v_price_type = 0 then

        /* set @价格类型# = 《价格类型-限价》; */
        set v_price_type = 1;
    end if;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}, {证券类型}, {资产类型}, {本币币种}, {交易币种}, {资金回转天数}, {持仓回转天数}, {票面面值}, {最小单位}, {最小数量}, {最大数量}, {停牌标志}, {区分订单方向标志},{港股通标的}][@证券代码编号#, @证券类型#, @资产类型#, @本币币种#, @交易币种#, @资金回转天数#, @持仓回转天数#, @票面面值#, @最小单位#, @最小数量#, @最大数量#, @停牌标志#, @区分订单方向标志#,@港股通标的#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#, @证券代码#] */
    select stock_code_no, stock_type, asset_type, crncy_type, exch_crncy_type, capit_reback_days, posi_reback_days, par_value, min_unit, min_qty, max_qty, stop_status, is_order_dir_flag,hk_stock_flag into v_stock_code_no, v_stock_type, v_asset_type, v_crncy_type, v_exch_crncy_type, v_capit_reback_days, v_posi_reback_days, v_par_value, v_min_unit, v_min_qty, v_max_qty, v_stop_status, v_is_order_dir_flag,v_hk_stock_flag from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.35.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@停牌标志# <> 《停牌标志-正常》][8][@证券代码#] */
    if v_stop_status <> "1" then
        
        SET v_error_code = "pubA.25.35.8";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* if @目标证券代码#<>" " then */
    if v_target_stock_code<>" " then

        /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}, {停牌标志}][@目标证券代码编号#, @停牌标志#][{市场编号}=@市场编号# and {证券代码}=@目标证券代码#][4][@市场编号#, @目标证券代码#] */
        select stock_code_no, stop_status into v_target_stock_code_no, v_stop_status from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_target_stock_code limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.35.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 目标证券代码=", v_target_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,","," 目标证券代码=", v_target_stock_code);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@停牌标志# <> 《停牌标志-正常》][8][@目标证券代码#] */
        if v_stop_status <> "1" then
            
            SET v_error_code = "pubA.25.35.8";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("目标证券代码=",v_target_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("目标证券代码=",v_target_stock_code);
            end if;
            leave label_pro;
        end if;

    end if;
    #债券的卖出最小单位为1,20180626

    /* if @证券类型#>=21 and @证券类型#<=45 and @订单方向#=2 then */
    if v_stock_type>=21 and v_stock_type<=45 and v_order_dir=2 then

        /* set @最小单位#=1; */
        set v_min_unit=1;
    end if;

    /* if @订单方向# <>《订单方向-质押提交》 and @订单方向# <>《订单方向-质押转回》 and @订单方向#<>《订单方向-新股申购》 then */
    if v_order_dir <>21 and v_order_dir <>22 and v_order_dir<>11 then

        /* [获取表记录变量][公共_证券基础数据_证券行情表][{涨停价},{跌停价},{最新价}][@涨停价#,@跌停价#,@最新价#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#, @证券代码#] */
        select up_limit_price,down_limit_price,last_price into v_up_limit_price,v_down_limit_price,v_last_price from db_pub.tb_basesedt_stock_quot where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.35.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code);
            end if;
            leave label_pro;
        end if;

    end if;

    /* set @申购日期# = 0; */
    set v_apply_date = 0;

    /* if @订单方向#=《订单方向-融资回购》 or @订单方向#=《订单方向-融券回购》 or @订单方向#=《订单方向-质押提交》 or @订单方向#=《订单方向-质押转回》 or @订单方向#=《订单方向-新股申购》 then */
    if v_order_dir=3 or v_order_dir=4 or v_order_dir=21 or v_order_dir=22 or v_order_dir=11 then

        /* [获取表记录变量][公共_证券基础数据_证券代码映射表][{交易代码},{标的代码}][@交易代码#,@标的代码#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
        select trade_code,target_code into v_trade_code,v_target_code from db_pub.tb_basesedt_code_map where stock_code_no=v_stock_code_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.35.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型},{资产类型}][@交易代码编号#,@交易代码证券类型#,@交易代码资产类型#][{市场编号}=@市场编号# and {证券代码}=@交易代码#][4][@市场编号#,@交易代码#] */
        select stock_code_no,stock_type,asset_type into v_trade_code_no,v_trade_code_stock_type,v_trade_code_asset_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_trade_code limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.35.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号},{证券类型},{资产类型}][@标的代码编号#,@标的代码证券类型#,@标的代码资产类型#][{市场编号}=@市场编号# and {证券代码}=@标的代码#][4][@市场编号#,@标的代码#] */
        select stock_code_no,stock_type,asset_type into v_target_code_no,v_target_code_stock_type,v_target_code_asset_type from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_target_code limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.35.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","标的代码=",v_target_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","标的代码=",v_target_code);
            end if;
            leave label_pro;
        end if;


        /* if @订单方向#=《订单方向-新股申购》 then */
        if v_order_dir=11 then

            /* [获取表记录变量语句][公共_证券基础数据_证券新股代码信息表][{申购日期},{申购上限}][@申购日期#,@申购上限#][{证券代码编号}=@证券代码编号#] */
            select apply_date,apply_limit into v_apply_date,v_apply_limit from db_pub.tb_basesedt_new_stock_code_info where stock_code_no=v_stock_code_no limit 1;


            /* [检查报错返回][@申购上限# >0 and @申购上限# < @订单数量#][772][@申购上限#,@订单数量#] */
            if v_apply_limit >0 and v_apply_limit < v_order_qty then
                
                SET v_error_code = "pubA.25.35.772";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("申购上限=",v_apply_limit,",","订单数量=",v_order_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("申购上限=",v_apply_limit,",","订单数量=",v_order_qty);
                end if;
                leave label_pro;
            end if;

        end if;
    else

        /* if @订单方向#=《订单方向-买入》 then */
        if v_order_dir=1 then

            /* [获取表记录变量语句][公共_证券基础数据_证券新股代码信息表][{申购日期}][@申购日期#][{证券代码编号}=@证券代码编号#] */
            select apply_date into v_apply_date from db_pub.tb_basesedt_new_stock_code_info where stock_code_no=v_stock_code_no limit 1;

        end if;

        /* set @标的代码编号# = @证券代码编号#; */
        set v_target_code_no = v_stock_code_no;

        /* set @标的代码# = @证券代码#; */
        set v_target_code = v_stock_code;

        /* set @标的代码证券类型# = @证券类型#; */
        set v_target_code_stock_type = v_stock_type;

        /* set @标的代码资产类型# = @资产类型#; */
        set v_target_code_asset_type = v_asset_type;

        /* set @交易代码编号# = @证券代码编号#; */
        set v_trade_code_no = v_stock_code_no;

        /* set @交易代码# = @证券代码#; */
        set v_trade_code = v_stock_code;

        /* set @交易代码证券类型# = @证券类型#; */
        set v_trade_code_stock_type = v_stock_type;

        /* set @交易代码资产类型# = @资产类型#; */
        set v_trade_code_asset_type = v_asset_type;
    end if;
    #如果不是新股申购，需要继续检查

    /* if @订单方向# = 《订单方向-新股申购》 then */
    if v_order_dir = 11 then

        /* [检查报错返回][@价格类型# <> 《价格类型-限价》][701][@价格类型#,@订单方向#] */
        if v_price_type <> 1 then
            
            SET v_error_code = "pubA.25.35.701";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("价格类型=",v_price_type,",","订单方向=",v_order_dir),"#",v_mysql_message);
            else
                SET v_error_info = concat("价格类型=",v_price_type,",","订单方向=",v_order_dir);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@订单数量#  = 0][10][@订单数量#] */
        if v_order_qty  = 0 then
            
            SET v_error_code = "pubA.25.35.10";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单数量=",v_order_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单数量=",v_order_qty);
            end if;
            leave label_pro;
        end if;

    else

        /* if @区分订单方向标志# = 《区分订单方向标志-是》 then */
        if v_is_order_dir_flag = 1 then

            /* if @市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号#=《市场编号-深港通证券交易所》 then */
            if v_exch_no = 3 or v_exch_no=4 then

                /* [检查报错返回][@订单方向# = 《订单方向-买入》 and @港股通标的#=《港股通标的-不是》][22][@市场编号#,@证券代码#] */
                if v_order_dir = 1 and v_hk_stock_flag=2 then
                    
                    SET v_error_code = "pubA.25.35.22";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                    end if;
                    leave label_pro;
                end if;


                /* [获取表记录变量][公共_证券基础数据_证券代码订单方向表][{最小单位},{最小数量},{最大数量}][@最小单位#,@最小数量#,@最大数量#][{证券代码编号}=@证券代码编号# and {订单方向}=@订单方向#][4][@证券代码编号#,@订单方向#] */
                select min_unit,min_qty,max_qty into v_min_unit,v_min_qty,v_max_qty from db_pub.tb_basesedt_stock_code_order_dir where stock_code_no=v_stock_code_no and order_dir=v_order_dir limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.35.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("证券代码编号=",v_stock_code_no,",","订单方向=",v_order_dir);
                    end if;
                    leave label_pro;
                end if;

            else

                /* [获取表记录变量][公共_证券基础数据_证券类型订单方向表][{最小单位},{最小数量},{最大数量}][@最小单位#,@最小数量#,@最大数量#][{市场编号}=@市场编号# and {证券类型}=@证券类型# and {订单方向}=@订单方向#][4][@市场编号#,@证券类型#,@订单方向#] */
                select min_unit,min_qty,max_qty into v_min_unit,v_min_qty,v_max_qty from db_pub.tb_basesedt_stock_type_order_dir where exch_no=v_exch_no and stock_type=v_stock_type and order_dir=v_order_dir limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.35.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券类型=",v_stock_type,",","订单方向=",v_order_dir),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("市场编号=",v_exch_no,",","证券类型=",v_stock_type,",","订单方向=",v_order_dir);
                    end if;
                    leave label_pro;
                end if;


               /* if  (@订单方向# = 《订单方向-买入》 or  @订单方向# = 《订单方向-融资买入》)  and   @证券代码#>=688000  and @证券代码#<=688999  and  @市场编号# = 《市场编号-上海证券交易所》   then */
               if  (v_order_dir = 1 or  v_order_dir = 5)  and   v_stock_code>=688000  and v_stock_code<=688999  and  v_exch_no = 1   then

                 /* set @最小单位#=1; */
                 set v_min_unit=1;

                 /* set @最小数量#=200; */
                 set v_min_qty=200;
               end if;
            end if;
        end if;
        #基金的申购赎回不需要校验最小单位数量

        /* if (@订单方向# <> 《订单方向-基金申购》 and @订单方向# <> 《订单方向-基金赎回》 and @订单方向# <> 《订单方向-基金转换》) then */
        if (v_order_dir <> 9 and v_order_dir <> 10 and v_order_dir <> 12) then
            #如果不是新股申购，需要继续检查
            #休外指令成交，不判断成交数量

            /* if @功能编码# <> "tdsecuL.5.52"  and  @功能编码# <>"tdsecuL.5.53" then */
            if v_func_code <> "tdsecuL.5.52"  and  v_func_code <>"tdsecuL.5.53" then

                /* [检查报错返回][mod(@订单数量#, @最小单位#) > 0][9][@证券代码#] */
                if mod(v_order_qty, v_min_unit) > 0 then
                    
                    SET v_error_code = "pubA.25.35.9";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("证券代码=",v_stock_code);
                    end if;
                    leave label_pro;
                end if;


                /* [检查报错返回][@订单数量# < @最小数量#][10][@证券代码#] */
                if v_order_qty < v_min_qty then
                    
                    SET v_error_code = "pubA.25.35.10";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("证券代码=",v_stock_code);
                    end if;
                    leave label_pro;
                end if;

            end if;

            /* [检查报错返回][(@市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号#=《市场编号-深港通证券交易所》) and (@订单方向#=《订单方向-买入》 or @订单方向#=《订单方向-卖出》) and (@订单数量#/@最小单位# > 3000)][21][@市场编号#,@证券代码#] */
            if (v_exch_no = 3 or v_exch_no=4) and (v_order_dir=1 or v_order_dir=2) and (v_order_qty/v_min_unit > 3000) then
                
                SET v_error_code = "pubA.25.35.21";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                end if;
                leave label_pro;
            end if;


            /* [检查报错返回][@订单数量# > @最大数量#][16][@证券代码#] */
            if v_order_qty > v_max_qty then
                
                SET v_error_code = "pubA.25.35.16";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("证券代码=",v_stock_code);
                end if;
                leave label_pro;
            end if;

        else

            /* [获取表记录变量][公共_证券基础数据_基金属性信息表][{认购交易标志},{申购交易标志},{赎回交易标志},{首次最低金额},{最低认购金额},{最低申购金额},{最低赎回份额},{最低持有份额},{最低转出份额},{基金管理人},{收费方式},{登记机构}][@认购交易标志#,@申购交易标志#,@赎回交易标志#,@首次最低金额#,@最低认购金额#,@最低申购金额#,@最低赎回份额#,@最低持有份额#,@最低转出份额#,@基金管理人#,@收费方式#,@登记机构#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
            select subscription_trade_mark,purchase_trade_mark,rede_trade_mark,first_minimum_amt,minimum_subscription_amt,minimum_purchase_amt,minimum_rede_share,minimum_holding_share,minimum_turning_out_share,fund_manager,charging_method,registration_agency into v_subscription_trade_mark,v_purchase_trade_mark,v_rede_trade_mark,v_first_minimum_amt,v_minimum_subscription_amt,v_minimum_purchase_amt,v_minimum_rede_share,v_minimum_holding_share,v_minimum_turning_out_share,v_fund_manager,v_charging_method,v_registration_agency from db_pub.tb_basesedt_fund_info where stock_code_no=v_stock_code_no limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pubA.25.35.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;


            /* if @目标证券代码#<>" " then */
            if v_target_stock_code<>" " then

                /* [获取表记录变量][公共_证券基础数据_基金属性信息表][{认购交易标志},{申购交易标志},{赎回交易标志},{首次最低金额},{最低认购金额},{最低申购金额},{最低赎回份额},{最低持有份额},{最低转出份额},{基金管理人},{收费方式},{登记机构}][@目标认购交易标志#,@目标申购交易标志#,@目标赎回交易标志#,@目标首次最低金额#,@目标最低认购金额#,@目标最低申购金额#,@目标最低赎回份额#,@目标最低持有份额#,@目标最低转出份额#,@目标基金管理人#,@目标收费方式#,@目标登记机构#][{证券代码编号}=@目标证券代码编号#][4][@目标证券代码编号#] */
                select subscription_trade_mark,purchase_trade_mark,rede_trade_mark,first_minimum_amt,minimum_subscription_amt,minimum_purchase_amt,minimum_rede_share,minimum_holding_share,minimum_turning_out_share,fund_manager,charging_method,registration_agency into v_target_subscription_trade_mark,v_target_purchase_trade_mark,v_target_rede_trade_mark,v_target_first_minimum_amt,v_target_minimum_subscription_amt,v_target_minimum_purchase_amt,v_target_minimum_rede_share,v_target_minimum_holding_share,v_target_minimum_turning_out_share,v_target_fund_manager,v_target_charging_method,v_target_registration_agency from db_pub.tb_basesedt_fund_info where stock_code_no=v_target_stock_code_no limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.35.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("目标证券代码编号=",v_target_stock_code_no),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("目标证券代码编号=",v_target_stock_code_no);
                    end if;
                    leave label_pro;
                end if;

            end if;
        end if;
        #如果是债券类业务

        /* if @证券类型# > 20 and @证券类型# < 50 then */
        if v_stock_type > 20 and v_stock_type < 50 then
            #金纳插件特殊处理

            /* [检查报错返回][@价格类型# <> 《价格类型-限价》  and @功能编码#  <> "tdsecuL.11.11"][703][@价格类型#,@证券类型#] */
            if v_price_type <> 1  and v_func_code  <> "tdsecuL.11.11" then
                
                SET v_error_code = "pubA.25.35.703";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("价格类型=",v_price_type,",","证券类型=",v_stock_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("价格类型=",v_price_type,",","证券类型=",v_stock_type);
                end if;
                leave label_pro;
            end if;


            /* if @订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-质押转回》 then */
            if v_order_dir = 21 or v_order_dir = 22 then

                /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{债券利率类型}, {债券计提利息}, {票面面值},{质押比例},{净价标志},{计息天数}][@债券利率类型#, @债券计提利息#, @票面面值#,@质押比例#,@净价标志#,@计息天数#][{市场编号}=@市场编号# and {证券代码}=@交易代码#][4][@市场编号#,@交易代码#] */
                select bond_rate_type, bond_accr_intrst, par_value,impawn_ratio,net_price_flag,intrst_days into v_bond_rate_type, v_bond_accr_intrst, v_par_value,v_impawn_ratio,v_net_price_flag,v_intrst_days from db_pub.tb_basesedt_bond_info where exch_no=v_exch_no and stock_code=v_trade_code limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pubA.25.35.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("市场编号=",v_exch_no,",","交易代码=",v_trade_code);
                    end if;
                    leave label_pro;
                end if;


                /* [检查报错返回][@质押比例# = 0][13][@质押比例#] */
                if v_impawn_ratio = 0 then
                    
                    SET v_error_code = "pubA.25.35.13";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("质押比例=",v_impawn_ratio),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("质押比例=",v_impawn_ratio);
                    end if;
                    leave label_pro;
                end if;

            else

                /* if @订单方向# <> 《订单方向-可转债申购》 then */
                if v_order_dir <> 13 then

                    /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{债券利率类型}, {债券计提利息}, {票面面值},{质押比例},{净价标志},{计息天数}][@债券利率类型#, @债券计提利息#, @票面面值#,@质押比例#,@净价标志#,@计息天数#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
                    select bond_rate_type, bond_accr_intrst, par_value,impawn_ratio,net_price_flag,intrst_days into v_bond_rate_type, v_bond_accr_intrst, v_par_value,v_impawn_ratio,v_net_price_flag,v_intrst_days from db_pub.tb_basesedt_bond_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
                    if FOUND_ROWS() = 0 then
                                
                        SET v_error_code = "pubA.25.35.4";
                        if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                        else
                            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                        end if;
                        leave label_pro;
                    end if;

                end if;
            end if;
        end if;
    end if;

    /* set @债券数量单位配置# = 1; */
    set v_bond_qty_unit_set = 1;

    /* if (@订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-卖出》) and @证券类型# > 20 and @证券类型# < 50 and @通道编号#<>0 then */
    if (v_order_dir = 1 or v_order_dir = 2) and v_stock_type > 20 and v_stock_type < 50 and v_pass_no<>0 then
        #获取通道债券数量单位配置

        /* [获取表记录变量][公共_基础_通道信息表][{债券数量单位配置}][@债券数量单位配置#][{通道编号}=@通道编号#][4][@通道编号#] */
        select bond_qty_unit_set into v_bond_qty_unit_set from db_pub.tb_base_channel_info where pass_no=v_pass_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.25.35.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_stock_code_no = v_target_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_min_unit = v_min_unit;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;
    SET p_target_code_no = v_target_code_no;
    SET p_target_code = v_target_code;
    SET p_target_code_stock_type = v_target_code_stock_type;
    SET p_target_code_asset_type = v_target_code_asset_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_trade_code = v_trade_code;
    SET p_trade_code_stock_type = v_trade_code_stock_type;
    SET p_trade_code_asset_type = v_trade_code_asset_type;
    SET p_bond_qty_unit_set = v_bond_qty_unit_set;
    SET p_apply_date = v_apply_date;
    SET p_subscription_trade_mark = v_subscription_trade_mark;
    SET p_purchase_trade_mark = v_purchase_trade_mark;
    SET p_rede_trade_mark = v_rede_trade_mark;
    SET p_first_minimum_amt = v_first_minimum_amt;
    SET p_minimum_purchase_amt = v_minimum_purchase_amt;
    SET p_minimum_subscription_amt = v_minimum_subscription_amt;
    SET p_minimum_rede_share = v_minimum_rede_share;
    SET p_minimum_holding_share = v_minimum_holding_share;
    SET p_minimum_turning_out_share = v_minimum_turning_out_share;
    SET p_fund_manager = v_fund_manager;
    SET p_charging_method = v_charging_method;
    SET p_registration_agency = v_registration_agency;
    SET p_target_subscription_trade_mark = v_target_subscription_trade_mark;
    SET p_target_purchase_trade_mark = v_target_purchase_trade_mark;
    SET p_target_rede_trade_mark = v_target_rede_trade_mark;
    SET p_target_first_minimum_amt = v_target_first_minimum_amt;
    SET p_target_minimum_purchase_amt = v_target_minimum_purchase_amt;
    SET p_target_minimum_subscription_amt = v_target_minimum_subscription_amt;
    SET p_target_minimum_rede_share = v_target_minimum_rede_share;
    SET p_target_minimum_holding_share = v_target_minimum_holding_share;
    SET p_target_minimum_turning_out_share = v_target_minimum_turning_out_share;
    SET p_target_fund_manager = v_target_fund_manager;
    SET p_target_charging_method = v_target_charging_method;
    SET p_target_registration_agency = v_target_registration_agency;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_交易接口_获取操作员登录信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_trdif_GetOperLoginInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_trdif_GetOperLoginInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_last_login_ip varchar(32),
    OUT p_last_login_mac varchar(32),
    OUT p_last_login_date int,
    OUT p_last_oper_info varchar(255),
    OUT p_online_status int
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
    declare v_last_login_ip varchar(32);
    declare v_last_login_mac varchar(32);
    declare v_last_login_date int;
    declare v_last_oper_info varchar(255);
    declare v_online_status int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_last_login_ip = " ";
    SET v_last_login_mac = " ";
    SET v_last_login_date = date_format(curdate(),'%Y%m%d');
    SET v_last_oper_info = " ";
    SET v_online_status = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_用户_操作员登录信息表][{操作IP}, {操作MAC}, {操作信息}, {在线状态}][@上次登录IP#, @上次登录MAC#, @上次操作信息#, @在线状态#][{操作员编号}=@操作员编号# and {操作方式}=《操作方式-交易端》 ] */
    select oper_ip_addr, oper_mac, oper_info, online_status into v_last_login_ip, v_last_login_mac, v_last_oper_info, v_online_status from db_pub.tb_user_opor_login_info where opor_no=v_opor_no and oper_way="1"  limit 1;


    /* if @在线状态# <> 《在线状态-在线》 then */
    if v_online_status <> 1 then

       /* [获取表记录变量语句][公共_用户_操作员登录信息表][{操作IP}, {操作MAC}, {操作信息}, {在线状态}][@上次登录IP#, @上次登录MAC#, @上次操作信息#, @在线状态#][{操作员编号}=@操作员编号# and {操作方式}=《操作方式-管理端》 ] */
       select oper_ip_addr, oper_mac, oper_info, online_status into v_last_login_ip, v_last_login_mac, v_last_oper_info, v_online_status from db_pub.tb_user_opor_login_info where opor_no=v_opor_no and oper_way="2"  limit 1;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_last_login_ip = v_last_login_ip;
    SET p_last_login_mac = v_last_login_mac;
    SET p_last_login_date = v_last_login_date;
    SET p_last_oper_info = v_last_oper_info;
    SET p_online_status = v_online_status;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_交易接口_检查证券属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_trdif_CheckExchProp;;
DELIMITER ;;
CREATE PROCEDURE pra_trdif_CheckExchProp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_price_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_bond_rate_type int,
    OUT p_bond_accr_intrst decimal(18,12)
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
    declare v_price_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_min_unit int;
    declare v_min_qty decimal(18,2);
    declare v_max_qty decimal(18,2);
    declare v_stop_status varchar(2);
    declare v_is_order_dir_flag int;
    declare v_hk_stock_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_price_type = p_price_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
    SET v_min_unit = 0;
    SET v_min_qty = 0;
    SET v_max_qty = 0;
    SET v_stop_status = "0";
    SET v_is_order_dir_flag = 0;
    SET v_hk_stock_flag = 0;

    
    label_pro:BEGIN
    
    #如果价格类型是市价，则根据配置设置订单价格

    /* if @价格类型# = 0 then */
    if v_price_type = 0 then

        /* set @价格类型# = 《价格类型-限价》; */
        set v_price_type = 1;
    end if;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}, {证券类型}, {资产类型}, {本币币种}, {交易币种}, {资金回转天数}, {持仓回转天数}, {票面面值}, {最小单位}, {最小数量}, {最大数量}, {停牌标志}, {区分订单方向标志},{港股通标的}][@证券代码编号#, @证券类型#, @资产类型#, @本币币种#, @交易币种#, @资金回转天数#, @持仓回转天数#, @票面面值#, @最小单位#, @最小数量#, @最大数量#, @停牌标志#, @区分订单方向标志#,@港股通标的#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#, @证券代码#] */
    select stock_code_no, stock_type, asset_type, crncy_type, exch_crncy_type, capit_reback_days, posi_reback_days, par_value, min_unit, min_qty, max_qty, stop_status, is_order_dir_flag,hk_stock_flag into v_stock_code_no, v_stock_type, v_asset_type, v_crncy_type, v_exch_crncy_type, v_capit_reback_days, v_posi_reback_days, v_par_value, v_min_unit, v_min_qty, v_max_qty, v_stop_status, v_is_order_dir_flag,v_hk_stock_flag from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.25.37.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,","," 证券代码=", v_stock_code);
        end if;
        leave label_pro;
    end if;

    #[检查报错返回][@停牌标志# <> 《停牌标志-正常》][8][@证券代码#]
        #如果是债券类业务

        /* if @证券类型# > 20 and @证券类型# < 50 then */
        if v_stock_type > 20 and v_stock_type < 50 then

               /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{债券利率类型}, {债券计提利息}, {票面面值},{质押比例},{净价标志},{计息天数}][@债券利率类型#, @债券计提利息#, @票面面值#,@质押比例#,@净价标志#,@计息天数#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4i][@市场编号#,@证券代码#] */
               select bond_rate_type, bond_accr_intrst, par_value,impawn_ratio,net_price_flag,intrst_days into v_bond_rate_type, v_bond_accr_intrst, v_par_value,v_impawn_ratio,v_net_price_flag,v_intrst_days from db_pub.tb_basesedt_bond_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
               if FOUND_ROWS() = 0 then
                           
                   SET v_error_code = "pubA.25.37.4i";
                   if v_mysql_message <> "" then
                       SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                   else
                       SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
                   end if;
                   leave label_pro;
               end if;

        end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_bond_accr_intrst = v_bond_accr_intrst;

END;;


