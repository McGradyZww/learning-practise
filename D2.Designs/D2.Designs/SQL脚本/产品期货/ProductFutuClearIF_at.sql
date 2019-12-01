DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_新增资金入账流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_InsertCapitalEntryJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_InsertCapitalEntryJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_busi_flag int,
    IN p_occur_amt decimal(18,4),
    IN p_entry_status varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_money_jour_no bigint
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_entry_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_busi_flag = p_busi_flag;
    SET v_occur_amt = p_occur_amt;
    SET v_entry_status = p_entry_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][产品期货_资金_资金入账流水表][字段][字段变量][1][@机构编号#,@产品编号#,@交易组编号#,@资产账户编号#,@本币币种#,@交易币种#,@变动金额#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfuca_capit_entry_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, crncy_type, 
        exch_crncy_type, busi_flag, occur_amt, entry_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_crncy_type, 
        v_exch_crncy_type, v_busi_flag, v_occur_amt, v_entry_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.5.41.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type,",","交易币种=",v_exch_crncy_type,",","变动金额=",v_occur_amt),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@入账资金流水号#] */
    select LAST_INSERT_ID() into v_entry_money_jour_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_获取资金入账流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_GetCapitalEntryJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_GetCapitalEntryJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_entry_money_jour_no bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_busi_flag int,
    OUT p_occur_amt decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_entry_money_jour_no bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_entry_status varchar(2);

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
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_busi_flag = 0;
    SET v_occur_amt = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品期货_资金_资金入账流水表][字段][字段变量][{记录序号}=@入账资金流水号#][4][@入账资金流水号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, busi_flag, occur_amt, 
        entry_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_crncy_type, v_exch_crncy_type, v_busi_flag, v_occur_amt, 
        v_entry_status from db_pdfutu.tb_pdfuca_capit_entry_jour where row_id=v_entry_money_jour_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.5.51.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("入账资金流水号=",v_entry_money_jour_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("入账资金流水号=",v_entry_money_jour_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_资金_资金入账流水表][{入账状态}=《入账状态-已回滚》][{记录序号}=@入账资金流水号#][2][@入账资金流水号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_capit_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="3" where row_id=v_entry_money_jour_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.5.51.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("入账资金流水号=",v_entry_money_jour_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("入账资金流水号=",v_entry_money_jour_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_busi_flag = v_busi_flag;
    SET p_occur_amt = v_occur_amt;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_交易组资金入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_ExgpCapitalRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_ExgpCapitalRecorded(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_busi_flag int,
    IN p_occur_amt decimal(18,4),
    IN p_frozen_amt decimal(18,4),
    IN p_unfroz_amt decimal(18,4),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
    IN p_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_amt decimal(18,4);
    declare v_capt_margin decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_amt decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_func_code varchar(16);
    declare v_oper_menu_no int;
    declare v_oper_remark_info varchar(255);

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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_busi_flag = p_busi_flag;
    SET v_occur_amt = p_occur_amt;
    SET v_frozen_amt = p_frozen_amt;
    SET v_unfroz_amt = p_unfroz_amt;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_amt = 0;
    SET v_capt_margin = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_amt = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_occur_end_amt = 0;
    SET v_oper_func_code = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* if @业务标志# = 《业务标志-期货占用保证金入账》 then */
    if v_busi_flag = 3001009 then

        /* set @当前金额# = 0; */
        set v_curr_amt = 0;

        /* set @占用保证金# = @变动金额#; */
        set v_capt_margin = v_occur_amt;
    else

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @占用保证金# = 0; */
        set v_capt_margin = 0;
    end if;
    #处理交易组资金入账

    /* [获取流水变动][{当前金额},{占用保证金}][@当前金额#,@占用保证金#] */
    set v_jour_occur_field = concat("当前金额","|","占用保证金","|");
    set v_jour_occur_info = concat(v_curr_amt,"|",v_capt_margin,"|");


    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @利率# = 0; */
    set v_intrst_rate = 0;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* if @业务标志# = 《业务标志-期货占用保证金入账》 then */
    if v_busi_flag = 3001009 then

        /* [插入重复更新][产品期货_资金_交易组资金表][字段][字段变量][{占用保证金}=@占用保证金#][1][@交易组编号#,@资产账户编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdfutu.tb_pdfuca_exgp_capit (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            asset_acco_no, exch_group_no, crncy_type, begin_amt, 
            curr_amt, capt_margin, frozen_amt, unfroz_amt, 
            total_rece_amt, total_payab_amt, intrst_rate, intrst_base_amt, 
            pre_entry_intrst_amt) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_asset_acco_no, v_exch_group_no, v_crncy_type, v_begin_amt, 
            v_curr_amt, v_capt_margin, v_frozen_amt, v_unfroz_amt, 
            v_total_rece_amt, v_total_payab_amt, v_intrst_rate, v_intrst_base_amt, 
            v_pre_entry_intrst_amt) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, capt_margin=v_capt_margin;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdfutuA.5.53.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;

    else

        /* [插入重复更新][产品期货_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额#][1][@交易组编号#,@资产账户编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdfutu.tb_pdfuca_exgp_capit (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            asset_acco_no, exch_group_no, crncy_type, begin_amt, 
            curr_amt, capt_margin, frozen_amt, unfroz_amt, 
            total_rece_amt, total_payab_amt, intrst_rate, intrst_base_amt, 
            pre_entry_intrst_amt) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_asset_acco_no, v_exch_group_no, v_crncy_type, v_begin_amt, 
            v_curr_amt, v_capt_margin, v_frozen_amt, v_unfroz_amt, 
            v_total_rece_amt, v_total_payab_amt, v_intrst_rate, v_intrst_base_amt, 
            v_pre_entry_intrst_amt) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdfutuA.5.53.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [获取表记录变量][产品期货_资金_交易组资金表][{当前金额},{占用保证金}][@当前金额#,@占用保证金#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select curr_amt,capt_margin into v_curr_amt,v_capt_margin from db_pdfutu.tb_pdfuca_exgp_capit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.5.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前金额#,@占用保证金#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|",v_capt_margin,"|");


    /* if @业务标志# = 《业务标志-期货占用保证金入账》 then */
    if v_busi_flag = 3001009 then

        /* set @变动后金额# = @占用保证金#; */
        set v_occur_end_amt = v_capt_margin;
    else

        /* set @变动后金额# = @当前金额#; */
        set v_occur_end_amt = v_curr_amt;
    end if;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作备注# = @备注信息#; */
    set v_oper_remark_info = v_remark_info;

    /* [插入表记录][产品期货_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfuca_exgp_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
        v_busi_flag, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.5.53.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_资产账户资金入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_AsacCapitalRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_AsacCapitalRecorded(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_busi_flag int,
    IN p_occur_amt decimal(18,4),
    IN p_frozen_amt decimal(18,4),
    IN p_unfroz_amt decimal(18,4),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_money_jour_no bigint
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
    declare v_curr_amt decimal(18,4);
    declare v_capt_margin decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_amt decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_func_code varchar(16);
    declare v_oper_menu_no int;
    declare v_oper_remark_info varchar(255);

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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_busi_flag = p_busi_flag;
    SET v_occur_amt = p_occur_amt;
    SET v_frozen_amt = p_frozen_amt;
    SET v_unfroz_amt = p_unfroz_amt;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_curr_amt = 0;
    SET v_capt_margin = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_amt = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_occur_end_amt = 0;
    SET v_oper_func_code = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* if @业务标志# = 《业务标志-期货占用保证金入账》 then */
    if v_busi_flag = 3001009 then

        /* set @当前金额# = 0; */
        set v_curr_amt = 0;

        /* set @占用保证金# = @变动金额#; */
        set v_capt_margin = v_occur_amt;
    else

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @占用保证金# = 0; */
        set v_capt_margin = 0;
    end if;
    #处理资产账户资金入账

    /* [获取流水变动][{当前金额},{占用保证金}][@当前金额#,@占用保证金#] */
    set v_jour_occur_field = concat("当前金额","|","占用保证金","|");
    set v_jour_occur_info = concat(v_curr_amt,"|",v_capt_margin,"|");


    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @利率# = 0; */
    set v_intrst_rate = 0;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* if @业务标志# = 《业务标志-期货占用保证金入账》 then */
    if v_busi_flag = 3001009 then

        /* [插入重复更新][产品期货_资金_资产账户资金表][字段][字段变量][{占用保证金}=@占用保证金#][1][@资产账户编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdfutu.tb_pdfuca_asac_capit (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            asset_acco_no, crncy_type, begin_amt, curr_amt, 
            capt_margin, frozen_amt, unfroz_amt, total_rece_amt, 
            total_payab_amt, intrst_rate, intrst_base_amt, pre_entry_intrst_amt) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_asset_acco_no, v_crncy_type, v_begin_amt, v_curr_amt, 
            v_capt_margin, v_frozen_amt, v_unfroz_amt, v_total_rece_amt, 
            v_total_payab_amt, v_intrst_rate, v_intrst_base_amt, v_pre_entry_intrst_amt) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, capt_margin=v_capt_margin;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdfutuA.5.54.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;

    else

        /* [插入重复更新][产品期货_资金_资产账户资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额#][1][@资产账户编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdfutu.tb_pdfuca_asac_capit (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            asset_acco_no, crncy_type, begin_amt, curr_amt, 
            capt_margin, frozen_amt, unfroz_amt, total_rece_amt, 
            total_payab_amt, intrst_rate, intrst_base_amt, pre_entry_intrst_amt) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_asset_acco_no, v_crncy_type, v_begin_amt, v_curr_amt, 
            v_capt_margin, v_frozen_amt, v_unfroz_amt, v_total_rece_amt, 
            v_total_payab_amt, v_intrst_rate, v_intrst_base_amt, v_pre_entry_intrst_amt) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdfutuA.5.54.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [获取表记录变量][产品期货_资金_资产账户资金表][字段][字段变量][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        curr_amt, capt_margin, frozen_amt, unfroz_amt, 
        total_rece_amt, total_payab_amt, intrst_rate, intrst_base_amt, 
        pre_entry_intrst_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_crncy_type, v_begin_amt, 
        v_curr_amt, v_capt_margin, v_frozen_amt, v_unfroz_amt, 
        v_total_rece_amt, v_total_payab_amt, v_intrst_rate, v_intrst_base_amt, 
        v_pre_entry_intrst_amt from db_pdfutu.tb_pdfuca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.5.54.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前金额#,@占用保证金#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|",v_capt_margin,"|");


    /* if @业务标志# = 《业务标志-期货占用保证金入账》 then */
    if v_busi_flag = 3001009 then

        /* set @变动后金额# = @占用保证金#; */
        set v_occur_end_amt = v_capt_margin;
    else

        /* set @变动后金额# = @当前金额#; */
        set v_occur_end_amt = v_curr_amt;
    end if;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作备注# = @备注信息#; */
    set v_oper_remark_info = v_remark_info;

    /* [插入表记录][产品期货_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfuca_asac_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, busi_flag, crncy_type, 
        occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_busi_flag, v_crncy_type, 
        v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.5.54.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@入账资金流水号#] */
    select LAST_INSERT_ID() into v_entry_money_jour_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_清算资金入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_ClearCapitalRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_ClearCapitalRecorded(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_busi_flag int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_money_jour_no bigint
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_busi_flag int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_entry_status varchar(2);
    declare v_arrive_date int;

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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_busi_flag = p_busi_flag;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_entry_status = "0";
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;
    #根据汇率重置入账金额

    /* set @冻结金额# = 0; */
    set v_frozen_amt = 0;

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;
    #处理交易组资金入账

    /* if @交易组编号# <> 0 then */
    if v_exch_group_no <> 0 then

        /* 调用【原子_产品期货_清算接口_交易组资金入账】*/
        call db_pdfutu.pra_pdfuclif_ExgpCapitalRecorded(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_asset_acco_no,
            v_exch_group_no,
            v_crncy_type,
            v_exch_crncy_type,
            v_busi_flag,
            v_occur_amt,
            v_frozen_amt,
            v_unfroz_amt,
            v_total_rece_amt,
            v_total_payab_amt,
            v_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuA.5.55.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_交易组资金入账出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    #处理资产账户资金入账

    /* if @业务标志# <> 《业务标志-期货占用保证金入账》 or @交易组编号#=0 then */
    if v_busi_flag <> 3001009 or v_exch_group_no=0 then

        /* 调用【原子_产品期货_清算接口_资产账户资金入账】*/
        call db_pdfutu.pra_pdfuclif_AsacCapitalRecorded(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_crncy_type,
            v_exch_crncy_type,
            v_busi_flag,
            v_occur_amt,
            v_frozen_amt,
            v_unfroz_amt,
            v_total_rece_amt,
            v_total_payab_amt,
            v_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_entry_money_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuA.5.55.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_资产账户资金入账出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;

    /* set @入账状态# = 《入账状态-已入账》; */
    set v_entry_status = "1";

    /* set @到账日期# = @初始化日期#; */
    set v_arrive_date = v_init_date;

    /* 调用【原子_产品期货_清算接口_新增资金入账流水】*/
    call db_pdfutu.pra_pdfuclif_InsertCapitalEntryJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_crncy_type,
        v_exch_crncy_type,
        v_busi_flag,
        v_occur_amt,
        v_entry_status,
        v_error_code,
        v_error_info,
        v_entry_money_jour_no);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuA.5.55.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_新增资金入账流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_获取资产账户持仓流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_GetAsacPosiJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_GetAsacPosiJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_entry_posi_jour_no bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_occur_qty decimal(18,2),
    OUT p_contrc_unit int,
    OUT p_begin_qty decimal(18,2),
    OUT p_curr_qty decimal(18,2),
    OUT p_frozen_qty decimal(18,2),
    OUT p_unfroz_qty decimal(18,2),
    OUT p_sett_price decimal(16,9),
    OUT p_rece_margin decimal(18,4),
    OUT p_realize_pandl decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_entry_posi_jour_no bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_contrc_unit int;
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_busi_flag int;
    declare v_occur_end_qty decimal(18,2);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_remark_info varchar(255);

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
    SET v_entry_posi_jour_no = p_entry_posi_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_occur_qty = 0;
    SET v_contrc_unit = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_rece_margin = 0;
    SET v_realize_pandl = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_busi_flag = 0;
    SET v_occur_end_qty = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品期货_持仓_资产账户持仓流水表][字段][字段变量][{记录序号}=@入账持仓流水号#][4][@入账持仓流水号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        busi_flag, occur_qty, occur_end_qty, jour_occur_field, 
        jour_after_occur_info, oper_remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_menu_no, v_oper_func_code, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_lngsht_type, v_hedge_type, 
        v_busi_flag, v_occur_qty, v_occur_end_qty, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info from db_pdfutu.tb_pdfupo_asac_posi_jour where row_id=v_entry_posi_jour_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.5.71.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("入账持仓流水号=",v_entry_posi_jour_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("入账持仓流水号=",v_entry_posi_jour_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_occur_qty = v_occur_qty;
    SET p_contrc_unit = v_contrc_unit;
    SET p_begin_qty = v_begin_qty;
    SET p_curr_qty = v_curr_qty;
    SET p_frozen_qty = v_frozen_qty;
    SET p_unfroz_qty = v_unfroz_qty;
    SET p_sett_price = v_sett_price;
    SET p_rece_margin = v_rece_margin;
    SET p_realize_pandl = v_realize_pandl;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_资产账户持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_AsacPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_AsacPosiRecorded(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_contrc_unit int,
    IN p_busi_flag int,
    IN p_occur_qty decimal(18,2),
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    IN p_comb_code varchar(6),
    IN p_open_amount decimal(18,4),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_contrc_unit int;
    declare v_busi_flag int;
    declare v_occur_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_comb_code varchar(6);
    declare v_open_amount decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sett_flag int;
    declare v_oper_func_code varchar(16);
    declare v_oper_menu_no int;
    declare v_oper_remark_info varchar(255);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_pre_settle_price decimal(16,9);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_occur_end_qty decimal(18,2);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);

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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_busi_flag = p_busi_flag;
    SET v_occur_qty = p_occur_qty;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_comb_code = p_comb_code;
    SET v_open_amount = p_open_amount;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sett_flag = 0;
    SET v_oper_func_code = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_remark_info = " ";
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_rece_margin = 0;
    SET v_pre_settle_price = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_occur_end_qty = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";

    
    label_pro:BEGIN
    

    /* set @清算结算标志# = 《清算结算标志-已处理》; */
    set v_sett_flag = 1;

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作备注# = @备注信息#; */
    set v_oper_remark_info = v_remark_info;
    #用于插入表记录时初值，更新时无用。

    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* set @当前数量# = @变动数量#; */
    set v_curr_qty = v_occur_qty;

    /* set @冻结数量# = 0; */
    set v_frozen_qty = 0;

    /* set @解冻数量# = 0; */
    set v_unfroz_qty = 0;

    /* set @结算价#=0; */
    set v_sett_price=0;

    /* set @应收保证金# = 0; */
    set v_rece_margin = 0;

    /* set @昨结算价# = 0; */
    set v_pre_settle_price = 0;
    #持仓记录不存在，则插入，否则更新

    /* [插入重复更新][产品期货_持仓_资产账户持仓表][字段][字段变量][{当前数量}={当前数量}+@当前数量#, {开仓金额}={开仓金额}+@开仓金额#][1][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_asac_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, lngsht_type, hedge_type, comb_code, 
        contrc_unit, begin_qty, curr_qty, frozen_qty, 
        unfroz_qty, pre_settle_price, sett_price, rece_margin, 
        sett_flag, open_amount) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_no, v_futu_acco_no, v_contrc_code_no, 
        v_contrc_type, v_lngsht_type, v_hedge_type, v_comb_code, 
        v_contrc_unit, v_begin_qty, v_curr_qty, v_frozen_qty, 
        v_unfroz_qty, v_pre_settle_price, v_sett_price, v_rece_margin, 
        v_sett_flag, v_open_amount) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=curr_qty+v_curr_qty, open_amount=open_amount+v_open_amount;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.5.72.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_持仓_资产账户持仓表][字段][字段变量][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#][4][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, lngsht_type, hedge_type, 
        comb_code, contrc_unit, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, pre_settle_price, sett_price, 
        rece_margin, sett_flag, open_amount into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_type, v_lngsht_type, v_hedge_type, 
        v_comb_code, v_contrc_unit, v_begin_qty, v_curr_qty, 
        v_frozen_qty, v_unfroz_qty, v_pre_settle_price, v_sett_price, 
        v_rece_margin, v_sett_flag, v_open_amount from db_pdfutu.tb_pdfupo_asac_posi where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.5.72.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* set @变动后数量# = @当前数量#; */
    set v_occur_end_qty = v_curr_qty;

    /* [插入表记录][产品期货_持仓_资产账户持仓流水表][字段][字段变量][5][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_asac_posi_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, lngsht_type, hedge_type, busi_flag, 
        occur_qty, occur_end_qty, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_lngsht_type, v_hedge_type, v_busi_flag, 
        v_occur_qty, v_occur_end_qty, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.5.72.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_交易组持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_ExchGroupPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_ExchGroupPosiRecorded(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_contrc_unit int,
    IN p_busi_flag int,
    IN p_occur_qty decimal(18,2),
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    IN p_comb_code varchar(6),
    IN p_open_amount decimal(18,4),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_contrc_unit int;
    declare v_busi_flag int;
    declare v_occur_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_comb_code varchar(6);
    declare v_open_amount decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sett_flag int;
    declare v_oper_func_code varchar(16);
    declare v_oper_menu_no int;
    declare v_oper_remark_info varchar(255);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_pre_settle_price decimal(16,9);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_occur_end_qty decimal(18,2);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);

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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_busi_flag = p_busi_flag;
    SET v_occur_qty = p_occur_qty;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_comb_code = p_comb_code;
    SET v_open_amount = p_open_amount;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sett_flag = 0;
    SET v_oper_func_code = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_remark_info = " ";
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_rece_margin = 0;
    SET v_pre_settle_price = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_occur_end_qty = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";

    
    label_pro:BEGIN
    

    /* set @清算结算标志# = 《清算结算标志-已处理》; */
    set v_sett_flag = 1;

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作备注# = @备注信息#; */
    set v_oper_remark_info = v_remark_info;
    #用于插入表记录时初值，更新时无用。

    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* set @当前数量# = @变动数量#; */
    set v_curr_qty = v_occur_qty;

    /* set @冻结数量# = 0; */
    set v_frozen_qty = 0;

    /* set @解冻数量# = 0; */
    set v_unfroz_qty = 0;

    /* set @结算价#=0; */
    set v_sett_price=0;

    /* set @应收保证金#=0; */
    set v_rece_margin=0;

    /* set @昨结算价# = 0; */
    set v_pre_settle_price = 0;
    #持仓记录不存在，则插入，否则更新

    /* [插入重复更新][产品期货_持仓_交易组持仓表][字段][字段变量][{当前数量}={当前数量}+@当前数量#, {开仓金额}={开仓金额}+@开仓金额#][1][@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_exgp_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, lngsht_type, hedge_type, 
        comb_code, contrc_unit, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, pre_settle_price, sett_price, 
        rece_margin, sett_flag, open_amount) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_group_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_type, v_lngsht_type, v_hedge_type, 
        v_comb_code, v_contrc_unit, v_begin_qty, v_curr_qty, 
        v_frozen_qty, v_unfroz_qty, v_pre_settle_price, v_sett_price, 
        v_rece_margin, v_sett_flag, v_open_amount) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=curr_qty+v_curr_qty, open_amount=open_amount+v_open_amount;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.5.73.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_持仓_交易组持仓表][字段][字段变量][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#][4][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, comb_code, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, pre_settle_price, 
        sett_price, rece_margin, sett_flag, open_amount into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_lngsht_type, 
        v_hedge_type, v_comb_code, v_contrc_unit, v_begin_qty, 
        v_curr_qty, v_frozen_qty, v_unfroz_qty, v_pre_settle_price, 
        v_sett_price, v_rece_margin, v_sett_flag, v_open_amount from db_pdfutu.tb_pdfupo_exgp_posi where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.5.73.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* set @变动后数量# = @当前数量#; */
    set v_occur_end_qty = v_curr_qty;

    /* [插入表记录][产品期货_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_exgp_posi_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        busi_flag, occur_qty, occur_end_qty, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_lngsht_type, v_hedge_type, 
        v_busi_flag, v_occur_qty, v_occur_end_qty, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.5.73.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_清算持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_ClearPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_ClearPosiRecorded(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_contrc_unit int,
    IN p_busi_flag int,
    IN p_occur_qty decimal(18,2),
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    IN p_comb_code varchar(6),
    IN p_open_amount decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_exgp_posi_jour_no bigint,
    OUT p_entry_asac_posi_jour_no bigint
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_contrc_unit int;
    declare v_busi_flag int;
    declare v_occur_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_comb_code varchar(6);
    declare v_open_amount decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;

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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_busi_flag = p_busi_flag;
    SET v_occur_qty = p_occur_qty;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_comb_code = p_comb_code;
    SET v_open_amount = p_open_amount;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;

    
    label_pro:BEGIN
    
    #处理交易组持仓

    /* 调用【原子_产品期货_清算接口_交易组持仓入账】*/
    call db_pdfutu.pra_pdfuclif_ExchGroupPosiRecorded(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_exch_group_no,
        v_exch_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_type,
        v_lngsht_type,
        v_hedge_type,
        v_contrc_unit,
        v_busi_flag,
        v_occur_qty,
        v_remark_info,
        v_menu_no,
        v_comb_code,
        v_open_amount,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuA.5.74.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_交易组持仓入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_产品期货_清算接口_新增交易组持仓入账流水】*/
    call db_pdfutu.pra_pdfuclif_InsertExgpPosiEntryJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_exch_group_no,
        v_exch_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_type,
        v_lngsht_type,
        v_hedge_type,
        v_contrc_unit,
        v_busi_flag,
        v_occur_qty,
        v_error_code,
        v_error_info,
        v_entry_exgp_posi_jour_no);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuA.5.74.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_新增交易组持仓入账流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #处理资产账户持仓

    /* 调用【原子_产品期货_清算接口_资产账户持仓入账】*/
    call db_pdfutu.pra_pdfuclif_AsacPosiRecorded(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_type,
        v_lngsht_type,
        v_hedge_type,
        v_contrc_unit,
        v_busi_flag,
        v_occur_qty,
        v_remark_info,
        v_menu_no,
        v_comb_code,
        v_open_amount,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuA.5.74.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_资产账户持仓入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_产品期货_清算接口_新增资产账户持仓入账流水】*/
    call db_pdfutu.pra_pdfuclif_InsertAsacPosiEntryJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_exch_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_type,
        v_lngsht_type,
        v_hedge_type,
        v_contrc_unit,
        v_busi_flag,
        v_occur_qty,
        v_error_code,
        v_error_info,
        v_entry_asac_posi_jour_no);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuA.5.74.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_新增资产账户持仓入账流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no;
    SET p_entry_asac_posi_jour_no = v_entry_asac_posi_jour_no;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_更新持仓结算价应收保证金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_UpdatePosiSettInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_UpdatePosiSettInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_comb_code varchar(6),
    IN p_hedge_type int,
    IN p_contrc_unit int,
    IN p_sett_price decimal(16,9),
    IN p_rece_margin decimal(18,4),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_comb_code varchar(6);
    declare v_hedge_type int;
    declare v_contrc_unit int;
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_comb_code = p_comb_code;
    SET v_hedge_type = p_hedge_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_sett_price = p_sett_price;
    SET v_rece_margin = p_rece_margin;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #处理交易组持仓

    /* [更新表记录][产品期货_持仓_交易组持仓表][{结算价}=@结算价#, {应收保证金}=@应收保证金# , {合约乘数}=@合约乘数#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#][2][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_price=v_sett_price, rece_margin=v_rece_margin , contrc_unit=v_contrc_unit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.5.76.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;

    #处理资产账户持仓

    /* [获取表记录变量语句][产品期货_持仓_交易组持仓表][sum({应收保证金})][@应收保证金#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#] */
    select sum(rece_margin) into v_rece_margin from db_pdfutu.tb_pdfupo_exgp_posi where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;


    /* set @应收保证金# = ifnull(@应收保证金#,0); */
    set v_rece_margin = ifnull(v_rece_margin,0);

    /* [更新表记录][产品期货_持仓_资产账户持仓表][{结算价}=@结算价#, {应收保证金}=@应收保证金# ,{合约乘数}=@合约乘数#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_price=v_sett_price, rece_margin=v_rece_margin ,contrc_unit=v_contrc_unit where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.5.76.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_更新获取交易组持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_UpdateGetExgpPosiInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_UpdateGetExgpPosiInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_record_count int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_crncy_type varchar(3),
    OUT p_curr_qty decimal(18,2),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_comb_code varchar(6),
    OUT p_open_amount decimal(18,4)
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
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_record_count int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_crncy_type varchar(3);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_comb_code varchar(6);
    declare v_open_amount decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_begin_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_sett_flag int;

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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_record_count = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_crncy_type = "CNY";
    SET v_curr_qty = 0;
    SET v_pre_settle_price = 0;
    SET v_comb_code = " ";
    SET v_open_amount = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_begin_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_rece_margin = 0;
    SET v_sett_flag = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [锁定获取表记录变量][产品期货_持仓_交易组持仓表][字段][字段变量][{记录序号}=@查询序号# and {当前数量} > 0 and {清算结算标志} <> 《清算结算标志-已处理》][4][" "] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, comb_code, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, pre_settle_price, 
        sett_price, rece_margin, sett_flag, open_amount into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_lngsht_type, 
        v_hedge_type, v_comb_code, v_contrc_unit, v_begin_qty, 
        v_curr_qty, v_frozen_qty, v_unfroz_qty, v_pre_settle_price, 
        v_sett_price, v_rece_margin, v_sett_flag, v_open_amount from db_pdfutu.tb_pdfupo_exgp_posi where row_id=v_qry_no and curr_qty > 0 and sett_flag <> 1 limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.5.80.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;

    #[锁定获取表记录变量][产品期货_持仓_交易组持仓表][字段][字段变量][{当前数量} > 0 and {清算结算标志} <> 《清算结算标志-已处理》 order by {记录序号}][4][" "]

    /* set @记录个数# = 1; */
    set v_record_count = 1;

    /* [更新表记录][产品期货_持仓_交易组持仓表][{清算结算标志}=《清算结算标志-已处理》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_flag=1 where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.5.80.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_record_count = v_record_count;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_crncy_type = v_crncy_type;
    SET p_curr_qty = v_curr_qty;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_comb_code = v_comb_code;
    SET p_open_amount = v_open_amount;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_新增交易组持仓入账流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_InsertExgpPosiEntryJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_InsertExgpPosiEntryJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_contrc_unit int,
    IN p_busi_flag int,
    IN p_occur_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_exgp_posi_jour_no bigint
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_contrc_unit int;
    declare v_busi_flag int;
    declare v_occur_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_status varchar(2);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_busi_flag = p_busi_flag;
    SET v_occur_qty = p_occur_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_status = "0";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @入账状态# = 《入账状态-已入账》; */
    set v_entry_status = "1";

    /* [插入表记录][产品期货_持仓_交易组持仓入账流水表][字段][字段变量][1][@机构编号#,@产品编号#,@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_exgp_posi_entry_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, contrc_unit, busi_flag, occur_qty, 
        entry_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_lngsht_type, 
        v_hedge_type, v_contrc_unit, v_busi_flag, v_occur_qty, 
        v_entry_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.5.81.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@入账交易组持仓流水号#] */
    select LAST_INSERT_ID() into v_entry_exgp_posi_jour_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_新增资产账户持仓入账流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_InsertAsacPosiEntryJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_InsertAsacPosiEntryJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_contrc_unit int,
    IN p_busi_flag int,
    IN p_occur_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_asac_posi_jour_no bigint
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_contrc_unit int;
    declare v_busi_flag int;
    declare v_occur_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_asac_posi_jour_no bigint;
    declare v_entry_status varchar(2);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_busi_flag = p_busi_flag;
    SET v_occur_qty = p_occur_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_asac_posi_jour_no = 0;
    SET v_entry_status = "0";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @入账状态# = 《入账状态-已入账》; */
    set v_entry_status = "1";

    /* [插入表记录][产品期货_持仓_资产账户持仓入账流水表][字段][字段变量][1][@机构编号#,@产品编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_asac_posi_entry_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, lngsht_type, hedge_type, 
        contrc_unit, busi_flag, occur_qty, entry_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_type, v_lngsht_type, v_hedge_type, 
        v_contrc_unit, v_busi_flag, v_occur_qty, v_entry_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.5.82.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@入账资产账户持仓流水号#] */
    select LAST_INSERT_ID() into v_entry_asac_posi_jour_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_asac_posi_jour_no = v_entry_asac_posi_jour_no;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_获取资产账户持仓入账流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_GetAsacPosiEntryJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_GetAsacPosiEntryJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_entry_asac_posi_jour_no bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_contrc_unit int,
    OUT p_busi_flag int,
    OUT p_occur_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_entry_asac_posi_jour_no bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_contrc_unit int;
    declare v_busi_flag int;
    declare v_occur_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_entry_status varchar(2);

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
    SET v_entry_asac_posi_jour_no = p_entry_asac_posi_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_contrc_unit = 0;
    SET v_busi_flag = 0;
    SET v_occur_qty = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品期货_持仓_资产账户持仓入账流水表][字段][字段变量][{记录序号}=@入账资产账户持仓流水号#][4][@入账资产账户持仓流水号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, contrc_unit, busi_flag, occur_qty, 
        entry_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_lngsht_type, 
        v_hedge_type, v_contrc_unit, v_busi_flag, v_occur_qty, 
        v_entry_status from db_pdfutu.tb_pdfupo_asac_posi_entry_jour where row_id=v_entry_asac_posi_jour_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.5.83.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("入账资产账户持仓流水号=",v_entry_asac_posi_jour_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("入账资产账户持仓流水号=",v_entry_asac_posi_jour_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_持仓_资产账户持仓入账流水表][{入账状态}=《入账状态-已回滚》][{记录序号}=@入账资产账户持仓流水号#][2][@入账资产账户持仓流水号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_asac_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="3" where row_id=v_entry_asac_posi_jour_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.5.83.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("入账资产账户持仓流水号=",v_entry_asac_posi_jour_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("入账资产账户持仓流水号=",v_entry_asac_posi_jour_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_busi_flag = v_busi_flag;
    SET p_occur_qty = v_occur_qty;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_获取交易组持仓入账流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_GetExgpPosiEntryJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_GetExgpPosiEntryJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_entry_exgp_posi_jour_no bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_group_no int,
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_contrc_unit int,
    OUT p_busi_flag int,
    OUT p_occur_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_contrc_unit int;
    declare v_busi_flag int;
    declare v_occur_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_entry_status varchar(2);

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
    SET v_entry_exgp_posi_jour_no = p_entry_exgp_posi_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_group_no = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_contrc_unit = 0;
    SET v_busi_flag = 0;
    SET v_occur_qty = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品期货_持仓_交易组持仓入账流水表][字段][字段变量][{记录序号}=@入账交易组持仓流水号#][4][@入账交易组持仓流水号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        lngsht_type, hedge_type, contrc_unit, busi_flag, 
        occur_qty, entry_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_exch_no, v_futu_acco_no, v_contrc_code_no, v_contrc_type, 
        v_lngsht_type, v_hedge_type, v_contrc_unit, v_busi_flag, 
        v_occur_qty, v_entry_status from db_pdfutu.tb_pdfupo_exgp_posi_entry_jour where row_id=v_entry_exgp_posi_jour_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.5.84.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("入账交易组持仓流水号=",v_entry_exgp_posi_jour_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("入账交易组持仓流水号=",v_entry_exgp_posi_jour_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_持仓_交易组持仓入账流水表][{入账状态}=《入账状态-已回滚》][{记录序号}=@入账交易组持仓流水号#][2][@入账交易组持仓流水号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_exgp_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="3" where row_id=v_entry_exgp_posi_jour_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.5.84.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("入账交易组持仓流水号=",v_entry_exgp_posi_jour_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("入账交易组持仓流水号=",v_entry_exgp_posi_jour_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_busi_flag = v_busi_flag;
    SET p_occur_qty = v_occur_qty;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_设置持仓记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_UpdatePosiDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_UpdatePosiDeal(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_deal_flag int,
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
    declare v_deal_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_row_id = p_row_id;
    SET v_deal_flag = p_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品期货_持仓_交易组持仓表][{清算结算标志}=@处理标志#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_flag=v_deal_flag where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.5.85.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_清算接口_查询交易组持仓序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuclif_QueryPosiId;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuclif_QueryPosiId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
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
    declare v_qry_no int;
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
    SET v_qry_no = p_qry_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品期货_持仓_交易组持仓表][字段][{当前数量} > 0 and {清算结算标志} <> 《清算结算标志-已处理》 order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, comb_code, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, pre_settle_price, 
        sett_price, rece_margin, sett_flag, open_amount from db_pdfutu.tb_pdfupo_exgp_posi where curr_qty > 0 and sett_flag <> 1 order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, comb_code, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, pre_settle_price, 
        sett_price, rece_margin, sett_flag, open_amount from db_pdfutu.tb_pdfupo_exgp_posi where curr_qty > 0 and sett_flag <> 1 order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


