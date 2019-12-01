DELIMITER ;;
use db_prod;;

# 原子_产品_同步接口_获取同步时间
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsyn_GetSyncTime;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsyn_GetSyncTime(
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
use db_prod;;

# 原子_产品_同步接口_更新同步时间
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsyn_UpdateSyncTime;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsyn_UpdateSyncTime(
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
use db_prod;;

# 原子_产品_同步接口_同步产品信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsyn_Syncpdacco_pd_info;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsyn_Syncpdacco_pd_info(
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
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(pd_no),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_code),GROUP_CONCAT(pd_name),GROUP_CONCAT(pd_flname),GROUP_CONCAT(fund_reg_code),GROUP_CONCAT(pd_manager),GROUP_CONCAT(found_date),GROUP_CONCAT(pd_type),GROUP_CONCAT(apply_currency),GROUP_CONCAT(crncy_type),GROUP_CONCAT(first_asset),GROUP_CONCAT(first_amt),GROUP_CONCAT(pd_all_share),GROUP_CONCAT(curr_share),GROUP_CONCAT(pre_share),GROUP_CONCAT(his_max_per_nav),GROUP_CONCAT(pre_nav),GROUP_CONCAT(begin_nav),GROUP_CONCAT(evalu_share),GROUP_CONCAT(pre_evalu_share),GROUP_CONCAT(coust_full_name),GROUP_CONCAT(coust_acco),GROUP_CONCAT(coust_acco_name),GROUP_CONCAT(remark_info)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23#,@同步字段24#,@同步字段25#,@同步字段26#,@同步字段27#,@同步字段28#,@同步字段29#,@同步字段30#,@同步字段31# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23,v_sync_field24,v_sync_field25,v_sync_field26,v_sync_field27,v_sync_field28,v_sync_field29,v_sync_field30,v_sync_field31

    /* from (select * from tb_pdacco_pd_info where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_pdacco_pd_info where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_prod;;

# 原子_产品_同步接口_同步产品限制信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsyn_Syncpdacco_pd_limit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsyn_Syncpdacco_pd_limit(
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
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(cost_calc_type),GROUP_CONCAT(allow_exch),GROUP_CONCAT(allow_stock_type),GROUP_CONCAT(busi_config_str),GROUP_CONCAT(comm_appr_oper),GROUP_CONCAT(market_price_ratio),GROUP_CONCAT(forbid_order_dir),GROUP_CONCAT(pd_status),GROUP_CONCAT(comm_no_limit_price_ratio),GROUP_CONCAT(abolish_date)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18

    /* from (select * from tb_pdacco_pd_limit where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_pdacco_pd_limit where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_prod;;

# 原子_产品_同步接口_同步资产账户信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsyn_Syncpdacco_asset_acco;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsyn_Syncpdacco_asset_acco(
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
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(asset_acco),GROUP_CONCAT(asset_acco_name),GROUP_CONCAT(asset_acco_type),GROUP_CONCAT(trade_pwd),GROUP_CONCAT(asset_acco_status),GROUP_CONCAT(busi_config_str),GROUP_CONCAT(market_price_ratio),GROUP_CONCAT(allow_exch),GROUP_CONCAT(allow_stock_type),GROUP_CONCAT(split_fee_typr_str),GROUP_CONCAT(busi_limit_str),GROUP_CONCAT(exter_comm_flag),GROUP_CONCAT(remark_info)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22

    /* from (select * from tb_pdacco_asset_acco where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_pdacco_asset_acco where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_prod;;

# 原子_产品_同步接口_同步资产账户通道信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsyn_Syncpdacco_asset_acco_ch;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsyn_Syncpdacco_asset_acco_ch(
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
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(pass_no),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(asset_acco_no),GROUP_CONCAT(pass_type),GROUP_CONCAT(out_acco),GROUP_CONCAT(trade_pwd),GROUP_CONCAT(comm_pwd),GROUP_CONCAT(online_status),GROUP_CONCAT(config_str),GROUP_CONCAT(remark_info)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17

    /* from (select * from tb_pdacco_asset_acco_ch where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_pdacco_asset_acco_ch where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_prod;;

# 原子_产品_同步接口_同步产品资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsyn_Syncpdcapit_pd_capit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsyn_Syncpdcapit_pd_capit(
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
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(crncy_type),GROUP_CONCAT(first_amt),GROUP_CONCAT(begin_amt),GROUP_CONCAT(curr_amt),GROUP_CONCAT(pd_dist_amt),GROUP_CONCAT(pd_auth_amt),GROUP_CONCAT(amt_check_diff),GROUP_CONCAT(pre_settle_amt),GROUP_CONCAT(total_cash_divide),GROUP_CONCAT(total_pre_fee),GROUP_CONCAT(total_rece_amt),GROUP_CONCAT(total_payab_amt),GROUP_CONCAT(total_change_amt),GROUP_CONCAT(intrst_cacl_amt),GROUP_CONCAT(pre_entry_intrst_amt)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23

    /* from (select * from tb_pdcapit_pd_capit where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_pdcapit_pd_capit where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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
use db_prod;;

# 原子_产品_同步接口_同步产品资产表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsyn_Syncpdcapit_pd_asset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsyn_Syncpdcapit_pd_asset(
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
    select GROUP_CONCAT(row_id),GROUP_CONCAT(create_date),GROUP_CONCAT(create_time),GROUP_CONCAT(update_date),GROUP_CONCAT(update_time),GROUP_CONCAT(update_times),GROUP_CONCAT(co_no),GROUP_CONCAT(pd_no),GROUP_CONCAT(crncy_type),GROUP_CONCAT(begin_nav),GROUP_CONCAT(nav_asset),GROUP_CONCAT(total_cash_asset),GROUP_CONCAT(stock_asset),GROUP_CONCAT(fund_asset),GROUP_CONCAT(bond_asset),GROUP_CONCAT(futu_asset),GROUP_CONCAT(repo_asset),GROUP_CONCAT(other_asset),GROUP_CONCAT(hk_thrgh_stock_asset),GROUP_CONCAT(begin_evalu_nav_asset),GROUP_CONCAT(evalu_nav_asset),GROUP_CONCAT(stock_cash_asset),GROUP_CONCAT(futu_cash_asset)

    /* into @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13#,@同步字段14#,@同步字段15#,@同步字段16#,@同步字段17#,@同步字段18#,@同步字段19#,@同步字段20#,@同步字段21#,@同步字段22#,@同步字段23# */
    into v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13,v_sync_field14,v_sync_field15,v_sync_field16,v_sync_field17,v_sync_field18,v_sync_field19,v_sync_field20,v_sync_field21,v_sync_field22,v_sync_field23

    /* from (select * from tb_pdcapit_pd_asset where {更新日期} >= @更新日期# and {更新时间} >= @更新时间#  and {记录序号}> @记录序号# LIMIT @指定行数#) a ; */
    from (select * from tb_pdcapit_pd_asset where update_date >= v_update_date and update_time >= v_update_time  and row_id> v_row_id LIMIT v_row_count) a ;
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


