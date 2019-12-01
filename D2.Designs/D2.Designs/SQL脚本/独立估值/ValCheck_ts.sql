DELIMITER ;;
use db_val;;

# 事务_独立估值_查询核对_新增估值表邮箱配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_valcheck_AddMailBoxConfig;;
DELIMITER ;;
CREATE PROCEDURE prt_valcheck_AddMailBoxConfig(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_独立估值_查询核对_新增估值表邮箱配置】*/
        call db_val.pra_valcheck_AddMailboxConfig(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_mail_server,
            v_server_type,
            v_mail_server_protocol,
            v_mail_server_port,
            v_mail_server_username,
            v_mail_server_password,
            v_ssl_type,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "valT.4.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_独立估值_查询核对_新增估值表邮箱配置出现错误！',v_mysql_message);
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
use db_val;;

# 事务_独立估值_查询核对_修改估值表邮箱配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_valcheck_UpdateValTableConfig;;
DELIMITER ;;
CREATE PROCEDURE prt_valcheck_UpdateValTableConfig(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_独立估值_查询核对_修改估值表邮箱配置】*/
        call db_val.pra_valcheck_UpdateMailBoxConfig(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_co_no,
            v_mail_server,
            v_server_type,
            v_mail_server_protocol,
            v_mail_server_port,
            v_mail_server_username,
            v_mail_server_password,
            v_ssl_type,
            v_rule_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "valT.4.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_独立估值_查询核对_修改估值表邮箱配置出现错误！',v_mysql_message);
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
use db_val;;

# 事务_独立估值_查询核对_查询估值表邮箱配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_valcheck_QueryMailBoxConfig;;
DELIMITER ;;
CREATE PROCEDURE prt_valcheck_QueryMailBoxConfig(
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
    

        /* 调用【原子_独立估值_查询核对_查询估值表邮箱配置】*/
        call db_val.pra_valcheck_QueryMailBoxConfig(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_rule_flag,
            v_row_id,
            v_row_count,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "valT.4.3.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_独立估值_查询核对_查询估值表邮箱配置出现错误！',v_mysql_message);
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
use db_val;;

# 事务_独立估值_查询核对_新增托管估值表配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_valcheck_AddValTableConfig;;
DELIMITER ;;
CREATE PROCEDURE prt_valcheck_AddValTableConfig(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


         /* 调用【原子_独立估值_查询核对_新增托管估值表配置】*/
         call db_val.pra_valcheck_AddValTableConfig(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_co_no,
             v_pd_no,
             v_file_name,
             v_netvalue_date_posi,
             v_valtable_begin_row,
             v_fina_acco_code,
             v_fina_acco_name,
             v_crncy_type,
             v_amount,
             v_unit_cost,
             v_prime_cost_original,
             v_prime_cost_crncy,
             v_cost_net_ratio,
             v_market_price,
             v_market_value_original,
             v_market_value_crncy,
             v_market_net_ratio,
             v_evalu_add_original,
             v_evalu_add_crncy,
             v_stop_info,
             v_rights_info,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "valT.4.11.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_独立估值_查询核对_新增托管估值表配置出现错误！',v_mysql_message);
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
use db_val;;

# 事务_独立估值_查询核对_修改托管估值表配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_valcheck_UpdateValTableConfig;;
DELIMITER ;;
CREATE PROCEDURE prt_valcheck_UpdateValTableConfig(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_独立估值_查询核对_修改托管估值表配置】*/
        call db_val.pra_valcheck_UpdateValTableConfig(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_file_name,
            v_netvalue_date_posi,
            v_valtable_begin_row,
            v_fina_acco_code,
            v_fina_acco_name,
            v_crncy_type,
            v_amount,
            v_unit_cost,
            v_prime_cost_original,
            v_prime_cost_crncy,
            v_cost_net_ratio,
            v_market_price,
            v_market_value_original,
            v_market_value_crncy,
            v_market_net_ratio,
            v_evalu_add_original,
            v_evalu_add_crncy,
            v_stop_info,
            v_rights_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "valT.4.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_独立估值_查询核对_修改托管估值表配置出现错误！',v_mysql_message);
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
use db_val;;

# 事务_独立估值_查询核对_查询托管估值表配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_valcheck_QueryValTableConfig;;
DELIMITER ;;
CREATE PROCEDURE prt_valcheck_QueryValTableConfig(
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
    

         /* 调用【原子_独立估值_查询核对_查询托管估值表配置】*/
         call db_val.pra_valcheck_QueryValTableConfig(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_co_no,
             v_pd_no,
             v_row_id,
             v_row_count,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "valT.4.13.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_独立估值_查询核对_查询托管估值表配置出现错误！',v_mysql_message);
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
use db_val;;

# 事务_独立估值_查询核对_新增托管估值表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_valcheck_AddValTable;;
DELIMITER ;;
CREATE PROCEDURE prt_valcheck_AddValTable(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_独立估值_查询核对_新增托管估值表】*/
        call db_val.pra_valcheck_AddValTable(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_evalu_date,
            v_co_no,
            v_pd_no,
            v_valtable_no,
            v_fina_acco_code,
            v_fina_acco_name,
            v_crncy_type,
            v_amount,
            v_unit_cost,
            v_prime_cost_original,
            v_prime_cost_crncy,
            v_cost_net_ratio,
            v_market_price,
            v_market_value_original,
            v_market_value_crncy,
            v_market_net_ratio,
            v_evalu_add_original,
            v_evalu_add_crncy,
            v_stop_info,
            v_rights_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "valT.4.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_独立估值_查询核对_新增托管估值表出现错误！',v_mysql_message);
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
use db_val;;

# 事务_独立估值_查询核对_查询托管估值表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_valcheck_QueryValTable;;
DELIMITER ;;
CREATE PROCEDURE prt_valcheck_QueryValTable(
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
    

    /* 调用【原子_独立估值_查询核对_查询托管估值表】*/
    call db_val.pra_valcheck_QueryValTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_evalu_date,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "valT.4.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_独立估值_查询核对_查询托管估值表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


