DELIMITER ;;
use db_prod;;

# 原子_产品_清算接口_产品资金入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdclif_PdCapitalRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdclif_PdCapitalRecorded(
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
    IN p_busi_flag int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_curr_amt decimal(18,4),
    IN p_frozen_amt decimal(18,4),
    IN p_unfroz_amt decimal(18,4),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
    IN p_exch_no int,
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
    declare v_busi_flag int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_exch_no int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pre_settle_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_remark_info varchar(255);
    declare v_oper_func_code varchar(16);
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
    SET v_arrive_date = p_arrive_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_busi_flag = p_busi_flag;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_frozen_amt = p_frozen_amt;
    SET v_unfroz_amt = p_unfroz_amt;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_exch_no = p_exch_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pre_settle_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_remark_info = " ";
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #场外基金委托本应入冻结,产品资金表中没有这个字段 , 所以不体现 , 场外基金成交照A股处理

    /* [检查正常返回][@市场编号# = 《市场编号-场外交易市场》 and @到账日期#<>@初始化日期#] */
    if v_exch_no = 5 and v_arrive_date<>v_init_date then
        leave label_pro;
    end if;


    /* set @变动金额# = @当前金额#; */
    set v_occur_amt = v_curr_amt;

    /* set @待交收金额# = 0; */
    set v_pre_settle_amt = 0;

    /* if @市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号# = 《市场编号-深港通证券交易所》 then */
    if v_exch_no = 3 or v_exch_no = 4 then

        /* set @当前金额# = 0; */
        set v_curr_amt = 0;

        /* set @待交收金额# = @变动金额#; */
        set v_pre_settle_amt = v_occur_amt;
    end if;
    #处理产品资金入账

    /* [获取流水变动][{当前金额},{待交收金额}][@当前金额#,@待交收金额#] */
    set v_jour_occur_field = concat("当前金额","|","待交收金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|",v_pre_settle_amt,"|");


    /* [更新表记录][产品_资金_产品资金表][{当前金额}={当前金额}+@当前金额#,{待交收金额}={待交收金额}+@待交收金额#,{产品已分配金额}={产品已分配金额}+@变动金额#,{产品已授权金额}={产品已授权金额}+@变动金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][2][@产品编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdcapit_pd_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt+v_curr_amt,pre_settle_amt=pre_settle_amt+v_pre_settle_amt,pd_dist_amt=pd_dist_amt+v_occur_amt,pd_auth_amt=pd_auth_amt+v_occur_amt where pd_no=v_pd_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.7.2.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{当前金额},{待交收金额}][@当前金额#,@待交收金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select curr_amt,pre_settle_amt into v_curr_amt,v_pre_settle_amt from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.7.2.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前金额#,@待交收金额#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|",v_pre_settle_amt,"|");


    /* if @市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号# = 《市场编号-深港通证券交易所》 then */
    if v_exch_no = 3 or v_exch_no = 4 then

        /* set @变动后金额# = @待交收金额#; */
        set v_occur_end_amt = v_pre_settle_amt;
    else

        /* set @变动后金额# = @当前金额#; */
        set v_occur_end_amt = v_curr_amt;
    end if;

    /* set @操作菜单# = 0; */
    set v_oper_menu_no = 0;

    /* set @操作备注# = " "; */
    set v_oper_remark_info = " ";

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@产品编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_pd_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, crncy_type, busi_flag, occur_amt, 
        occur_end_amt, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_crncy_type, v_busi_flag, v_occur_amt, 
        v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.7.2.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_清算接口_获取产品成本计算方式
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdclif_GetProdCostCalcType;;
DELIMITER ;;
CREATE PROCEDURE pra_pdclif_GetProdCostCalcType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_cost_calc_type int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_cost_calc_type int;

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
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_cost_calc_type = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_产品限制信息表][{成本计算方式}][@成本计算方式#][{产品编号}=@产品编号#][4][@产品编号#] */
    select cost_calc_type into v_cost_calc_type from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.7.41.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_cost_calc_type = v_cost_calc_type;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_清算接口_获取资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdclif_GetAssetAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdclif_GetAssetAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asset_acco_type int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco_type int;

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_type = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_资产账户信息表][{资产账户类型}][@资产账户类型#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
    select asset_acco_type into v_asset_acco_type from db_prod.tb_pdacco_asset_acco where asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.7.42.4";
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
    SET p_asset_acco_type = v_asset_acco_type;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_清算接口_获取融资融券利率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdclif_GetFinaLoanIntrstRate;;
DELIMITER ;;
CREATE PROCEDURE pra_pdclif_GetFinaLoanIntrstRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_fina_year_intrst_rate decimal(18,12),
    OUT p_secu_loan_year_intrst_rate decimal(18,12),
    OUT p_sell_auto_back_debt int,
    OUT p_fina_return_type int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_fina_year_intrst_rate decimal(18,12);
    declare v_secu_loan_year_intrst_rate decimal(18,12);
    declare v_sell_auto_back_debt int;
    declare v_fina_return_type int;

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_fina_year_intrst_rate = 0;
    SET v_secu_loan_year_intrst_rate = 0;
    SET v_sell_auto_back_debt = 0;
    SET v_fina_return_type = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_融资融券配置表][{融资年利率},{融券年利率},{卖券还款方式},{卖出自动还款}][@融资年利率#,@融券年利率#,@卖券还款方式#,@卖出自动还款#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
    select fina_year_intrst_rate,secu_loan_year_intrst_rate,fina_return_type,sell_auto_back_debt into v_fina_year_intrst_rate,v_secu_loan_year_intrst_rate,v_fina_return_type,v_sell_auto_back_debt from db_prod.tb_pdacco_fina_loan_config where asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.7.42.4";
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
    SET p_fina_year_intrst_rate = v_fina_year_intrst_rate;
    SET p_secu_loan_year_intrst_rate = v_secu_loan_year_intrst_rate;
    SET p_sell_auto_back_debt = v_sell_auto_back_debt;
    SET p_fina_return_type = v_fina_return_type;

END;;


