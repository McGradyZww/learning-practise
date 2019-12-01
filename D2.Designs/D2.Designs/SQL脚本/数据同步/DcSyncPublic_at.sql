DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步证券模板表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncbasesedt_stock_tmplat;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncbasesedt_stock_tmplat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_basesedt_stock_tmplat (row_id,create_date,create_time,update_date,update_time,update_times,model_name,exch_no,stock_code_feature,stock_name_feature,stock_type)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS model_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS stock_code_feature,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS stock_name_feature,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS stock_type
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步证券类型表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncbasesedt_stock_type;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncbasesedt_stock_type(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_basesedt_stock_type (row_id,create_date,create_time,update_date,update_time,exch_no,stock_type,stock_type_name,asset_type,par_value,crncy_type,exch_crncy_type,capit_reback_days,posi_reback_days,type_unit,report_unit,min_unit,max_qty,min_qty,is_order_dir_flag,time_stamp,update_times)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS stock_type_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS asset_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS par_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS capit_reback_days,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS posi_reback_days,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS type_unit,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS report_unit,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS min_unit,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS max_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS min_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS is_order_dir_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS time_stamp,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS update_times
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步证券类型订单方向表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncbasesedt_stock_type_order_dir;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncbasesedt_stock_type_order_dir(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_basesedt_stock_type_order_dir (row_id,create_date,create_time,update_date,update_time,exch_no,stock_type,order_dir,cash_frozen_type,order_split_flag,min_unit,max_qty,min_qty,time_stamp,update_times)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS order_dir,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS cash_frozen_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS order_split_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS min_unit,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS max_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS min_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS time_stamp,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS update_times
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步证券代码信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncbasesedt_stock_code_info;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncbasesedt_stock_code_info(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_basesedt_stock_code_info (row_id,create_date,create_time,update_date,update_time,update_times,stock_code_no,exch_no,stock_code,stock_name,pinyin_short,stock_type,asset_type,par_value,crncy_type,exch_crncy_type,total_stock_issue,circl_stock_capit,capit_reback_days,posi_reback_days,type_unit,report_unit,min_unit,max_qty,min_qty,is_order_dir_flag,price_up,price_down,step_price,fair_price,stop_status,hk_stock_flag,time_stamp)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS stock_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS pinyin_short,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS asset_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS par_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS total_stock_issue,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS circl_stock_capit,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS capit_reback_days,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS posi_reback_days,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS type_unit,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS report_unit,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS min_unit,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS max_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS min_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS is_order_dir_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS price_up,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS price_down,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS step_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS fair_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS stop_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS hk_stock_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS time_stamp
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步证券行情表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncbasesedt_stock_quot;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncbasesedt_stock_quot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_basesedt_stock_quot (row_id,create_date,create_time,update_date,update_time,update_times,stock_code_no,exch_no,stock_code,stock_name,up_limit_price,down_limit_price,last_price,pre_close_price,today_open_price,today_close_price,today_max_price,today_min_price,buy_price_1,buy_qty_1,buy_price_2,buy_qty_2,buy_price_3,buy_qty_3,buy_price_4,buy_qty_4,buy_price_5,buy_qty_5,sell_price_1,sell_qty_1,sell_price_2,sell_qty_2,sell_price_3,sell_qty_3,sell_price_4,sell_qty_4,sell_price_5,sell_qty_5,strike_qty,strike_amt,pe_ratio,time_stamp)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS stock_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS up_limit_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS down_limit_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS last_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS pre_close_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS today_open_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS today_close_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS today_max_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS today_min_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS buy_price_1,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS buy_qty_1,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS buy_price_2,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS buy_qty_2,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS buy_price_3,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS buy_qty_3,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS buy_price_4,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS buy_qty_4,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS buy_price_5,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS buy_qty_5,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS sell_price_1,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS sell_qty_1,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS sell_price_2,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS sell_qty_2,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS sell_price_3,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS sell_qty_3,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS sell_price_4,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS sell_qty_4,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS sell_price_5,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS sell_qty_5,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field39,",",help_topic_id+1),",",-1) AS strike_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field40,",",help_topic_id+1),",",-1) AS strike_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field41,",",help_topic_id+1),",",-1) AS pe_ratio,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field42,",",help_topic_id+1),",",-1) AS time_stamp
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步债券属性信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncbasesedt_bond_info;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncbasesedt_bond_info(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_basesedt_bond_info (row_id,create_date,create_time,update_date,update_time,update_times,exch_no,stock_code,trade_code,target_code,stock_code_no,trade_code_no,target_code_no,stock_name,issue_date,end_date,value_date,next_value_date,begin_trade_date,bond_limit,issue_price,par_value,intrst_ratio,intrst_days,pay_inteval,bond_accr_intrst,bond_rate_type,inteval_days,net_price_flag,last_trade_date,rights_type,trans_begin_date,trans_end_date,exec_begin_date,exec_end_date,impawn_ratio,pay_intrst_flag,time_stamp)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS trade_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS target_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS trade_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS target_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS stock_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS issue_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS end_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS value_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS next_value_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS begin_trade_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS bond_limit,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS issue_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS par_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS intrst_ratio,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS intrst_days,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS pay_inteval,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS bond_accr_intrst,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS bond_rate_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS inteval_days,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS net_price_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS last_trade_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS rights_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS trans_begin_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS trans_end_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS exec_begin_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS exec_end_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS impawn_ratio,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS pay_intrst_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS time_stamp
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步系统信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncbase_sys_info;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncbase_sys_info(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_base_sys_info (row_id,create_date,create_time,update_date,update_time,update_times,sys_name,sys_status,init_date,no_exch_date_str,allow_next_init_time,sys_config_str,client_version,manage_ver,admin_ver,update_addr,dnload_addr)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS sys_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS sys_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS no_exch_date_str,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS allow_next_init_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS sys_config_str,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS client_version,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS manage_ver,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS admin_ver,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS update_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS dnload_addr
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步机构信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncbase_co_info;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncbase_co_info(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_base_co_info (row_id,create_date,create_time,update_date,update_time,co_no,co_name,co_flname,co_type,reg_code,reg_addr,found_date,reg_date,conta_addr,conta_name,phone_number,email,pd_qty_max,max_acco_count,opor_qty_max,allow_exch,allow_stock_type,busi_config_str,comm_appr_oper,market_price_ratio,mul_acco_trd_assign_set,mul_acco_trd_choice,base_crncy_type,co_status,update_times)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS co_flname,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS co_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS reg_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS reg_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS found_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS reg_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS conta_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS conta_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS phone_number,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS email,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS pd_qty_max,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS max_acco_count,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS opor_qty_max,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS allow_exch,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS allow_stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS busi_config_str,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS comm_appr_oper,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS market_price_ratio,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS mul_acco_trd_assign_set,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS mul_acco_trd_choice,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS base_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS co_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS update_times
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步市场业务记录编号表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncbase_market_busi_record_no;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncbase_market_busi_record_no(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_base_market_busi_record_no (row_id,create_date,create_time,update_date,update_time,update_times,exch_no,record_no_type,curr_no)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS record_no_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS curr_no
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步数据字典表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncbase_dictionary;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncbase_dictionary(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_base_dictionary (row_id,create_date,create_time,update_date,update_time,dict_no,dict_name,dict_field_name,dict_item_name,dict_item_value,time_stamp,update_times)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS dict_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS dict_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS dict_field_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS dict_item_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS dict_item_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS time_stamp,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS update_times
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步港股通汇率表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncbase_hk_exch_rate;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncbase_hk_exch_rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_base_hk_exch_rate (row_id,create_date,create_time,update_date,update_time,update_times,init_date,exch_no,for_crncy_type,crncy_type,buy_ref_rate,sell_ref_rate,settle_buy_rate,settle_sell_rate,pboc_rate)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS for_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS buy_ref_rate,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS sell_ref_rate,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS settle_buy_rate,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS settle_sell_rate,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS pboc_rate
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步操作员信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncuser_opor_info;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncuser_opor_info(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_user_opor_info (row_id,create_date,create_time,update_date,update_time,update_times,co_no,opor_no,opor_name,opor_type,opor_pwd,opor_status,create_opor,conta_addr,oper_rights,phone_number,email,is_trader,trader_no,allow_login_type,allow_oper_ip_addr,allow_oper_mac)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS opor_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS opor_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS opor_pwd,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS opor_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS create_opor,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS conta_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS oper_rights,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS phone_number,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS email,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS is_trader,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS trader_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS allow_login_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS allow_oper_ip_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS allow_oper_mac
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步操作员可操作机构表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncuser_opor_allow_co;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncuser_opor_allow_co(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_user_opor_allow_co (row_id,create_date,create_time,update_date,update_time,update_times,opor_no,co_no,abolish_status,oper_rights)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS abolish_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS oper_rights
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步操作员可操作产品表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncuser_opor_allow_prod;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncuser_opor_allow_prod(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_user_opor_allow_prod (row_id,create_date,create_time,update_date,update_time,update_times,opor_no,co_no,pd_no,abolish_status,oper_rights)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS abolish_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS oper_rights
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步交易组信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncuser_exch_group_info;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncuser_exch_group_info(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_user_exch_group_info (row_id,create_date,create_time,update_date,update_time,update_times,exch_group_no,co_no,exch_group_code,exch_group_name,exch_group_status,default_group_flag,pd_no,first_asset,exch_group_dist_pd_amt,exch_group_pd_share,pre_exch_group_pd_share,pre_nav,begin_nav,allow_exch,allow_stock_type,busi_config_str,market_price_ratio,weight_value,remark_info,abolish_date)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS exch_group_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS exch_group_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS exch_group_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS default_group_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS first_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS exch_group_dist_pd_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS exch_group_pd_share,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS pre_exch_group_pd_share,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS pre_nav,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS begin_nav,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS allow_exch,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS allow_stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS busi_config_str,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS market_price_ratio,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS weight_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS remark_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS abolish_date
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步交易组资产表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncuser_exch_group_asset;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncuser_exch_group_asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_user_exch_group_asset (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,exch_group_no,crncy_type,begin_NAV,nav_asset,stock_cash_asset,futu_cash_asset,stock_asset,fund_asset,bond_asset,futu_asset,repo_asset,other_asset,hk_thrgh_stock_asset,total_realiz_pandl,many_days_total_asset,evalu_nav_asset,begin_evalu_nav_asset,stat_days,total_cash_asset)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS begin_NAV,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS nav_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS stock_cash_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS futu_cash_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS stock_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS fund_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS bond_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS futu_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS repo_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS other_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS hk_thrgh_stock_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS total_realiz_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS many_days_total_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS evalu_nav_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS begin_evalu_nav_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS stat_days,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS total_cash_asset
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步操作员所属交易组表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncuser_opor_exch_group;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncuser_opor_exch_group(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_user_opor_exch_group (row_id,create_date,create_time,update_date,update_time,update_times,opor_no,co_no,pd_no,exch_group_no,abolish_status,oper_rights)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS abolish_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS oper_rights
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_公共同步_同步期货行情表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypub_Syncbasefudt_futu_quot;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypub_Syncbasefudt_futu_quot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_field1 varchar(10000),
    IN p_sync_field2 varchar(10000),
    IN p_sync_field3 varchar(10000),
    IN p_sync_field4 varchar(10000),
    IN p_sync_field5 varchar(10000),
    IN p_sync_field6 varchar(10000),
    IN p_sync_field7 varchar(10000),
    IN p_sync_field8 varchar(10000),
    IN p_sync_field9 varchar(10000),
    IN p_sync_field10 varchar(10000),
    IN p_sync_field11 varchar(10000),
    IN p_sync_field12 varchar(10000),
    IN p_sync_field13 varchar(10000),
    IN p_sync_field14 varchar(10000),
    IN p_sync_field15 varchar(10000),
    IN p_sync_field16 varchar(10000),
    IN p_sync_field17 varchar(10000),
    IN p_sync_field18 varchar(10000),
    IN p_sync_field19 varchar(10000),
    IN p_sync_field20 varchar(10000),
    IN p_sync_field21 varchar(10000),
    IN p_sync_field22 varchar(10000),
    IN p_sync_field23 varchar(10000),
    IN p_sync_field24 varchar(10000),
    IN p_sync_field25 varchar(10000),
    IN p_sync_field26 varchar(10000),
    IN p_sync_field27 varchar(10000),
    IN p_sync_field28 varchar(10000),
    IN p_sync_field29 varchar(10000),
    IN p_sync_field30 varchar(10000),
    IN p_sync_field31 varchar(10000),
    IN p_sync_field32 varchar(10000),
    IN p_sync_field33 varchar(10000),
    IN p_sync_field34 varchar(10000),
    IN p_sync_field35 varchar(10000),
    IN p_sync_field36 varchar(10000),
    IN p_sync_field37 varchar(10000),
    IN p_sync_field38 varchar(10000),
    IN p_sync_field39 varchar(10000),
    IN p_sync_field40 varchar(10000),
    IN p_sync_field41 varchar(10000),
    IN p_sync_field42 varchar(10000),
    IN p_sync_field43 varchar(10000),
    IN p_sync_field44 varchar(10000),
    IN p_sync_field45 varchar(10000),
    IN p_sync_field46 varchar(10000),
    IN p_sync_field47 varchar(10000),
    IN p_sync_field48 varchar(10000),
    IN p_sync_field49 varchar(10000),
    IN p_sync_field50 varchar(10000),
    IN p_sync_field51 varchar(10000),
    IN p_sync_field52 varchar(10000),
    IN p_sync_field53 varchar(10000),
    IN p_sync_field54 varchar(10000),
    IN p_sync_field55 varchar(10000),
    IN p_sync_field56 varchar(10000),
    IN p_sync_field57 varchar(10000),
    IN p_sync_field58 varchar(10000),
    IN p_sync_field59 varchar(10000),
    IN p_sync_field60 varchar(10000),
    IN p_sync_field61 varchar(10000),
    IN p_sync_field62 varchar(10000),
    IN p_sync_field63 varchar(10000),
    IN p_sync_field64 varchar(10000),
    IN p_sync_field65 varchar(10000),
    IN p_sync_field66 varchar(10000),
    IN p_sync_field67 varchar(10000),
    IN p_sync_field68 varchar(10000),
    IN p_sync_field69 varchar(10000),
    IN p_sync_field70 varchar(10000),
    IN p_sync_field71 varchar(10000),
    IN p_sync_field72 varchar(10000),
    IN p_sync_field73 varchar(10000),
    IN p_sync_field74 varchar(10000),
    IN p_sync_field75 varchar(10000),
    IN p_sync_field76 varchar(10000),
    IN p_sync_field77 varchar(10000),
    IN p_sync_field78 varchar(10000),
    IN p_sync_field79 varchar(10000),
    IN p_sync_field80 varchar(10000),
    IN p_sync_field81 varchar(10000),
    IN p_sync_field82 varchar(10000),
    IN p_sync_field83 varchar(10000),
    IN p_sync_field84 varchar(10000),
    IN p_sync_field85 varchar(10000),
    IN p_sync_field86 varchar(10000),
    IN p_sync_field87 varchar(10000),
    IN p_sync_field88 varchar(10000),
    IN p_sync_field89 varchar(10000),
    IN p_sync_field90 varchar(10000),
    IN p_sync_field91 varchar(10000),
    IN p_sync_field92 varchar(10000),
    IN p_sync_field93 varchar(10000),
    IN p_sync_field94 varchar(10000),
    IN p_sync_field95 varchar(10000),
    IN p_sync_field96 varchar(10000),
    IN p_sync_field97 varchar(10000),
    IN p_sync_field98 varchar(10000),
    IN p_sync_field99 varchar(10000),
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
    SET v_sync_field1 = p_sync_field1;
    SET v_sync_field2 = p_sync_field2;
    SET v_sync_field3 = p_sync_field3;
    SET v_sync_field4 = p_sync_field4;
    SET v_sync_field5 = p_sync_field5;
    SET v_sync_field6 = p_sync_field6;
    SET v_sync_field7 = p_sync_field7;
    SET v_sync_field8 = p_sync_field8;
    SET v_sync_field9 = p_sync_field9;
    SET v_sync_field10 = p_sync_field10;
    SET v_sync_field11 = p_sync_field11;
    SET v_sync_field12 = p_sync_field12;
    SET v_sync_field13 = p_sync_field13;
    SET v_sync_field14 = p_sync_field14;
    SET v_sync_field15 = p_sync_field15;
    SET v_sync_field16 = p_sync_field16;
    SET v_sync_field17 = p_sync_field17;
    SET v_sync_field18 = p_sync_field18;
    SET v_sync_field19 = p_sync_field19;
    SET v_sync_field20 = p_sync_field20;
    SET v_sync_field21 = p_sync_field21;
    SET v_sync_field22 = p_sync_field22;
    SET v_sync_field23 = p_sync_field23;
    SET v_sync_field24 = p_sync_field24;
    SET v_sync_field25 = p_sync_field25;
    SET v_sync_field26 = p_sync_field26;
    SET v_sync_field27 = p_sync_field27;
    SET v_sync_field28 = p_sync_field28;
    SET v_sync_field29 = p_sync_field29;
    SET v_sync_field30 = p_sync_field30;
    SET v_sync_field31 = p_sync_field31;
    SET v_sync_field32 = p_sync_field32;
    SET v_sync_field33 = p_sync_field33;
    SET v_sync_field34 = p_sync_field34;
    SET v_sync_field35 = p_sync_field35;
    SET v_sync_field36 = p_sync_field36;
    SET v_sync_field37 = p_sync_field37;
    SET v_sync_field38 = p_sync_field38;
    SET v_sync_field39 = p_sync_field39;
    SET v_sync_field40 = p_sync_field40;
    SET v_sync_field41 = p_sync_field41;
    SET v_sync_field42 = p_sync_field42;
    SET v_sync_field43 = p_sync_field43;
    SET v_sync_field44 = p_sync_field44;
    SET v_sync_field45 = p_sync_field45;
    SET v_sync_field46 = p_sync_field46;
    SET v_sync_field47 = p_sync_field47;
    SET v_sync_field48 = p_sync_field48;
    SET v_sync_field49 = p_sync_field49;
    SET v_sync_field50 = p_sync_field50;
    SET v_sync_field51 = p_sync_field51;
    SET v_sync_field52 = p_sync_field52;
    SET v_sync_field53 = p_sync_field53;
    SET v_sync_field54 = p_sync_field54;
    SET v_sync_field55 = p_sync_field55;
    SET v_sync_field56 = p_sync_field56;
    SET v_sync_field57 = p_sync_field57;
    SET v_sync_field58 = p_sync_field58;
    SET v_sync_field59 = p_sync_field59;
    SET v_sync_field60 = p_sync_field60;
    SET v_sync_field61 = p_sync_field61;
    SET v_sync_field62 = p_sync_field62;
    SET v_sync_field63 = p_sync_field63;
    SET v_sync_field64 = p_sync_field64;
    SET v_sync_field65 = p_sync_field65;
    SET v_sync_field66 = p_sync_field66;
    SET v_sync_field67 = p_sync_field67;
    SET v_sync_field68 = p_sync_field68;
    SET v_sync_field69 = p_sync_field69;
    SET v_sync_field70 = p_sync_field70;
    SET v_sync_field71 = p_sync_field71;
    SET v_sync_field72 = p_sync_field72;
    SET v_sync_field73 = p_sync_field73;
    SET v_sync_field74 = p_sync_field74;
    SET v_sync_field75 = p_sync_field75;
    SET v_sync_field76 = p_sync_field76;
    SET v_sync_field77 = p_sync_field77;
    SET v_sync_field78 = p_sync_field78;
    SET v_sync_field79 = p_sync_field79;
    SET v_sync_field80 = p_sync_field80;
    SET v_sync_field81 = p_sync_field81;
    SET v_sync_field82 = p_sync_field82;
    SET v_sync_field83 = p_sync_field83;
    SET v_sync_field84 = p_sync_field84;
    SET v_sync_field85 = p_sync_field85;
    SET v_sync_field86 = p_sync_field86;
    SET v_sync_field87 = p_sync_field87;
    SET v_sync_field88 = p_sync_field88;
    SET v_sync_field89 = p_sync_field89;
    SET v_sync_field90 = p_sync_field90;
    SET v_sync_field91 = p_sync_field91;
    SET v_sync_field92 = p_sync_field92;
    SET v_sync_field93 = p_sync_field93;
    SET v_sync_field94 = p_sync_field94;
    SET v_sync_field95 = p_sync_field95;
    SET v_sync_field96 = p_sync_field96;
    SET v_sync_field97 = p_sync_field97;
    SET v_sync_field98 = p_sync_field98;
    SET v_sync_field99 = p_sync_field99;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    replace into tb_basefudt_futu_quot (row_id,create_date,create_time,update_date,update_time,update_times,contrc_code_no,exch_no,contrc_code,contrc_name,pre_close_price,sett_price,pre_settle_price,today_close_price,hold_qty,pre_hold_qty,last_price,today_open_price,max_buy_price,min_sale_price,total_buy_qty,total_sale_qty,up_limit_price,down_limit_price,strike_qty,strike_amt,buy_price_1,buy_qty_1,buy_price_2,buy_qty_2,buy_price_3,buy_qty_3,buy_price_4,buy_qty_4,buy_price_5,buy_qty_5,sell_price_1,sell_qty_1,sell_price_2,sell_qty_2,sell_price_3,sell_qty_3,sell_price_4,sell_qty_4,sell_price_5,sell_qty_5,contrc_type,asset_type,time_stamp)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS contrc_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS contrc_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS contrc_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS pre_close_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS sett_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS pre_settle_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS today_close_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS hold_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS pre_hold_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS last_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS today_open_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS max_buy_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS min_sale_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS total_buy_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS total_sale_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS up_limit_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS down_limit_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS strike_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS strike_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS buy_price_1,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS buy_qty_1,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS buy_price_2,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS buy_qty_2,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS buy_price_3,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS buy_qty_3,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS buy_price_4,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS buy_qty_4,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS buy_price_5,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS buy_qty_5,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS sell_price_1,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS sell_qty_1,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field39,",",help_topic_id+1),",",-1) AS sell_price_2,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field40,",",help_topic_id+1),",",-1) AS sell_qty_2,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field41,",",help_topic_id+1),",",-1) AS sell_price_3,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field42,",",help_topic_id+1),",",-1) AS sell_qty_3,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field43,",",help_topic_id+1),",",-1) AS sell_price_4,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field44,",",help_topic_id+1),",",-1) AS sell_qty_4,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field45,",",help_topic_id+1),",",-1) AS sell_price_5,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field46,",",help_topic_id+1),",",-1) AS sell_qty_5,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field47,",",help_topic_id+1),",",-1) AS contrc_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field48,",",help_topic_id+1),",",-1) AS asset_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field49,",",help_topic_id+1),",",-1) AS time_stamp
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


