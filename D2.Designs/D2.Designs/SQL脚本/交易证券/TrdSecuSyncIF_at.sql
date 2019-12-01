DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_同步接口_获取同步时间
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_GetSyncTime;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_GetSyncTime(
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
    

      /* [获取机器日期][@机器日期#] */
      select date_format(curdate(),'%Y%m%d') into v_mach_date;


      /* [获取机器时间][@机器时间#] */
      select date_format(curtime(),'%H%i%s') into v_mach_time;


      /* select sync_date,sync_time into @更新日期#,@更新时间# from tb_base_synctime where table_name = @查询表名#  limit 1  ; */
      select sync_date,sync_time into v_update_date,v_update_time from tb_base_synctime where table_name = v_qry_table  limit 1  ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_update_date = v_update_date;
    SET p_update_time = v_update_time;
    SET p_mach_date = v_mach_date;
    SET p_mach_time = v_mach_time;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_同步接口_更新同步时间
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_UpdateSyncTime;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_UpdateSyncTime(
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
    

      /* [获取机器日期][@机器日期#] */
      select date_format(curdate(),'%Y%m%d') into v_mach_date;


      /* [获取机器时间][@机器时间#] */
      select date_format(curtime(),'%H%i%s') into v_mach_time;


      /* update tb_base_synctime set  sync_date=@更新日期#,sync_time =@更新时间#  where table_name = @查询表名#  limit 1  ; */
      update tb_base_synctime set  sync_date=v_update_date,sync_time =v_update_time  where table_name = v_qry_table  limit 1  ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_mach_date = v_mach_date;
    SET p_mach_time = v_mach_time;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_同步接口_同步交易组业务资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdseac_exgp_busi_capit;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdseac_exgp_busi_capit(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(exch_crncy_type),GROUP_CONCAT(begin_amt),GROUP_CONCAT(curr_amt),GROUP_CONCAT(frozen_amt),GROUP_CONCAT(unfroz_amt),GROUP_CONCAT(comm_frozen_amt),GROUP_CONCAT(comm_unfroz_amt),GROUP_CONCAT(comm_capt_amt),GROUP_CONCAT(comm_releas_amt),GROUP_CONCAT(trade_frozen_amt),GROUP_CONCAT(trade_unfroz_amt),GROUP_CONCAT(trade_capt_amt),GROUP_CONCAT(trade_releas_amt),GROUP_CONCAT(strike_capt_amt),GROUP_CONCAT(strike_releas_amt)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25

    /* from (select * from tb_tdseac_exgp_busi_capit where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdseac_exgp_busi_capit where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步资产账户业务资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdseac_asac_busi_capit;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdseac_asac_busi_capit(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(exch_crncy_type),GROUP_CONCAT(begin_amt),GROUP_CONCAT(curr_amt),GROUP_CONCAT(frozen_amt),GROUP_CONCAT(unfroz_amt),GROUP_CONCAT(comm_frozen_amt),GROUP_CONCAT(comm_unfroz_amt),GROUP_CONCAT(comm_capt_amt),GROUP_CONCAT(comm_releas_amt),GROUP_CONCAT(trade_frozen_amt),GROUP_CONCAT(trade_unfroz_amt),GROUP_CONCAT(trade_capt_amt),GROUP_CONCAT(trade_releas_amt),GROUP_CONCAT(strike_capt_amt),GROUP_CONCAT(strike_releas_amt)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24

    /* from (select * from tb_tdseac_asac_busi_capit where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdseac_asac_busi_capit where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步交易组业务持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdseac_exgp_busi_posi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdseac_exgp_busi_posi(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(stock_type),GROUP_CONCAT(asset_type),GROUP_CONCAT(begin_qty),GROUP_CONCAT(curr_qty),GROUP_CONCAT(frozen_qty),GROUP_CONCAT(unfroz_qty),GROUP_CONCAT(comm_frozen_qty),GROUP_CONCAT(comm_unfroz_qty),GROUP_CONCAT(comm_capt_qty),GROUP_CONCAT(comm_releas_qty),GROUP_CONCAT(trade_frozen_qty),GROUP_CONCAT(trade_unfroz_qty),GROUP_CONCAT(trade_capt_qty),GROUP_CONCAT(trade_releas_qty),GROUP_CONCAT(strike_capt_qty),GROUP_CONCAT(strike_releas_qty),GROUP_CONCAT(strike_frozen_qty),GROUP_CONCAT(strike_unfroz_qty),GROUP_CONCAT(realize_pandl),GROUP_CONCAT(cost_amt),GROUP_CONCAT(intrst_cost_amt),GROUP_CONCAT(intrst_pandl),GROUP_CONCAT(CreateTime)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32#,@同步字段33#,@同步字段34#,@同步字段35#,@同步字段36# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32,v_sync_field33,v_sync_field34,v_sync_field35,v_sync_field36

    /* from (select * from tb_tdseac_exgp_busi_posi where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdseac_exgp_busi_posi where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步资产账户业务持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdseac_asac_busi_posi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdseac_asac_busi_posi(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(stock_type),GROUP_CONCAT(asset_type),GROUP_CONCAT(invest_type),GROUP_CONCAT(begin_qty),GROUP_CONCAT(curr_qty),GROUP_CONCAT(frozen_qty),GROUP_CONCAT(unfroz_qty),GROUP_CONCAT(comm_frozen_qty),GROUP_CONCAT(comm_unfroz_qty),GROUP_CONCAT(comm_capt_qty),GROUP_CONCAT(comm_releas_qty),GROUP_CONCAT(trade_frozen_qty),GROUP_CONCAT(trade_unfroz_qty),GROUP_CONCAT(trade_capt_qty),GROUP_CONCAT(trade_releas_qty),GROUP_CONCAT(strike_capt_qty),GROUP_CONCAT(strike_releas_qty),GROUP_CONCAT(strike_frozen_qty),GROUP_CONCAT(strike_unfroz_qty),GROUP_CONCAT(realize_pandl),GROUP_CONCAT(cost_amt),GROUP_CONCAT(intrst_cost_amt),GROUP_CONCAT(intrst_pandl),GROUP_CONCAT(CreateTime)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32#,@同步字段33#,@同步字段34#,@同步字段35#,@同步字段36# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32,v_sync_field33,v_sync_field34,v_sync_field35,v_sync_field36

    /* from (select * from tb_tdseac_asac_busi_posi where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdseac_asac_busi_posi where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步交易组债券质押表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdseac_exgp_bond_impawn;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdseac_exgp_bond_impawn(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(begin_qty),GROUP_CONCAT(curr_qty),GROUP_CONCAT(put_impawn_qty),GROUP_CONCAT(get_impawn_qty),GROUP_CONCAT(target_code_no)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18

    /* from (select * from tb_tdseac_exgp_bond_impawn where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdseac_exgp_bond_impawn where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步资产账户债券质押表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdseac_asac_bond_impawn;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdseac_asac_bond_impawn(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(begin_qty),GROUP_CONCAT(curr_qty),GROUP_CONCAT(put_impawn_qty),GROUP_CONCAT(get_impawn_qty),GROUP_CONCAT(target_code_no)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17

    /* from (select * from tb_tdseac_asac_bond_impawn where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdseac_asac_bond_impawn where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步指令表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdseap_command;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdseap_command(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(opor_co_no),GROUP_CONCAT(opor_no),GROUP_CONCAT(oper_mac),GROUP_CONCAT(oper_ip_addr),GROUP_CONCAT(oper_info),GROUP_CONCAT(oper_way),GROUP_CONCAT(oper_func_code),GROUP_CONCAT(init_date),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(pass_no),GROUP_CONCAT(out_acco),GROUP_CONCAT(exch_crncy_type),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(stock_code),GROUP_CONCAT(target_code_no),GROUP_CONCAT(trade_code_no),GROUP_CONCAT(stock_type),GROUP_CONCAT(asset_type),GROUP_CONCAT(comm_date),GROUP_CONCAT(comm_time),GROUP_CONCAT(comm_batch_no),GROUP_CONCAT(comm_opor),GROUP_CONCAT(comm_executor),GROUP_CONCAT(comm_dir),GROUP_CONCAT(comm_limit_price),GROUP_CONCAT(limit_actual_price),GROUP_CONCAT(comm_qty),GROUP_CONCAT(comm_amt),GROUP_CONCAT(order_qty),GROUP_CONCAT(comm_cancel_qty),GROUP_CONCAT(strike_amt),GROUP_CONCAT(strike_qty),GROUP_CONCAT(comm_frozen_amt),GROUP_CONCAT(comm_frozen_qty),GROUP_CONCAT(net_price_flag),GROUP_CONCAT(par_value),GROUP_CONCAT(impawn_ratio),GROUP_CONCAT(intrst_days),GROUP_CONCAT(bond_accr_intrst),GROUP_CONCAT(bond_rate_type),GROUP_CONCAT(capit_reback_days),GROUP_CONCAT(posi_reback_days),GROUP_CONCAT(strike_status),GROUP_CONCAT(comm_status),GROUP_CONCAT(comm_begin_date),GROUP_CONCAT(comm_end_date),GROUP_CONCAT(comm_begin_time),GROUP_CONCAT(comm_end_time),GROUP_CONCAT(comm_comple_date),GROUP_CONCAT(comm_comple_time),GROUP_CONCAT(comm_appr_date),GROUP_CONCAT(comm_appr_time),GROUP_CONCAT(comm_appr_status),GROUP_CONCAT(comm_appr_oper_no),GROUP_CONCAT(comm_appr_oper),GROUP_CONCAT(comm_appr_remark),GROUP_CONCAT(basket_id),GROUP_CONCAT(comm_oper_way),GROUP_CONCAT(exter_comm_flag),GROUP_CONCAT(comm_comple_flag),GROUP_CONCAT(strategy_order_qty),GROUP_CONCAT(strategy_capt_qty),GROUP_CONCAT(combo_code),GROUP_CONCAT(target_stock_code),GROUP_CONCAT(target_stock_code_no)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32#,@同步字段33#,@同步字段34#,@同步字段35#,@同步字段36#,@同步字段37#,@同步字段38#,@同步字段39#,@同步字段40#,@同步字段41#,@同步字段42#,@同步字段43#,@同步字段44#,@同步字段45#,@同步字段46#,@同步字段47#,@同步字段48#,@同步字段49#,@同步字段50#,@同步字段51#,@同步字段52#,@同步字段53#,@同步字段54#,@同步字段55#,@同步字段56#,@同步字段57#,@同步字段58#,@同步字段59#,@同步字段60#,@同步字段61#,@同步字段62#,@同步字段63#,@同步字段64#,@同步字段65#,@同步字段66#,@同步字段67#,@同步字段68#,@同步字段69#,@同步字段70#,@同步字段71#,@同步字段72#,@同步字段73#,@同步字段74#,@同步字段75#,@同步字段76# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32,v_sync_field33,v_sync_field34,v_sync_field35,v_sync_field36,v_sync_field37,v_sync_field38,v_sync_field39,v_sync_field40,v_sync_field41,v_sync_field42,v_sync_field43,v_sync_field44,v_sync_field45,v_sync_field46,v_sync_field47,v_sync_field48,v_sync_field49,v_sync_field50,v_sync_field51,v_sync_field52,v_sync_field53,v_sync_field54,v_sync_field55,v_sync_field56,v_sync_field57,v_sync_field58,v_sync_field59,v_sync_field60,v_sync_field61,v_sync_field62,v_sync_field63,v_sync_field64,v_sync_field65,v_sync_field66,v_sync_field67,v_sync_field68,v_sync_field69,v_sync_field70,v_sync_field71,v_sync_field72,v_sync_field73,v_sync_field74,v_sync_field75,v_sync_field76

    /* from (select * from tb_tdseap_command where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdseap_command where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步指令流水表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdseap_command_jour;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdseap_command_jour(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(opor_co_no),GROUP_CONCAT(opor_no),GROUP_CONCAT(oper_mac),GROUP_CONCAT(oper_ip_addr),GROUP_CONCAT(oper_info),GROUP_CONCAT(oper_way),GROUP_CONCAT(oper_func_code),GROUP_CONCAT(init_date),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(comm_date),GROUP_CONCAT(comm_id),GROUP_CONCAT(jour_occur_field),GROUP_CONCAT(jour_occur_info),GROUP_CONCAT(jour_after_occur_info),GROUP_CONCAT(remark_info),GROUP_CONCAT(exter_comm_flag)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28

    /* from (select * from tb_tdseap_command_jour where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdseap_command_jour where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步指令分发表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdseap_command_dispense;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdseap_command_dispense(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(opor_co_no),GROUP_CONCAT(opor_no),GROUP_CONCAT(oper_mac),GROUP_CONCAT(oper_ip_addr),GROUP_CONCAT(oper_info),GROUP_CONCAT(oper_way),GROUP_CONCAT(oper_func_code),GROUP_CONCAT(init_date),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(stock_type),GROUP_CONCAT(asset_type),GROUP_CONCAT(comm_date),GROUP_CONCAT(comm_id),GROUP_CONCAT(comm_batch_no),GROUP_CONCAT(comm_dir),GROUP_CONCAT(comm_status),GROUP_CONCAT(comm_opor),GROUP_CONCAT(disp_date),GROUP_CONCAT(disp_time),GROUP_CONCAT(before_comm_executor),GROUP_CONCAT(comm_executor),GROUP_CONCAT(is_withdraw),GROUP_CONCAT(disp_flag),GROUP_CONCAT(disp_remark),GROUP_CONCAT(exter_comm_flag)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32#,@同步字段33#,@同步字段34#,@同步字段35#,@同步字段36#,@同步字段37# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32,v_sync_field33,v_sync_field34,v_sync_field35,v_sync_field36,v_sync_field37

    /* from (select * from tb_tdseap_command_dispense where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdseap_command_dispense where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步指令审批表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdseap_command_approve;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdseap_command_approve(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(opor_co_no),GROUP_CONCAT(opor_no),GROUP_CONCAT(oper_mac),GROUP_CONCAT(oper_ip_addr),GROUP_CONCAT(oper_info),GROUP_CONCAT(oper_way),GROUP_CONCAT(oper_func_code),GROUP_CONCAT(init_date),GROUP_CONCAT(comm_appr_date),GROUP_CONCAT(comm_appr_time),GROUP_CONCAT(comm_appr_oper_no),GROUP_CONCAT(comm_appr_oper),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(stock_type),GROUP_CONCAT(asset_type),GROUP_CONCAT(comm_date),GROUP_CONCAT(comm_id),GROUP_CONCAT(comm_opor),GROUP_CONCAT(comm_dir),GROUP_CONCAT(comm_qty),GROUP_CONCAT(comm_limit_price),GROUP_CONCAT(limit_actual_price),GROUP_CONCAT(comm_begin_date),GROUP_CONCAT(comm_end_date),GROUP_CONCAT(comm_begin_time),GROUP_CONCAT(comm_end_time),GROUP_CONCAT(comm_appr_status),GROUP_CONCAT(comm_appr_remark),GROUP_CONCAT(exter_comm_flag)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32#,@同步字段33#,@同步字段34#,@同步字段35#,@同步字段36#,@同步字段37#,@同步字段38#,@同步字段39#,@同步字段40#,@同步字段41# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32,v_sync_field33,v_sync_field34,v_sync_field35,v_sync_field36,v_sync_field37,v_sync_field38,v_sync_field39,v_sync_field40,v_sync_field41

    /* from (select * from tb_tdseap_command_approve where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdseap_command_approve where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步订单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdsetd_order;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdsetd_order(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(opor_co_no),GROUP_CONCAT(opor_no),GROUP_CONCAT(oper_mac),GROUP_CONCAT(oper_ip_addr),GROUP_CONCAT(oper_info),GROUP_CONCAT(oper_way),GROUP_CONCAT(oper_func_code),GROUP_CONCAT(init_date),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(pass_no),GROUP_CONCAT(out_acco),GROUP_CONCAT(exch_crncy_type),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_acco),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(stock_code),GROUP_CONCAT(trade_code_no),GROUP_CONCAT(target_code_no),GROUP_CONCAT(stock_type),GROUP_CONCAT(asset_type),GROUP_CONCAT(external_no),GROUP_CONCAT(comm_id),GROUP_CONCAT(comm_batch_no),GROUP_CONCAT(comm_opor),GROUP_CONCAT(report_date),GROUP_CONCAT(report_time),GROUP_CONCAT(report_no),GROUP_CONCAT(order_date),GROUP_CONCAT(order_time),GROUP_CONCAT(order_batch_no),GROUP_CONCAT(order_dir),GROUP_CONCAT(price_type),GROUP_CONCAT(order_price),GROUP_CONCAT(order_qty),GROUP_CONCAT(order_status),GROUP_CONCAT(wtdraw_qty),GROUP_CONCAT(strike_amt),GROUP_CONCAT(strike_qty),GROUP_CONCAT(all_fee),GROUP_CONCAT(stamp_tax),GROUP_CONCAT(trans_fee),GROUP_CONCAT(brkage_fee),GROUP_CONCAT(SEC_charges),GROUP_CONCAT(other_fee),GROUP_CONCAT(trade_commis),GROUP_CONCAT(other_commis),GROUP_CONCAT(trade_tax),GROUP_CONCAT(trade_cost_fee),GROUP_CONCAT(trade_system_use_fee),GROUP_CONCAT(stock_settle_fee),GROUP_CONCAT(net_price_flag),GROUP_CONCAT(intrst_days),GROUP_CONCAT(par_value),GROUP_CONCAT(bond_accr_intrst),GROUP_CONCAT(bond_rate_type),GROUP_CONCAT(strike_bond_accr_intrst),GROUP_CONCAT(impawn_ratio),GROUP_CONCAT(order_frozen_amt),GROUP_CONCAT(order_frozen_qty),GROUP_CONCAT(rsp_info),GROUP_CONCAT(compli_trig_id),GROUP_CONCAT(remark_info),GROUP_CONCAT(cost_calc_type),GROUP_CONCAT(order_oper_way),GROUP_CONCAT(exter_comm_flag),GROUP_CONCAT(record_valid_flag),GROUP_CONCAT(combo_code),GROUP_CONCAT(combo_posi_id),GROUP_CONCAT(strategy_id),GROUP_CONCAT(sett_flag),GROUP_CONCAT(target_stock_code),GROUP_CONCAT(target_stock_code_no)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32#,@同步字段33#,@同步字段34#,@同步字段35#,@同步字段36#,@同步字段37#,@同步字段38#,@同步字段39#,@同步字段40#,@同步字段41#,@同步字段42#,@同步字段43#,@同步字段44#,@同步字段45#,@同步字段46#,@同步字段47#,@同步字段48#,@同步字段49#,@同步字段50#,@同步字段51#,@同步字段52#,@同步字段53#,@同步字段54#,@同步字段55#,@同步字段56#,@同步字段57#,@同步字段58#,@同步字段59#,@同步字段60#,@同步字段61#,@同步字段62#,@同步字段63#,@同步字段64#,@同步字段65#,@同步字段66#,@同步字段67#,@同步字段68#,@同步字段69#,@同步字段70#,@同步字段71#,@同步字段72#,@同步字段73#,@同步字段74#,@同步字段75#,@同步字段76#,@同步字段77#,@同步字段78#,@同步字段79#,@同步字段80#,@同步字段81#,@同步字段82# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32,v_sync_field33,v_sync_field34,v_sync_field35,v_sync_field36,v_sync_field37,v_sync_field38,v_sync_field39,v_sync_field40,v_sync_field41,v_sync_field42,v_sync_field43,v_sync_field44,v_sync_field45,v_sync_field46,v_sync_field47,v_sync_field48,v_sync_field49,v_sync_field50,v_sync_field51,v_sync_field52,v_sync_field53,v_sync_field54,v_sync_field55,v_sync_field56,v_sync_field57,v_sync_field58,v_sync_field59,v_sync_field60,v_sync_field61,v_sync_field62,v_sync_field63,v_sync_field64,v_sync_field65,v_sync_field66,v_sync_field67,v_sync_field68,v_sync_field69,v_sync_field70,v_sync_field71,v_sync_field72,v_sync_field73,v_sync_field74,v_sync_field75,v_sync_field76,v_sync_field77,v_sync_field78,v_sync_field79,v_sync_field80,v_sync_field81,v_sync_field82

    /* from (select * from tb_tdsetd_order where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdsetd_order where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步通道订单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdsetd_channelorder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdsetd_channelorder(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(opor_co_no),GROUP_CONCAT(opor_no),GROUP_CONCAT(oper_mac),GROUP_CONCAT(oper_ip_addr),GROUP_CONCAT(oper_info),GROUP_CONCAT(oper_way),GROUP_CONCAT(oper_func_code),GROUP_CONCAT(init_date),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(pass_no),GROUP_CONCAT(out_acco),GROUP_CONCAT(exch_crncy_type),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_acco),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(stock_code),GROUP_CONCAT(stock_type),GROUP_CONCAT(external_no),GROUP_CONCAT(comm_id),GROUP_CONCAT(comm_opor),GROUP_CONCAT(report_date),GROUP_CONCAT(report_time),GROUP_CONCAT(report_no),GROUP_CONCAT(order_date),GROUP_CONCAT(order_time),GROUP_CONCAT(order_batch_no),GROUP_CONCAT(order_dir),GROUP_CONCAT(price_type),GROUP_CONCAT(order_price),GROUP_CONCAT(order_qty),GROUP_CONCAT(order_status),GROUP_CONCAT(wtdraw_qty),GROUP_CONCAT(strike_amt),GROUP_CONCAT(strike_qty),GROUP_CONCAT(net_price_flag),GROUP_CONCAT(bond_accr_intrst),GROUP_CONCAT(rsp_info),GROUP_CONCAT(compli_trig_id),GROUP_CONCAT(remark_info)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32#,@同步字段33#,@同步字段34#,@同步字段35#,@同步字段36#,@同步字段37#,@同步字段38#,@同步字段39#,@同步字段40#,@同步字段41#,@同步字段42#,@同步字段43#,@同步字段44#,@同步字段45#,@同步字段46#,@同步字段47#,@同步字段48#,@同步字段49# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32,v_sync_field33,v_sync_field34,v_sync_field35,v_sync_field36,v_sync_field37,v_sync_field38,v_sync_field39,v_sync_field40,v_sync_field41,v_sync_field42,v_sync_field43,v_sync_field44,v_sync_field45,v_sync_field46,v_sync_field47,v_sync_field48,v_sync_field49

    /* from (select * from tb_tdsetd_channelorder where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdsetd_channelorder where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步新股申购表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdsetd_purchaseorder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdsetd_purchaseorder(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(opor_co_no),GROUP_CONCAT(opor_no),GROUP_CONCAT(oper_mac),GROUP_CONCAT(oper_ip_addr),GROUP_CONCAT(oper_info),GROUP_CONCAT(oper_way),GROUP_CONCAT(oper_func_code),GROUP_CONCAT(init_date),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(pass_no),GROUP_CONCAT(out_acco),GROUP_CONCAT(exch_crncy_type),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_acco),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(stock_code),GROUP_CONCAT(stock_type),GROUP_CONCAT(report_date),GROUP_CONCAT(report_time),GROUP_CONCAT(report_no),GROUP_CONCAT(order_date),GROUP_CONCAT(order_time),GROUP_CONCAT(order_id),GROUP_CONCAT(order_dir),GROUP_CONCAT(order_price),GROUP_CONCAT(order_qty),GROUP_CONCAT(all_fee),GROUP_CONCAT(other_fee),GROUP_CONCAT(trade_commis),GROUP_CONCAT(other_commis),GROUP_CONCAT(order_frozen_amt),GROUP_CONCAT(nav_asset),GROUP_CONCAT(rsp_info),GROUP_CONCAT(compli_trig_id),GROUP_CONCAT(trade_code_no),GROUP_CONCAT(target_code_no),GROUP_CONCAT(sett_flag)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32#,@同步字段33#,@同步字段34#,@同步字段35#,@同步字段36#,@同步字段37#,@同步字段38#,@同步字段39#,@同步字段40#,@同步字段41#,@同步字段42#,@同步字段43#,@同步字段44#,@同步字段45#,@同步字段46#,@同步字段47# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32,v_sync_field33,v_sync_field34,v_sync_field35,v_sync_field36,v_sync_field37,v_sync_field38,v_sync_field39,v_sync_field40,v_sync_field41,v_sync_field42,v_sync_field43,v_sync_field44,v_sync_field45,v_sync_field46,v_sync_field47

    /* from (select * from tb_tdsetd_purchaseorder where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdsetd_purchaseorder where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步撤单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdsetd_cancel;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdsetd_cancel(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(opor_co_no),GROUP_CONCAT(opor_no),GROUP_CONCAT(oper_mac),GROUP_CONCAT(oper_ip_addr),GROUP_CONCAT(oper_info),GROUP_CONCAT(oper_way),GROUP_CONCAT(oper_func_code),GROUP_CONCAT(init_date),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(pass_no),GROUP_CONCAT(out_acco),GROUP_CONCAT(exch_crncy_type),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_acco),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(stock_code),GROUP_CONCAT(external_no),GROUP_CONCAT(wtdraw_batch_no),GROUP_CONCAT(wtdraw_date),GROUP_CONCAT(wtdraw_time),GROUP_CONCAT(order_date),GROUP_CONCAT(order_id),GROUP_CONCAT(report_date),GROUP_CONCAT(report_time),GROUP_CONCAT(report_no),GROUP_CONCAT(wtdraw_status),GROUP_CONCAT(wtdraw_qty),GROUP_CONCAT(wtdraw_remark),GROUP_CONCAT(order_price)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32#,@同步字段33#,@同步字段34#,@同步字段35#,@同步字段36#,@同步字段37#,@同步字段38#,@同步字段39# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32,v_sync_field33,v_sync_field34,v_sync_field35,v_sync_field36,v_sync_field37,v_sync_field38,v_sync_field39

    /* from (select * from tb_tdsetd_cancel where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdsetd_cancel where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步预埋订单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdsetd_preorder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdsetd_preorder(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(opor_co_no),GROUP_CONCAT(opor_no),GROUP_CONCAT(oper_mac),GROUP_CONCAT(oper_ip_addr),GROUP_CONCAT(oper_info),GROUP_CONCAT(oper_way),GROUP_CONCAT(oper_func_code),GROUP_CONCAT(init_date),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(exch_crncy_type),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_acco),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(stock_code),GROUP_CONCAT(stock_type),GROUP_CONCAT(pre_order_date),GROUP_CONCAT(pre_order_time),GROUP_CONCAT(pre_order_dir),GROUP_CONCAT(pre_order_type),GROUP_CONCAT(pre_order_price),GROUP_CONCAT(pre_order_qty),GROUP_CONCAT(pre_order_status),GROUP_CONCAT(trig_type),GROUP_CONCAT(trig_price),GROUP_CONCAT(trig_time),GROUP_CONCAT(order_date),GROUP_CONCAT(order_time),GROUP_CONCAT(order_id)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32#,@同步字段33#,@同步字段34#,@同步字段35#,@同步字段36#,@同步字段37#,@同步字段38# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32,v_sync_field33,v_sync_field34,v_sync_field35,v_sync_field36,v_sync_field37,v_sync_field38

    /* from (select * from tb_tdsetd_preorder where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdsetd_preorder where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步篮子订单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdsetd_basketorder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdsetd_basketorder(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(opor_co_no),GROUP_CONCAT(opor_no),GROUP_CONCAT(oper_mac),GROUP_CONCAT(oper_ip_addr),GROUP_CONCAT(oper_info),GROUP_CONCAT(oper_way),GROUP_CONCAT(oper_func_code),GROUP_CONCAT(init_date),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(basket_id),GROUP_CONCAT(order_date),GROUP_CONCAT(order_time),GROUP_CONCAT(order_batch_no),GROUP_CONCAT(order_dir),GROUP_CONCAT(basket_trade_type),GROUP_CONCAT(basket_trade_amt)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25

    /* from (select * from tb_tdsetd_basketorder where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdsetd_basketorder where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步改单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdsetd_modifyorder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdsetd_modifyorder(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(opor_co_no),GROUP_CONCAT(opor_no),GROUP_CONCAT(oper_mac),GROUP_CONCAT(oper_ip_addr),GROUP_CONCAT(oper_info),GROUP_CONCAT(oper_way),GROUP_CONCAT(oper_func_code),GROUP_CONCAT(init_date),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(pass_no),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(stock_code),GROUP_CONCAT(stock_type),GROUP_CONCAT(asset_type),GROUP_CONCAT(modi_order_date),GROUP_CONCAT(modi_order_time),GROUP_CONCAT(modi_batch_no),GROUP_CONCAT(order_id),GROUP_CONCAT(comm_id),GROUP_CONCAT(order_price),GROUP_CONCAT(order_qty),GROUP_CONCAT(order_dir),GROUP_CONCAT(order_date),GROUP_CONCAT(order_time),GROUP_CONCAT(price_type),GROUP_CONCAT(modi_order_price),GROUP_CONCAT(modi_order_qty),GROUP_CONCAT(modi_order_status),GROUP_CONCAT(modi_price_type),GROUP_CONCAT(crncy_type),GROUP_CONCAT(exch_crncy_type),GROUP_CONCAT(new_order_id),GROUP_CONCAT(remark_info),GROUP_CONCAT(order_oper_way)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32#,@同步字段33#,@同步字段34#,@同步字段35#,@同步字段36#,@同步字段37#,@同步字段38#,@同步字段39#,@同步字段40#,@同步字段41#,@同步字段42#,@同步字段43#,@同步字段44#,@同步字段45# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32,v_sync_field33,v_sync_field34,v_sync_field35,v_sync_field36,v_sync_field37,v_sync_field38,v_sync_field39,v_sync_field40,v_sync_field41,v_sync_field42,v_sync_field43,v_sync_field44,v_sync_field45

    /* from (select * from tb_tdsetd_modifyorder where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdsetd_modifyorder where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步待执行订单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdsetd_pendorder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdsetd_pendorder(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(opor_co_no),GROUP_CONCAT(opor_no),GROUP_CONCAT(oper_mac),GROUP_CONCAT(oper_ip_addr),GROUP_CONCAT(oper_info),GROUP_CONCAT(oper_way),GROUP_CONCAT(oper_func_code),GROUP_CONCAT(init_date),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(pass_no),GROUP_CONCAT(out_acco),GROUP_CONCAT(exch_crncy_type),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_acco),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(stock_code),GROUP_CONCAT(trade_code_no),GROUP_CONCAT(target_code_no),GROUP_CONCAT(stock_type),GROUP_CONCAT(asset_type),GROUP_CONCAT(comm_id),GROUP_CONCAT(comm_batch_no),GROUP_CONCAT(order_date),GROUP_CONCAT(order_time),GROUP_CONCAT(order_batch_no),GROUP_CONCAT(order_dir),GROUP_CONCAT(price_type),GROUP_CONCAT(exec_price_type),GROUP_CONCAT(price_offset),GROUP_CONCAT(order_qty),GROUP_CONCAT(net_price_flag),GROUP_CONCAT(intrst_days),GROUP_CONCAT(par_value),GROUP_CONCAT(bond_accr_intrst),GROUP_CONCAT(bond_rate_type),GROUP_CONCAT(impawn_ratio),GROUP_CONCAT(order_oper_way),GROUP_CONCAT(external_no),GROUP_CONCAT(pend_order_status),GROUP_CONCAT(remark_info)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32#,@同步字段33#,@同步字段34#,@同步字段35#,@同步字段36#,@同步字段37#,@同步字段38#,@同步字段39#,@同步字段40#,@同步字段41#,@同步字段42#,@同步字段43#,@同步字段44#,@同步字段45#,@同步字段46#,@同步字段47#,@同步字段48#,@同步字段49#,@同步字段50# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32,v_sync_field33,v_sync_field34,v_sync_field35,v_sync_field36,v_sync_field37,v_sync_field38,v_sync_field39,v_sync_field40,v_sync_field41,v_sync_field42,v_sync_field43,v_sync_field44,v_sync_field45,v_sync_field46,v_sync_field47,v_sync_field48,v_sync_field49,v_sync_field50

    /* from (select * from tb_tdsetd_pendorder where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdsetd_pendorder where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步订单回报表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdserp_orderrsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdserp_orderrsp(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(init_date),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(pass_no),GROUP_CONCAT(out_acco),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco),GROUP_CONCAT(stock_code),GROUP_CONCAT(report_date),GROUP_CONCAT(report_time),GROUP_CONCAT(report_no),GROUP_CONCAT(order_date),GROUP_CONCAT(order_id),GROUP_CONCAT(order_dir),GROUP_CONCAT(order_price),GROUP_CONCAT(order_qty),GROUP_CONCAT(price_type),GROUP_CONCAT(order_rsp_status),GROUP_CONCAT(rsp_info),GROUP_CONCAT(deal_status),GROUP_CONCAT(record_valid_flag)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29

    /* from (select * from tb_tdserp_orderrsp where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdserp_orderrsp where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步成交回报表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdserp_strikersp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdserp_strikersp(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(init_date),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(pass_no),GROUP_CONCAT(out_acco),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco),GROUP_CONCAT(stock_code),GROUP_CONCAT(report_date),GROUP_CONCAT(report_no),GROUP_CONCAT(strike_date),GROUP_CONCAT(strike_time),GROUP_CONCAT(strike_no),GROUP_CONCAT(order_dir),GROUP_CONCAT(strike_price),GROUP_CONCAT(strike_qty),GROUP_CONCAT(strike_amt),GROUP_CONCAT(strike_deal_type),GROUP_CONCAT(rsp_info),GROUP_CONCAT(deal_status),GROUP_CONCAT(sett_flag),GROUP_CONCAT(record_valid_flag)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30

    /* from (select * from tb_tdserp_strikersp where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdserp_strikersp where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步成交表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdserp_strike;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdserp_strike(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(opor_no),GROUP_CONCAT(init_date),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(pass_no),GROUP_CONCAT(out_acco),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_code),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(stock_type),GROUP_CONCAT(asset_type),GROUP_CONCAT(comm_id),GROUP_CONCAT(comm_batch_no),GROUP_CONCAT(strike_date),GROUP_CONCAT(strike_time),GROUP_CONCAT(strike_no),GROUP_CONCAT(report_date),GROUP_CONCAT(report_no),GROUP_CONCAT(order_date),GROUP_CONCAT(order_time),GROUP_CONCAT(order_batch_no),GROUP_CONCAT(order_id),GROUP_CONCAT(order_dir),GROUP_CONCAT(order_price),GROUP_CONCAT(order_qty),GROUP_CONCAT(strike_qty),GROUP_CONCAT(strike_price),GROUP_CONCAT(strike_amt),GROUP_CONCAT(all_fee),GROUP_CONCAT(stamp_tax),GROUP_CONCAT(trans_fee),GROUP_CONCAT(brkage_fee),GROUP_CONCAT(SEC_charges),GROUP_CONCAT(other_fee),GROUP_CONCAT(trade_commis),GROUP_CONCAT(other_commis),GROUP_CONCAT(trade_tax),GROUP_CONCAT(trade_cost_fee),GROUP_CONCAT(trade_system_use_fee),GROUP_CONCAT(stock_settle_fee),GROUP_CONCAT(net_price_flag),GROUP_CONCAT(intrst_days),GROUP_CONCAT(par_value),GROUP_CONCAT(bond_accr_intrst),GROUP_CONCAT(bond_rate_type),GROUP_CONCAT(impawn_ratio),GROUP_CONCAT(strike_bond_accr_intrst),GROUP_CONCAT(trade_code_no),GROUP_CONCAT(target_code_no),GROUP_CONCAT(order_oper_way),GROUP_CONCAT(exter_comm_flag),GROUP_CONCAT(record_valid_flag),GROUP_CONCAT(external_no),GROUP_CONCAT(combo_code)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32#,@同步字段33#,@同步字段34#,@同步字段35#,@同步字段36#,@同步字段37#,@同步字段38#,@同步字段39#,@同步字段40#,@同步字段41#,@同步字段42#,@同步字段43#,@同步字段44#,@同步字段45#,@同步字段46#,@同步字段47#,@同步字段48#,@同步字段49#,@同步字段50#,@同步字段51#,@同步字段52#,@同步字段53#,@同步字段54#,@同步字段55#,@同步字段56#,@同步字段57#,@同步字段58#,@同步字段59#,@同步字段60#,@同步字段61#,@同步字段62#,@同步字段63# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32,v_sync_field33,v_sync_field34,v_sync_field35,v_sync_field36,v_sync_field37,v_sync_field38,v_sync_field39,v_sync_field40,v_sync_field41,v_sync_field42,v_sync_field43,v_sync_field44,v_sync_field45,v_sync_field46,v_sync_field47,v_sync_field48,v_sync_field49,v_sync_field50,v_sync_field51,v_sync_field52,v_sync_field53,v_sync_field54,v_sync_field55,v_sync_field56,v_sync_field57,v_sync_field58,v_sync_field59,v_sync_field60,v_sync_field61,v_sync_field62,v_sync_field63

    /* from (select * from tb_tdserp_strike where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdserp_strike where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步操作员阈值设置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdset0_opor_tshold_set;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdset0_opor_tshold_set(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(co_no),GROUP_CONCAT(opor_no),GROUP_CONCAT(begin_amt),GROUP_CONCAT(curr_amt),GROUP_CONCAT(frozen_amt),GROUP_CONCAT(opor_warn_tshold),GROUP_CONCAT(opor_stop_tshold),GROUP_CONCAT(order_limit_time),GROUP_CONCAT(per_secu_posi_ratio),GROUP_CONCAT(posi_limit_time),GROUP_CONCAT(order_ctrl_qty),GROUP_CONCAT(order_ctrl_amt),GROUP_CONCAT(stock_warn_ratio),GROUP_CONCAT(stock_stop_ratio),GROUP_CONCAT(stock_warn_amt),GROUP_CONCAT(stock_stop_amt),GROUP_CONCAT(trig_oper_type),GROUP_CONCAT(open_close_permission),GROUP_CONCAT(risk_oper),GROUP_CONCAT(fee_calc_type),GROUP_CONCAT(permit_margin_trade),GROUP_CONCAT(buy_fee_ratio),GROUP_CONCAT(sell_fee_ratio),GROUP_CONCAT(buy_min_fee),GROUP_CONCAT(sell_min_fee),GROUP_CONCAT(trade_capt_amt),GROUP_CONCAT(trade_releas_amt),GROUP_CONCAT(strike_capt_amt),GROUP_CONCAT(strike_releas_amt),GROUP_CONCAT(sum_realize_pandl),GROUP_CONCAT(amt_diff)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32#,@同步字段33#,@同步字段34#,@同步字段35#,@同步字段36#,@同步字段37# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32,v_sync_field33,v_sync_field34,v_sync_field35,v_sync_field36,v_sync_field37

    /* from (select * from tb_tdset0_opor_tshold_set where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdset0_opor_tshold_set where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步操作员参数设置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdset0_opor_param_set;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdset0_opor_param_set(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(co_no),GROUP_CONCAT(opor_no),GROUP_CONCAT(config_no),GROUP_CONCAT(config_value),GROUP_CONCAT(config_name),GROUP_CONCAT(config_memo)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12

    /* from (select * from tb_tdset0_opor_param_set where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdset0_opor_param_set where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步证券持仓明细表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdset0_stock_posi_detail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdset0_stock_posi_detail(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(opor_no),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_code),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(lngsht_type),GROUP_CONCAT(curr_qty),GROUP_CONCAT(open_posi_date),GROUP_CONCAT(open_posi_time),GROUP_CONCAT(open_posi_price),GROUP_CONCAT(open_posi_value),GROUP_CONCAT(open_posi_fee),GROUP_CONCAT(close_posi_qty),GROUP_CONCAT(close_posi_date),GROUP_CONCAT(close_posi_time),GROUP_CONCAT(close_posi_market_value),GROUP_CONCAT(close_posi_fee),GROUP_CONCAT(strike_no),GROUP_CONCAT(realize_pandl),GROUP_CONCAT(over_night_pandl),GROUP_CONCAT(posi_status),GROUP_CONCAT(remark_info)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32

    /* from (select * from tb_tdset0_stock_posi_detail where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdset0_stock_posi_detail where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步证券平仓成交明细表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdset0_close_posi_strike_detail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdset0_close_posi_strike_detail(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(opor_no),GROUP_CONCAT(init_date),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(lngsht_type),GROUP_CONCAT(detail_posi_id),GROUP_CONCAT(strike_no),GROUP_CONCAT(close_posi_date),GROUP_CONCAT(close_posi_time),GROUP_CONCAT(close_posi_price),GROUP_CONCAT(close_posi_qty),GROUP_CONCAT(close_posi_market_value),GROUP_CONCAT(close_posi_fee),GROUP_CONCAT(realize_pandl)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25

    /* from (select * from tb_tdset0_close_posi_strike_detail where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdset0_close_posi_strike_detail where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步操作员券源设置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdset0_opor_stock_source;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdset0_opor_stock_source(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(co_no),GROUP_CONCAT(opor_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(stock_code),GROUP_CONCAT(exch_no),GROUP_CONCAT(begin_qty),GROUP_CONCAT(source_stock_qty),GROUP_CONCAT(single_limit_qty),GROUP_CONCAT(assigned_qty),GROUP_CONCAT(trade_releas_qty),GROUP_CONCAT(trade_capt_qty),GROUP_CONCAT(strike_releas_qty),GROUP_CONCAT(strike_capt_qty),GROUP_CONCAT(total_realize_pandl),GROUP_CONCAT(over_night_pandl),GROUP_CONCAT(sum_realize_pandl),GROUP_CONCAT(total_open_posi_fee),GROUP_CONCAT(total_close_posi_fee),GROUP_CONCAT(out_order_releas_qty),GROUP_CONCAT(out_order_capt_qty),GROUP_CONCAT(out_strike_releas_qty),GROUP_CONCAT(out_strike_capt_qty),GROUP_CONCAT(diff_qty),GROUP_CONCAT(remark_info)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32#,@同步字段33#,@同步字段34# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32,v_sync_field33,v_sync_field34

    /* from (select * from tb_tdset0_opor_stock_source where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdset0_opor_stock_source where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_tdsecu;;

# 原子_交易证券_同步接口_同步证券持仓汇总表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsesyn_Synctdset0_stock_posi_sum;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsesyn_Synctdset0_stock_posi_sum(
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
    

    /* set @同步字段2# = ''; */
    set v_sync_field2 = '';
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(opor_no),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(exch_group_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(exch_no),GROUP_CONCAT(stock_code),GROUP_CONCAT(stock_acco_no),GROUP_CONCAT(stock_code_no),GROUP_CONCAT(total_long_curr_qty),GROUP_CONCAT(total_short_curr_qty),GROUP_CONCAT(total_long_open_posi_value),GROUP_CONCAT(total_short_open_posi_value),GROUP_CONCAT(total_long_open_posi_fee),GROUP_CONCAT(total_short_open_posi_fee),GROUP_CONCAT(total_long_close_posi_value),GROUP_CONCAT(total_short_close_posi_value),GROUP_CONCAT(total_long_close_posi_qty),GROUP_CONCAT(total_short_close_posi_qty),GROUP_CONCAT(total_long_close_posi_fee),GROUP_CONCAT(total_short_close_posi_fee),GROUP_CONCAT(total_realize_pandl),GROUP_CONCAT(long_curr_qty),GROUP_CONCAT(short_curr_qty),GROUP_CONCAT(long_open_posi_value),GROUP_CONCAT(short_open_posi_value),GROUP_CONCAT(long_open_posi_fee),GROUP_CONCAT(short_open_posi_fee),GROUP_CONCAT(long_close_posi_qty),GROUP_CONCAT(short_close_posi_qty),GROUP_CONCAT(long_close_posi_value),GROUP_CONCAT(short_close_posi_value),GROUP_CONCAT(long_close_posi_fee),GROUP_CONCAT(short_close_posi_fee),GROUP_CONCAT(realize_pandl),GROUP_CONCAT(over_night_pandl),GROUP_CONCAT(open_posi_date),GROUP_CONCAT(open_posi_time)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31#,@同步字段32#,@同步字段33#,@同步字段34#,@同步字段35#,@同步字段36#,@同步字段37#,@同步字段38#,@同步字段39#,@同步字段40#,@同步字段41#,@同步字段42#,@同步字段43#,@同步字段44# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31,v_sync_field32,v_sync_field33,v_sync_field34,v_sync_field35,v_sync_field36,v_sync_field37,v_sync_field38,v_sync_field39,v_sync_field40,v_sync_field41,v_sync_field42,v_sync_field43,v_sync_field44

    /* from (select * from tb_tdset0_stock_posi_sum where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_tdset0_stock_posi_sum where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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


