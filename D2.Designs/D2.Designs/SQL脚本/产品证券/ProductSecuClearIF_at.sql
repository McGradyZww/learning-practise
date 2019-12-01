DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_新增资金入账流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_InsertCapitalEntryJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_InsertCapitalEntryJour(
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
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_busi_flag int,
    IN p_occur_amt decimal(18,4),
    IN p_arrive_date int,
    IN p_order_no int,
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
    declare v_exch_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_arrive_date int;
    declare v_order_no int;
    declare v_entry_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
    declare v_update_date int;
    declare v_update_time int;
    declare v_old_arrive_date int;
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_exch_no = p_exch_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_busi_flag = p_busi_flag;
    SET v_occur_amt = p_occur_amt;
    SET v_arrive_date = p_arrive_date;
    SET v_order_no = p_order_no;
    SET v_entry_status = p_entry_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_old_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #场外基金交易且到账日期等于初始化日期(表示是确认成交的),有成交说明之前有交易,然后根据这个成交流水将到账日期置为今日

    /* if (@市场编号#=5 and @到账日期#=@初始化日期#) then */
    if (v_exch_no=5 and v_arrive_date=v_init_date) then

        /* [更新表记录][产品证券_资金_资金入账流水表][{到账日期}=@初始化日期#][{初始化日期}<>@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {市场编号}=@市场编号# and {订单编号}=@订单编号#][2][@订单编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdseca_capit_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, arrive_date=v_init_date where init_date<>v_init_date and co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and exch_no=v_exch_no and order_no=v_order_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.5.41.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单编号=",v_order_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单编号=",v_order_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* set @原到账日期# = @到账日期#; */
    set v_old_arrive_date = v_arrive_date;

    /* [插入表记录][产品证券_资金_资金入账流水表][字段][字段变量][1][@机构编号#,@产品编号#,@交易组编号#,@资产账户编号#,@本币币种#,@交易币种#,@变动金额#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_capit_entry_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        crncy_type, exch_crncy_type, busi_flag, occur_amt, 
        old_arrive_date, arrive_date, order_no, entry_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_crncy_type, v_exch_crncy_type, v_busi_flag, v_occur_amt, 
        v_old_arrive_date, v_arrive_date, v_order_no, v_entry_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.41.1";
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
use db_pdsecu;;

# 原子_产品证券_清算接口_获取资金入账流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_GetCapitalEntryJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_GetCapitalEntryJour(
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
    OUT p_exch_no int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_busi_flag int,
    OUT p_occur_amt decimal(18,4),
    OUT p_arrive_date int
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
    declare v_exch_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_arrive_date int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_old_arrive_date int;
    declare v_order_no int;
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
    SET v_exch_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_busi_flag = 0;
    SET v_occur_amt = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_old_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_order_no = 0;
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品证券_资金_资金入账流水表][字段][字段变量][{记录序号}=@入账资金流水号#][4][@入账资金流水号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, crncy_type, exch_crncy_type, busi_flag, 
        occur_amt, old_arrive_date, arrive_date, order_no, 
        entry_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_crncy_type, v_exch_crncy_type, v_busi_flag, 
        v_occur_amt, v_old_arrive_date, v_arrive_date, v_order_no, 
        v_entry_status from db_pdsecu.tb_pdseca_capit_entry_jour where row_id=v_entry_money_jour_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.5.51.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("入账资金流水号=",v_entry_money_jour_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("入账资金流水号=",v_entry_money_jour_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资金入账流水表][{入账状态}=《入账状态-已回滚》][{记录序号}=@入账资金流水号#][2][@入账资金流水号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_capit_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="3" where row_id=v_entry_money_jour_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.51.2";
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
    SET p_exch_no = v_exch_no;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_busi_flag = v_busi_flag;
    SET p_occur_amt = v_occur_amt;
    SET p_arrive_date = v_arrive_date;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_交易组资金入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_ExgpCapitalRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_ExgpCapitalRecorded(
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
    IN p_busi_flag int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_arrive_date int,
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
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_busi_flag int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_arrive_date int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_menu_no int;
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_amt_check_diff decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_unfroz_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
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
    declare v_oper_func_code varchar(16);

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
    SET v_busi_flag = p_busi_flag;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_arrive_date = p_arrive_date;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_menu_no = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_remark_info = " ";
    SET v_amt_check_diff = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_curr_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_frozen_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_unfroz_amt = 0;
    SET v_begin_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_change_amt = 0;
    SET v_realize_pandl = 0;
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
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @操作菜单# =0; */
    set v_oper_menu_no =0;

    /* set @变动后金额# = 0; */
    set v_occur_end_amt = 0;

    /* set @操作备注# = @备注信息#; */
    set v_oper_remark_info = v_remark_info;

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @T日当日港股买入金额#=0; */
    set v_T_hk_buy_total_amt=0;

    /* set @T日当日港股卖出金额#=0; */
    set v_T_hk_sell_total_amt=0;

    /* set @T1日当日港股买入金额#=0; */
    set v_T1_hk_buy_total_amt=0;

    /* set @T1日当日港股卖出金额#=0; */
    set v_T1_hk_sell_total_amt=0;

    /* if (@市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 or (@市场编号# = 《市场编号-场外交易市场》 and @到账日期#=@初始化日期#)) then */
    if (v_exch_no = 1 or v_exch_no = 2 or (v_exch_no = 5 and v_arrive_date=v_init_date)) then

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @待交收金额# = 0; */
        set v_pre_settle_amt = 0;

    /* elseif (@市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号# = 《市场编号-深港通证券交易所》) then */
    elseif (v_exch_no = 3 or v_exch_no = 4) then

        /* set @当前金额# = 0; */
        set v_curr_amt = 0;

        /* set @待交收金额# = @变动金额#; */
        set v_pre_settle_amt = v_occur_amt;
    end if;
    #红利有冻结金额变化

    /* if @业务标志#=《业务标志-红利登记》  then */
    if v_busi_flag=2001013  then

        /* set @冻结金额#=@变动金额#; */
        set v_frozen_amt=v_occur_amt;
    #配股 缴款日进行 冻结资金的 释放。 区分于红利，红利到账时, cur不变，frozen释放；配股扣款，cur减少，frozen释放。

    /* elseif @业务标志#=《业务标志-公司行为配股》  then */
    elseif v_busi_flag=2001028  then

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @冻结金额# = @变动金额#; */
        set v_frozen_amt = v_occur_amt;
    else

        /* set @冻结金额#=0; */
        set v_frozen_amt=0;
    end if;
    #场外基金的交易数据只入冻结 , 不影响当前等金额

    /* if (@市场编号# = 《市场编号-场外交易市场》 and @到账日期#<>@初始化日期#) then */
    if (v_exch_no = 5 and v_arrive_date<>v_init_date) then

        /* set @冻结金额#=@变动金额#; */
        set v_frozen_amt=v_occur_amt;

        /* set @当前金额#=0; */
        set v_curr_amt=0;

        /* set @待交收金额#=0; */
        set v_pre_settle_amt=0;
    end if;
    #处理交易组资金入账

    /* [获取流水变动][{当前金额},{待交收金额},{冻结金额},{解冻金额}][@当前金额#,@待交收金额#,@冻结金额#,@解冻金额#] */
    set v_jour_occur_field = concat("当前金额","|","待交收金额","|","冻结金额","|","解冻金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|",v_pre_settle_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|");


    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

    /* set @沪深可用调整金额# = 0; */
    set v_shsz_avail_change_amt = 0;

    /* set @港股通可用调整金额# = 0; */
    set v_hk_avail_change_amt = 0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @红冲蓝补金额# = 0; */
    set v_total_change_amt = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @利率# = 0; */
    set v_intrst_rate = 0;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额#,{待交收金额}={待交收金额}+@待交收金额#,{冻结金额}={冻结金额}+@冻结金额#][1][@交易组编号#,@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_exgp_capit (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, pre_settle_amt, 
        shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, 
        T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, 
        total_payab_amt, total_change_amt, realize_pandl, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_group_no, v_crncy_type, v_begin_amt, 
        v_curr_amt, v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, 
        v_shsz_avail_change_amt, v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, 
        v_T_hk_sell_total_amt, v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, 
        v_total_payab_amt, v_total_change_amt, v_realize_pandl, v_intrst_rate, 
        v_intrst_base_amt, v_pre_entry_intrst_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt,pre_settle_amt=pre_settle_amt+v_pre_settle_amt,frozen_amt=frozen_amt+v_frozen_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.53.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][字段][字段变量][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        pre_settle_amt, shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, 
        T_hk_buy_total_amt, T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, 
        total_rece_amt, total_payab_amt, total_change_amt, realize_pandl, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
        v_begin_amt, v_curr_amt, v_frozen_amt, v_unfroz_amt, 
        v_pre_settle_amt, v_shsz_avail_change_amt, v_hk_avail_change_amt, v_amt_check_diff, 
        v_T_hk_buy_total_amt, v_T_hk_sell_total_amt, v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, 
        v_total_rece_amt, v_total_payab_amt, v_total_change_amt, v_realize_pandl, 
        v_intrst_rate, v_intrst_base_amt, v_pre_entry_intrst_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.5.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 or @市场编号# = 《市场编号-场外交易市场》 then */
    if v_exch_no = 1 or v_exch_no = 2 or v_exch_no = 5 then

        /* set @变动后金额# = @当前金额#; */
        set v_occur_end_amt = v_curr_amt;
    else

        /* set @变动后金额# = @待交收金额#; */
        set v_occur_end_amt = v_pre_settle_amt;
    end if;

    /* [获取流水后信息][@当前金额#,@待交收金额#,@冻结金额#,@解冻金额#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|",v_pre_settle_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|");


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
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
                
        SET v_error_code = "pdsecuA.5.53.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_资产账户资金入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_AsacCapitalRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_AsacCapitalRecorded(
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
    IN p_busi_flag int,
    IN p_arrive_date int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
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
    declare v_busi_flag int;
    declare v_arrive_date int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_menu_no int;
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_amt_check_diff decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_unfroz_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
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
    declare v_oper_func_code varchar(16);

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
    SET v_busi_flag = p_busi_flag;
    SET v_arrive_date = p_arrive_date;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_menu_no = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_remark_info = " ";
    SET v_amt_check_diff = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_curr_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_frozen_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_unfroz_amt = 0;
    SET v_begin_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_change_amt = 0;
    SET v_realize_pandl = 0;
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
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @操作菜单# =0; */
    set v_oper_menu_no =0;

    /* set @变动后金额# = 0; */
    set v_occur_end_amt = 0;

    /* set @操作备注# = @备注信息#; */
    set v_oper_remark_info = v_remark_info;

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @T日当日港股买入金额#=0; */
    set v_T_hk_buy_total_amt=0;

    /* set @T日当日港股卖出金额#=0; */
    set v_T_hk_sell_total_amt=0;

    /* set @T1日当日港股买入金额#=0; */
    set v_T1_hk_buy_total_amt=0;

    /* set @T1日当日港股卖出金额#=0; */
    set v_T1_hk_sell_total_amt=0;

    /* if (@市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 or (@市场编号# = 《市场编号-场外交易市场》 and @到账日期#=@初始化日期#)) then */
    if (v_exch_no = 1 or v_exch_no = 2 or (v_exch_no = 5 and v_arrive_date=v_init_date)) then

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @待交收金额# = 0; */
        set v_pre_settle_amt = 0;

    /* elseif (@市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号# = 《市场编号-深港通证券交易所》) then */
    elseif (v_exch_no = 3 or v_exch_no = 4) then

        /* set @当前金额# = 0; */
        set v_curr_amt = 0;

        /* set @待交收金额# = @变动金额#; */
        set v_pre_settle_amt = v_occur_amt;
    end if;
    #红利有冻结金额变化

    /* if @业务标志#=《业务标志-红利登记》   then */
    if v_busi_flag=2001013   then

      /* set @冻结金额#=@变动金额#; */
      set v_frozen_amt=v_occur_amt;
    #配股 缴款日进行 冻结资金的 释放。 区分于红利，红利到账时, cur不变，frozen释放；配股扣款，cur减少，frozen释放。

    /* elseif @业务标志#=《业务标志-公司行为配股》  then */
    elseif v_busi_flag=2001028  then

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @冻结金额# = @变动金额#; */
        set v_frozen_amt = v_occur_amt;
    else

      /* set @冻结金额#=0; */
      set v_frozen_amt=0;
    end if;
    #场外基金的交易数据只入冻结 , 不影响当前等金额

    /* if (@市场编号# = 《市场编号-场外交易市场》 and @到账日期#<>@初始化日期#) then */
    if (v_exch_no = 5 and v_arrive_date<>v_init_date) then

        /* set @冻结金额#=@变动金额#; */
        set v_frozen_amt=v_occur_amt;

        /* set @当前金额#=0; */
        set v_curr_amt=0;

        /* set @待交收金额#=0; */
        set v_pre_settle_amt=0;
    end if;
    #处理资产账户资金入账

    /* [获取流水变动][{当前金额},{待交收金额},{冻结金额},{解冻金额}][@当前金额#,@待交收金额#,@冻结金额#,@解冻金额#] */
    set v_jour_occur_field = concat("当前金额","|","待交收金额","|","冻结金额","|","解冻金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|",v_pre_settle_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|");


    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

    /* set @沪深可用调整金额# = 0; */
    set v_shsz_avail_change_amt = 0;

    /* set @港股通可用调整金额# = 0; */
    set v_hk_avail_change_amt = 0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @红冲蓝补金额# = 0; */
    set v_total_change_amt = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @利率# = 0; */
    set v_intrst_rate = 0;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* [插入重复更新][产品证券_资金_资产账户资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额#,{待交收金额}={待交收金额}+@待交收金额#,{冻结金额}={冻结金额}+@冻结金额#][2][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_asac_capit (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, pre_settle_amt, shsz_avail_change_amt, 
        hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, T_hk_sell_total_amt, 
        T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, total_payab_amt, 
        total_change_amt, realize_pandl, intrst_rate, intrst_base_amt, 
        pre_entry_intrst_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_crncy_type, v_begin_amt, v_curr_amt, 
        v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, v_shsz_avail_change_amt, 
        v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, v_T_hk_sell_total_amt, 
        v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, v_total_payab_amt, 
        v_total_change_amt, v_realize_pandl, v_intrst_rate, v_intrst_base_amt, 
        v_pre_entry_intrst_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt,pre_settle_amt=pre_settle_amt+v_pre_settle_amt,frozen_amt=frozen_amt+v_frozen_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.54.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][字段][字段变量][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, pre_settle_amt, 
        shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, 
        T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, 
        total_payab_amt, total_change_amt, realize_pandl, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_crncy_type, v_begin_amt, 
        v_curr_amt, v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, 
        v_shsz_avail_change_amt, v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, 
        v_T_hk_sell_total_amt, v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, 
        v_total_payab_amt, v_total_change_amt, v_realize_pandl, v_intrst_rate, 
        v_intrst_base_amt, v_pre_entry_intrst_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.5.54.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 or @市场编号# = 《市场编号-场外交易市场》 then */
    if v_exch_no = 1 or v_exch_no = 2 or v_exch_no = 5 then

        /* set @变动后金额# = @当前金额#; */
        set v_occur_end_amt = v_curr_amt;
    else

        /* set @变动后金额# = @待交收金额#; */
        set v_occur_end_amt = v_pre_settle_amt;
    end if;

    /* [获取流水后信息][@当前金额#,@待交收金额#,@冻结金额#,@解冻金额#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|",v_pre_settle_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|");


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_asac_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, crncy_type, busi_flag, 
        occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_crncy_type, v_busi_flag, 
        v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.54.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_清算资金入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_ClearCapitalRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_ClearCapitalRecorded(
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
    IN p_busi_flag int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_arrive_date int,
    IN p_order_no int,
    IN p_entry_oper int,
    IN p_remark_info varchar(255),
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
    declare v_exch_no int;
    declare v_busi_flag int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_arrive_date int;
    declare v_order_no int;
    declare v_entry_oper int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_busi_flag = p_busi_flag;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_arrive_date = p_arrive_date;
    SET v_order_no = p_order_no;
    SET v_entry_oper = p_entry_oper;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;
    #根据汇率重置入账金额
    #处理交易组资金入账

    /* 调用【原子_产品证券_清算接口_交易组资金入账】*/
    call db_pdsecu.pra_pdsepubif_ExgpCapitalRecorded(
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
        v_busi_flag,
        v_crncy_type,
        v_exch_crncy_type,
        v_occur_amt,
        v_arrive_date,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.5.55.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_交易组资金入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #处理资产账户资金入账

    /* 调用【原子_产品证券_清算接口_资产账户资金入账】*/
    call db_pdsecu.pra_pdsepubif_AsacCapitalRecorded(
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
        v_busi_flag,
        v_arrive_date,
        v_crncy_type,
        v_exch_crncy_type,
        v_occur_amt,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.5.55.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_资产账户资金入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @入账操作# = 1 then */
    if v_entry_oper = 1 then

        /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 or @市场编号# = 《市场编号-场外交易市场》 then */
        if v_exch_no = 1 or v_exch_no = 2 or v_exch_no = 5 then
            #业务标志2004001为融资回购 , 2004002为融券回购 , 2006001为场外基金申购 , 2006002为场外基金赎回 , 场外基金T日交易的数据都是到账日期和初始化日期不一致的

            /* if (@业务标志#=2004001 or @业务标志#=2004002 or (@业务标志#=2006001 and @到账日期#<>@初始化日期#) or (@业务标志#=2006002 and @到账日期#<>@初始化日期#) or (@业务标志#=2006003 and @到账日期#<>@初始化日期#)) then */
            if (v_busi_flag=2004001 or v_busi_flag=2004002 or (v_busi_flag=2006001 and v_arrive_date<>v_init_date) or (v_busi_flag=2006002 and v_arrive_date<>v_init_date) or (v_busi_flag=2006003 and v_arrive_date<>v_init_date)) then

                /* set @入账状态# = 《入账状态-未入账》; */
                set v_entry_status = "2";
            else

                /* set @入账状态# = 《入账状态-已入账》; */
                set v_entry_status = "1";
            end if;
        else

            /* set @入账状态# = 《入账状态-未入账》; */
            set v_entry_status = "2";
        end if;

        /* 调用【原子_产品证券_清算接口_新增资金入账流水】*/
        call db_pdsecu.pra_pdsepubif_InsertCapitalEntryJour(
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
            v_crncy_type,
            v_exch_crncy_type,
            v_busi_flag,
            v_occur_amt,
            v_arrive_date,
            v_order_no,
            v_entry_status,
            v_error_code,
            v_error_info,
            v_entry_money_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuA.5.55.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_新增资金入账流水出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_公司行为资金登记处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_CoActionCapiatlRegDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_CoActionCapiatlRegDeal(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_target_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_busi_flag int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_cost_calc_type int,
    IN p_intrst_entry_type int,
    IN p_arrive_date int,
    IN p_impawn_ratio decimal(18,12),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_money_jour_no bigint,
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_busi_flag int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_cost_calc_type int;
    declare v_intrst_entry_type int;
    declare v_arrive_date int;
    declare v_impawn_ratio decimal(18,12);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_invest_type int;
    declare v_entry_status varchar(2);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_order_no int;
    declare v_unfroz_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_curr_qty decimal(18,2);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_tmp_cost_amt decimal(18,4);
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_oper_menu_no int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_end_qty decimal(18,2);
    declare v_jour_after_occur_info varchar(2048);
    declare v_begin_trade_date int;

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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_busi_flag = p_busi_flag;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_intrst_entry_type = p_intrst_entry_type;
    SET v_arrive_date = p_arrive_date;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_invest_type = 0;
    SET v_entry_status = "0";
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_order_no = 0;
    SET v_unfroz_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_exgp_cost_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_intrst_pandl = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_curr_qty = 0;
    SET v_intrst_cost_amt = 0;
    SET v_asac_curr_qty = 0;
    SET v_cost_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_pandl = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_tmp_cost_amt = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_oper_menu_no = 0;
    SET v_occur_qty = 0;
    SET v_occur_end_qty = 0;
    SET v_jour_after_occur_info = " ";
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* if @业务标志#=《业务标志-红利登记》   then */
    if v_busi_flag=2001013   then

        /* set @入账状态# = 《入账状态-未入账》; */
        set v_entry_status = "2";

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @冻结金额# = @变动金额#; */
        set v_frozen_amt = v_occur_amt;

    /* elseif @业务标志#=《业务标志-债券付息》 or @业务标志#=《业务标志-债券兑付》 then */
    elseif v_busi_flag=2002010 or v_busi_flag=2002009 then

        /* set @入账状态# = 《入账状态-已入账》; */
        set v_entry_status = "1";

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @冻结金额# = 0; */
        set v_frozen_amt = 0;
    #配股缴款资金 到账日直接释放冻结金额 到账。

    /* elseif  @业务标志#=《业务标志-公司行为配股》  then */
    elseif  v_busi_flag=2001028  then

        /* set @入账状态# = 《入账状态-已入账》; */
        set v_entry_status = "1";

        /* set @当前金额# = 0; */
        set v_curr_amt = 0;

        /* set @冻结金额# = @变动金额#; */
        set v_frozen_amt = v_occur_amt;
    else

        /* [报错返回][14][@业务标志#] */
            
            SET v_error_code = "pdsecuA.5.57.14";
            SET v_error_info = concat("业务标志=",v_busi_flag);
            leave label_pro;

    end if;

    /* set @订单编号#=0; */
    set v_order_no=0;

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;
    #处理交易组资金入账

    /* 调用【原子_产品证券_清算接口_交易组资金入账】*/
    call db_pdsecu.pra_pdsepubif_ExgpCapitalRecorded(
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
        v_busi_flag,
        v_crncy_type,
        v_exch_crncy_type,
        v_occur_amt,
        v_arrive_date,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.5.57.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_交易组资金入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #处理资产账户资金入账

    /* 调用【原子_产品证券_清算接口_资产账户资金入账】*/
    call db_pdsecu.pra_pdsepubif_AsacCapitalRecorded(
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
        v_busi_flag,
        v_arrive_date,
        v_crncy_type,
        v_exch_crncy_type,
        v_occur_amt,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.5.57.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_资产账户资金入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if  @业务标志#<>《业务标志-公司行为配股》  then */
    if  v_busi_flag<>2001028  then

        /* 调用【原子_产品证券_清算接口_新增资金入账流水】*/
        call db_pdsecu.pra_pdsepubif_InsertCapitalEntryJour(
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
            v_crncy_type,
            v_exch_crncy_type,
            v_busi_flag,
            v_occur_amt,
            v_arrive_date,
            v_order_no,
            v_entry_status,
            v_error_code,
            v_error_info,
            v_entry_money_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuA.5.57.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_新增资金入账流水出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;

    /* set @交易组成本金额# = 0; */
    set v_exgp_cost_amt = 0;

    /* set @交易组实现盈亏# = 0; */
    set v_exgp_realize_pandl = 0;

    /* set @交易组利息成本金额# = 0; */
    set v_exgp_intrst_cost_amt = 0;

    /* set @交易组利息收益# = 0; */
    set v_exgp_intrst_pandl = 0;

    /* set @资产账户成本金额# = 0; */
    set v_asac_cost_amt = 0;

    /* set @资产账户实现盈亏# = 0; */
    set v_asac_realize_pandl = 0;

    /* set @资产账户利息成本金额# = 0; */
    set v_asac_intrst_cost_amt = 0;

    /* set @资产账户利息收益# = 0; */
    set v_asac_intrst_pandl = 0;

    /* if @业务标志#=《业务标志-红利登记》  then */
    if v_busi_flag=2001013  then

        /* if @红利入账成本盈亏计算方式# = 《红利入账成本盈亏计算方式-入盈亏》 then */
        if v_intrst_entry_type = 1 then

            /* set @交易组实现盈亏# = @变动金额#; */
            set v_exgp_realize_pandl = v_occur_amt;

            /* set @交易组成本金额# = 0; */
            set v_exgp_cost_amt = 0;

            /* set @资产账户实现盈亏# = @变动金额#; */
            set v_asac_realize_pandl = v_occur_amt;

            /* set @资产账户成本金额# = 0; */
            set v_asac_cost_amt = 0;
        else

            /* set @交易组实现盈亏# = 0; */
            set v_exgp_realize_pandl = 0;

            /* set @交易组成本金额# = -1 * @变动金额#; */
            set v_exgp_cost_amt = -1 * v_occur_amt;

            /* set @资产账户实现盈亏# = 0; */
            set v_asac_realize_pandl = 0;

            /* set @资产账户成本金额# = -1 * @变动金额#; */
            set v_asac_cost_amt = -1 * v_occur_amt;
        end if;

    /* elseif @业务标志#=《业务标志-债券付息》 then */
    elseif v_busi_flag=2002010 then

        /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量}+{待交收数量},{利息成本金额}][@当前数量#,@利息成本金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
        select curr_qty+pre_settle_qty,intrst_cost_amt into v_curr_qty,v_intrst_cost_amt from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.5.57.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
            end if;
            leave label_pro;
        end if;


        /* if @成本计算方式# = 《成本计算方式-盈亏冲减成本》 then */
        if v_cost_calc_type = 1 then

            /* set @交易组利息成本金额# = -1 * @变动金额#; */
            set v_exgp_intrst_cost_amt = -1 * v_occur_amt;

            /* set @资产账户利息成本金额# = -1 * @变动金额#; */
            set v_asac_intrst_cost_amt = -1 * v_occur_amt;
        else

            /* set @交易组利息成本金额# = -1 * @利息成本金额#; */
            set v_exgp_intrst_cost_amt = -1 * v_intrst_cost_amt;

            /* set @交易组利息收益# = @变动金额# - @利息成本金额#; */
            set v_exgp_intrst_pandl = v_occur_amt - v_intrst_cost_amt;

            /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{当前数量}+{待交收数量},{利息成本金额}][@资产账户当前数量#,@资产账户利息成本金额#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
            select curr_qty+pre_settle_qty,intrst_cost_amt into v_asac_curr_qty,v_asac_intrst_cost_amt from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pdsecuA.5.57.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;


            /* set @资产账户利息成本金额# = ifnull(round(-1 * @资产账户利息成本金额# * @当前数量# / @资产账户当前数量#,2),0); */
            set v_asac_intrst_cost_amt = ifnull(round(-1 * v_asac_intrst_cost_amt * v_curr_qty / v_asac_curr_qty,2),0);

            /* set @资产账户利息收益# = @变动金额# - @资产账户利息成本金额#; */
            set v_asac_intrst_pandl = v_occur_amt - v_asac_intrst_cost_amt;
        end if;

    /* elseif @业务标志#=《业务标志-公司行为配股》  then */
    elseif v_busi_flag=2001028  then
            #set @交易组实现盈亏# = 0;
            #set @交易组成本金额# = -1 * @变动金额#;
            #set @资产账户实现盈亏# = 0;
            #set @资产账户成本金额# = -1 * @变动金额#;

            /* set @成本金额# = -1 * @变动金额#; */
            set v_cost_amt = -1 * v_occur_amt;

             /* [获取流水变动][{成本金额}][@成本金额#] */
             set v_jour_occur_field = concat("成本金额","|");
             set v_jour_occur_info = concat(v_cost_amt,"|");


            /* set @投资类型#=1; */
            set v_invest_type=1;

            /* set @期初数量# =0; */
            set v_begin_qty =0;

            /* set @当前数量# =0; */
            set v_curr_qty =0;

            /* set @待交收数量# =0; */
            set v_pre_settle_qty =0;

            /* set @冻结数量# =0; */
            set v_frozen_qty =0;

           /* set @解冻数量# =0; */
           set v_unfroz_qty =0;

           /* set @持仓核对差额#=0; */
           set v_posi_qty_check_diff=0;

           /* set @实现盈亏#=0; */
           set v_realize_pandl=0;

           /* set @利息成本金额#=0; */
           set v_intrst_cost_amt=0;

           /* set @利息收益#=0; */
           set v_intrst_pandl=0;

          /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{成本金额} = {成本金额} + @成本金额#][1][@交易组编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_pdsecu.tb_pdsepo_exgp_posi (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
              stock_code_no, stock_type, asset_type, invest_type, 
              begin_qty, curr_qty, pre_settle_qty, frozen_qty, 
              unfroz_qty, posi_qty_check_diff, cost_amt, realize_pandl, 
              intrst_cost_amt, intrst_pandl) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
              v_stock_code_no, v_stock_type, v_asset_type, v_invest_type, 
              v_begin_qty, v_curr_qty, v_pre_settle_qty, v_frozen_qty, 
              v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, 
              v_intrst_cost_amt, v_intrst_pandl) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, cost_amt = cost_amt + v_cost_amt;
          if v_error_code = "1" then
                      
              SET v_error_code = "pdsecuA.5.57.1";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
              end if;
              leave label_pro;
          end if;


          /* [获取表记录变量][产品证券_持仓_交易组持仓表][{成本金额}][@临时_成本金额#][{交易组编号} = @交易组编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
          select cost_amt into v_tmp_cost_amt from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
          if FOUND_ROWS() = 0 then
                      
              SET v_error_code = "pdsecuA.5.57.4";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
              end if;
              leave label_pro;
          end if;


          /* set @操作功能# =@功能编码#; */
          set v_oper_func_code =v_func_code;

            /* set @操作备注# = @备注信息#; */
            set v_oper_remark_info = v_remark_info;

            /* set @操作菜单# =0; */
            set v_oper_menu_no =0;

            /* set @变动数量# =0; */
            set v_occur_qty =0;

            /* set @变动后数量# = 0; */
            set v_occur_end_qty = 0;

             /* [获取流水后信息][ @临时_成本金额#] */
             set v_jour_after_occur_info = concat( v_tmp_cost_amt,"|");


            /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#, @股东代码编号#, @证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_exgp_posi_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, exch_group_no, asset_acco_no, exch_no, 
                stock_acco_no, stock_code_no, busi_flag, occur_qty, 
                occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
                invest_type) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
                v_stock_acco_no, v_stock_code_no, v_busi_flag, v_occur_qty, 
                v_occur_end_qty, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, 
                v_invest_type);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.5.57.5";
                SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
                leave label_pro;
            end if;


            /* [插入重复更新][产品证券_持仓_资产账户持仓表][字段][字段变量][{成本金额} = {成本金额} + @成本金额#][1][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_asac_posi (
                create_date, create_time, update_date, 
                update_time, update_times, co_no, pd_no, 
                asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
                stock_type, asset_type, invest_type, begin_qty, 
                curr_qty, pre_settle_qty, frozen_qty, unfroz_qty, 
                posi_qty_check_diff, cost_amt, realize_pandl, intrst_cost_amt, 
                intrst_pandl) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_co_no, v_pd_no, 
                v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
                v_stock_type, v_asset_type, v_invest_type, v_begin_qty, 
                v_curr_qty, v_pre_settle_qty, v_frozen_qty, v_unfroz_qty, 
                v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, v_intrst_cost_amt, 
                v_intrst_pandl) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, cost_amt = cost_amt + v_cost_amt;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.5.57.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;


            /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{成本金额}][@临时_成本金额#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
            select cost_amt into v_tmp_cost_amt from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pdsecuA.5.57.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;


             /* [获取流水后信息][ @临时_成本金额#] */
             set v_jour_after_occur_info = concat( v_tmp_cost_amt,"|");


            /* [插入表记录][产品证券_持仓_资产账户持仓流水表][字段][字段变量][5][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_asac_posi_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, asset_acco_no, exch_no, stock_acco_no, 
                stock_code_no, busi_flag, occur_qty, occur_end_qty, 
                jour_occur_field, jour_after_occur_info, oper_remark_info, invest_type) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
                v_stock_code_no, v_busi_flag, v_occur_qty, v_occur_end_qty, 
                v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, v_invest_type);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.5.57.5";
                SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
                leave label_pro;
            end if;

    else
        leave label_pro;
    end if;

    /* if @业务标志# <> 《业务标志-公司行为配股》  then */
    if v_busi_flag <> 2001028  then

      /* set @入账状态# = 《入账状态-已入账》; */
      set v_entry_status = "1";

      /* set @上市日期# = @到账日期#; */
      set v_begin_trade_date = v_arrive_date;

      /* set @变动数量# = 0; */
      set v_occur_qty = 0;

      /* set @当前数量# = 0; */
      set v_curr_qty = 0;

      /* set @冻结数量# = 0; */
      set v_frozen_qty = 0;

      /* set @解冻数量# = 0; */
      set v_unfroz_qty = 0;
      #处理交易组持仓入账

      /* set @成本金额# = @交易组成本金额#; */
      set v_cost_amt = v_exgp_cost_amt;

      /* set @实现盈亏# = @交易组实现盈亏#; */
      set v_realize_pandl = v_exgp_realize_pandl;

      /* set @利息成本金额# = @交易组利息成本金额#; */
      set v_intrst_cost_amt = v_exgp_intrst_cost_amt;

      /* set @利息收益# = @交易组利息收益#; */
      set v_intrst_pandl = v_exgp_intrst_pandl;

      /* 调用【原子_产品证券_清算接口_交易组持仓入账】*/
      call db_pdsecu.pra_pdsepubif_PdExchGroupSecuPosiRecorded(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_init_date,
          v_arrive_date,
          v_co_no,
          v_pd_no,
          v_exch_group_no,
          v_asset_acco_no,
          v_exch_no,
          v_stock_acco_no,
          v_stock_code_no,
          v_target_code_no,
          v_stock_type,
          v_asset_type,
          v_occur_qty,
          v_cost_amt,
          v_realize_pandl,
          v_intrst_cost_amt,
          v_intrst_pandl,
          v_impawn_ratio,
          v_busi_flag,
          v_remark_info,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "pdsecuA.5.57.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_交易组持仓入账出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* 调用【原子_产品证券_清算接口_新增交易组持仓入账流水】*/
      call db_pdsecu.pra_pdsepubif_InsertExgpPosiEntryJour(
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
          v_stock_acco_no,
          v_stock_code_no,
          v_target_code_no,
          v_stock_type,
          v_asset_type,
          v_busi_flag,
          v_occur_qty,
          v_cost_amt,
          v_intrst_cost_amt,
          v_realize_pandl,
          v_intrst_pandl,
          v_impawn_ratio,
          v_begin_trade_date,
          v_arrive_date,
          v_order_no,
          v_entry_status,
          v_error_code,
          v_error_info,
          v_entry_exgp_posi_jour_no);
      if v_error_code = "1" then
          SET v_error_code = "pdsecuA.5.57.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_新增交易组持仓入账流水出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

      #处理资产账户持仓入账

      /* set @成本金额# = @资产账户成本金额#; */
      set v_cost_amt = v_asac_cost_amt;

      /* set @实现盈亏# = @资产账户实现盈亏#; */
      set v_realize_pandl = v_asac_realize_pandl;

      /* set @利息成本金额# = @资产账户利息成本金额#; */
      set v_intrst_cost_amt = v_asac_intrst_cost_amt;

      /* set @利息收益# = @资产账户利息收益#; */
      set v_intrst_pandl = v_asac_intrst_pandl;

      /* 调用【原子_产品证券_清算接口_资产账户持仓入账】*/
      call db_pdsecu.pra_pdsepubif_PdAssetAccoSecuPosiRecorded(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_init_date,
          v_arrive_date,
          v_co_no,
          v_pd_no,
          v_asset_acco_no,
          v_exch_no,
          v_stock_acco_no,
          v_stock_code_no,
          v_target_code_no,
          v_stock_type,
          v_asset_type,
          v_occur_qty,
          v_cost_amt,
          v_realize_pandl,
          v_intrst_cost_amt,
          v_intrst_pandl,
          v_impawn_ratio,
          v_busi_flag,
          v_remark_info,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "pdsecuA.5.57.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_资产账户持仓入账出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* 调用【原子_产品证券_清算接口_新增资产账户持仓入账流水】*/
      call db_pdsecu.pra_pdsepubif_InsertAsacPosiEntryJour(
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
          v_stock_acco_no,
          v_stock_code_no,
          v_target_code_no,
          v_stock_type,
          v_asset_type,
          v_busi_flag,
          v_occur_qty,
          v_cost_amt,
          v_intrst_cost_amt,
          v_realize_pandl,
          v_intrst_pandl,
          v_impawn_ratio,
          v_begin_trade_date,
          v_arrive_date,
          v_order_no,
          v_entry_status,
          v_error_code,
          v_error_info,
          v_entry_asac_posi_jour_no);
      if v_error_code = "1" then
          SET v_error_code = "pdsecuA.5.57.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_新增资产账户持仓入账流水出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no;
    SET p_entry_asac_posi_jour_no = v_entry_asac_posi_jour_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_公司行为股份登记处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_CoActionPosiRegDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_CoActionPosiRegDeal(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_occur_amt decimal(18,4),
    IN p_occur_qty decimal(18,2),
    IN p_busi_flag int,
    IN p_target_code_no int,
    IN p_impawn_ratio decimal(18,12),
    IN p_begin_trade_date int,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_money_jour_no bigint,
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
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_begin_trade_date int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_invest_type int;
    declare v_order_no int;
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_entry_status varchar(2);
    declare v_arrive_date int;
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_unfroz_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_tmp_curr_qty decimal(18,2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_tmp_stock_code_no int;

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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_occur_amt = p_occur_amt;
    SET v_occur_qty = p_occur_qty;
    SET v_busi_flag = p_busi_flag;
    SET v_target_code_no = p_target_code_no;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_invest_type = 0;
    SET v_order_no = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_entry_status = "0";
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_unfroz_qty = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_tmp_curr_qty = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;

    /* set @入账交易组持仓流水号# = 0; */
    set v_entry_exgp_posi_jour_no = 0;

    /* set @入账资产账户持仓流水号# = 0; */
    set v_entry_asac_posi_jour_no = 0;

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @订单编号#=0; */
    set v_order_no=0;

    /* if @业务标志#=《业务标志-红股登记》 or @业务标志#=《业务标志-公司行为配股》 then */
    if v_busi_flag=2001014 or v_busi_flag=2001028 then

        /* set @当前数量# = @变动数量#; */
        set v_curr_qty = v_occur_qty;

        /* set @冻结数量# = @变动数量#; */
        set v_frozen_qty = v_occur_qty;

        /* set @入账状态# = 《入账状态-未入账》; */
        set v_entry_status = "2";

    /* elseif @业务标志#=《业务标志-债券兑付》 then */
    elseif v_busi_flag=2002009 then

        /* set @当前数量# = @变动数量#; */
        set v_curr_qty = v_occur_qty;

        /* set @冻结数量# = 0; */
        set v_frozen_qty = 0;

        /* set @入账状态# = 《入账状态-已入账》; */
        set v_entry_status = "1";
    else

        /* [报错返回][14][@业务标志#] */
            
            SET v_error_code = "pdsecuA.5.58.14";
            SET v_error_info = concat("业务标志=",v_busi_flag);
            leave label_pro;

    end if;

    /* set @到账日期# = @上市日期#; */
    set v_arrive_date = v_begin_trade_date;

    /* set @利息成本金额# = 0; */
    set v_intrst_cost_amt = 0;

    /* set @利息收益# = 0; */
    set v_intrst_pandl = 0;

    /* set @解冻数量# = 0; */
    set v_unfroz_qty = 0;

    /* set @成本金额# = 0; */
    set v_cost_amt = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;
    #处理交易组持仓入账

    /* 调用【原子_产品证券_清算接口_交易组持仓入账】*/
    call db_pdsecu.pra_pdsepubif_PdExchGroupSecuPosiRecorded(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_arrive_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_target_code_no,
        v_stock_type,
        v_asset_type,
        v_occur_qty,
        v_cost_amt,
        v_realize_pandl,
        v_intrst_cost_amt,
        v_intrst_pandl,
        v_impawn_ratio,
        v_busi_flag,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.5.58.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_交易组持仓入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_产品证券_清算接口_新增交易组持仓入账流水】*/
    call db_pdsecu.pra_pdsepubif_InsertExgpPosiEntryJour(
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
        v_stock_acco_no,
        v_stock_code_no,
        v_target_code_no,
        v_stock_type,
        v_asset_type,
        v_busi_flag,
        v_occur_qty,
        v_cost_amt,
        v_intrst_cost_amt,
        v_realize_pandl,
        v_intrst_pandl,
        v_impawn_ratio,
        v_begin_trade_date,
        v_arrive_date,
        v_order_no,
        v_entry_status,
        v_error_code,
        v_error_info,
        v_entry_exgp_posi_jour_no);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.5.58.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_新增交易组持仓入账流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #处理资产账户持仓入账

    /* 调用【原子_产品证券_清算接口_资产账户持仓入账】*/
    call db_pdsecu.pra_pdsepubif_PdAssetAccoSecuPosiRecorded(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_arrive_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_target_code_no,
        v_stock_type,
        v_asset_type,
        v_occur_qty,
        v_cost_amt,
        v_realize_pandl,
        v_intrst_cost_amt,
        v_intrst_pandl,
        v_impawn_ratio,
        v_busi_flag,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.5.58.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_资产账户持仓入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_产品证券_清算接口_新增资产账户持仓入账流水】*/
    call db_pdsecu.pra_pdsepubif_InsertAsacPosiEntryJour(
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
        v_stock_acco_no,
        v_stock_code_no,
        v_target_code_no,
        v_stock_type,
        v_asset_type,
        v_busi_flag,
        v_occur_qty,
        v_cost_amt,
        v_intrst_cost_amt,
        v_realize_pandl,
        v_intrst_pandl,
        v_impawn_ratio,
        v_begin_trade_date,
        v_arrive_date,
        v_order_no,
        v_entry_status,
        v_error_code,
        v_error_info,
        v_entry_asac_posi_jour_no);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.5.58.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_新增资产账户持仓入账流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #需要处理债券质押数据，债券兑付需要减少标准券解冻数量

    /* if @业务标志#=《业务标志-债券兑付》 then */
    if v_busi_flag=2002009 then

        /* [获取表记录变量语句][产品证券_持仓_交易组债券质押表][{当前数量}][@临时_当前数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
        select curr_qty into v_tmp_curr_qty from db_pdsecu.tb_pdsepo_exgp_bond_pledge where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;

        if FOUND_ROWS() = 0 then

            /* set @临时_当前数量# =0; */
            set v_tmp_curr_qty =0;
        end if;

        /* if @临时_当前数量# > 0 then */
        if v_tmp_curr_qty > 0 then

            /* set @变动数量# = 0; */
            set v_occur_qty = 0;

            /* set @当前数量# = 0; */
            set v_curr_qty = 0;

            /* set @成本金额# = 0; */
            set v_cost_amt = 0;

            /* set @利息成本金额# = 0; */
            set v_intrst_cost_amt = 0;

            /* set @实现盈亏# = 0; */
            set v_realize_pandl = 0;

            /* set @利息收益# = 0; */
            set v_intrst_pandl = 0;

            /* set @冻结数量# =  -1*@临时_当前数量#; */
            set v_frozen_qty =  -1*v_tmp_curr_qty;

            /* set @解冻数量# = 0; */
            set v_unfroz_qty = 0;
            #处理交易组持仓入账
            #[原子_产品证券_清算接口_交易组持仓入账]

            /* [更新表记录][产品证券_持仓_交易组持仓表][{冻结数量} = {冻结数量} + @冻结数量#][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty = frozen_qty + v_frozen_qty where exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.5.58.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;

            #处理资产账户持仓入账
            #[原子_产品证券_清算接口_资产账户持仓入账]

            /* [更新表记录][产品证券_持仓_资产账户持仓表][{冻结数量} = {冻结数量} + @冻结数量#][ {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty = frozen_qty + v_frozen_qty where  asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.5.58.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;


            /* set @临时_证券代码编号# = @证券代码编号#; */
            set v_tmp_stock_code_no = v_stock_code_no;

            /* set @证券代码编号# = @标的代码编号#; */
            set v_stock_code_no = v_target_code_no;

            /* set @冻结数量# = 0; */
            set v_frozen_qty = 0;

            /* set @解冻数量# = -1*@临时_当前数量#*@质押比例#; */
            set v_unfroz_qty = -1*v_tmp_curr_qty*v_impawn_ratio;
            #处理交易组持仓入账
            #[原子_产品证券_清算接口_交易组持仓入账]

            /* [更新表记录][产品证券_持仓_交易组持仓表][{解冻数量} = {解冻数量} + @解冻数量#][{交易组编号}=@交易组编号#  and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_qty = unfroz_qty + v_unfroz_qty where exch_group_no=v_exch_group_no  and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.5.58.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;

            #处理资产账户持仓入账
            #[原子_产品证券_清算接口_资产账户持仓入账]

            /* [更新表记录][产品证券_持仓_资产账户持仓表][{解冻数量} = {解冻数量} + @解冻数量#][ {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_qty = unfroz_qty + v_unfroz_qty where  asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.5.58.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;

            #更新债券质押表

            /* set @证券代码编号#=@临时_证券代码编号#; */
            set v_stock_code_no=v_tmp_stock_code_no;

            /* [更新表记录][产品证券_持仓_交易组债券质押表][{当前数量}={当前数量}-@临时_当前数量#,{转回质押数量}={转回质押数量}+@临时_当前数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][2][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_exgp_bond_pledge set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty-v_tmp_curr_qty,get_impawn_qty=get_impawn_qty+v_tmp_curr_qty where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.5.58.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][产品证券_持仓_资产账户债券质押表][{当前数量}={当前数量}-@临时_当前数量#,{转回质押数量}={转回质押数量}+@临时_当前数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][2][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_asac_bond_pledge set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty-v_tmp_curr_qty,get_impawn_qty=get_impawn_qty+v_tmp_curr_qty where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.5.58.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][产品证券_持仓_交易组持仓入账流水表][{质押数量}=@临时_当前数量#][{记录序号}=@入账交易组持仓流水号#][2][@入账交易组持仓流水号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_exgp_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, impawn_qty=v_tmp_curr_qty where row_id=v_entry_exgp_posi_jour_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.5.58.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("入账交易组持仓流水号=",v_entry_exgp_posi_jour_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("入账交易组持仓流水号=",v_entry_exgp_posi_jour_no);
                end if;
                leave label_pro;
            end if;

        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no;
    SET p_entry_asac_posi_jour_no = v_entry_asac_posi_jour_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_回滚公司行为资金登记处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_UndoCoActionCapiatlRegDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_UndoCoActionCapiatlRegDeal(
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
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_busi_flag int,
    IN p_occur_amt decimal(18,4),
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
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_unfroz_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
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
    SET v_exch_no = p_exch_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_busi_flag = p_busi_flag;
    SET v_occur_amt = p_occur_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_remark_info = " ";
    SET v_unfroz_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* if @业务标志#=《业务标志-红利登记》  then */
    if v_busi_flag=2001013  then

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @冻结金额# = @变动金额#; */
        set v_frozen_amt = v_occur_amt;

    /* elseif @业务标志#=《业务标志-债券付息》 or @业务标志#=《业务标志-债券兑付》 then */
    elseif v_busi_flag=2002010 or v_busi_flag=2002009 then

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @冻结金额# = 0; */
        set v_frozen_amt = 0;
    else

        /* [报错返回][14][@业务标志#] */
            
            SET v_error_code = "pdsecuA.5.59.14";
            SET v_error_info = concat("业务标志=",v_busi_flag);
            leave label_pro;

    end if;

    /* set @备注信息# = "公司行为登记回滚处理"; */
    set v_remark_info = "公司行为登记回滚处理";

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @到账日期#=0; */
    set v_arrive_date=0;
    #处理交易组资金入账

    /* 调用【原子_产品证券_清算接口_交易组资金入账】*/
    call db_pdsecu.pra_pdsepubif_ExgpCapitalRecorded(
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
        v_busi_flag,
        v_crncy_type,
        v_exch_crncy_type,
        v_occur_amt,
        v_arrive_date,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.5.59.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_交易组资金入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #处理资产账户资金入账

    /* 调用【原子_产品证券_清算接口_资产账户资金入账】*/
    call db_pdsecu.pra_pdsepubif_AsacCapitalRecorded(
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
        v_busi_flag,
        v_arrive_date,
        v_crncy_type,
        v_exch_crncy_type,
        v_occur_amt,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.5.59.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_资产账户资金入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_回滚公司行为股份登记处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_UndoCoActionPosiRegDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_UndoCoActionPosiRegDeal(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_occur_qty decimal(18,2),
    IN p_exgp_cost_amt decimal(18,4),
    IN p_exgp_realize_pandl decimal(18,4),
    IN p_exgp_intrst_cost_amt decimal(18,4),
    IN p_exgp_intrst_pandl decimal(18,4),
    IN p_asac_cost_amt decimal(18,4),
    IN p_asac_realize_pandl decimal(18,4),
    IN p_asac_intrst_cost_amt decimal(18,4),
    IN p_asac_intrst_pandl decimal(18,4),
    IN p_busi_flag int,
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_impawn_qty decimal(18,2),
    IN p_impawn_ratio decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_money_jour_no bigint,
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_occur_qty decimal(18,2);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_busi_flag int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_impawn_qty decimal(18,2);
    declare v_impawn_ratio decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_arrive_date int;
    declare v_remark_info varchar(255);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_tmp_stock_code_no int;
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_occur_qty = p_occur_qty;
    SET v_exgp_cost_amt = p_exgp_cost_amt;
    SET v_exgp_realize_pandl = p_exgp_realize_pandl;
    SET v_exgp_intrst_cost_amt = p_exgp_intrst_cost_amt;
    SET v_exgp_intrst_pandl = p_exgp_intrst_pandl;
    SET v_asac_cost_amt = p_asac_cost_amt;
    SET v_asac_realize_pandl = p_asac_realize_pandl;
    SET v_asac_intrst_cost_amt = p_asac_intrst_cost_amt;
    SET v_asac_intrst_pandl = p_asac_intrst_pandl;
    SET v_busi_flag = p_busi_flag;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_impawn_qty = p_impawn_qty;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_remark_info = " ";
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_tmp_stock_code_no = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;

    /* set @入账交易组持仓流水号# = 0; */
    set v_entry_exgp_posi_jour_no = 0;

    /* set @入账资产账户持仓流水号# = 0; */
    set v_entry_asac_posi_jour_no = 0;

    /* set @到账日期#=0; */
    set v_arrive_date=0;

    /* set @备注信息# = "公司行为登记回滚处理"; */
    set v_remark_info = "公司行为登记回滚处理";

    /* if @业务标志#=《业务标志-红股登记》 then */
    if v_busi_flag=2001014 then

        /* set @当前数量# = @变动数量#; */
        set v_curr_qty = v_occur_qty;

        /* set @冻结数量# = @变动数量#; */
        set v_frozen_qty = v_occur_qty;

    /* elseif @业务标志#=《业务标志-债券兑付》 then */
    elseif v_busi_flag=2002009 then

        /* set @当前数量# = @变动数量#; */
        set v_curr_qty = v_occur_qty;

        /* set @冻结数量# = 0; */
        set v_frozen_qty = 0;
    end if;

    /* set @解冻数量# = 0; */
    set v_unfroz_qty = 0;
    #处理交易组持仓入账

    /* set @成本金额# = @交易组成本金额#; */
    set v_cost_amt = v_exgp_cost_amt;

    /* set @实现盈亏# = @交易组实现盈亏#; */
    set v_realize_pandl = v_exgp_realize_pandl;

    /* set @利息成本金额# = @交易组利息成本金额#; */
    set v_intrst_cost_amt = v_exgp_intrst_cost_amt;

    /* set @利息收益# = @交易组利息收益#; */
    set v_intrst_pandl = v_exgp_intrst_pandl;

    /* 调用【原子_产品证券_清算接口_交易组持仓入账】*/
    call db_pdsecu.pra_pdsepubif_PdExchGroupSecuPosiRecorded(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_arrive_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_target_code_no,
        v_stock_type,
        v_asset_type,
        v_occur_qty,
        v_cost_amt,
        v_realize_pandl,
        v_intrst_cost_amt,
        v_intrst_pandl,
        v_impawn_ratio,
        v_busi_flag,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.5.60.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_交易组持仓入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #处理资产账户持仓入账

    /* set @成本金额# = @交易组成本金额#; */
    set v_cost_amt = v_exgp_cost_amt;

    /* set @实现盈亏# = @交易组实现盈亏#; */
    set v_realize_pandl = v_exgp_realize_pandl;

    /* set @利息成本金额# = @交易组利息成本金额#; */
    set v_intrst_cost_amt = v_exgp_intrst_cost_amt;

    /* set @利息收益# = @交易组利息收益#; */
    set v_intrst_pandl = v_exgp_intrst_pandl;

    /* 调用【原子_产品证券_清算接口_资产账户持仓入账】*/
    call db_pdsecu.pra_pdsepubif_PdAssetAccoSecuPosiRecorded(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_arrive_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_target_code_no,
        v_stock_type,
        v_asset_type,
        v_occur_qty,
        v_cost_amt,
        v_realize_pandl,
        v_intrst_cost_amt,
        v_intrst_pandl,
        v_impawn_ratio,
        v_busi_flag,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.5.60.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_资产账户持仓入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #需要处理债券质押数据，债券兑付需要减少标准券解冻数量

    /* if @业务标志#=《业务标志-债券兑付》 then */
    if v_busi_flag=2002009 then

        /* if @质押数量#<0 then */
        if v_impawn_qty<0 then

            /* set @变动数量# = 0; */
            set v_occur_qty = 0;

            /* set @当前数量# = 0; */
            set v_curr_qty = 0;

            /* set @成本金额# = 0; */
            set v_cost_amt = 0;

            /* set @利息成本金额# = 0; */
            set v_intrst_cost_amt = 0;

            /* set @实现盈亏# = 0; */
            set v_realize_pandl = 0;

            /* set @利息收益# = 0; */
            set v_intrst_pandl = 0;

            /* set @冻结数量# = -1 * @质押数量#; */
            set v_frozen_qty = -1 * v_impawn_qty;

            /* set @解冻数量# = 0; */
            set v_unfroz_qty = 0;
            #处理交易组持仓入账

            /* 调用【原子_产品证券_清算接口_交易组持仓入账】*/
            call db_pdsecu.pra_pdsepubif_PdExchGroupSecuPosiRecorded(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_arrive_date,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_target_code_no,
                v_stock_type,
                v_asset_type,
                v_occur_qty,
                v_cost_amt,
                v_realize_pandl,
                v_intrst_cost_amt,
                v_intrst_pandl,
                v_impawn_ratio,
                v_busi_flag,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuA.5.60.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_交易组持仓入账出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

            #处理资产账户持仓入账

            /* 调用【原子_产品证券_清算接口_资产账户持仓入账】*/
            call db_pdsecu.pra_pdsepubif_PdAssetAccoSecuPosiRecorded(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_arrive_date,
                v_co_no,
                v_pd_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_target_code_no,
                v_stock_type,
                v_asset_type,
                v_occur_qty,
                v_cost_amt,
                v_realize_pandl,
                v_intrst_cost_amt,
                v_intrst_pandl,
                v_impawn_ratio,
                v_busi_flag,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuA.5.60.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_资产账户持仓入账出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @临时_证券代码编号# = @证券代码编号#; */
            set v_tmp_stock_code_no = v_stock_code_no;

            /* set @证券代码编号# = @标的代码编号#; */
            set v_stock_code_no = v_target_code_no;

            /* set @冻结数量# = 0; */
            set v_frozen_qty = 0;

            /* set @解冻数量# = -1*@质押数量#*@质押比例#; */
            set v_unfroz_qty = -1*v_impawn_qty*v_impawn_ratio;
            #处理交易组持仓入账

            /* 调用【原子_产品证券_清算接口_交易组持仓入账】*/
            call db_pdsecu.pra_pdsepubif_PdExchGroupSecuPosiRecorded(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_arrive_date,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_target_code_no,
                v_stock_type,
                v_asset_type,
                v_occur_qty,
                v_cost_amt,
                v_realize_pandl,
                v_intrst_cost_amt,
                v_intrst_pandl,
                v_impawn_ratio,
                v_busi_flag,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuA.5.60.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_交易组持仓入账出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

            #处理资产账户持仓入账

            /* 调用【原子_产品证券_清算接口_资产账户持仓入账】*/
            call db_pdsecu.pra_pdsepubif_PdAssetAccoSecuPosiRecorded(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_arrive_date,
                v_co_no,
                v_pd_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_target_code_no,
                v_stock_type,
                v_asset_type,
                v_occur_qty,
                v_cost_amt,
                v_realize_pandl,
                v_intrst_cost_amt,
                v_intrst_pandl,
                v_impawn_ratio,
                v_busi_flag,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuA.5.60.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_资产账户持仓入账出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

            #更新债券质押表

            /* set @证券代码编号#=@临时_证券代码编号#; */
            set v_stock_code_no=v_tmp_stock_code_no;

            /* [更新表记录][产品证券_持仓_交易组债券质押表][{当前数量}={当前数量}-@质押数量#,{转回质押数量}={转回质押数量}+@质押数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][2][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_exgp_bond_pledge set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty-v_impawn_qty,get_impawn_qty=get_impawn_qty+v_impawn_qty where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.5.60.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][产品证券_持仓_资产账户债券质押表][{当前数量}={当前数量}-@质押数量#,{转回质押数量}={转回质押数量}+@质押数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][2][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_asac_bond_pledge set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty-v_impawn_qty,get_impawn_qty=get_impawn_qty+v_impawn_qty where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.5.60.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;

        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no;
    SET p_entry_asac_posi_jour_no = v_entry_asac_posi_jour_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_计算成本盈亏
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_ClearSecuCostProfitCacl;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_ClearSecuCostProfitCacl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_arrive_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_occur_amt decimal(18,4),
    IN p_occur_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_bond_rate_type int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_busi_flag int,
    IN p_cost_calc_type int,
    IN p_intrst_entry_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4)
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
    declare v_arrive_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_busi_flag int;
    declare v_cost_calc_type int;
    declare v_intrst_entry_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_invest_type int;
    declare v_tmp_curr_qty decimal(18,2);
    declare v_tmp_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_cost_amt decimal(18,4);
    declare v_tmp_intrst_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_pandl decimal(18,4);

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
    SET v_arrive_date = p_arrive_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_occur_amt = p_occur_amt;
    SET v_occur_qty = p_occur_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_busi_flag = p_busi_flag;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_intrst_entry_type = p_intrst_entry_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_cost_amt = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_intrst_pandl = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_invest_type = 0;
    SET v_tmp_curr_qty = 0;
    SET v_tmp_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_cost_amt = 0;
    SET v_tmp_intrst_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_pandl = 0;

    
    label_pro:BEGIN
    

    /* set @交易组成本金额# = 0; */
    set v_exgp_cost_amt = 0;

    /* set @交易组实现盈亏# = 0; */
    set v_exgp_realize_pandl = 0;

    /* set @交易组利息成本金额# = 0; */
    set v_exgp_intrst_cost_amt = 0;

    /* set @交易组利息收益# = 0; */
    set v_exgp_intrst_pandl = 0;

    /* set @资产账户成本金额# = 0; */
    set v_asac_cost_amt = 0;

    /* set @资产账户实现盈亏# = 0; */
    set v_asac_realize_pandl = 0;

    /* set @资产账户利息成本金额# = 0; */
    set v_asac_intrst_cost_amt = 0;

    /* set @资产账户利息收益# = 0; */
    set v_asac_intrst_pandl = 0;

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* if (@业务标志# = 《业务标志-股票买入》 or @业务标志# = 《业务标志-基金买入》  or  @业务标志# = 《业务标志-股票融资买入》 or @业务标志# = 《业务标志-基金融资买入》  or  @业务标志# = 《业务标志-股票买券还券》 or @业务标志# = 《业务标志-基金买券还券》 or (@业务标志# = 《业务标志-基金申购》 and @到账日期#=@初始化日期#)) then */
    if (v_busi_flag = 2001001 or v_busi_flag = 2003001  or  v_busi_flag = 2001021 or v_busi_flag = 2003021  or  v_busi_flag = 2001023 or v_busi_flag = 2003023 or (v_busi_flag = 2006001 and v_arrive_date=v_init_date)) then
        #本次成本金额，为变动金额

        /* set @交易组成本金额# = -1 * @变动金额#; */
        set v_exgp_cost_amt = -1 * v_occur_amt;

        /* set @资产账户成本金额# = -1 * @变动金额#; */
        set v_asac_cost_amt = -1 * v_occur_amt;

    /* elseif (@业务标志# = 《业务标志-股票卖出》 or @业务标志# = 《业务标志-基金卖出》 or  @业务标志# = 《业务标志-股票融券卖出》 or @业务标志# = 《业务标志-基金融券卖出》 or  @业务标志# = 《业务标志-股票卖券还款》 or @业务标志# = 《业务标志-基金卖券还款》  or (@业务标志# = 《业务标志-基金赎回》 and @到账日期#=@初始化日期#)) then */
    elseif (v_busi_flag = 2001002 or v_busi_flag = 2003002 or  v_busi_flag = 2001022 or v_busi_flag = 2003022 or  v_busi_flag = 2001024 or v_busi_flag = 2003024  or (v_busi_flag = 2006002 and v_arrive_date=v_init_date)) then

        /* if @变动数量# = 0 then */
        if v_occur_qty = 0 then

            /* if @成本计算方式# = 《成本计算方式-盈亏冲减成本》 then */
            if v_cost_calc_type = 1 then

                /* set @交易组成本金额# = -1 * @变动金额#; */
                set v_exgp_cost_amt = -1 * v_occur_amt;

                /* set @交易组实现盈亏# = 0; */
                set v_exgp_realize_pandl = 0;

                /* set @资产账户成本金额# = -1 * @变动金额#; */
                set v_asac_cost_amt = -1 * v_occur_amt;

                /* set @资产账户实现盈亏# = 0; */
                set v_asac_realize_pandl = 0;
            else
                #本次盈亏金额为本次清算金额+本次成本金额(卖出为负值)

                /* set @交易组实现盈亏# = @变动金额#; */
                set v_exgp_realize_pandl = v_occur_amt;
                #本次盈亏金额为本次清算金额+本次成本金额(卖出为负值)

                /* set @资产账户实现盈亏# = @变动金额#; */
                set v_asac_realize_pandl = v_occur_amt;
            end if;
        else

            /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{当前数量}+{待交收数量},{成本金额}][@临时_当前数量#,@临时_成本金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
            select curr_qty+pre_settle_qty,cost_amt into v_tmp_curr_qty,v_tmp_cost_amt from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;

            if FOUND_ROWS() = 0 then

                /* set @临时_当前数量# = 0; */
                set v_tmp_curr_qty = 0;

                /* set @临时_成本金额# = 0; */
                set v_tmp_cost_amt = 0;
            end if;
            #本次成本金额，为原来负的总成本金额的数量占比

            /* if @临时_当前数量#=0 then */
            if v_tmp_curr_qty=0 then

                /* set @交易组成本金额# = 0; */
                set v_exgp_cost_amt = 0;
            else

                /* set @交易组成本金额# = -round((@成交数量#/@临时_当前数量# * @临时_成本金额#),2); */
                set v_exgp_cost_amt = -round((v_strike_qty/v_tmp_curr_qty * v_tmp_cost_amt),2);
            end if;

            /* if @成本计算方式# = 《成本计算方式-盈亏冲减成本》 then */
            if v_cost_calc_type = 1 then

                /* set @交易组成本金额# = -1 * @变动金额#; */
                set v_exgp_cost_amt = -1 * v_occur_amt;

                /* set @交易组实现盈亏# = 0; */
                set v_exgp_realize_pandl = 0;
            else
                #本次盈亏金额为本次清算金额+本次成本金额(卖出为负值)

                /* set @交易组实现盈亏# = @变动金额# + @交易组成本金额#; */
                set v_exgp_realize_pandl = v_occur_amt + v_exgp_cost_amt;
            end if;

            /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][{当前数量}+{待交收数量},{成本金额}][@临时_当前数量#,@临时_成本金额#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
            select curr_qty+pre_settle_qty,cost_amt into v_tmp_curr_qty,v_tmp_cost_amt from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;

            if FOUND_ROWS() = 0 then

                /* set @临时_当前数量# = 0; */
                set v_tmp_curr_qty = 0;

                /* set @临时_成本金额# = 0; */
                set v_tmp_cost_amt = 0;
            end if;
            #本次成本金额，为原来负的总成本金额的数量占比

            /* if @临时_当前数量#=0 then */
            if v_tmp_curr_qty=0 then

                /* set @资产账户成本金额# = 0; */
                set v_asac_cost_amt = 0;
            else

                /* set @资产账户成本金额# = -round((@成交数量#/@临时_当前数量# * @临时_成本金额#),2); */
                set v_asac_cost_amt = -round((v_strike_qty/v_tmp_curr_qty * v_tmp_cost_amt),2);
            end if;

            /* if @成本计算方式# = 《成本计算方式-盈亏冲减成本》 then */
            if v_cost_calc_type = 1 then

                /* set @资产账户成本金额# = -1 * @变动金额#; */
                set v_asac_cost_amt = -1 * v_occur_amt;

                /* set @资产账户实现盈亏# = 0; */
                set v_asac_realize_pandl = 0;
            else
                #本次盈亏金额为本次清算金额+本次成本金额(卖出为负值)

                /* set @资产账户实现盈亏# = @变动金额# + @资产账户成本金额#; */
                set v_asac_realize_pandl = v_occur_amt + v_asac_cost_amt;
            end if;
        end if;

    /* elseif @业务标志# = 《业务标志-债券买入》 or @业务标志# = 《业务标志-债券融资买入》 or @业务标志# = 《业务标志-债券买券还券》 then */
    elseif v_busi_flag = 2002001 or v_busi_flag = 2002021 or v_busi_flag = 2002023 then
        #如果是债券，则需要根据净价标准，计算利息成本金额和利息收益

        /* if @变动数量# = 0 then */
        if v_occur_qty = 0 then

            /* set @交易组成本金额# = -1 * @变动金额#; */
            set v_exgp_cost_amt = -1 * v_occur_amt;

            /* set @资产账户成本金额# = -1 * @变动金额#; */
            set v_asac_cost_amt = -1 * v_occur_amt;
        else

            /* if @债券利率类型# = 《债券利率类型-零息》 then */
            if v_bond_rate_type = 3 then

                /* set @交易组利息成本金额# = 0; */
                set v_exgp_intrst_cost_amt = 0;
            else

                /* set @交易组利息成本金额# = round(@债券计提利息# * @成交数量#,2); */
                set v_exgp_intrst_cost_amt = round(v_bond_accr_intrst * v_strike_qty,2);
            end if;

            /* set @交易组成本金额# = -1 * @变动金额# - @交易组利息成本金额#; */
            set v_exgp_cost_amt = -1 * v_occur_amt - v_exgp_intrst_cost_amt;

            /* set @资产账户利息成本金额# = @交易组利息成本金额#; */
            set v_asac_intrst_cost_amt = v_exgp_intrst_cost_amt;

            /* set @资产账户成本金额# = -1 * @变动金额# - @资产账户利息成本金额#; */
            set v_asac_cost_amt = -1 * v_occur_amt - v_asac_intrst_cost_amt;
        end if;

    /* elseif @业务标志# = 《业务标志-债券卖出》 or @业务标志# = 《业务标志-债券融券卖出》 or @业务标志# = 《业务标志-债券卖券还款》  then */
    elseif v_busi_flag = 2002002 or v_busi_flag = 2002022 or v_busi_flag = 2002024  then

        /* if @变动数量# = 0 then */
        if v_occur_qty = 0 then

            /* if @成本计算方式# = 《成本计算方式-盈亏冲减成本》 then */
            if v_cost_calc_type = 1 then

                /* set @交易组成本金额# = -1 * @变动金额#; */
                set v_exgp_cost_amt = -1 * v_occur_amt;

                /* set @交易组实现盈亏# = 0; */
                set v_exgp_realize_pandl = 0;

                /* set @资产账户成本金额# = -1 * @变动金额#; */
                set v_asac_cost_amt = -1 * v_occur_amt;

                /* set @资产账户实现盈亏# = 0; */
                set v_asac_realize_pandl = 0;
            else
                #本次盈亏金额为本次清算金额+本次成本金额(卖出为负值)

                /* set @交易组实现盈亏# = @变动金额#; */
                set v_exgp_realize_pandl = v_occur_amt;
                #本次盈亏金额为本次清算金额+本次成本金额(卖出为负值)

                /* set @资产账户实现盈亏# = @变动金额#; */
                set v_asac_realize_pandl = v_occur_amt;
            end if;
        else

            /* if @债券利率类型# = 《债券利率类型-零息》 then */
            if v_bond_rate_type = 3 then

                /* set @利息成本金额# = 0; */
                set v_intrst_cost_amt = 0;
            else

                /* set @利息成本金额# = round(@债券计提利息# * @成交数量#,2); */
                set v_intrst_cost_amt = round(v_bond_accr_intrst * v_strike_qty,2);
            end if;

            /* set @成本金额# = @变动金额# - @利息成本金额#; */
            set v_cost_amt = v_occur_amt - v_intrst_cost_amt;

            /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{当前数量}+{待交收数量},{成本金额},{利息成本金额}][@临时_当前数量#,@临时_成本金额#,@临时_利息成本金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
            select curr_qty+pre_settle_qty,cost_amt,intrst_cost_amt into v_tmp_curr_qty,v_tmp_cost_amt,v_tmp_intrst_cost_amt from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;

            if FOUND_ROWS() = 0 then

                /* set @临时_当前数量# = 0; */
                set v_tmp_curr_qty = 0;

                /* set @临时_成本金额# = 0; */
                set v_tmp_cost_amt = 0;

                /* set @临时_利息成本金额# = 0; */
                set v_tmp_intrst_cost_amt = 0;
            end if;
            #如果是债券，则需要根据净价标准，计算利息成本金额和利息收益

            /* if @临时_当前数量#=0 then */
            if v_tmp_curr_qty=0 then

                /* set @交易组成本金额# = 0; */
                set v_exgp_cost_amt = 0;

                /* set @交易组利息成本金额# = 0; */
                set v_exgp_intrst_cost_amt = 0;
            else

                /* set @交易组成本金额# = -round((@成交数量#/@临时_当前数量# * @临时_成本金额#),2); */
                set v_exgp_cost_amt = -round((v_strike_qty/v_tmp_curr_qty * v_tmp_cost_amt),2);

                /* set @交易组利息成本金额# = -round((@成交数量#/@临时_当前数量# * @临时_利息成本金额#),2); */
                set v_exgp_intrst_cost_amt = -round((v_strike_qty/v_tmp_curr_qty * v_tmp_intrst_cost_amt),2);
            end if;

            /* if @成本计算方式# = 《成本计算方式-盈亏冲减成本》 then */
            if v_cost_calc_type = 1 then

                /* set @交易组成本金额# = -1 * @成本金额#; */
                set v_exgp_cost_amt = -1 * v_cost_amt;

                /* set @交易组利息成本金额# = -1 * @利息成本金额#; */
                set v_exgp_intrst_cost_amt = -1 * v_intrst_cost_amt;

                /* set @交易组实现盈亏# = 0; */
                set v_exgp_realize_pandl = 0;

                /* set @交易组利息收益# = 0; */
                set v_exgp_intrst_pandl = 0;
            else
                #本次盈亏金额为本次清算金额+本次成本金额(卖出为负值)

                /* set @交易组实现盈亏# = @成本金额# + @交易组成本金额#; */
                set v_exgp_realize_pandl = v_cost_amt + v_exgp_cost_amt;

                /* set @交易组利息收益# = @利息成本金额# + @交易组利息成本金额#; */
                set v_exgp_intrst_pandl = v_intrst_cost_amt + v_exgp_intrst_cost_amt;
            end if;

            /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][{当前数量}+{待交收数量},{成本金额},{利息成本金额}][@临时_当前数量#,@临时_成本金额#,@临时_利息成本金额#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
            select curr_qty+pre_settle_qty,cost_amt,intrst_cost_amt into v_tmp_curr_qty,v_tmp_cost_amt,v_tmp_intrst_cost_amt from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;

            if FOUND_ROWS() = 0 then

                /* set @临时_当前数量# = 0; */
                set v_tmp_curr_qty = 0;

                /* set @临时_成本金额# = 0; */
                set v_tmp_cost_amt = 0;

                /* set @临时_利息成本金额# = 0; */
                set v_tmp_intrst_cost_amt = 0;
            end if;
            #如果是债券，则需要根据净价标准，计算利息成本金额和利息收益

            /* if @临时_当前数量#=0 then */
            if v_tmp_curr_qty=0 then

                /* set @资产账户成本金额# = 0; */
                set v_asac_cost_amt = 0;

                /* set @资产账户利息成本金额# = 0; */
                set v_asac_intrst_cost_amt = 0;
            else

                /* set @资产账户成本金额# = -round((@成交数量#/@临时_当前数量# * @临时_成本金额#),2); */
                set v_asac_cost_amt = -round((v_strike_qty/v_tmp_curr_qty * v_tmp_cost_amt),2);

                /* set @资产账户利息成本金额# = -round((@成交数量#/@临时_当前数量# * @临时_利息成本金额#),2); */
                set v_asac_intrst_cost_amt = -round((v_strike_qty/v_tmp_curr_qty * v_tmp_intrst_cost_amt),2);
            end if;

            /* if @成本计算方式# = 《成本计算方式-盈亏冲减成本》 then */
            if v_cost_calc_type = 1 then

                /* set @资产账户成本金额# = -1 * @成本金额#; */
                set v_asac_cost_amt = -1 * v_cost_amt;

                /* set @资产账户利息成本金额# = -1 * @利息成本金额#; */
                set v_asac_intrst_cost_amt = -1 * v_intrst_cost_amt;

                /* set @资产账户实现盈亏# = 0; */
                set v_asac_realize_pandl = 0;

                /* set @资产账户利息收益# = 0; */
                set v_asac_intrst_pandl = 0;
            else
                #本次盈亏金额为本次清算金额+本次成本金额(卖出为负值)

                /* set @资产账户实现盈亏# = @成本金额# + @资产账户成本金额#; */
                set v_asac_realize_pandl = v_cost_amt + v_asac_cost_amt;

                /* set @资产账户利息收益# = @利息成本金额# + @资产账户利息成本金额#; */
                set v_asac_intrst_pandl = v_intrst_cost_amt + v_asac_intrst_cost_amt;
            end if;
        end if;

    /* elseif @业务标志# = 《业务标志-债券融资回购》 or @业务标志# = 《业务标志-债券融券回购》 or @业务标志# = 《业务标志-债券质押》 or @业务标志# = 《业务标志-债券转回质押》 then */
    elseif v_busi_flag = 2004001 or v_busi_flag = 2004002 or v_busi_flag = 2002003 or v_busi_flag = 2002004 then

        /* set @交易组成本金额# = 0; */
        set v_exgp_cost_amt = 0;

        /* set @交易组实现盈亏# = 0; */
        set v_exgp_realize_pandl = 0;

        /* set @交易组利息成本金额# = 0; */
        set v_exgp_intrst_cost_amt = 0;

        /* set @交易组利息收益# = 0; */
        set v_exgp_intrst_pandl = 0;

        /* set @资产账户成本金额# = 0; */
        set v_asac_cost_amt = 0;

        /* set @资产账户实现盈亏# = 0; */
        set v_asac_realize_pandl = 0;

        /* set @资产账户利息成本金额# = 0; */
        set v_asac_intrst_cost_amt = 0;

        /* set @资产账户利息收益# = 0; */
        set v_asac_intrst_pandl = 0;

    /* elseif @业务标志# = 《业务标志-红利入账》 then */
    elseif v_busi_flag = 2001007 then

        /* if @红利入账成本盈亏计算方式# = 《红利入账成本盈亏计算方式-入盈亏》 then */
        if v_intrst_entry_type = 1 then

            /* set @实现盈亏# = @变动金额#; */
            set v_realize_pandl = v_occur_amt;

            /* if @证券类型# > 20 and @证券类型# < 50 then */
            if v_stock_type > 20 and v_stock_type < 50 then

                /* set @利息收益# = @变动金额#; */
                set v_intrst_pandl = v_occur_amt;
            end if;
        else

            /* set @成本金额# = -@变动金额#; */
            set v_cost_amt = -v_occur_amt;

            /* if @证券类型# > 20 and @证券类型# < 50 then */
            if v_stock_type > 20 and v_stock_type < 50 then

                /* set @利息成本金额# = -@变动金额#; */
                set v_intrst_cost_amt = -v_occur_amt;
            end if;
        end if;

    /* elseif @业务标志# = 《业务标志-红股入账》 then */
    elseif v_busi_flag = 2001008 then

        /* set @成本金额# = 0; */
        set v_cost_amt = 0;

    /* elseif @业务标志# = 《业务标志-债券付息》 or @业务标志# = 《业务标志-债券兑付》 then */
    elseif v_busi_flag = 2002010 or v_busi_flag = 2002009 then
        #此处不考虑利息成本金额，否则计算后需要更新持仓表的利息成本金额，以免事务失败后的回滚处理不正确。
        #后续的处理中，如果利息收益是按冲减成本的方式处理，则在后续的入账过程中再做冲减处理

        /* set @利息收益# = @债券计提利息#; */
        set v_intrst_pandl = v_bond_accr_intrst;

        /* set @实现盈亏# = @债券计提利息#; */
        set v_realize_pandl = v_bond_accr_intrst;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_获取资产账户持仓入账流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_GetAsacPosiEntryJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_GetAsacPosiEntryJour(
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
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_target_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_busi_flag int,
    OUT p_occur_qty decimal(18,2),
    OUT p_cost_amt decimal(18,4),
    OUT p_intrst_cost_amt decimal(18,4),
    OUT p_realize_pandl decimal(18,4),
    OUT p_intrst_pandl decimal(18,4),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_arrive_date int
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_busi_flag int;
    declare v_occur_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_arrive_date int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_begin_trade_date int;
    declare v_old_arrive_date int;
    declare v_order_no int;
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
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_busi_flag = 0;
    SET v_occur_qty = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_pandl = 0;
    SET v_impawn_ratio = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_old_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_order_no = 0;
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_持仓_资产账户持仓入账流水表][字段][字段变量][{记录序号}=@入账资产账户持仓流水号#][4][@入账资产账户持仓流水号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, target_code_no, stock_type, 
        asset_type, busi_flag, occur_qty, cost_amt, 
        intrst_cost_amt, realize_pandl, intrst_pandl, impawn_ratio, 
        begin_trade_date, old_arrive_date, arrive_date, order_no, 
        entry_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_target_code_no, v_stock_type, 
        v_asset_type, v_busi_flag, v_occur_qty, v_cost_amt, 
        v_intrst_cost_amt, v_realize_pandl, v_intrst_pandl, v_impawn_ratio, 
        v_begin_trade_date, v_old_arrive_date, v_arrive_date, v_order_no, 
        v_entry_status from db_pdsecu.tb_pdsepo_asac_posi_entry_jour where row_id=v_entry_asac_posi_jour_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.5.72.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("入账资产账户持仓流水号=",v_entry_asac_posi_jour_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("入账资产账户持仓流水号=",v_entry_asac_posi_jour_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_资产账户持仓入账流水表][{入账状态}=《入账状态-已回滚》][{记录序号}=@入账资产账户持仓流水号#][2][@入账资产账户持仓流水号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="3" where row_id=v_entry_asac_posi_jour_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.72.2";
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
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_busi_flag = v_busi_flag;
    SET p_occur_qty = v_occur_qty;
    SET p_cost_amt = v_cost_amt;
    SET p_intrst_cost_amt = v_intrst_cost_amt;
    SET p_realize_pandl = v_realize_pandl;
    SET p_intrst_pandl = v_intrst_pandl;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_arrive_date = v_arrive_date;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_获取交易组持仓入账流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_GetExgpPosiEntryJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_GetExgpPosiEntryJour(
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
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_target_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_busi_flag int,
    OUT p_occur_qty decimal(18,2),
    OUT p_cost_amt decimal(18,4),
    OUT p_intrst_cost_amt decimal(18,4),
    OUT p_realize_pandl decimal(18,4),
    OUT p_intrst_pandl decimal(18,4),
    OUT p_impawn_qty decimal(18,2),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_arrive_date int
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_busi_flag int;
    declare v_occur_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_impawn_qty decimal(18,2);
    declare v_impawn_ratio decimal(18,12);
    declare v_arrive_date int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_begin_trade_date int;
    declare v_old_arrive_date int;
    declare v_order_no int;
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
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_busi_flag = 0;
    SET v_occur_qty = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_pandl = 0;
    SET v_impawn_qty = 0;
    SET v_impawn_ratio = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_old_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_order_no = 0;
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_持仓_交易组持仓入账流水表][字段][字段变量][{记录序号}=@入账交易组持仓流水号#][4][@入账交易组持仓流水号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, target_code_no, 
        stock_type, asset_type, busi_flag, occur_qty, 
        cost_amt, intrst_cost_amt, realize_pandl, intrst_pandl, 
        impawn_qty, impawn_ratio, begin_trade_date, old_arrive_date, 
        arrive_date, order_no, entry_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_target_code_no, 
        v_stock_type, v_asset_type, v_busi_flag, v_occur_qty, 
        v_cost_amt, v_intrst_cost_amt, v_realize_pandl, v_intrst_pandl, 
        v_impawn_qty, v_impawn_ratio, v_begin_trade_date, v_old_arrive_date, 
        v_arrive_date, v_order_no, v_entry_status from db_pdsecu.tb_pdsepo_exgp_posi_entry_jour where row_id=v_entry_exgp_posi_jour_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.5.72.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("入账交易组持仓流水号=",v_entry_exgp_posi_jour_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("入账交易组持仓流水号=",v_entry_exgp_posi_jour_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_交易组持仓入账流水表][{入账状态}=《入账状态-已回滚》][{记录序号}=@入账交易组持仓流水号#][2][@入账交易组持仓流水号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="3" where row_id=v_entry_exgp_posi_jour_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.72.2";
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
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_busi_flag = v_busi_flag;
    SET p_occur_qty = v_occur_qty;
    SET p_cost_amt = v_cost_amt;
    SET p_intrst_cost_amt = v_intrst_cost_amt;
    SET p_realize_pandl = v_realize_pandl;
    SET p_intrst_pandl = v_intrst_pandl;
    SET p_impawn_qty = v_impawn_qty;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_arrive_date = v_arrive_date;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_交易组持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_PdExchGroupSecuPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_PdExchGroupSecuPosiRecorded(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_arrive_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_target_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_occur_qty decimal(18,2),
    IN p_cost_amt decimal(18,4),
    IN p_realize_pandl decimal(18,4),
    IN p_intrst_cost_amt decimal(18,4),
    IN p_intrst_pandl decimal(18,4),
    IN p_impawn_ratio decimal(18,12),
    IN p_busi_flag int,
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
    declare v_arrive_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_occur_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_menu_no int;
    declare v_occur_end_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_invest_type int;
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_oper_func_code varchar(16);
    declare v_begin_qty decimal(18,2);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_put_impawn_qty decimal(18,2);
    declare v_get_impawn_qty decimal(18,2);

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
    SET v_arrive_date = p_arrive_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_occur_qty = p_occur_qty;
    SET v_cost_amt = p_cost_amt;
    SET v_realize_pandl = p_realize_pandl;
    SET v_intrst_cost_amt = p_intrst_cost_amt;
    SET v_intrst_pandl = p_intrst_pandl;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_menu_no = 0;
    SET v_occur_end_qty = 0;
    SET v_oper_remark_info = " ";
    SET v_invest_type = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_curr_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_oper_func_code = " ";
    SET v_begin_qty = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_put_impawn_qty = 0;
    SET v_get_impawn_qty = 0;

    
    label_pro:BEGIN
    

    /* set @操作菜单# =0; */
    set v_oper_menu_no =0;

    /* set @变动后数量# = 0; */
    set v_occur_end_qty = 0;

    /* set @操作备注# = @备注信息#; */
    set v_oper_remark_info = v_remark_info;

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @冻结数量# =0; */
    set v_frozen_qty =0;

    /* set @解冻数量# =0; */
    set v_unfroz_qty =0;

    /* set @持仓核对差额#=0; */
    set v_posi_qty_check_diff=0;

    /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 or @市场编号# = 《市场编号-场外交易市场》 then */
    if v_exch_no = 1 or v_exch_no = 2 or v_exch_no = 5 then

        /* set @当前数量# = @变动数量#; */
        set v_curr_qty = v_occur_qty;

        /* set @待交收数量# = 0; */
        set v_pre_settle_qty = 0;

        /* if @业务标志# = 《业务标志-债券融券回购》 then */
        if v_busi_flag = 2004002 then

            /* set @冻结数量# = @变动数量#; */
            set v_frozen_qty = v_occur_qty;

        /* elseif @业务标志# = 《业务标志-债券质押》  then */
        elseif v_busi_flag = 2002003  then

            /* set @当前数量# = 0; */
            set v_curr_qty = 0;

            /* set @冻结数量# = -1 * @变动数量#; */
            set v_frozen_qty = -1 * v_occur_qty;

            /* set @解冻数量# = 0; */
            set v_unfroz_qty = 0;

        /* elseif @业务标志# = 《业务标志-债券转回质押》 then */
        elseif v_busi_flag = 2002004 then

            /* set @当前数量# = 0; */
            set v_curr_qty = 0;

            /* set @冻结数量# = -1 * @变动数量#; */
            set v_frozen_qty = -1 * v_occur_qty;

            /* set @解冻数量# = 0; */
            set v_unfroz_qty = 0;

        /* elseif @业务标志#=《业务标志-红股登记》 or @业务标志#=《业务标志-公司行为配股》  then */
        elseif v_busi_flag=2001014 or v_busi_flag=2001028  then

            /* set @冻结数量#=@变动数量#; */
            set v_frozen_qty=v_occur_qty;

        /* elseif (@业务标志#=《业务标志-基金申购》 or @业务标志#=《业务标志-基金赎回》 or @业务标志#=《业务标志-基金转换》) and @到账日期#<>@初始化日期#  then */
        elseif (v_busi_flag=2006001 or v_busi_flag=2006002 or v_busi_flag=2006003) and v_arrive_date<>v_init_date  then

            /* set @当前数量#=0; */
            set v_curr_qty=0;

            /* set @冻结数量#=@变动数量#; */
            set v_frozen_qty=v_occur_qty;
        end if;
    else

        /* set @当前数量# = 0; */
        set v_curr_qty = 0;

        /* set @待交收数量# = @变动数量#; */
        set v_pre_settle_qty = v_occur_qty;
    end if;

    /* set @操作功能# =@功能编码#; */
    set v_oper_func_code =v_func_code;
    #用于插入表记录时初值，更新时无用。

    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* [获取流水变动][{当前数量}, {待交收数量}, {冻结数量}, {解冻数量}, {成本金额}, {实现盈亏}, {利息成本金额}, {利息收益}][@当前数量#, @待交收数量#, @冻结数量#, @解冻数量#, @成本金额#, @实现盈亏#, @利息成本金额#, @利息收益#] */
    set v_jour_occur_field = concat("当前数量","|"," 待交收数量","|"," 冻结数量","|"," 解冻数量","|"," 成本金额","|"," 实现盈亏","|"," 利息成本金额","|"," 利息收益","|");
    set v_jour_occur_info = concat(v_curr_qty,"|", v_pre_settle_qty,"|", v_frozen_qty,"|", v_unfroz_qty,"|", v_cost_amt,"|", v_realize_pandl,"|", v_intrst_cost_amt,"|", v_intrst_pandl,"|");

    #处理交易组持仓入账
    #持仓记录不存在，则插入，否则更新

    /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{当前数量} = {当前数量} + @当前数量#,{待交收数量} = {待交收数量} + @待交收数量#, {冻结数量} = {冻结数量} + @冻结数量#, {解冻数量} = {解冻数量} + @解冻数量#, {成本金额} = {成本金额} + @成本金额#, {实现盈亏} = {实现盈亏} + @实现盈亏#, {利息成本金额} = {利息成本金额} + @利息成本金额#, {利息收益} = {利息收益} + @利息收益#][1][@交易组编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_exgp_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, invest_type, 
        begin_qty, curr_qty, pre_settle_qty, frozen_qty, 
        unfroz_qty, posi_qty_check_diff, cost_amt, realize_pandl, 
        intrst_cost_amt, intrst_pandl) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_type, v_asset_type, v_invest_type, 
        v_begin_qty, v_curr_qty, v_pre_settle_qty, v_frozen_qty, 
        v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, 
        v_intrst_cost_amt, v_intrst_pandl) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = curr_qty + v_curr_qty,pre_settle_qty = pre_settle_qty + v_pre_settle_qty, frozen_qty = frozen_qty + v_frozen_qty, unfroz_qty = unfroz_qty + v_unfroz_qty, cost_amt = cost_amt + v_cost_amt, realize_pandl = realize_pandl + v_realize_pandl, intrst_cost_amt = intrst_cost_amt + v_intrst_cost_amt, intrst_pandl = intrst_pandl + v_intrst_pandl;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.73.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量}, {待交收数量}, {冻结数量}, {解冻数量}, {成本金额}, {实现盈亏}, {利息成本金额}, {利息收益}][@当前数量#, @待交收数量#, @冻结数量#, @解冻数量#, @成本金额#, @实现盈亏#, @利息成本金额#, @利息收益#][{交易组编号} = @交易组编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select curr_qty, pre_settle_qty, frozen_qty, unfroz_qty, cost_amt, realize_pandl, intrst_cost_amt, intrst_pandl into v_curr_qty, v_pre_settle_qty, v_frozen_qty, v_unfroz_qty, v_cost_amt, v_realize_pandl, v_intrst_cost_amt, v_intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.5.73.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 or @市场编号# = 《市场编号-场外交易市场》 then */
    if v_exch_no = 1 or v_exch_no = 2 or v_exch_no = 5 then

        /* if @业务标志# = 《业务标志-债券质押》 or @业务标志# = 《业务标志-债券转回质押》 or ((@业务标志#=《业务标志-基金申购》 or @业务标志#=《业务标志-基金赎回》 or @业务标志#=《业务标志-基金转换》) and @到账日期#<>@初始化日期#) then */
        if v_busi_flag = 2002003 or v_busi_flag = 2002004 or ((v_busi_flag=2006001 or v_busi_flag=2006002 or v_busi_flag=2006003) and v_arrive_date<>v_init_date) then

            /* set @变动后数量# = @冻结数量#; */
            set v_occur_end_qty = v_frozen_qty;
        else

            /* set @变动后数量# = @当前数量#; */
            set v_occur_end_qty = v_curr_qty;
        end if;
    else

        /* set @变动后数量# = @待交收数量#; */
        set v_occur_end_qty = v_pre_settle_qty;
    end if;

    /* [获取流水后信息][@当前数量#, @待交收数量#, @冻结数量#, @解冻数量#, @成本金额#, @实现盈亏#, @利息成本金额#, @利息收益#] */
    set v_jour_after_occur_info = concat(v_curr_qty,"|", v_pre_settle_qty,"|", v_frozen_qty,"|", v_unfroz_qty,"|", v_cost_amt,"|", v_realize_pandl,"|", v_intrst_cost_amt,"|", v_intrst_pandl,"|");


    /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#, @股东代码编号#, @证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_exgp_posi_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
        invest_type) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_busi_flag, v_occur_qty, 
        v_occur_end_qty, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, 
        v_invest_type);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.73.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* if @业务标志# = 《业务标志-债券质押》 or @业务标志# = 《业务标志-债券转回质押》 then */
    if v_busi_flag = 2002003 or v_busi_flag = 2002004 then

        /* set @当前数量# = -1 * @变动数量#; */
        set v_curr_qty = -1 * v_occur_qty;

        /* set @提交质押数量# = if(@业务标志#=《业务标志-债券质押》,@当前数量#,0); */
        set v_put_impawn_qty = if(v_busi_flag=2002003,v_curr_qty,0);

        /* set @转回质押数量# = if(@业务标志#=《业务标志-债券转回质押》,-1 * @当前数量#,0); */
        set v_get_impawn_qty = if(v_busi_flag=2002004,-1 * v_curr_qty,0);

        /* [插入重复更新][产品证券_持仓_交易组债券质押表][字段][字段变量][{当前数量}={当前数量}+@当前数量#,{提交质押数量}={提交质押数量}+@提交质押数量#,{转回质押数量}={转回质押数量}+@转回质押数量#][1][@机构编号#,@产品编号#,{资产账户编号},@交易组编号#,{股东代码编号},{证券代码编号}] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsepo_exgp_bond_pledge (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
            stock_code_no, begin_qty, curr_qty, put_impawn_qty, 
            get_impawn_qty) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
            v_stock_code_no, v_begin_qty, v_curr_qty, v_put_impawn_qty, 
            v_get_impawn_qty) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=curr_qty+v_curr_qty,put_impawn_qty=put_impawn_qty+v_put_impawn_qty,get_impawn_qty=get_impawn_qty+v_get_impawn_qty;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.5.73.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",",asset_acco_no,",","交易组编号=",v_exch_group_no,",",stock_acco_no,",",stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",",asset_acco_no,",","交易组编号=",v_exch_group_no,",",stock_acco_no,",",stock_code_no);
            end if;
            leave label_pro;
        end if;


        /* set @证券代码编号# = @标的代码编号#; */
        set v_stock_code_no = v_target_code_no;

        /* set @当前数量# = 0; */
        set v_curr_qty = 0;

        /* set @待交收数量# = 0; */
        set v_pre_settle_qty = 0;

        /* set @冻结数量# = 0; */
        set v_frozen_qty = 0;

        /* set @成本金额# = 0; */
        set v_cost_amt = 0;

        /* set @实现盈亏# = 0; */
        set v_realize_pandl = 0;

        /* set @利息成本金额# = 0; */
        set v_intrst_cost_amt = 0;

        /* set @利息收益# = 0; */
        set v_intrst_pandl = 0;

        /* if @业务标志# = 《业务标志-债券质押》 then */
        if v_busi_flag = 2002003 then

            /* set @解冻数量# = -1 * @变动数量# * @质押比例#; */
            set v_unfroz_qty = -1 * v_occur_qty * v_impawn_ratio;
        else

            /* set @解冻数量# = -1 * @变动数量# * @质押比例#; */
            set v_unfroz_qty = -1 * v_occur_qty * v_impawn_ratio;
        end if;

        /* set @变动数量# = @解冻数量#; */
        set v_occur_qty = v_unfroz_qty;

        /* [获取流水变动][{当前数量}, {解冻数量}][@当前数量#, @解冻数量#] */
        set v_jour_occur_field = concat("当前数量","|"," 解冻数量","|");
        set v_jour_occur_info = concat(v_curr_qty,"|", v_unfroz_qty,"|");


        /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{当前数量} = {当前数量} + @当前数量#, {解冻数量} = {解冻数量} + @解冻数量#][1][@交易组编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsepo_exgp_posi (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
            stock_code_no, stock_type, asset_type, invest_type, 
            begin_qty, curr_qty, pre_settle_qty, frozen_qty, 
            unfroz_qty, posi_qty_check_diff, cost_amt, realize_pandl, 
            intrst_cost_amt, intrst_pandl) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
            v_stock_code_no, v_stock_type, v_asset_type, v_invest_type, 
            v_begin_qty, v_curr_qty, v_pre_settle_qty, v_frozen_qty, 
            v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, 
            v_intrst_cost_amt, v_intrst_pandl) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = curr_qty + v_curr_qty, unfroz_qty = unfroz_qty + v_unfroz_qty;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.5.73.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量}, {解冻数量}][@当前数量#, @解冻数量#][{交易组编号} = @交易组编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
        select curr_qty, unfroz_qty into v_curr_qty, v_unfroz_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.5.73.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
            end if;
            leave label_pro;
        end if;


        /* set @变动后数量# = @解冻数量#; */
        set v_occur_end_qty = v_unfroz_qty;

        /* [获取流水后信息][@当前数量#, @解冻数量#] */
        set v_jour_after_occur_info = concat(v_curr_qty,"|", v_unfroz_qty,"|");


        /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#, @股东代码编号#, @证券代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsepo_exgp_posi_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, exch_no, 
            stock_acco_no, stock_code_no, busi_flag, occur_qty, 
            occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
            invest_type) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
            v_stock_acco_no, v_stock_code_no, v_busi_flag, v_occur_qty, 
            v_occur_end_qty, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, 
            v_invest_type);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.5.73.5";
            SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_资产账户持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_PdAssetAccoSecuPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_PdAssetAccoSecuPosiRecorded(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_arrive_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_target_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_occur_qty decimal(18,2),
    IN p_cost_amt decimal(18,4),
    IN p_realize_pandl decimal(18,4),
    IN p_intrst_cost_amt decimal(18,4),
    IN p_intrst_pandl decimal(18,4),
    IN p_impawn_ratio decimal(18,12),
    IN p_busi_flag int,
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
    declare v_arrive_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_occur_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_menu_no int;
    declare v_occur_end_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_invest_type int;
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_oper_func_code varchar(16);
    declare v_entry_posi_jour_no bigint;
    declare v_begin_qty decimal(18,2);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_put_impawn_qty decimal(18,2);
    declare v_get_impawn_qty decimal(18,2);

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
    SET v_arrive_date = p_arrive_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_occur_qty = p_occur_qty;
    SET v_cost_amt = p_cost_amt;
    SET v_realize_pandl = p_realize_pandl;
    SET v_intrst_cost_amt = p_intrst_cost_amt;
    SET v_intrst_pandl = p_intrst_pandl;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_menu_no = 0;
    SET v_occur_end_qty = 0;
    SET v_oper_remark_info = " ";
    SET v_invest_type = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_curr_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_oper_func_code = " ";
    SET v_entry_posi_jour_no = 0;
    SET v_begin_qty = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_put_impawn_qty = 0;
    SET v_get_impawn_qty = 0;

    
    label_pro:BEGIN
    

    /* set @操作菜单# =0; */
    set v_oper_menu_no =0;

    /* set @变动后数量# = 0; */
    set v_occur_end_qty = 0;

    /* set @操作备注# = @备注信息#; */
    set v_oper_remark_info = v_remark_info;

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @冻结数量# =0; */
    set v_frozen_qty =0;

    /* set @解冻数量# =0; */
    set v_unfroz_qty =0;

    /* set @持仓核对差额#=0; */
    set v_posi_qty_check_diff=0;

    /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 or @市场编号# = 《市场编号-场外交易市场》 then */
    if v_exch_no = 1 or v_exch_no = 2 or v_exch_no = 5 then

        /* set @当前数量# = @变动数量#; */
        set v_curr_qty = v_occur_qty;

        /* set @待交收数量# = 0; */
        set v_pre_settle_qty = 0;

        /* if @业务标志#=《业务标志-债券融券回购》 then */
        if v_busi_flag=2004002 then

            /* set @冻结数量# = @变动数量#; */
            set v_frozen_qty = v_occur_qty;

        /* elseif @业务标志# = 《业务标志-债券质押》  then */
        elseif v_busi_flag = 2002003  then

            /* set @当前数量# = 0; */
            set v_curr_qty = 0;

            /* set @冻结数量# = -1 * @变动数量#; */
            set v_frozen_qty = -1 * v_occur_qty;

            /* set @解冻数量# = 0; */
            set v_unfroz_qty = 0;

        /* elseif @业务标志# = 《业务标志-债券转回质押》 then */
        elseif v_busi_flag = 2002004 then

            /* set @当前数量# = 0; */
            set v_curr_qty = 0;

            /* set @冻结数量# = -1 * @变动数量#; */
            set v_frozen_qty = -1 * v_occur_qty;

            /* set @解冻数量# = 0; */
            set v_unfroz_qty = 0;
        #红股更新冻结数量

        /* elseif @业务标志#=《业务标志-红股登记》  or @业务标志#=《业务标志-公司行为配股》 then */
        elseif v_busi_flag=2001014  or v_busi_flag=2001028 then

            /* set @冻结数量#=@变动数量#; */
            set v_frozen_qty=v_occur_qty;

        /* elseif (@业务标志#=《业务标志-基金申购》 or @业务标志#=《业务标志-基金赎回》 or @业务标志#=《业务标志-基金转换》) and @到账日期#<>@初始化日期#  then */
        elseif (v_busi_flag=2006001 or v_busi_flag=2006002 or v_busi_flag=2006003) and v_arrive_date<>v_init_date  then

            /* set @当前数量#=0; */
            set v_curr_qty=0;

            /* set @冻结数量#=@变动数量#; */
            set v_frozen_qty=v_occur_qty;
        end if;
    else

        /* set @当前数量# = 0; */
        set v_curr_qty = 0;

        /* set @待交收数量# = @变动数量#; */
        set v_pre_settle_qty = v_occur_qty;
    end if;

    /* set @操作功能# =@功能编码#; */
    set v_oper_func_code =v_func_code;

    /* set @入账持仓流水号#= 0; */
    set v_entry_posi_jour_no= 0;
    #用于插入表记录时初值，更新时无用。

    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* [获取流水变动][{当前数量}, {待交收数量}, {冻结数量}, {解冻数量}, {成本金额}, {实现盈亏}, {利息成本金额}, {利息收益}][@当前数量#, @待交收数量#, @冻结数量#, @解冻数量#, @成本金额#, @实现盈亏#, @利息成本金额#, @利息收益#] */
    set v_jour_occur_field = concat("当前数量","|"," 待交收数量","|"," 冻结数量","|"," 解冻数量","|"," 成本金额","|"," 实现盈亏","|"," 利息成本金额","|"," 利息收益","|");
    set v_jour_occur_info = concat(v_curr_qty,"|", v_pre_settle_qty,"|", v_frozen_qty,"|", v_unfroz_qty,"|", v_cost_amt,"|", v_realize_pandl,"|", v_intrst_cost_amt,"|", v_intrst_pandl,"|");

    #处理资产账户持仓入账
    #持仓记录不存在，则插入，否则更新

    /* [插入重复更新][产品证券_持仓_资产账户持仓表][字段][字段变量][{当前数量} = {当前数量} + @当前数量#, {待交收数量} = {待交收数量} + @待交收数量#, {冻结数量} = {冻结数量} + @冻结数量#, {解冻数量} = {解冻数量} + @解冻数量#, {成本金额} = {成本金额} + @成本金额#, {实现盈亏} = {实现盈亏} + @实现盈亏#, {利息成本金额} = {利息成本金额} + @利息成本金额#, {利息收益} = {利息收益} + @利息收益#][1][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_asac_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        stock_type, asset_type, invest_type, begin_qty, 
        curr_qty, pre_settle_qty, frozen_qty, unfroz_qty, 
        posi_qty_check_diff, cost_amt, realize_pandl, intrst_cost_amt, 
        intrst_pandl) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
        v_stock_type, v_asset_type, v_invest_type, v_begin_qty, 
        v_curr_qty, v_pre_settle_qty, v_frozen_qty, v_unfroz_qty, 
        v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, v_intrst_cost_amt, 
        v_intrst_pandl) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = curr_qty + v_curr_qty, pre_settle_qty = pre_settle_qty + v_pre_settle_qty, frozen_qty = frozen_qty + v_frozen_qty, unfroz_qty = unfroz_qty + v_unfroz_qty, cost_amt = cost_amt + v_cost_amt, realize_pandl = realize_pandl + v_realize_pandl, intrst_cost_amt = intrst_cost_amt + v_intrst_cost_amt, intrst_pandl = intrst_pandl + v_intrst_pandl;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.74.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{当前数量}, {待交收数量}, {冻结数量}, {解冻数量}, {成本金额}, {实现盈亏}, {利息成本金额}, {利息收益}][@当前数量#, @待交收数量#, @冻结数量#, @解冻数量#, @成本金额#, @实现盈亏#, @利息成本金额#, @利息收益#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select curr_qty, pre_settle_qty, frozen_qty, unfroz_qty, cost_amt, realize_pandl, intrst_cost_amt, intrst_pandl into v_curr_qty, v_pre_settle_qty, v_frozen_qty, v_unfroz_qty, v_cost_amt, v_realize_pandl, v_intrst_cost_amt, v_intrst_pandl from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.5.74.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 or @市场编号# = 《市场编号-场外交易市场》 then */
    if v_exch_no = 1 or v_exch_no = 2 or v_exch_no = 5 then

        /* if @业务标志# = 《业务标志-债券质押》 or @业务标志# = 《业务标志-债券转回质押》 or ((@业务标志#=《业务标志-基金申购》 or @业务标志#=《业务标志-基金赎回》 or @业务标志#=《业务标志-基金转换》) and @到账日期#<>@初始化日期#) then */
        if v_busi_flag = 2002003 or v_busi_flag = 2002004 or ((v_busi_flag=2006001 or v_busi_flag=2006002 or v_busi_flag=2006003) and v_arrive_date<>v_init_date) then

            /* set @变动后数量# = @冻结数量#; */
            set v_occur_end_qty = v_frozen_qty;
        else

            /* set @变动后数量# = @当前数量#; */
            set v_occur_end_qty = v_curr_qty;
        end if;
    else

        /* set @变动后数量# = @待交收数量#; */
        set v_occur_end_qty = v_pre_settle_qty;
    end if;

    /* [获取流水后信息][@当前数量#, @待交收数量#, @冻结数量#, @解冻数量#, @成本金额#, @实现盈亏#, @利息成本金额#, @利息收益#] */
    set v_jour_after_occur_info = concat(v_curr_qty,"|", v_pre_settle_qty,"|", v_frozen_qty,"|", v_unfroz_qty,"|", v_cost_amt,"|", v_realize_pandl,"|", v_intrst_cost_amt,"|", v_intrst_pandl,"|");


    /* [插入表记录][产品证券_持仓_资产账户持仓流水表][字段][字段变量][5][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_asac_posi_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, busi_flag, occur_qty, occur_end_qty, 
        jour_occur_field, jour_after_occur_info, oper_remark_info, invest_type) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_busi_flag, v_occur_qty, v_occur_end_qty, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, v_invest_type);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.74.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* if @业务标志# = 《业务标志-债券质押》 or @业务标志# = 《业务标志-债券转回质押》 then */
    if v_busi_flag = 2002003 or v_busi_flag = 2002004 then

        /* set @当前数量# = -1 * @变动数量#; */
        set v_curr_qty = -1 * v_occur_qty;

        /* set @提交质押数量# = if(@业务标志#=《业务标志-债券质押》,@当前数量#,0); */
        set v_put_impawn_qty = if(v_busi_flag=2002003,v_curr_qty,0);

        /* set @转回质押数量# = if(@业务标志#=《业务标志-债券转回质押》,-1 * @当前数量#,0); */
        set v_get_impawn_qty = if(v_busi_flag=2002004,-1 * v_curr_qty,0);

        /* [插入重复更新][产品证券_持仓_资产账户债券质押表][字段][字段变量][{当前数量}={当前数量}+@当前数量#,{提交质押数量}={提交质押数量}+@提交质押数量#,{转回质押数量}={转回质押数量}+@转回质押数量#][1][@机构编号#,@产品编号#,{资产账户编号},{股东代码编号},{证券代码编号}] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsepo_asac_bond_pledge (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
            begin_qty, curr_qty, put_impawn_qty, get_impawn_qty) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
            v_begin_qty, v_curr_qty, v_put_impawn_qty, v_get_impawn_qty) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=curr_qty+v_curr_qty,put_impawn_qty=put_impawn_qty+v_put_impawn_qty,get_impawn_qty=get_impawn_qty+v_get_impawn_qty;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.5.74.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",",asset_acco_no,",",stock_acco_no,",",stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",",asset_acco_no,",",stock_acco_no,",",stock_code_no);
            end if;
            leave label_pro;
        end if;


        /* set @证券代码编号# = @标的代码编号#; */
        set v_stock_code_no = v_target_code_no;

        /* set @当前数量# = 0; */
        set v_curr_qty = 0;

        /* set @待交收数量# = 0; */
        set v_pre_settle_qty = 0;

        /* set @冻结数量# = 0; */
        set v_frozen_qty = 0;

        /* set @成本金额# = 0; */
        set v_cost_amt = 0;

        /* set @实现盈亏# = 0; */
        set v_realize_pandl = 0;

        /* set @利息成本金额# = 0; */
        set v_intrst_cost_amt = 0;

        /* set @利息收益# = 0; */
        set v_intrst_pandl = 0;

        /* if @业务标志# = 《业务标志-债券质押》 then */
        if v_busi_flag = 2002003 then

            /* set @解冻数量# = -1 * @变动数量# * @质押比例#; */
            set v_unfroz_qty = -1 * v_occur_qty * v_impawn_ratio;
        else

            /* set @解冻数量# = -1 * @变动数量# * @质押比例#; */
            set v_unfroz_qty = -1 * v_occur_qty * v_impawn_ratio;
        end if;

        /* set @变动数量# = @解冻数量#; */
        set v_occur_qty = v_unfroz_qty;

        /* [获取流水变动][{当前数量}, {解冻数量}][@当前数量#, @解冻数量#] */
        set v_jour_occur_field = concat("当前数量","|"," 解冻数量","|");
        set v_jour_occur_info = concat(v_curr_qty,"|", v_unfroz_qty,"|");


        /* [插入重复更新][产品证券_持仓_资产账户持仓表][字段][字段变量][{当前数量} = {当前数量} + @当前数量#, {解冻数量} = {解冻数量} + @解冻数量#][1][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsepo_asac_posi (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
            stock_type, asset_type, invest_type, begin_qty, 
            curr_qty, pre_settle_qty, frozen_qty, unfroz_qty, 
            posi_qty_check_diff, cost_amt, realize_pandl, intrst_cost_amt, 
            intrst_pandl) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
            v_stock_type, v_asset_type, v_invest_type, v_begin_qty, 
            v_curr_qty, v_pre_settle_qty, v_frozen_qty, v_unfroz_qty, 
            v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, v_intrst_cost_amt, 
            v_intrst_pandl) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = curr_qty + v_curr_qty, unfroz_qty = unfroz_qty + v_unfroz_qty;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.5.74.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{当前数量}, {解冻数量}][@当前数量#, @解冻数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
        select curr_qty, unfroz_qty into v_curr_qty, v_unfroz_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.5.74.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
            end if;
            leave label_pro;
        end if;


        /* set @变动后数量# = @解冻数量#; */
        set v_occur_end_qty = v_unfroz_qty;

        /* [获取流水后信息][@当前数量#, @解冻数量#] */
        set v_jour_after_occur_info = concat(v_curr_qty,"|", v_unfroz_qty,"|");


        /* [插入表记录][产品证券_持仓_资产账户持仓流水表][字段][字段变量][5][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsepo_asac_posi_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, asset_acco_no, exch_no, stock_acco_no, 
            stock_code_no, busi_flag, occur_qty, occur_end_qty, 
            jour_occur_field, jour_after_occur_info, oper_remark_info, invest_type) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
            v_stock_code_no, v_busi_flag, v_occur_qty, v_occur_end_qty, 
            v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, v_invest_type);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.5.74.5";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_清算持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_ClearSecuPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_ClearSecuPosiRecorded(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_occur_qty decimal(18,2),
    IN p_exgp_cost_amt decimal(18,4),
    IN p_exgp_realize_pandl decimal(18,4),
    IN p_exgp_intrst_cost_amt decimal(18,4),
    IN p_exgp_intrst_pandl decimal(18,4),
    IN p_asac_cost_amt decimal(18,4),
    IN p_asac_realize_pandl decimal(18,4),
    IN p_asac_intrst_cost_amt decimal(18,4),
    IN p_asac_intrst_pandl decimal(18,4),
    IN p_busi_flag int,
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_impawn_ratio decimal(18,12),
    IN p_arrive_date int,
    IN p_order_no int,
    IN p_entry_oper int,
    IN p_remark_info varchar(255),
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_occur_qty decimal(18,2);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_busi_flag int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_arrive_date int;
    declare v_order_no int;
    declare v_entry_oper int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_begin_trade_date int;
    declare v_entry_status varchar(2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);

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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_occur_qty = p_occur_qty;
    SET v_exgp_cost_amt = p_exgp_cost_amt;
    SET v_exgp_realize_pandl = p_exgp_realize_pandl;
    SET v_exgp_intrst_cost_amt = p_exgp_intrst_cost_amt;
    SET v_exgp_intrst_pandl = p_exgp_intrst_pandl;
    SET v_asac_cost_amt = p_asac_cost_amt;
    SET v_asac_realize_pandl = p_asac_realize_pandl;
    SET v_asac_intrst_cost_amt = p_asac_intrst_cost_amt;
    SET v_asac_intrst_pandl = p_asac_intrst_pandl;
    SET v_busi_flag = p_busi_flag;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_arrive_date = p_arrive_date;
    SET v_order_no = p_order_no;
    SET v_entry_oper = p_entry_oper;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_entry_status = "0";
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;

    
    label_pro:BEGIN
    

    /* if @业务标志#=《业务标志-债券融券回购》 or @业务标志#=《业务标志-债券融资回购》 then */
    if v_busi_flag=2004002 or v_busi_flag=2004001 then

        /* set @证券代码编号# = @标的代码编号#; */
        set v_stock_code_no = v_target_code_no;

    /* elseif @业务标志#=《业务标志-债券质押》 or @业务标志#=《业务标志-债券转回质押》 then */
    elseif v_busi_flag=2002003 or v_busi_flag=2002004 then

        /* set @证券代码编号# = @交易代码编号#; */
        set v_stock_code_no = v_trade_code_no;
    end if;

    /* set @上市日期# = @到账日期#; */
    set v_begin_trade_date = v_arrive_date;

    /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》  or @市场编号# = 《市场编号-场外交易市场》 then */
    if v_exch_no = 1 or v_exch_no = 2  or v_exch_no = 5 then

        /* set @入账状态# = 《入账状态-已入账》; */
        set v_entry_status = "1";

        /* if (@市场编号# = 《市场编号-场外交易市场》 and @到账日期#<>@初始化日期#) then */
        if (v_exch_no = 5 and v_arrive_date<>v_init_date) then

            /* set @入账状态# = 《入账状态-未入账》; */
            set v_entry_status = "2";
        end if;
    else

        /* set @入账状态# = 《入账状态-未入账》; */
        set v_entry_status = "2";
    end if;
    #处理交易组持仓入账

    /* set @成本金额# = @交易组成本金额#; */
    set v_cost_amt = v_exgp_cost_amt;

    /* set @实现盈亏# = @交易组实现盈亏#; */
    set v_realize_pandl = v_exgp_realize_pandl;

    /* set @利息成本金额# = @交易组利息成本金额#; */
    set v_intrst_cost_amt = v_exgp_intrst_cost_amt;

    /* set @利息收益# = @交易组利息收益#; */
    set v_intrst_pandl = v_exgp_intrst_pandl;

    /* 调用【原子_产品证券_清算接口_交易组持仓入账】*/
    call db_pdsecu.pra_pdsepubif_PdExchGroupSecuPosiRecorded(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_arrive_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_target_code_no,
        v_stock_type,
        v_asset_type,
        v_occur_qty,
        v_cost_amt,
        v_realize_pandl,
        v_intrst_cost_amt,
        v_intrst_pandl,
        v_impawn_ratio,
        v_busi_flag,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.5.75.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_交易组持仓入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @入账操作# = 1 then */
    if v_entry_oper = 1 then

        /* 调用【原子_产品证券_清算接口_新增交易组持仓入账流水】*/
        call db_pdsecu.pra_pdsepubif_InsertExgpPosiEntryJour(
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
            v_stock_acco_no,
            v_stock_code_no,
            v_target_code_no,
            v_stock_type,
            v_asset_type,
            v_busi_flag,
            v_occur_qty,
            v_cost_amt,
            v_intrst_cost_amt,
            v_realize_pandl,
            v_intrst_pandl,
            v_impawn_ratio,
            v_begin_trade_date,
            v_arrive_date,
            v_order_no,
            v_entry_status,
            v_error_code,
            v_error_info,
            v_entry_exgp_posi_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuA.5.75.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_新增交易组持仓入账流水出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    #处理资产账户持仓入账

    /* set @成本金额# = @资产账户成本金额#; */
    set v_cost_amt = v_asac_cost_amt;

    /* set @实现盈亏# = @资产账户实现盈亏#; */
    set v_realize_pandl = v_asac_realize_pandl;

    /* set @利息成本金额# = @资产账户利息成本金额#; */
    set v_intrst_cost_amt = v_asac_intrst_cost_amt;

    /* set @利息收益# = @资产账户利息收益#; */
    set v_intrst_pandl = v_asac_intrst_pandl;

    /* 调用【原子_产品证券_清算接口_资产账户持仓入账】*/
    call db_pdsecu.pra_pdsepubif_PdAssetAccoSecuPosiRecorded(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_arrive_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_target_code_no,
        v_stock_type,
        v_asset_type,
        v_occur_qty,
        v_cost_amt,
        v_realize_pandl,
        v_intrst_cost_amt,
        v_intrst_pandl,
        v_impawn_ratio,
        v_busi_flag,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.5.75.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_资产账户持仓入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @入账操作# = 1 then */
    if v_entry_oper = 1 then

        /* 调用【原子_产品证券_清算接口_新增资产账户持仓入账流水】*/
        call db_pdsecu.pra_pdsepubif_InsertAsacPosiEntryJour(
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
            v_stock_acco_no,
            v_stock_code_no,
            v_target_code_no,
            v_stock_type,
            v_asset_type,
            v_busi_flag,
            v_occur_qty,
            v_cost_amt,
            v_intrst_cost_amt,
            v_realize_pandl,
            v_intrst_pandl,
            v_impawn_ratio,
            v_begin_trade_date,
            v_arrive_date,
            v_order_no,
            v_entry_status,
            v_error_code,
            v_error_info,
            v_entry_asac_posi_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuA.5.75.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_新增资产账户持仓入账流水出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no;
    SET p_entry_asac_posi_jour_no = v_entry_asac_posi_jour_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_新增交易组持仓入账流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_InsertExgpPosiEntryJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_InsertExgpPosiEntryJour(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_target_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_busi_flag int,
    IN p_occur_qty decimal(18,2),
    IN p_cost_amt decimal(18,4),
    IN p_intrst_cost_amt decimal(18,4),
    IN p_realize_pandl decimal(18,4),
    IN p_intrst_pandl decimal(18,4),
    IN p_impawn_ratio decimal(18,12),
    IN p_begin_trade_date int,
    IN p_arrive_date int,
    IN p_order_no int,
    IN p_entry_status varchar(2),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_busi_flag int;
    declare v_occur_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_begin_trade_date int;
    declare v_arrive_date int;
    declare v_order_no int;
    declare v_entry_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_impawn_qty decimal(18,2);
    declare v_old_arrive_date int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_busi_flag = p_busi_flag;
    SET v_occur_qty = p_occur_qty;
    SET v_cost_amt = p_cost_amt;
    SET v_intrst_cost_amt = p_intrst_cost_amt;
    SET v_realize_pandl = p_realize_pandl;
    SET v_intrst_pandl = p_intrst_pandl;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_arrive_date = p_arrive_date;
    SET v_order_no = p_order_no;
    SET v_entry_status = p_entry_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_impawn_qty = 0;
    SET v_old_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @质押数量# = 0; */
    set v_impawn_qty = 0;

    /* set @原到账日期# = @到账日期#; */
    set v_old_arrive_date = v_arrive_date;

    /* if @市场编号#=5 and @到账日期#=@初始化日期# then */
    if v_exch_no=5 and v_arrive_date=v_init_date then

        /* [更新表记录][产品证券_持仓_交易组持仓入账流水表][{到账日期}=@初始化日期#][{初始化日期}<>@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {订单编号}=@订单编号#][2][@订单编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdsepo_exgp_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, arrive_date=v_init_date where init_date<>v_init_date and co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and order_no=v_order_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.5.76.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单编号=",v_order_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单编号=",v_order_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [插入表记录][产品证券_持仓_交易组持仓入账流水表][字段][字段变量][1][@机构编号#,@产品编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_exgp_posi_entry_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, target_code_no, stock_type, 
        asset_type, busi_flag, occur_qty, cost_amt, 
        intrst_cost_amt, realize_pandl, intrst_pandl, impawn_qty, 
        impawn_ratio, begin_trade_date, old_arrive_date, arrive_date, 
        order_no, entry_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_target_code_no, v_stock_type, 
        v_asset_type, v_busi_flag, v_occur_qty, v_cost_amt, 
        v_intrst_cost_amt, v_realize_pandl, v_intrst_pandl, v_impawn_qty, 
        v_impawn_ratio, v_begin_trade_date, v_old_arrive_date, v_arrive_date, 
        v_order_no, v_entry_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.76.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
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
use db_pdsecu;;

# 原子_产品证券_清算接口_新增资产账户持仓入账流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_InsertAsacPosiEntryJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_InsertAsacPosiEntryJour(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_target_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_busi_flag int,
    IN p_occur_qty decimal(18,2),
    IN p_cost_amt decimal(18,4),
    IN p_intrst_cost_amt decimal(18,4),
    IN p_realize_pandl decimal(18,4),
    IN p_intrst_pandl decimal(18,4),
    IN p_impawn_ratio decimal(18,12),
    IN p_begin_trade_date int,
    IN p_arrive_date int,
    IN p_order_no int,
    IN p_entry_status varchar(2),
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_busi_flag int;
    declare v_occur_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_begin_trade_date int;
    declare v_arrive_date int;
    declare v_order_no int;
    declare v_entry_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_asac_posi_jour_no bigint;
    declare v_old_arrive_date int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_busi_flag = p_busi_flag;
    SET v_occur_qty = p_occur_qty;
    SET v_cost_amt = p_cost_amt;
    SET v_intrst_cost_amt = p_intrst_cost_amt;
    SET v_realize_pandl = p_realize_pandl;
    SET v_intrst_pandl = p_intrst_pandl;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_arrive_date = p_arrive_date;
    SET v_order_no = p_order_no;
    SET v_entry_status = p_entry_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_asac_posi_jour_no = 0;
    SET v_old_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @原到账日期# = @到账日期#; */
    set v_old_arrive_date = v_arrive_date;

    /* if @市场编号#=5 and @到账日期#=@初始化日期# then */
    if v_exch_no=5 and v_arrive_date=v_init_date then

        /* [更新表记录][产品证券_持仓_资产账户持仓入账流水表][{到账日期}=@初始化日期#][{初始化日期}<>@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#  and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {订单编号}=@订单编号#][2][@订单编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdsepo_asac_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, arrive_date=v_init_date where init_date<>v_init_date and co_no=v_co_no and pd_no=v_pd_no  and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and order_no=v_order_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.5.77.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单编号=",v_order_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单编号=",v_order_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [插入表记录][产品证券_持仓_资产账户持仓入账流水表][字段][字段变量][1][@机构编号#,@产品编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_asac_posi_entry_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, target_code_no, stock_type, asset_type, 
        busi_flag, occur_qty, cost_amt, intrst_cost_amt, 
        realize_pandl, intrst_pandl, impawn_ratio, begin_trade_date, 
        old_arrive_date, arrive_date, order_no, entry_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_target_code_no, v_stock_type, v_asset_type, 
        v_busi_flag, v_occur_qty, v_cost_amt, v_intrst_cost_amt, 
        v_realize_pandl, v_intrst_pandl, v_impawn_ratio, v_begin_trade_date, 
        v_old_arrive_date, v_arrive_date, v_order_no, v_entry_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.77.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
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
use db_pdsecu;;

# 原子_产品证券_清算接口_获取证券代码持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_GetStockPosiInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_GetStockPosiInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_curr_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_query_row_id bigint;
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_curr_qty decimal(18,2);
    declare v_invest_type int;

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
    SET v_query_row_id = p_query_row_id;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_curr_qty = 0;
    SET v_invest_type = 0;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{记录序号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{当前数量}+{待交收数量}][@记录序号#,@机构编号#,@产品编号#,@交易组编号#,@资产账户编号#,@市场编号#,@股东代码编号#,@当前数量#][{证券代码编号}=@证券代码编号# and {投资类型}=@投资类型# and {记录序号}>@查询记录序号# order by {记录序号}][4][@证券代码编号#] */
    select row_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,curr_qty+pre_settle_qty into v_row_id,v_co_no,v_pd_no,v_exch_group_no,v_asset_acco_no,v_exch_no,v_stock_acco_no,v_curr_qty from db_pdsecu.tb_pdsepo_exgp_posi where stock_code_no=v_stock_code_no and invest_type=v_invest_type and row_id>v_query_row_id order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.5.82.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_curr_qty = v_curr_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_写入回购记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_InsertRepoRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_InsertRepoRecord(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_target_code_no int,
    IN p_target_code varchar(6),
    IN p_order_dir int,
    IN p_repo_qty decimal(18,2),
    IN p_repo_amt decimal(18,4),
    IN p_repo_rate decimal(18,12),
    IN p_repo_trade_date int,
    IN p_repo_order_id bigint,
    IN p_repo_strike_id bigint,
    IN p_repo_days int,
    IN p_repo_cale_days int,
    IN p_repo_back_date int,
    IN p_repo_back_amt decimal(18,4),
    IN p_repo_back_intrst decimal(18,4),
    IN p_repo_back_trade_date int,
    IN p_repo_first_settle_date int,
    IN p_strike_deal_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_order_dir int;
    declare v_repo_qty decimal(18,2);
    declare v_repo_amt decimal(18,4);
    declare v_repo_rate decimal(18,12);
    declare v_repo_trade_date int;
    declare v_repo_order_id bigint;
    declare v_repo_strike_id bigint;
    declare v_repo_days int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_repo_back_amt decimal(18,4);
    declare v_repo_back_intrst decimal(18,4);
    declare v_repo_back_trade_date int;
    declare v_repo_first_settle_date int;
    declare v_strike_deal_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_repo_status varchar(2);
    declare v_tmp_row_id bigint;
    declare v_tmp_repo_qty decimal(18,2);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_target_code_no = p_target_code_no;
    SET v_target_code = p_target_code;
    SET v_order_dir = p_order_dir;
    SET v_repo_qty = p_repo_qty;
    SET v_repo_amt = p_repo_amt;
    SET v_repo_rate = p_repo_rate;
    SET v_repo_trade_date = p_repo_trade_date;
    SET v_repo_order_id = p_repo_order_id;
    SET v_repo_strike_id = p_repo_strike_id;
    SET v_repo_days = p_repo_days;
    SET v_repo_cale_days = p_repo_cale_days;
    SET v_repo_back_date = p_repo_back_date;
    SET v_repo_back_amt = p_repo_back_amt;
    SET v_repo_back_intrst = p_repo_back_intrst;
    SET v_repo_back_trade_date = p_repo_back_trade_date;
    SET v_repo_first_settle_date = p_repo_first_settle_date;
    SET v_strike_deal_type = p_strike_deal_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_repo_status = "0";
    SET v_tmp_row_id = 0;
    SET v_tmp_repo_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @回购处理状态# = 《回购处理状态-未处理》; */
    set v_repo_status = "2";
    #新增修改:为了避免合笔成交的数据进来错误

    /* if @成交处理方式#=2 then */
    if v_strike_deal_type=2 then

        /* [获取表记录变量语句][产品证券_持仓_债券回购表][{记录序号},{回购数量}][@临时_记录序号#,@临时_回购数量#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {回购委托序号}=@回购委托序号#] */
        select row_id,repo_qty into v_tmp_row_id,v_tmp_repo_qty from db_pdsecu.tb_pdsepo_bond_repo where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and repo_order_id=v_repo_order_id limit 1;


        /* if @临时_记录序号#=0 then */
        if v_tmp_row_id=0 then

            /* [插入表记录][产品证券_持仓_债券回购表][字段][字段变量][1][@资产账户编号#,@股东代码编号#,@证券代码编号#,@订单方向#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_bond_repo(
                create_date, create_time, update_date, 
                update_time, update_times, co_no, pd_no, 
                exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
                stock_code_no, stock_code, target_code_no, target_code, 
                order_dir, repo_qty, repo_amt, repo_rate, 
                repo_trade_date, repo_order_id, repo_strike_id, repo_days, 
                repo_cale_days, repo_back_date, repo_back_amt, repo_back_intrst, 
                repo_back_trade_date, repo_status) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_co_no, v_pd_no, 
                v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
                v_stock_code_no, v_stock_code, v_target_code_no, v_target_code, 
                v_order_dir, v_repo_qty, v_repo_amt, v_repo_rate, 
                v_repo_trade_date, v_repo_order_id, v_repo_strike_id, v_repo_days, 
                v_repo_cale_days, v_repo_back_date, v_repo_back_amt, v_repo_back_intrst, 
                v_repo_back_trade_date, v_repo_status);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.5.111.1";
                SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
                leave label_pro;
            end if;


            /* [获取记录序号][@记录序号#] */
            select LAST_INSERT_ID() into v_row_id;

        else

            /* if @回购数量#>@临时_回购数量# then */
            if v_repo_qty>v_tmp_repo_qty then

                /* [更新表记录][产品证券_持仓_债券回购表][{回购数量}=@回购数量#,{回购金额}=@回购金额#,{回购利率}=@回购利率#,{回购交易日期}=@回购交易日期#,{回购委托序号}=@回购委托序号#,{回购成交序号}=@回购成交序号#,{回购天数}=@回购天数#,{回购实际天数}=@回购实际天数#,{回购到期日期}=@回购到期日期#,{回购购回金额}=@回购购回金额#,{回购购回利息}=@回购购回利息#,{实际回购到期日期}=@实际回购到期日期#,{回购处理状态}=@回购处理状态#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {回购委托序号}=@回购委托序号#][2][@机构编号#,@产品编号#,@交易组编号#,@回购委托序号#] */
                set v_update_date = date_format(curdate(),'%Y%m%d');
                set v_update_time = date_format(curtime(),'%H%i%s');
                update db_pdsecu.tb_pdsepo_bond_repo set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, repo_qty=v_repo_qty,repo_amt=v_repo_amt,repo_rate=v_repo_rate,repo_trade_date=v_repo_trade_date,repo_order_id=v_repo_order_id,repo_strike_id=v_repo_strike_id,repo_days=v_repo_days,repo_cale_days=v_repo_cale_days,repo_back_date=v_repo_back_date,repo_back_amt=v_repo_back_amt,repo_back_intrst=v_repo_back_intrst,repo_back_trade_date=v_repo_back_trade_date,repo_status=v_repo_status where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and repo_order_id=v_repo_order_id;
                if v_error_code = "1" then
                            
                    SET v_error_code = "pdsecuA.5.111.2";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","回购委托序号=",v_repo_order_id),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","回购委托序号=",v_repo_order_id);
                    end if;
                    leave label_pro;
                end if;


                /* [获取表记录变量][产品证券_持仓_债券回购表][{记录序号}][@记录序号#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {回购委托序号}=@回购委托序号#][4][@机构编号#,@产品编号#,@交易组编号#,@回购委托序号#] */
                select row_id into v_row_id from db_pdsecu.tb_pdsepo_bond_repo where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and repo_order_id=v_repo_order_id limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pdsecuA.5.111.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","回购委托序号=",v_repo_order_id),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","回购委托序号=",v_repo_order_id);
                    end if;
                    leave label_pro;
                end if;

            else

                /* set @记录序号#=@临时_记录序号#; */
                set v_row_id=v_tmp_row_id;
            end if;
        end if;
    else

        /* [插入表记录][产品证券_持仓_债券回购表][字段][字段变量][1][@资产账户编号#,@股东代码编号#,@证券代码编号#,@订单方向#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsepo_bond_repo(
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
            stock_code_no, stock_code, target_code_no, target_code, 
            order_dir, repo_qty, repo_amt, repo_rate, 
            repo_trade_date, repo_order_id, repo_strike_id, repo_days, 
            repo_cale_days, repo_back_date, repo_back_amt, repo_back_intrst, 
            repo_back_trade_date, repo_status) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
            v_stock_code_no, v_stock_code, v_target_code_no, v_target_code, 
            v_order_dir, v_repo_qty, v_repo_amt, v_repo_rate, 
            v_repo_trade_date, v_repo_order_id, v_repo_strike_id, v_repo_days, 
            v_repo_cale_days, v_repo_back_date, v_repo_back_amt, v_repo_back_intrst, 
            v_repo_back_trade_date, v_repo_status);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.5.111.1";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* [获取记录序号][@记录序号#] */
        select LAST_INSERT_ID() into v_row_id;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_清算接口_写入回购记录回滚
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_InsertRepoRecordRollback;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_InsertRepoRecordRollback(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_持仓_债券回购表][{回购处理状态}=《回购处理状态-已回滚》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_bond_repo set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, repo_status="4" where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.112.2";
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
use db_pdsecu;;

# 原子_产品证券_清算接口_配股资金处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_PlacementCapitalDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_PlacementCapitalDeal(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_frozen_amt decimal(18,4),
    IN p_busi_flag int,
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_cash_id bigint,
    OUT p_exgp_begin_amt decimal(18,4),
    OUT p_exgp_curr_amt decimal(18,4),
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exgp_pre_settle_amt decimal(18,4),
    OUT p_exgp_shsz_avail_change_amt decimal(18,4),
    OUT p_exgp_hk_avail_change_amt decimal(18,4),
    OUT p_exgp_amt_check_diff decimal(18,4),
    OUT p_exgp_T_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exch_group_total_rece_amt decimal(18,4),
    OUT p_exch_group_total_payab_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exch_group_intrst_rate decimal(18,4),
    OUT p_exch_group_intrst_base_amt decimal(18,4),
    OUT p_exch_group_pre_entry_intrst_amt decimal(18,4),
    OUT p_exch_group_update_times int,
    OUT p_asac_cash_id bigint,
    OUT p_asac_begin_amt decimal(18,4),
    OUT p_asac_curr_amt decimal(18,4),
    OUT p_asac_frozen_amt decimal(18,4),
    OUT p_asac_unfroz_amt decimal(18,4),
    OUT p_asac_pre_settle_amt decimal(18,4),
    OUT p_asac_shsz_avail_change_amt decimal(18,4),
    OUT p_asac_hk_avail_change_amt decimal(18,4),
    OUT p_asac_amt_check_diff decimal(18,4),
    OUT p_asac_T_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T_hk_sell_total_amt decimal(18,4),
    OUT p_asac_T1_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T1_hk_sell_total_amt decimal(18,4),
    OUT p_asac_total_rece_amt decimal(18,4),
    OUT p_asac_total_payab_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_rate decimal(18,4),
    OUT p_asac_intrst_base_amt decimal(18,4),
    OUT p_asac_pre_entry_intrst_amt decimal(18,4),
    OUT p_asac_update_times int
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_frozen_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_cash_id bigint;
    declare v_exgp_begin_amt decimal(18,4);
    declare v_exgp_curr_amt decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exgp_pre_settle_amt decimal(18,4);
    declare v_exgp_shsz_avail_change_amt decimal(18,4);
    declare v_exgp_hk_avail_change_amt decimal(18,4);
    declare v_exgp_amt_check_diff decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
    declare v_exch_group_update_times int;
    declare v_asac_cash_id bigint;
    declare v_asac_begin_amt decimal(18,4);
    declare v_asac_curr_amt decimal(18,4);
    declare v_asac_frozen_amt decimal(18,4);
    declare v_asac_unfroz_amt decimal(18,4);
    declare v_asac_pre_settle_amt decimal(18,4);
    declare v_asac_shsz_avail_change_amt decimal(18,4);
    declare v_asac_hk_avail_change_amt decimal(18,4);
    declare v_asac_amt_check_diff decimal(18,4);
    declare v_asac_T_hk_buy_total_amt decimal(18,4);
    declare v_asac_T_hk_sell_total_amt decimal(18,4);
    declare v_asac_T1_hk_buy_total_amt decimal(18,4);
    declare v_asac_T1_hk_sell_total_amt decimal(18,4);
    declare v_asac_total_rece_amt decimal(18,4);
    declare v_asac_total_payab_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_rate decimal(18,4);
    declare v_asac_intrst_base_amt decimal(18,4);
    declare v_asac_pre_entry_intrst_amt decimal(18,4);
    declare v_asac_update_times int;
    declare v_tmp_frozen_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_frozen_amt = p_frozen_amt;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_cash_id = 0;
    SET v_exgp_begin_amt = 0;
    SET v_exgp_curr_amt = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exgp_pre_settle_amt = 0;
    SET v_exgp_shsz_avail_change_amt = 0;
    SET v_exgp_hk_avail_change_amt = 0;
    SET v_exgp_amt_check_diff = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_exch_group_total_rece_amt = 0;
    SET v_exch_group_total_payab_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exch_group_intrst_rate = 0;
    SET v_exch_group_intrst_base_amt = 0;
    SET v_exch_group_pre_entry_intrst_amt = 0;
    SET v_exch_group_update_times = 0;
    SET v_asac_cash_id = 0;
    SET v_asac_begin_amt = 0;
    SET v_asac_curr_amt = 0;
    SET v_asac_frozen_amt = 0;
    SET v_asac_unfroz_amt = 0;
    SET v_asac_pre_settle_amt = 0;
    SET v_asac_shsz_avail_change_amt = 0;
    SET v_asac_hk_avail_change_amt = 0;
    SET v_asac_amt_check_diff = 0;
    SET v_asac_T_hk_buy_total_amt = 0;
    SET v_asac_T_hk_sell_total_amt = 0;
    SET v_asac_T1_hk_buy_total_amt = 0;
    SET v_asac_T1_hk_sell_total_amt = 0;
    SET v_asac_total_rece_amt = 0;
    SET v_asac_total_payab_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_rate = 0;
    SET v_asac_intrst_base_amt = 0;
    SET v_asac_pre_entry_intrst_amt = 0;
    SET v_asac_update_times = 0;
    SET v_tmp_frozen_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @临时_冻结金额# = @冻结金额#; */
    set v_tmp_frozen_amt = v_frozen_amt;

    /* [获取流水变动][{冻结金额}][@冻结金额#] */
    set v_jour_occur_field = concat("冻结金额","|");
    set v_jour_occur_info = concat(v_frozen_amt,"|");


    /* [更新表记录][产品证券_资金_交易组资金表][{冻结金额}={冻结金额}+@冻结金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][1][@交易组编号#,@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_amt=frozen_amt+v_frozen_amt where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.113.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{更新次数}][@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组港股通可用调整金额#,@交易组金额核对差额#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
    select row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_hk_avail_change_amt,v_exgp_amt_check_diff,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exch_group_update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.5.113.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


     /* set @变动金额# = @冻结金额#; */
     set v_occur_amt = v_frozen_amt;

     /* set @变动后金额# = @交易组冻结金额#; */
     set v_occur_end_amt = v_exgp_frozen_amt;

    /* [获取流水后信息][@交易组冻结金额#] */
    set v_jour_after_occur_info = concat(v_exgp_frozen_amt,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = @备注信息#; */
    set v_oper_remark_info = v_remark_info;

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
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
                
        SET v_error_code = "pdsecuA.5.113.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资产账户资金表][{冻结金额}={冻结金额}+@冻结金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][1][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_amt=frozen_amt+v_frozen_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.113.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{更新次数}][@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户港股通可用调整金额#,@资产账户金额核对差额#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_hk_avail_change_amt,v_asac_amt_check_diff,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_update_times from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.5.113.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


     /* set @变动金额# = @冻结金额#; */
     set v_occur_amt = v_frozen_amt;

     /* set @变动后金额# = @资产账户冻结金额#; */
     set v_occur_end_amt = v_asac_frozen_amt;

    /* [获取流水后信息][@资产账户冻结金额#] */
    set v_jour_after_occur_info = concat(v_asac_frozen_amt,"|");


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_asac_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, crncy_type, busi_flag, 
        occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_crncy_type, v_busi_flag, 
        v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.5.113.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_cash_id = v_exgp_cash_id;
    SET p_exgp_begin_amt = v_exgp_begin_amt;
    SET p_exgp_curr_amt = v_exgp_curr_amt;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exgp_pre_settle_amt = v_exgp_pre_settle_amt;
    SET p_exgp_shsz_avail_change_amt = v_exgp_shsz_avail_change_amt;
    SET p_exgp_hk_avail_change_amt = v_exgp_hk_avail_change_amt;
    SET p_exgp_amt_check_diff = v_exgp_amt_check_diff;
    SET p_exgp_T_hk_buy_total_amt = v_exgp_T_hk_buy_total_amt;
    SET p_exgp_T_hk_sell_total_amt = v_exgp_T_hk_sell_total_amt;
    SET p_exgp_T1_hk_buy_total_amt = v_exgp_T1_hk_buy_total_amt;
    SET p_exgp_T1_hk_sell_total_amt = v_exgp_T1_hk_sell_total_amt;
    SET p_exch_group_total_rece_amt = v_exch_group_total_rece_amt;
    SET p_exch_group_total_payab_amt = v_exch_group_total_payab_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exch_group_intrst_rate = v_exch_group_intrst_rate;
    SET p_exch_group_intrst_base_amt = v_exch_group_intrst_base_amt;
    SET p_exch_group_pre_entry_intrst_amt = v_exch_group_pre_entry_intrst_amt;
    SET p_exch_group_update_times = v_exch_group_update_times;
    SET p_asac_cash_id = v_asac_cash_id;
    SET p_asac_begin_amt = v_asac_begin_amt;
    SET p_asac_curr_amt = v_asac_curr_amt;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_pre_settle_amt = v_asac_pre_settle_amt;
    SET p_asac_shsz_avail_change_amt = v_asac_shsz_avail_change_amt;
    SET p_asac_hk_avail_change_amt = v_asac_hk_avail_change_amt;
    SET p_asac_amt_check_diff = v_asac_amt_check_diff;
    SET p_asac_T_hk_buy_total_amt = v_asac_T_hk_buy_total_amt;
    SET p_asac_T_hk_sell_total_amt = v_asac_T_hk_sell_total_amt;
    SET p_asac_T1_hk_buy_total_amt = v_asac_T1_hk_buy_total_amt;
    SET p_asac_T1_hk_sell_total_amt = v_asac_T1_hk_sell_total_amt;
    SET p_asac_total_rece_amt = v_asac_total_rece_amt;
    SET p_asac_total_payab_amt = v_asac_total_payab_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_rate = v_asac_intrst_rate;
    SET p_asac_intrst_base_amt = v_asac_intrst_base_amt;
    SET p_asac_pre_entry_intrst_amt = v_asac_pre_entry_intrst_amt;
    SET p_asac_update_times = v_asac_update_times;

END;;


