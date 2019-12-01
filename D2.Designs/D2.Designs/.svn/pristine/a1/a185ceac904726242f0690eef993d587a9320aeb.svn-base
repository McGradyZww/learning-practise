DELIMITER ;;
use db_dc;;

# 原子_数据同步_产品证券同步_同步资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypse_SyncAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypse_SyncAsacPosi(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* replace into tb_pdsepo_asac_posi ({记录序号}, */
    replace into tb_pdsepo_asac_posi (row_id,

    /* {机构编号}, */
    co_no,

    /* {产品编号}, */
    pd_no,

    /* {资产账户编号}, */
    asset_acco_no,

    /* {市场编号}, */
    exch_no,

    /* {股东代码编号}, */
    stock_acco_no,

    /* {证券代码编号}, */
    stock_code_no,

    /* {证券类型}, */
    stock_type,

    /* {资产类型}, */
    asset_type,

    /* {期初数量}, */
    begin_qty,

    /* {当前数量}, */
    curr_qty,

    /* {冻结数量}, */
    frozen_qty,

    /* {解冻数量}, */
    unfroz_qty,

    /* {成本金额}, */
    cost_amt,

    /* {实现盈亏}, */
    realize_pandl,

    /* {利息成本金额}, */
    intrst_cost_amt,

    /* {利息收益}) */
    intrst_pandl)
    select

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段1#,',',help_topic_id+1),',',-1) AS {记录序号}, */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,',',help_topic_id+1),',',-1) AS row_id,

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段2#,',',help_topic_id+1),',',-1) AS {机构编号}, */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,',',help_topic_id+1),',',-1) AS co_no,

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段3#,',',help_topic_id+1),',',-1) AS {产品编号}, */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,',',help_topic_id+1),',',-1) AS pd_no,

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段4#,',',help_topic_id+1),',',-1) AS {资产账户编号}, */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,',',help_topic_id+1),',',-1) AS asset_acco_no,

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段5#,',',help_topic_id+1),',',-1) AS {市场编号}, */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,',',help_topic_id+1),',',-1) AS exch_no,

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段6#,',',help_topic_id+1),',',-1) AS {股东代码编号}, */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,',',help_topic_id+1),',',-1) AS stock_acco_no,

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段7#,',',help_topic_id+1),',',-1) AS {证券代码编号}, */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,',',help_topic_id+1),',',-1) AS stock_code_no,

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段8#,',',help_topic_id+1),',',-1) AS {证券类型}, */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,',',help_topic_id+1),',',-1) AS stock_type,

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段9#,',',help_topic_id+1),',',-1) AS {资产类型}, */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,',',help_topic_id+1),',',-1) AS asset_type,

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段10#,',',help_topic_id+1),',',-1) AS {期初数量}, */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,',',help_topic_id+1),',',-1) AS begin_qty,

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段11#,',',help_topic_id+1),',',-1) AS {当前数量}, */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,',',help_topic_id+1),',',-1) AS curr_qty,

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段12#,',',help_topic_id+1),',',-1) AS {冻结数量}, */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,',',help_topic_id+1),',',-1) AS frozen_qty,

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段13#,',',help_topic_id+1),',',-1) AS {解冻数量}, */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,',',help_topic_id+1),',',-1) AS unfroz_qty,

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段14#,',',help_topic_id+1),',',-1) AS {成本金额}, */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,',',help_topic_id+1),',',-1) AS cost_amt,

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段15#,',',help_topic_id+1),',',-1) AS {实现盈亏}, */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,',',help_topic_id+1),',',-1) AS realize_pandl,

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段16#,',',help_topic_id+1),',',-1) AS {利息成本金额}, */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,',',help_topic_id+1),',',-1) AS intrst_cost_amt,

    /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段17#,',',help_topic_id+1),',',-1) AS {利息收益} */
    SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,',',help_topic_id+1),',',-1) AS intrst_pandl
    FROM mysql.help_topic

     /* WHERE LENGTH(@同步字段1#) > 0 and (help_topic_id < LENGTH(@同步字段1#)-LENGTH(REPLACE(@同步字段1#,',',''))+1) */
     WHERE LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,',',''))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_产品证券同步_同步资产账户资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypse_SyncAsacAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypse_SyncAsacAsset(
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
    
    replace into tb_pdsepo_asac_posi (row_id,create_date,create_time,update_date,update_time,update_times,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_crncy_type,exch_no,stock_acco_no,stock_acco,stock_code_no,stock_code,trade_code_no,target_code_no,stock_type,asset_type,external_no,comm_id,comm_batch_no,comm_opor,report_date,report_time,report_no,order_date,order_time,order_batch_no,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,trade_tax,trade_cost_fee,trade_system_use_fee,stock_settle_fee,net_price_flag,intrst_days,par_value,bond_accr_intrst,bond_rate_type,strike_bond_accr_intrst,impawn_ratio,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,cost_calc_type,order_oper_way,exter_comm_flag,record_valid_flag,combo_code,combo_posi_id,strategy_id,sett_flag,target_stock_code,target_stock_code_no)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS opor_co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS opor_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS oper_mac,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS oper_ip_addr,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS oper_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS oper_func_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS pass_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS out_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS exch_crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS stock_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS trade_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS target_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS asset_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field31,",",help_topic_id+1),",",-1) AS external_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field32,",",help_topic_id+1),",",-1) AS comm_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field33,",",help_topic_id+1),",",-1) AS comm_batch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field34,",",help_topic_id+1),",",-1) AS comm_opor,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field35,",",help_topic_id+1),",",-1) AS report_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field36,",",help_topic_id+1),",",-1) AS report_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field37,",",help_topic_id+1),",",-1) AS report_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field38,",",help_topic_id+1),",",-1) AS order_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field39,",",help_topic_id+1),",",-1) AS order_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field40,",",help_topic_id+1),",",-1) AS order_batch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field41,",",help_topic_id+1),",",-1) AS order_dir,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field42,",",help_topic_id+1),",",-1) AS price_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field43,",",help_topic_id+1),",",-1) AS order_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field44,",",help_topic_id+1),",",-1) AS order_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field45,",",help_topic_id+1),",",-1) AS order_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field46,",",help_topic_id+1),",",-1) AS wtdraw_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field47,",",help_topic_id+1),",",-1) AS strike_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field48,",",help_topic_id+1),",",-1) AS strike_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field49,",",help_topic_id+1),",",-1) AS all_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field50,",",help_topic_id+1),",",-1) AS stamp_tax,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field51,",",help_topic_id+1),",",-1) AS trans_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field52,",",help_topic_id+1),",",-1) AS brkage_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field53,",",help_topic_id+1),",",-1) AS SEC_charges,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field54,",",help_topic_id+1),",",-1) AS other_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field55,",",help_topic_id+1),",",-1) AS trade_commis,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field56,",",help_topic_id+1),",",-1) AS other_commis,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field57,",",help_topic_id+1),",",-1) AS trade_tax,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field58,",",help_topic_id+1),",",-1) AS trade_cost_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field59,",",help_topic_id+1),",",-1) AS trade_system_use_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field60,",",help_topic_id+1),",",-1) AS stock_settle_fee,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field61,",",help_topic_id+1),",",-1) AS net_price_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field62,",",help_topic_id+1),",",-1) AS intrst_days,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field63,",",help_topic_id+1),",",-1) AS par_value,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field64,",",help_topic_id+1),",",-1) AS bond_accr_intrst,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field65,",",help_topic_id+1),",",-1) AS bond_rate_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field66,",",help_topic_id+1),",",-1) AS strike_bond_accr_intrst,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field67,",",help_topic_id+1),",",-1) AS impawn_ratio,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field68,",",help_topic_id+1),",",-1) AS order_frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field69,",",help_topic_id+1),",",-1) AS order_frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field70,",",help_topic_id+1),",",-1) AS rsp_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field71,",",help_topic_id+1),",",-1) AS compli_trig_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field72,",",help_topic_id+1),",",-1) AS remark_info,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field73,",",help_topic_id+1),",",-1) AS cost_calc_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field74,",",help_topic_id+1),",",-1) AS order_oper_way,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field75,",",help_topic_id+1),",",-1) AS exter_comm_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field76,",",help_topic_id+1),",",-1) AS record_valid_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field77,",",help_topic_id+1),",",-1) AS combo_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field78,",",help_topic_id+1),",",-1) AS combo_posi_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field79,",",help_topic_id+1),",",-1) AS strategy_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field80,",",help_topic_id+1),",",-1) AS sett_flag,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field81,",",help_topic_id+1),",",-1) AS target_stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field82,",",help_topic_id+1),",",-1) AS target_stock_code_no FROM mysql.help_topic WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_产品证券同步_同步证券账户信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypse_Syncpdseac_secu_acco;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypse_Syncpdseac_secu_acco(
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
    
    replace into tb_pdseac_secu_acco (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,asset_acco_no,stock_acco_no,exch_no,stock_acco,stock_acco_name,stock_acco_status,stock_acco_apoint_status,allow_stock_type,busi_limit_str,remark_info)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS stock_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS stock_acco_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS stock_acco_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS stock_acco_apoint_status,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS allow_stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS busi_limit_str,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS remark_info
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_产品证券同步_同步交易组资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypse_Syncpdseca_exgp_capit;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypse_Syncpdseca_exgp_capit(
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
    
    replace into tb_pdseca_exgp_capit (row_id,create_date,create_time,update_date,update_time,co_no,pd_no,asset_acco_no,exch_group_no,crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_rece_amt,total_payab_amt,total_change_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS begin_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS curr_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS unfroz_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS pre_settle_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS shsz_avail_change_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS hk_avail_change_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS amt_check_diff,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS T_hk_buy_total_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS T_hk_sell_total_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS T1_hk_buy_total_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS T1_hk_sell_total_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS total_rece_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS total_payab_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS total_change_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS realize_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS intrst_rate,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS intrst_base_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS pre_entry_intrst_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS update_times
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_产品证券同步_同步交易组资产表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypse_Syncpdseca_exgp_asset;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypse_Syncpdseca_exgp_asset(
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
    
    replace into tb_pdseca_exgp_asset (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,exch_group_no,crncy_type,begin_nav,nav_asset,cash_asset,stock_asset,fund_asset,bond_asset,repo_asset,other_asset,hk_thrgh_stock_asset)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS begin_nav,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS nav_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS cash_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS stock_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS fund_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS bond_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS repo_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS other_asset,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS hk_thrgh_stock_asset
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_产品证券同步_同步资产账户资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypse_Syncpdseca_asac_capit;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypse_Syncpdseca_asac_capit(
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
    
    replace into tb_pdseca_asac_capit (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,asset_acco_no,crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,total_rece_amt,total_payab_amt,total_change_amt,realize_pandl,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS begin_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS curr_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS unfroz_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS pre_settle_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS total_rece_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS total_payab_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS total_change_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS realize_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS shsz_avail_change_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS hk_avail_change_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS amt_check_diff,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS T_hk_buy_total_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS T_hk_sell_total_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS T1_hk_buy_total_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS T1_hk_sell_total_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS intrst_rate,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS intrst_base_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS pre_entry_intrst_amt
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_产品证券同步_同步外部资产账户资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypse_Syncpdseca_out_asac_capit;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypse_Syncpdseca_out_asac_capit(
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
    
    replace into tb_pdseca_out_asac_capit (row_id,create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco_no,pass_no,out_acco,crncy_type,out_curr_amt,out_enable_amt,out_frozen_amt,out_unfroz_amt)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS pass_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS out_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS out_curr_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS out_enable_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS out_frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS out_unfroz_amt
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_产品证券同步_同步估值外部资产账户资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypse_Syncpdseca_evalu_out_asac_capit;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypse_Syncpdseca_evalu_out_asac_capit(
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
    
    replace into tb_pdseca_evalu_out_asac_capit (row_id,create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco_no,pass_no,out_acco,crncy_type,out_curr_amt,out_enable_amt,out_frozen_amt,out_unfroz_amt)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS pass_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS out_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS crncy_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS out_curr_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS out_enable_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS out_frozen_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS out_unfroz_amt
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_产品证券同步_同步交易组持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypse_Syncpdsepo_exgp_posi;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypse_Syncpdsepo_exgp_posi(
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
    
    replace into tb_pdsepo_exgp_posi (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_type,asset_type,invest_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS asset_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS invest_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS begin_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS pre_settle_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS unfroz_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS posi_qty_check_diff,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS cost_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS realize_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS intrst_cost_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS intrst_pandl
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_产品证券同步_同步交易组债券质押表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypse_Syncpdsepo_exgp_bond_pledge;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypse_Syncpdsepo_exgp_bond_pledge(
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
    
    replace into tb_pdsepo_exgp_bond_pledge (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,begin_qty,curr_qty,put_impawn_qty,get_impawn_qty)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS begin_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS put_impawn_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS get_impawn_qty
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_产品证券同步_同步资产账户持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypse_Syncpdsepo_asac_posi;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypse_Syncpdsepo_asac_posi(
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
    
    replace into tb_pdsepo_asac_posi (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_type,asset_type,invest_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS stock_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS asset_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS invest_type,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS begin_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS pre_settle_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS unfroz_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS posi_qty_check_diff,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS cost_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS realize_pandl,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS intrst_cost_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS intrst_pandl
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_产品证券同步_同步资产账户债券质押表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypse_Syncpdsepo_asac_bond_pledge;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypse_Syncpdsepo_asac_bond_pledge(
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
    
    replace into tb_pdsepo_asac_bond_pledge (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,begin_qty,curr_qty,put_impawn_qty,get_impawn_qty)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS begin_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS put_impawn_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS get_impawn_qty
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_产品证券同步_同步债券回购表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypse_Syncpdsepo_bond_repo;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypse_Syncpdsepo_bond_repo(
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
    
    replace into tb_pdsepo_bond_repo (row_id,create_date,create_time,update_date,update_time,update_times,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_code,target_code_no,target_code,order_dir,repo_qty,repo_amt,repo_rate,repo_trade_date,repo_order_id,repo_strike_id,repo_days,repo_cale_days,repo_back_date,repo_back_amt,repo_back_intrst,repo_back_trade_date,repo_status)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS target_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS target_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS order_dir,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS repo_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS repo_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS repo_rate,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS repo_trade_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS repo_order_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS repo_strike_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field24,",",help_topic_id+1),",",-1) AS repo_days,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field25,",",help_topic_id+1),",",-1) AS repo_cale_days,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field26,",",help_topic_id+1),",",-1) AS repo_back_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field27,",",help_topic_id+1),",",-1) AS repo_back_amt,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field28,",",help_topic_id+1),",",-1) AS repo_back_intrst,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field29,",",help_topic_id+1),",",-1) AS repo_back_trade_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field30,",",help_topic_id+1),",",-1) AS repo_status
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_产品证券同步_同步外部资产账户持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypse_Syncpdsepo_out_asac_posi;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypse_Syncpdsepo_out_asac_posi(
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
    
    replace into tb_pdsepo_out_asac_posi (row_id,create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_acco,stock_code_no,stock_code,stock_name,out_cost_price,out_curr_qty,out_enable_qty,out_frozen_qty,out_unfroz_qty)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS pass_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS out_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS stock_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS stock_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS out_cost_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS out_curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS out_enable_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS out_frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS out_unfroz_qty
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_产品证券同步_同步估值外部资产账户持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypse_Syncpdsepo_evalu_out_asac_posi;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypse_Syncpdsepo_evalu_out_asac_posi(
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
    
    replace into tb_pdsepo_evalu_out_asac_posi (row_id,create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_acco,stock_code_no,stock_code,stock_name,out_cost_price,out_curr_qty,out_enable_qty,out_frozen_qty,out_unfroz_qty)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS init_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS pass_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS out_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS stock_acco,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS stock_code,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS stock_name,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS out_cost_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS out_curr_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field21,",",help_topic_id+1),",",-1) AS out_enable_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field22,",",help_topic_id+1),",",-1) AS out_frozen_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field23,",",help_topic_id+1),",",-1) AS out_unfroz_qty
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_dc;;

# 原子_数据同步_产品证券同步_同步大宗交易持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_dcsypse_Syncpdsepo_block_trade_posi;;
DELIMITER ;;
CREATE PROCEDURE pra_dcsypse_Syncpdsepo_block_trade_posi(
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
    
    replace into tb_pdsepo_block_trade_posi (row_id,create_date,create_time,update_date,update_time,update_times,posi_id,co_no,pd_no,asset_acco_no,exch_group_no,exch_no,stock_acco_no,stock_code_no,strike_qty,strike_price,fair_price,strike_date,release_date,deal_status)
    select SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS create_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS create_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS update_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS update_time,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS update_times,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS posi_id,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS co_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS pd_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS asset_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS exch_group_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS exch_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS stock_acco_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field14,",",help_topic_id+1),",",-1) AS stock_code_no,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field15,",",help_topic_id+1),",",-1) AS strike_qty,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field16,",",help_topic_id+1),",",-1) AS strike_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field17,",",help_topic_id+1),",",-1) AS fair_price,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field18,",",help_topic_id+1),",",-1) AS strike_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field19,",",help_topic_id+1),",",-1) AS release_date,SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field20,",",help_topic_id+1),",",-1) AS deal_status
    FROM mysql.help_topic
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


