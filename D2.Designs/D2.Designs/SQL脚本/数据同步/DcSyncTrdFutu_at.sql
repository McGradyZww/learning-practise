DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易期货同步_同步交易组业务资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdfu_Synctdfuac_exgp_busi_capit;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdfu_Synctdfuac_exgp_busi_capit(
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
    
    replace into tb_tdfuac_exgp_busi_capit (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,exch_group_no,asset_acco_no,exch_crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,comm_frozen_amt,comm_unfroz_amt,comm_capt_amt,comm_releas_amt,trade_capt_amt,trade_releas_amt,strike_capt_amt,strike_releas_amt,capt_margin,trade_fee,strike_fee,close_pandl,marked_pandl)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS begin_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS curr_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS unfroz_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS comm_frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS comm_unfroz_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS comm_capt_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS comm_releas_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS trade_capt_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS trade_releas_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS strike_capt_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS strike_releas_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS capt_margin,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS trade_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS strike_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS close_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS marked_pandl
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易期货同步_同步资产账户业务资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdfu_Synctdfuac_asac_busi_capit;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdfu_Synctdfuac_asac_busi_capit(
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
    
    replace into tb_tdfuac_asac_busi_capit (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,asset_acco_no,exch_crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,comm_frozen_amt,comm_unfroz_amt,comm_capt_amt,comm_releas_amt,trade_capt_amt,trade_releas_amt,strike_capt_amt,strike_releas_amt,capt_margin,trade_fee,strike_fee,close_pandl,marked_pandl)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS begin_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS curr_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS unfroz_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS comm_frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS comm_unfroz_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS comm_capt_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS comm_releas_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS trade_capt_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS trade_releas_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS strike_capt_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS strike_releas_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS capt_margin,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS trade_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS strike_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS close_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS marked_pandl
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易期货同步_同步交易组业务持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdfu_Synctdfuac_exgp_busi_posi;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdfu_Synctdfuac_exgp_busi_posi(
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
    
    replace into tb_tdfuac_exgp_busi_posi (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,exch_group_no,asset_acco_no,exch_crncy_type,exch_no,futu_acco_no,contrc_code_no,contrc_type,contrc_unit,lngsht_type,hedge_type,comb_code,begin_qty,curr_qty,frozen_qty,unfroz_qty,comm_frozen_qty,comm_unfroz_qty,comm_capt_qty,comm_releas_qty,trade_frozen_qty,trade_unfroz_qty,trade_capt_qty,trade_releas_qty,strike_releas_qty,pre_comm_capt_qty,today_comm_capt_qty,old_trade_capt_qty,today_trade_capt_qty,pre_strike_capt_qty,today_strike_capt_qty,rece_margin,pre_settle_price,realize_pandl,close_pandl,open_amount)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS futu_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS contrc_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS contrc_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS contrc_unit,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS lngsht_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS hedge_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS comb_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS begin_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS unfroz_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS comm_frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS comm_unfroz_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS comm_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS comm_releas_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS trade_frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS trade_unfroz_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS trade_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS trade_releas_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS strike_releas_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS pre_comm_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS today_comm_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS old_trade_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS today_trade_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS pre_strike_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS today_strike_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field39,",",help_topic_id+1),",",-1) AS rece_margin,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field40,",",help_topic_id+1),",",-1) AS pre_settle_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field41,",",help_topic_id+1),",",-1) AS realize_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field42,",",help_topic_id+1),",",-1) AS close_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field43,",",help_topic_id+1),",",-1) AS open_amount
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易期货同步_同步资产账户业务持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdfu_Synctdfuac_asac_busi_posi;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdfu_Synctdfuac_asac_busi_posi(
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
    
    replace into tb_tdfuac_asac_busi_posi (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,asset_acco_no,exch_crncy_type,exch_no,futu_acco_no,contrc_code_no,contrc_type,contrc_unit,lngsht_type,hedge_type,comb_code,begin_qty,curr_qty,frozen_qty,unfroz_qty,comm_frozen_qty,comm_unfroz_qty,comm_capt_qty,comm_releas_qty,trade_frozen_qty,trade_unfroz_qty,trade_capt_qty,trade_releas_qty,strike_releas_qty,pre_comm_capt_qty,today_comm_capt_qty,old_trade_capt_qty,today_trade_capt_qty,pre_strike_capt_qty,today_strike_capt_qty,rece_margin,pre_settle_price,realize_pandl,close_pandl,open_amount)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS futu_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS contrc_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS contrc_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS contrc_unit,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS lngsht_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS hedge_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS comb_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS begin_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS unfroz_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS comm_frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS comm_unfroz_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS comm_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS comm_releas_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS trade_frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS trade_unfroz_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS trade_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS trade_releas_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS strike_releas_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS pre_comm_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS today_comm_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS old_trade_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS today_trade_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS pre_strike_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS today_strike_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS rece_margin,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field39,",",help_topic_id+1),",",-1) AS pre_settle_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field40,",",help_topic_id+1),",",-1) AS realize_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field41,",",help_topic_id+1),",",-1) AS close_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field42,",",help_topic_id+1),",",-1) AS open_amount
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_交易期货同步_同步交易组持仓明细表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsytdfu_Synctdfuac_exgp_posi_detail;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsytdfu_Synctdfuac_exgp_posi_detail(
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
    
    replace into tb_tdfuac_exgp_posi_detail (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,exch_crncy_type,futu_acco_no,contrc_code_no,contrc_unit,contrc_type,curr_qty,invest_type,lngsht_type,hedge_type,open_posi_date,open_posi_time,open_posi_price,open_posi_qty,open_amount,open_posi_fee,close_posi_fee,trade_capt_qty,strike_capt_qty,marked_sett_price,strike_no,detail_posi_id,rece_margin,close_pandl,marked_pandl)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS futu_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS contrc_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS contrc_unit,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS contrc_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS invest_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS lngsht_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS hedge_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS open_posi_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS open_posi_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS open_posi_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS open_posi_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS open_amount,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS open_posi_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS close_posi_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS trade_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS strike_capt_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS marked_sett_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS strike_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS detail_posi_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS rece_margin,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS close_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS marked_pandl
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


