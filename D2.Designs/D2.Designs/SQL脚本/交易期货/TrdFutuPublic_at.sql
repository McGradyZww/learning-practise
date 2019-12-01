DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_公用_更新报盘机状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfupb_UpdateOfferStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfupb_UpdateOfferStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_pass_status varchar(2),
    IN p_offer_name varchar(32),
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
    declare v_pass_no int;
    declare v_pass_status varchar(2);
    declare v_offer_name varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pass_name varchar(64);

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
    SET v_pass_no = p_pass_no;
    SET v_pass_status = p_pass_status;
    SET v_offer_name = p_offer_name;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pass_name = " ";

    
    label_pro:BEGIN
    

    /* [插入重复更新][交易期货_公用_通道状态表][字段][字段变量][{通道状态}=@通道状态#][1][@通道名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdfutu.tb_tdfupb_offerstatus (
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, pass_no, 
        pass_status, offer_name) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_pass_no, 
        v_pass_status, v_offer_name) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pass_status=v_pass_status;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.1.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道名称=",v_pass_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道名称=",v_pass_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_公用_获取通道状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfupb_GetChannelStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfupb_GetChannelStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pass_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pass_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_status varchar(2);

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
    SET v_pass_no = p_pass_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易期货_公用_通道状态表][{通道状态}][@通道状态#][{通道编号}=@通道编号#] */
    select pass_status into v_pass_status from db_tdfutu.tb_tdfupb_offerstatus where pass_no=v_pass_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pass_status = v_pass_status;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_公用_获取业务记录编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfupb_GetCoBusiRecordNo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfupb_GetCoBusiRecordNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_record_no_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_no bigint
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
    declare v_record_no_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_no bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_tmp_curr_no bigint;

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
    SET v_record_no_type = p_record_no_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_tmp_curr_no = 0;

    
    label_pro:BEGIN
    
    #当前编号，从1开始

    /* set @当前编号#=1; */
    set v_curr_no=1;
    #按机构区分，以避免多机构锁同一条记录。编号最多6位。

    /* [插入重复更新][交易期货_公用_业务记录编号表][字段][字段变量][{当前编号}={当前编号} + 1][1][@机构编号#, @编号类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdfutu.tb_tdfupb_co_busi_record_no (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, record_no_type, 
        curr_no) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_record_no_type, 
        v_curr_no) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_no=curr_no + 1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.3.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 编号类型=", v_record_no_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 编号类型=", v_record_no_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][交易期货_公用_业务记录编号表][{当前编号}][@当前编号#][{机构编号}=@机构编号# and {编号类型}=@编号类型#] */
    select curr_no into v_curr_no from db_tdfutu.tb_tdfupb_co_busi_record_no where co_no=v_co_no and record_no_type=v_record_no_type limit 1;

    #如果到了100000，重置为1

    /* if @当前编号# > 99999 then */
    if v_curr_no > 99999 then

        /* set @临时_当前编号# = @当前编号#; */
        set v_tmp_curr_no = v_curr_no;

        /* set @当前编号# = 1; */
        set v_curr_no = 1;

        /* [插入重复更新][交易期货_公用_业务记录编号表][字段][字段变量][{当前编号}= 1][1][@机构编号#, @编号类型#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdfutu.tb_tdfupb_co_busi_record_no (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, record_no_type, 
            curr_no) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_record_no_type, 
            v_curr_no) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_no= 1;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdfutuA.1.3.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 编号类型=", v_record_no_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,","," 编号类型=", v_record_no_type);
            end if;
            leave label_pro;
        end if;


        /* set @当前编号# = @临时_当前编号#; */
        set v_curr_no = v_tmp_curr_no;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_curr_no = v_curr_no;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_公用_数据归历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfupb_DataToHis;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfupb_DataToHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
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
    declare v_init_date int;
    declare v_next_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_table_name varchar(64);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_strike_status varchar(2);
    declare v_comm_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_status varchar(2);
    declare v_comm_appr_oper_no int;
    declare v_comm_appr_oper int;
    declare v_comm_appr_remark varchar(255);
    declare v_external_no bigint;
    declare v_comb_code varchar(6);
    declare v_comm_oper_way varchar(2);
    declare v_remark_info varchar(255);
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_rece_margin decimal(18,4);
    declare v_comm_appr_qty decimal(18,2);
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
    SET v_init_date = p_init_date;
    SET v_next_init_date = p_next_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_table_name = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_strike_status = "0";
    SET v_comm_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_comm_appr_oper_no = 0;
    SET v_comm_appr_oper = 0;
    SET v_comm_appr_remark = " ";
    SET v_external_no = 0;
    SET v_comb_code = " ";
    SET v_comm_oper_way = " ";
    SET v_remark_info = " ";
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_rece_margin = 0;
    SET v_comm_appr_qty = 0;
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_mach_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @数据表名称# = "~交易期货_指令_指令表^"; */
    set v_table_name = "db_tdfutu.tb_tdfuap_command";

    /* [数据归历史][交易期货_指令_指令表][字段][(({指令结束日期}<>0 and {指令结束日期}<=@初始化日期#) or ({指令结束日期}=0 and {指令日期}<=@初始化日期#)) or ({指令数量} - {指令撤销数量} - {成交数量}=0)][1][@初始化日期#,@数据表名称#] */
    insert into db_tdfutu_his.tb_tdfuap_command_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
        strike_status, comm_status, comm_begin_date, comm_end_date, 
        comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
        comm_appr_oper, comm_appr_remark, external_no, comb_code, 
        comm_oper_way, comm_comple_flag, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_qty, rece_margin, capit_reback_days, posi_reback_days, 
        strike_status, comm_status, comm_begin_date, comm_end_date, 
        comm_begin_time, comm_end_time, comm_comple_date, comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_status, comm_appr_oper_no, 
        comm_appr_oper, comm_appr_remark, external_no, comb_code, 
        comm_oper_way, comm_comple_flag, remark_info 
        from db_tdfutu.tb_tdfuap_command 
        where ((comm_end_date<>0 and comm_end_date<=v_init_date) or (comm_end_date=0 and comm_date<=v_init_date)) or (comm_qty - comm_cancel_qty - strike_qty=0);
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_指令_指令表][(({指令结束日期}<>0 and {指令结束日期}<=@初始化日期#) or ({指令结束日期}=0 and {指令日期}<=@初始化日期#)) or ({指令数量} - {指令撤销数量} - {成交数量}=0)][3][@初始化日期#,@数据表名称#] */
    delete from db_tdfutu.tb_tdfuap_command 
        where ((comm_end_date<>0 and comm_end_date<=v_init_date) or (comm_end_date=0 and comm_date<=v_init_date)) or (comm_qty - comm_cancel_qty - strike_qty=0);
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易期货_指令_指令表][{初始化日期}=@下日初始化日期#][1=1][2][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfuap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易期货_指令_指令分发表^"; */
    set v_table_name = "db_tdfutu.tb_tdfuap_dispense";

    /* [数据归历史][交易期货_指令_指令分发表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#,@数据表名称#] */
    insert into db_tdfutu_his.tb_tdfuap_dispense_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, comm_date, 
        comm_id, comm_batch_no, comm_dir, comm_status, 
        disp_date, disp_time, comm_opor, before_comm_executor, 
        comm_executor, is_withdraw, disp_flag, disp_remark) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, comm_date, 
        comm_id, comm_batch_no, comm_dir, comm_status, 
        disp_date, disp_time, comm_opor, before_comm_executor, 
        comm_executor, is_withdraw, disp_flag, disp_remark 
        from db_tdfutu.tb_tdfuap_dispense 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_指令_指令分发表][{初始化日期}<=@初始化日期#][3][@初始化日期#,@数据表名称#] */
    delete from db_tdfutu.tb_tdfuap_dispense 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易期货_指令_指令审批表^"; */
    set v_table_name = "db_tdfutu.tb_tdfuap_command_approve";

    /* [数据归历史][交易期货_指令_指令审批表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#,@数据表名称#] */
    insert into db_tdfutu_his.tb_tdfuap_command_approve_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, comm_appr_date, 
        comm_appr_time, comm_appr_oper_no, comm_appr_oper, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, comm_date, 
        comm_id, comm_opor, comm_dir, comm_qty, 
        comm_limit_price, limit_actual_price, comm_begin_date, comm_end_date, 
        comm_begin_time, comm_end_time, comm_appr_status, comm_appr_remark) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, comm_appr_date, 
        comm_appr_time, comm_appr_oper_no, comm_appr_oper, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, comm_date, 
        comm_id, comm_opor, comm_dir, comm_qty, 
        comm_limit_price, limit_actual_price, comm_begin_date, comm_end_date, 
        comm_begin_time, comm_end_time, comm_appr_status, comm_appr_remark 
        from db_tdfutu.tb_tdfuap_command_approve 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_指令_指令审批表][{初始化日期}<=@初始化日期#][3][@初始化日期#,@数据表名称#] */
    delete from db_tdfutu.tb_tdfuap_command_approve 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易期货_指令_指令流水表^"; */
    set v_table_name = "db_tdfutu.tb_tdfuap_command_jour";

    /* [数据归历史][交易期货_指令_指令流水表][字段][{初始化日期}<=@初始化日期#][1020][@初始化日期#,@数据表名称#] */
    insert into db_tdfutu_his.tb_tdfuap_command_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, comm_date, comm_id, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, comm_date, comm_id, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info 
        from db_tdfutu.tb_tdfuap_command_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1020";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_指令_指令流水表][{初始化日期}<=@初始化日期#][1021][@初始化日期#,@数据表名称#] */
    delete from db_tdfutu.tb_tdfuap_command_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.1021";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    #需要重新汇总，后续要修改

    /* set @数据表名称# = "~交易期货_指令_指令汇总表^"; */
    set v_table_name = "db_tdfutu.tb_tdfuap_sumcommand";

    /* [数据归历史][交易期货_指令_指令汇总表][字段][(({指令结束日期}<>0 and {指令结束日期}<=@初始化日期#) or ({指令结束日期}=0 and {指令日期}<=@初始化日期#)) or ({指令数量} - {指令撤销数量} - {成交数量}=0)][1010][@初始化日期#,@数据表名称#] */
    insert into db_tdfutu_his.tb_tdfuap_sumcommand_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, comm_await_cancel_qty, strike_amt, 
        strike_qty, strike_status, rece_margin, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
        buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
        buy_comm_amt, sell_comm_amt, comm_oper_way) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_code, contrc_type, asset_type, 
        contrc_dir, hedge_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, comm_await_cancel_qty, strike_amt, 
        strike_qty, strike_status, rece_margin, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
        buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
        buy_comm_amt, sell_comm_amt, comm_oper_way 
        from db_tdfutu.tb_tdfuap_sumcommand 
        where ((comm_end_date<>0 and comm_end_date<=v_init_date) or (comm_end_date=0 and comm_date<=v_init_date)) or (comm_qty - comm_cancel_qty - strike_qty=0);
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1010";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_指令_指令汇总表][1=1][1262][@数据表名称#] */
    delete from db_tdfutu.tb_tdfuap_sumcommand 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.1262";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @记录序号# = 0 ; */
    set v_row_id = 0 ;
    loop_label:loop

        /* 调用【原子_交易期货_指令_循环锁定获取指令】*/
        call db_tdfutu.pra_tdfuap_LoopLockGetComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_error_code,
            v_error_info,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_code,
            v_contrc_type,
            v_asset_type,
            v_contrc_dir,
            v_hedge_type,
            v_comm_date,
            v_comm_time,
            v_comm_id,
            v_comm_batch_no,
            v_comm_opor,
            v_comm_executor,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_comm_amt,
            v_order_qty,
            v_comm_cancel_qty,
            v_strike_amt,
            v_strike_qty,
            v_comm_frozen_amt,
            v_comm_frozen_qty,
            v_capit_reback_days,
            v_posi_reback_days,
            v_strike_status,
            v_comm_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_date,
            v_comm_comple_time,
            v_comm_appr_date,
            v_comm_appr_time,
            v_comm_appr_status,
            v_comm_appr_oper_no,
            v_comm_appr_oper,
            v_comm_appr_remark,
            v_external_no,
            v_comb_code,
            v_comm_oper_way,
            v_remark_info,
            v_update_times,
            v_oper_func_code,
            v_pass_no,
            v_out_acco,
            v_rece_margin);

        /* set @记录序号# = @指令序号#; */
        set v_row_id = v_comm_id;

        /* if @错误编码#="0" then */
        if v_error_code="0" then

            /* if @指令审批状态# = 《指令审批状态-审批通过》 or @指令审批状态# = 《指令审批状态-不审批》 then */
            if v_comm_appr_status = "2" or v_comm_appr_status = "4" then

                /* set @指令审批数量# = @指令数量#; */
                set v_comm_appr_qty = v_comm_qty;
            else

                /* set @指令审批数量# = 0; */
                set v_comm_appr_qty = 0;
            end if;

            /* 调用【原子_交易期货_指令_指令更新汇总指令】*/
            call db_tdfutu.pra_tdfuap_CommUpdateSumComm(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_oper_func_code,
                v_init_date,
                v_comm_date,
                v_comm_time,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_exch_crncy_type,
                v_exch_no,
                v_futu_acco_no,
                v_contrc_code_no,
                v_contrc_code,
                v_contrc_type,
                v_contrc_dir,
                v_hedge_type,
                v_asset_type,
                v_comm_opor,
                v_comm_executor,
                v_comm_batch_no,
                v_comm_dir,
                v_comm_limit_price,
                v_limit_actual_price,
                v_comm_qty,
                v_comm_amt,
                v_order_qty,
                v_comm_cancel_qty,
                v_strike_amt,
                v_strike_qty,
                v_comm_appr_qty,
                v_comm_begin_date,
                v_comm_end_date,
                v_comm_begin_time,
                v_comm_end_time,
                v_strike_status,
                v_comm_status,
                v_comm_appr_status,
                v_comm_oper_way,
                v_rece_margin,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdfutuA.1.4.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_指令_指令更新汇总指令出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        else

            /* set @错误编码#="0"; */
            set v_error_code="0";

            /* set @错误信息#=' '; */
            set v_error_info=' ';
            leave loop_label;
        end if;
    end loop;

    /* [更新表记录][交易期货_指令_指令汇总表][{初始化日期}=@下日初始化日期#][1=1][1012][@下日初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfuap_sumcommand set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1012";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易期货_交易_订单表][字段][{订单日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_tdfutu_his.tb_tdfutd_order_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way 
        from db_tdfutu.tb_tdfutd_order 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_交易_订单表][{订单日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_tdfutu.tb_tdfutd_order 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易期货_交易_订单汇总表^"; */
    set v_table_name = "db_tdfutu.tb_tdfutd_sumorder";

    /* [数据归历史][交易期货_交易_订单汇总表][字段][{订单日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_tdfutu_his.tb_tdfutd_sumorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        crncy_type, exch_no, contrc_code_no, contrc_code, 
        asset_type, contrc_type, contrc_unit, external_no, 
        order_batch_no, order_date, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_qty, strike_aver_price, 
        strike_amt, trade_fee, trade_commis, other_commis, 
        strike_commis, strike_other_commis, report_fee, wtdraw_fee, 
        strike_all_fee, rece_margin, order_oper_way) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        crncy_type, exch_no, contrc_code_no, contrc_code, 
        asset_type, contrc_type, contrc_unit, external_no, 
        order_batch_no, order_date, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_qty, strike_aver_price, 
        strike_amt, trade_fee, trade_commis, other_commis, 
        strike_commis, strike_other_commis, report_fee, wtdraw_fee, 
        strike_all_fee, rece_margin, order_oper_way 
        from db_tdfutu.tb_tdfutd_sumorder 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_交易_订单汇总表][{订单日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_tdfutu.tb_tdfutd_sumorder 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易期货_交易_撤单表][字段][{撤单日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_tdfutu_his.tb_tdfutd_wtdraw_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, external_no, 
        wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
        order_id, report_date, report_time, report_no, 
        wtdraw_status, wtdraw_qty, wtdraw_remark) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, external_no, 
        wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
        order_id, report_date, report_time, report_no, 
        wtdraw_status, wtdraw_qty, wtdraw_remark 
        from db_tdfutu.tb_tdfutd_wtdraw 
        where wtdraw_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_交易_撤单表][{撤单日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_tdfutu.tb_tdfutd_wtdraw 
        where wtdraw_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易期货_报盘_订单回报表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_tdfutu_his.tb_tdfurp_orderrsp_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, rsp_status, 
        rsp_info, deal_status, sett_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, rsp_status, 
        rsp_info, deal_status, sett_flag 
        from db_tdfutu.tb_tdfurp_orderrsp 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_报盘_订单回报表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_tdfutu.tb_tdfurp_orderrsp 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易期货_报盘_成交回报表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_tdfutu_his.tb_tdfurp_executionrsp_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, contrc_dir, 
        hedge_type, strike_price, strike_qty, strike_amt, 
        rsp_info, deal_status, sett_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, contrc_dir, 
        hedge_type, strike_price, strike_qty, strike_amt, 
        rsp_info, deal_status, sett_flag 
        from db_tdfutu.tb_tdfurp_executionrsp 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_报盘_成交回报表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_tdfutu.tb_tdfurp_executionrsp 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易期货_报盘_成交表][字段][{订单日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_tdfutu_his.tb_tdfurp_execution_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, crncy_type, 
        exch_no, futu_acco_no, contrc_code_no, contrc_code, 
        contrc_type, contrc_unit, comm_id, comm_batch_no, 
        strike_date, strike_time, strike_no, report_date, 
        report_no, order_date, order_time, order_id, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, strike_qty, strike_price, strike_amt, 
        strike_fee, close_pandl, strike_margin, order_oper_way) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, crncy_type, 
        exch_no, futu_acco_no, contrc_code_no, contrc_code, 
        contrc_type, contrc_unit, comm_id, comm_batch_no, 
        strike_date, strike_time, strike_no, report_date, 
        report_no, order_date, order_time, order_id, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, strike_qty, strike_price, strike_amt, 
        strike_fee, close_pandl, strike_margin, order_oper_way 
        from db_tdfutu.tb_tdfurp_execution 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_报盘_成交表][{订单日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_tdfutu.tb_tdfurp_execution 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [获取机器日期][@机器日期#] */
    select date_format(curdate(),'%Y%m%d') into v_mach_date;


    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;

    #保证金优惠控制表,先全部删除当日,然后再插入总计的

    /* [删除表记录][交易期货_账户_期货保证金优惠控制表][1=1][3][@初始化日期#] */
    delete from db_tdfutu.tb_tdfuac_margin_ctrl 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #保证金优惠控制表,对交易组的多头/空头持仓占用保证金,持仓占用金额进行重新赋值,其他的交易字段置0
    #insert into ~交易期货_账户_期货保证金优惠控制表^  ({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{机构编号},{套保标志},{产品编号},{交易组编号},{资产账户编号},{交易币种},{市场编号},{组合编码},{多头指令保证金},{空头指令保证金},{多头订单保证金},{空头订单保证金},{多头成交保证金},{空头成交保证金},{多头持仓保证金},{空头持仓保证金},{交易占用金额},{持仓占用金额}) select @机器日期# as {创建日期},@机器时间# as {创建时间},@机器日期# as {更新日期},@机器时间# as {更新时间},1 as {更新次数},{机构编号},{套保标志},{产品编号},{交易组编号},{资产账户编号},{交易币种},{市场编号},{组合编码},0 as {多头指令保证金},0 as {空头指令保证金},0 as {多头订单保证金},0 as {空头订单保证金},0 as {多头成交保证金},0 as {空头成交保证金},sum(case when {多空类型}=1 then {应收保证金} else 0 end) as {多头持仓保证金},sum(case when {多空类型}=2 then {应收保证金} else 0 end) as {空头持仓保证金},0 as {交易占用金额},greatest(sum(case when {多空类型}=1 then {应收保证金} else 0 end),sum(case when {多空类型}=2 then {应收保证金} else 0 end)) as {持仓占用金额} from ~交易期货_账户_交易组业务持仓表^  group by {机构编号},{套保标志},{产品编号},{交易组编号},{资产账户编号},{交易币种},{市场编号},{组合编码};
    #保证金优惠控制表,对产品的多头/空头持仓占用保证金,持仓占用金额进行重新赋值,其他的交易字段置0
    #insert into ~交易期货_账户_期货保证金优惠控制表^  ({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{机构编号},{套保标志},{产品编号},{交易组编号},{资产账户编号},{交易币种},{市场编号},{组合编码},{多头指令保证金},{空头指令保证金},{多头订单保证金},{空头订单保证金},{多头成交保证金},{空头成交保证金},{多头持仓保证金},{空头持仓保证金},{交易占用金额},{持仓占用金额}) select @机器日期# as {创建日期},@机器时间# as {创建时间},@机器日期# as {更新日期},@机器时间# as {更新时间},1 as {更新次数},{机构编号},{套保标志},{产品编号},0 as{交易组编号},{资产账户编号},{交易币种},{市场编号},{组合编码},0 as {多头指令保证金},0 as {空头指令保证金},0 as {多头订单保证金},0 as {空头订单保证金},0 as {多头成交保证金},0 as {空头成交保证金},sum(case when {多空类型}=1 then {应收保证金} else 0 end) as {多头持仓保证金},sum(case when {多空类型}=2 then {应收保证金} else 0 end) as {空头持仓保证金},0 as {交易占用金额},greatest(sum(case when {多空类型}=1 then {应收保证金} else 0 end),sum(case when {多空类型}=2 then {应收保证金} else 0 end)) as {持仓占用金额} from ~交易期货_账户_交易组业务持仓表^  group by {机构编号},{套保标志},{产品编号},{资产账户编号},{交易币种},{市场编号},{组合编码};

    /* [不分日期数据归历史][交易期货_账户_交易组业务资金表][字段][1][@初始化日期#] */
    insert into db_tdfutu_his.tb_tdfuac_exgp_busi_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_capt_amt, 
        trade_releas_amt, strike_capt_amt, strike_releas_amt, capt_margin, 
        trade_fee, strike_fee, close_pandl, marked_pandl) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_capt_amt, 
        trade_releas_amt, strike_capt_amt, strike_releas_amt, capt_margin, 
        trade_fee, strike_fee, close_pandl, marked_pandl 
        from db_tdfutu.tb_tdfuac_exgp_busi_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_账户_交易组业务资金表][1=1][3][@初始化日期#] */
    delete from db_tdfutu.tb_tdfuac_exgp_busi_capit 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易期货_账户_交易组业务持仓表][字段][1][@初始化日期#] */
    insert into db_tdfutu_his.tb_tdfuac_exgp_busi_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
        lngsht_type, hedge_type, comb_code, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
        comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
        trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
        pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
        pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
        realize_pandl, close_pandl, open_amount) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_crncy_type, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
        lngsht_type, hedge_type, comb_code, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
        comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
        trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_releas_qty, 
        pre_comm_capt_qty, today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, 
        pre_strike_capt_qty, today_strike_capt_qty, rece_margin, pre_settle_price, 
        realize_pandl, close_pandl, open_amount 
        from db_tdfutu.tb_tdfuac_exgp_busi_posi;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_账户_交易组业务持仓表][1=1][3][@初始化日期#] */
    delete from db_tdfutu.tb_tdfuac_exgp_busi_posi 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易期货_账户_资产账户业务资金表][字段][1][@初始化日期#] */
    insert into db_tdfutu_his.tb_tdfuac_asac_busi_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, comm_frozen_amt, comm_unfroz_amt, 
        comm_capt_amt, comm_releas_amt, trade_capt_amt, trade_releas_amt, 
        strike_capt_amt, strike_releas_amt, capt_margin, trade_fee, 
        strike_fee, close_pandl, marked_pandl) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, comm_frozen_amt, comm_unfroz_amt, 
        comm_capt_amt, comm_releas_amt, trade_capt_amt, trade_releas_amt, 
        strike_capt_amt, strike_releas_amt, capt_margin, trade_fee, 
        strike_fee, close_pandl, marked_pandl 
        from db_tdfutu.tb_tdfuac_asac_busi_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_账户_资产账户业务资金表][1=1][3][@初始化日期#] */
    delete from db_tdfutu.tb_tdfuac_asac_busi_capit 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易期货_账户_资产账户业务持仓表][字段][1][@初始化日期#] */
    insert into db_tdfutu_his.tb_tdfuac_asac_busi_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
        hedge_type, comb_code, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
        comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
        trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
        today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
        today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
        close_pandl, open_amount) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, contrc_unit, lngsht_type, 
        hedge_type, comb_code, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
        comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
        trade_capt_qty, trade_releas_qty, strike_releas_qty, pre_comm_capt_qty, 
        today_comm_capt_qty, old_trade_capt_qty, today_trade_capt_qty, pre_strike_capt_qty, 
        today_strike_capt_qty, rece_margin, pre_settle_price, realize_pandl, 
        close_pandl, open_amount 
        from db_tdfutu.tb_tdfuac_asac_busi_posi;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_账户_资产账户业务持仓表][1=1][3][@初始化日期#] */
    delete from db_tdfutu.tb_tdfuac_asac_busi_posi 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易期货_账户_交易组持仓明细表][字段][1][@初始化日期#] */
    insert into db_tdfutu_his.tb_tdfuac_exgp_posi_detail_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, exch_crncy_type, 
        futu_acco_no, contrc_code_no, contrc_unit, contrc_type, 
        curr_qty, invest_type, lngsht_type, hedge_type, 
        open_posi_date, open_posi_time, open_posi_price, open_posi_qty, 
        open_amount, open_posi_fee, close_posi_fee, trade_capt_qty, 
        strike_capt_qty, marked_sett_price, strike_no, detail_posi_id, 
        rece_margin, close_pandl, marked_pandl) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, exch_crncy_type, 
        futu_acco_no, contrc_code_no, contrc_unit, contrc_type, 
        curr_qty, invest_type, lngsht_type, hedge_type, 
        open_posi_date, open_posi_time, open_posi_price, open_posi_qty, 
        open_amount, open_posi_fee, close_posi_fee, trade_capt_qty, 
        strike_capt_qty, marked_sett_price, strike_no, detail_posi_id, 
        rece_margin, close_pandl, marked_pandl 
        from db_tdfutu.tb_tdfuac_exgp_posi_detail;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_账户_交易组持仓明细表][1=1][3][@初始化日期#] */
    delete from db_tdfutu.tb_tdfuac_exgp_posi_detail 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易期货_交易_改单表^"; */
    set v_table_name = "db_tdfutu.tb_tdfutd_modifyorder";

    /* [数据归历史][交易期货_交易_改单表][字段][{改单日期}<=@初始化日期#][1011][@初始化日期#,@数据表名称#] */
    insert into db_tdfutu_his.tb_tdfutd_modifyorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_no, contrc_code_no, contrc_code, contrc_type, 
        asset_type, modi_order_date, modi_order_time, modi_batch_no, 
        order_id, comm_id, order_price, order_qty, 
        order_dir, contrc_dir, hedge_type, order_date, 
        order_time, price_type, modi_order_price, modi_order_qty, 
        modi_order_status, modi_price_type, crncy_type, exch_crncy_type, 
        new_order_id, remark_info, order_oper_way) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_no, contrc_code_no, contrc_code, contrc_type, 
        asset_type, modi_order_date, modi_order_time, modi_batch_no, 
        order_id, comm_id, order_price, order_qty, 
        order_dir, contrc_dir, hedge_type, order_date, 
        order_time, price_type, modi_order_price, modi_order_qty, 
        modi_order_status, modi_price_type, crncy_type, exch_crncy_type, 
        new_order_id, remark_info, order_oper_way 
        from db_tdfutu.tb_tdfutd_modifyorder 
        where modi_order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.1.4.1011";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易期货_交易_改单表][{改单日期}<=@初始化日期#][1012][@初始化日期#,@数据表名称#] */
    delete from db_tdfutu.tb_tdfutd_modifyorder 
        where modi_order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdfutuA.1.4.1012";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


