DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_公用_增加处理错误信息记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsepb_AddDealError;;
DELIMITER ;;
CREATE PROCEDURE pra_clsepb_AddDealError(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_busi_func_code varchar(16),
    IN p_log_error_code varchar(32),
    IN p_log_error_info varchar(255),
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
    declare v_busi_func_code varchar(16);
    declare v_log_error_code varchar(32);
    declare v_log_error_info varchar(255);
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
    SET v_init_date = p_init_date;
    SET v_busi_func_code = p_busi_func_code;
    SET v_log_error_code = p_log_error_code;
    SET v_log_error_info = p_log_error_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][清算证券_公用_处理错误信息表][字段][字段变量][1][@初始化日期#,@业务功能编码#,@日志错误编码#,@日志错误信息#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsepb_deal_error(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, busi_func_code, 
        log_error_code, log_error_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_busi_func_code, 
        v_log_error_code, v_log_error_info);
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.6.1";
        SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","业务功能编码=",v_busi_func_code,",","日志错误编码=",v_log_error_code,",","日志错误信息=",v_log_error_info),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_公用_检查处理状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsepb_CheckDealStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_clsepb_CheckDealStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_sett_flow_step int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_sett_deal_status varchar(2)
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
    declare v_exch_no int;
    declare v_sett_flow_step int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sett_deal_status varchar(2);
    declare v_tmp_sett_flow_step int;

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
    SET v_exch_no = p_exch_no;
    SET v_sett_flow_step = p_sett_flow_step;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sett_deal_status = "0";
    SET v_tmp_sett_flow_step = 0;

    
    label_pro:BEGIN
    

    /* set @临时_清算步骤# = @清算步骤#; */
    set v_tmp_sett_flow_step = v_sett_flow_step;
    #获得上一步骤，1成交转入 2清算处理 3合并清算处理 4清算入账 5结算处理 6结算入账 7数据归历史

    /* if @清算步骤# = 《清算步骤-清算处理》 then */
    if v_sett_flow_step = 2 then

        /* set @清算步骤# = 《清算步骤-成交转入》; */
        set v_sett_flow_step = 1;

    /* elseif @清算步骤# = 《清算步骤-合并清算处理》 then */
    elseif v_sett_flow_step = 3 then

        /* set @清算步骤# = 《清算步骤-清算处理》; */
        set v_sett_flow_step = 2;

    /* elseif @清算步骤# = 《清算步骤-清算入账》 then */
    elseif v_sett_flow_step = 4 then

        /* set @清算步骤# = 《清算步骤-合并清算处理》; */
        set v_sett_flow_step = 3;

    /* elseif @清算步骤# = 《清算步骤-结算处理》 then */
    elseif v_sett_flow_step = 5 then

        /* set @清算步骤# = 《清算步骤-清算入账》; */
        set v_sett_flow_step = 4;

    /* elseif @清算步骤# = 《清算步骤-结算入账》 then */
    elseif v_sett_flow_step = 6 then

        /* set @清算步骤# = 《清算步骤-结算处理》; */
        set v_sett_flow_step = 5;

    /* elseif @清算步骤# = 《清算步骤-数据归历史》 then */
    elseif v_sett_flow_step = 7 then

        /* set @清算步骤# = 《清算步骤-结算入账》; */
        set v_sett_flow_step = 6;
    else

        /* [报错返回][1][@清算步骤#] */
            
            SET v_error_code = "clsecuA.1.11.1";
            SET v_error_info = concat("清算步骤=",v_sett_flow_step);
            leave label_pro;

    end if;

    /* if @清算步骤# <> 《清算步骤-成交转入》 then */
    if v_sett_flow_step <> 1 then
        #检查上一步骤是状态

        /* [获取表记录变量][清算证券_公用_处理状态表][{清算结算处理状态}][@清算结算处理状态#][{初始化日期}=@初始化日期# and {市场编号}=@市场编号# and {清算步骤}=@清算步骤#][2][@初始化日期#,@市场编号#,@清算步骤#] */
        select sett_deal_status into v_sett_deal_status from db_clsecu.tb_clsepb_deal_status where init_date=v_init_date and exch_no=v_exch_no and sett_flow_step=v_sett_flow_step limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "clsecuA.1.11.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no,",","清算步骤=",v_sett_flow_step),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no,",","清算步骤=",v_sett_flow_step);
            end if;
            leave label_pro;
        end if;

        #上一步骤未完成，则报错返回。上一步骤完成标志应在取不到记录后设置

        /* if @清算结算处理状态# = 《清算结算处理状态-未完成》 then */
        if v_sett_deal_status = "1" then

            /* [报错返回][3][@清算步骤#,@清算结算处理状态#] */
                
                SET v_error_code = "clsecuA.1.11.3";
                SET v_error_info = concat("清算步骤=",v_sett_flow_step,",","清算结算处理状态=",v_sett_deal_status);
                leave label_pro;

        end if;
        #上一步骤已完成，则需进行数据统计

        /* if @清算结算处理状态# = 《清算结算处理状态-已完成》 then */
        if v_sett_deal_status = "2" then

            /* 调用【原子_清算证券_公用_处理流程统计】*/
            call db_clsecu.pra_clsepb_DealFlowTotal(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_exch_no,
                v_sett_flow_step,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "clsecuA.1.11.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_公用_处理流程统计出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @清算结算处理状态# = 《清算结算处理状态-数据统计完成》; */
            set v_sett_deal_status = "3";
        end if;
        #上一步骤数据统计完成，则检查通过。如果后续要对统计结果进行检查控制，可在此加入
        #if @清算结算处理状态# = 《清算结算处理状态-数据统计完成》 then
        #    [原子_清算证券_公用_检查处理流程正确性]
        #end if;
    end if;

    /* set @清算步骤# = @临时_清算步骤#; */
    set v_sett_flow_step = v_tmp_sett_flow_step;
    #检查当前步骤处理状态，未完成则正常返回，已完成则报错返回

    /* [获取表记录变量][清算证券_公用_处理状态表][{清算结算处理状态}][@清算结算处理状态#][{初始化日期}=@初始化日期# and {市场编号}=@市场编号# and {清算步骤}=@清算步骤#][2][@初始化日期#,@市场编号#,@清算步骤#] */
    select sett_deal_status into v_sett_deal_status from db_clsecu.tb_clsepb_deal_status where init_date=v_init_date and exch_no=v_exch_no and sett_flow_step=v_sett_flow_step limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clsecuA.1.11.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no,",","清算步骤=",v_sett_flow_step),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no,",","清算步骤=",v_sett_flow_step);
        end if;
        leave label_pro;
    end if;


    /* if @清算结算处理状态# = 《清算结算处理状态-已完成》 or @清算结算处理状态# = 《清算结算处理状态-数据统计完成》 then */
    if v_sett_deal_status = "2" or v_sett_deal_status = "3" then

        /* [报错返回][4][@清算步骤#,@清算结算处理状态#] */
            
            SET v_error_code = "clsecuA.1.11.4";
            SET v_error_info = concat("清算步骤=",v_sett_flow_step,",","清算结算处理状态=",v_sett_deal_status);
            leave label_pro;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_sett_deal_status = v_sett_deal_status;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_公用_更新处理状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsepb_UpdateDealStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_clsepb_UpdateDealStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_sett_flow_step int,
    IN p_sett_deal_status varchar(2),
    IN p_remark_info varchar(255),
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
    declare v_exch_no int;
    declare v_sett_flow_step int;
    declare v_sett_deal_status varchar(2);
    declare v_remark_info varchar(255);
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
    SET v_init_date = p_init_date;
    SET v_exch_no = p_exch_no;
    SET v_sett_flow_step = p_sett_flow_step;
    SET v_sett_deal_status = p_sett_deal_status;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][清算证券_公用_处理状态表][字段][字段变量][{清算结算处理状态}=@清算结算处理状态#, {备注信息}=@备注信息#][1][@初始化日期#,@市场编号#,@清算步骤#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsepb_deal_status (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, exch_no, 
        sett_flow_step, sett_deal_status, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_exch_no, 
        v_sett_flow_step, v_sett_deal_status, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, sett_deal_status=v_sett_deal_status, remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.12.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no,",","清算步骤=",v_sett_flow_step),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no,",","清算步骤=",v_sett_flow_step);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_公用_数据归历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsepb_DataToHis;;
DELIMITER ;;
CREATE PROCEDURE pra_clsepb_DataToHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [数据归历史][清算证券_公用_处理错误信息表][字段][{初始化日期}<@初始化日期#][1][@初始化日期#] */
    insert into db_clsecu_his.tb_clsepb_deal_error_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        busi_func_code, log_error_code, log_error_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        busi_func_code, log_error_code, log_error_info 
        from db_clsecu.tb_clsepb_deal_error 
        where init_date<v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_公用_处理错误信息表][{初始化日期}<@初始化日期#][3][@初始化日期#] */
    delete from db_clsecu.tb_clsepb_deal_error 
        where init_date<v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.1.21.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_公用_处理流程统计表][字段][{初始化日期}<@初始化日期#][1][@初始化日期#] */
    insert into db_clsecu_his.tb_clsepb_flow_total_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        exch_no, sett_flow_step, total_count, total_amt, 
        total_succ_count, total_succ_amt, total_fail_count, total_fail_amt) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        exch_no, sett_flow_step, total_count, total_amt, 
        total_succ_count, total_succ_amt, total_fail_count, total_fail_amt 
        from db_clsecu.tb_clsepb_flow_total 
        where init_date<v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_公用_处理流程统计表][{初始化日期}<@初始化日期#][3][@初始化日期#] */
    delete from db_clsecu.tb_clsepb_flow_total 
        where init_date<v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.1.21.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_清算_成交表][字段][{初始化日期}<@初始化日期# and {成交日期}<@初始化日期#][1][@初始化日期#] */
    insert into db_clsecu_his.tb_clsecl_strike_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, exch_rate, exch_no, stock_acco_no, 
        stock_code_no, target_stock_code_no, stock_type, asset_type, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        strike_price, strike_qty, strike_amt, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, trade_code_no, target_code_no, 
        arrive_date, capit_reback_days, posi_reback_days, net_price_flag, 
        intrst_days, par_value, bond_accr_intrst, bond_rate_type, 
        impawn_ratio, clear_entry_type, busi_jour_no, repo_pd_jour_no, 
        deal_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, exch_rate, exch_no, stock_acco_no, 
        stock_code_no, target_stock_code_no, stock_type, asset_type, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        strike_price, strike_qty, strike_amt, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, trade_code_no, target_code_no, 
        arrive_date, capit_reback_days, posi_reback_days, net_price_flag, 
        intrst_days, par_value, bond_accr_intrst, bond_rate_type, 
        impawn_ratio, clear_entry_type, busi_jour_no, repo_pd_jour_no, 
        deal_flag 
        from db_clsecu.tb_clsecl_strike 
        where init_date<v_init_date and strike_date<v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_清算_成交表][{初始化日期}<@初始化日期# and {成交日期}<@初始化日期#][3][@初始化日期#] */
    delete from db_clsecu.tb_clsecl_strike 
        where init_date<v_init_date and strike_date<v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.1.21.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_清算_待入账记录表][字段][{初始化日期}<@初始化日期# and {入账日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_clsecu_his.tb_clsecl_pre_entry_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_rate, exch_no, stock_acco_no, stock_code_no, 
        target_stock_code_no, stock_type, asset_type, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_date, order_time, order_no, 
        order_dir, order_price, order_qty, strike_price, 
        strike_qty, strike_amt, strike_num, pre_entry_qty, 
        pre_entry_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, busi_flag, entry_status, undo_status, 
        busi_jour_no, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        trade_code_no, target_code_no, arrive_date, intrst_days, 
        bond_accr_intrst, bond_rate_type, impawn_ratio) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_rate, exch_no, stock_acco_no, stock_code_no, 
        target_stock_code_no, stock_type, asset_type, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_date, order_time, order_no, 
        order_dir, order_price, order_qty, strike_price, 
        strike_qty, strike_amt, strike_num, pre_entry_qty, 
        pre_entry_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, busi_flag, entry_status, undo_status, 
        busi_jour_no, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        trade_code_no, target_code_no, arrive_date, intrst_days, 
        bond_accr_intrst, bond_rate_type, impawn_ratio 
        from db_clsecu.tb_clsecl_pre_entry 
        where init_date<v_init_date and entry_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_清算_待入账记录表][{初始化日期}<@初始化日期# and {入账日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_clsecu.tb_clsecl_pre_entry 
        where init_date<v_init_date and entry_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.1.21.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_清算_入账异常表][字段][{初始化日期}<@初始化日期#][1][@初始化日期#] */
    insert into db_clsecu_his.tb_clsecl_entry_error_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        undo_error_no, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        undo_error_no, remark_info 
        from db_clsecu.tb_clsecl_entry_error 
        where init_date<v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_清算_入账异常表][{初始化日期}<@初始化日期#][3][@初始化日期#] */
    delete from db_clsecu.tb_clsecl_entry_error 
        where init_date<v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.1.21.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_清算_合并清算表][字段][{初始化日期}<@初始化日期#][1][@初始化日期#] */
    insert into db_clsecu_his.tb_clsecl_merge_clear_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, exch_rate, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_date, order_time, order_no, 
        order_dir, order_price, order_qty, strike_num, 
        strike_aver_price, pre_entry_qty, pre_entry_amt, split_strike_qty, 
        split_strike_amt, split_stamp_tax, split_trans_fee, split_brkage, 
        split_SEC_charges, split_other_fee, split_brkage_commis, split_other_commis, 
        split_trade_tax, split_trade_cost_fee, split_trade_system_use_fee, split_stock_settle_fee, 
        trade_code_no, target_code_no, arrive_date, capit_reback_days, 
        posi_reback_days, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, clear_entry_type, 
        busi_flag, deal_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, exch_rate, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_date, order_time, order_no, 
        order_dir, order_price, order_qty, strike_num, 
        strike_aver_price, pre_entry_qty, pre_entry_amt, split_strike_qty, 
        split_strike_amt, split_stamp_tax, split_trans_fee, split_brkage, 
        split_SEC_charges, split_other_fee, split_brkage_commis, split_other_commis, 
        split_trade_tax, split_trade_cost_fee, split_trade_system_use_fee, split_stock_settle_fee, 
        trade_code_no, target_code_no, arrive_date, capit_reback_days, 
        posi_reback_days, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, clear_entry_type, 
        busi_flag, deal_flag 
        from db_clsecu.tb_clsecl_merge_clear 
        where init_date<v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_清算_合并清算表][{初始化日期}<@初始化日期#][3][@初始化日期#] */
    delete from db_clsecu.tb_clsecl_merge_clear 
        where init_date<v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.1.21.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_清算_统计表][字段][{初始化日期}<@初始化日期#][1][@初始化日期#] */
    insert into db_clsecu_his.tb_clsecl_clear_total_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, busi_flag, 
        clear_num, order_dir, strike_num, strike_aver_price, 
        strike_qty, strike_amt, entry_qty, entry_amt, 
        all_fee, stamp_tax, trans_fee, brkage_fee, 
        SEC_charges, other_fee, trade_commis, chann_commis, 
        divi_commis, other_commis) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, busi_flag, 
        clear_num, order_dir, strike_num, strike_aver_price, 
        strike_qty, strike_amt, entry_qty, entry_amt, 
        all_fee, stamp_tax, trans_fee, brkage_fee, 
        SEC_charges, other_fee, trade_commis, chann_commis, 
        divi_commis, other_commis 
        from db_clsecu.tb_clsecl_clear_total 
        where init_date<v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_清算_统计表][{初始化日期}<@初始化日期#][3][@初始化日期#] */
    delete from db_clsecu.tb_clsecl_clear_total 
        where init_date<v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.1.21.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_结算_新股中签表][字段][{初始化日期}<@初始化日期# and {成交日期}<@初始化日期#][1][@初始化日期#] */
    insert into db_clsecu_his.tb_clsest_new_shares_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt 
        from db_clsecu.tb_clsest_new_shares 
        where init_date<v_init_date and strike_date<v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_结算_新股中签表][{初始化日期}<@初始化日期# and {成交日期}<@初始化日期#][3][@初始化日期#] */
    delete from db_clsecu.tb_clsest_new_shares 
        where init_date<v_init_date and strike_date<v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.1.21.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_结算_新股申购表][字段][{初始化日期}<@初始化日期# and {处理标志} =《处理标志-已处理》][1][@初始化日期#] */
    insert into db_clsecu_his.tb_clsest_new_report_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, dist_qty, 
        nav_asset, deal_flag, trade_code_no, target_code_no) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, dist_qty, 
        nav_asset, deal_flag, trade_code_no, target_code_no 
        from db_clsecu.tb_clsest_new_report 
        where init_date<v_init_date and deal_flag =1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_结算_新股申购表][{初始化日期}<@初始化日期# and {处理标志} =《处理标志-已处理》][3][@初始化日期#] */
    delete from db_clsecu.tb_clsest_new_report 
        where init_date<v_init_date and deal_flag =1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.1.21.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_结算_可转债中签表][字段][{初始化日期}<@初始化日期# and {成交日期}<@初始化日期#][1][@初始化日期#] */
    insert into db_clsecu_his.tb_clsest_convertible_bond_shares_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt 
        from db_clsecu.tb_clsest_convertible_bond_shares 
        where init_date<v_init_date and strike_date<v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_结算_可转债中签表][{初始化日期}<@初始化日期# and {成交日期}<@初始化日期#][3][@初始化日期#] */
    delete from db_clsecu.tb_clsest_convertible_bond_shares 
        where init_date<v_init_date and strike_date<v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.1.21.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_结算_可转债申购表][字段][{初始化日期}<@初始化日期# and {处理标志} =《处理标志-已处理》][1][@初始化日期#] */
    insert into db_clsecu_his.tb_clsest_convertible_bond_report_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, dist_qty, 
        nav_asset, deal_flag, trade_code_no, target_code_no) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, dist_qty, 
        nav_asset, deal_flag, trade_code_no, target_code_no 
        from db_clsecu.tb_clsest_convertible_bond_report 
        where init_date<v_init_date and deal_flag =1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_结算_可转债申购表][{初始化日期}<@初始化日期# and {处理标志} =《处理标志-已处理》][3][@初始化日期#] */
    delete from db_clsecu.tb_clsest_convertible_bond_report 
        where init_date<v_init_date and deal_flag =1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.1.21.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_结算_回购表][字段][{初始化日期}<@初始化日期# and {回购处理状态} = 《回购处理状态-已处理》][1][@初始化日期#] */
    insert into db_clsecu_his.tb_clsest_repurchase_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, strike_date, 
        strike_no, order_dir, repo_qty, repo_amt, 
        repo_rate, repo_trade_date, repo_order_id, repo_strike_id, 
        intrst_days, repo_cale_days, repo_back_date, repo_back_trade_date, 
        repo_back_amt, repo_back_intrst, repo_status, busi_flag, 
        trade_code_no, target_code_no) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, strike_date, 
        strike_no, order_dir, repo_qty, repo_amt, 
        repo_rate, repo_trade_date, repo_order_id, repo_strike_id, 
        intrst_days, repo_cale_days, repo_back_date, repo_back_trade_date, 
        repo_back_amt, repo_back_intrst, repo_status, busi_flag, 
        trade_code_no, target_code_no 
        from db_clsecu.tb_clsest_repurchase 
        where init_date<v_init_date and repo_status = "1";
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_结算_回购表][{初始化日期}<@初始化日期# and {回购处理状态} = 《回购处理状态-已处理》][3][@初始化日期#] */
    delete from db_clsecu.tb_clsest_repurchase 
        where init_date<v_init_date and repo_status = "1";
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.1.21.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_结算_提前待入账记录表][字段][{初始化日期}<@初始化日期# and {到账日期} < @初始化日期#][1][@初始化日期#] */
    insert into db_clsecu_his.tb_clsest_before_preentry_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, trade_code_no, target_code_no, 
        stock_type, asset_type, pre_entry_qty, pre_entry_amt, 
        impawn_ratio, bond_accr_intrst, busi_flag, act_record_flag, 
        acco_entry_flag, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        entry_status, reg_date, arrive_date, begin_trade_date) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, trade_code_no, target_code_no, 
        stock_type, asset_type, pre_entry_qty, pre_entry_amt, 
        impawn_ratio, bond_accr_intrst, busi_flag, act_record_flag, 
        acco_entry_flag, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        entry_status, reg_date, arrive_date, begin_trade_date 
        from db_clsecu.tb_clsest_before_preentry 
        where init_date<v_init_date and arrive_date < v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_结算_提前待入账记录表][{初始化日期}<@初始化日期# and {到账日期} < @初始化日期#][3][@初始化日期#] */
    delete from db_clsecu.tb_clsest_before_preentry 
        where init_date<v_init_date and arrive_date < v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.1.21.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #[数据归历史][清算证券_结算_待入账记录表][字段][{初始化日期}<@初始化日期# and {入账日期}<=@初始化日期#][1][@初始化日期#]
    #[删除表记录][清算证券_结算_待入账记录表][{初始化日期}<@初始化日期# and {入账日期}<=@初始化日期#][3][@初始化日期#]

    /* [数据归历史][清算证券_结算_入账异常表][字段][{初始化日期}<@初始化日期#][1][@初始化日期#] */
    insert into db_clsecu_his.tb_clsest_entry_error_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, order_dir, 
        strike_date, strike_no, strike_price, strike_qty, 
        strike_amt, pre_entry_qty, pre_entry_amt, trade_code_no, 
        target_code_no, intrst_days, bond_accr_intrst, impawn_ratio, 
        repo_back_date, busi_flag, undo_error_no, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, order_dir, 
        strike_date, strike_no, strike_price, strike_qty, 
        strike_amt, pre_entry_qty, pre_entry_amt, trade_code_no, 
        target_code_no, intrst_days, bond_accr_intrst, impawn_ratio, 
        repo_back_date, busi_flag, undo_error_no, remark_info 
        from db_clsecu.tb_clsest_entry_error 
        where init_date<v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_结算_入账异常表][{初始化日期}<@初始化日期#][3][@初始化日期#] */
    delete from db_clsecu.tb_clsest_entry_error 
        where init_date<v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.1.21.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_结算_统计表][字段][{初始化日期}<@初始化日期#][1][@初始化日期#] */
    insert into db_clsecu_his.tb_clsest_settle_total_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_no, stock_acco_no, stock_code_no, 
        busi_flag, sett_num, entry_qty, entry_amt) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_no, stock_acco_no, stock_code_no, 
        busi_flag, sett_num, entry_qty, entry_amt 
        from db_clsecu.tb_clsest_settle_total 
        where init_date<v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_结算_统计表][{初始化日期}<@初始化日期#][3][@初始化日期#] */
    delete from db_clsecu.tb_clsest_settle_total 
        where init_date<v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.1.21.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_公用_重做准备
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsepb_RedoPrepare;;
DELIMITER ;;
CREATE PROCEDURE pra_clsepb_RedoPrepare(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_sett_redo_type int,
    IN p_clear_date int,
    IN p_clear_deal_id bigint,
    IN p_sett_date int,
    IN p_sett_deal_id bigint,
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
    declare v_sett_redo_type int;
    declare v_clear_date int;
    declare v_clear_deal_id bigint;
    declare v_sett_date int;
    declare v_sett_deal_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_status varchar(2);
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
    SET v_init_date = p_init_date;
    SET v_sett_redo_type = p_sett_redo_type;
    SET v_clear_date = p_clear_date;
    SET v_clear_deal_id = p_clear_deal_id;
    SET v_sett_date = p_sett_date;
    SET v_sett_deal_id = p_sett_deal_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #证券清算结算重做准备，从入账前的业务倒着清除各张表记录
    #清算结算重做类型缺省为全部重做

    /* if @清算结算重做类型#=《清算结算重做类型-清算重做》 then */
    if v_sett_redo_type=1 then
        #处理清算证券_清算_成交表记录

        /* truncate table ~清算证券_清算_成交表^; */
        truncate table db_clsecu.tb_clsecl_strike;
        #处理清算证券_清算_待入账记录表

        /* truncate table ~清算证券_清算_待入账记录表^; */
        truncate table db_clsecu.tb_clsecl_pre_entry;
        #再处理清算证券_清算_合并清算表记录

        /* truncate table ~清算证券_清算_合并清算表^; */
        truncate table db_clsecu.tb_clsecl_merge_clear;

    /* elseif @清算结算重做类型#=《清算结算重做类型-结算重做》 then */
    elseif v_sett_redo_type=2 then
        #处理清算证券_结算_待入账记录表

        /* truncate table ~清算证券_结算_待入账记录表^; */
        truncate table db_clsecu.tb_clsest_preentry;

        /* set @入账状态#=《入账状态-未入账》; */
        set v_entry_status="2";

        /* [更新表记录][清算证券_结算_提前待入账记录表][{入账状态}=@入账状态#][{到账日期}=@初始化日期#][2][@初始化日期#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_clsecu.tb_clsest_before_preentry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status=v_entry_status where arrive_date=v_init_date;
        if v_error_code = "1" then
                    
            SET v_error_code = "clsecuA.1.41.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
            leave label_pro;
        end if;

    else
        #处理清算证券_清算_成交表记录

        /* truncate table ~清算证券_清算_成交表^; */
        truncate table db_clsecu.tb_clsecl_strike;
        #处理清算证券_清算_待入账记录表

        /* truncate table ~清算证券_清算_待入账记录表^; */
        truncate table db_clsecu.tb_clsecl_pre_entry;
        #再处理证券合并清算表

        /* truncate table ~清算证券_清算_合并清算表^; */
        truncate table db_clsecu.tb_clsecl_merge_clear;
        #处理清算证券_结算_待入账记录表

        /* truncate table ~清算证券_结算_待入账记录表^; */
        truncate table db_clsecu.tb_clsest_preentry;

        /* set @入账状态#=《入账状态-未入账》; */
        set v_entry_status="2";

        /* [更新表记录][清算证券_结算_提前待入账记录表][{入账状态}=@入账状态#][{到账日期}=@初始化日期#][2][@初始化日期#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_clsecu.tb_clsest_before_preentry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status=v_entry_status where arrive_date=v_init_date;
        if v_error_code = "1" then
                    
            SET v_error_code = "clsecuA.1.41.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_公用_增加处理流程统计数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsepb_AddDealFlowTotal;;
DELIMITER ;;
CREATE PROCEDURE pra_clsepb_AddDealFlowTotal(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_sett_flow_step int,
    IN p_total_count int,
    IN p_total_amt decimal(18,4),
    IN p_total_succ_count int,
    IN p_total_succ_amt decimal(18,4),
    IN p_total_fail_count int,
    IN p_total_fail_amt decimal(18,4),
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
    declare v_exch_no int;
    declare v_sett_flow_step int;
    declare v_total_count int;
    declare v_total_amt decimal(18,4);
    declare v_total_succ_count int;
    declare v_total_succ_amt decimal(18,4);
    declare v_total_fail_count int;
    declare v_total_fail_amt decimal(18,4);
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
    SET v_init_date = p_init_date;
    SET v_exch_no = p_exch_no;
    SET v_sett_flow_step = p_sett_flow_step;
    SET v_total_count = p_total_count;
    SET v_total_amt = p_total_amt;
    SET v_total_succ_count = p_total_succ_count;
    SET v_total_succ_amt = p_total_succ_amt;
    SET v_total_fail_count = p_total_fail_count;
    SET v_total_fail_amt = p_total_fail_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][清算证券_公用_处理流程统计表][字段][字段变量][{总记录数}=@总记录数#, {总金额} = @总金额#,{已处理记录数}=@已处理记录数#, {已处理金额} = @已处理金额#,{未处理记录数}=@未处理记录数#, {未处理金额} = @未处理金额#][1][@初始化日期#,@市场编号#,@清算步骤#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsepb_flow_total (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, exch_no, 
        sett_flow_step, total_count, total_amt, total_succ_count, 
        total_succ_amt, total_fail_count, total_fail_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_exch_no, 
        v_sett_flow_step, v_total_count, v_total_amt, v_total_succ_count, 
        v_total_succ_amt, v_total_fail_count, v_total_fail_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_count=v_total_count, total_amt = v_total_amt,total_succ_count=v_total_succ_count, total_succ_amt = v_total_succ_amt,total_fail_count=v_total_fail_count, total_fail_amt = v_total_fail_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.1.42.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no,",","清算步骤=",v_sett_flow_step),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no,",","清算步骤=",v_sett_flow_step);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_公用_处理流程统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsepb_DealFlowTotal;;
DELIMITER ;;
CREATE PROCEDURE pra_clsepb_DealFlowTotal(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_sett_flow_step int,
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
    declare v_exch_no int;
    declare v_sett_flow_step int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_total_count int;
    declare v_total_amt decimal(18,4);
    declare v_total_succ_count int;
    declare v_total_succ_amt decimal(18,4);
    declare v_total_fail_count int;
    declare v_total_fail_amt decimal(18,4);

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
    SET v_exch_no = p_exch_no;
    SET v_sett_flow_step = p_sett_flow_step;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_total_count = 0;
    SET v_total_amt = 0;
    SET v_total_succ_count = 0;
    SET v_total_succ_amt = 0;
    SET v_total_fail_count = 0;
    SET v_total_fail_amt = 0;

    
    label_pro:BEGIN
    

    /* set @总记录数# = 0; */
    set v_total_count = 0;

    /* set @总金额# = 0; */
    set v_total_amt = 0;

    /* set @已处理记录数# = 0; */
    set v_total_succ_count = 0;

    /* set @已处理金额# = 0; */
    set v_total_succ_amt = 0;

    /* if @清算步骤# = 《清算步骤-成交转入》 then */
    if v_sett_flow_step = 1 then

        /* select count(*), ifnull(sum({成交金额}), 0) into @总记录数#, @总金额# from ~清算证券_清算_成交表^ where {成交日期} = @初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#) ; */
        select count(*), ifnull(sum(strike_amt), 0) into v_total_count, v_total_amt from db_clsecu.tb_clsecl_strike where strike_date = v_init_date and (v_exch_no = 0 or exch_no = v_exch_no) ;

        /* set @已处理记录数# = @总记录数#; */
        set v_total_succ_count = v_total_count;

        /* set @未处理记录数# = 0; */
        set v_total_fail_count = 0;

        /* set @已处理金额# = @总金额#; */
        set v_total_succ_amt = v_total_amt;

        /* set @未处理金额# = 0; */
        set v_total_fail_amt = 0;

        /* 调用【原子_清算证券_公用_增加处理流程统计数据】*/
        call db_clsecu.pra_clsepb_AddDealFlowTotal(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_no,
            v_sett_flow_step,
            v_total_count,
            v_total_amt,
            v_total_succ_count,
            v_total_succ_amt,
            v_total_fail_count,
            v_total_fail_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuA.1.43.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_公用_增加处理流程统计数据出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


    /* elseif @清算步骤# = 《清算步骤-清算处理》 then */
    elseif v_sett_flow_step = 2 then

        /* select count(*), ifnull(sum({成交金额}), 0) into @总记录数#, @总金额# from ~清算证券_清算_成交表^ where {成交日期} = @初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#); */
        select count(*), ifnull(sum(strike_amt), 0) into v_total_count, v_total_amt from db_clsecu.tb_clsecl_strike where strike_date = v_init_date and (v_exch_no = 0 or exch_no = v_exch_no);

        /* select count(*), ifnull(sum({成交金额}), 0) into @已处理记录数#, @已处理金额# from ~清算证券_清算_成交表^ where {成交日期} = @初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#)  and {处理标志} = 《处理标志-已处理》; */
        select count(*), ifnull(sum(strike_amt), 0) into v_total_succ_count, v_total_succ_amt from db_clsecu.tb_clsecl_strike where strike_date = v_init_date and (v_exch_no = 0 or exch_no = v_exch_no)  and deal_flag = 1;

        /* select count(*), ifnull(sum({成交金额}), 0) into @未处理记录数#, @未处理金额# from ~清算证券_清算_成交表^ where {成交日期} = @初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#)  and {处理标志} = 《处理标志-未处理》; */
        select count(*), ifnull(sum(strike_amt), 0) into v_total_fail_count, v_total_fail_amt from db_clsecu.tb_clsecl_strike where strike_date = v_init_date and (v_exch_no = 0 or exch_no = v_exch_no)  and deal_flag = 2;

        /* 调用【原子_清算证券_公用_增加处理流程统计数据】*/
        call db_clsecu.pra_clsepb_AddDealFlowTotal(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_no,
            v_sett_flow_step,
            v_total_count,
            v_total_amt,
            v_total_succ_count,
            v_total_succ_amt,
            v_total_fail_count,
            v_total_fail_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuA.1.43.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_公用_增加处理流程统计数据出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


    /* elseif @清算步骤# = 《清算步骤-合并清算处理》 then */
    elseif v_sett_flow_step = 3 then

        /* select count(*), ifnull(sum({成交金额}), 0) into @总记录数#, @总金额# from ~清算证券_清算_合并清算表^ where {成交日期} = @初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#); */
        select count(*), ifnull(sum(strike_amt), 0) into v_total_count, v_total_amt from db_clsecu.tb_clsecl_merge_clear where strike_date = v_init_date and (v_exch_no = 0 or exch_no = v_exch_no);

        /* select count(*), ifnull(sum({成交金额}), 0) into @已处理记录数#, @已处理金额# from ~清算证券_清算_合并清算表^ where {成交日期} = @初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#)  and {处理标志} = 《处理标志-已处理》; */
        select count(*), ifnull(sum(strike_amt), 0) into v_total_succ_count, v_total_succ_amt from db_clsecu.tb_clsecl_merge_clear where strike_date = v_init_date and (v_exch_no = 0 or exch_no = v_exch_no)  and deal_flag = 1;

        /* select count(*), ifnull(sum({成交金额}), 0) into @未处理记录数#, @未处理金额# from ~清算证券_清算_合并清算表^ where {成交日期} = @初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#)  and {处理标志} = 《处理标志-未处理》; */
        select count(*), ifnull(sum(strike_amt), 0) into v_total_fail_count, v_total_fail_amt from db_clsecu.tb_clsecl_merge_clear where strike_date = v_init_date and (v_exch_no = 0 or exch_no = v_exch_no)  and deal_flag = 2;

        /* 调用【原子_清算证券_公用_增加处理流程统计数据】*/
        call db_clsecu.pra_clsepb_AddDealFlowTotal(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_no,
            v_sett_flow_step,
            v_total_count,
            v_total_amt,
            v_total_succ_count,
            v_total_succ_amt,
            v_total_fail_count,
            v_total_fail_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuA.1.43.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_公用_增加处理流程统计数据出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


    /* elseif @清算步骤# = 《清算步骤-清算入账》 then */
    elseif v_sett_flow_step = 4 then

        /* select count(*), ifnull(sum({成交金额}), 0) into @总记录数#, @总金额# from ~清算证券_清算_待入账记录表^ where {成交日期} = @初始化日期# and {入账日期}=@初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#); */
        select count(*), ifnull(sum(strike_amt), 0) into v_total_count, v_total_amt from db_clsecu.tb_clsecl_pre_entry where strike_date = v_init_date and entry_date=v_init_date and (v_exch_no = 0 or exch_no = v_exch_no);

        /* select count(*), ifnull(sum({成交金额}), 0) into @已处理记录数#, @已处理金额# from ~清算证券_清算_待入账记录表^ where {成交日期} = @初始化日期# and {入账日期}=@初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#)  and {入账状态} = 《入账状态-已入账》; */
        select count(*), ifnull(sum(strike_amt), 0) into v_total_succ_count, v_total_succ_amt from db_clsecu.tb_clsecl_pre_entry where strike_date = v_init_date and entry_date=v_init_date and (v_exch_no = 0 or exch_no = v_exch_no)  and entry_status = "1";

        /* select count(*), ifnull(sum({成交金额}), 0) into @未处理记录数#, @未处理金额# from ~清算证券_清算_待入账记录表^ where {成交日期} = @初始化日期# and {入账日期}=@初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#)  and {入账状态} = 《入账状态-未入账》; */
        select count(*), ifnull(sum(strike_amt), 0) into v_total_fail_count, v_total_fail_amt from db_clsecu.tb_clsecl_pre_entry where strike_date = v_init_date and entry_date=v_init_date and (v_exch_no = 0 or exch_no = v_exch_no)  and entry_status = "2";

        /* 调用【原子_清算证券_公用_增加处理流程统计数据】*/
        call db_clsecu.pra_clsepb_AddDealFlowTotal(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_no,
            v_sett_flow_step,
            v_total_count,
            v_total_amt,
            v_total_succ_count,
            v_total_succ_amt,
            v_total_fail_count,
            v_total_fail_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuA.1.43.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_公用_增加处理流程统计数据出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


    /* elseif @清算步骤# = 《清算步骤-结算处理》 then */
    elseif v_sett_flow_step = 5 then

        /* select count(*), ifnull(sum({成交金额}), 0) into @总记录数#, @总金额# from ~清算证券_结算_待入账记录表^ where {初始化日期} = @初始化日期# and {入账日期}=@初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#); */
        select count(*), ifnull(sum(strike_amt), 0) into v_total_count, v_total_amt from db_clsecu.tb_clsest_preentry where init_date = v_init_date and entry_date=v_init_date and (v_exch_no = 0 or exch_no = v_exch_no);

        /* set @已处理记录数# = @总记录数#; */
        set v_total_succ_count = v_total_count;

        /* set @未处理记录数# = 0; */
        set v_total_fail_count = 0;

        /* set @已处理金额# = @总金额#; */
        set v_total_succ_amt = v_total_amt;

        /* set @未处理金额# = 0; */
        set v_total_fail_amt = 0;

        /* 调用【原子_清算证券_公用_增加处理流程统计数据】*/
        call db_clsecu.pra_clsepb_AddDealFlowTotal(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_no,
            v_sett_flow_step,
            v_total_count,
            v_total_amt,
            v_total_succ_count,
            v_total_succ_amt,
            v_total_fail_count,
            v_total_fail_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuA.1.43.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_公用_增加处理流程统计数据出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


    /* elseif @清算步骤# = 《清算步骤-结算入账》 then */
    elseif v_sett_flow_step = 6 then

        /* select count(*), ifnull(sum({成交金额}), 0) into @总记录数#, @总金额# from ~清算证券_结算_待入账记录表^ where {初始化日期} = @初始化日期# and {入账日期}=@初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#); */
        select count(*), ifnull(sum(strike_amt), 0) into v_total_count, v_total_amt from db_clsecu.tb_clsest_preentry where init_date = v_init_date and entry_date=v_init_date and (v_exch_no = 0 or exch_no = v_exch_no);

        /* select count(*), ifnull(sum({成交金额}), 0) into @已处理记录数#, @已处理金额# from ~清算证券_结算_待入账记录表^ where {初始化日期} = @初始化日期# and {入账日期}=@初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#)  and {入账状态} = 《入账状态-已入账》; */
        select count(*), ifnull(sum(strike_amt), 0) into v_total_succ_count, v_total_succ_amt from db_clsecu.tb_clsest_preentry where init_date = v_init_date and entry_date=v_init_date and (v_exch_no = 0 or exch_no = v_exch_no)  and entry_status = "1";

        /* select count(*), ifnull(sum({成交金额}), 0) into @未处理记录数#, @未处理金额# from ~清算证券_结算_待入账记录表^ where {初始化日期} = @初始化日期# and {入账日期}=@初始化日期# and (@市场编号# = 0 or {市场编号} = @市场编号#)  and {入账状态} = 《入账状态-未入账》; */
        select count(*), ifnull(sum(strike_amt), 0) into v_total_fail_count, v_total_fail_amt from db_clsecu.tb_clsest_preentry where init_date = v_init_date and entry_date=v_init_date and (v_exch_no = 0 or exch_no = v_exch_no)  and entry_status = "2";

        /* 调用【原子_清算证券_公用_增加处理流程统计数据】*/
        call db_clsecu.pra_clsepb_AddDealFlowTotal(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_no,
            v_sett_flow_step,
            v_total_count,
            v_total_amt,
            v_total_succ_count,
            v_total_succ_amt,
            v_total_fail_count,
            v_total_fail_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuA.1.43.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_公用_增加处理流程统计数据出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_公用_查询处理流程统计数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsepb_QueryDealFlowTotal;;
DELIMITER ;;
CREATE PROCEDURE pra_clsepb_QueryDealFlowTotal(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_sett_flow_step int,
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
    declare v_init_date int;
    declare v_exch_no int;
    declare v_sett_flow_step int;
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
    SET v_init_date = p_init_date;
    SET v_exch_no = p_exch_no;
    SET v_sett_flow_step = p_sett_flow_step;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算证券_公用_处理流程统计表][字段][{初始化日期}=@初始化日期# and {市场编号} = @市场编号# and {清算步骤} = @清算步骤# and  (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        exch_no, sett_flow_step, total_count, total_amt, 
        total_succ_count, total_succ_amt, total_fail_count, total_fail_amt from db_clsecu.tb_clsepb_flow_total where init_date=v_init_date and exch_no = v_exch_no and sett_flow_step = v_sett_flow_step and  (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        exch_no, sett_flow_step, total_count, total_amt, 
        total_succ_count, total_succ_amt, total_fail_count, total_fail_amt from db_clsecu.tb_clsepb_flow_total where init_date=v_init_date and exch_no = v_exch_no and sett_flow_step = v_sett_flow_step and  (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_公用_检查处理流程正确性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsepb_CheckDealFlow;;
DELIMITER ;;
CREATE PROCEDURE pra_clsepb_CheckDealFlow(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_sett_flow_step int,
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
    declare v_exch_no int;
    declare v_sett_flow_step int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_total_count int;
    declare v_total_fail_count int;
    declare v_total_succ_count int;
    declare v_tmp_total_succ_count int;

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
    SET v_exch_no = p_exch_no;
    SET v_sett_flow_step = p_sett_flow_step;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_total_count = 0;
    SET v_total_fail_count = 0;
    SET v_total_succ_count = 0;
    SET v_tmp_total_succ_count = 0;

    
    label_pro:BEGIN
    

    /* if @清算步骤# = 《清算步骤-成交转入》 then */
    if v_sett_flow_step = 1 then

        /* [获取表记录变量][清算证券_公用_处理流程统计表][{总记录数}][@总记录数#][{初始化日期}=@初始化日期# and {市场编号} = @市场编号# and {清算步骤} = 《清算步骤-成交转入》][4][@初始化日期#,@市场编号#] */
        select total_count into v_total_count from db_clsecu.tb_clsepb_flow_total where init_date=v_init_date and exch_no = v_exch_no and sett_flow_step = 1 limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "clsecuA.1.45.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no);
            end if;
            leave label_pro;
        end if;


        /* if @未处理记录数# <> 0 then */
        if v_total_fail_count <> 0 then

            /* [报错返回][802][@未处理记录数#] */
                
                SET v_error_code = "clsecuA.1.45.802";
                SET v_error_info = concat("未处理记录数=",v_total_fail_count);
                leave label_pro;

        end if;

    /* elseif @清算步骤# = 《清算步骤-清算处理》 then */
    elseif v_sett_flow_step = 2 then
        #核对未配对记录数、外部成交记录数与成交回报失败记录数是否一致

        /* [获取表记录变量][清算证券_公用_处理流程统计表][{已处理记录数}][@已处理记录数#][{初始化日期}=@初始化日期# and {市场编号} = @市场编号# and {清算步骤} = 《清算步骤-成交转入》][4][@初始化日期#,@市场编号#] */
        select total_succ_count into v_total_succ_count from db_clsecu.tb_clsepb_flow_total where init_date=v_init_date and exch_no = v_exch_no and sett_flow_step = 1 limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "clsecuA.1.45.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no);
            end if;
            leave label_pro;
        end if;


        /* set @临时_已处理记录数# = @已处理记录数#; */
        set v_tmp_total_succ_count = v_total_succ_count;

        /* [获取表记录变量][清算证券_公用_处理流程统计表][{已处理记录数}][@已处理记录数#][{初始化日期}=@初始化日期# and {市场编号} = @市场编号# and {清算步骤} = 《清算步骤-清算处理》][4][@初始化日期#,@市场编号#] */
        select total_succ_count into v_total_succ_count from db_clsecu.tb_clsepb_flow_total where init_date=v_init_date and exch_no = v_exch_no and sett_flow_step = 2 limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "clsecuA.1.45.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no);
            end if;
            leave label_pro;
        end if;


        /* if @临时_已处理记录数# <> @已处理记录数# then */
        if v_tmp_total_succ_count <> v_total_succ_count then

            /* [报错返回][803][@临时_已处理记录数#,@已处理记录数#] */
                
                SET v_error_code = "clsecuA.1.45.803";
                SET v_error_info = concat("临时_已处理记录数=",v_tmp_total_succ_count,",","已处理记录数=",v_total_succ_count);
                leave label_pro;

        end if;

    /* elseif @清算步骤# = 《清算步骤-合并清算处理》 then */
    elseif v_sett_flow_step = 3 then
        #核对未处理的记录数是否为0

        /* [获取表记录变量][清算证券_公用_处理流程统计表][{未处理记录数}][@未处理记录数#][{初始化日期}=@初始化日期# and {市场编号} = @市场编号# and {清算步骤} = 《清算步骤-合并清算处理》][4][@初始化日期#,@市场编号#] */
        select total_fail_count into v_total_fail_count from db_clsecu.tb_clsepb_flow_total where init_date=v_init_date and exch_no = v_exch_no and sett_flow_step = 3 limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "clsecuA.1.45.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no);
            end if;
            leave label_pro;
        end if;


        /* if @未处理记录数# <> 0 then */
        if v_total_fail_count <> 0 then

            /* [报错返回][804][@未处理记录数#] */
                
                SET v_error_code = "clsecuA.1.45.804";
                SET v_error_info = concat("未处理记录数=",v_total_fail_count);
                leave label_pro;

        end if;

    /* elseif @清算步骤# = 《清算步骤-清算入账》 then */
    elseif v_sett_flow_step = 4 then
        #核对清算已入账记录数是否不为0，清算未入账记录数是否为0

        /* [获取表记录变量][清算证券_公用_处理流程统计表][{已处理记录数},{未处理记录数}][@已处理记录数#,@未处理记录数#][{初始化日期}=@初始化日期# and {市场编号} = @市场编号# and {清算步骤} = 《清算步骤-清算入账》][4][@初始化日期#,@市场编号#] */
        select total_succ_count,total_fail_count into v_total_succ_count,v_total_fail_count from db_clsecu.tb_clsepb_flow_total where init_date=v_init_date and exch_no = v_exch_no and sett_flow_step = 4 limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "clsecuA.1.45.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no);
            end if;
            leave label_pro;
        end if;


        /* if @已处理记录数# = 0 then */
        if v_total_succ_count = 0 then

            /* [报错返回][805][@已处理记录数#] */
                
                SET v_error_code = "clsecuA.1.45.805";
                SET v_error_info = concat("已处理记录数=",v_total_succ_count);
                leave label_pro;

        end if;

        /* if @未处理记录数# <> 0 then */
        if v_total_fail_count <> 0 then

            /* [报错返回][806][@未处理记录数#] */
                
                SET v_error_code = "clsecuA.1.45.806";
                SET v_error_info = concat("未处理记录数=",v_total_fail_count);
                leave label_pro;

        end if;

    /* elseif @清算步骤# = 《清算步骤-结算入账》 then */
    elseif v_sett_flow_step = 6 then
        #核对结算已入账记录数是否不为0，结算未入账记录数是否为0

        /* [获取表记录变量][清算证券_公用_处理流程统计表][{已处理记录数},{未处理记录数}][@已处理记录数#,@未处理记录数#][{初始化日期}=@初始化日期# and {市场编号} = @市场编号# and {清算步骤} = 《清算步骤-结算入账》][4][@初始化日期#,@市场编号#] */
        select total_succ_count,total_fail_count into v_total_succ_count,v_total_fail_count from db_clsecu.tb_clsepb_flow_total where init_date=v_init_date and exch_no = v_exch_no and sett_flow_step = 6 limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "clsecuA.1.45.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","市场编号=",v_exch_no);
            end if;
            leave label_pro;
        end if;


        /* if @已处理记录数# = 0 then */
        if v_total_succ_count = 0 then

            /* [报错返回][807][@已处理记录数#] */
                
                SET v_error_code = "clsecuA.1.45.807";
                SET v_error_info = concat("已处理记录数=",v_total_succ_count);
                leave label_pro;

        end if;

        /* if @未处理记录数# <> 0 then */
        if v_total_fail_count <> 0 then

            /* [报错返回][808][@未处理记录数#] */
                
                SET v_error_code = "clsecuA.1.45.808";
                SET v_error_info = concat("未处理记录数=",v_total_fail_count);
                leave label_pro;

        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


