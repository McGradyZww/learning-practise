DELIMITER ;;
use db_val;;

# 原子_独立估值_查询核对_新增估值表邮箱配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_valcheck_AddMailboxConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_valcheck_AddMailboxConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_mail_server varchar(64),
    IN p_server_type int,
    IN p_mail_server_protocol varchar(16),
    IN p_mail_server_port int,
    IN p_mail_server_username varchar(64),
    IN p_mail_server_password varchar(64),
    IN p_ssl_type int,
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
    declare v_mail_server varchar(64);
    declare v_server_type int;
    declare v_mail_server_protocol varchar(16);
    declare v_mail_server_port int;
    declare v_mail_server_username varchar(64);
    declare v_mail_server_password varchar(64);
    declare v_ssl_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_rule_flag int;
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
    SET v_mail_server = p_mail_server;
    SET v_server_type = p_server_type;
    SET v_mail_server_protocol = p_mail_server_protocol;
    SET v_mail_server_port = p_mail_server_port;
    SET v_mail_server_username = p_mail_server_username;
    SET v_mail_server_password = p_mail_server_password;
    SET v_ssl_type = p_ssl_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_rule_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @启用标志# =《启用标志-启用》; */
    set v_rule_flag =1;

    /* [插入表记录][独立估值_查询核对_邮箱配置表][字段][字段变量][13010101][@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_val.tb_valcheck_mailbox_config(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, mail_server, 
        server_type, mail_server_protocol, mail_server_port, mail_server_username, 
        mail_server_password, ssl_type, rule_flag) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_mail_server, 
        v_server_type, v_mail_server_protocol, v_mail_server_port, v_mail_server_username, 
        v_mail_server_password, v_ssl_type, v_rule_flag);
    if v_error_code = "1" then
                
        SET v_error_code = "valA.4.1.13010101";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_val;;

# 原子_独立估值_查询核对_修改估值表邮箱配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_valcheck_UpdateMailBoxConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_valcheck_UpdateMailBoxConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_mail_server varchar(64),
    IN p_server_type int,
    IN p_mail_server_protocol varchar(16),
    IN p_mail_server_port int,
    IN p_mail_server_username varchar(64),
    IN p_mail_server_password varchar(64),
    IN p_ssl_type int,
    IN p_rule_flag int,
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
    declare v_co_no int;
    declare v_mail_server varchar(64);
    declare v_server_type int;
    declare v_mail_server_protocol varchar(16);
    declare v_mail_server_port int;
    declare v_mail_server_username varchar(64);
    declare v_mail_server_password varchar(64);
    declare v_ssl_type int;
    declare v_rule_flag int;
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
    SET v_co_no = p_co_no;
    SET v_mail_server = p_mail_server;
    SET v_server_type = p_server_type;
    SET v_mail_server_protocol = p_mail_server_protocol;
    SET v_mail_server_port = p_mail_server_port;
    SET v_mail_server_username = p_mail_server_username;
    SET v_mail_server_password = p_mail_server_password;
    SET v_ssl_type = p_ssl_type;
    SET v_rule_flag = p_rule_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][独立估值_查询核对_邮箱配置表][{邮件服务器}=@邮件服务器#,{服务器类型}=@服务器类型#,{邮件服务器协议}=@邮件服务器协议#,{邮件服务器端口}=@邮件服务器端口#,{邮件服务器用户名}=@邮件服务器用户名#,{邮件服务器密码}=@邮件服务器密码#,{SSL标志}=@SSL标志#,{启用标志}=@启用标志#][{记录序号}=@记录序号# and {机构编号}=@机构编号#][2][@机构编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_val.tb_valcheck_mailbox_config set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, mail_server=v_mail_server,server_type=v_server_type,mail_server_protocol=v_mail_server_protocol,mail_server_port=v_mail_server_port,mail_server_username=v_mail_server_username,mail_server_password=v_mail_server_password,ssl_type=v_ssl_type,rule_flag=v_rule_flag where row_id=v_row_id and co_no=v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "valA.4.2.2";
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
use db_val;;

# 原子_独立估值_查询核对_查询估值表邮箱配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_valcheck_QueryMailBoxConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_valcheck_QueryMailBoxConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_rule_flag int,
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
    declare v_rule_flag int;
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
    SET v_rule_flag = p_rule_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][独立估值_查询核对_邮箱配置表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@启用标志# = 0 or {启用标志} = @启用标志#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        mail_server, server_type, mail_server_protocol, mail_server_port, 
        mail_server_username, mail_server_password, ssl_type, rule_flag from db_val.tb_valcheck_mailbox_config where (v_co_no = 0 or co_no=v_co_no) and (v_rule_flag = 0 or rule_flag = v_rule_flag);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        mail_server, server_type, mail_server_protocol, mail_server_port, 
        mail_server_username, mail_server_password, ssl_type, rule_flag from db_val.tb_valcheck_mailbox_config where (v_co_no = 0 or co_no=v_co_no) and (v_rule_flag = 0 or rule_flag = v_rule_flag) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_val;;

# 原子_独立估值_查询核对_新增托管估值表配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_valcheck_AddValTableConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_valcheck_AddValTableConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_file_name varchar(64),
    IN p_netvalue_date_posi varchar(32),
    IN p_valtable_begin_row int,
    IN p_fina_acco_code varchar(64),
    IN p_fina_acco_name varchar(64),
    IN p_crncy_type varchar(3),
    IN p_amount varchar(32),
    IN p_unit_cost varchar(32),
    IN p_prime_cost_original varchar(32),
    IN p_prime_cost_crncy varchar(32),
    IN p_cost_net_ratio varchar(32),
    IN p_market_price varchar(32),
    IN p_market_value_original varchar(32),
    IN p_market_value_crncy varchar(32),
    IN p_market_net_ratio varchar(32),
    IN p_evalu_add_original varchar(64),
    IN p_evalu_add_crncy varchar(64),
    IN p_stop_info varchar(32),
    IN p_rights_info varchar(255),
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
    declare v_file_name varchar(64);
    declare v_netvalue_date_posi varchar(32);
    declare v_valtable_begin_row int;
    declare v_fina_acco_code varchar(64);
    declare v_fina_acco_name varchar(64);
    declare v_crncy_type varchar(3);
    declare v_amount varchar(32);
    declare v_unit_cost varchar(32);
    declare v_prime_cost_original varchar(32);
    declare v_prime_cost_crncy varchar(32);
    declare v_cost_net_ratio varchar(32);
    declare v_market_price varchar(32);
    declare v_market_value_original varchar(32);
    declare v_market_value_crncy varchar(32);
    declare v_market_net_ratio varchar(32);
    declare v_evalu_add_original varchar(64);
    declare v_evalu_add_crncy varchar(64);
    declare v_stop_info varchar(32);
    declare v_rights_info varchar(255);
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
    SET v_file_name = p_file_name;
    SET v_netvalue_date_posi = p_netvalue_date_posi;
    SET v_valtable_begin_row = p_valtable_begin_row;
    SET v_fina_acco_code = p_fina_acco_code;
    SET v_fina_acco_name = p_fina_acco_name;
    SET v_crncy_type = p_crncy_type;
    SET v_amount = p_amount;
    SET v_unit_cost = p_unit_cost;
    SET v_prime_cost_original = p_prime_cost_original;
    SET v_prime_cost_crncy = p_prime_cost_crncy;
    SET v_cost_net_ratio = p_cost_net_ratio;
    SET v_market_price = p_market_price;
    SET v_market_value_original = p_market_value_original;
    SET v_market_value_crncy = p_market_value_crncy;
    SET v_market_net_ratio = p_market_net_ratio;
    SET v_evalu_add_original = p_evalu_add_original;
    SET v_evalu_add_crncy = p_evalu_add_crncy;
    SET v_stop_info = p_stop_info;
    SET v_rights_info = p_rights_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][独立估值_查询核对_托管估值配置表][字段][字段变量][{机构编号}=@机构编号#,{产品编号}=@产品编号#,{文件名称}=@文件名称#,{净值日期位置}=@净值日期位置#,{估值表起始行号}=@估值表起始行号#,{科目代码}=@科目代码#,{科目名称}=@科目名称#,{本币币种}=@本币币种#,{数量}=@数量#,{单位成本}=@单位成本#,{成本原币}=@成本原币#,{成本本币}=@成本本币#,{成本占净值}=@成本占净值#,{市价}=@市价#,{市值原币}=@市值原币#,{市值本币}=@市值本币#,{市值占净值}=@市值占净值#,{估值增值原币}=@估值增值原币#,{估值增值本币}=@估值增值本币#,{停牌信息}=@停牌信息#,{权益信息}=@权益信息#][1][@机构编号#, @产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_val.tb_valcheck_deposit_valtable_config (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        file_name, netvalue_date_posi, valtable_begin_row, fina_acco_code, 
        fina_acco_name, crncy_type, amount, unit_cost, 
        prime_cost_original, prime_cost_crncy, cost_net_ratio, market_price, 
        market_value_original, market_value_crncy, market_net_ratio, evalu_add_original, 
        evalu_add_crncy, stop_info, rights_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_file_name, v_netvalue_date_posi, v_valtable_begin_row, v_fina_acco_code, 
        v_fina_acco_name, v_crncy_type, v_amount, v_unit_cost, 
        v_prime_cost_original, v_prime_cost_crncy, v_cost_net_ratio, v_market_price, 
        v_market_value_original, v_market_value_crncy, v_market_net_ratio, v_evalu_add_original, 
        v_evalu_add_crncy, v_stop_info, v_rights_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no,pd_no=v_pd_no,file_name=v_file_name,netvalue_date_posi=v_netvalue_date_posi,valtable_begin_row=v_valtable_begin_row,fina_acco_code=v_fina_acco_code,fina_acco_name=v_fina_acco_name,crncy_type=v_crncy_type,amount=v_amount,unit_cost=v_unit_cost,prime_cost_original=v_prime_cost_original,prime_cost_crncy=v_prime_cost_crncy,cost_net_ratio=v_cost_net_ratio,market_price=v_market_price,market_value_original=v_market_value_original,market_value_crncy=v_market_value_crncy,market_net_ratio=v_market_net_ratio,evalu_add_original=v_evalu_add_original,evalu_add_crncy=v_evalu_add_crncy,stop_info=v_stop_info,rights_info=v_rights_info;
    if v_error_code = "1" then
                
        SET v_error_code = "valA.4.11.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 产品编号=", v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_val;;

# 原子_独立估值_查询核对_修改托管估值表配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_valcheck_UpdateValTableConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_valcheck_UpdateValTableConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_file_name varchar(64),
    IN p_netvalue_date_posi varchar(32),
    IN p_valtable_begin_row int,
    IN p_fina_acco_code varchar(64),
    IN p_fina_acco_name varchar(64),
    IN p_crncy_type varchar(3),
    IN p_amount varchar(32),
    IN p_unit_cost varchar(32),
    IN p_prime_cost_original varchar(32),
    IN p_prime_cost_crncy varchar(32),
    IN p_cost_net_ratio varchar(32),
    IN p_market_price varchar(32),
    IN p_market_value_original varchar(32),
    IN p_market_value_crncy varchar(32),
    IN p_market_net_ratio varchar(32),
    IN p_evalu_add_original varchar(64),
    IN p_evalu_add_crncy varchar(64),
    IN p_stop_info varchar(32),
    IN p_rights_info varchar(255),
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
    declare v_file_name varchar(64);
    declare v_netvalue_date_posi varchar(32);
    declare v_valtable_begin_row int;
    declare v_fina_acco_code varchar(64);
    declare v_fina_acco_name varchar(64);
    declare v_crncy_type varchar(3);
    declare v_amount varchar(32);
    declare v_unit_cost varchar(32);
    declare v_prime_cost_original varchar(32);
    declare v_prime_cost_crncy varchar(32);
    declare v_cost_net_ratio varchar(32);
    declare v_market_price varchar(32);
    declare v_market_value_original varchar(32);
    declare v_market_value_crncy varchar(32);
    declare v_market_net_ratio varchar(32);
    declare v_evalu_add_original varchar(64);
    declare v_evalu_add_crncy varchar(64);
    declare v_stop_info varchar(32);
    declare v_rights_info varchar(255);
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
    SET v_file_name = p_file_name;
    SET v_netvalue_date_posi = p_netvalue_date_posi;
    SET v_valtable_begin_row = p_valtable_begin_row;
    SET v_fina_acco_code = p_fina_acco_code;
    SET v_fina_acco_name = p_fina_acco_name;
    SET v_crncy_type = p_crncy_type;
    SET v_amount = p_amount;
    SET v_unit_cost = p_unit_cost;
    SET v_prime_cost_original = p_prime_cost_original;
    SET v_prime_cost_crncy = p_prime_cost_crncy;
    SET v_cost_net_ratio = p_cost_net_ratio;
    SET v_market_price = p_market_price;
    SET v_market_value_original = p_market_value_original;
    SET v_market_value_crncy = p_market_value_crncy;
    SET v_market_net_ratio = p_market_net_ratio;
    SET v_evalu_add_original = p_evalu_add_original;
    SET v_evalu_add_crncy = p_evalu_add_crncy;
    SET v_stop_info = p_stop_info;
    SET v_rights_info = p_rights_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][独立估值_查询核对_托管估值配置表][{文件名称}=@文件名称#,{净值日期位置}=@净值日期位置#,{估值表起始行号}=@估值表起始行号#,{科目代码}=@科目代码#,{科目名称}=@科目名称#,{本币币种}=@本币币种#,{数量}=@数量#,{单位成本}=@单位成本#,{成本原币}=@成本原币#,{成本本币}=@成本本币#,{成本占净值}=@成本占净值#,{市价}=@市价#,{市值原币}=@市值原币#,{市值本币}=@市值本币#,{市值占净值}=@市值占净值#,{估值增值原币}=@估值增值原币#,{估值增值本币}=@估值增值本币#,{停牌信息}=@停牌信息#,{权益信息}=@权益信息#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][2][@机构编号#,@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_val.tb_valcheck_deposit_valtable_config set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, file_name=v_file_name,netvalue_date_posi=v_netvalue_date_posi,valtable_begin_row=v_valtable_begin_row,fina_acco_code=v_fina_acco_code,fina_acco_name=v_fina_acco_name,crncy_type=v_crncy_type,amount=v_amount,unit_cost=v_unit_cost,prime_cost_original=v_prime_cost_original,prime_cost_crncy=v_prime_cost_crncy,cost_net_ratio=v_cost_net_ratio,market_price=v_market_price,market_value_original=v_market_value_original,market_value_crncy=v_market_value_crncy,market_net_ratio=v_market_net_ratio,evalu_add_original=v_evalu_add_original,evalu_add_crncy=v_evalu_add_crncy,stop_info=v_stop_info,rights_info=v_rights_info where co_no=v_co_no and pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "valA.4.12.2";
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
use db_val;;

# 原子_独立估值_查询核对_查询托管估值表配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_valcheck_QueryValTableConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_valcheck_QueryValTableConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][独立估值_查询核对_托管估值配置表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, file_name, netvalue_date_posi, valtable_begin_row, 
        fina_acco_code, fina_acco_name, crncy_type, amount, 
        unit_cost, prime_cost_original, prime_cost_crncy, cost_net_ratio, 
        market_price, market_value_original, market_value_crncy, market_net_ratio, 
        evalu_add_original, evalu_add_crncy, stop_info, rights_info from db_val.tb_valcheck_deposit_valtable_config where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, file_name, netvalue_date_posi, valtable_begin_row, 
        fina_acco_code, fina_acco_name, crncy_type, amount, 
        unit_cost, prime_cost_original, prime_cost_crncy, cost_net_ratio, 
        market_price, market_value_original, market_value_crncy, market_net_ratio, 
        evalu_add_original, evalu_add_crncy, stop_info, rights_info from db_val.tb_valcheck_deposit_valtable_config where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_val;;

# 原子_独立估值_查询核对_新增托管估值表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_valcheck_AddValTable;;
DELIMITER ;;
CREATE PROCEDURE pra_valcheck_AddValTable(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_valtable_no int,
    IN p_fina_acco_code varchar(64),
    IN p_fina_acco_name varchar(64),
    IN p_crncy_type varchar(3),
    IN p_amount varchar(32),
    IN p_unit_cost varchar(32),
    IN p_prime_cost_original varchar(32),
    IN p_prime_cost_crncy varchar(32),
    IN p_cost_net_ratio varchar(32),
    IN p_market_price varchar(32),
    IN p_market_value_original varchar(32),
    IN p_market_value_crncy varchar(32),
    IN p_market_net_ratio varchar(32),
    IN p_evalu_add_original varchar(64),
    IN p_evalu_add_crncy varchar(64),
    IN p_stop_info varchar(32),
    IN p_rights_info varchar(255),
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_valtable_no int;
    declare v_fina_acco_code varchar(64);
    declare v_fina_acco_name varchar(64);
    declare v_crncy_type varchar(3);
    declare v_amount varchar(32);
    declare v_unit_cost varchar(32);
    declare v_prime_cost_original varchar(32);
    declare v_prime_cost_crncy varchar(32);
    declare v_cost_net_ratio varchar(32);
    declare v_market_price varchar(32);
    declare v_market_value_original varchar(32);
    declare v_market_value_crncy varchar(32);
    declare v_market_net_ratio varchar(32);
    declare v_evalu_add_original varchar(64);
    declare v_evalu_add_crncy varchar(64);
    declare v_stop_info varchar(32);
    declare v_rights_info varchar(255);
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_valtable_no = p_valtable_no;
    SET v_fina_acco_code = p_fina_acco_code;
    SET v_fina_acco_name = p_fina_acco_name;
    SET v_crncy_type = p_crncy_type;
    SET v_amount = p_amount;
    SET v_unit_cost = p_unit_cost;
    SET v_prime_cost_original = p_prime_cost_original;
    SET v_prime_cost_crncy = p_prime_cost_crncy;
    SET v_cost_net_ratio = p_cost_net_ratio;
    SET v_market_price = p_market_price;
    SET v_market_value_original = p_market_value_original;
    SET v_market_value_crncy = p_market_value_crncy;
    SET v_market_net_ratio = p_market_net_ratio;
    SET v_evalu_add_original = p_evalu_add_original;
    SET v_evalu_add_crncy = p_evalu_add_crncy;
    SET v_stop_info = p_stop_info;
    SET v_rights_info = p_rights_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][独立估值_查询核对_托管估值表][字段][字段变量][{估值日期}=@估值日期#,{机构编号}=@机构编号#,{产品编号}=@产品编号#,{估值表行号}=@估值表行号#,{科目代码}=@科目代码#,{科目名称}=@科目名称#,{本币币种}=@本币币种#,{数量}=@数量#,{单位成本}=@单位成本#,{成本原币}=@成本原币#,{成本本币}=@成本本币#,{成本占净值}=@成本占净值#,{市价}=@市价#,{市值原币}=@市值原币#,{市值本币}=@市值本币#,{市值占净值}=@市值占净值#,{估值增值原币}=@估值增值原币#,{估值增值本币}=@估值增值本币#,{停牌信息}=@停牌信息#,{权益信息}=@权益信息#][1][@估值日期#,@机构编号#,@产品编号#,@估值表行号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_val.tb_valcheck_deposit_valtable (
        create_date, create_time, update_date, 
        update_time, update_times, evalu_date, co_no, 
        pd_no, valtable_no, fina_acco_code, fina_acco_name, 
        crncy_type, amount, unit_cost, prime_cost_original, 
        prime_cost_crncy, cost_net_ratio, market_price, market_value_original, 
        market_value_crncy, market_net_ratio, evalu_add_original, evalu_add_crncy, 
        stop_info, rights_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_evalu_date, v_co_no, 
        v_pd_no, v_valtable_no, v_fina_acco_code, v_fina_acco_name, 
        v_crncy_type, v_amount, v_unit_cost, v_prime_cost_original, 
        v_prime_cost_crncy, v_cost_net_ratio, v_market_price, v_market_value_original, 
        v_market_value_crncy, v_market_net_ratio, v_evalu_add_original, v_evalu_add_crncy, 
        v_stop_info, v_rights_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, evalu_date=v_evalu_date,co_no=v_co_no,pd_no=v_pd_no,valtable_no=v_valtable_no,fina_acco_code=v_fina_acco_code,fina_acco_name=v_fina_acco_name,crncy_type=v_crncy_type,amount=v_amount,unit_cost=v_unit_cost,prime_cost_original=v_prime_cost_original,prime_cost_crncy=v_prime_cost_crncy,cost_net_ratio=v_cost_net_ratio,market_price=v_market_price,market_value_original=v_market_value_original,market_value_crncy=v_market_value_crncy,market_net_ratio=v_market_net_ratio,evalu_add_original=v_evalu_add_original,evalu_add_crncy=v_evalu_add_crncy,stop_info=v_stop_info,rights_info=v_rights_info;
    if v_error_code = "1" then
                
        SET v_error_code = "valA.4.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("估值日期=",v_evalu_date,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","估值表行号=",v_valtable_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("估值日期=",v_evalu_date,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","估值表行号=",v_valtable_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_val;;

# 原子_独立估值_查询核对_查询托管估值表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_valcheck_QueryValTable;;
DELIMITER ;;
CREATE PROCEDURE pra_valcheck_QueryValTable(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_evalu_date int,
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
    declare v_evalu_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][独立估值_查询核对_托管估值表][字段][{机构编号}=@机构编号# and {产品编号} = @产品编号# and {估值日期}=@估值日期# order by {估值表行号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, evalu_date, 
        co_no, pd_no, valtable_no, fina_acco_code, 
        fina_acco_name, crncy_type, amount, unit_cost, 
        prime_cost_original, prime_cost_crncy, cost_net_ratio, market_price, 
        market_value_original, market_value_crncy, market_net_ratio, evalu_add_original, 
        evalu_add_crncy, stop_info, rights_info from db_val.tb_valcheck_deposit_valtable where co_no=v_co_no and pd_no = v_pd_no and evalu_date=v_evalu_date order by valtable_no;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, evalu_date, 
        co_no, pd_no, valtable_no, fina_acco_code, 
        fina_acco_name, crncy_type, amount, unit_cost, 
        prime_cost_original, prime_cost_crncy, cost_net_ratio, market_price, 
        market_value_original, market_value_crncy, market_net_ratio, evalu_add_original, 
        evalu_add_crncy, stop_info, rights_info from db_val.tb_valcheck_deposit_valtable where co_no=v_co_no and pd_no = v_pd_no and evalu_date=v_evalu_date order by valtable_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


