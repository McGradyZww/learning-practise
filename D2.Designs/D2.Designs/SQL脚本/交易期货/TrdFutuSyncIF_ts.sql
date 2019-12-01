DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_同步接口_获取同步时间
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfusyn_GetSyncTime;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfusyn_GetSyncTime(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_table varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_update_date int,
    OUT p_update_time int,
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
    declare v_qry_table varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_qry_table = p_qry_table;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_mach_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_同步接口_获取同步时间】*/
    call db_tdfutu.pra_tdfusyn_GetSyncTime(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_table,
        v_error_code,
        v_error_info,
        v_update_date,
        v_update_time,
        v_mach_date,
        v_mach_time);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.15.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_同步接口_获取同步时间出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_update_date = v_update_date;
    SET p_update_time = v_update_time;
    SET p_mach_date = v_mach_date;
    SET p_mach_time = v_mach_time;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_同步接口_更新同步时间
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfusyn_UpdateSyncTime;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfusyn_UpdateSyncTime(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_table varchar(255),
    IN p_update_date int,
    IN p_update_time int,
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
    declare v_qry_table varchar(255);
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_qry_table = p_qry_table;
    SET v_update_date = p_update_date;
    SET v_update_time = p_update_time;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_mach_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易期货_同步接口_更新同步时间】*/
    call db_tdfutu.pra_tdfusyn_UpdateSyncTime(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_table,
        v_update_date,
        v_update_time,
        v_error_code,
        v_error_info,
        v_mach_date,
        v_mach_time);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.15.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_同步接口_更新同步时间出现错误！',v_mysql_message);
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
    SET p_mach_date = v_mach_date;
    SET p_mach_time = v_mach_time;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_同步接口_同步交易组业务资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfusyn_Synctdfuac_exgp_busi_capit;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfusyn_Synctdfuac_exgp_busi_capit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_ctrl_flag int,
    IN p_update_date int,
    IN p_update_time int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    OUT p_sync_field13 varchar(10000),
    OUT p_sync_field14 varchar(10000),
    OUT p_sync_field15 varchar(10000),
    OUT p_sync_field16 varchar(10000),
    OUT p_sync_field17 varchar(10000),
    OUT p_sync_field18 varchar(10000),
    OUT p_sync_field19 varchar(10000),
    OUT p_sync_field20 varchar(10000),
    OUT p_sync_field21 varchar(10000),
    OUT p_sync_field22 varchar(10000),
    OUT p_sync_field23 varchar(10000),
    OUT p_sync_field24 varchar(10000),
    OUT p_sync_field25 varchar(10000),
    OUT p_sync_field26 varchar(10000),
    OUT p_sync_field27 varchar(10000),
    OUT p_sync_field28 varchar(10000),
    OUT p_sync_field29 varchar(10000),
    OUT p_sync_field30 varchar(10000),
    OUT p_sync_field31 varchar(10000),
    OUT p_sync_field32 varchar(10000),
    OUT p_sync_field33 varchar(10000),
    OUT p_sync_field34 varchar(10000),
    OUT p_sync_field35 varchar(10000),
    OUT p_sync_field36 varchar(10000),
    OUT p_sync_field37 varchar(10000),
    OUT p_sync_field38 varchar(10000),
    OUT p_sync_field39 varchar(10000),
    OUT p_sync_field40 varchar(10000),
    OUT p_sync_field41 varchar(10000),
    OUT p_sync_field42 varchar(10000),
    OUT p_sync_field43 varchar(10000),
    OUT p_sync_field44 varchar(10000),
    OUT p_sync_field45 varchar(10000),
    OUT p_sync_field46 varchar(10000),
    OUT p_sync_field47 varchar(10000),
    OUT p_sync_field48 varchar(10000),
    OUT p_sync_field49 varchar(10000),
    OUT p_sync_field50 varchar(10000),
    OUT p_sync_field51 varchar(10000),
    OUT p_sync_field52 varchar(10000),
    OUT p_sync_field53 varchar(10000),
    OUT p_sync_field54 varchar(10000),
    OUT p_sync_field55 varchar(10000),
    OUT p_sync_field56 varchar(10000),
    OUT p_sync_field57 varchar(10000),
    OUT p_sync_field58 varchar(10000),
    OUT p_sync_field59 varchar(10000),
    OUT p_sync_field60 varchar(10000),
    OUT p_sync_field61 varchar(10000),
    OUT p_sync_field62 varchar(10000),
    OUT p_sync_field63 varchar(10000),
    OUT p_sync_field64 varchar(10000),
    OUT p_sync_field65 varchar(10000),
    OUT p_sync_field66 varchar(10000),
    OUT p_sync_field67 varchar(10000),
    OUT p_sync_field68 varchar(10000),
    OUT p_sync_field69 varchar(10000),
    OUT p_sync_field70 varchar(10000),
    OUT p_sync_field71 varchar(10000),
    OUT p_sync_field72 varchar(10000),
    OUT p_sync_field73 varchar(10000),
    OUT p_sync_field74 varchar(10000),
    OUT p_sync_field75 varchar(10000),
    OUT p_sync_field76 varchar(10000),
    OUT p_sync_field77 varchar(10000),
    OUT p_sync_field78 varchar(10000),
    OUT p_sync_field79 varchar(10000),
    OUT p_sync_field80 varchar(10000),
    OUT p_sync_field81 varchar(10000),
    OUT p_sync_field82 varchar(10000),
    OUT p_sync_field83 varchar(10000),
    OUT p_sync_field84 varchar(10000),
    OUT p_sync_field85 varchar(10000),
    OUT p_sync_field86 varchar(10000),
    OUT p_sync_field87 varchar(10000),
    OUT p_sync_field88 varchar(10000),
    OUT p_sync_field89 varchar(10000),
    OUT p_sync_field90 varchar(10000),
    OUT p_sync_field91 varchar(10000),
    OUT p_sync_field92 varchar(10000),
    OUT p_sync_field93 varchar(10000),
    OUT p_sync_field94 varchar(10000),
    OUT p_sync_field95 varchar(10000),
    OUT p_sync_field96 varchar(10000),
    OUT p_sync_field97 varchar(10000),
    OUT p_sync_field98 varchar(10000),
    OUT p_sync_field99 varchar(10000)
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
    declare v_ctrl_flag int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_sync_field14 varchar(10000);
    declare v_sync_field15 varchar(10000);
    declare v_sync_field16 varchar(10000);
    declare v_sync_field17 varchar(10000);
    declare v_sync_field18 varchar(10000);
    declare v_sync_field19 varchar(10000);
    declare v_sync_field20 varchar(10000);
    declare v_sync_field21 varchar(10000);
    declare v_sync_field22 varchar(10000);
    declare v_sync_field23 varchar(10000);
    declare v_sync_field24 varchar(10000);
    declare v_sync_field25 varchar(10000);
    declare v_sync_field26 varchar(10000);
    declare v_sync_field27 varchar(10000);
    declare v_sync_field28 varchar(10000);
    declare v_sync_field29 varchar(10000);
    declare v_sync_field30 varchar(10000);
    declare v_sync_field31 varchar(10000);
    declare v_sync_field32 varchar(10000);
    declare v_sync_field33 varchar(10000);
    declare v_sync_field34 varchar(10000);
    declare v_sync_field35 varchar(10000);
    declare v_sync_field36 varchar(10000);
    declare v_sync_field37 varchar(10000);
    declare v_sync_field38 varchar(10000);
    declare v_sync_field39 varchar(10000);
    declare v_sync_field40 varchar(10000);
    declare v_sync_field41 varchar(10000);
    declare v_sync_field42 varchar(10000);
    declare v_sync_field43 varchar(10000);
    declare v_sync_field44 varchar(10000);
    declare v_sync_field45 varchar(10000);
    declare v_sync_field46 varchar(10000);
    declare v_sync_field47 varchar(10000);
    declare v_sync_field48 varchar(10000);
    declare v_sync_field49 varchar(10000);
    declare v_sync_field50 varchar(10000);
    declare v_sync_field51 varchar(10000);
    declare v_sync_field52 varchar(10000);
    declare v_sync_field53 varchar(10000);
    declare v_sync_field54 varchar(10000);
    declare v_sync_field55 varchar(10000);
    declare v_sync_field56 varchar(10000);
    declare v_sync_field57 varchar(10000);
    declare v_sync_field58 varchar(10000);
    declare v_sync_field59 varchar(10000);
    declare v_sync_field60 varchar(10000);
    declare v_sync_field61 varchar(10000);
    declare v_sync_field62 varchar(10000);
    declare v_sync_field63 varchar(10000);
    declare v_sync_field64 varchar(10000);
    declare v_sync_field65 varchar(10000);
    declare v_sync_field66 varchar(10000);
    declare v_sync_field67 varchar(10000);
    declare v_sync_field68 varchar(10000);
    declare v_sync_field69 varchar(10000);
    declare v_sync_field70 varchar(10000);
    declare v_sync_field71 varchar(10000);
    declare v_sync_field72 varchar(10000);
    declare v_sync_field73 varchar(10000);
    declare v_sync_field74 varchar(10000);
    declare v_sync_field75 varchar(10000);
    declare v_sync_field76 varchar(10000);
    declare v_sync_field77 varchar(10000);
    declare v_sync_field78 varchar(10000);
    declare v_sync_field79 varchar(10000);
    declare v_sync_field80 varchar(10000);
    declare v_sync_field81 varchar(10000);
    declare v_sync_field82 varchar(10000);
    declare v_sync_field83 varchar(10000);
    declare v_sync_field84 varchar(10000);
    declare v_sync_field85 varchar(10000);
    declare v_sync_field86 varchar(10000);
    declare v_sync_field87 varchar(10000);
    declare v_sync_field88 varchar(10000);
    declare v_sync_field89 varchar(10000);
    declare v_sync_field90 varchar(10000);
    declare v_sync_field91 varchar(10000);
    declare v_sync_field92 varchar(10000);
    declare v_sync_field93 varchar(10000);
    declare v_sync_field94 varchar(10000);
    declare v_sync_field95 varchar(10000);
    declare v_sync_field96 varchar(10000);
    declare v_sync_field97 varchar(10000);
    declare v_sync_field98 varchar(10000);
    declare v_sync_field99 varchar(10000);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_ctrl_flag = p_ctrl_flag;
    SET v_update_date = p_update_date;
    SET v_update_time = p_update_time;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_sync_field14 = " ";
    SET v_sync_field15 = " ";
    SET v_sync_field16 = " ";
    SET v_sync_field17 = " ";
    SET v_sync_field18 = " ";
    SET v_sync_field19 = " ";
    SET v_sync_field20 = " ";
    SET v_sync_field21 = " ";
    SET v_sync_field22 = " ";
    SET v_sync_field23 = " ";
    SET v_sync_field24 = " ";
    SET v_sync_field25 = " ";
    SET v_sync_field26 = " ";
    SET v_sync_field27 = " ";
    SET v_sync_field28 = " ";
    SET v_sync_field29 = " ";
    SET v_sync_field30 = " ";
    SET v_sync_field31 = " ";
    SET v_sync_field32 = " ";
    SET v_sync_field33 = " ";
    SET v_sync_field34 = " ";
    SET v_sync_field35 = " ";
    SET v_sync_field36 = " ";
    SET v_sync_field37 = " ";
    SET v_sync_field38 = " ";
    SET v_sync_field39 = " ";
    SET v_sync_field40 = " ";
    SET v_sync_field41 = " ";
    SET v_sync_field42 = " ";
    SET v_sync_field43 = " ";
    SET v_sync_field44 = " ";
    SET v_sync_field45 = " ";
    SET v_sync_field46 = " ";
    SET v_sync_field47 = " ";
    SET v_sync_field48 = " ";
    SET v_sync_field49 = " ";
    SET v_sync_field50 = " ";
    SET v_sync_field51 = " ";
    SET v_sync_field52 = " ";
    SET v_sync_field53 = " ";
    SET v_sync_field54 = " ";
    SET v_sync_field55 = " ";
    SET v_sync_field56 = " ";
    SET v_sync_field57 = " ";
    SET v_sync_field58 = " ";
    SET v_sync_field59 = " ";
    SET v_sync_field60 = " ";
    SET v_sync_field61 = " ";
    SET v_sync_field62 = " ";
    SET v_sync_field63 = " ";
    SET v_sync_field64 = " ";
    SET v_sync_field65 = " ";
    SET v_sync_field66 = " ";
    SET v_sync_field67 = " ";
    SET v_sync_field68 = " ";
    SET v_sync_field69 = " ";
    SET v_sync_field70 = " ";
    SET v_sync_field71 = " ";
    SET v_sync_field72 = " ";
    SET v_sync_field73 = " ";
    SET v_sync_field74 = " ";
    SET v_sync_field75 = " ";
    SET v_sync_field76 = " ";
    SET v_sync_field77 = " ";
    SET v_sync_field78 = " ";
    SET v_sync_field79 = " ";
    SET v_sync_field80 = " ";
    SET v_sync_field81 = " ";
    SET v_sync_field82 = " ";
    SET v_sync_field83 = " ";
    SET v_sync_field84 = " ";
    SET v_sync_field85 = " ";
    SET v_sync_field86 = " ";
    SET v_sync_field87 = " ";
    SET v_sync_field88 = " ";
    SET v_sync_field89 = " ";
    SET v_sync_field90 = " ";
    SET v_sync_field91 = " ";
    SET v_sync_field92 = " ";
    SET v_sync_field93 = " ";
    SET v_sync_field94 = " ";
    SET v_sync_field95 = " ";
    SET v_sync_field96 = " ";
    SET v_sync_field97 = " ";
    SET v_sync_field98 = " ";
    SET v_sync_field99 = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_同步接口_同步交易组业务资金表】*/
    call db_tdfutu.pra_tdfusyn_Synctdfuac_exgp_busi_capit(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_row_count,
        v_ctrl_flag,
        v_update_date,
        v_update_time,
        v_error_code,
        v_error_info,
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
        v_sync_field13,
        v_sync_field14,
        v_sync_field15,
        v_sync_field16,
        v_sync_field17,
        v_sync_field18,
        v_sync_field19,
        v_sync_field20,
        v_sync_field21,
        v_sync_field22,
        v_sync_field23,
        v_sync_field24,
        v_sync_field25,
        v_sync_field26,
        v_sync_field27,
        v_sync_field28,
        v_sync_field29,
        v_sync_field30,
        v_sync_field31,
        v_sync_field32,
        v_sync_field33,
        v_sync_field34,
        v_sync_field35,
        v_sync_field36,
        v_sync_field37,
        v_sync_field38,
        v_sync_field39,
        v_sync_field40,
        v_sync_field41,
        v_sync_field42,
        v_sync_field43,
        v_sync_field44,
        v_sync_field45,
        v_sync_field46,
        v_sync_field47,
        v_sync_field48,
        v_sync_field49,
        v_sync_field50,
        v_sync_field51,
        v_sync_field52,
        v_sync_field53,
        v_sync_field54,
        v_sync_field55,
        v_sync_field56,
        v_sync_field57,
        v_sync_field58,
        v_sync_field59,
        v_sync_field60,
        v_sync_field61,
        v_sync_field62,
        v_sync_field63,
        v_sync_field64,
        v_sync_field65,
        v_sync_field66,
        v_sync_field67,
        v_sync_field68,
        v_sync_field69,
        v_sync_field70,
        v_sync_field71,
        v_sync_field72,
        v_sync_field73,
        v_sync_field74,
        v_sync_field75,
        v_sync_field76,
        v_sync_field77,
        v_sync_field78,
        v_sync_field79,
        v_sync_field80,
        v_sync_field81,
        v_sync_field82,
        v_sync_field83,
        v_sync_field84,
        v_sync_field85,
        v_sync_field86,
        v_sync_field87,
        v_sync_field88,
        v_sync_field89,
        v_sync_field90,
        v_sync_field91,
        v_sync_field92,
        v_sync_field93,
        v_sync_field94,
        v_sync_field95,
        v_sync_field96,
        v_sync_field97,
        v_sync_field98,
        v_sync_field99);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.15.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_同步接口_同步交易组业务资金表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_sync_field14 = v_sync_field14;
    SET p_sync_field15 = v_sync_field15;
    SET p_sync_field16 = v_sync_field16;
    SET p_sync_field17 = v_sync_field17;
    SET p_sync_field18 = v_sync_field18;
    SET p_sync_field19 = v_sync_field19;
    SET p_sync_field20 = v_sync_field20;
    SET p_sync_field21 = v_sync_field21;
    SET p_sync_field22 = v_sync_field22;
    SET p_sync_field23 = v_sync_field23;
    SET p_sync_field24 = v_sync_field24;
    SET p_sync_field25 = v_sync_field25;
    SET p_sync_field26 = v_sync_field26;
    SET p_sync_field27 = v_sync_field27;
    SET p_sync_field28 = v_sync_field28;
    SET p_sync_field29 = v_sync_field29;
    SET p_sync_field30 = v_sync_field30;
    SET p_sync_field31 = v_sync_field31;
    SET p_sync_field32 = v_sync_field32;
    SET p_sync_field33 = v_sync_field33;
    SET p_sync_field34 = v_sync_field34;
    SET p_sync_field35 = v_sync_field35;
    SET p_sync_field36 = v_sync_field36;
    SET p_sync_field37 = v_sync_field37;
    SET p_sync_field38 = v_sync_field38;
    SET p_sync_field39 = v_sync_field39;
    SET p_sync_field40 = v_sync_field40;
    SET p_sync_field41 = v_sync_field41;
    SET p_sync_field42 = v_sync_field42;
    SET p_sync_field43 = v_sync_field43;
    SET p_sync_field44 = v_sync_field44;
    SET p_sync_field45 = v_sync_field45;
    SET p_sync_field46 = v_sync_field46;
    SET p_sync_field47 = v_sync_field47;
    SET p_sync_field48 = v_sync_field48;
    SET p_sync_field49 = v_sync_field49;
    SET p_sync_field50 = v_sync_field50;
    SET p_sync_field51 = v_sync_field51;
    SET p_sync_field52 = v_sync_field52;
    SET p_sync_field53 = v_sync_field53;
    SET p_sync_field54 = v_sync_field54;
    SET p_sync_field55 = v_sync_field55;
    SET p_sync_field56 = v_sync_field56;
    SET p_sync_field57 = v_sync_field57;
    SET p_sync_field58 = v_sync_field58;
    SET p_sync_field59 = v_sync_field59;
    SET p_sync_field60 = v_sync_field60;
    SET p_sync_field61 = v_sync_field61;
    SET p_sync_field62 = v_sync_field62;
    SET p_sync_field63 = v_sync_field63;
    SET p_sync_field64 = v_sync_field64;
    SET p_sync_field65 = v_sync_field65;
    SET p_sync_field66 = v_sync_field66;
    SET p_sync_field67 = v_sync_field67;
    SET p_sync_field68 = v_sync_field68;
    SET p_sync_field69 = v_sync_field69;
    SET p_sync_field70 = v_sync_field70;
    SET p_sync_field71 = v_sync_field71;
    SET p_sync_field72 = v_sync_field72;
    SET p_sync_field73 = v_sync_field73;
    SET p_sync_field74 = v_sync_field74;
    SET p_sync_field75 = v_sync_field75;
    SET p_sync_field76 = v_sync_field76;
    SET p_sync_field77 = v_sync_field77;
    SET p_sync_field78 = v_sync_field78;
    SET p_sync_field79 = v_sync_field79;
    SET p_sync_field80 = v_sync_field80;
    SET p_sync_field81 = v_sync_field81;
    SET p_sync_field82 = v_sync_field82;
    SET p_sync_field83 = v_sync_field83;
    SET p_sync_field84 = v_sync_field84;
    SET p_sync_field85 = v_sync_field85;
    SET p_sync_field86 = v_sync_field86;
    SET p_sync_field87 = v_sync_field87;
    SET p_sync_field88 = v_sync_field88;
    SET p_sync_field89 = v_sync_field89;
    SET p_sync_field90 = v_sync_field90;
    SET p_sync_field91 = v_sync_field91;
    SET p_sync_field92 = v_sync_field92;
    SET p_sync_field93 = v_sync_field93;
    SET p_sync_field94 = v_sync_field94;
    SET p_sync_field95 = v_sync_field95;
    SET p_sync_field96 = v_sync_field96;
    SET p_sync_field97 = v_sync_field97;
    SET p_sync_field98 = v_sync_field98;
    SET p_sync_field99 = v_sync_field99;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_同步接口_同步资产账户业务资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfusyn_Synctdfuac_asac_busi_capit;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfusyn_Synctdfuac_asac_busi_capit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_ctrl_flag int,
    IN p_update_date int,
    IN p_update_time int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    OUT p_sync_field13 varchar(10000),
    OUT p_sync_field14 varchar(10000),
    OUT p_sync_field15 varchar(10000),
    OUT p_sync_field16 varchar(10000),
    OUT p_sync_field17 varchar(10000),
    OUT p_sync_field18 varchar(10000),
    OUT p_sync_field19 varchar(10000),
    OUT p_sync_field20 varchar(10000),
    OUT p_sync_field21 varchar(10000),
    OUT p_sync_field22 varchar(10000),
    OUT p_sync_field23 varchar(10000),
    OUT p_sync_field24 varchar(10000),
    OUT p_sync_field25 varchar(10000),
    OUT p_sync_field26 varchar(10000),
    OUT p_sync_field27 varchar(10000),
    OUT p_sync_field28 varchar(10000),
    OUT p_sync_field29 varchar(10000),
    OUT p_sync_field30 varchar(10000),
    OUT p_sync_field31 varchar(10000),
    OUT p_sync_field32 varchar(10000),
    OUT p_sync_field33 varchar(10000),
    OUT p_sync_field34 varchar(10000),
    OUT p_sync_field35 varchar(10000),
    OUT p_sync_field36 varchar(10000),
    OUT p_sync_field37 varchar(10000),
    OUT p_sync_field38 varchar(10000),
    OUT p_sync_field39 varchar(10000),
    OUT p_sync_field40 varchar(10000),
    OUT p_sync_field41 varchar(10000),
    OUT p_sync_field42 varchar(10000),
    OUT p_sync_field43 varchar(10000),
    OUT p_sync_field44 varchar(10000),
    OUT p_sync_field45 varchar(10000),
    OUT p_sync_field46 varchar(10000),
    OUT p_sync_field47 varchar(10000),
    OUT p_sync_field48 varchar(10000),
    OUT p_sync_field49 varchar(10000),
    OUT p_sync_field50 varchar(10000),
    OUT p_sync_field51 varchar(10000),
    OUT p_sync_field52 varchar(10000),
    OUT p_sync_field53 varchar(10000),
    OUT p_sync_field54 varchar(10000),
    OUT p_sync_field55 varchar(10000),
    OUT p_sync_field56 varchar(10000),
    OUT p_sync_field57 varchar(10000),
    OUT p_sync_field58 varchar(10000),
    OUT p_sync_field59 varchar(10000),
    OUT p_sync_field60 varchar(10000),
    OUT p_sync_field61 varchar(10000),
    OUT p_sync_field62 varchar(10000),
    OUT p_sync_field63 varchar(10000),
    OUT p_sync_field64 varchar(10000),
    OUT p_sync_field65 varchar(10000),
    OUT p_sync_field66 varchar(10000),
    OUT p_sync_field67 varchar(10000),
    OUT p_sync_field68 varchar(10000),
    OUT p_sync_field69 varchar(10000),
    OUT p_sync_field70 varchar(10000),
    OUT p_sync_field71 varchar(10000),
    OUT p_sync_field72 varchar(10000),
    OUT p_sync_field73 varchar(10000),
    OUT p_sync_field74 varchar(10000),
    OUT p_sync_field75 varchar(10000),
    OUT p_sync_field76 varchar(10000),
    OUT p_sync_field77 varchar(10000),
    OUT p_sync_field78 varchar(10000),
    OUT p_sync_field79 varchar(10000),
    OUT p_sync_field80 varchar(10000),
    OUT p_sync_field81 varchar(10000),
    OUT p_sync_field82 varchar(10000),
    OUT p_sync_field83 varchar(10000),
    OUT p_sync_field84 varchar(10000),
    OUT p_sync_field85 varchar(10000),
    OUT p_sync_field86 varchar(10000),
    OUT p_sync_field87 varchar(10000),
    OUT p_sync_field88 varchar(10000),
    OUT p_sync_field89 varchar(10000),
    OUT p_sync_field90 varchar(10000),
    OUT p_sync_field91 varchar(10000),
    OUT p_sync_field92 varchar(10000),
    OUT p_sync_field93 varchar(10000),
    OUT p_sync_field94 varchar(10000),
    OUT p_sync_field95 varchar(10000),
    OUT p_sync_field96 varchar(10000),
    OUT p_sync_field97 varchar(10000),
    OUT p_sync_field98 varchar(10000),
    OUT p_sync_field99 varchar(10000)
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
    declare v_ctrl_flag int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_sync_field14 varchar(10000);
    declare v_sync_field15 varchar(10000);
    declare v_sync_field16 varchar(10000);
    declare v_sync_field17 varchar(10000);
    declare v_sync_field18 varchar(10000);
    declare v_sync_field19 varchar(10000);
    declare v_sync_field20 varchar(10000);
    declare v_sync_field21 varchar(10000);
    declare v_sync_field22 varchar(10000);
    declare v_sync_field23 varchar(10000);
    declare v_sync_field24 varchar(10000);
    declare v_sync_field25 varchar(10000);
    declare v_sync_field26 varchar(10000);
    declare v_sync_field27 varchar(10000);
    declare v_sync_field28 varchar(10000);
    declare v_sync_field29 varchar(10000);
    declare v_sync_field30 varchar(10000);
    declare v_sync_field31 varchar(10000);
    declare v_sync_field32 varchar(10000);
    declare v_sync_field33 varchar(10000);
    declare v_sync_field34 varchar(10000);
    declare v_sync_field35 varchar(10000);
    declare v_sync_field36 varchar(10000);
    declare v_sync_field37 varchar(10000);
    declare v_sync_field38 varchar(10000);
    declare v_sync_field39 varchar(10000);
    declare v_sync_field40 varchar(10000);
    declare v_sync_field41 varchar(10000);
    declare v_sync_field42 varchar(10000);
    declare v_sync_field43 varchar(10000);
    declare v_sync_field44 varchar(10000);
    declare v_sync_field45 varchar(10000);
    declare v_sync_field46 varchar(10000);
    declare v_sync_field47 varchar(10000);
    declare v_sync_field48 varchar(10000);
    declare v_sync_field49 varchar(10000);
    declare v_sync_field50 varchar(10000);
    declare v_sync_field51 varchar(10000);
    declare v_sync_field52 varchar(10000);
    declare v_sync_field53 varchar(10000);
    declare v_sync_field54 varchar(10000);
    declare v_sync_field55 varchar(10000);
    declare v_sync_field56 varchar(10000);
    declare v_sync_field57 varchar(10000);
    declare v_sync_field58 varchar(10000);
    declare v_sync_field59 varchar(10000);
    declare v_sync_field60 varchar(10000);
    declare v_sync_field61 varchar(10000);
    declare v_sync_field62 varchar(10000);
    declare v_sync_field63 varchar(10000);
    declare v_sync_field64 varchar(10000);
    declare v_sync_field65 varchar(10000);
    declare v_sync_field66 varchar(10000);
    declare v_sync_field67 varchar(10000);
    declare v_sync_field68 varchar(10000);
    declare v_sync_field69 varchar(10000);
    declare v_sync_field70 varchar(10000);
    declare v_sync_field71 varchar(10000);
    declare v_sync_field72 varchar(10000);
    declare v_sync_field73 varchar(10000);
    declare v_sync_field74 varchar(10000);
    declare v_sync_field75 varchar(10000);
    declare v_sync_field76 varchar(10000);
    declare v_sync_field77 varchar(10000);
    declare v_sync_field78 varchar(10000);
    declare v_sync_field79 varchar(10000);
    declare v_sync_field80 varchar(10000);
    declare v_sync_field81 varchar(10000);
    declare v_sync_field82 varchar(10000);
    declare v_sync_field83 varchar(10000);
    declare v_sync_field84 varchar(10000);
    declare v_sync_field85 varchar(10000);
    declare v_sync_field86 varchar(10000);
    declare v_sync_field87 varchar(10000);
    declare v_sync_field88 varchar(10000);
    declare v_sync_field89 varchar(10000);
    declare v_sync_field90 varchar(10000);
    declare v_sync_field91 varchar(10000);
    declare v_sync_field92 varchar(10000);
    declare v_sync_field93 varchar(10000);
    declare v_sync_field94 varchar(10000);
    declare v_sync_field95 varchar(10000);
    declare v_sync_field96 varchar(10000);
    declare v_sync_field97 varchar(10000);
    declare v_sync_field98 varchar(10000);
    declare v_sync_field99 varchar(10000);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_ctrl_flag = p_ctrl_flag;
    SET v_update_date = p_update_date;
    SET v_update_time = p_update_time;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_sync_field14 = " ";
    SET v_sync_field15 = " ";
    SET v_sync_field16 = " ";
    SET v_sync_field17 = " ";
    SET v_sync_field18 = " ";
    SET v_sync_field19 = " ";
    SET v_sync_field20 = " ";
    SET v_sync_field21 = " ";
    SET v_sync_field22 = " ";
    SET v_sync_field23 = " ";
    SET v_sync_field24 = " ";
    SET v_sync_field25 = " ";
    SET v_sync_field26 = " ";
    SET v_sync_field27 = " ";
    SET v_sync_field28 = " ";
    SET v_sync_field29 = " ";
    SET v_sync_field30 = " ";
    SET v_sync_field31 = " ";
    SET v_sync_field32 = " ";
    SET v_sync_field33 = " ";
    SET v_sync_field34 = " ";
    SET v_sync_field35 = " ";
    SET v_sync_field36 = " ";
    SET v_sync_field37 = " ";
    SET v_sync_field38 = " ";
    SET v_sync_field39 = " ";
    SET v_sync_field40 = " ";
    SET v_sync_field41 = " ";
    SET v_sync_field42 = " ";
    SET v_sync_field43 = " ";
    SET v_sync_field44 = " ";
    SET v_sync_field45 = " ";
    SET v_sync_field46 = " ";
    SET v_sync_field47 = " ";
    SET v_sync_field48 = " ";
    SET v_sync_field49 = " ";
    SET v_sync_field50 = " ";
    SET v_sync_field51 = " ";
    SET v_sync_field52 = " ";
    SET v_sync_field53 = " ";
    SET v_sync_field54 = " ";
    SET v_sync_field55 = " ";
    SET v_sync_field56 = " ";
    SET v_sync_field57 = " ";
    SET v_sync_field58 = " ";
    SET v_sync_field59 = " ";
    SET v_sync_field60 = " ";
    SET v_sync_field61 = " ";
    SET v_sync_field62 = " ";
    SET v_sync_field63 = " ";
    SET v_sync_field64 = " ";
    SET v_sync_field65 = " ";
    SET v_sync_field66 = " ";
    SET v_sync_field67 = " ";
    SET v_sync_field68 = " ";
    SET v_sync_field69 = " ";
    SET v_sync_field70 = " ";
    SET v_sync_field71 = " ";
    SET v_sync_field72 = " ";
    SET v_sync_field73 = " ";
    SET v_sync_field74 = " ";
    SET v_sync_field75 = " ";
    SET v_sync_field76 = " ";
    SET v_sync_field77 = " ";
    SET v_sync_field78 = " ";
    SET v_sync_field79 = " ";
    SET v_sync_field80 = " ";
    SET v_sync_field81 = " ";
    SET v_sync_field82 = " ";
    SET v_sync_field83 = " ";
    SET v_sync_field84 = " ";
    SET v_sync_field85 = " ";
    SET v_sync_field86 = " ";
    SET v_sync_field87 = " ";
    SET v_sync_field88 = " ";
    SET v_sync_field89 = " ";
    SET v_sync_field90 = " ";
    SET v_sync_field91 = " ";
    SET v_sync_field92 = " ";
    SET v_sync_field93 = " ";
    SET v_sync_field94 = " ";
    SET v_sync_field95 = " ";
    SET v_sync_field96 = " ";
    SET v_sync_field97 = " ";
    SET v_sync_field98 = " ";
    SET v_sync_field99 = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_同步接口_同步资产账户业务资金表】*/
    call db_tdfutu.pra_tdfusyn_Synctdfuac_asac_busi_capit(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_row_count,
        v_ctrl_flag,
        v_update_date,
        v_update_time,
        v_error_code,
        v_error_info,
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
        v_sync_field13,
        v_sync_field14,
        v_sync_field15,
        v_sync_field16,
        v_sync_field17,
        v_sync_field18,
        v_sync_field19,
        v_sync_field20,
        v_sync_field21,
        v_sync_field22,
        v_sync_field23,
        v_sync_field24,
        v_sync_field25,
        v_sync_field26,
        v_sync_field27,
        v_sync_field28,
        v_sync_field29,
        v_sync_field30,
        v_sync_field31,
        v_sync_field32,
        v_sync_field33,
        v_sync_field34,
        v_sync_field35,
        v_sync_field36,
        v_sync_field37,
        v_sync_field38,
        v_sync_field39,
        v_sync_field40,
        v_sync_field41,
        v_sync_field42,
        v_sync_field43,
        v_sync_field44,
        v_sync_field45,
        v_sync_field46,
        v_sync_field47,
        v_sync_field48,
        v_sync_field49,
        v_sync_field50,
        v_sync_field51,
        v_sync_field52,
        v_sync_field53,
        v_sync_field54,
        v_sync_field55,
        v_sync_field56,
        v_sync_field57,
        v_sync_field58,
        v_sync_field59,
        v_sync_field60,
        v_sync_field61,
        v_sync_field62,
        v_sync_field63,
        v_sync_field64,
        v_sync_field65,
        v_sync_field66,
        v_sync_field67,
        v_sync_field68,
        v_sync_field69,
        v_sync_field70,
        v_sync_field71,
        v_sync_field72,
        v_sync_field73,
        v_sync_field74,
        v_sync_field75,
        v_sync_field76,
        v_sync_field77,
        v_sync_field78,
        v_sync_field79,
        v_sync_field80,
        v_sync_field81,
        v_sync_field82,
        v_sync_field83,
        v_sync_field84,
        v_sync_field85,
        v_sync_field86,
        v_sync_field87,
        v_sync_field88,
        v_sync_field89,
        v_sync_field90,
        v_sync_field91,
        v_sync_field92,
        v_sync_field93,
        v_sync_field94,
        v_sync_field95,
        v_sync_field96,
        v_sync_field97,
        v_sync_field98,
        v_sync_field99);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.15.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_同步接口_同步资产账户业务资金表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_sync_field14 = v_sync_field14;
    SET p_sync_field15 = v_sync_field15;
    SET p_sync_field16 = v_sync_field16;
    SET p_sync_field17 = v_sync_field17;
    SET p_sync_field18 = v_sync_field18;
    SET p_sync_field19 = v_sync_field19;
    SET p_sync_field20 = v_sync_field20;
    SET p_sync_field21 = v_sync_field21;
    SET p_sync_field22 = v_sync_field22;
    SET p_sync_field23 = v_sync_field23;
    SET p_sync_field24 = v_sync_field24;
    SET p_sync_field25 = v_sync_field25;
    SET p_sync_field26 = v_sync_field26;
    SET p_sync_field27 = v_sync_field27;
    SET p_sync_field28 = v_sync_field28;
    SET p_sync_field29 = v_sync_field29;
    SET p_sync_field30 = v_sync_field30;
    SET p_sync_field31 = v_sync_field31;
    SET p_sync_field32 = v_sync_field32;
    SET p_sync_field33 = v_sync_field33;
    SET p_sync_field34 = v_sync_field34;
    SET p_sync_field35 = v_sync_field35;
    SET p_sync_field36 = v_sync_field36;
    SET p_sync_field37 = v_sync_field37;
    SET p_sync_field38 = v_sync_field38;
    SET p_sync_field39 = v_sync_field39;
    SET p_sync_field40 = v_sync_field40;
    SET p_sync_field41 = v_sync_field41;
    SET p_sync_field42 = v_sync_field42;
    SET p_sync_field43 = v_sync_field43;
    SET p_sync_field44 = v_sync_field44;
    SET p_sync_field45 = v_sync_field45;
    SET p_sync_field46 = v_sync_field46;
    SET p_sync_field47 = v_sync_field47;
    SET p_sync_field48 = v_sync_field48;
    SET p_sync_field49 = v_sync_field49;
    SET p_sync_field50 = v_sync_field50;
    SET p_sync_field51 = v_sync_field51;
    SET p_sync_field52 = v_sync_field52;
    SET p_sync_field53 = v_sync_field53;
    SET p_sync_field54 = v_sync_field54;
    SET p_sync_field55 = v_sync_field55;
    SET p_sync_field56 = v_sync_field56;
    SET p_sync_field57 = v_sync_field57;
    SET p_sync_field58 = v_sync_field58;
    SET p_sync_field59 = v_sync_field59;
    SET p_sync_field60 = v_sync_field60;
    SET p_sync_field61 = v_sync_field61;
    SET p_sync_field62 = v_sync_field62;
    SET p_sync_field63 = v_sync_field63;
    SET p_sync_field64 = v_sync_field64;
    SET p_sync_field65 = v_sync_field65;
    SET p_sync_field66 = v_sync_field66;
    SET p_sync_field67 = v_sync_field67;
    SET p_sync_field68 = v_sync_field68;
    SET p_sync_field69 = v_sync_field69;
    SET p_sync_field70 = v_sync_field70;
    SET p_sync_field71 = v_sync_field71;
    SET p_sync_field72 = v_sync_field72;
    SET p_sync_field73 = v_sync_field73;
    SET p_sync_field74 = v_sync_field74;
    SET p_sync_field75 = v_sync_field75;
    SET p_sync_field76 = v_sync_field76;
    SET p_sync_field77 = v_sync_field77;
    SET p_sync_field78 = v_sync_field78;
    SET p_sync_field79 = v_sync_field79;
    SET p_sync_field80 = v_sync_field80;
    SET p_sync_field81 = v_sync_field81;
    SET p_sync_field82 = v_sync_field82;
    SET p_sync_field83 = v_sync_field83;
    SET p_sync_field84 = v_sync_field84;
    SET p_sync_field85 = v_sync_field85;
    SET p_sync_field86 = v_sync_field86;
    SET p_sync_field87 = v_sync_field87;
    SET p_sync_field88 = v_sync_field88;
    SET p_sync_field89 = v_sync_field89;
    SET p_sync_field90 = v_sync_field90;
    SET p_sync_field91 = v_sync_field91;
    SET p_sync_field92 = v_sync_field92;
    SET p_sync_field93 = v_sync_field93;
    SET p_sync_field94 = v_sync_field94;
    SET p_sync_field95 = v_sync_field95;
    SET p_sync_field96 = v_sync_field96;
    SET p_sync_field97 = v_sync_field97;
    SET p_sync_field98 = v_sync_field98;
    SET p_sync_field99 = v_sync_field99;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_同步接口_同步交易组业务持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfusyn_Synctdfuac_exgp_busi_posi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfusyn_Synctdfuac_exgp_busi_posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_ctrl_flag int,
    IN p_update_date int,
    IN p_update_time int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    OUT p_sync_field13 varchar(10000),
    OUT p_sync_field14 varchar(10000),
    OUT p_sync_field15 varchar(10000),
    OUT p_sync_field16 varchar(10000),
    OUT p_sync_field17 varchar(10000),
    OUT p_sync_field18 varchar(10000),
    OUT p_sync_field19 varchar(10000),
    OUT p_sync_field20 varchar(10000),
    OUT p_sync_field21 varchar(10000),
    OUT p_sync_field22 varchar(10000),
    OUT p_sync_field23 varchar(10000),
    OUT p_sync_field24 varchar(10000),
    OUT p_sync_field25 varchar(10000),
    OUT p_sync_field26 varchar(10000),
    OUT p_sync_field27 varchar(10000),
    OUT p_sync_field28 varchar(10000),
    OUT p_sync_field29 varchar(10000),
    OUT p_sync_field30 varchar(10000),
    OUT p_sync_field31 varchar(10000),
    OUT p_sync_field32 varchar(10000),
    OUT p_sync_field33 varchar(10000),
    OUT p_sync_field34 varchar(10000),
    OUT p_sync_field35 varchar(10000),
    OUT p_sync_field36 varchar(10000),
    OUT p_sync_field37 varchar(10000),
    OUT p_sync_field38 varchar(10000),
    OUT p_sync_field39 varchar(10000),
    OUT p_sync_field40 varchar(10000),
    OUT p_sync_field41 varchar(10000),
    OUT p_sync_field42 varchar(10000),
    OUT p_sync_field43 varchar(10000),
    OUT p_sync_field44 varchar(10000),
    OUT p_sync_field45 varchar(10000),
    OUT p_sync_field46 varchar(10000),
    OUT p_sync_field47 varchar(10000),
    OUT p_sync_field48 varchar(10000),
    OUT p_sync_field49 varchar(10000),
    OUT p_sync_field50 varchar(10000),
    OUT p_sync_field51 varchar(10000),
    OUT p_sync_field52 varchar(10000),
    OUT p_sync_field53 varchar(10000),
    OUT p_sync_field54 varchar(10000),
    OUT p_sync_field55 varchar(10000),
    OUT p_sync_field56 varchar(10000),
    OUT p_sync_field57 varchar(10000),
    OUT p_sync_field58 varchar(10000),
    OUT p_sync_field59 varchar(10000),
    OUT p_sync_field60 varchar(10000),
    OUT p_sync_field61 varchar(10000),
    OUT p_sync_field62 varchar(10000),
    OUT p_sync_field63 varchar(10000),
    OUT p_sync_field64 varchar(10000),
    OUT p_sync_field65 varchar(10000),
    OUT p_sync_field66 varchar(10000),
    OUT p_sync_field67 varchar(10000),
    OUT p_sync_field68 varchar(10000),
    OUT p_sync_field69 varchar(10000),
    OUT p_sync_field70 varchar(10000),
    OUT p_sync_field71 varchar(10000),
    OUT p_sync_field72 varchar(10000),
    OUT p_sync_field73 varchar(10000),
    OUT p_sync_field74 varchar(10000),
    OUT p_sync_field75 varchar(10000),
    OUT p_sync_field76 varchar(10000),
    OUT p_sync_field77 varchar(10000),
    OUT p_sync_field78 varchar(10000),
    OUT p_sync_field79 varchar(10000),
    OUT p_sync_field80 varchar(10000),
    OUT p_sync_field81 varchar(10000),
    OUT p_sync_field82 varchar(10000),
    OUT p_sync_field83 varchar(10000),
    OUT p_sync_field84 varchar(10000),
    OUT p_sync_field85 varchar(10000),
    OUT p_sync_field86 varchar(10000),
    OUT p_sync_field87 varchar(10000),
    OUT p_sync_field88 varchar(10000),
    OUT p_sync_field89 varchar(10000),
    OUT p_sync_field90 varchar(10000),
    OUT p_sync_field91 varchar(10000),
    OUT p_sync_field92 varchar(10000),
    OUT p_sync_field93 varchar(10000),
    OUT p_sync_field94 varchar(10000),
    OUT p_sync_field95 varchar(10000),
    OUT p_sync_field96 varchar(10000),
    OUT p_sync_field97 varchar(10000),
    OUT p_sync_field98 varchar(10000),
    OUT p_sync_field99 varchar(10000)
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
    declare v_ctrl_flag int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_sync_field14 varchar(10000);
    declare v_sync_field15 varchar(10000);
    declare v_sync_field16 varchar(10000);
    declare v_sync_field17 varchar(10000);
    declare v_sync_field18 varchar(10000);
    declare v_sync_field19 varchar(10000);
    declare v_sync_field20 varchar(10000);
    declare v_sync_field21 varchar(10000);
    declare v_sync_field22 varchar(10000);
    declare v_sync_field23 varchar(10000);
    declare v_sync_field24 varchar(10000);
    declare v_sync_field25 varchar(10000);
    declare v_sync_field26 varchar(10000);
    declare v_sync_field27 varchar(10000);
    declare v_sync_field28 varchar(10000);
    declare v_sync_field29 varchar(10000);
    declare v_sync_field30 varchar(10000);
    declare v_sync_field31 varchar(10000);
    declare v_sync_field32 varchar(10000);
    declare v_sync_field33 varchar(10000);
    declare v_sync_field34 varchar(10000);
    declare v_sync_field35 varchar(10000);
    declare v_sync_field36 varchar(10000);
    declare v_sync_field37 varchar(10000);
    declare v_sync_field38 varchar(10000);
    declare v_sync_field39 varchar(10000);
    declare v_sync_field40 varchar(10000);
    declare v_sync_field41 varchar(10000);
    declare v_sync_field42 varchar(10000);
    declare v_sync_field43 varchar(10000);
    declare v_sync_field44 varchar(10000);
    declare v_sync_field45 varchar(10000);
    declare v_sync_field46 varchar(10000);
    declare v_sync_field47 varchar(10000);
    declare v_sync_field48 varchar(10000);
    declare v_sync_field49 varchar(10000);
    declare v_sync_field50 varchar(10000);
    declare v_sync_field51 varchar(10000);
    declare v_sync_field52 varchar(10000);
    declare v_sync_field53 varchar(10000);
    declare v_sync_field54 varchar(10000);
    declare v_sync_field55 varchar(10000);
    declare v_sync_field56 varchar(10000);
    declare v_sync_field57 varchar(10000);
    declare v_sync_field58 varchar(10000);
    declare v_sync_field59 varchar(10000);
    declare v_sync_field60 varchar(10000);
    declare v_sync_field61 varchar(10000);
    declare v_sync_field62 varchar(10000);
    declare v_sync_field63 varchar(10000);
    declare v_sync_field64 varchar(10000);
    declare v_sync_field65 varchar(10000);
    declare v_sync_field66 varchar(10000);
    declare v_sync_field67 varchar(10000);
    declare v_sync_field68 varchar(10000);
    declare v_sync_field69 varchar(10000);
    declare v_sync_field70 varchar(10000);
    declare v_sync_field71 varchar(10000);
    declare v_sync_field72 varchar(10000);
    declare v_sync_field73 varchar(10000);
    declare v_sync_field74 varchar(10000);
    declare v_sync_field75 varchar(10000);
    declare v_sync_field76 varchar(10000);
    declare v_sync_field77 varchar(10000);
    declare v_sync_field78 varchar(10000);
    declare v_sync_field79 varchar(10000);
    declare v_sync_field80 varchar(10000);
    declare v_sync_field81 varchar(10000);
    declare v_sync_field82 varchar(10000);
    declare v_sync_field83 varchar(10000);
    declare v_sync_field84 varchar(10000);
    declare v_sync_field85 varchar(10000);
    declare v_sync_field86 varchar(10000);
    declare v_sync_field87 varchar(10000);
    declare v_sync_field88 varchar(10000);
    declare v_sync_field89 varchar(10000);
    declare v_sync_field90 varchar(10000);
    declare v_sync_field91 varchar(10000);
    declare v_sync_field92 varchar(10000);
    declare v_sync_field93 varchar(10000);
    declare v_sync_field94 varchar(10000);
    declare v_sync_field95 varchar(10000);
    declare v_sync_field96 varchar(10000);
    declare v_sync_field97 varchar(10000);
    declare v_sync_field98 varchar(10000);
    declare v_sync_field99 varchar(10000);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_ctrl_flag = p_ctrl_flag;
    SET v_update_date = p_update_date;
    SET v_update_time = p_update_time;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_sync_field14 = " ";
    SET v_sync_field15 = " ";
    SET v_sync_field16 = " ";
    SET v_sync_field17 = " ";
    SET v_sync_field18 = " ";
    SET v_sync_field19 = " ";
    SET v_sync_field20 = " ";
    SET v_sync_field21 = " ";
    SET v_sync_field22 = " ";
    SET v_sync_field23 = " ";
    SET v_sync_field24 = " ";
    SET v_sync_field25 = " ";
    SET v_sync_field26 = " ";
    SET v_sync_field27 = " ";
    SET v_sync_field28 = " ";
    SET v_sync_field29 = " ";
    SET v_sync_field30 = " ";
    SET v_sync_field31 = " ";
    SET v_sync_field32 = " ";
    SET v_sync_field33 = " ";
    SET v_sync_field34 = " ";
    SET v_sync_field35 = " ";
    SET v_sync_field36 = " ";
    SET v_sync_field37 = " ";
    SET v_sync_field38 = " ";
    SET v_sync_field39 = " ";
    SET v_sync_field40 = " ";
    SET v_sync_field41 = " ";
    SET v_sync_field42 = " ";
    SET v_sync_field43 = " ";
    SET v_sync_field44 = " ";
    SET v_sync_field45 = " ";
    SET v_sync_field46 = " ";
    SET v_sync_field47 = " ";
    SET v_sync_field48 = " ";
    SET v_sync_field49 = " ";
    SET v_sync_field50 = " ";
    SET v_sync_field51 = " ";
    SET v_sync_field52 = " ";
    SET v_sync_field53 = " ";
    SET v_sync_field54 = " ";
    SET v_sync_field55 = " ";
    SET v_sync_field56 = " ";
    SET v_sync_field57 = " ";
    SET v_sync_field58 = " ";
    SET v_sync_field59 = " ";
    SET v_sync_field60 = " ";
    SET v_sync_field61 = " ";
    SET v_sync_field62 = " ";
    SET v_sync_field63 = " ";
    SET v_sync_field64 = " ";
    SET v_sync_field65 = " ";
    SET v_sync_field66 = " ";
    SET v_sync_field67 = " ";
    SET v_sync_field68 = " ";
    SET v_sync_field69 = " ";
    SET v_sync_field70 = " ";
    SET v_sync_field71 = " ";
    SET v_sync_field72 = " ";
    SET v_sync_field73 = " ";
    SET v_sync_field74 = " ";
    SET v_sync_field75 = " ";
    SET v_sync_field76 = " ";
    SET v_sync_field77 = " ";
    SET v_sync_field78 = " ";
    SET v_sync_field79 = " ";
    SET v_sync_field80 = " ";
    SET v_sync_field81 = " ";
    SET v_sync_field82 = " ";
    SET v_sync_field83 = " ";
    SET v_sync_field84 = " ";
    SET v_sync_field85 = " ";
    SET v_sync_field86 = " ";
    SET v_sync_field87 = " ";
    SET v_sync_field88 = " ";
    SET v_sync_field89 = " ";
    SET v_sync_field90 = " ";
    SET v_sync_field91 = " ";
    SET v_sync_field92 = " ";
    SET v_sync_field93 = " ";
    SET v_sync_field94 = " ";
    SET v_sync_field95 = " ";
    SET v_sync_field96 = " ";
    SET v_sync_field97 = " ";
    SET v_sync_field98 = " ";
    SET v_sync_field99 = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_同步接口_同步交易组业务持仓表】*/
    call db_tdfutu.pra_tdfusyn_Synctdfuac_exgp_busi_posi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_row_count,
        v_ctrl_flag,
        v_update_date,
        v_update_time,
        v_error_code,
        v_error_info,
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
        v_sync_field13,
        v_sync_field14,
        v_sync_field15,
        v_sync_field16,
        v_sync_field17,
        v_sync_field18,
        v_sync_field19,
        v_sync_field20,
        v_sync_field21,
        v_sync_field22,
        v_sync_field23,
        v_sync_field24,
        v_sync_field25,
        v_sync_field26,
        v_sync_field27,
        v_sync_field28,
        v_sync_field29,
        v_sync_field30,
        v_sync_field31,
        v_sync_field32,
        v_sync_field33,
        v_sync_field34,
        v_sync_field35,
        v_sync_field36,
        v_sync_field37,
        v_sync_field38,
        v_sync_field39,
        v_sync_field40,
        v_sync_field41,
        v_sync_field42,
        v_sync_field43,
        v_sync_field44,
        v_sync_field45,
        v_sync_field46,
        v_sync_field47,
        v_sync_field48,
        v_sync_field49,
        v_sync_field50,
        v_sync_field51,
        v_sync_field52,
        v_sync_field53,
        v_sync_field54,
        v_sync_field55,
        v_sync_field56,
        v_sync_field57,
        v_sync_field58,
        v_sync_field59,
        v_sync_field60,
        v_sync_field61,
        v_sync_field62,
        v_sync_field63,
        v_sync_field64,
        v_sync_field65,
        v_sync_field66,
        v_sync_field67,
        v_sync_field68,
        v_sync_field69,
        v_sync_field70,
        v_sync_field71,
        v_sync_field72,
        v_sync_field73,
        v_sync_field74,
        v_sync_field75,
        v_sync_field76,
        v_sync_field77,
        v_sync_field78,
        v_sync_field79,
        v_sync_field80,
        v_sync_field81,
        v_sync_field82,
        v_sync_field83,
        v_sync_field84,
        v_sync_field85,
        v_sync_field86,
        v_sync_field87,
        v_sync_field88,
        v_sync_field89,
        v_sync_field90,
        v_sync_field91,
        v_sync_field92,
        v_sync_field93,
        v_sync_field94,
        v_sync_field95,
        v_sync_field96,
        v_sync_field97,
        v_sync_field98,
        v_sync_field99);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.15.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_同步接口_同步交易组业务持仓表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_sync_field14 = v_sync_field14;
    SET p_sync_field15 = v_sync_field15;
    SET p_sync_field16 = v_sync_field16;
    SET p_sync_field17 = v_sync_field17;
    SET p_sync_field18 = v_sync_field18;
    SET p_sync_field19 = v_sync_field19;
    SET p_sync_field20 = v_sync_field20;
    SET p_sync_field21 = v_sync_field21;
    SET p_sync_field22 = v_sync_field22;
    SET p_sync_field23 = v_sync_field23;
    SET p_sync_field24 = v_sync_field24;
    SET p_sync_field25 = v_sync_field25;
    SET p_sync_field26 = v_sync_field26;
    SET p_sync_field27 = v_sync_field27;
    SET p_sync_field28 = v_sync_field28;
    SET p_sync_field29 = v_sync_field29;
    SET p_sync_field30 = v_sync_field30;
    SET p_sync_field31 = v_sync_field31;
    SET p_sync_field32 = v_sync_field32;
    SET p_sync_field33 = v_sync_field33;
    SET p_sync_field34 = v_sync_field34;
    SET p_sync_field35 = v_sync_field35;
    SET p_sync_field36 = v_sync_field36;
    SET p_sync_field37 = v_sync_field37;
    SET p_sync_field38 = v_sync_field38;
    SET p_sync_field39 = v_sync_field39;
    SET p_sync_field40 = v_sync_field40;
    SET p_sync_field41 = v_sync_field41;
    SET p_sync_field42 = v_sync_field42;
    SET p_sync_field43 = v_sync_field43;
    SET p_sync_field44 = v_sync_field44;
    SET p_sync_field45 = v_sync_field45;
    SET p_sync_field46 = v_sync_field46;
    SET p_sync_field47 = v_sync_field47;
    SET p_sync_field48 = v_sync_field48;
    SET p_sync_field49 = v_sync_field49;
    SET p_sync_field50 = v_sync_field50;
    SET p_sync_field51 = v_sync_field51;
    SET p_sync_field52 = v_sync_field52;
    SET p_sync_field53 = v_sync_field53;
    SET p_sync_field54 = v_sync_field54;
    SET p_sync_field55 = v_sync_field55;
    SET p_sync_field56 = v_sync_field56;
    SET p_sync_field57 = v_sync_field57;
    SET p_sync_field58 = v_sync_field58;
    SET p_sync_field59 = v_sync_field59;
    SET p_sync_field60 = v_sync_field60;
    SET p_sync_field61 = v_sync_field61;
    SET p_sync_field62 = v_sync_field62;
    SET p_sync_field63 = v_sync_field63;
    SET p_sync_field64 = v_sync_field64;
    SET p_sync_field65 = v_sync_field65;
    SET p_sync_field66 = v_sync_field66;
    SET p_sync_field67 = v_sync_field67;
    SET p_sync_field68 = v_sync_field68;
    SET p_sync_field69 = v_sync_field69;
    SET p_sync_field70 = v_sync_field70;
    SET p_sync_field71 = v_sync_field71;
    SET p_sync_field72 = v_sync_field72;
    SET p_sync_field73 = v_sync_field73;
    SET p_sync_field74 = v_sync_field74;
    SET p_sync_field75 = v_sync_field75;
    SET p_sync_field76 = v_sync_field76;
    SET p_sync_field77 = v_sync_field77;
    SET p_sync_field78 = v_sync_field78;
    SET p_sync_field79 = v_sync_field79;
    SET p_sync_field80 = v_sync_field80;
    SET p_sync_field81 = v_sync_field81;
    SET p_sync_field82 = v_sync_field82;
    SET p_sync_field83 = v_sync_field83;
    SET p_sync_field84 = v_sync_field84;
    SET p_sync_field85 = v_sync_field85;
    SET p_sync_field86 = v_sync_field86;
    SET p_sync_field87 = v_sync_field87;
    SET p_sync_field88 = v_sync_field88;
    SET p_sync_field89 = v_sync_field89;
    SET p_sync_field90 = v_sync_field90;
    SET p_sync_field91 = v_sync_field91;
    SET p_sync_field92 = v_sync_field92;
    SET p_sync_field93 = v_sync_field93;
    SET p_sync_field94 = v_sync_field94;
    SET p_sync_field95 = v_sync_field95;
    SET p_sync_field96 = v_sync_field96;
    SET p_sync_field97 = v_sync_field97;
    SET p_sync_field98 = v_sync_field98;
    SET p_sync_field99 = v_sync_field99;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_同步接口_同步资产账户业务持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfusyn_Synctdfuac_asac_busi_posi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfusyn_Synctdfuac_asac_busi_posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_ctrl_flag int,
    IN p_update_date int,
    IN p_update_time int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    OUT p_sync_field13 varchar(10000),
    OUT p_sync_field14 varchar(10000),
    OUT p_sync_field15 varchar(10000),
    OUT p_sync_field16 varchar(10000),
    OUT p_sync_field17 varchar(10000),
    OUT p_sync_field18 varchar(10000),
    OUT p_sync_field19 varchar(10000),
    OUT p_sync_field20 varchar(10000),
    OUT p_sync_field21 varchar(10000),
    OUT p_sync_field22 varchar(10000),
    OUT p_sync_field23 varchar(10000),
    OUT p_sync_field24 varchar(10000),
    OUT p_sync_field25 varchar(10000),
    OUT p_sync_field26 varchar(10000),
    OUT p_sync_field27 varchar(10000),
    OUT p_sync_field28 varchar(10000),
    OUT p_sync_field29 varchar(10000),
    OUT p_sync_field30 varchar(10000),
    OUT p_sync_field31 varchar(10000),
    OUT p_sync_field32 varchar(10000),
    OUT p_sync_field33 varchar(10000),
    OUT p_sync_field34 varchar(10000),
    OUT p_sync_field35 varchar(10000),
    OUT p_sync_field36 varchar(10000),
    OUT p_sync_field37 varchar(10000),
    OUT p_sync_field38 varchar(10000),
    OUT p_sync_field39 varchar(10000),
    OUT p_sync_field40 varchar(10000),
    OUT p_sync_field41 varchar(10000),
    OUT p_sync_field42 varchar(10000),
    OUT p_sync_field43 varchar(10000),
    OUT p_sync_field44 varchar(10000),
    OUT p_sync_field45 varchar(10000),
    OUT p_sync_field46 varchar(10000),
    OUT p_sync_field47 varchar(10000),
    OUT p_sync_field48 varchar(10000),
    OUT p_sync_field49 varchar(10000),
    OUT p_sync_field50 varchar(10000),
    OUT p_sync_field51 varchar(10000),
    OUT p_sync_field52 varchar(10000),
    OUT p_sync_field53 varchar(10000),
    OUT p_sync_field54 varchar(10000),
    OUT p_sync_field55 varchar(10000),
    OUT p_sync_field56 varchar(10000),
    OUT p_sync_field57 varchar(10000),
    OUT p_sync_field58 varchar(10000),
    OUT p_sync_field59 varchar(10000),
    OUT p_sync_field60 varchar(10000),
    OUT p_sync_field61 varchar(10000),
    OUT p_sync_field62 varchar(10000),
    OUT p_sync_field63 varchar(10000),
    OUT p_sync_field64 varchar(10000),
    OUT p_sync_field65 varchar(10000),
    OUT p_sync_field66 varchar(10000),
    OUT p_sync_field67 varchar(10000),
    OUT p_sync_field68 varchar(10000),
    OUT p_sync_field69 varchar(10000),
    OUT p_sync_field70 varchar(10000),
    OUT p_sync_field71 varchar(10000),
    OUT p_sync_field72 varchar(10000),
    OUT p_sync_field73 varchar(10000),
    OUT p_sync_field74 varchar(10000),
    OUT p_sync_field75 varchar(10000),
    OUT p_sync_field76 varchar(10000),
    OUT p_sync_field77 varchar(10000),
    OUT p_sync_field78 varchar(10000),
    OUT p_sync_field79 varchar(10000),
    OUT p_sync_field80 varchar(10000),
    OUT p_sync_field81 varchar(10000),
    OUT p_sync_field82 varchar(10000),
    OUT p_sync_field83 varchar(10000),
    OUT p_sync_field84 varchar(10000),
    OUT p_sync_field85 varchar(10000),
    OUT p_sync_field86 varchar(10000),
    OUT p_sync_field87 varchar(10000),
    OUT p_sync_field88 varchar(10000),
    OUT p_sync_field89 varchar(10000),
    OUT p_sync_field90 varchar(10000),
    OUT p_sync_field91 varchar(10000),
    OUT p_sync_field92 varchar(10000),
    OUT p_sync_field93 varchar(10000),
    OUT p_sync_field94 varchar(10000),
    OUT p_sync_field95 varchar(10000),
    OUT p_sync_field96 varchar(10000),
    OUT p_sync_field97 varchar(10000),
    OUT p_sync_field98 varchar(10000),
    OUT p_sync_field99 varchar(10000)
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
    declare v_ctrl_flag int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_sync_field14 varchar(10000);
    declare v_sync_field15 varchar(10000);
    declare v_sync_field16 varchar(10000);
    declare v_sync_field17 varchar(10000);
    declare v_sync_field18 varchar(10000);
    declare v_sync_field19 varchar(10000);
    declare v_sync_field20 varchar(10000);
    declare v_sync_field21 varchar(10000);
    declare v_sync_field22 varchar(10000);
    declare v_sync_field23 varchar(10000);
    declare v_sync_field24 varchar(10000);
    declare v_sync_field25 varchar(10000);
    declare v_sync_field26 varchar(10000);
    declare v_sync_field27 varchar(10000);
    declare v_sync_field28 varchar(10000);
    declare v_sync_field29 varchar(10000);
    declare v_sync_field30 varchar(10000);
    declare v_sync_field31 varchar(10000);
    declare v_sync_field32 varchar(10000);
    declare v_sync_field33 varchar(10000);
    declare v_sync_field34 varchar(10000);
    declare v_sync_field35 varchar(10000);
    declare v_sync_field36 varchar(10000);
    declare v_sync_field37 varchar(10000);
    declare v_sync_field38 varchar(10000);
    declare v_sync_field39 varchar(10000);
    declare v_sync_field40 varchar(10000);
    declare v_sync_field41 varchar(10000);
    declare v_sync_field42 varchar(10000);
    declare v_sync_field43 varchar(10000);
    declare v_sync_field44 varchar(10000);
    declare v_sync_field45 varchar(10000);
    declare v_sync_field46 varchar(10000);
    declare v_sync_field47 varchar(10000);
    declare v_sync_field48 varchar(10000);
    declare v_sync_field49 varchar(10000);
    declare v_sync_field50 varchar(10000);
    declare v_sync_field51 varchar(10000);
    declare v_sync_field52 varchar(10000);
    declare v_sync_field53 varchar(10000);
    declare v_sync_field54 varchar(10000);
    declare v_sync_field55 varchar(10000);
    declare v_sync_field56 varchar(10000);
    declare v_sync_field57 varchar(10000);
    declare v_sync_field58 varchar(10000);
    declare v_sync_field59 varchar(10000);
    declare v_sync_field60 varchar(10000);
    declare v_sync_field61 varchar(10000);
    declare v_sync_field62 varchar(10000);
    declare v_sync_field63 varchar(10000);
    declare v_sync_field64 varchar(10000);
    declare v_sync_field65 varchar(10000);
    declare v_sync_field66 varchar(10000);
    declare v_sync_field67 varchar(10000);
    declare v_sync_field68 varchar(10000);
    declare v_sync_field69 varchar(10000);
    declare v_sync_field70 varchar(10000);
    declare v_sync_field71 varchar(10000);
    declare v_sync_field72 varchar(10000);
    declare v_sync_field73 varchar(10000);
    declare v_sync_field74 varchar(10000);
    declare v_sync_field75 varchar(10000);
    declare v_sync_field76 varchar(10000);
    declare v_sync_field77 varchar(10000);
    declare v_sync_field78 varchar(10000);
    declare v_sync_field79 varchar(10000);
    declare v_sync_field80 varchar(10000);
    declare v_sync_field81 varchar(10000);
    declare v_sync_field82 varchar(10000);
    declare v_sync_field83 varchar(10000);
    declare v_sync_field84 varchar(10000);
    declare v_sync_field85 varchar(10000);
    declare v_sync_field86 varchar(10000);
    declare v_sync_field87 varchar(10000);
    declare v_sync_field88 varchar(10000);
    declare v_sync_field89 varchar(10000);
    declare v_sync_field90 varchar(10000);
    declare v_sync_field91 varchar(10000);
    declare v_sync_field92 varchar(10000);
    declare v_sync_field93 varchar(10000);
    declare v_sync_field94 varchar(10000);
    declare v_sync_field95 varchar(10000);
    declare v_sync_field96 varchar(10000);
    declare v_sync_field97 varchar(10000);
    declare v_sync_field98 varchar(10000);
    declare v_sync_field99 varchar(10000);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_ctrl_flag = p_ctrl_flag;
    SET v_update_date = p_update_date;
    SET v_update_time = p_update_time;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_sync_field14 = " ";
    SET v_sync_field15 = " ";
    SET v_sync_field16 = " ";
    SET v_sync_field17 = " ";
    SET v_sync_field18 = " ";
    SET v_sync_field19 = " ";
    SET v_sync_field20 = " ";
    SET v_sync_field21 = " ";
    SET v_sync_field22 = " ";
    SET v_sync_field23 = " ";
    SET v_sync_field24 = " ";
    SET v_sync_field25 = " ";
    SET v_sync_field26 = " ";
    SET v_sync_field27 = " ";
    SET v_sync_field28 = " ";
    SET v_sync_field29 = " ";
    SET v_sync_field30 = " ";
    SET v_sync_field31 = " ";
    SET v_sync_field32 = " ";
    SET v_sync_field33 = " ";
    SET v_sync_field34 = " ";
    SET v_sync_field35 = " ";
    SET v_sync_field36 = " ";
    SET v_sync_field37 = " ";
    SET v_sync_field38 = " ";
    SET v_sync_field39 = " ";
    SET v_sync_field40 = " ";
    SET v_sync_field41 = " ";
    SET v_sync_field42 = " ";
    SET v_sync_field43 = " ";
    SET v_sync_field44 = " ";
    SET v_sync_field45 = " ";
    SET v_sync_field46 = " ";
    SET v_sync_field47 = " ";
    SET v_sync_field48 = " ";
    SET v_sync_field49 = " ";
    SET v_sync_field50 = " ";
    SET v_sync_field51 = " ";
    SET v_sync_field52 = " ";
    SET v_sync_field53 = " ";
    SET v_sync_field54 = " ";
    SET v_sync_field55 = " ";
    SET v_sync_field56 = " ";
    SET v_sync_field57 = " ";
    SET v_sync_field58 = " ";
    SET v_sync_field59 = " ";
    SET v_sync_field60 = " ";
    SET v_sync_field61 = " ";
    SET v_sync_field62 = " ";
    SET v_sync_field63 = " ";
    SET v_sync_field64 = " ";
    SET v_sync_field65 = " ";
    SET v_sync_field66 = " ";
    SET v_sync_field67 = " ";
    SET v_sync_field68 = " ";
    SET v_sync_field69 = " ";
    SET v_sync_field70 = " ";
    SET v_sync_field71 = " ";
    SET v_sync_field72 = " ";
    SET v_sync_field73 = " ";
    SET v_sync_field74 = " ";
    SET v_sync_field75 = " ";
    SET v_sync_field76 = " ";
    SET v_sync_field77 = " ";
    SET v_sync_field78 = " ";
    SET v_sync_field79 = " ";
    SET v_sync_field80 = " ";
    SET v_sync_field81 = " ";
    SET v_sync_field82 = " ";
    SET v_sync_field83 = " ";
    SET v_sync_field84 = " ";
    SET v_sync_field85 = " ";
    SET v_sync_field86 = " ";
    SET v_sync_field87 = " ";
    SET v_sync_field88 = " ";
    SET v_sync_field89 = " ";
    SET v_sync_field90 = " ";
    SET v_sync_field91 = " ";
    SET v_sync_field92 = " ";
    SET v_sync_field93 = " ";
    SET v_sync_field94 = " ";
    SET v_sync_field95 = " ";
    SET v_sync_field96 = " ";
    SET v_sync_field97 = " ";
    SET v_sync_field98 = " ";
    SET v_sync_field99 = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_同步接口_同步资产账户业务持仓表】*/
    call db_tdfutu.pra_tdfusyn_Synctdfuac_asac_busi_posi(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_row_count,
        v_ctrl_flag,
        v_update_date,
        v_update_time,
        v_error_code,
        v_error_info,
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
        v_sync_field13,
        v_sync_field14,
        v_sync_field15,
        v_sync_field16,
        v_sync_field17,
        v_sync_field18,
        v_sync_field19,
        v_sync_field20,
        v_sync_field21,
        v_sync_field22,
        v_sync_field23,
        v_sync_field24,
        v_sync_field25,
        v_sync_field26,
        v_sync_field27,
        v_sync_field28,
        v_sync_field29,
        v_sync_field30,
        v_sync_field31,
        v_sync_field32,
        v_sync_field33,
        v_sync_field34,
        v_sync_field35,
        v_sync_field36,
        v_sync_field37,
        v_sync_field38,
        v_sync_field39,
        v_sync_field40,
        v_sync_field41,
        v_sync_field42,
        v_sync_field43,
        v_sync_field44,
        v_sync_field45,
        v_sync_field46,
        v_sync_field47,
        v_sync_field48,
        v_sync_field49,
        v_sync_field50,
        v_sync_field51,
        v_sync_field52,
        v_sync_field53,
        v_sync_field54,
        v_sync_field55,
        v_sync_field56,
        v_sync_field57,
        v_sync_field58,
        v_sync_field59,
        v_sync_field60,
        v_sync_field61,
        v_sync_field62,
        v_sync_field63,
        v_sync_field64,
        v_sync_field65,
        v_sync_field66,
        v_sync_field67,
        v_sync_field68,
        v_sync_field69,
        v_sync_field70,
        v_sync_field71,
        v_sync_field72,
        v_sync_field73,
        v_sync_field74,
        v_sync_field75,
        v_sync_field76,
        v_sync_field77,
        v_sync_field78,
        v_sync_field79,
        v_sync_field80,
        v_sync_field81,
        v_sync_field82,
        v_sync_field83,
        v_sync_field84,
        v_sync_field85,
        v_sync_field86,
        v_sync_field87,
        v_sync_field88,
        v_sync_field89,
        v_sync_field90,
        v_sync_field91,
        v_sync_field92,
        v_sync_field93,
        v_sync_field94,
        v_sync_field95,
        v_sync_field96,
        v_sync_field97,
        v_sync_field98,
        v_sync_field99);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.15.15.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_同步接口_同步资产账户业务持仓表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_sync_field14 = v_sync_field14;
    SET p_sync_field15 = v_sync_field15;
    SET p_sync_field16 = v_sync_field16;
    SET p_sync_field17 = v_sync_field17;
    SET p_sync_field18 = v_sync_field18;
    SET p_sync_field19 = v_sync_field19;
    SET p_sync_field20 = v_sync_field20;
    SET p_sync_field21 = v_sync_field21;
    SET p_sync_field22 = v_sync_field22;
    SET p_sync_field23 = v_sync_field23;
    SET p_sync_field24 = v_sync_field24;
    SET p_sync_field25 = v_sync_field25;
    SET p_sync_field26 = v_sync_field26;
    SET p_sync_field27 = v_sync_field27;
    SET p_sync_field28 = v_sync_field28;
    SET p_sync_field29 = v_sync_field29;
    SET p_sync_field30 = v_sync_field30;
    SET p_sync_field31 = v_sync_field31;
    SET p_sync_field32 = v_sync_field32;
    SET p_sync_field33 = v_sync_field33;
    SET p_sync_field34 = v_sync_field34;
    SET p_sync_field35 = v_sync_field35;
    SET p_sync_field36 = v_sync_field36;
    SET p_sync_field37 = v_sync_field37;
    SET p_sync_field38 = v_sync_field38;
    SET p_sync_field39 = v_sync_field39;
    SET p_sync_field40 = v_sync_field40;
    SET p_sync_field41 = v_sync_field41;
    SET p_sync_field42 = v_sync_field42;
    SET p_sync_field43 = v_sync_field43;
    SET p_sync_field44 = v_sync_field44;
    SET p_sync_field45 = v_sync_field45;
    SET p_sync_field46 = v_sync_field46;
    SET p_sync_field47 = v_sync_field47;
    SET p_sync_field48 = v_sync_field48;
    SET p_sync_field49 = v_sync_field49;
    SET p_sync_field50 = v_sync_field50;
    SET p_sync_field51 = v_sync_field51;
    SET p_sync_field52 = v_sync_field52;
    SET p_sync_field53 = v_sync_field53;
    SET p_sync_field54 = v_sync_field54;
    SET p_sync_field55 = v_sync_field55;
    SET p_sync_field56 = v_sync_field56;
    SET p_sync_field57 = v_sync_field57;
    SET p_sync_field58 = v_sync_field58;
    SET p_sync_field59 = v_sync_field59;
    SET p_sync_field60 = v_sync_field60;
    SET p_sync_field61 = v_sync_field61;
    SET p_sync_field62 = v_sync_field62;
    SET p_sync_field63 = v_sync_field63;
    SET p_sync_field64 = v_sync_field64;
    SET p_sync_field65 = v_sync_field65;
    SET p_sync_field66 = v_sync_field66;
    SET p_sync_field67 = v_sync_field67;
    SET p_sync_field68 = v_sync_field68;
    SET p_sync_field69 = v_sync_field69;
    SET p_sync_field70 = v_sync_field70;
    SET p_sync_field71 = v_sync_field71;
    SET p_sync_field72 = v_sync_field72;
    SET p_sync_field73 = v_sync_field73;
    SET p_sync_field74 = v_sync_field74;
    SET p_sync_field75 = v_sync_field75;
    SET p_sync_field76 = v_sync_field76;
    SET p_sync_field77 = v_sync_field77;
    SET p_sync_field78 = v_sync_field78;
    SET p_sync_field79 = v_sync_field79;
    SET p_sync_field80 = v_sync_field80;
    SET p_sync_field81 = v_sync_field81;
    SET p_sync_field82 = v_sync_field82;
    SET p_sync_field83 = v_sync_field83;
    SET p_sync_field84 = v_sync_field84;
    SET p_sync_field85 = v_sync_field85;
    SET p_sync_field86 = v_sync_field86;
    SET p_sync_field87 = v_sync_field87;
    SET p_sync_field88 = v_sync_field88;
    SET p_sync_field89 = v_sync_field89;
    SET p_sync_field90 = v_sync_field90;
    SET p_sync_field91 = v_sync_field91;
    SET p_sync_field92 = v_sync_field92;
    SET p_sync_field93 = v_sync_field93;
    SET p_sync_field94 = v_sync_field94;
    SET p_sync_field95 = v_sync_field95;
    SET p_sync_field96 = v_sync_field96;
    SET p_sync_field97 = v_sync_field97;
    SET p_sync_field98 = v_sync_field98;
    SET p_sync_field99 = v_sync_field99;

END;;


DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_同步接口_同步交易组持仓明细表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfusyn_Synctdfuac_exgp_posi_detail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfusyn_Synctdfuac_exgp_posi_detail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_ctrl_flag int,
    IN p_update_date int,
    IN p_update_time int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    OUT p_sync_field13 varchar(10000),
    OUT p_sync_field14 varchar(10000),
    OUT p_sync_field15 varchar(10000),
    OUT p_sync_field16 varchar(10000),
    OUT p_sync_field17 varchar(10000),
    OUT p_sync_field18 varchar(10000),
    OUT p_sync_field19 varchar(10000),
    OUT p_sync_field20 varchar(10000),
    OUT p_sync_field21 varchar(10000),
    OUT p_sync_field22 varchar(10000),
    OUT p_sync_field23 varchar(10000),
    OUT p_sync_field24 varchar(10000),
    OUT p_sync_field25 varchar(10000),
    OUT p_sync_field26 varchar(10000),
    OUT p_sync_field27 varchar(10000),
    OUT p_sync_field28 varchar(10000),
    OUT p_sync_field29 varchar(10000),
    OUT p_sync_field30 varchar(10000),
    OUT p_sync_field31 varchar(10000),
    OUT p_sync_field32 varchar(10000),
    OUT p_sync_field33 varchar(10000),
    OUT p_sync_field34 varchar(10000),
    OUT p_sync_field35 varchar(10000),
    OUT p_sync_field36 varchar(10000),
    OUT p_sync_field37 varchar(10000),
    OUT p_sync_field38 varchar(10000),
    OUT p_sync_field39 varchar(10000),
    OUT p_sync_field40 varchar(10000),
    OUT p_sync_field41 varchar(10000),
    OUT p_sync_field42 varchar(10000),
    OUT p_sync_field43 varchar(10000),
    OUT p_sync_field44 varchar(10000),
    OUT p_sync_field45 varchar(10000),
    OUT p_sync_field46 varchar(10000),
    OUT p_sync_field47 varchar(10000),
    OUT p_sync_field48 varchar(10000),
    OUT p_sync_field49 varchar(10000),
    OUT p_sync_field50 varchar(10000),
    OUT p_sync_field51 varchar(10000),
    OUT p_sync_field52 varchar(10000),
    OUT p_sync_field53 varchar(10000),
    OUT p_sync_field54 varchar(10000),
    OUT p_sync_field55 varchar(10000),
    OUT p_sync_field56 varchar(10000),
    OUT p_sync_field57 varchar(10000),
    OUT p_sync_field58 varchar(10000),
    OUT p_sync_field59 varchar(10000),
    OUT p_sync_field60 varchar(10000),
    OUT p_sync_field61 varchar(10000),
    OUT p_sync_field62 varchar(10000),
    OUT p_sync_field63 varchar(10000),
    OUT p_sync_field64 varchar(10000),
    OUT p_sync_field65 varchar(10000),
    OUT p_sync_field66 varchar(10000),
    OUT p_sync_field67 varchar(10000),
    OUT p_sync_field68 varchar(10000),
    OUT p_sync_field69 varchar(10000),
    OUT p_sync_field70 varchar(10000),
    OUT p_sync_field71 varchar(10000),
    OUT p_sync_field72 varchar(10000),
    OUT p_sync_field73 varchar(10000),
    OUT p_sync_field74 varchar(10000),
    OUT p_sync_field75 varchar(10000),
    OUT p_sync_field76 varchar(10000),
    OUT p_sync_field77 varchar(10000),
    OUT p_sync_field78 varchar(10000),
    OUT p_sync_field79 varchar(10000),
    OUT p_sync_field80 varchar(10000),
    OUT p_sync_field81 varchar(10000),
    OUT p_sync_field82 varchar(10000),
    OUT p_sync_field83 varchar(10000),
    OUT p_sync_field84 varchar(10000),
    OUT p_sync_field85 varchar(10000),
    OUT p_sync_field86 varchar(10000),
    OUT p_sync_field87 varchar(10000),
    OUT p_sync_field88 varchar(10000),
    OUT p_sync_field89 varchar(10000),
    OUT p_sync_field90 varchar(10000),
    OUT p_sync_field91 varchar(10000),
    OUT p_sync_field92 varchar(10000),
    OUT p_sync_field93 varchar(10000),
    OUT p_sync_field94 varchar(10000),
    OUT p_sync_field95 varchar(10000),
    OUT p_sync_field96 varchar(10000),
    OUT p_sync_field97 varchar(10000),
    OUT p_sync_field98 varchar(10000),
    OUT p_sync_field99 varchar(10000)
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
    declare v_ctrl_flag int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_sync_field14 varchar(10000);
    declare v_sync_field15 varchar(10000);
    declare v_sync_field16 varchar(10000);
    declare v_sync_field17 varchar(10000);
    declare v_sync_field18 varchar(10000);
    declare v_sync_field19 varchar(10000);
    declare v_sync_field20 varchar(10000);
    declare v_sync_field21 varchar(10000);
    declare v_sync_field22 varchar(10000);
    declare v_sync_field23 varchar(10000);
    declare v_sync_field24 varchar(10000);
    declare v_sync_field25 varchar(10000);
    declare v_sync_field26 varchar(10000);
    declare v_sync_field27 varchar(10000);
    declare v_sync_field28 varchar(10000);
    declare v_sync_field29 varchar(10000);
    declare v_sync_field30 varchar(10000);
    declare v_sync_field31 varchar(10000);
    declare v_sync_field32 varchar(10000);
    declare v_sync_field33 varchar(10000);
    declare v_sync_field34 varchar(10000);
    declare v_sync_field35 varchar(10000);
    declare v_sync_field36 varchar(10000);
    declare v_sync_field37 varchar(10000);
    declare v_sync_field38 varchar(10000);
    declare v_sync_field39 varchar(10000);
    declare v_sync_field40 varchar(10000);
    declare v_sync_field41 varchar(10000);
    declare v_sync_field42 varchar(10000);
    declare v_sync_field43 varchar(10000);
    declare v_sync_field44 varchar(10000);
    declare v_sync_field45 varchar(10000);
    declare v_sync_field46 varchar(10000);
    declare v_sync_field47 varchar(10000);
    declare v_sync_field48 varchar(10000);
    declare v_sync_field49 varchar(10000);
    declare v_sync_field50 varchar(10000);
    declare v_sync_field51 varchar(10000);
    declare v_sync_field52 varchar(10000);
    declare v_sync_field53 varchar(10000);
    declare v_sync_field54 varchar(10000);
    declare v_sync_field55 varchar(10000);
    declare v_sync_field56 varchar(10000);
    declare v_sync_field57 varchar(10000);
    declare v_sync_field58 varchar(10000);
    declare v_sync_field59 varchar(10000);
    declare v_sync_field60 varchar(10000);
    declare v_sync_field61 varchar(10000);
    declare v_sync_field62 varchar(10000);
    declare v_sync_field63 varchar(10000);
    declare v_sync_field64 varchar(10000);
    declare v_sync_field65 varchar(10000);
    declare v_sync_field66 varchar(10000);
    declare v_sync_field67 varchar(10000);
    declare v_sync_field68 varchar(10000);
    declare v_sync_field69 varchar(10000);
    declare v_sync_field70 varchar(10000);
    declare v_sync_field71 varchar(10000);
    declare v_sync_field72 varchar(10000);
    declare v_sync_field73 varchar(10000);
    declare v_sync_field74 varchar(10000);
    declare v_sync_field75 varchar(10000);
    declare v_sync_field76 varchar(10000);
    declare v_sync_field77 varchar(10000);
    declare v_sync_field78 varchar(10000);
    declare v_sync_field79 varchar(10000);
    declare v_sync_field80 varchar(10000);
    declare v_sync_field81 varchar(10000);
    declare v_sync_field82 varchar(10000);
    declare v_sync_field83 varchar(10000);
    declare v_sync_field84 varchar(10000);
    declare v_sync_field85 varchar(10000);
    declare v_sync_field86 varchar(10000);
    declare v_sync_field87 varchar(10000);
    declare v_sync_field88 varchar(10000);
    declare v_sync_field89 varchar(10000);
    declare v_sync_field90 varchar(10000);
    declare v_sync_field91 varchar(10000);
    declare v_sync_field92 varchar(10000);
    declare v_sync_field93 varchar(10000);
    declare v_sync_field94 varchar(10000);
    declare v_sync_field95 varchar(10000);
    declare v_sync_field96 varchar(10000);
    declare v_sync_field97 varchar(10000);
    declare v_sync_field98 varchar(10000);
    declare v_sync_field99 varchar(10000);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_ctrl_flag = p_ctrl_flag;
    SET v_update_date = p_update_date;
    SET v_update_time = p_update_time;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_sync_field14 = " ";
    SET v_sync_field15 = " ";
    SET v_sync_field16 = " ";
    SET v_sync_field17 = " ";
    SET v_sync_field18 = " ";
    SET v_sync_field19 = " ";
    SET v_sync_field20 = " ";
    SET v_sync_field21 = " ";
    SET v_sync_field22 = " ";
    SET v_sync_field23 = " ";
    SET v_sync_field24 = " ";
    SET v_sync_field25 = " ";
    SET v_sync_field26 = " ";
    SET v_sync_field27 = " ";
    SET v_sync_field28 = " ";
    SET v_sync_field29 = " ";
    SET v_sync_field30 = " ";
    SET v_sync_field31 = " ";
    SET v_sync_field32 = " ";
    SET v_sync_field33 = " ";
    SET v_sync_field34 = " ";
    SET v_sync_field35 = " ";
    SET v_sync_field36 = " ";
    SET v_sync_field37 = " ";
    SET v_sync_field38 = " ";
    SET v_sync_field39 = " ";
    SET v_sync_field40 = " ";
    SET v_sync_field41 = " ";
    SET v_sync_field42 = " ";
    SET v_sync_field43 = " ";
    SET v_sync_field44 = " ";
    SET v_sync_field45 = " ";
    SET v_sync_field46 = " ";
    SET v_sync_field47 = " ";
    SET v_sync_field48 = " ";
    SET v_sync_field49 = " ";
    SET v_sync_field50 = " ";
    SET v_sync_field51 = " ";
    SET v_sync_field52 = " ";
    SET v_sync_field53 = " ";
    SET v_sync_field54 = " ";
    SET v_sync_field55 = " ";
    SET v_sync_field56 = " ";
    SET v_sync_field57 = " ";
    SET v_sync_field58 = " ";
    SET v_sync_field59 = " ";
    SET v_sync_field60 = " ";
    SET v_sync_field61 = " ";
    SET v_sync_field62 = " ";
    SET v_sync_field63 = " ";
    SET v_sync_field64 = " ";
    SET v_sync_field65 = " ";
    SET v_sync_field66 = " ";
    SET v_sync_field67 = " ";
    SET v_sync_field68 = " ";
    SET v_sync_field69 = " ";
    SET v_sync_field70 = " ";
    SET v_sync_field71 = " ";
    SET v_sync_field72 = " ";
    SET v_sync_field73 = " ";
    SET v_sync_field74 = " ";
    SET v_sync_field75 = " ";
    SET v_sync_field76 = " ";
    SET v_sync_field77 = " ";
    SET v_sync_field78 = " ";
    SET v_sync_field79 = " ";
    SET v_sync_field80 = " ";
    SET v_sync_field81 = " ";
    SET v_sync_field82 = " ";
    SET v_sync_field83 = " ";
    SET v_sync_field84 = " ";
    SET v_sync_field85 = " ";
    SET v_sync_field86 = " ";
    SET v_sync_field87 = " ";
    SET v_sync_field88 = " ";
    SET v_sync_field89 = " ";
    SET v_sync_field90 = " ";
    SET v_sync_field91 = " ";
    SET v_sync_field92 = " ";
    SET v_sync_field93 = " ";
    SET v_sync_field94 = " ";
    SET v_sync_field95 = " ";
    SET v_sync_field96 = " ";
    SET v_sync_field97 = " ";
    SET v_sync_field98 = " ";
    SET v_sync_field99 = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_同步接口_同步交易组持仓明细表】*/
    call db_tdfutu.pra_tdfusyn_Synctdfuac_exgp_posi_detail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_row_count,
        v_ctrl_flag,
        v_update_date,
        v_update_time,
        v_error_code,
        v_error_info,
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
        v_sync_field13,
        v_sync_field14,
        v_sync_field15,
        v_sync_field16,
        v_sync_field17,
        v_sync_field18,
        v_sync_field19,
        v_sync_field20,
        v_sync_field21,
        v_sync_field22,
        v_sync_field23,
        v_sync_field24,
        v_sync_field25,
        v_sync_field26,
        v_sync_field27,
        v_sync_field28,
        v_sync_field29,
        v_sync_field30,
        v_sync_field31,
        v_sync_field32,
        v_sync_field33,
        v_sync_field34,
        v_sync_field35,
        v_sync_field36,
        v_sync_field37,
        v_sync_field38,
        v_sync_field39,
        v_sync_field40,
        v_sync_field41,
        v_sync_field42,
        v_sync_field43,
        v_sync_field44,
        v_sync_field45,
        v_sync_field46,
        v_sync_field47,
        v_sync_field48,
        v_sync_field49,
        v_sync_field50,
        v_sync_field51,
        v_sync_field52,
        v_sync_field53,
        v_sync_field54,
        v_sync_field55,
        v_sync_field56,
        v_sync_field57,
        v_sync_field58,
        v_sync_field59,
        v_sync_field60,
        v_sync_field61,
        v_sync_field62,
        v_sync_field63,
        v_sync_field64,
        v_sync_field65,
        v_sync_field66,
        v_sync_field67,
        v_sync_field68,
        v_sync_field69,
        v_sync_field70,
        v_sync_field71,
        v_sync_field72,
        v_sync_field73,
        v_sync_field74,
        v_sync_field75,
        v_sync_field76,
        v_sync_field77,
        v_sync_field78,
        v_sync_field79,
        v_sync_field80,
        v_sync_field81,
        v_sync_field82,
        v_sync_field83,
        v_sync_field84,
        v_sync_field85,
        v_sync_field86,
        v_sync_field87,
        v_sync_field88,
        v_sync_field89,
        v_sync_field90,
        v_sync_field91,
        v_sync_field92,
        v_sync_field93,
        v_sync_field94,
        v_sync_field95,
        v_sync_field96,
        v_sync_field97,
        v_sync_field98,
        v_sync_field99);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.15.16.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_同步接口_同步交易组持仓明细表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_sync_field14 = v_sync_field14;
    SET p_sync_field15 = v_sync_field15;
    SET p_sync_field16 = v_sync_field16;
    SET p_sync_field17 = v_sync_field17;
    SET p_sync_field18 = v_sync_field18;
    SET p_sync_field19 = v_sync_field19;
    SET p_sync_field20 = v_sync_field20;
    SET p_sync_field21 = v_sync_field21;
    SET p_sync_field22 = v_sync_field22;
    SET p_sync_field23 = v_sync_field23;
    SET p_sync_field24 = v_sync_field24;
    SET p_sync_field25 = v_sync_field25;
    SET p_sync_field26 = v_sync_field26;
    SET p_sync_field27 = v_sync_field27;
    SET p_sync_field28 = v_sync_field28;
    SET p_sync_field29 = v_sync_field29;
    SET p_sync_field30 = v_sync_field30;
    SET p_sync_field31 = v_sync_field31;
    SET p_sync_field32 = v_sync_field32;
    SET p_sync_field33 = v_sync_field33;
    SET p_sync_field34 = v_sync_field34;
    SET p_sync_field35 = v_sync_field35;
    SET p_sync_field36 = v_sync_field36;
    SET p_sync_field37 = v_sync_field37;
    SET p_sync_field38 = v_sync_field38;
    SET p_sync_field39 = v_sync_field39;
    SET p_sync_field40 = v_sync_field40;
    SET p_sync_field41 = v_sync_field41;
    SET p_sync_field42 = v_sync_field42;
    SET p_sync_field43 = v_sync_field43;
    SET p_sync_field44 = v_sync_field44;
    SET p_sync_field45 = v_sync_field45;
    SET p_sync_field46 = v_sync_field46;
    SET p_sync_field47 = v_sync_field47;
    SET p_sync_field48 = v_sync_field48;
    SET p_sync_field49 = v_sync_field49;
    SET p_sync_field50 = v_sync_field50;
    SET p_sync_field51 = v_sync_field51;
    SET p_sync_field52 = v_sync_field52;
    SET p_sync_field53 = v_sync_field53;
    SET p_sync_field54 = v_sync_field54;
    SET p_sync_field55 = v_sync_field55;
    SET p_sync_field56 = v_sync_field56;
    SET p_sync_field57 = v_sync_field57;
    SET p_sync_field58 = v_sync_field58;
    SET p_sync_field59 = v_sync_field59;
    SET p_sync_field60 = v_sync_field60;
    SET p_sync_field61 = v_sync_field61;
    SET p_sync_field62 = v_sync_field62;
    SET p_sync_field63 = v_sync_field63;
    SET p_sync_field64 = v_sync_field64;
    SET p_sync_field65 = v_sync_field65;
    SET p_sync_field66 = v_sync_field66;
    SET p_sync_field67 = v_sync_field67;
    SET p_sync_field68 = v_sync_field68;
    SET p_sync_field69 = v_sync_field69;
    SET p_sync_field70 = v_sync_field70;
    SET p_sync_field71 = v_sync_field71;
    SET p_sync_field72 = v_sync_field72;
    SET p_sync_field73 = v_sync_field73;
    SET p_sync_field74 = v_sync_field74;
    SET p_sync_field75 = v_sync_field75;
    SET p_sync_field76 = v_sync_field76;
    SET p_sync_field77 = v_sync_field77;
    SET p_sync_field78 = v_sync_field78;
    SET p_sync_field79 = v_sync_field79;
    SET p_sync_field80 = v_sync_field80;
    SET p_sync_field81 = v_sync_field81;
    SET p_sync_field82 = v_sync_field82;
    SET p_sync_field83 = v_sync_field83;
    SET p_sync_field84 = v_sync_field84;
    SET p_sync_field85 = v_sync_field85;
    SET p_sync_field86 = v_sync_field86;
    SET p_sync_field87 = v_sync_field87;
    SET p_sync_field88 = v_sync_field88;
    SET p_sync_field89 = v_sync_field89;
    SET p_sync_field90 = v_sync_field90;
    SET p_sync_field91 = v_sync_field91;
    SET p_sync_field92 = v_sync_field92;
    SET p_sync_field93 = v_sync_field93;
    SET p_sync_field94 = v_sync_field94;
    SET p_sync_field95 = v_sync_field95;
    SET p_sync_field96 = v_sync_field96;
    SET p_sync_field97 = v_sync_field97;
    SET p_sync_field98 = v_sync_field98;
    SET p_sync_field99 = v_sync_field99;

END;;


