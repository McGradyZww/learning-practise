DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步交易组业务资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdseac_exgp_busi_capit;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdseac_exgp_busi_capit(
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
    
    replace into tb_tdseac_exgp_busi_capit (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,exch_group_no,asset_acco_no,exch_crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,comm_frozen_amt,comm_unfroz_amt,comm_capt_amt,comm_releas_amt,trade_frozen_amt,trade_unfroz_amt,trade_capt_amt,trade_releas_amt,strike_capt_amt,strike_releas_amt)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS begin_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS curr_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS unfroz_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS comm_frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS comm_unfroz_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS comm_capt_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS comm_releas_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS trade_frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS trade_unfroz_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS trade_capt_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS trade_releas_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS strike_capt_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS strike_releas_amt
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步资产账户业务资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdseac_asac_busi_capit;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdseac_asac_busi_capit(
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
    
    replace into tb_tdseac_asac_busi_capit (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,asset_acco_no,exch_crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,comm_frozen_amt,comm_unfroz_amt,comm_capt_amt,comm_releas_amt,trade_frozen_amt,trade_unfroz_amt,trade_capt_amt,trade_releas_amt,strike_capt_amt,strike_releas_amt)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS begin_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS curr_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS unfroz_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS comm_frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS comm_unfroz_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS comm_capt_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS comm_releas_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS trade_frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS trade_unfroz_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS trade_capt_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS trade_releas_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS strike_capt_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS strike_releas_amt
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步交易组业务持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdseac_exgp_busi_posi;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdseac_exgp_busi_posi(
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
    
    replace into tb_tdseac_exgp_busi_posi (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_type,asset_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,comm_frozen_qty,comm_unfroz_qty,comm_capt_qty,comm_releas_qty,trade_frozen_qty,trade_unfroz_qty,trade_capt_qty,trade_releas_qty,strike_capt_qty,strike_releas_qty,strike_frozen_qty,strike_unfroz_qty,realize_pandl,cost_amt,intrst_cost_amt,intrst_pandl,CreateTime)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS asset_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS begin_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS unfroz_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS comm_frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS comm_unfroz_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS comm_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS comm_releas_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS trade_frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS trade_unfroz_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS trade_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS trade_releas_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS strike_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS strike_releas_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS strike_frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS strike_unfroz_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS realize_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS cost_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS intrst_cost_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS intrst_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS CreateTime
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步资产账户业务持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdseac_asac_busi_posi;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdseac_asac_busi_posi(
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
    
    replace into tb_tdseac_asac_busi_posi (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,comm_frozen_qty,comm_unfroz_qty,comm_capt_qty,comm_releas_qty,trade_frozen_qty,trade_unfroz_qty,trade_capt_qty,trade_releas_qty,strike_capt_qty,strike_releas_qty,strike_frozen_qty,strike_unfroz_qty,realize_pandl,cost_amt,intrst_cost_amt,intrst_pandl,CreateTime)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS asset_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS invest_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS begin_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS unfroz_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS comm_frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS comm_unfroz_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS comm_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS comm_releas_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS trade_frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS trade_unfroz_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS trade_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS trade_releas_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS strike_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS strike_releas_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS strike_frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS strike_unfroz_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS realize_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS cost_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS intrst_cost_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS intrst_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS CreateTime
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步交易组债券质押表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdseac_exgp_bond_impawn;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdseac_exgp_bond_impawn(
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
    
    replace into tb_tdseac_exgp_bond_impawn (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,begin_qty,curr_qty,put_impawn_qty,get_impawn_qty,target_code_no)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS begin_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS put_impawn_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS get_impawn_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS target_code_no
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步资产账户债券质押表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdseac_asac_bond_impawn;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdseac_asac_bond_impawn(
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
    
    replace into tb_tdseac_asac_bond_impawn (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,begin_qty,curr_qty,put_impawn_qty,get_impawn_qty,target_code_no)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS begin_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS put_impawn_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS get_impawn_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS target_code_no
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步指令表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdseap_command;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdseap_command(
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
    
    replace into tb_tdseap_command (row_id,create_date,create_time,update_date,update_time,update_times,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_crncy_type,exch_no,stock_acco_no,stock_code_no,stock_code,target_code_no,trade_code_no,stock_type,asset_type,comm_date,comm_time,comm_batch_no,comm_opor,comm_executor,comm_dir,comm_limit_price,limit_actual_price,comm_qty,comm_amt,order_qty,comm_cancel_qty,strike_amt,strike_qty,comm_frozen_amt,comm_frozen_qty,net_price_flag,par_value,impawn_ratio,intrst_days,bond_accr_intrst,bond_rate_type,capit_reback_days,posi_reback_days,strike_status,comm_status,comm_begin_date,comm_end_date,comm_begin_time,comm_end_time,comm_comple_date,comm_comple_time,comm_appr_date,comm_appr_time,comm_appr_status,comm_appr_oper_no,comm_appr_oper,comm_appr_remark,basket_id,comm_oper_way,exter_comm_flag,comm_comple_flag,strategy_order_qty,strategy_capt_qty,combo_code,target_stock_code,target_stock_code_no)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS oper_mac,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS oper_ip_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS oper_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS oper_func_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS pass_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS out_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS target_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS trade_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS asset_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS comm_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS comm_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS comm_batch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS comm_opor,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS comm_executor,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS comm_dir,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS comm_limit_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS limit_actual_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS comm_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field39,",",help_topic_id+1),",",-1) AS comm_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field40,",",help_topic_id+1),",",-1) AS order_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field41,",",help_topic_id+1),",",-1) AS comm_cancel_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field42,",",help_topic_id+1),",",-1) AS strike_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field43,",",help_topic_id+1),",",-1) AS strike_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field44,",",help_topic_id+1),",",-1) AS comm_frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field45,",",help_topic_id+1),",",-1) AS comm_frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field46,",",help_topic_id+1),",",-1) AS net_price_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field47,",",help_topic_id+1),",",-1) AS par_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field48,",",help_topic_id+1),",",-1) AS impawn_ratio,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field49,",",help_topic_id+1),",",-1) AS intrst_days,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field50,",",help_topic_id+1),",",-1) AS bond_accr_intrst,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field51,",",help_topic_id+1),",",-1) AS bond_rate_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field52,",",help_topic_id+1),",",-1) AS capit_reback_days,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field53,",",help_topic_id+1),",",-1) AS posi_reback_days,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field54,",",help_topic_id+1),",",-1) AS strike_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field55,",",help_topic_id+1),",",-1) AS comm_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field56,",",help_topic_id+1),",",-1) AS comm_begin_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field57,",",help_topic_id+1),",",-1) AS comm_end_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field58,",",help_topic_id+1),",",-1) AS comm_begin_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field59,",",help_topic_id+1),",",-1) AS comm_end_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field60,",",help_topic_id+1),",",-1) AS comm_comple_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field61,",",help_topic_id+1),",",-1) AS comm_comple_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field62,",",help_topic_id+1),",",-1) AS comm_appr_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field63,",",help_topic_id+1),",",-1) AS comm_appr_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field64,",",help_topic_id+1),",",-1) AS comm_appr_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field65,",",help_topic_id+1),",",-1) AS comm_appr_oper_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field66,",",help_topic_id+1),",",-1) AS comm_appr_oper,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field67,",",help_topic_id+1),",",-1) AS comm_appr_remark,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field68,",",help_topic_id+1),",",-1) AS basket_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field69,",",help_topic_id+1),",",-1) AS comm_oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field70,",",help_topic_id+1),",",-1) AS exter_comm_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field71,",",help_topic_id+1),",",-1) AS comm_comple_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field72,",",help_topic_id+1),",",-1) AS strategy_order_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field73,",",help_topic_id+1),",",-1) AS strategy_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field74,",",help_topic_id+1),",",-1) AS combo_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field75,",",help_topic_id+1),",",-1) AS target_stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field76,",",help_topic_id+1),",",-1) AS target_stock_code_no
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步指令流水表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdseap_command_jour;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdseap_command_jour(
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
    
    replace into tb_tdseap_command_jour (row_id,create_date,create_time,update_date,update_time,update_times,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,init_date,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,comm_date,comm_id,jour_occur_field,jour_occur_info,jour_after_occur_info,remark_info,exter_comm_flag)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS oper_mac,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS oper_ip_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS oper_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS oper_func_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS comm_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS comm_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS jour_occur_field,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS jour_occur_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS jour_after_occur_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS remark_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS exter_comm_flag
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步指令分发表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdseap_command_dispense;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdseap_command_dispense(
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
    
    replace into tb_tdseap_command_dispense (row_id,create_date,create_time,update_date,update_time,update_times,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,init_date,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_type,asset_type,comm_date,comm_id,comm_batch_no,comm_dir,comm_status,comm_opor,disp_date,disp_time,before_comm_executor,comm_executor,is_withdraw,disp_flag,disp_remark,exter_comm_flag)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS oper_mac,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS oper_ip_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS oper_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS oper_func_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS asset_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS comm_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS comm_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS comm_batch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS comm_dir,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS comm_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS comm_opor,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS disp_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS disp_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS before_comm_executor,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS comm_executor,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS is_withdraw,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS disp_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS disp_remark,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS exter_comm_flag
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步指令审批表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdseap_command_approve;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdseap_command_approve(
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
    
    replace into tb_tdseap_command_approve (row_id,create_date,create_time,update_date,update_time,update_times,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,init_date,comm_appr_date,comm_appr_time,comm_appr_oper_no,comm_appr_oper,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_type,asset_type,comm_date,comm_id,comm_opor,comm_dir,comm_qty,comm_limit_price,limit_actual_price,comm_begin_date,comm_end_date,comm_begin_time,comm_end_time,comm_appr_status,comm_appr_remark,exter_comm_flag)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS oper_mac,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS oper_ip_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS oper_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS oper_func_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS comm_appr_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS comm_appr_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS comm_appr_oper_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS comm_appr_oper,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS asset_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS comm_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS comm_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS comm_opor,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS comm_dir,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS comm_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS comm_limit_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS limit_actual_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS comm_begin_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS comm_end_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS comm_begin_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS comm_end_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field39,",",help_topic_id+1),",",-1) AS comm_appr_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field40,",",help_topic_id+1),",",-1) AS comm_appr_remark,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field41,",",help_topic_id+1),",",-1) AS exter_comm_flag
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步订单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdsetd_order;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdsetd_order(
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
    
    replace into tb_tdsetd_order (row_id,create_date,create_time,update_date,update_time,update_times,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_crncy_type,exch_no,stock_acco_no,stock_acco,stock_code_no,stock_code,trade_code_no,target_code_no,stock_type,asset_type,external_no,comm_id,comm_batch_no,comm_opor,report_date,report_time,report_no,order_date,order_time,order_batch_no,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,trade_tax,trade_cost_fee,trade_system_use_fee,stock_settle_fee,net_price_flag,intrst_days,par_value,bond_accr_intrst,bond_rate_type,strike_bond_accr_intrst,impawn_ratio,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,cost_calc_type,order_oper_way,exter_comm_flag,record_valid_flag,combo_code,combo_posi_id,strategy_id,sett_flag,target_stock_code,target_stock_code_no)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS oper_mac,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS oper_ip_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS oper_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS oper_func_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS pass_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS out_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS stock_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS trade_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS target_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS asset_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS external_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS comm_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS comm_batch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS comm_opor,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS report_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS report_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS report_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS order_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field39,",",help_topic_id+1),",",-1) AS order_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field40,",",help_topic_id+1),",",-1) AS order_batch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field41,",",help_topic_id+1),",",-1) AS order_dir,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field42,",",help_topic_id+1),",",-1) AS price_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field43,",",help_topic_id+1),",",-1) AS order_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field44,",",help_topic_id+1),",",-1) AS order_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field45,",",help_topic_id+1),",",-1) AS order_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field46,",",help_topic_id+1),",",-1) AS wtdraw_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field47,",",help_topic_id+1),",",-1) AS strike_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field48,",",help_topic_id+1),",",-1) AS strike_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field49,",",help_topic_id+1),",",-1) AS all_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field50,",",help_topic_id+1),",",-1) AS stamp_tax,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field51,",",help_topic_id+1),",",-1) AS trans_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field52,",",help_topic_id+1),",",-1) AS brkage_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field53,",",help_topic_id+1),",",-1) AS SEC_charges,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field54,",",help_topic_id+1),",",-1) AS other_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field55,",",help_topic_id+1),",",-1) AS trade_commis,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field56,",",help_topic_id+1),",",-1) AS other_commis,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field57,",",help_topic_id+1),",",-1) AS trade_tax,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field58,",",help_topic_id+1),",",-1) AS trade_cost_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field59,",",help_topic_id+1),",",-1) AS trade_system_use_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field60,",",help_topic_id+1),",",-1) AS stock_settle_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field61,",",help_topic_id+1),",",-1) AS net_price_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field62,",",help_topic_id+1),",",-1) AS intrst_days,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field63,",",help_topic_id+1),",",-1) AS par_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field64,",",help_topic_id+1),",",-1) AS bond_accr_intrst,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field65,",",help_topic_id+1),",",-1) AS bond_rate_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field66,",",help_topic_id+1),",",-1) AS strike_bond_accr_intrst,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field67,",",help_topic_id+1),",",-1) AS impawn_ratio,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field68,",",help_topic_id+1),",",-1) AS order_frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field69,",",help_topic_id+1),",",-1) AS order_frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field70,",",help_topic_id+1),",",-1) AS rsp_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field71,",",help_topic_id+1),",",-1) AS compli_trig_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field72,",",help_topic_id+1),",",-1) AS remark_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field73,",",help_topic_id+1),",",-1) AS cost_calc_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field74,",",help_topic_id+1),",",-1) AS order_oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field75,",",help_topic_id+1),",",-1) AS exter_comm_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field76,",",help_topic_id+1),",",-1) AS record_valid_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field77,",",help_topic_id+1),",",-1) AS combo_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field78,",",help_topic_id+1),",",-1) AS combo_posi_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field79,",",help_topic_id+1),",",-1) AS strategy_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field80,",",help_topic_id+1),",",-1) AS sett_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field81,",",help_topic_id+1),",",-1) AS target_stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field82,",",help_topic_id+1),",",-1) AS target_stock_code_no
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步通道订单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdsetd_channelorder;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdsetd_channelorder(
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
    
    replace into tb_tdsetd_channelorder (row_id,create_date,create_time,update_date,update_time,update_times,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_crncy_type,exch_no,stock_acco_no,stock_acco,stock_code_no,stock_code,stock_type,external_no,comm_id,comm_opor,report_date,report_time,report_no,order_date,order_time,order_batch_no,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,net_price_flag,bond_accr_intrst,rsp_info,compli_trig_id,remark_info)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS oper_mac,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS oper_ip_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS oper_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS oper_func_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS pass_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS out_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS stock_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS external_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS comm_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS comm_opor,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS report_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS report_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS report_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS order_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS order_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS order_batch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS order_dir,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS price_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field39,",",help_topic_id+1),",",-1) AS order_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field40,",",help_topic_id+1),",",-1) AS order_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field41,",",help_topic_id+1),",",-1) AS order_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field42,",",help_topic_id+1),",",-1) AS wtdraw_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field43,",",help_topic_id+1),",",-1) AS strike_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field44,",",help_topic_id+1),",",-1) AS strike_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field45,",",help_topic_id+1),",",-1) AS net_price_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field46,",",help_topic_id+1),",",-1) AS bond_accr_intrst,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field47,",",help_topic_id+1),",",-1) AS rsp_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field48,",",help_topic_id+1),",",-1) AS compli_trig_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field49,",",help_topic_id+1),",",-1) AS remark_info
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步新股申购表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdsetd_purchaseorder;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdsetd_purchaseorder(
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
    
    replace into tb_tdsetd_purchaseorder (row_id,create_date,create_time,update_date,update_time,update_times,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_crncy_type,exch_no,stock_acco_no,stock_acco,stock_code_no,stock_code,stock_type,report_date,report_time,report_no,order_date,order_time,order_id,order_dir,order_price,order_qty,all_fee,other_fee,trade_commis,other_commis,order_frozen_amt,nav_asset,rsp_info,compli_trig_id,trade_code_no,target_code_no,sett_flag)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS oper_mac,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS oper_ip_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS oper_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS oper_func_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS pass_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS out_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS stock_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS report_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS report_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS report_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS order_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS order_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS order_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS order_dir,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS order_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS order_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS all_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS other_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field39,",",help_topic_id+1),",",-1) AS trade_commis,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field40,",",help_topic_id+1),",",-1) AS other_commis,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field41,",",help_topic_id+1),",",-1) AS order_frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field42,",",help_topic_id+1),",",-1) AS nav_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field43,",",help_topic_id+1),",",-1) AS rsp_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field44,",",help_topic_id+1),",",-1) AS compli_trig_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field45,",",help_topic_id+1),",",-1) AS trade_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field46,",",help_topic_id+1),",",-1) AS target_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field47,",",help_topic_id+1),",",-1) AS sett_flag
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步撤单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdsetd_cancel;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdsetd_cancel(
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
    
    replace into tb_tdsetd_cancel (row_id,create_date,create_time,update_date,update_time,update_times,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_crncy_type,exch_no,stock_acco_no,stock_acco,stock_code_no,stock_code,external_no,wtdraw_batch_no,wtdraw_date,wtdraw_time,order_date,order_id,report_date,report_time,report_no,wtdraw_status,wtdraw_qty,wtdraw_remark,order_price)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS oper_mac,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS oper_ip_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS oper_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS oper_func_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS pass_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS out_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS stock_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS external_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS wtdraw_batch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS wtdraw_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS wtdraw_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS order_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS order_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS report_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS report_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS report_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS wtdraw_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS wtdraw_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS wtdraw_remark,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field39,",",help_topic_id+1),",",-1) AS order_price
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步预埋订单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdsetd_preorder;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdsetd_preorder(
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
    
    replace into tb_tdsetd_preorder (row_id,create_date,create_time,update_date,update_time,update_times,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,init_date,co_no,pd_no,exch_group_no,asset_acco_no,exch_crncy_type,exch_no,stock_acco_no,stock_acco,stock_code_no,stock_code,stock_type,pre_order_date,pre_order_time,pre_order_dir,pre_order_type,pre_order_price,pre_order_qty,pre_order_status,trig_type,trig_price,trig_time,order_date,order_time,order_id)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS oper_mac,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS oper_ip_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS oper_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS oper_func_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS stock_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS pre_order_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS pre_order_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS pre_order_dir,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS pre_order_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS pre_order_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS pre_order_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS pre_order_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS trig_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS trig_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS trig_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS order_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS order_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS order_id
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步篮子订单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdsetd_basketorder;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdsetd_basketorder(
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
    
    replace into tb_tdsetd_basketorder (row_id,create_date,create_time,update_date,update_time,update_times,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,init_date,co_no,pd_no,exch_group_no,asset_acco_no,basket_id,order_date,order_time,order_batch_no,order_dir,basket_trade_type,basket_trade_amt)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS oper_mac,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS oper_ip_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS oper_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS oper_func_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS basket_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS order_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS order_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS order_batch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS order_dir,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS basket_trade_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS basket_trade_amt
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步改单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdsetd_modifyorder;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdsetd_modifyorder(
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
    
    replace into tb_tdsetd_modifyorder (row_id,create_date,create_time,update_date,update_time,update_times,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,exch_no,stock_acco_no,stock_code_no,stock_code,stock_type,asset_type,modi_order_date,modi_order_time,modi_batch_no,order_id,comm_id,order_price,order_qty,order_dir,order_date,order_time,price_type,modi_order_price,modi_order_qty,modi_order_status,modi_price_type,crncy_type,exch_crncy_type,new_order_id,remark_info,order_oper_way)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS oper_mac,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS oper_ip_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS oper_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS oper_func_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS pass_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS asset_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS modi_order_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS modi_order_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS modi_batch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS order_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS comm_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS order_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS order_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS order_dir,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS order_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS order_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS price_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS modi_order_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS modi_order_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field39,",",help_topic_id+1),",",-1) AS modi_order_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field40,",",help_topic_id+1),",",-1) AS modi_price_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field41,",",help_topic_id+1),",",-1) AS crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field42,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field43,",",help_topic_id+1),",",-1) AS new_order_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field44,",",help_topic_id+1),",",-1) AS remark_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field45,",",help_topic_id+1),",",-1) AS order_oper_way
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步待执行订单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdsetd_pendorder;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdsetd_pendorder(
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
    
    replace into tb_tdsetd_pendorder (row_id,create_date,create_time,update_date,update_time,update_times,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_crncy_type,exch_no,stock_acco_no,stock_acco,stock_code_no,stock_code,trade_code_no,target_code_no,stock_type,asset_type,comm_id,comm_batch_no,order_date,order_time,order_batch_no,order_dir,price_type,exec_price_type,price_offset,order_qty,net_price_flag,intrst_days,par_value,bond_accr_intrst,bond_rate_type,impawn_ratio,order_oper_way,external_no,pend_order_status,remark_info)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS oper_mac,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS oper_ip_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS oper_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS oper_func_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS pass_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS out_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS stock_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS trade_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS target_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS asset_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS comm_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS comm_batch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS order_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS order_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS order_batch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS order_dir,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS price_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS exec_price_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field39,",",help_topic_id+1),",",-1) AS price_offset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field40,",",help_topic_id+1),",",-1) AS order_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field41,",",help_topic_id+1),",",-1) AS net_price_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field42,",",help_topic_id+1),",",-1) AS intrst_days,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field43,",",help_topic_id+1),",",-1) AS par_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field44,",",help_topic_id+1),",",-1) AS bond_accr_intrst,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field45,",",help_topic_id+1),",",-1) AS bond_rate_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field46,",",help_topic_id+1),",",-1) AS impawn_ratio,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field47,",",help_topic_id+1),",",-1) AS order_oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field48,",",help_topic_id+1),",",-1) AS external_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field49,",",help_topic_id+1),",",-1) AS pend_order_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field50,",",help_topic_id+1),",",-1) AS remark_info
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步订单回报表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdserp_orderrsp;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdserp_orderrsp(
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
    
    replace into tb_tdserp_orderrsp (row_id,create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco,stock_code,report_date,report_time,report_no,order_date,order_id,order_dir,order_price,order_qty,price_type,order_rsp_status,rsp_info,deal_status,record_valid_flag)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS pass_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS out_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS stock_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS report_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS report_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS report_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS order_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS order_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS order_dir,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS order_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS order_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS price_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS order_rsp_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS rsp_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS deal_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS record_valid_flag
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步成交回报表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdserp_strikersp;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdserp_strikersp(
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
    
    replace into tb_tdserp_strikersp (row_id,create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco,stock_code,report_date,report_no,strike_date,strike_time,strike_no,order_dir,strike_price,strike_qty,strike_amt,strike_deal_type,rsp_info,deal_status,sett_flag,record_valid_flag)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS pass_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS out_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS stock_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS report_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS report_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS strike_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS strike_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS strike_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS order_dir,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS strike_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS strike_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS strike_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS strike_deal_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS rsp_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS deal_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS sett_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS record_valid_flag
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步成交表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdserp_strike;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdserp_strike(
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
    
    replace into tb_tdserp_strike (row_id,create_date,create_time,update_date,update_time,update_times,opor_no,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code,stock_code_no,stock_type,asset_type,comm_id,comm_batch_no,strike_date,strike_time,strike_no,report_date,report_no,order_date,order_time,order_batch_no,order_id,order_dir,order_price,order_qty,strike_qty,strike_price,strike_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,trade_tax,trade_cost_fee,trade_system_use_fee,stock_settle_fee,net_price_flag,intrst_days,par_value,bond_accr_intrst,bond_rate_type,impawn_ratio,strike_bond_accr_intrst,trade_code_no,target_code_no,order_oper_way,exter_comm_flag,record_valid_flag,external_no,combo_code)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS pass_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS out_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS asset_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS comm_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS comm_batch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS strike_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS strike_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS strike_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS report_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS report_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS order_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS order_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS order_batch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS order_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS order_dir,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS order_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS order_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS strike_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS strike_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS strike_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS all_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field39,",",help_topic_id+1),",",-1) AS stamp_tax,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field40,",",help_topic_id+1),",",-1) AS trans_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field41,",",help_topic_id+1),",",-1) AS brkage_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field42,",",help_topic_id+1),",",-1) AS SEC_charges,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field43,",",help_topic_id+1),",",-1) AS other_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field44,",",help_topic_id+1),",",-1) AS trade_commis,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field45,",",help_topic_id+1),",",-1) AS other_commis,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field46,",",help_topic_id+1),",",-1) AS trade_tax,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field47,",",help_topic_id+1),",",-1) AS trade_cost_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field48,",",help_topic_id+1),",",-1) AS trade_system_use_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field49,",",help_topic_id+1),",",-1) AS stock_settle_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field50,",",help_topic_id+1),",",-1) AS net_price_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field51,",",help_topic_id+1),",",-1) AS intrst_days,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field52,",",help_topic_id+1),",",-1) AS par_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field53,",",help_topic_id+1),",",-1) AS bond_accr_intrst,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field54,",",help_topic_id+1),",",-1) AS bond_rate_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field55,",",help_topic_id+1),",",-1) AS impawn_ratio,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field56,",",help_topic_id+1),",",-1) AS strike_bond_accr_intrst,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field57,",",help_topic_id+1),",",-1) AS trade_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field58,",",help_topic_id+1),",",-1) AS target_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field59,",",help_topic_id+1),",",-1) AS order_oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field60,",",help_topic_id+1),",",-1) AS exter_comm_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field61,",",help_topic_id+1),",",-1) AS record_valid_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field62,",",help_topic_id+1),",",-1) AS external_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field63,",",help_topic_id+1),",",-1) AS combo_code
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步操作员阈值设置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdset0_opor_tshold_set;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdset0_opor_tshold_set(
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
    
    replace into tb_tdset0_opor_tshold_set (row_id,create_date,create_time,update_date,update_time,update_times,co_no,opor_no,begin_amt,curr_amt,frozen_amt,opor_warn_tshold,opor_stop_tshold,order_limit_time,per_secu_posi_ratio,posi_limit_time,order_ctrl_qty,order_ctrl_amt,stock_warn_ratio,stock_stop_ratio,stock_warn_amt,stock_stop_amt,trig_oper_type,open_close_permission,risk_oper,fee_calc_type,permit_margin_trade,buy_fee_ratio,sell_fee_ratio,buy_min_fee,sell_min_fee,trade_capt_amt,trade_releas_amt,strike_capt_amt,strike_releas_amt,sum_realize_pandl,amt_diff)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS begin_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS curr_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS opor_warn_tshold,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS opor_stop_tshold,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS order_limit_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS per_secu_posi_ratio,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS posi_limit_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS order_ctrl_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS order_ctrl_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS stock_warn_ratio,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS stock_stop_ratio,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS stock_warn_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS stock_stop_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS trig_oper_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS open_close_permission,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS risk_oper,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS fee_calc_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS permit_margin_trade,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS buy_fee_ratio,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS sell_fee_ratio,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS buy_min_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS sell_min_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS trade_capt_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS trade_releas_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS strike_capt_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS strike_releas_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS sum_realize_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS amt_diff
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步操作员参数设置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdset0_opor_param_set;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdset0_opor_param_set(
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
    
    replace into tb_tdset0_opor_param_set (row_id,create_date,create_time,update_date,update_time,update_times,co_no,opor_no,config_no,config_value,config_name,config_memo)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS config_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS config_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS config_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS config_memo
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步证券持仓明细表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdset0_stock_posi_detail;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdset0_stock_posi_detail(
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
    
    replace into tb_tdset0_stock_posi_detail (row_id,create_date,create_time,update_date,update_time,update_times,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code,stock_acco_no,stock_code_no,lngsht_type,curr_qty,open_posi_date,open_posi_time,open_posi_price,open_posi_value,open_posi_fee,close_posi_qty,close_posi_date,close_posi_time,close_posi_market_value,close_posi_fee,strike_no,realize_pandl,over_night_pandl,posi_status,remark_info)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS lngsht_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS open_posi_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS open_posi_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS open_posi_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS open_posi_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS open_posi_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS close_posi_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS close_posi_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS close_posi_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS close_posi_market_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS close_posi_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS strike_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS realize_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS over_night_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS posi_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS remark_info
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步证券平仓成交明细表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdset0_close_posi_strike_detail;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdset0_close_posi_strike_detail(
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
    
    replace into tb_tdset0_close_posi_strike_detail (row_id,create_date,create_time,update_date,update_time,update_times,opor_no,init_date,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,lngsht_type,detail_posi_id,strike_no,close_posi_date,close_posi_time,close_posi_price,close_posi_qty,close_posi_market_value,close_posi_fee,realize_pandl)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS lngsht_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS detail_posi_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS strike_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS close_posi_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS close_posi_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS close_posi_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS close_posi_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS close_posi_market_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS close_posi_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS realize_pandl
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步操作员券源设置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdset0_opor_stock_source;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdset0_opor_stock_source(
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
    
    replace into tb_tdset0_opor_stock_source (row_id,create_date,create_time,update_date,update_time,update_times,co_no,opor_no,pd_no,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no,stock_code,exch_no,begin_qty,source_stock_qty,single_limit_qty,assigned_qty,trade_releas_qty,trade_capt_qty,strike_releas_qty,strike_capt_qty,total_realize_pandl,over_night_pandl,sum_realize_pandl,total_open_posi_fee,total_close_posi_fee,out_order_releas_qty,out_order_capt_qty,out_strike_releas_qty,out_strike_capt_qty,diff_qty,remark_info)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS begin_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS source_stock_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS single_limit_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS assigned_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS trade_releas_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS trade_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS strike_releas_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS strike_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS total_realize_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS over_night_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS sum_realize_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS total_open_posi_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS total_close_posi_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS out_order_releas_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS out_order_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS out_strike_releas_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS out_strike_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS diff_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS remark_info
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易证券同步_同步证券持仓汇总表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdse_Synctdset0_stock_posi_sum;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdse_Synctdset0_stock_posi_sum(
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
    
    replace into tb_tdset0_stock_posi_sum (row_id,create_date,create_time,update_date,update_time,update_times,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code,stock_acco_no,stock_code_no,total_long_curr_qty,total_short_curr_qty,total_long_open_posi_value,total_short_open_posi_value,total_long_open_posi_fee,total_short_open_posi_fee,total_long_close_posi_value,total_short_close_posi_value,total_long_close_posi_qty,total_short_close_posi_qty,total_long_close_posi_fee,total_short_close_posi_fee,total_realize_pandl,long_curr_qty,short_curr_qty,long_open_posi_value,short_open_posi_value,long_open_posi_fee,short_open_posi_fee,long_close_posi_qty,short_close_posi_qty,long_close_posi_value,short_close_posi_value,long_close_posi_fee,short_close_posi_fee,realize_pandl,over_night_pandl,open_posi_date,open_posi_time)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS total_long_curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS total_short_curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS total_long_open_posi_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS total_short_open_posi_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS total_long_open_posi_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS total_short_open_posi_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS total_long_close_posi_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS total_short_close_posi_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS total_long_close_posi_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS total_short_close_posi_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS total_long_close_posi_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS total_short_close_posi_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS total_realize_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS long_curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS short_curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS long_open_posi_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS short_open_posi_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS long_open_posi_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS short_open_posi_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS long_close_posi_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS short_close_posi_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS long_close_posi_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS short_close_posi_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field39,",",help_topic_id+1),",",-1) AS long_close_posi_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field40,",",help_topic_id+1),",",-1) AS short_close_posi_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field41,",",help_topic_id+1),",",-1) AS realize_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field42,",",help_topic_id+1),",",-1) AS over_night_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field43,",",help_topic_id+1),",",-1) AS open_posi_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field44,",",help_topic_id+1),",",-1) AS open_posi_time
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


