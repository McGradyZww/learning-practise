DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户运维_查询全部证券账户
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseacbk_QueryAllSecuAcco;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseacbk_QueryAllSecuAcco(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_stock_acco_status varchar(2),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco_status varchar(2);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco_status = p_stock_acco_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][产品证券_账户_证券账户信息表][{机构编号},{产品编号},{资产账户编号},{股东代码编号},{市场编号},{股东代码},{股东代码名称},{股东代码状态},{股东指定状态}][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#)  and (@股东代码状态#=" " or {股东代码状态}=@股东代码状态#)] */
    select co_no,pd_no,asset_acco_no,stock_acco_no,exch_no,stock_acco,stock_acco_name,stock_acco_status,stock_acco_apoint_status from db_pdsecu.tb_pdseac_secu_acco where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no)  and (v_stock_acco_status=" " or stock_acco_status=v_stock_acco_status);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户运维_统计资金入账流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseacbk_StatCapitEntryJourCalcRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseacbk_StatCapitEntryJourCalcRecord(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [删除表记录][产品证券_资金_资金入账流水计算统计表][1=1][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.7.12.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [读取插入表记录][产品证券_资金_资金入账流水计算统计表][产品证券_资金_资金入账流水表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{本币币种},{交易币种},{业务标志},{变动金额},{到账日期},{入账状态},{港股通资金可用日期}][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{本币币种},{交易币种},{业务标志},{变动金额},{到账日期},{入账状态},2][{到账日期}>=@初始化日期# and ((({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》)) or {业务标志}=《业务标志-融资回购到期》 or {业务标志}=《业务标志-融券回购到期》) and {入账状态}=《入账状态-未入账》 order by {资产账户编号}][1][@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,crncy_type,exch_crncy_type,busi_flag,occur_amt,arrive_date,entry_status,hk_cash_avail_date_type) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,crncy_type,exch_crncy_type,busi_flag,occur_amt,arrive_date,entry_status,2 
        from db_pdsecu.tb_pdseca_capit_entry_jour 
        where arrive_date>=v_init_date and (((exch_no=3 or exch_no=4) and (busi_flag=2001001 or busi_flag=2001002)) or busi_flag=2004003 or busi_flag=2004004) and entry_status="2" order by asset_acco_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.12.1";
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
use db_pdsecu;;

# 原子_产品证券_账户运维_获取资金入账流水计算统计记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseacbk_GetCapitEntryJourCalcStatRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseacbk_GetCapitEntryJourCalcStatRecord(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_asac_asset_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_query_asac_asset_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;

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
    SET v_query_asac_asset_no = p_query_asac_asset_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_资金_资金入账流水计算统计表][{记录序号},{机构编号},{产品编号},{交易组编号},{资产账户编号}][@记录序号#,@机构编号#,@产品编号#,@交易组编号#,@资产账户编号#][{资产账户编号}>@查询资产账户编号# and (({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》)) order by {资产账户编号}][4][@查询资产账户编号#] */
    select row_id,co_no,pd_no,exch_group_no,asset_acco_no into v_row_id,v_co_no,v_pd_no,v_exch_group_no,v_asset_acco_no from db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat where asset_acco_no>v_query_asac_asset_no and ((exch_no=3 or exch_no=4) and (busi_flag=2001001 or busi_flag=2001002)) order by asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.7.13.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询资产账户编号=",v_query_asac_asset_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询资产账户编号=",v_query_asac_asset_no);
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

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户运维_更新港股通资金可用日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseacbk_UpdateHKCashAvailDate;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseacbk_UpdateHKCashAvailDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_hk_cash_avail_date_type int,
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
    declare v_asset_acco_no int;
    declare v_hk_cash_avail_date_type int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_hk_cash_avail_date_type = p_hk_cash_avail_date_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_资金_资金入账流水计算统计表][{港股通资金可用日期}=@港股通资金可用日期#][{资产账户编号}=@资产账户编号#][2][@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, hk_cash_avail_date_type=v_hk_cash_avail_date_type where asset_acco_no=v_asset_acco_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.11.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户运维_更新可用资金调整金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseacbk_UpdateCashAvailAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseacbk_UpdateCashAvailAmt(
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
    declare v_update_date int;
    declare v_update_time int;
    declare v_T1_date int;
    declare v_T_date int;
    declare v_tmp_init_date int;

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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_T1_date = date_format(curdate(),'%Y%m%d');
    SET v_T_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_资金_交易组资金表][{T日当日港股买入金额}=0,{T日当日港股卖出金额}=0,{T1日当日港股买入金额}=0,{T1日当日港股卖出金额}=0,{待交收金额}=0,{沪深可用调整金额}=0,{港股通可用调整金额}=0][1=1][2][""] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, T_hk_buy_total_amt=0,T_hk_sell_total_amt=0,T1_hk_buy_total_amt=0,T1_hk_sell_total_amt=0,pre_settle_amt=0,shsz_avail_change_amt=0,hk_avail_change_amt=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.14.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("","#",v_mysql_message);
        else
            SET v_error_info = "";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资产账户资金表][{T日当日港股买入金额}=0,{T日当日港股卖出金额}=0,{T1日当日港股买入金额}=0,{T1日当日港股卖出金额}=0,{待交收金额}=0,{沪深可用调整金额}=0,{港股通可用调整金额}=0][1=1][2][""] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, T_hk_buy_total_amt=0,T_hk_sell_total_amt=0,T1_hk_buy_total_amt=0,T1_hk_sell_total_amt=0,pre_settle_amt=0,shsz_avail_change_amt=0,hk_avail_change_amt=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.14.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("","#",v_mysql_message);
        else
            SET v_error_info = "";
        end if;
        leave label_pro;
    end if;

    #此处的T日和T+1日都是以到期日期来计算的 , 同一时间最多出现两个到期日期

    /* select max(arrive_date) into @T1日# FROM `tb_pdseca_capit_entry_jour_calc_stat` where busi_flag in (2001001,2001002) and exch_no in (3,4) ; */
    select max(arrive_date) into v_T1_date FROM `tb_pdseca_capit_entry_jour_calc_stat` where busi_flag in (2001001,2001002) and exch_no in (3,4) ;

    /* set @T1日#=ifnull(@T1日#,0); */
    set v_T1_date=ifnull(v_T1_date,0);

    /* select max(arrive_date) into @T日# FROM `tb_pdseca_capit_entry_jour_calc_stat` where arrive_date<@T1日# and  busi_flag not in (2004001,2004002); */
    select max(arrive_date) into v_T_date FROM `tb_pdseca_capit_entry_jour_calc_stat` where arrive_date<v_T1_date and  busi_flag not in (2004001,2004002);

    /* set @T日#=ifnull(@T日#,0); */
    set v_T_date=ifnull(v_T_date,0);
    #使用统计表中的初始化日期来判断 , 可能出现T日有交易T+1日无交易 , 或者T日无交易T+1日有交易的情况

    /* select max(init_date) into @临时_初始化日期# FROM `tb_pdseca_capit_entry_jour_calc_stat` ; */
    select max(init_date) into v_tmp_init_date FROM `tb_pdseca_capit_entry_jour_calc_stat` ;

    /* set @临时_初始化日期#=ifnull(@临时_初始化日期#,0); */
    set v_tmp_init_date=ifnull(v_tmp_init_date,0);
    #这是T+1日有交易而T日无交易的情况 , 那么不做操作

    /* if (@T1日#<>0 and @T日#=0 and @临时_初始化日期#=@初始化日期#) then */
    if (v_T1_date<>0 and v_T_date=0 and v_tmp_init_date=v_init_date) then

        /* set @临时_初始化日期#=@初始化日期#; */
        set v_tmp_init_date=v_init_date;
    #这是T+1日无交易而T日有交易的情况 , 那么将T+1日的值给T日,T+1日为0

    /* elseif (@T1日#<>0 and @T日#=0 and @临时_初始化日期#<>@初始化日期#) then */
    elseif (v_T1_date<>0 and v_T_date=0 and v_tmp_init_date<>v_init_date) then

        /* set @T日#=@T1日#; */
        set v_T_date=v_T1_date;

        /* set @T1日#=0; */
        set v_T1_date=0;
    end if;

    /* UPDATE ~产品证券_资金_交易组资金表^ a,
 (
 SELECT
  sum({变动金额}) AS {T日当日港股卖出金额},
  {交易组编号},
  {资产账户编号},
  {本币币种}
 FROM
  ~产品证券_资金_资金入账流水计算统计表^
 WHERE
  ({市场编号} in (3,4) and {业务标志} =《业务标志-股票卖出》 and {到账日期}<=@T日# and {港股通资金可用日期} <> 《港股通资金可用日期-T日可用》  and {入账状态}=《入账状态-未入账》)
 GROUP BY
  {交易组编号},
  {资产账户编号},
  {本币币种}
) b
SET a.{T日当日港股卖出金额} = b.{T日当日港股卖出金额}
WHERE
  a.{交易组编号} = b.{交易组编号}
AND a.{资产账户编号} = b.{资产账户编号}
AND a.{本币币种} = b.{本币币种}; */
    UPDATE db_pdsecu.tb_pdseca_exgp_capit a,
     (
     SELECT
      sum(occur_amt) AS T_hk_sell_total_amt,
      exch_group_no,
      asset_acco_no,
      crncy_type
     FROM
      db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat
     WHERE
      (exch_no in (3,4) and busi_flag =2001002 and arrive_date<=v_T_date and hk_cash_avail_date_type <> 1  and entry_status="2")
     GROUP BY
      exch_group_no,
      asset_acco_no,
      crncy_type
    ) b
    SET a.T_hk_sell_total_amt = b.T_hk_sell_total_amt
    WHERE
      a.exch_group_no = b.exch_group_no
    AND a.asset_acco_no = b.asset_acco_no
    AND a.crncy_type = b.crncy_type;

    /* UPDATE ~产品证券_资金_交易组资金表^ a,
(
 SELECT
  -1*sum({变动金额}) AS {T日当日港股买入金额},
  {交易组编号},
  {资产账户编号},
  {本币币种}
 FROM
  ~产品证券_资金_资金入账流水计算统计表^
 WHERE
  ({市场编号} in (3,4) and {业务标志} =《业务标志-股票买入》 and {到账日期}<=@T日# and {入账状态}=《入账状态-未入账》)
 GROUP BY
  {交易组编号},
  {资产账户编号},
  {本币币种}
) c
SET a.{T日当日港股买入金额}=c.{T日当日港股买入金额}
WHERE
   a.{交易组编号} = c.{交易组编号}
AND a.{资产账户编号} = c.{资产账户编号}
AND a.{本币币种} = c.{本币币种}; */
    UPDATE db_pdsecu.tb_pdseca_exgp_capit a,
    (
     SELECT
      -1*sum(occur_amt) AS T_hk_buy_total_amt,
      exch_group_no,
      asset_acco_no,
      crncy_type
     FROM
      db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat
     WHERE
      (exch_no in (3,4) and busi_flag =2001001 and arrive_date<=v_T_date and entry_status="2")
     GROUP BY
      exch_group_no,
      asset_acco_no,
      crncy_type
    ) c
    SET a.T_hk_buy_total_amt=c.T_hk_buy_total_amt
    WHERE
       a.exch_group_no = c.exch_group_no
    AND a.asset_acco_no = c.asset_acco_no
    AND a.crncy_type = c.crncy_type;

    /* UPDATE ~产品证券_资金_交易组资金表^ a,
 (
 SELECT
  sum({变动金额}) AS {T1日当日港股卖出金额},
  {交易组编号},
  {资产账户编号},
  {本币币种}
 FROM
  ~产品证券_资金_资金入账流水计算统计表^
 WHERE
  ({市场编号} in (3,4) and {业务标志} =《业务标志-股票卖出》 and {到账日期}=@T1日# and {港股通资金可用日期} <> 《港股通资金可用日期-T日可用》  and {入账状态}=《入账状态-未入账》)
 GROUP BY
  {交易组编号},
  {资产账户编号},
  {本币币种}
) b
SET a.{T1日当日港股卖出金额} = b.{T1日当日港股卖出金额}
WHERE
  a.{交易组编号} = b.{交易组编号}
AND a.{资产账户编号} = b.{资产账户编号}
AND a.{本币币种} = b.{本币币种}; */
    UPDATE db_pdsecu.tb_pdseca_exgp_capit a,
     (
     SELECT
      sum(occur_amt) AS T1_hk_sell_total_amt,
      exch_group_no,
      asset_acco_no,
      crncy_type
     FROM
      db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat
     WHERE
      (exch_no in (3,4) and busi_flag =2001002 and arrive_date=v_T1_date and hk_cash_avail_date_type <> 1  and entry_status="2")
     GROUP BY
      exch_group_no,
      asset_acco_no,
      crncy_type
    ) b
    SET a.T1_hk_sell_total_amt = b.T1_hk_sell_total_amt
    WHERE
      a.exch_group_no = b.exch_group_no
    AND a.asset_acco_no = b.asset_acco_no
    AND a.crncy_type = b.crncy_type;

    /* UPDATE ~产品证券_资金_交易组资金表^ a,
(
 SELECT
  -1*sum({变动金额}) AS {T1日当日港股买入金额},
  {交易组编号},
  {资产账户编号},
  {本币币种}
 FROM
  ~产品证券_资金_资金入账流水计算统计表^
 WHERE
  ({市场编号} in (3,4) and {业务标志} =《业务标志-股票买入》 and {到账日期}=@T1日# and {入账状态}=《入账状态-未入账》)
 GROUP BY
  {交易组编号},
  {资产账户编号},
  {本币币种}
) c
SET a.{T1日当日港股买入金额}=c.{T1日当日港股买入金额}
WHERE
 a.{交易组编号} = c.{交易组编号}
AND a.{资产账户编号} = c.{资产账户编号}
AND a.{本币币种} = c.{本币币种}; */
    UPDATE db_pdsecu.tb_pdseca_exgp_capit a,
    (
     SELECT
      -1*sum(occur_amt) AS T1_hk_buy_total_amt,
      exch_group_no,
      asset_acco_no,
      crncy_type
     FROM
      db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat
     WHERE
      (exch_no in (3,4) and busi_flag =2001001 and arrive_date=v_T1_date and entry_status="2")
     GROUP BY
      exch_group_no,
      asset_acco_no,
      crncy_type
    ) c
    SET a.T1_hk_buy_total_amt=c.T1_hk_buy_total_amt
    WHERE
     a.exch_group_no = c.exch_group_no
    AND a.asset_acco_no = c.asset_acco_no
    AND a.crncy_type = c.crncy_type;

    /* UPDATE ~产品证券_资金_资产账户资金表^ a,
 (
 SELECT
  sum({变动金额}) AS {T日当日港股卖出金额},
  {资产账户编号},
  {本币币种}
 FROM
  ~产品证券_资金_资金入账流水计算统计表^
 WHERE
  ({市场编号} in (3,4) and {业务标志} =《业务标志-股票卖出》 and {到账日期}<=@T日# and {港股通资金可用日期} <> 《港股通资金可用日期-T日可用》  and {入账状态}=《入账状态-未入账》)
 GROUP BY
  {资产账户编号},
  {本币币种}
) b
SET a.{T日当日港股卖出金额} = b.{T日当日港股卖出金额}
WHERE
 a.{资产账户编号} = b.{资产账户编号}
AND a.{本币币种} = b.{本币币种}; */
    UPDATE db_pdsecu.tb_pdseca_asac_capit a,
     (
     SELECT
      sum(occur_amt) AS T_hk_sell_total_amt,
      asset_acco_no,
      crncy_type
     FROM
      db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat
     WHERE
      (exch_no in (3,4) and busi_flag =2001002 and arrive_date<=v_T_date and hk_cash_avail_date_type <> 1  and entry_status="2")
     GROUP BY
      asset_acco_no,
      crncy_type
    ) b
    SET a.T_hk_sell_total_amt = b.T_hk_sell_total_amt
    WHERE
     a.asset_acco_no = b.asset_acco_no
    AND a.crncy_type = b.crncy_type;

    /* UPDATE ~产品证券_资金_资产账户资金表^ a,
(
 SELECT
  -1*sum({变动金额}) AS {T日当日港股买入金额},
  {资产账户编号},
  {本币币种}
 FROM
  ~产品证券_资金_资金入账流水计算统计表^
 WHERE
  ({市场编号} in (3,4) and {业务标志} =《业务标志-股票买入》 and {到账日期}<=@T日# and {入账状态}=《入账状态-未入账》)
 GROUP BY
  {资产账户编号},
  {本币币种}
) c
SET a.{T日当日港股买入金额}=c.{T日当日港股买入金额}
WHERE
 a.{资产账户编号} = c.{资产账户编号}
AND a.{本币币种} = c.{本币币种}; */
    UPDATE db_pdsecu.tb_pdseca_asac_capit a,
    (
     SELECT
      -1*sum(occur_amt) AS T_hk_buy_total_amt,
      asset_acco_no,
      crncy_type
     FROM
      db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat
     WHERE
      (exch_no in (3,4) and busi_flag =2001001 and arrive_date<=v_T_date and entry_status="2")
     GROUP BY
      asset_acco_no,
      crncy_type
    ) c
    SET a.T_hk_buy_total_amt=c.T_hk_buy_total_amt
    WHERE
     a.asset_acco_no = c.asset_acco_no
    AND a.crncy_type = c.crncy_type;

    /* UPDATE ~产品证券_资金_资产账户资金表^ a,
 (
 SELECT
  sum({变动金额}) AS {T1日当日港股卖出金额},
  {资产账户编号},
  {本币币种}
 FROM
  ~产品证券_资金_资金入账流水计算统计表^
 WHERE
  ({市场编号} in (3,4) and {业务标志} =《业务标志-股票卖出》 and {到账日期}=@T1日# and {港股通资金可用日期} <> 《港股通资金可用日期-T日可用》  and {入账状态}=《入账状态-未入账》)
 GROUP BY
  {资产账户编号},
  {本币币种}
) b
SET a.{T1日当日港股卖出金额} = b.{T1日当日港股卖出金额}
WHERE
 a.{资产账户编号} = b.{资产账户编号}
AND a.{本币币种} = b.{本币币种}; */
    UPDATE db_pdsecu.tb_pdseca_asac_capit a,
     (
     SELECT
      sum(occur_amt) AS T1_hk_sell_total_amt,
      asset_acco_no,
      crncy_type
     FROM
      db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat
     WHERE
      (exch_no in (3,4) and busi_flag =2001002 and arrive_date=v_T1_date and hk_cash_avail_date_type <> 1  and entry_status="2")
     GROUP BY
      asset_acco_no,
      crncy_type
    ) b
    SET a.T1_hk_sell_total_amt = b.T1_hk_sell_total_amt
    WHERE
     a.asset_acco_no = b.asset_acco_no
    AND a.crncy_type = b.crncy_type;

    /* UPDATE ~产品证券_资金_资产账户资金表^ a,
(
 SELECT
  -1*sum({变动金额}) AS {T1日当日港股买入金额},
  {资产账户编号},
  {本币币种}
 FROM
  ~产品证券_资金_资金入账流水计算统计表^
 WHERE
  ({市场编号} in (3,4) and {业务标志} =《业务标志-股票买入》 and {到账日期}=@T1日# and {入账状态}=《入账状态-未入账》)
 GROUP BY
  {资产账户编号},
  {本币币种}
) c
SET a.{T1日当日港股买入金额}=c.{T1日当日港股买入金额}
WHERE
 a.{资产账户编号} = c.{资产账户编号}
AND a.{本币币种} = c.{本币币种}; */
    UPDATE db_pdsecu.tb_pdseca_asac_capit a,
    (
     SELECT
      -1*sum(occur_amt) AS T1_hk_buy_total_amt,
      asset_acco_no,
      crncy_type
     FROM
      db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat
     WHERE
      (exch_no in (3,4) and busi_flag =2001001 and arrive_date=v_T1_date and entry_status="2")
     GROUP BY
      asset_acco_no,
      crncy_type
    ) c
    SET a.T1_hk_buy_total_amt=c.T1_hk_buy_total_amt
    WHERE
     a.asset_acco_no = c.asset_acco_no
    AND a.crncy_type = c.crncy_type;

    /* UPDATE ~产品证券_资金_交易组资金表^ a,
 (
 SELECT
  sum({变动金额}) AS {港股通可用调整金额},
  {交易组编号},
  {资产账户编号},
  {本币币种}
 FROM
  ~产品证券_资金_资金入账流水计算统计表^
  where {入账状态}=《入账状态-未入账》 and {市场编号}<>5
 GROUP BY
  {交易组编号},
  {资产账户编号},
  {本币币种}
) b
SET a.{港股通可用调整金额} = b.{港股通可用调整金额}
WHERE
  a.{交易组编号} = b.{交易组编号}
AND a.{资产账户编号} = b.{资产账户编号}
AND a.{本币币种} = b.{本币币种}; */
    UPDATE db_pdsecu.tb_pdseca_exgp_capit a,
     (
     SELECT
      sum(occur_amt) AS hk_avail_change_amt,
      exch_group_no,
      asset_acco_no,
      crncy_type
     FROM
      db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat
      where entry_status="2" and exch_no<>5
     GROUP BY
      exch_group_no,
      asset_acco_no,
      crncy_type
    ) b
    SET a.hk_avail_change_amt = b.hk_avail_change_amt
    WHERE
      a.exch_group_no = b.exch_group_no
    AND a.asset_acco_no = b.asset_acco_no
    AND a.crncy_type = b.crncy_type;

    /* UPDATE ~产品证券_资金_资产账户资金表^ a,
 (
 SELECT
  sum({变动金额}) AS {港股通可用调整金额},
  {资产账户编号},
  {本币币种}
 FROM
  ~产品证券_资金_资金入账流水计算统计表^
    where {入账状态}=《入账状态-未入账》 and {市场编号}<>5
 GROUP BY
  {资产账户编号},
  {本币币种}
) b
SET a.{港股通可用调整金额} = b.{港股通可用调整金额}
WHERE
 a.{资产账户编号} = b.{资产账户编号}
AND a.{本币币种} = b.{本币币种}; */
    UPDATE db_pdsecu.tb_pdseca_asac_capit a,
     (
     SELECT
      sum(occur_amt) AS hk_avail_change_amt,
      asset_acco_no,
      crncy_type
     FROM
      db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat
        where entry_status="2" and exch_no<>5
     GROUP BY
      asset_acco_no,
      crncy_type
    ) b
    SET a.hk_avail_change_amt = b.hk_avail_change_amt
    WHERE
     a.asset_acco_no = b.asset_acco_no
    AND a.crncy_type = b.crncy_type;

    /* [更新表记录][产品证券_资金_交易组资金表][{待交收金额}={港股通可用调整金额}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_settle_amt=hk_avail_change_amt where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.14.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资产账户资金表][{待交收金额}={港股通可用调整金额}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_settle_amt=hk_avail_change_amt where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.14.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_交易组持仓表][{待交收数量}=0][1=1][2][""] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_settle_qty=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.14.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("","#",v_mysql_message);
        else
            SET v_error_info = "";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_资产账户持仓表][{待交收数量}=0][1=1][2][""] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_settle_qty=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.14.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("","#",v_mysql_message);
        else
            SET v_error_info = "";
        end if;
        leave label_pro;
    end if;


    /* UPDATE ~产品证券_持仓_交易组持仓表^ a,
 (
 SELECT
  sum({变动数量}) AS {待交收数量},
  {交易组编号},
  {资产账户编号},
  {证券代码编号},
  {股东代码编号}
 FROM
  ~产品证券_持仓_交易组持仓入账流水表^
 WHERE
 {到账日期}>@初始化日期# and {入账状态}=《入账状态-未入账》 and ({业务标志}<>《业务标志-红股登记》 and {业务标志}<>《业务标志-公司行为配股》) and {市场编号}<>5
 GROUP BY
  {交易组编号},
  {资产账户编号},
  {证券代码编号},
  {股东代码编号}
) b
SET a.{待交收数量} = b.{待交收数量}
WHERE
  a.{交易组编号} = b.{交易组编号}
AND a.{资产账户编号} = b.{资产账户编号}
AND a.{投资类型} = 1
AND a.{证券代码编号} = b.{证券代码编号}
AND a.{股东代码编号} = b.{股东代码编号}; */
    UPDATE db_pdsecu.tb_pdsepo_exgp_posi a,
     (
     SELECT
      sum(occur_qty) AS pre_settle_qty,
      exch_group_no,
      asset_acco_no,
      stock_code_no,
      stock_acco_no
     FROM
      db_pdsecu.tb_pdsepo_exgp_posi_entry_jour
     WHERE
     arrive_date>v_init_date and entry_status="2" and (busi_flag<>2001014 and busi_flag<>2001028) and exch_no<>5
     GROUP BY
      exch_group_no,
      asset_acco_no,
      stock_code_no,
      stock_acco_no
    ) b
    SET a.pre_settle_qty = b.pre_settle_qty
    WHERE
      a.exch_group_no = b.exch_group_no
    AND a.asset_acco_no = b.asset_acco_no
    AND a.invest_type = 1
    AND a.stock_code_no = b.stock_code_no
    AND a.stock_acco_no = b.stock_acco_no;

    /* UPDATE ~产品证券_持仓_资产账户持仓表^ a,
 (
 SELECT
  sum({变动数量}) AS {待交收数量},
  {资产账户编号},
  {证券代码编号},
  {股东代码编号}
 FROM
  ~产品证券_持仓_资产账户持仓入账流水表^
 WHERE
 {到账日期}>@初始化日期# and {入账状态}=《入账状态-未入账》 and ({业务标志}<>《业务标志-红股登记》 and {业务标志}<>《业务标志-公司行为配股》) and {市场编号}<>5
 GROUP BY
  {资产账户编号},
  {证券代码编号},
  {股东代码编号}
) b
SET a.{待交收数量} = b.{待交收数量}
WHERE
 a.{资产账户编号} = b.{资产账户编号}
AND a.{投资类型} = 1
AND a.{证券代码编号} = b.{证券代码编号}
AND a.{股东代码编号} = b.{股东代码编号}; */
    UPDATE db_pdsecu.tb_pdsepo_asac_posi a,
     (
     SELECT
      sum(occur_qty) AS pre_settle_qty,
      asset_acco_no,
      stock_code_no,
      stock_acco_no
     FROM
      db_pdsecu.tb_pdsepo_asac_posi_entry_jour
     WHERE
     arrive_date>v_init_date and entry_status="2" and (busi_flag<>2001014 and busi_flag<>2001028) and exch_no<>5
     GROUP BY
      asset_acco_no,
      stock_code_no,
      stock_acco_no
    ) b
    SET a.pre_settle_qty = b.pre_settle_qty
    WHERE
     a.asset_acco_no = b.asset_acco_no
    AND a.invest_type = 1
    AND a.stock_code_no = b.stock_code_no
    AND a.stock_acco_no = b.stock_acco_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户运维_更新港股通待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseacbk_UpdateHKPreEntryRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseacbk_UpdateHKPreEntryRecord(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_T1_settle_date int,
    IN p_T2_settle_date int,
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
    declare v_T1_settle_date int;
    declare v_T2_settle_date int;
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
    SET v_T1_settle_date = p_T1_settle_date;
    SET v_T2_settle_date = p_T2_settle_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_资金_资金入账流水表][{到账日期}=@T2交收日期#][{到账日期}=@T1交收日期# and {入账状态}=《入账状态-未入账》 and (({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》))][2][@T2交收日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_capit_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, arrive_date=v_T2_settle_date where arrive_date=v_T1_settle_date and entry_status="2" and ((exch_no=3 or exch_no=4) and (busi_flag=2001001 or busi_flag=2001002));
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.15.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("T2交收日期=",v_T2_settle_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("T2交收日期=",v_T2_settle_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资金入账流水表][{到账日期}=@T1交收日期#][{到账日期}=@初始化日期# and {入账状态}=《入账状态-未入账》 and (({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》))][2][@T2交收日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_capit_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, arrive_date=v_T1_settle_date where arrive_date=v_init_date and entry_status="2" and ((exch_no=3 or exch_no=4) and (busi_flag=2001001 or busi_flag=2001002));
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.15.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("T2交收日期=",v_T2_settle_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("T2交收日期=",v_T2_settle_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_交易组持仓入账流水表][{到账日期}=@T2交收日期#][{到账日期}=@T1交收日期# and {入账状态}=《入账状态-未入账》 and (({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》))][2][@T2交收日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, arrive_date=v_T2_settle_date where arrive_date=v_T1_settle_date and entry_status="2" and ((exch_no=3 or exch_no=4) and (busi_flag=2001001 or busi_flag=2001002));
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.15.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("T2交收日期=",v_T2_settle_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("T2交收日期=",v_T2_settle_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_交易组持仓入账流水表][{到账日期}=@T1交收日期#][{到账日期}=@初始化日期# and {入账状态}=《入账状态-未入账》 and (({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》))][2][@T2交收日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, arrive_date=v_T1_settle_date where arrive_date=v_init_date and entry_status="2" and ((exch_no=3 or exch_no=4) and (busi_flag=2001001 or busi_flag=2001002));
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.15.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("T2交收日期=",v_T2_settle_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("T2交收日期=",v_T2_settle_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_资产账户持仓入账流水表][{到账日期}=@T2交收日期#][{到账日期}=@T1交收日期# and {入账状态}=《入账状态-未入账》 and (({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》))][2][@T2交收日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, arrive_date=v_T2_settle_date where arrive_date=v_T1_settle_date and entry_status="2" and ((exch_no=3 or exch_no=4) and (busi_flag=2001001 or busi_flag=2001002));
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.15.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("T2交收日期=",v_T2_settle_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("T2交收日期=",v_T2_settle_date);
        end if;
        leave label_pro;
    end if;

    #[更新表记录][产品证券_持仓_资产账户持仓入账流水表][{到账日期}=@T1交收日期#][{到账日期}=@初始化日期# and {入账状态}=《入账状态-未入账》 and (({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》)) and {到账日期}={原到账日期}][2][@T2交收日期#]

    /* [更新表记录][产品证券_持仓_资产账户持仓入账流水表][{到账日期}=@T1交收日期#][{到账日期}=@初始化日期# and {入账状态}=《入账状态-未入账》 and (({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》))][2][@T2交收日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, arrive_date=v_T1_settle_date where arrive_date=v_init_date and entry_status="2" and ((exch_no=3 or exch_no=4) and (busi_flag=2001001 or busi_flag=2001002));
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.15.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("T2交收日期=",v_T2_settle_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("T2交收日期=",v_T2_settle_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户运维_更新持仓期初
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseacbk_UpdatePosiBegin;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseacbk_UpdatePosiBegin(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_持仓_交易组持仓表][{期初数量}={当前数量}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty=curr_qty where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.16.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_资产账户持仓表][{期初数量}={当前数量}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty=curr_qty where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.16.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资产账户资金表][{期初金额}={当前金额}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt=curr_amt where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.16.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_交易组资金表][{期初金额}={当前金额}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt=curr_amt where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.16.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_交易组持仓表][{成本金额}=0,{利息成本金额}=0,{实现盈亏}=0][{当前数量}+{待交收数量}+{持仓核对差额}=0 and {机构编号}<>0 and {产品编号}<>0 and {市场编号}<>0][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cost_amt=0,intrst_cost_amt=0,realize_pandl=0 where curr_qty+pre_settle_qty+posi_qty_check_diff=0 and co_no<>0 and pd_no<>0 and exch_no<>0;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.16.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_资产账户持仓表][{成本金额}=0,{利息成本金额}=0,{实现盈亏}=0][{当前数量}+{待交收数量}+{持仓核对差额}=0 and {机构编号}<>0 and {产品编号}<>0 and {市场编号}<>0][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cost_amt=0,intrst_cost_amt=0,realize_pandl=0 where curr_qty+pre_settle_qty+posi_qty_check_diff=0 and co_no<>0 and pd_no<>0 and exch_no<>0;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.16.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资金入账流水表][{入账状态}=《入账状态-已入账》][({业务标志} = 2004001 or {业务标志} = 2004002) and {到账日期}<=@初始化日期#][2][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_capit_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="1" where (busi_flag = 2004001 or busi_flag = 2004002) and arrive_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.16.2";
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
use db_pdsecu;;

# 原子_产品证券_账户运维_初始化更新可用资金调整金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseacbk_InitUpdateCashAvailAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseacbk_InitUpdateCashAvailAmt(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_资金_交易组资金表][{待交收金额}=0,{沪深可用调整金额}=0,{港股通可用调整金额}=0][1=1][2][""] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_settle_amt=0,shsz_avail_change_amt=0,hk_avail_change_amt=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.17.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("","#",v_mysql_message);
        else
            SET v_error_info = "";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资产账户资金表][{待交收金额}=0,{沪深可用调整金额}=0,{港股通可用调整金额}=0][1=1][2][""] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_settle_amt=0,shsz_avail_change_amt=0,hk_avail_change_amt=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.17.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("","#",v_mysql_message);
        else
            SET v_error_info = "";
        end if;
        leave label_pro;
    end if;

    #对交易组资金表进行操作

    /* UPDATE ~产品证券_资金_交易组资金表^ a,
 (
 SELECT
  sum({变动金额}) AS {沪深可用调整金额},
  {交易组编号},
  {资产账户编号},
  {本币币种}
 FROM
  ~产品证券_资金_资金入账流水计算统计表^
 WHERE
  {业务标志} in (《业务标志-融资回购到期》,《业务标志-融券回购到期》) 
 GROUP BY
  {交易组编号},
  {资产账户编号},
  {本币币种}
) b
SET a.{沪深可用调整金额} = a.{沪深可用调整金额} + b.{沪深可用调整金额}
WHERE
  a.{交易组编号} = b.{交易组编号}
AND a.{资产账户编号} = b.{资产账户编号}
AND a.{本币币种} = b.{本币币种}; */
    UPDATE db_pdsecu.tb_pdseca_exgp_capit a,
     (
     SELECT
      sum(occur_amt) AS shsz_avail_change_amt,
      exch_group_no,
      asset_acco_no,
      crncy_type
     FROM
      db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat
     WHERE
      busi_flag in (2004003,2004004) 
     GROUP BY
      exch_group_no,
      asset_acco_no,
      crncy_type
    ) b
    SET a.shsz_avail_change_amt = a.shsz_avail_change_amt + b.shsz_avail_change_amt
    WHERE
      a.exch_group_no = b.exch_group_no
    AND a.asset_acco_no = b.asset_acco_no
    AND a.crncy_type = b.crncy_type;

    /* UPDATE ~产品证券_资金_交易组资金表^ a,
 (
 SELECT
  sum({变动金额}) AS {港股通可用调整金额},
  {交易组编号},
  {资产账户编号},
  {本币币种}
 FROM
  ~产品证券_资金_资金入账流水计算统计表^
 where  {市场编号}<>5
  GROUP BY
  {交易组编号},
  {资产账户编号},
  {本币币种}
) b
SET a.{港股通可用调整金额} = b.{港股通可用调整金额} 
WHERE
  a.{交易组编号} = b.{交易组编号}
AND a.{资产账户编号} = b.{资产账户编号}
AND a.{本币币种} = b.{本币币种}; */
    UPDATE db_pdsecu.tb_pdseca_exgp_capit a,
     (
     SELECT
      sum(occur_amt) AS hk_avail_change_amt,
      exch_group_no,
      asset_acco_no,
      crncy_type
     FROM
      db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat
     where  exch_no<>5
      GROUP BY
      exch_group_no,
      asset_acco_no,
      crncy_type
    ) b
    SET a.hk_avail_change_amt = b.hk_avail_change_amt 
    WHERE
      a.exch_group_no = b.exch_group_no
    AND a.asset_acco_no = b.asset_acco_no
    AND a.crncy_type = b.crncy_type;
    #对资产账户资金表进行操作

    /* UPDATE ~产品证券_资金_资产账户资金表^ a,
 (
 SELECT
  sum({变动金额}) AS {沪深可用调整金额},
  {资产账户编号},
  {本币币种}
 FROM
  ~产品证券_资金_资金入账流水计算统计表^
 WHERE
  {业务标志} in (《业务标志-融资回购到期》,《业务标志-融券回购到期》) 
 GROUP BY
  {资产账户编号},
  {本币币种}
) b
SET a.{沪深可用调整金额} =a.{沪深可用调整金额} + b.{沪深可用调整金额}
WHERE
  a.{资产账户编号} = b.{资产账户编号}
AND a.{本币币种} = b.{本币币种}; */
    UPDATE db_pdsecu.tb_pdseca_asac_capit a,
     (
     SELECT
      sum(occur_amt) AS shsz_avail_change_amt,
      asset_acco_no,
      crncy_type
     FROM
      db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat
     WHERE
      busi_flag in (2004003,2004004) 
     GROUP BY
      asset_acco_no,
      crncy_type
    ) b
    SET a.shsz_avail_change_amt =a.shsz_avail_change_amt + b.shsz_avail_change_amt
    WHERE
      a.asset_acco_no = b.asset_acco_no
    AND a.crncy_type = b.crncy_type;

    /* UPDATE ~产品证券_资金_资产账户资金表^ a,
 (
 SELECT
  sum({变动金额}) AS {港股通可用调整金额},
  {资产账户编号},
  {本币币种}
 FROM
  ~产品证券_资金_资金入账流水计算统计表^
 where  {市场编号}<>5
  GROUP BY
  {资产账户编号},
  {本币币种}
) b
SET a.{港股通可用调整金额} = b.{港股通可用调整金额}
WHERE
 a.{资产账户编号} = b.{资产账户编号}
AND a.{本币币种} = b.{本币币种}; */
    UPDATE db_pdsecu.tb_pdseca_asac_capit a,
     (
     SELECT
      sum(occur_amt) AS hk_avail_change_amt,
      asset_acco_no,
      crncy_type
     FROM
      db_pdsecu.tb_pdseca_capit_entry_jour_calc_stat
     where  exch_no<>5
      GROUP BY
      asset_acco_no,
      crncy_type
    ) b
    SET a.hk_avail_change_amt = b.hk_avail_change_amt
    WHERE
     a.asset_acco_no = b.asset_acco_no
    AND a.crncy_type = b.crncy_type;

    /* [更新表记录][产品证券_资金_交易组资金表][{待交收金额}={港股通可用调整金额}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_settle_amt=hk_avail_change_amt where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.17.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资产账户资金表][{待交收金额}={港股通可用调整金额}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_settle_amt=hk_avail_change_amt where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.17.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户运维_更新行情汇率表汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseacbk_UpdateQuoteRate;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseacbk_UpdateQuoteRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sh_hk_settle_buy_rate decimal(18,12),
    IN p_sh_hk_settle_sell_rate decimal(18,12),
    IN p_sz_hk_settle_buy_rate decimal(18,12),
    IN p_sz_hksettle_sell_rate decimal(18,12),
    IN p_pboc_rate decimal(18,12),
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
    declare v_sh_hk_settle_buy_rate decimal(18,12);
    declare v_sh_hk_settle_sell_rate decimal(18,12);
    declare v_sz_hk_settle_buy_rate decimal(18,12);
    declare v_sz_hksettle_sell_rate decimal(18,12);
    declare v_pboc_rate decimal(18,12);
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
    SET v_sh_hk_settle_buy_rate = p_sh_hk_settle_buy_rate;
    SET v_sh_hk_settle_sell_rate = p_sh_hk_settle_sell_rate;
    SET v_sz_hk_settle_buy_rate = p_sz_hk_settle_buy_rate;
    SET v_sz_hksettle_sell_rate = p_sz_hksettle_sell_rate;
    SET v_pboc_rate = p_pboc_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_持仓_证券代码信息行情汇率表][{买入结算汇率}=@沪港通买入结算汇率#,{卖出结算汇率}=@沪港通卖出结算汇率#,{中国人行汇率}=@中国人行汇率#][{证券代码编号}<>0 and {市场编号}=3][2]["更新沪港通信息行情汇率表报错 !"] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_stock_code_info_quot_rate set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, settle_buy_rate=v_sh_hk_settle_buy_rate,settle_sell_rate=v_sh_hk_settle_sell_rate,pboc_rate=v_pboc_rate where stock_code_no<>0 and exch_no=3;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.18.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("更新沪港通信息行情汇率表报错 !","#",v_mysql_message);
        else
            SET v_error_info = "更新沪港通信息行情汇率表报错 !";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_证券代码信息行情汇率表][{买入结算汇率}=@深港通买入结算汇率#,{卖出结算汇率}=@深港通卖出结算汇率#,{中国人行汇率}=@中国人行汇率#][{证券代码编号}<>0 and {市场编号}=4][2]["更新深港通信息行情汇率表报错 !"] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_stock_code_info_quot_rate set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, settle_buy_rate=v_sz_hk_settle_buy_rate,settle_sell_rate=v_sz_hksettle_sell_rate,pboc_rate=v_pboc_rate where stock_code_no<>0 and exch_no=4;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.18.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("更新深港通信息行情汇率表报错 !","#",v_mysql_message);
        else
            SET v_error_info = "更新深港通信息行情汇率表报错 !";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户运维_更新产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseacbk_UpdatePdInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseacbk_UpdatePdInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_busi_config_str varchar(64),
    IN p_pd_status varchar(2),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_busi_config_str varchar(64);
    declare v_pd_status varchar(2);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_busi_config_str = p_busi_config_str;
    SET v_pd_status = p_pd_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][产品证券_账户_产品信息表][字段][字段变量][2][@机构编号#,@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_pd_info(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        busi_config_str, pd_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_busi_config_str, v_pd_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.19.2";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户运维_清空产品表数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseacbk_ClearPdInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseacbk_ClearPdInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [清空表记录][产品证券_账户_产品信息表] */
    truncate table db_pdsecu.tb_pdseca_pd_info;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户运维_处理大宗交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseacbk_DealBlockTradePosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseacbk_DealBlockTradePosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_posi_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_stock_type int,
    IN p_asset_type int,
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
    declare v_posi_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_cost_amt decimal(18,4);
    declare v_curr_qty decimal(18,2);
    declare v_invest_type int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_end_qty decimal(18,2);
    declare v_tmp_cost_amt decimal(18,4);
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;

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
    SET v_posi_id = p_posi_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_cost_amt = 0;
    SET v_curr_qty = 0;
    SET v_invest_type = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_occur_qty = 0;
    SET v_occur_end_qty = 0;
    SET v_tmp_cost_amt = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;

    
    label_pro:BEGIN
    

    /* set @期初数量#=0; */
    set v_begin_qty=0;

    /* set @待交收数量#=0; */
    set v_pre_settle_qty=0;

    /* set @冻结数量#=0; */
    set v_frozen_qty=0;

    /* set @解冻数量#=0; */
    set v_unfroz_qty=0;

    /* set @持仓核对差额#=0; */
    set v_posi_qty_check_diff=0;

    /* set @实现盈亏#=0; */
    set v_realize_pandl=0;

    /* set @利息成本金额#=0; */
    set v_intrst_cost_amt=0;

    /* set @利息收益#=0; */
    set v_intrst_pandl=0;

    /* set @操作菜单#=@菜单编号#; */
    set v_oper_menu_no=v_menu_no;

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* set @操作备注#="锁定期结束大宗交易影响持仓 !"; */
    set v_oper_remark_info="锁定期结束大宗交易影响持仓 !";

    /* [获取流水变动][{成本金额}][@成本金额#] */
    set v_jour_occur_field = concat("成本金额","|");
    set v_jour_occur_info = concat(v_cost_amt,"|");


    /* set @当前数量#=@成交数量#; */
    set v_curr_qty=v_strike_qty;

    /* set @成本金额#=@成交数量#*@成交价格#; */
    set v_cost_amt=v_strike_qty*v_strike_price;
    #对应二级市场非大宗交易项当前数量和成本金额增加,大宗交易对应的数量和金额减少
    #非大宗交易的处理

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{当前数量}={当前数量}+@当前数量#,{成本金额}={成本金额}+@成本金额#][1][@交易组编号#,@资产账户编号#,@证券代码编号#,@投资类型#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=curr_qty+v_curr_qty,cost_amt=cost_amt+v_cost_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* set @变动数量#=@成交数量#; */
    set v_occur_qty=v_strike_qty;

    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量},{成本金额}][@变动后数量#,@临时_成本金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#,@资产账户编号#,@证券代码编号#,@投资类型#] */
    select curr_qty,cost_amt into v_occur_end_qty,v_tmp_cost_amt from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.7.21.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@临时_成本金额#] */
    set v_jour_after_occur_info = concat(v_tmp_cost_amt,"|");


    /* set @业务标志# = 《业务标志-持仓蓝补》; */
    set v_busi_flag = 1103002;

    /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#] */
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
                
        SET v_error_code = "pdsecuA.7.21.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [插入重复更新][产品证券_持仓_资产账户持仓表][字段][字段变量][{当前数量}={当前数量}+@当前数量#,{成本金额}={成本金额}+@成本金额#][1][@资产账户编号#,@证券代码编号#,@投资类型#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=curr_qty+v_curr_qty,cost_amt=cost_amt+v_cost_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{当前数量},{成本金额}][@变动后数量#,@临时_成本金额#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#,@证券代码编号#,@投资类型#] */
    select curr_qty,cost_amt into v_occur_end_qty,v_tmp_cost_amt from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.7.21.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@临时_成本金额#] */
    set v_jour_after_occur_info = concat(v_tmp_cost_amt,"|");


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
                
        SET v_error_code = "pdsecuA.7.21.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #大宗交易的处理

    /* set @投资类型#=3; */
    set v_invest_type=3;

    /* [更新表记录][产品证券_持仓_交易组持仓表][{当前数量}={当前数量}-@当前数量#,{成本金额}={成本金额}-@成本金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty-v_curr_qty,cost_amt=cost_amt-v_cost_amt where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.21.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量},{成本金额}][@变动后数量#,@临时_成本金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#,@资产账户编号#,@证券代码编号#,@投资类型#] */
    select curr_qty,cost_amt into v_occur_end_qty,v_tmp_cost_amt from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.7.21.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@临时_成本金额#] */
    set v_jour_after_occur_info = concat(v_tmp_cost_amt,"|");


    /* set @变动数量#=-1*@成交数量#; */
    set v_occur_qty=-1*v_strike_qty;

    /* set @业务标志# = 《业务标志-持仓红冲》; */
    set v_busi_flag = 1103001;

    /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#] */
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
                
        SET v_error_code = "pdsecuA.7.21.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_资产账户持仓表][{当前数量}={当前数量}-@当前数量#,{成本金额}={成本金额}-@成本金额#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][2][@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty-v_curr_qty,cost_amt=cost_amt-v_cost_amt where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.21.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{当前数量},{成本金额}][@变动后数量#,@临时_成本金额#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#,@证券代码编号#,@投资类型#] */
    select curr_qty,cost_amt into v_occur_end_qty,v_tmp_cost_amt from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.7.21.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@临时_成本金额#] */
    set v_jour_after_occur_info = concat(v_tmp_cost_amt,"|");


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
                
        SET v_error_code = "pdsecuA.7.21.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #将要处理的大宗交易持仓数据处理状态置为成功

    /* [更新表记录][产品证券_持仓_大宗交易持仓表][{处理状态}="1"][{持仓序号}=@持仓序号#][2][@持仓序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_block_trade_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_status="1" where posi_id=v_posi_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.21.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("持仓序号=",v_posi_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("持仓序号=",v_posi_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户运维_查询大宗交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseacbk_QueryBlockTradePosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseacbk_QueryBlockTradePosi(
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
    declare v_row_count int;

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
    SET v_row_count = -1;

    
    label_pro:BEGIN
    
    #取大宗交易持仓表中解禁日期为上个交易日期且处理状态为未处理的数据

    /* set @指定行数#=-1; */
    set v_row_count=-1;

    /* [获取表记录][产品证券_持仓_大宗交易持仓表][字段][{解禁日期}<@初始化日期# and {处理状态}="0" and {持仓序号}>0][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, posi_id, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, strike_qty, 
        strike_price, fair_price, strike_date, release_date, 
        deal_status from db_pdsecu.tb_pdsepo_block_trade_posi where release_date<v_init_date and deal_status="0" and posi_id>0;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, posi_id, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, strike_qty, 
        strike_price, fair_price, strike_date, release_date, 
        deal_status from db_pdsecu.tb_pdsepo_block_trade_posi where release_date<v_init_date and deal_status="0" and posi_id>0 limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户运维_更新证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseacbk_UpdateStockCodeInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseacbk_UpdateStockCodeInfo(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* replace into ~产品证券_持仓_证券代码信息行情汇率表^ ({记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{市场编号},{证券代码编号},{证券类型},{资产类型},{本币币种},{最新价},{公允价格},{净价标志},{债券计提利息},{买入结算汇率},{卖出结算汇率},{中国人行汇率}) */
    replace into db_pdsecu.tb_pdsepo_stock_code_info_quot_rate (row_id,create_date,create_time,update_date,update_time,update_times,exch_no,stock_code_no,stock_type,asset_type,crncy_type,last_price,fair_price,net_price_flag,bond_accr_intrst,settle_buy_rate,settle_sell_rate,pboc_rate)
    select

           /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段1#,",",help_topic_id+1),",",-1) AS {记录序号}, */
           SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field1,",",help_topic_id+1),",",-1) AS row_id,

           /* date_format(curdate(),'%Y%m%d') AS {创建日期}, */
           date_format(curdate(),'%Y%m%d') AS create_date,

           /* date_format(curtime(),'%H%i%s') AS   {创建时间}, */
           date_format(curtime(),'%H%i%s') AS   create_time,

           /* date_format(curdate(),'%Y%m%d') AS {更新日期}, */
           date_format(curdate(),'%Y%m%d') AS update_date,

           /* date_format(curtime(),'%H%i%s') AS   {更新时间}, */
           date_format(curtime(),'%H%i%s') AS   update_time,

           /* 1 AS {更新次数}, */
           1 AS update_times,

           /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段2#,",",help_topic_id+1),",",-1) AS {市场编号}, */
           SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field2,",",help_topic_id+1),",",-1) AS exch_no,

           /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段3#,",",help_topic_id+1),",",-1) AS {证券代码编号}, */
           SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field3,",",help_topic_id+1),",",-1) AS stock_code_no,

           /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段4#,",",help_topic_id+1),",",-1) AS {证券类型}, */
           SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field4,",",help_topic_id+1),",",-1) AS stock_type,

           /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段5#,",",help_topic_id+1),",",-1) AS {资产类型}, */
           SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field5,",",help_topic_id+1),",",-1) AS asset_type,

           /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段6#,",",help_topic_id+1),",",-1) AS {本币币种}, */
           SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field6,",",help_topic_id+1),",",-1) AS crncy_type,

           /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段7#,",",help_topic_id+1),",",-1) AS {最新价}, */
           SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field7,",",help_topic_id+1),",",-1) AS last_price,

           /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段8#,",",help_topic_id+1),",",-1) AS {公允价格}, */
           SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field8,",",help_topic_id+1),",",-1) AS fair_price,

           /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段9#,",",help_topic_id+1),",",-1) AS {净价标志}, */
           SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field9,",",help_topic_id+1),",",-1) AS net_price_flag,

           /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段10#,",",help_topic_id+1),",",-1) AS {债券计提利息}, */
           SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field10,",",help_topic_id+1),",",-1) AS bond_accr_intrst,

           /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段11#,",",help_topic_id+1),",",-1) AS {买入结算汇率}, */
           SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field11,",",help_topic_id+1),",",-1) AS settle_buy_rate,

           /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段12#,",",help_topic_id+1),",",-1) AS {卖出结算汇率}, */
           SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field12,",",help_topic_id+1),",",-1) AS settle_sell_rate,

           /* SUBSTRING_INDEX(SUBSTRING_INDEX(@同步字段13#,",",help_topic_id+1),",",-1) AS {中国人行汇率} */
           SUBSTRING_INDEX(SUBSTRING_INDEX(v_sync_field13,",",help_topic_id+1),",",-1) AS pboc_rate
    FROM mysql.help_topic

    /* WHERE  LENGTH(@同步字段1#) > 0 and (help_topic_id < LENGTH(@同步字段1#)-LENGTH(REPLACE(@同步字段1#,",",""))+1); */
    WHERE  LENGTH(v_sync_field1) > 0 and (help_topic_id < LENGTH(v_sync_field1)-LENGTH(REPLACE(v_sync_field1,",",""))+1);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户运维_重置计算资产所需最新价
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseacbk_ResetLastPriceToCalcAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseacbk_ResetLastPriceToCalcAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_quot_calc_unit decimal(16,9),
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
    declare v_stock_code_no int;
    declare v_quot_calc_unit decimal(16,9);
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_quot_calc_unit = p_quot_calc_unit;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_持仓_证券代码信息行情汇率表][{最新价}={最新价}/@行情计算单位#][{证券代码编号}=@证券代码编号#][2][@证券代码编号#,@行情计算单位#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_stock_code_info_quot_rate set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, last_price=last_price/v_quot_calc_unit where stock_code_no=v_stock_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.7.24.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no,",","行情计算单位=",v_quot_calc_unit),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no,",","行情计算单位=",v_quot_calc_unit);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_账户运维_清除当日上市的申购代码持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseacbk_ClearBeginTradeAppStockPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseacbk_ClearBeginTradeAppStockPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_menu_no int,
    IN p_stock_code_no_str varchar(4096),
    IN p_trade_code_no_str varchar(4096),
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
    declare v_menu_no int;
    declare v_stock_code_no_str varchar(4096);
    declare v_trade_code_no_str varchar(4096);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_invest_type int;
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_tmp_stock_code_no int;
    declare v_trade_code_no int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_qty decimal(18,2);
    declare v_occur_end_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_menu_no = p_menu_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_trade_code_no_str = p_trade_code_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_invest_type = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_tmp_stock_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_jour_after_occur_info = " ";
    SET v_occur_qty = 0;
    SET v_occur_end_qty = 0;
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [检查正常返回][@证券代码编号串#="; ;"] */
    if v_stock_code_no_str="; ;" then
        leave label_pro;
    end if;

    #同等长度才可正确截取申购代码 对应的 上市代码

    /* [检查报错返回][length(@证券代码编号串#)<>length(@交易代码编号串#)][1][concat("申购代码编号串:",@证券代码编号串#," 与 上市代码编号串:",@交易代码编号串#,"长度不一致！")] */
    if length(v_stock_code_no_str)<>length(v_trade_code_no_str) then
        
        SET v_error_code = "pdsecuA.7.25.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("申购代码编号串:",v_stock_code_no_str," 与 上市代码编号串:",v_trade_code_no_str,"长度不一致！"),"#",v_mysql_message);
        else
            SET v_error_info = concat("申购代码编号串:",v_stock_code_no_str," 与 上市代码编号串:",v_trade_code_no_str,"长度不一致！");
        end if;
        leave label_pro;
    end if;

    #交易组持仓，申购代码改上市代码

    /* [声明游标][产品证券_持仓_交易组持仓表][字段][instr(@证券代码编号串#,concat(";",{证券代码编号},";"))>0][cursor_exgpposi] */
    cursor_exgpposi:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_exgpposi CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        invest_type, begin_qty, curr_qty, pre_settle_qty, 
        frozen_qty, unfroz_qty, posi_qty_check_diff, cost_amt, 
        realize_pandl, intrst_cost_amt, intrst_pandl 
        from db_pdsecu.tb_pdsepo_exgp_posi 
        where instr(v_stock_code_no_str,concat(";",stock_code_no,";"))>0;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_exgpposi][loop_exgpposi] */
    open cursor_exgpposi;
    loop_exgpposi: LOOP
    fetch cursor_exgpposi into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_type, v_asset_type, 
        v_invest_type, v_begin_qty, v_curr_qty, v_pre_settle_qty, 
        v_frozen_qty, v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, 
        v_realize_pandl, v_intrst_cost_amt, v_intrst_pandl;
        IF v_cursor_done THEN
            LEAVE loop_exgpposi;
        END IF;


              /* set @临时_证券代码编号# = @证券代码编号#; */
              set v_tmp_stock_code_no = v_stock_code_no;

              /* set @交易代码编号#=cast(substring_index(substring(@交易代码编号串#,locate(concat(";",@证券代码编号#,";"),@证券代码编号串#)+1),";",1) as SIGNED); */
              set v_trade_code_no=cast(substring_index(substring(v_trade_code_no_str,locate(concat(";",v_stock_code_no,";"),v_stock_code_no_str)+1),";",1) as SIGNED);

              /* [获取流水变动][{当前数量},{成本金额},{实现盈亏},{持仓核对差额}][@当前数量#,@成本金额#,@实现盈亏#,@持仓核对差额#] */
              set v_jour_occur_field = concat("当前数量","|","成本金额","|","实现盈亏","|","持仓核对差额","|");
              set v_jour_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_posi_qty_check_diff,"|");

              #[更新表记录][产品证券_持仓_交易组持仓表][{期初数量}=0,{当前数量}=0,{待交收数量}=0,{冻结数量}=0,{解冻数量}=0,{成本金额}=0,{实现盈亏}=0,{利息成本金额}=0,{利息收益}=0][{记录序号}=@记录序号#][2][@记录序号#]

              /* [更新表记录][产品证券_持仓_交易组持仓表][{证券代码编号}=@交易代码编号#][{记录序号}=@记录序号#][2][@记录序号#] */
              set v_update_date = date_format(curdate(),'%Y%m%d');
              set v_update_time = date_format(curtime(),'%H%i%s');
              update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_code_no=v_trade_code_no where row_id=v_row_id;
              if v_error_code = "1" then
                          
                  SET v_error_code = "pdsecuA.7.25.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("记录序号=",v_row_id);
                  end if;
                  close cursor_exgpposi;
                  leave label_pro;
              end if;


              /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量},{成本金额},{实现盈亏},{持仓核对差额}][@当前数量#,@成本金额#,@实现盈亏#,@持仓核对差额#][{记录序号}=@记录序号#][4][@记录序号#] */
              select curr_qty,cost_amt,realize_pandl,posi_qty_check_diff into v_curr_qty,v_cost_amt,v_realize_pandl,v_posi_qty_check_diff from db_pdsecu.tb_pdsepo_exgp_posi where row_id=v_row_id limit 1;
              if FOUND_ROWS() = 0 then
                          
                  SET v_error_code = "pdsecuA.7.25.4";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("记录序号=",v_row_id);
                  end if;
                  close cursor_exgpposi;
                  leave label_pro;
              end if;


              /* [获取流水后信息][@当前数量#,@成本金额#,@实现盈亏#,@持仓核对差额#] */
              set v_jour_after_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_posi_qty_check_diff,"|");


              /* set @证券代码编号# = @交易代码编号#; */
              set v_stock_code_no = v_trade_code_no;

              /* set @变动数量#=@当前数量#; */
              set v_occur_qty=v_curr_qty;

              /* set @变动后数量#=@当前数量#; */
              set v_occur_end_qty=v_curr_qty;

              /* set @业务标志# = 《业务标志-持仓转入》; */
              set v_busi_flag = 1104004;

              /* set @操作菜单# = @菜单编号#; */
              set v_oper_menu_no = v_menu_no;

              /* set @操作功能# = @功能编码#; */
              set v_oper_func_code = v_func_code;

              /* set @操作备注#="自动改变申购代码持仓为上市代码"; */
              set v_oper_remark_info="自动改变申购代码持仓为上市代码";

              /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][1][@初始化日期#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
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
                          
                  SET v_error_code = "pdsecuA.7.25.1";
                  SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                  close cursor_exgpposi;
                  leave label_pro;
              end if;


              /* set @证券代码编号# = @临时_证券代码编号#; */
              set v_stock_code_no = v_tmp_stock_code_no;

              /* set @变动数量#=-@当前数量#; */
              set v_occur_qty=-v_curr_qty;

              /* set @变动后数量#=0; */
              set v_occur_end_qty=0;

              /* set @业务标志# = 《业务标志-持仓划转》; */
              set v_busi_flag = 1104003;

              /* [获取流水后信息][0,0,0,0] */
              set v_jour_after_occur_info = concat(0,"|",0,"|",0,"|",0,"|");


              /* set @操作备注#="自动清除当日上市的申购代码持仓"; */
              set v_oper_remark_info="自动清除当日上市的申购代码持仓";

              /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][1][@初始化日期#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
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
                          
                  SET v_error_code = "pdsecuA.7.25.1";
                  SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                  close cursor_exgpposi;
                  leave label_pro;
              end if;


    /* [关闭游标][cursor_exgpposi] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_exgpposi;
    end cursor_exgpposi;

    #资产账户持仓，申购代码改上市代码

    /* [声明游标][产品证券_持仓_资产账户持仓表][字段][instr(@证券代码编号串#,concat(";",{证券代码编号},";"))>0][cursor_asacposi] */
    cursor_asacposi:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_asacposi CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, invest_type, 
        begin_qty, curr_qty, pre_settle_qty, frozen_qty, 
        unfroz_qty, posi_qty_check_diff, cost_amt, realize_pandl, 
        intrst_cost_amt, intrst_pandl 
        from db_pdsecu.tb_pdsepo_asac_posi 
        where instr(v_stock_code_no_str,concat(";",stock_code_no,";"))>0;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_asacposi][loop_asacposi] */
    open cursor_asacposi;
    loop_asacposi: LOOP
    fetch cursor_asacposi into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_type, v_asset_type, v_invest_type, 
        v_begin_qty, v_curr_qty, v_pre_settle_qty, v_frozen_qty, 
        v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, 
        v_intrst_cost_amt, v_intrst_pandl;
        IF v_cursor_done THEN
            LEAVE loop_asacposi;
        END IF;


              /* set @临时_证券代码编号# = @证券代码编号#; */
              set v_tmp_stock_code_no = v_stock_code_no;

              /* set @交易代码编号#=cast(substring_index(substring(@交易代码编号串#,locate(concat(";",@证券代码编号#,";"),@证券代码编号串#)+1),";",1) as SIGNED); */
              set v_trade_code_no=cast(substring_index(substring(v_trade_code_no_str,locate(concat(";",v_stock_code_no,";"),v_stock_code_no_str)+1),";",1) as SIGNED);

              /* [获取流水变动][{当前数量},{成本金额},{实现盈亏},{持仓核对差额}][@当前数量#,@成本金额#,@实现盈亏#,@持仓核对差额#] */
              set v_jour_occur_field = concat("当前数量","|","成本金额","|","实现盈亏","|","持仓核对差额","|");
              set v_jour_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_posi_qty_check_diff,"|");

              #[更新表记录][产品证券_持仓_资产账户持仓表][{期初数量}=0,{当前数量}=0,{待交收数量}=0,{冻结数量}=0,{解冻数量}=0,{成本金额}=0,{实现盈亏}=0,{利息成本金额}=0,{利息收益}=0][{记录序号}=@记录序号#][2][@记录序号#]

              /* [更新表记录][产品证券_持仓_资产账户持仓表][{证券代码编号}=@交易代码编号#][{记录序号}=@记录序号#][2][@记录序号#] */
              set v_update_date = date_format(curdate(),'%Y%m%d');
              set v_update_time = date_format(curtime(),'%H%i%s');
              update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_code_no=v_trade_code_no where row_id=v_row_id;
              if v_error_code = "1" then
                          
                  SET v_error_code = "pdsecuA.7.25.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("记录序号=",v_row_id);
                  end if;
                  close cursor_asacposi;
                  leave label_pro;
              end if;


              /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{当前数量},{成本金额},{实现盈亏},{持仓核对差额}][@当前数量#,@成本金额#,@实现盈亏#,@持仓核对差额#][{记录序号}=@记录序号#][4][@记录序号#] */
              select curr_qty,cost_amt,realize_pandl,posi_qty_check_diff into v_curr_qty,v_cost_amt,v_realize_pandl,v_posi_qty_check_diff from db_pdsecu.tb_pdsepo_asac_posi where row_id=v_row_id limit 1;
              if FOUND_ROWS() = 0 then
                          
                  SET v_error_code = "pdsecuA.7.25.4";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("记录序号=",v_row_id);
                  end if;
                  close cursor_asacposi;
                  leave label_pro;
              end if;


              /* [获取流水后信息][@当前数量#,@成本金额#,@实现盈亏#,@持仓核对差额#] */
              set v_jour_after_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_posi_qty_check_diff,"|");


              /* set @证券代码编号# = @交易代码编号#; */
              set v_stock_code_no = v_trade_code_no;

              /* set @变动数量#=@当前数量#; */
              set v_occur_qty=v_curr_qty;

              /* set @变动后数量#=@当前数量#; */
              set v_occur_end_qty=v_curr_qty;

              /* set @业务标志# = 《业务标志-持仓转入》; */
              set v_busi_flag = 1104004;

              /* set @操作菜单# = @菜单编号#; */
              set v_oper_menu_no = v_menu_no;

              /* set @操作功能# = @功能编码#; */
              set v_oper_func_code = v_func_code;

              /* set @操作备注#="自动改变申购代码持仓为上市代码"; */
              set v_oper_remark_info="自动改变申购代码持仓为上市代码";

              /* [插入表记录][产品证券_持仓_资产账户持仓流水表][字段][字段变量][1][@初始化日期#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
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
                          
                  SET v_error_code = "pdsecuA.7.25.1";
                  SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                  close cursor_asacposi;
                  leave label_pro;
              end if;


              /* set @证券代码编号# = @临时_证券代码编号#; */
              set v_stock_code_no = v_tmp_stock_code_no;

              /* set @变动数量#=-@当前数量#; */
              set v_occur_qty=-v_curr_qty;

              /* set @变动后数量#=0; */
              set v_occur_end_qty=0;

              /* set @业务标志# = 《业务标志-持仓划转》; */
              set v_busi_flag = 1104003;

              /* [获取流水后信息][0,0,0,0] */
              set v_jour_after_occur_info = concat(0,"|",0,"|",0,"|",0,"|");


              /* set @操作备注#="自动清除当日上市的申购代码持仓"; */
              set v_oper_remark_info="自动清除当日上市的申购代码持仓";

              /* [插入表记录][产品证券_持仓_资产账户持仓流水表][字段][字段变量][1][@初始化日期#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
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
                          
                  SET v_error_code = "pdsecuA.7.25.1";
                  SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                  close cursor_asacposi;
                  leave label_pro;
              end if;


    /* [关闭游标][cursor_asacposi] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_asacposi;
    end cursor_asacposi;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


