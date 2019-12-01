DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_更新报表产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_UpdateReportProductinfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_UpdateReportProductinfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
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
    declare v_input_date int;
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
    SET v_input_date = p_input_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* if @传入日期# <> date_format(curdate(),'%Y%m%d') then */
    if v_input_date <> date_format(curdate(),'%Y%m%d') then
          leave label_pro;
    end if;

    /* [删除表记录][报表_报表数据_报表产品信息临时表][1=1][14020101][@传入日期#]; */
    delete from db_rpts.tb_rpt_productinfo_tmp 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "rptA.2.1.14020101";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("传入日期=",v_input_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("传入日期=",v_input_date);
        end if;
        leave label_pro;
    end if;


    /* [读取插入表记录][报表_报表数据_报表产品信息临时表][报表_报表数据_报表产品信息表][字段][字段变量][1=1][14020102][@传入日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_productinfo_tmp (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, pd_no, 
        co_no, pd_code, pd_name, pd_flname, 
        pd_manager, found_date, pd_type, apply_currency, 
        crncy_type, first_asset, first_amt, pd_all_share, 
        curr_share, pre_share, his_max_per_nav, pre_nav, 
        coust_full_name, coust_acco, coust_acco_name, pd_status, 
        remark_info, cost_calc_type, risk_free_interest_rate) 
        select 
        create_date, create_time, update_date, 
        update_time, update_times, init_date, pd_no, 
        co_no, pd_code, pd_name, pd_flname, 
        pd_manager, found_date, pd_type, apply_currency, 
        crncy_type, first_asset, first_amt, pd_all_share, 
        curr_share, pre_share, his_max_per_nav, pre_nav, 
        coust_full_name, coust_acco, coust_acco_name, pd_status, 
        remark_info, cost_calc_type, risk_free_interest_rate 
        from db_rpts.tb_rpt_productinfo 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.1.14020102";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("传入日期=",v_input_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("传入日期=",v_input_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][报表_报表数据_报表产品信息表][1=1][14020103][@传入日期#]; */
    delete from db_rpts.tb_rpt_productinfo 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "rptA.2.1.14020103";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("传入日期=",v_input_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("传入日期=",v_input_date);
        end if;
        leave label_pro;
    end if;

    #[读取插入表记录][报表_报表数据_报表产品信息表][报表_报表数据_产品信息表][字段][{创建日期},{创建时间},{更新日期},{更新时间},@传入日期#,{产品编号},{机构编号},{产品编码},{产品名称},{产品全称},{产品管理人},{成立日期},{产品类型},{募集币种},{本币币种},{原始资产},{原始金额},{产品总份额},{当前份额},{昨日份额},{历史最高单位净值},{昨日净值},{境内托管人全名},{境内托管账户},{境内托管账户名},{产品状态},{备注信息},0,0,0,0][1=1][14020104][@传入日期#]
    update tb_rpt_productinfo a, tb_rpt_productinfo_tmp b set a.risk_free_interest_rate = b.risk_free_interest_rate where a.pd_no = b.pd_no;

    /* [删除表记录][报表_报表数据_报表历史产品信息表][{初始化日期}=@传入日期#][14020105][@传入日期#]; */
    delete from db_rpts.tb_rpt_productinfo_his 
        where init_date=v_input_date;
    if v_error_code = 1 then
                
        SET v_error_code = "rptA.2.1.14020105";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("传入日期=",v_input_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("传入日期=",v_input_date);
        end if;
        leave label_pro;
    end if;


    /* [读取插入表记录][报表_报表数据_报表历史产品信息表][报表_报表数据_报表产品信息表][字段][字段变量][1=1][14020106][@传入日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_productinfo_his (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, pd_no, 
        co_no, pd_code, pd_name, pd_flname, 
        pd_manager, found_date, pd_type, apply_currency, 
        crncy_type, first_asset, first_amt, pd_all_share, 
        curr_share, pre_share, his_max_per_nav, pre_nav, 
        last_year_pd_nav, total_unit_nav, coust_full_name, coust_acco, 
        coust_acco_name, pd_status, remark_info, cost_calc_type, 
        risk_free_interest_rate) 
        select 
        create_date, create_time, update_date, 
        update_time, update_times, init_date, pd_no, 
        co_no, pd_code, pd_name, pd_flname, 
        pd_manager, found_date, pd_type, apply_currency, 
        crncy_type, first_asset, first_amt, pd_all_share, 
        curr_share, pre_share, his_max_per_nav, pre_nav, 
        last_year_pd_nav, total_unit_nav, coust_full_name, coust_acco, 
        coust_acco_name, pd_status, remark_info, cost_calc_type, 
        risk_free_interest_rate 
        from db_rpts.tb_rpt_productinfo 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.1.14020106";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("传入日期=",v_input_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("传入日期=",v_input_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询报表产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_QueryReportProductinfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_QueryReportProductinfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_pd_type int,
    IN p_pd_status_str varchar(64),
    IN p_borker_no int,
    IN p_broker_my_type int,
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
    declare v_pd_no int;
    declare v_pd_type int;
    declare v_pd_status_str varchar(64);
    declare v_borker_no int;
    declare v_broker_my_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_pd_type = p_pd_type;
    SET v_pd_status_str = p_pd_status_str;
    SET v_borker_no = p_borker_no;
    SET v_broker_my_type = p_broker_my_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_报表产品信息表][字段][({机构编号} = @操作员机构编号#) and (@产品类型# = 0 or {产品类型}=@产品类型#) and (@产品状态串# = " " or instr(@产品状态串#, {产品状态}) > 0) and (@券商编号# = 0 or {券商编号}=@券商编号#) and (@券商自主类型# = 0 or {券商自主类型}=@券商自主类型#)order by {产品编号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pd_no, co_no, pd_code, pd_name, 
        pd_flname, pd_manager, found_date, pd_type, 
        apply_currency, crncy_type, first_asset, first_amt, 
        pd_all_share, curr_share, pre_share, his_max_per_nav, 
        pre_nav, last_year_pd_nav, total_unit_nav, coust_full_name, 
        coust_acco, coust_acco_name, pd_status, remark_info, 
        cost_calc_type, risk_free_interest_rate, allow_exch, borker_no, 
        borker_name, commis_ratio, broker_my_type, share_net_total_type from db_rpts.tb_rpt_productinfo where (co_no = v_opor_co_no) and (v_pd_type = 0 or pd_type=v_pd_type) and (v_pd_status_str = " " or instr(v_pd_status_str, pd_status) > 0) and (v_borker_no = 0 or borker_no=v_borker_no) and (v_broker_my_type = 0 or broker_my_type=v_broker_my_type)order by pd_no;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pd_no, co_no, pd_code, pd_name, 
        pd_flname, pd_manager, found_date, pd_type, 
        apply_currency, crncy_type, first_asset, first_amt, 
        pd_all_share, curr_share, pre_share, his_max_per_nav, 
        pre_nav, last_year_pd_nav, total_unit_nav, coust_full_name, 
        coust_acco, coust_acco_name, pd_status, remark_info, 
        cost_calc_type, risk_free_interest_rate, allow_exch, borker_no, 
        borker_name, commis_ratio, broker_my_type, share_net_total_type from db_rpts.tb_rpt_productinfo where (co_no = v_opor_co_no) and (v_pd_type = 0 or pd_type=v_pd_type) and (v_pd_status_str = " " or instr(v_pd_status_str, pd_status) > 0) and (v_borker_no = 0 or borker_no=v_borker_no) and (v_broker_my_type = 0 or broker_my_type=v_broker_my_type)order by pd_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_修改报表产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_ModiReportProductinfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_ModiReportProductinfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_risk_free_interest_rate decimal(18,12),
    IN p_follow_share decimal(18,2),
    IN p_warn_value decimal(18,4),
    IN p_stop_value decimal(18,4),
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
    declare v_pd_code varchar(32);
    declare v_risk_free_interest_rate decimal(18,12);
    declare v_follow_share decimal(18,2);
    declare v_warn_value decimal(18,4);
    declare v_stop_value decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_risk_free_interest_rate = p_risk_free_interest_rate;
    SET v_follow_share = p_follow_share;
    SET v_warn_value = p_warn_value;
    SET v_stop_value = p_stop_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][报表_报表数据_报表产品信息表][{无风险利率}=@无风险利率#][{机构编号}=@机构编号# and {产品编码}=@产品编码#][14020301][@机构编号#,@产品编码#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rpts.tb_rpt_productinfo set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, risk_free_interest_rate=v_risk_free_interest_rate where co_no=v_co_no and pd_code=v_pd_code;
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.3.14020301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编码=",v_pd_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编码=",v_pd_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_更新报表产品资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_UpdateProductAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_UpdateProductAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
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
    declare v_input_date int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_input_date = p_input_date;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [删除表记录][报表_报表数据_产品资产表][{初始化日期}=@传入日期# and (0 = @机构编号# or {机构编号}=@机构编号#) and (" " = @产品编码# or {产品编码}= @产品编码#)][14020401][@传入日期#]; */
    delete from db_rpts.tb_rpt_productasset 
        where init_date=v_input_date and (0 = v_co_no or co_no=v_co_no) and (" " = v_pd_code or pd_code= v_pd_code);
    if v_error_code = 1 then
                
        SET v_error_code = "rptA.2.4.14020401";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("传入日期=",v_input_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("传入日期=",v_input_date);
        end if;
        leave label_pro;
    end if;


    /* INSERT INTO ~报表_报表数据_产品资产表^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{机构编号},{产品编号},{产品编码},{产品名称},{运行时长},{本币币种},{期初净资产},{净资产},{总资产},{股票资产},{期货资产},{期权资产},{权证资产},{基金资产},{现金资产},{回购资产},{债券资产},{单位净值},{昨日单位净值},{产品总份额},{当前份额},{累计应付金额},{累计应收金额},{净值比}) */
    INSERT INTO db_rpts.tb_rpt_productasset(create_date,create_time,update_date,update_time,init_date,co_no,pd_no,pd_code,pd_name,runtime,crncy_type,begin_NAV,nav_asset,total_asset,stock_asset,futu_asset,option_asset,warrant_asset,fund_asset,cash_asset,repo_asset,bond_asset,unit_nav,pre_pd_unit_nav,pd_all_share,curr_share,total_payab_amt,total_rece_amt,product_unit_nav_ration)

    /* SELECT @创建日期#, @创建时间#,@更新日期#,@更新时间#,a.init_date,a.co_no,a.pd_no,a.pd_code,a.pd_name,TO_DAYS(CURDATE()) - TO_DAYS(a.found_date) AS runtime, */
    SELECT v_create_date, v_create_time,v_update_date,v_update_time,a.init_date,a.co_no,a.pd_no,a.pd_code,a.pd_name,TO_DAYS(CURDATE()) - TO_DAYS(a.found_date) AS runtime,
    a.crncy_type,sum(b.begin_NAV) AS begin_NAV,sum(b.nav_asset) AS nav_asset,sum(b.nav_asset)+ c.total_payab_amt AS total_asset,
    sum(CASE WHEN b.asset_type = 11 THEN b.asset_value ELSE 0 END) AS stock_asset,
    sum(CASE WHEN b.asset_type = 31 THEN b.asset_value ELSE 0 END) AS futu_asset,
    sum(CASE WHEN b.asset_type = 32 THEN b.asset_value ELSE 0 END) AS option_asset,
    sum(CASE WHEN b.asset_type = 33 THEN b.asset_value ELSE 0 END) AS warrant_asset,
    sum(CASE WHEN b.asset_type in(51,52,53,54,55) THEN b.asset_value ELSE 0 END) AS fund_asset,
    sum(CASE WHEN b.asset_type = 41 THEN b.asset_value ELSE 0 END) AS cash_asset,
    sum(CASE WHEN b.asset_type = 43 THEN b.asset_value ELSE 0 END) AS repo_asset,
    sum(CASE WHEN b.asset_type in (21,22,23,24,25,26) THEN b.asset_value ELSE 0 END) AS bond_asset,
    sum(b.nav_asset)/a.curr_share AS unit_nav,
    a.pre_nav as pre_pd_unit_nav,a.pd_all_share,a.curr_share,c.total_payab_amt,c.total_rece_amt
    FROM tb_rpt_productinfo_his a,tb_pdcapit_pdasset_his b,tb_pdcapit_pdcapit_his c

    /* WHERE a.init_date = b.init_date AND a.pd_no = b.pd_no AND a.crncy_type = b.crncy_type AND a.init_date = c.init_date AND a.pd_no = c.pd_no AND a.crncy_type = c.crncy_type AND a.init = @传入日期# AND (@机构编号# = 0 or a.co_no = @机构编号#) AND (@产品编码#= " " or a.pd_code = @产品编码#) */
    WHERE a.init_date = b.init_date AND a.pd_no = b.pd_no AND a.crncy_type = b.crncy_type AND a.init_date = c.init_date AND a.pd_no = c.pd_no AND a.crncy_type = c.crncy_type AND a.init = v_input_date AND (v_co_no = 0 or a.co_no = v_co_no) AND (v_pd_code= " " or a.pd_code = v_pd_code)
    GROUP BY a.init_date AND a.pd_no AND a.crncy_type;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_更新报表产品持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_UpdateProductStockhold;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_UpdateProductStockhold(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
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
    declare v_input_date int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_input_date = p_input_date;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [删除表记录][报表_报表数据_产品持仓表][{初始化日期}=@传入日期# and (0 = @机构编号# or {机构编号}=@机构编号#) and (" " = @产品编码# or {产品编码}= @产品编码#)][14020501][@产品编码#]; */
    delete from db_rpts.tb_rpt_productholder 
        where init_date=v_input_date and (0 = v_co_no or co_no=v_co_no) and (" " = v_pd_code or pd_code= v_pd_code);
    if v_error_code = 1 then
                
        SET v_error_code = "rptA.2.5.14020501";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编码=",v_pd_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编码=",v_pd_code);
        end if;
        leave label_pro;
    end if;


    /* INSERT INTO ~报表_报表数据_产品持仓表^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{机构编号},{产品编号},{产品编码},{产品名称},{本币币种},{市场编号},{证券代码编号},{证券代码},{证券名称},{期初数量},{当前数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{最新价},{证券市值}) */
    INSERT INTO db_rpts.tb_rpt_productholder(create_date,create_time,update_date,update_time,init_date,co_no,pd_no,pd_code,pd_name,crncy_type,exch_no,stock_code_no,stock_code,stock_name,begin_qty,curr_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,last_price,stock_asset_value)

    /* SELECT @创建日期#,@创建时间#,@更新日期#,@更新时间#,a.init_date,a.co_no,a.pd_no,a.pd_code,a.pd_name,a.crncy_type,b.exch_no,b.stock_code_no,c.stock_code,c.stock_name,sum(b.begin_qty) as begin_qty,sum(b.curr_qty) as curr_qty,sum(b.frozen_qty) as frozen_qty,sum(b.unfroz_qty) as unfroz_qty,sum(b.curr_cost_amt) as cost_amt,sum(b.realize_pandl) as realize_pandl,sum(b.intrst_cost_amt) as intrst_cost_amt, */
    SELECT v_create_date,v_create_time,v_update_date,v_update_time,a.init_date,a.co_no,a.pd_no,a.pd_code,a.pd_name,a.crncy_type,b.exch_no,b.stock_code_no,c.stock_code,c.stock_name,sum(b.begin_qty) as begin_qty,sum(b.curr_qty) as curr_qty,sum(b.frozen_qty) as frozen_qty,sum(b.unfroz_qty) as unfroz_qty,sum(b.curr_cost_amt) as cost_amt,sum(b.realize_pandl) as realize_pandl,sum(b.intrst_cost_amt) as intrst_cost_amt,
    sum(b.intrst_pandl) as intrst_pandl,c.last_price,sum(b.curr_qty * c.last_price) as stock_asset_value
    FROM tb_rpt_productinfo_his a,tb_pdsepo_pdsecuposi_his b,tb_basedt_stock_quot_his c

    /* WHERE a.init_date = b.init_date AND a.pd_no = b.pd_no AND a.init_date = c.init_date AND b.stock_code_no = c.stock_code_no AND a.init_date = @传入日期# AND (@机构编号# = 0 or a.co_no = @机构编号#) AND (@产品编码#= " " or a.pd_code = @产品编码#) */
    WHERE a.init_date = b.init_date AND a.pd_no = b.pd_no AND a.init_date = c.init_date AND b.stock_code_no = c.stock_code_no AND a.init_date = v_input_date AND (v_co_no = 0 or a.co_no = v_co_no) AND (v_pd_code= " " or a.pd_code = v_pd_code)
    GROUP BY a.init_date ,a.pd_no , b.stock_code_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_计算单产品收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_CalcSingleProductProfit;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_CalcSingleProductProfit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
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
    declare v_input_date int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_last_tradeday int;
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_input_date = p_input_date;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_last_tradeday = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #如果不是交易日，则无需去生成

    /* [获取表记录数量][报表_报表数据_报表交易日信息表][@记录个数#][{交易日期}=@传入日期# and {是否交易日}=1] */
    select count(1) into v_record_count from db_rpts.tb_rpt_tradeday where trade_date=v_input_date and is_open=1;


    /* if @记录个数# = 0 THEN */
    if v_record_count = 0 THEN
          leave label_pro;
    end if;
    #计算盘中单产品收益率
    #插入之前删除当日数据

    /* [删除表记录][报表_报表数据_报表单产品收益率历史表][{初始化日期}=@传入日期# and (0 = @机构编号# or {机构编号}=@机构编号#) and (" " = @产品编码# or {产品编码}= @产品编码#)][14020601][@产品编码#]; */
    delete from db_rpts.tb_rpt_qry_singleproduct_profit_his 
        where init_date=v_input_date and (0 = v_co_no or co_no=v_co_no) and (" " = v_pd_code or pd_code= v_pd_code);
    if v_error_code = 1 then
                
        SET v_error_code = "rptA.2.6.14020601";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编码=",v_pd_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编码=",v_pd_code);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][报表_报表数据_报表交易日信息表][{上一交易日}][@上一交易日#][{交易日期}=@传入日期#] */
    select last_tradeday into v_last_tradeday from db_rpts.tb_rpt_tradeday where trade_date=v_input_date limit 1;

    #计算单产品收益率

    /* INSERT INTO ~报表_报表数据_报表单产品收益率历史表^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{产品编号},{机构编号},{产品编码},{产品名称},{成立日期},{运行时长},{单位净值},{当日收益率},{当日年化收益率},{累计单位净值},{累计收益率},{累计年化收益率},{超额年化收益},{每日回撤},{连续回撤幅度}) */
    INSERT INTO db_rpts.tb_rpt_qry_singleproduct_profit_his(create_date,create_time,update_date,update_time,init_date,pd_no,co_no,pd_code,pd_name,found_date,runtime,unit_nav,daily_pandl_ratio,daily_pandl_ratio_year,total_unit_nav,total_realiz_pandl_ratio,total_realize_pandl_ratio_year,excess_earning_year,day_retracement,day_continue_retracement)

    /* select @创建日期#,@创建时间#,@更新日期#,@更新时间#,a.init_date, */
    select v_create_date,v_create_time,v_update_date,v_update_time,a.init_date,
    a.pd_no,
    a.co_no,
    a.pd_code,
    a.pd_name,
    a.found_date,
    b.runtime as runtime,
    IFNULL(b.unit_nav,0) AS product_unit_nav,
    IFNULL(b.product_unit_nav_ration -1,0) AS daily_pandl_ratio,
    IFNULL((b.product_unit_nav_ration - 1)*250,0) AS daily_pandl_ratio_year,
    IFNULL(b.unit_nav,0) AS total_unit_nav,
    IFNULL(b.unit_nav - 1, 0) AS total_realize_pandl_ratio,
    IFNULL((b.unit_nav - 1)/b.runtime*365,0) as total_realize_pandl_ratio_year,
    IFNULL((b.product_unit_nav_ration - 1)*250 - a.risk_free_interest_rate,0) AS excess_earnings_year,
    IFNULL(b.product_unit_nav_ration - 1,0) AS day_retracement,
    IFNULL(IF(b.product_unit_nav_ration<1,(b.product_unit_nav_ration - 1)+IFNULL(c.day_continue_retracement,0),0),0) AS day_continue_retracement
    from tb_rpt_productinfo_his a LEFT JOIN v_dt_pd_asset_all b
    on a.pd_no = b.pd_no
    AND a.init_date = b.init_date
    LEFT JOIN tb_rpt_qry_singleproduct_profit c
    on a.pd_no = b.pd_no

    /* and c.init_date = @上一交易日# */
    and c.init_date = v_last_tradeday

    /* WHERE a.init_date = @传入日期# and (@机构编号# = 0 or a.co_no = @机构编号#) AND (@产品编码#= " " or a.pd_code = @产品编码#); */
    WHERE a.init_date = v_input_date and (v_co_no = 0 or a.co_no = v_co_no) AND (v_pd_code= " " or a.pd_code = v_pd_code);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_计算产品收益率分析
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_CalctProductProfitAnalysis;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_CalctProductProfitAnalysis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
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
    declare v_input_date int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_pd_no int;
    declare v_market_value_last_twedays decimal(18,4);
    declare v_market_value_last_twedays_sh decimal(18,4);
    declare v_market_value_last_twedays_sz decimal(18,4);
    declare v_market_value_avg decimal(18,4);
    declare v_market_value_avg_sh decimal(18,4);
    declare v_market_value_avg_sz decimal(18,4);

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
    SET v_input_date = p_input_date;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_pd_no = 0;
    SET v_market_value_last_twedays = 0;
    SET v_market_value_last_twedays_sh = 0;
    SET v_market_value_last_twedays_sz = 0;
    SET v_market_value_avg = 0;
    SET v_market_value_avg_sh = 0;
    SET v_market_value_avg_sz = 0;

    
    label_pro:BEGIN
    
    #如果不是交易日，则无需生成

    /* [获取表记录数量][报表_报表数据_报表交易日信息表][@记录个数#][{交易日期}=@传入日期# and {是否交易日}=1] */
    select count(1) into v_record_count from db_rpts.tb_rpt_tradeday where trade_date=v_input_date and is_open=1;


    /* if @记录个数# = 0 then */
    if v_record_count = 0 then
          leave label_pro;
    end if;
    #插入之前删除当日数据

    /* [删除表记录][报表_报表数据_报表产品持仓市值表][{初始化日期}=@传入日期# and (0 = @机构编号# or {机构编号}=@机构编号#) and (" " = @产品编码# or {产品编码}= @产品编码#)][14020701][@机构编号#,@产品编码#,@传入日期#] */
    delete from db_rpts.tb_rpt_product_marketvalue 
        where init_date=v_input_date and (0 = v_co_no or co_no=v_co_no) and (" " = v_pd_code or pd_code= v_pd_code);
    if v_error_code = 1 then
                
        SET v_error_code = "rptA.2.7.14020701";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编码=",v_pd_code,",","传入日期=",v_input_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编码=",v_pd_code,",","传入日期=",v_input_date);
        end if;
        leave label_pro;
    end if;

    #更新市值、沪市市值、深市市值 到报表产品持仓市值表中，使用历史产品表左关联

    /* INSERT INTO ~报表_报表数据_报表产品持仓市值表^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{产品编号},{机构编号},{产品编码},{产品名称},{当前市值},{当前沪市市值},{当前深市市值},{平均市值},{平均沪市市值},{平均深市市值},{近二十日市值},{近二十日沪市市值},{近二十日深市市值}) */
    INSERT INTO db_rpts.tb_rpt_product_marketvalue(create_date,create_time,update_date,update_time,init_date,pd_no,co_no,pd_code,pd_name,market_value,market_value_sh,market_value_sz,market_value_avg,market_value_avg_sh,market_value_avg_sz,market_value_last_twedays,market_value_last_twedays_sh,market_value_last_twedays_sz)

    /* select  @创建日期#,@创建时间#,@更新日期#,@更新时间#,a.init_date,a.pd_no,a.co_no,a.pd_code,a.pd_name,IFNULL(sum(b.curr_qty * b.last_price),0) as market_value,IFNULL(sum(CASE WHEN b.exch_no = 1 THEN b.curr_qty * b.last_price ELSE 0 END),0) AS market_value_sh, */
    select  v_create_date,v_create_time,v_update_date,v_update_time,a.init_date,a.pd_no,a.co_no,a.pd_code,a.pd_name,IFNULL(sum(b.curr_qty * b.last_price),0) as market_value,IFNULL(sum(CASE WHEN b.exch_no = 1 THEN b.curr_qty * b.last_price ELSE 0 END),0) AS market_value_sh,
    IFNULL(sum(CASE WHEN b.exch_no = 2 THEN b.curr_qty * b.last_price ELSE 0 END),0) AS market_value_sz,
    0 AS market_value_avg,0 AS market_value_avg_sh,0 AS market_value_avg_sz,0 AS market_value_last_twedays,0 AS market_value_last_twedays_sh,0 AS market_value_last_twedays_sz
    from tb_rpt_productinfo_his a LEFT JOIN tb_rpt_productholder b on a.pd_no = b.pd_no and a.init_date = b.init_date

    /* where a.init_date = @传入日期# and (@机构编号# = 0 or a.co_no = @机构编号#) AND (@产品编码#= " " or a.pd_code = @产品编码#) */
    where a.init_date = v_input_date and (v_co_no = 0 or a.co_no = v_co_no) AND (v_pd_code= " " or a.pd_code = v_pd_code)
    group by a.init_date,a.pd_no;
    #更新近20交易日市值信息

    /* [声明游标][报表_报表数据_报表产品持仓市值表][{产品编号}][{初始化日期}=@传入日期# and (@机构编号# = 0 or co_no = @机构编号#) AND (@产品编码#= " " or pd_code = @产品编码#)][cursor_secu_posi] */
    cursor_secu_posi:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_secu_posi CURSOR FOR
        select pd_no 
        from db_rpts.tb_rpt_product_marketvalue 
        where init_date=v_input_date and (v_co_no = 0 or co_no = v_co_no) AND (v_pd_code= " " or pd_code = v_pd_code);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@产品编号#][cursor_secu_posi][loop_secu_posi] */
    open cursor_secu_posi;
    loop_secu_posi: LOOP
    fetch cursor_secu_posi into v_pd_no;
        IF v_cursor_done THEN
            LEAVE loop_secu_posi;
        END IF;


          /* set @近二十日市值#=0; */
          set v_market_value_last_twedays=0;

          /* set @近二十日沪市市值#=0; */
          set v_market_value_last_twedays_sh=0;

          /* set @近二十日深市市值#=0; */
          set v_market_value_last_twedays_sz=0;

          /* set @平均市值#=0; */
          set v_market_value_avg=0;

          /* set @平均沪市市值#=0; */
          set v_market_value_avg_sh=0;

          /* set @平均深市市值#=0; */
          set v_market_value_avg_sz=0;

    /* select avg(a.market_value)*20 , avg(a.market_value_sh)*20 , avg(a.market_value_sz )*20 into @近二十日市值#, @近二十日沪市市值# , @近二十日深市市值# */
    select avg(a.market_value)*20 , avg(a.market_value_sh)*20 , avg(a.market_value_sz )*20 into v_market_value_last_twedays, v_market_value_last_twedays_sh , v_market_value_last_twedays_sz
    from
    (select market_value,market_value_sh,market_value_sz
    from tb_rpt_product_marketvalue

    /* where pd_no = @产品编号# and init_date<=@传入日期# */
    where pd_no = v_pd_no and init_date<=v_input_date
    ORDER BY init_date desc limit 20
    )a;

    /* select avg(market_value),avg(market_value_sh),avg(market_value_sz) into @平均市值#,@平均沪市市值#,@平均深市市值# from tb_rpt_product_marketvalue */
    select avg(market_value),avg(market_value_sh),avg(market_value_sz) into v_market_value_avg,v_market_value_avg_sh,v_market_value_avg_sz from tb_rpt_product_marketvalue

    /* where pd_no = @产品编号# and init_date <=@传入日期#; */
    where pd_no = v_pd_no and init_date <=v_input_date;

    /* [更新表记录][报表_报表数据_报表产品持仓市值表][{近二十日市值}=@近二十日市值#,{近二十日沪市市值}=@近二十日沪市市值#,{近二十日深市市值}=@近二十日深市市值#,{平均市值}=@平均市值#,{平均沪市市值}=@平均沪市市值#,{平均深市市值}=@平均深市市值#][{产品编号}=@产品编号# and {初始化日期}=@传入日期#][14020702][@机构编号#,@产品编码#,@传入日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rpts.tb_rpt_product_marketvalue set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, market_value_last_twedays=v_market_value_last_twedays,market_value_last_twedays_sh=v_market_value_last_twedays_sh,market_value_last_twedays_sz=v_market_value_last_twedays_sz,market_value_avg=v_market_value_avg,market_value_avg_sh=v_market_value_avg_sh,market_value_avg_sz=v_market_value_avg_sz where pd_no=v_pd_no and init_date=v_input_date;
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.7.14020702";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编码=",v_pd_code,",","传入日期=",v_input_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编码=",v_pd_code,",","传入日期=",v_input_date);
        end if;
        close cursor_secu_posi;
        leave label_pro;
    end if;


    /* [关闭游标][cursor_secu_posi] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_secu_posi;
    end cursor_secu_posi;

    #插入之前删除当日数据

    /* [删除表记录][报表_报表数据_报表收益率分析历史表][{初始化日期}=@传入日期# and (0 = @机构编号# or {机构编号}=@机构编号#) and (" " = @产品编码# or {产品编码}= @产品编码#)][14020703][@机构编号#,@产品编码#,@传入日期#] */
    delete from db_rpts.tb_rpt_qry_profitanalysis_his 
        where init_date=v_input_date and (0 = v_co_no or co_no=v_co_no) and (" " = v_pd_code or pd_code= v_pd_code);
    if v_error_code = 1 then
                
        SET v_error_code = "rptA.2.7.14020703";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编码=",v_pd_code,",","传入日期=",v_input_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编码=",v_pd_code,",","传入日期=",v_input_date);
        end if;
        leave label_pro;
    end if;


    /* INSERT INTO ~报表_报表数据_报表收益率分析历史表^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{产品编号},{机构编号},{产品编码},{产品名称},{单位净值},{当日收益率},{累计年化收益率},{夏普比率},{最大回撤},{当前沪市市值},{平均沪市市值},{沪市满足两千万所剩天数},{沪市满足三千万所剩天数},{沪市满足五千万所剩天数},{当前深市市值},{平均深市市值},{深市满足两千万所剩天数},{深市满足三千万所剩天数},{深市满足五千万所剩天数}) */
    INSERT INTO db_rpts.tb_rpt_qry_profitanalysis_his(create_date,create_time,update_date,update_time,init_date,pd_no,co_no,pd_code,pd_name,unit_nav,daily_pandl_ratio,total_realize_pandl_ratio_year,sharpe_ration,max_retracement,market_value_sh,market_value_avg_sh,sh_remainday_two,sh_remainday_three,sh_remainday_five,market_value_sz,market_value_avg_sz,sz_remainday_two,sz_remainday_three,sz_remainday_five)

    /* select @创建日期#,@创建时间#,@更新日期#,@更新时间#,a.init_date,a.pd_no,a.co_no,a.pd_code,a.pd_name,b.unit_nav,b.daily_pandl_ratio,b.total_realize_pandl_ratio_year, */
    select v_create_date,v_create_time,v_update_date,v_update_time,a.init_date,a.pd_no,a.co_no,a.pd_code,a.pd_name,b.unit_nav,b.daily_pandl_ratio,b.total_realize_pandl_ratio_year,
    IFNULL(c.avg_earnings_year/c.std_pandl_ratio,0) as sharpe_ration,
    IFNULL(ABS(min_continue_retracement),0) AS max_retracement,
    IFNULL(a.market_value_sh,0) AS market_value_sh,
    IFNULL(a.market_value_last_twedays_sh/20,0) AS market_value_avg_sh,
    IFNULL(GREATEST((20*20000000-a.market_value_last_twedays_sh)/a.market_value_sh,0),0) AS sh_remainday_two,
    IFNULL(GREATEST((20*30000000-a.market_value_last_twedays_sh)/a.market_value_sh,0),0) AS sh_remainday_three,
    IFNULL(GREATEST((20*50000000-a.market_value_last_twedays_sh)/a.market_value_sh,0),0) AS sh_remainday_five,
    IFNULL(a.market_value_sz,0) AS market_value_sz,
    IFNULL(a.market_value_last_twedays_sz/20,0) AS market_value_avg_sz,
    IFNULL(GREATEST((20*50000000-a.market_value_last_twedays_sz)/a.market_value_sz,0),0) AS sz_remainday_two,
    IFNULL(GREATEST((20*50000000-a.market_value_last_twedays_sz)/a.market_value_sz,0),0) AS sz_remainday_three,
    IFNULL(GREATEST((20*50000000-a.market_value_last_twedays_sz)/a.market_value_sz,0),0) AS sz_remainday_five
    from tb_rpt_product_marketvalue a,tb_rpt_qry_singleproduct_profit_his b,(select pd_no,MIN(t.day_continue_retracement) AS min_continue_retracement,avg(t.excess_earning_year) AS avg_earnings_year,STD(t.daily_pandl_ratio)*SQRT(250) AS std_pandl_ratio FROM tb_rpt_qry_singleproduct_profit_his t

    /* where t.init_date <=@传入日期# */
    where t.init_date <=v_input_date
    GROUP BY pd_no) c
    where a.init_date = b.init_date
    and a.pd_no = b.pd_no
    and a.pd_no = c.pd_no

    /* and a.init_date = @传入日期# and (@机构编号# = 0 or a.co_no = @机构编号#) AND (@产品编码#= " " or a.pd_code = @产品编码#); */
    and a.init_date = v_input_date and (v_co_no = 0 or a.co_no = v_co_no) AND (v_pd_code= " " or a.pd_code = v_pd_code);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_同步资管产品账户表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_ProductInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_ProductInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_begin_date int,
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
    declare v_pd_code varchar(32);
    declare v_begin_date int;
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
    SET v_pd_code = p_pd_code;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #step1:根据对应关系"修改产品信息"
    UPDATE db_rpts.tb_rpt_productinfo t join db_dc.tb_extdata_productmap m on (t.co_no,t.pd_no) = (m.co_no,m.pd_no)
    join db_dc.tb_dt1_act_productaccount a on (a.sys_no,a.co_no,a.product_id) = (m.sys_no,m.ext_co_no,m.pd_no)
    SET t.init_date=a.init_date,t.pd_code=a.pd_code,t.pd_name=a.pd_name,t.pd_flname=a.pd_flname,t.found_date=a.found_date,t.pd_type=a.pd_type,t.remark_info=a.remark_info,t.first_asset=a.first_asset,t.first_amt=a.first_amt,t.pd_all_share=a.pd_all_share,t.crncy_type=a.crncy_type,t.apply_currency=a.apply_currency,t.coust_full_name=a.coust_full_name,t.coust_acco=a.coust_acco,t.coust_acco_name=a.coust_acco_name,t.pd_status=a.pd_status,t.cost_calc_type=a.cost_calc_type;
    
    #step2:插入未存在的产品信息
    insert into db_rpts.tb_rpt_productinfo(pd_no,pd_manager,ext_pd_no,create_date,create_time,update_date,update_time,
    curr_share, pre_share, his_max_per_nav, pre_nav, risk_free_interest_rate, follow_share, warn_value, stop_value,
    init_date,co_no,pd_code,pd_name,pd_flname,found_date,pd_type,remark_info,first_asset,first_amt,pd_all_share,crncy_type,apply_currency,coust_full_name,coust_acco,coust_acco_name,pd_status,cost_calc_type,exchange_permission)
    SELECT x.pd_no,t.manager_name as pd_manager,t.product_id as ext_pd_no,date_format(curdate(),'%Y%m%d') as create_date,date_format(CURTIME(),'%H%i%s') as create_time,date_format(curdate(),'%Y%m%d') as update_date,date_format(CURTIME(),'%H%i%s') as update_time,
    0 as curr_share,0 as pre_share,0 as his_max_per_nav,0 as pre_nav,0 as risk_free_interest_rate,0 as follow_share,0 as warn_value,0 as stop_value,
    t.init_date,x.co_no,t.pd_code,t.pd_name,t.pd_flname,t.found_date,t.pd_type,t.remark_info,t.first_asset,t.first_amt,t.pd_all_share,t.crncy_type,t.apply_currency,t.coust_full_name,t.coust_acco,t.coust_acco_name,t.pd_status,t.cost_calc_type,'1,2' as exchange_permission
    from db_dc.tb_dt1_act_productaccount t join db_dc.tb_extdata_productmap x on t.sys_no = x.sys_no and t.co_no = x.ext_co_no and t.product_id = x.ext_pd_no 
    where not exists(SELECT * from db_rpts.tb_rpt_productinfo a where a.co_no = x.co_no and t.product_id = a.ext_pd_no );
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_同步资管历史产品账户表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_ProductInfoHis;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_ProductInfoHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_begin_date int,
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
    declare v_pd_code varchar(32);
    declare v_begin_date int;
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
    SET v_pd_code = p_pd_code;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_同步资管产品持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_ProductPosition;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_ProductPosition(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_begin_date int,
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
    declare v_begin_date int;
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
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @机构编号# = ifnull(@机构编号#,0),@开始日期#=ifnull(@开始日期#,date_format(curdate(),'%Y%m%d')); */
    set v_co_no = ifnull(v_co_no,0),v_begin_date=ifnull(v_begin_date,date_format(curdate(),'%Y%m%d'));
    #step1:删除数据重新导入
    DELETE from db_rpts.tb_rpt_productholder where (co_no,pd_no) in (SELECT co_no,pd_no from db_dc.tb_extdata_productmap)

      /* and init_date >=@开始日期# and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and exch_no <> 99; */
      and init_date >=v_begin_date and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and exch_no <> 99;
    #step2:导入产品持仓数据

    /* INSERT INTO ~报表_报表数据_产品持仓表^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{机构编号},{产品编号},{外部产品编号},{产品编码},{产品名称},{市场编号},{股东代码编号},{证券代码编号},{资产账户},{股东代码},{证券代码},{证券名称},{投资类型},{证券类型},{资产类型},{资产类别},{期初数量},{当前数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{最新价},{证券市值}) */
    INSERT INTO db_rpts.tb_rpt_productholder(create_date,create_time,update_date,update_time,init_date,co_no,pd_no,ext_pd_no,pd_code,pd_name,exch_no,stock_acco_no,stock_code_no,asset_acco,stock_acco,stock_code,stock_name,invest_type,stock_type,asset_type,asset_kind,begin_qty,curr_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,last_price,stock_asset_value)
    SELECT
     DATE_FORMAT(CURDATE(), '%Y%m%d') AS create_date,
     DATE_FORMAT(NOW(), '%H%i%s') AS create_time,
     DATE_FORMAT(CURDATE(), '%Y%m%d') AS update_date,
     DATE_FORMAT(NOW(), '%H%i%s') AS update_time,
     k.init_date,
     t.co_no,
     t.pd_no,
     t.ext_pd_no,
     '' as product_code,
     '' as product_name,
     k.exchange_no,
     0 AS stock_acco_no,
     0 AS stock_code_no,
     k.asset_account,
     k.stock_account,
     k.stock_code,
     n.stock_name AS stock_name,
     k.invest_type,
     0 AS stock_type,
     0 AS asset_type,
     0 AS asset_kind,
     k.begin_qty,
     k.current_qty,
     k.frozen_qty,
     k.unfrozen_qty,
     k.current_cost_amt AS cost_amt,
     k.realize_pandl,
     k.interest_cost_amt,
     k.interest_pandl,
     n.last_price,
    (k.current_qty * n.last_price) as stock_asset_value
    from db_dc.tb_extdata_productmap t
    join db_dc.tb_act_productposition k on (t.ext_co_no,t.ext_pd_no) = (k.company_no,k.product_id)
    JOIN  db_dc.tb_act_stock_quotation n on (k.stock_code,k.exchange_no) = (n.stock_code,n.exchange_no)

    /* where k.init_date >=@开始日期# and (@机构编号# = 0 or t.{机构编号}=@机构编号#) and (@产品编号# = 0 or t.{产品编号}=@产品编号#); */
    where k.init_date >=v_begin_date and (v_co_no = 0 or t.co_no=v_co_no) and (v_pd_no = 0 or t.pd_no=v_pd_no);
    #更新产品名称
    update tb_rpt_productholder t join db_pf.tb_pffund_product_info x on (t.co_no,t.pd_no) = (x.co_no,x.pd_no)
    set t.pd_code = x.pd_code,t.pd_name = x.pd_name;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_同步资管历史产品持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_ProductPositionHis;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_ProductPositionHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_begin_date int,
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
    declare v_pd_code varchar(32);
    declare v_begin_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;

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
    SET v_pd_code = p_pd_code;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;

    
    label_pro:BEGIN
    

    /* set @开始日期# = ifnull(@开始日期#,0); */
    set v_begin_date = ifnull(v_begin_date,0);
    #临时表-产品的最大日期
    drop table if EXISTS tmp_max_rpt_pd;
    create temporary table tmp_max_rpt_pd
    SELECT x.co_no,x.pd_no,max(x.init_date) as max_init_date from

    /* (select x.co_no,x.pd_no,x.init_date from ~报表_报表数据_产品持仓表历史^ x */
    (select x.co_no,x.pd_no,x.init_date from db_rpts.tb_rpt_productholder_his x
    union all
    SELECT x.co_no,x.pd_no,0 from db_dc.tb_extdata_productmap x
    ) x
    group by x.co_no,x.pd_no;

    /* INSERT INTO ~报表_报表数据_产品持仓表历史^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{机构编号},{产品编号},{外部产品编号},{产品编码},{产品名称},{市场编号},{股东代码编号},{证券代码编号},{资产账户},{股东代码},{证券代码},{证券名称},{投资类型},{证券类型},{资产类型},{资产类别},{期初数量},{当前数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{最新价},{证券市值}) */
    INSERT INTO db_rpts.tb_rpt_productholder_his(create_date,create_time,update_date,update_time,init_date,co_no,pd_no,ext_pd_no,pd_code,pd_name,exch_no,stock_acco_no,stock_code_no,asset_acco,stock_acco,stock_code,stock_name,invest_type,stock_type,asset_type,asset_kind,begin_qty,curr_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,last_price,stock_asset_value)
    SELECT
     DATE_FORMAT(CURDATE(), '%Y%m%d') AS create_date,
     DATE_FORMAT(NOW(), '%H%i%s') AS create_time,
     DATE_FORMAT(CURDATE(), '%Y%m%d') AS update_date,
     DATE_FORMAT(NOW(), '%H%i%s') AS update_time,
     k.init_date,
     t.co_no,
     t.pd_no,
     t.ext_pd_no,
     m.product_code,
     m.product_name,
     k.exchange_no,
     0 AS stock_acco_no,
     0 AS stock_code_no,
     k.asset_account,
     k.stock_account,
     k.stock_code,
     n.stock_name,
     k.invest_type,
     n.stock_type,
     n.asset_type,
    (
      CASE
      WHEN n.asset_type IN (11) THEN
       2
      WHEN n.asset_type IN (21, 22, 23, 24, 25, 26, 27, 41) THEN
       3
      WHEN n.asset_type IN (51, 52, 53, 54, 55) THEN
       4
      WHEN n.asset_type IN (33) THEN
       5
      WHEN n.asset_type IN (32) THEN
       6
      WHEN n.asset_type IN (43) THEN
       7
      ELSE
       0
      END
     ) AS asset_kind,
    k.begin_qty,
     k.current_qty,
     k.frozen_qty,
     k.unfrozen_qty, k.current_cost_amt AS cost_amt,
     k.realize_pandl, k.interest_cost_amt, k.interest_pandl,
    k.last_price,(k.current_qty * k.last_price) as stock_asset_value
    FROM db_dc.tb_extdata_productmap t
    JOIN db_dc.tb_act_productposition_his k ON (t.ext_co_no, t.ext_pd_no) = (k.company_no, k.product_id)
    JOIN db_dc.tb_act_productaccount m ON (m.company_no, m.product_id) = (k.company_no, k.product_id)
    JOIN  db_dc.tb_act_stock_quotation n on (k.stock_code,k.exchange_no) = (n.stock_code,n.exchange_no)

    /* where k.init_date >=@开始日期# and (@机构编号# = 0 or t.{机构编号}=@机构编号#) and (@产品编号# = 0 or t.{产品编号}=@产品编号#) */
    where k.init_date >=v_begin_date and (v_co_no = 0 or t.co_no=v_co_no) and (v_pd_no = 0 or t.pd_no=v_pd_no)
    and exists (SELECT * from tmp_max_rpt_pd x where (t.co_no,t.pd_no) = (x.co_no,x.pd_no) and k.init_date > x.max_init_date )
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_同步资管产品单元资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_PdAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_PdAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_begin_date int,
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
    declare v_begin_date int;
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
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @机构编号# = ifnull(@机构编号#,0),@开始日期#=ifnull(@开始日期#,date_format(curdate(),'%Y%m%d')); */
    set v_co_no = ifnull(v_co_no,0),v_begin_date=ifnull(v_begin_date,date_format(curdate(),'%Y%m%d'));
    #step1:删除数据重新导入
    DELETE t from db_rpts.tb_rpt_productasset t where (t.co_no,t.pd_no) in (SELECT co_no,pd_no from db_dc.tb_extdata_productmap)

      /* and t.init_date >=@开始日期# and (@机构编号# = 0 or t.{机构编号}=@机构编号#) and (@产品编号# = 0 or t.{产品编号}=@产品编号#); */
      and t.init_date >=v_begin_date and (v_co_no = 0 or t.co_no=v_co_no) and (v_pd_no = 0 or t.pd_no=v_pd_no);
    #step2:导入产品资金数据

    /* insert into ~报表_报表数据_产品资产表^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{机构编号},{产品编号},{外部产品编号},{产品编码},{产品名称},{运行时长},{本币币种},{期初净资产},{净资产},{总资产},{股票资产},{期货资产},{期权资产},{权证资产},{基金资产},{现金资产},{回购资产},{债券资产},{单位净值},{昨日单位净值},{累计单位净值},{产品总份额},{当前份额},{累计应付金额},{累计应收金额},{净值比}) */
    insert into db_rpts.tb_rpt_productasset(create_date,create_time,update_date,update_time,init_date,co_no,pd_no,ext_pd_no,pd_code,pd_name,runtime,crncy_type,begin_NAV,nav_asset,total_asset,stock_asset,futu_asset,option_asset,warrant_asset,fund_asset,cash_asset,repo_asset,bond_asset,unit_nav,pre_pd_unit_nav,total_unit_nav,pd_all_share,curr_share,total_payab_amt,total_rece_amt,product_unit_nav_ration)
    SELECT
    DATE_FORMAT(CURDATE(), '%Y%m%d') AS create_date,
    DATE_FORMAT(NOW(), '%H%i%s') AS create_time,
    DATE_FORMAT(CURDATE(), '%Y%m%d') AS update_date,
    DATE_FORMAT(NOW(), '%H%i%s') AS update_time,
    k.init_date,
    t.co_no,
    t.pd_no,
    t.ext_pd_no,
    m.product_code as pd_code,
    m.product_name as pd_name,
    0 AS runtime,
    k.currency_type as crncy_type,
    sum(k.begin_NAV) AS begin_NAV,
    sum(k.NAV) AS nav_asset,
    sum(
    k.NAV + k.accumulative_payable
    ) AS total_asset,
    sum(k.equities_asset) AS stock_asset,
    sum(k.futuers_asset) AS futu_asset,
    0 AS option_asset,
    0 AS warrant_asset,
    sum(k.fund_asset) AS fund_asset,
    sum(k.cash_asset) AS cash_asset,
    sum(k.repo_asset) AS repo_asset,
    sum(k.fixedincome_asset) AS bond_asset,
    IFNULL(
    sum(k.NAV) / sum(k.current_share),
    0
    ) AS unit_nav,
    sum(k.pre_nav) / count(*) AS pre_pd_unit_nav,
    IFNULL(
    sum(k.NAV) / sum(k.current_share),
    0
    ) AS total_unit_nav,
    sum(k.current_share) AS pd_all_share,
    sum(k.current_share) AS curr_share,
    sum(k.accumulative_payable) AS total_payab_amt,
    sum(k.accumulative_receivable) AS total_rece_amt,
    IFNULL(
    sum(k.NAV) / sum(k.pre_nav * k.pre_share),
    0
    ) AS product_unit_nav_ration
    from db_dc.tb_extdata_productmap t
    join db_dc.tb_act_productunitasset k On (t.ext_co_no,t.ext_pd_no) = (k.company_no,k.product_id) AND k.unit_id = 0
    join db_dc.tb_act_productaccount m On (k.company_no,k.product_id,k.init_date) = (m.company_no,m.product_id,k.init_date)

    /* where k.init_date >=@开始日期# and (@机构编号# = 0 or t.{机构编号}=@机构编号#) and (@产品编号# = 0 or t.{产品编号}=@产品编号#) */
    where k.init_date >=v_begin_date and (v_co_no = 0 or t.co_no=v_co_no) and (v_pd_no = 0 or t.pd_no=v_pd_no)
    GROUP BY t.co_no,t.pd_no,k.currency_type,k.init_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_同步资管历史产品单元资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_PdAssetHis;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_PdAssetHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_begin_date int,
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
    declare v_pd_code varchar(32);
    declare v_begin_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;

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
    SET v_pd_code = p_pd_code;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;

    
    label_pro:BEGIN
    

    /* set @开始日期# = ifnull(@开始日期#,0); */
    set v_begin_date = ifnull(v_begin_date,0);
    #临时表-产品的最大日期
    drop table if EXISTS tmp_max_rpt_pd;
    create temporary table tmp_max_rpt_pd
    SELECT x.co_no,x.pd_no,max(x.init_date) as max_init_date from

    /* (select x.co_no,x.pd_no,x.init_date from ~报表_报表数据_产品资产表历史^ x */
    (select x.co_no,x.pd_no,x.init_date from db_rpts.tb_rpt_productasset_his x
    union all
    SELECT x.co_no,x.pd_no,0 from db_dc.tb_extdata_productmap x
    ) x
    group by x.co_no,x.pd_no;

    /* insert into ~报表_报表数据_产品资产表历史^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{机构编号},{产品编号},{外部产品编号},{产品编码},{产品名称},{运行时长},{本币币种},{期初净资产},{净资产},{总资产},{股票资产},{期货资产},{期权资产},{权证资产},{基金资产},{现金资产},{回购资产},{债券资产},{单位净值},{昨日单位净值},{累计单位净值},{产品总份额},{当前份额},{累计应付金额},{累计应收金额},{净值比}) */
    insert into db_rpts.tb_rpt_productasset_his(create_date,create_time,update_date,update_time,init_date,co_no,pd_no,ext_pd_no,pd_code,pd_name,runtime,crncy_type,begin_NAV,nav_asset,total_asset,stock_asset,futu_asset,option_asset,warrant_asset,fund_asset,cash_asset,repo_asset,bond_asset,unit_nav,pre_pd_unit_nav,total_unit_nav,pd_all_share,curr_share,total_payab_amt,total_rece_amt,product_unit_nav_ration)
    SELECT
     DATE_FORMAT(CURDATE(), '%Y%m%d') AS create_date,
     DATE_FORMAT(NOW(), '%H%i%s') AS create_time,
     DATE_FORMAT(CURDATE(), '%Y%m%d') AS update_date,
     DATE_FORMAT(NOW(), '%H%i%s') AS update_time,
     k.init_date,
     t.co_no,
     t.pd_no,
     t.ext_pd_no,
     n.pd_code,
     n.pd_name,
     TO_DAYS(k.init_date) - TO_DAYS(n.fund_found_date) AS runtime,
     k.currency_type as crncy_type,
     sum(k.begin_NAV) AS begin_NAV,
     sum(k.NAV) AS nav_asset,
     sum(
      k.NAV + k.accumulative_payable
     ) AS total_asset,
     sum(k.equities_asset) AS stock_asset,
     sum(k.futuers_asset) AS futu_asset,
     0 AS option_asset,
     0 AS warrant_asset,
     sum(k.fund_asset) AS fund_asset,
     sum(k.cash_asset) AS cash_asset,
     sum(k.repo_asset) AS repo_asset,
     sum(k.fixedincome_asset) AS bond_asset,
     IFNULL(
      sum(k.NAV) / sum(k.current_share),
      0
     ) AS unit_nav,
     sum(k.pre_nav) / count(*) AS pre_pd_unit_nav,
     IFNULL(
      sum(k.NAV) / sum(k.current_share),
      0
     ) AS total_unit_nav,
     sum(k.current_share) AS pd_all_share,
     sum(k.current_share) AS curr_share,
     sum(k.accumulative_payable) AS total_payab_amt,
     sum(k.accumulative_receivable) AS total_rece_amt,
     IFNULL(
      sum(k.NAV) / sum(k.pre_nav * k.pre_share),
      0
     ) AS product_unit_nav_ration
    FROM db_dc.tb_extdata_productmap t
    join db_dc.tb_act_productunitasset_his k on (t.ext_co_no,t.ext_pd_no) = (k.company_no,k.product_id) and k.unit_id = 0
    join db_dc.tb_act_productaccount m on (t.ext_co_no,t.ext_pd_no) = (m.company_no,m.product_id)
    join db_pf.tb_pffund_product_info n on (t.co_no,t.pd_no) = (n.co_no,n.pd_no)

    /* where k.init_date >=@开始日期# and (@机构编号# = 0 or t.{机构编号}=@机构编号#) and (@产品编号# = 0 or t.{产品编号}=@产品编号#) */
    where k.init_date >=v_begin_date and (v_co_no = 0 or t.co_no=v_co_no) and (v_pd_no = 0 or t.pd_no=v_pd_no)
    and exists (SELECT * from tmp_max_rpt_pd x where (t.co_no,t.pd_no) = (x.co_no,x.pd_no) and k.init_date > x.max_init_date )
    GROUP BY
     t.co_no,
     t.pd_no,
     k.currency_type,
     k.init_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_同步资管证券行情表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_StockQuotation;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_StockQuotation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_begin_date int,
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
    declare v_pd_code varchar(32);
    declare v_begin_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;

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
    SET v_pd_code = p_pd_code;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [删除表记录][报表_报表数据_证券行情表历史][{初始化日期} = @初始化日期#][14021503][@初始化日期#] */
    delete from db_rpts.tb_basesedt_stock_quot_his 
        where init_date = v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "rptA.2.15.14021503";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* insert into ~报表_报表数据_证券行情表历史^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{证券代码编号},{市场编号},{证券代码},{证券名称},{涨停价},{跌停价},{市盈率},{昨收盘价},{今开盘价},{今收盘价},{最新价},{今最高价},{今最低价},{成交数量},{成交金额},{票面面值},{公允价格},{债券计提利息},{净价标志},{资产类型},{证券类型},{买一价},{买一量},{买二价},{买二量},{买三价},{买三量},{买四价},{买四量},{买五价},{买五量},{卖一价},{卖一量},{卖二价},{卖二量},{卖三价},{卖三量},{卖四价},{卖四量},{卖五价},{卖五量},{时间戳}) */
    insert into db_rpts.tb_basesedt_stock_quot_his(create_date,create_time,update_date,update_time,init_date,stock_code_no,exch_no,stock_code,stock_name,up_limit_price,down_limit_price,pe_ratio,pre_close_price,today_open_price,today_close_price,last_price,today_max_price,today_min_price,strike_qty,strike_amt,par_value,fair_price,bond_accr_intrst,net_price_flag,asset_type,stock_type,buy_price_1,buy_qty_1,buy_price_2,buy_qty_2,buy_price_3,buy_qty_3,buy_price_4,buy_qty_4,buy_price_5,buy_qty_5,sell_price_1,sell_qty_1,sell_price_2,sell_qty_2,sell_price_3,sell_qty_3,sell_price_4,sell_qty_4,sell_price_5,sell_qty_5,time_stamp)
    SELECT t.init_date AS create_date,DATE_FORMAT(NOW(), '%H%i%s') AS create_time,t.init_date AS update_date,DATE_FORMAT(NOW(), '%H%i%s') AS update_time,t.init_date,0 AS stock_code_no,t.exch_no,t.stock_code,t.stock_name,t.up_limit_price,t.down_limit_price,t.pe_ratio,t.pre_close_price,t.today_open_price,t.today_close_price,t.last_price,t.today_max_price,t.today_min_price,t.strike_qty,t.strike_amt,t.par_value,
    t.fair_price,t.bond_accr_intrst,t.net_price_flag,t.asset_type,t.stock_type,t.buy_price_1,t.buy_qty_1,t.buy_price_2,t.buy_qty_2,t.buy_price_3,t.buy_qty_3,t.buy_price_4,t.buy_qty_4,t.buy_price_5,t.buy_qty_5,t.sell_price_1,t.sell_qty_1,t.sell_price_2,t.sell_qty_2,t.sell_price_3,t.sell_qty_3,t.sell_price_4,t.sell_qty_4,t.sell_price_5,t.sell_qty_5,unix_timestamp() AS time_stamp
    FROM db_dc.tb_act_stock_quotation t;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_同步资管历史证券行情表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_StockQuotationHis;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_StockQuotationHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_begin_date int,
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
    declare v_pd_code varchar(32);
    declare v_begin_date int;
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
    SET v_pd_code = p_pd_code;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_同步资管证券订单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_SecuOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_SecuOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_begin_date int,
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
    declare v_begin_date int;
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
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @机构编号# = ifnull(@机构编号#,0),@开始日期#=ifnull(@开始日期#,date_format(curdate(),'%Y%m%d')); */
    set v_co_no = ifnull(v_co_no,0),v_begin_date=ifnull(v_begin_date,date_format(curdate(),'%Y%m%d'));
    #step1:删除数据重新导入
    delete from db_rpts.tb_rpt_secu_order where (co_no,pd_no) in (SELECT co_no,pd_no from db_dc.tb_extdata_productmap x)
    

      /* and init_date >=@开始日期# and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#); */
      and init_date >=v_begin_date and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no);
    #step2:导入产品持仓数据
    insert into db_rpts.tb_rpt_secu_order(create_date,create_time,update_date,update_time,
    ext_pd_no,init_date,pd_no,
    all_fee,asset_acco,asset_type,bond_accr_intrst,brkage_fee,co_no,comm_id,comm_opor,compli_trig_id,crncy_type,exch_no,execution_bond_interest,external_no,invest_type,mach_date,net_price_flag,oper_statn,oper_way,opor_no,order_batch_no,order_date,order_dir,order_frozen_amt,order_no,order_price,order_qty,order_status,order_time,other_commis,other_fee,part_code,part_name,pass_no,pd_code,pd_name,price_type,remark_info,report_date,report_no,report_time,rsp_info,SEC_charges,stamp_tax,stock_acco,stock_code,stock_name,stock_type,strike_amt,strike_qty,trade_commis,trans_fee,unit_id,wtdraw_qty)
    
    SELECT date_format(curdate(),'%Y%m%d') as create_date,date_format(CURTIME(),'%H%i%s') as create_time,date_format(curdate(),'%Y%m%d') as update_date,date_format(CURTIME(),'%H%i%s') as update_time,
    x.ext_pd_no,t.mach_date as init_date,x.pd_no,
    t.all_fee,t.asset_acco,t.asset_type,t.bond_accr_intrst,t.brkage_fee,x.co_no,t.comm_id,t.comm_opor,t.compli_trig_id,t.crncy_type,t.exch_no,t.execution_bond_interest,t.external_no,t.invest_type,t.mach_date,t.net_price_flag,t.oper_statn,t.oper_way,t.opor_no,t.order_batch_no,t.order_date,t.order_dir,t.order_frozen_amt,t.order_no,t.order_price,t.order_qty,t.order_status,t.order_time,t.other_commis,t.other_fee,t.part_code,t.part_name,t.pass_no,t.pd_code,t.pd_name,t.price_type,t.remark_info,t.report_date,t.report_no,t.report_time,t.rsp_info,t.SEC_charges,t.stamp_tax,t.stock_acco,t.stock_code,t.stock_name,t.stock_type,t.strike_amt,t.strike_qty,t.trade_commis,t.trans_fee,t.unit_id,t.wtdraw_qty
    from 
    db_dc.tb_trd_secu_order t 
    join db_dc.tb_extdata_productmap x on t.sys_no = x.sys_no and t.co_no = x.ext_co_no and t.product_id = x.ext_pd_no 
    

    /* where t.mach_date >=@开始日期# and (@机构编号# = 0 or x.{机构编号}=@机构编号#) and (@产品编号# = 0 or x.{产品编号}=@产品编号#); */
    where t.mach_date >=v_begin_date and (v_co_no = 0 or x.co_no=v_co_no) and (v_pd_no = 0 or x.pd_no=v_pd_no);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_同步资管证券成交表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_SecuExecution;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_SecuExecution(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_begin_date int,
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
    declare v_begin_date int;
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
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @机构编号# = ifnull(@机构编号#,0),@开始日期#=ifnull(@开始日期#,date_format(curdate(),'%Y%m%d')); */
    set v_co_no = ifnull(v_co_no,0),v_begin_date=ifnull(v_begin_date,date_format(curdate(),'%Y%m%d'));
    #step1:删除数据重新导入
    delete from db_rpts.tb_rpt_secu_execution where (co_no,pd_no) in (SELECT co_no,pd_no from db_dc.tb_extdata_productmap x)
    

      /* and init_date >=@开始日期# and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#); */
      and init_date >=v_begin_date and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no);
    #step2:导入产品持仓数据
    insert into db_rpts.tb_rpt_secu_execution(create_date,create_time,update_date,update_time,
    ext_pd_no,init_date,pd_no,
    all_fee,asset_acco,bond_accr_intrst,brkage_fee,co_no,comm_id,crncy_type,exch_no,invest_type,net_price_flag,oper_way,opor_no,order_date,order_dir,order_no,order_price,order_qty,order_time,other_commis,other_fee,part_code,part_name,pass_no,pd_code,pd_name,report_date,report_no,SEC_charges,stamp_tax,stock_acco,stock_code,stock_name,stock_type,strike_amt,strike_date,strike_no,strike_price,strike_qty,strike_time,trade_commis,trans_fee,unit_id)
    
    SELECT date_format(curdate(),'%Y%m%d') as create_date,date_format(CURTIME(),'%H%i%s') as create_time,date_format(curdate(),'%Y%m%d') as update_date,date_format(CURTIME(),'%H%i%s') as update_time,
    x.ext_pd_no,t.mach_date as init_date,x.pd_no,
    t.all_fee,t.asset_acco,t.bond_accr_intrst,t.brkage_fee,x.co_no,t.comm_id,t.crncy_type,t.exch_no,t.invest_type,t.net_price_flag,t.oper_way,t.opor_no,t.order_date,t.order_dir,t.order_no,t.order_price,t.order_qty,t.order_time,t.other_commis,t.other_fee,t.part_code,t.part_name,t.pass_no,t.pd_code,t.pd_name,t.report_date,t.report_no,t.SEC_charges,t.stamp_tax,t.stock_acco,t.stock_code,t.stock_name,t.stock_type,t.strike_amt,t.strike_date,t.strike_no,t.strike_price,t.strike_qty,t.strike_time,t.trade_commis,t.trans_fee,t.unit_id
    from 
    db_dc.tb_trd_secu_execution t 
    join db_dc.tb_extdata_productmap x on t.sys_no = x.sys_no and t.co_no = x.ext_co_no and t.product_id = x.ext_pd_no
    

    /* where t.mach_date >=@开始日期# and (@机构编号# = 0 or x.{机构编号}=@机构编号#) and (@产品编号# = 0 or x.{产品编号}=@产品编号#); */
    where t.mach_date >=v_begin_date and (v_co_no = 0 or x.co_no=v_co_no) and (v_pd_no = 0 or x.pd_no=v_pd_no);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_新增报表产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Add_Rpt_Pd_Info;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Add_Rpt_Pd_Info(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_pd_name varchar(64),
    IN p_pd_flname varchar(255),
    IN p_pd_manager varchar(32),
    IN p_found_date int,
    IN p_pd_type int,
    IN p_apply_currency varchar(3),
    IN p_crncy_type varchar(3),
    IN p_first_asset decimal(18,4),
    IN p_first_amt decimal(18,4),
    IN p_pd_all_share decimal(18,2),
    IN p_curr_share decimal(18,2),
    IN p_pre_share decimal(18,2),
    IN p_his_max_per_nav decimal(18,4),
    IN p_pre_nav decimal(18,4),
    IN p_coust_full_name varchar(255),
    IN p_coust_acco varchar(16),
    IN p_coust_acco_name varchar(64),
    IN p_pd_status varchar(2),
    IN p_remark_info varchar(255),
    IN p_cost_calc_type int,
    IN p_risk_free_interest_rate decimal(18,12),
    IN p_allow_exch varchar(64),
    IN p_sys_no int,
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
    declare v_pd_no int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
    declare v_pd_name varchar(64);
    declare v_pd_flname varchar(255);
    declare v_pd_manager varchar(32);
    declare v_found_date int;
    declare v_pd_type int;
    declare v_apply_currency varchar(3);
    declare v_crncy_type varchar(3);
    declare v_first_asset decimal(18,4);
    declare v_first_amt decimal(18,4);
    declare v_pd_all_share decimal(18,2);
    declare v_curr_share decimal(18,2);
    declare v_pre_share decimal(18,2);
    declare v_his_max_per_nav decimal(18,4);
    declare v_pre_nav decimal(18,4);
    declare v_coust_full_name varchar(255);
    declare v_coust_acco varchar(16);
    declare v_coust_acco_name varchar(64);
    declare v_pd_status varchar(2);
    declare v_remark_info varchar(255);
    declare v_cost_calc_type int;
    declare v_risk_free_interest_rate decimal(18,12);
    declare v_allow_exch varchar(64);
    declare v_sys_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_last_year_pd_nav decimal(16,9);
    declare v_total_unit_nav decimal(18,4);
    declare v_borker_no int;
    declare v_borker_name varchar(64);
    declare v_commis_ratio decimal(18,12);
    declare v_broker_my_type int;
    declare v_share_net_total_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_pd_name = p_pd_name;
    SET v_pd_flname = p_pd_flname;
    SET v_pd_manager = p_pd_manager;
    SET v_found_date = p_found_date;
    SET v_pd_type = p_pd_type;
    SET v_apply_currency = p_apply_currency;
    SET v_crncy_type = p_crncy_type;
    SET v_first_asset = p_first_asset;
    SET v_first_amt = p_first_amt;
    SET v_pd_all_share = p_pd_all_share;
    SET v_curr_share = p_curr_share;
    SET v_pre_share = p_pre_share;
    SET v_his_max_per_nav = p_his_max_per_nav;
    SET v_pre_nav = p_pre_nav;
    SET v_coust_full_name = p_coust_full_name;
    SET v_coust_acco = p_coust_acco;
    SET v_coust_acco_name = p_coust_acco_name;
    SET v_pd_status = p_pd_status;
    SET v_remark_info = p_remark_info;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_risk_free_interest_rate = p_risk_free_interest_rate;
    SET v_allow_exch = p_allow_exch;
    SET v_sys_no = p_sys_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_last_year_pd_nav = 0;
    SET v_total_unit_nav = 0;
    SET v_borker_no = 0;
    SET v_borker_name = " ";
    SET v_commis_ratio = 0;
    SET v_broker_my_type = 0;
    SET v_share_net_total_type = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @上年产品净值# = 0; */
    set v_last_year_pd_nav = 0;

    /* set @累计单位净值# = 0; */
    set v_total_unit_nav = 0;

    /* set @券商编号# = 0; */
    set v_borker_no = 0;

    /* set @券商名称# = 0; */
    set v_borker_name = 0;

    /* set @佣金费率# = 0; */
    set v_commis_ratio = 0;

    /* set @券商自主类型# = 0; */
    set v_broker_my_type = 0;

    /* set @累计净值类型# = 0; */
    set v_share_net_total_type = 0;

    /* [记录不存在插入表记录][报表_报表数据_报表产品信息表][字段][字段变量][{机构编号}=@机构编号# and {产品编号}=@产品编号#][10002]["产品信息"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_productinfo (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, pd_no, 
        co_no, pd_code, pd_name, pd_flname, 
        pd_manager, found_date, pd_type, apply_currency, 
        crncy_type, first_asset, first_amt, pd_all_share, 
        curr_share, pre_share, his_max_per_nav, pre_nav, 
        last_year_pd_nav, total_unit_nav, coust_full_name, coust_acco, 
        coust_acco_name, pd_status, remark_info, cost_calc_type, 
        risk_free_interest_rate, allow_exch, borker_no, borker_name, 
        commis_ratio, broker_my_type, share_net_total_type) 
        select v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_pd_no, 
        v_co_no, v_pd_code, v_pd_name, v_pd_flname, 
        v_pd_manager, v_found_date, v_pd_type, v_apply_currency, 
        v_crncy_type, v_first_asset, v_first_amt, v_pd_all_share, 
        v_curr_share, v_pre_share, v_his_max_per_nav, v_pre_nav, 
        v_last_year_pd_nav, v_total_unit_nav, v_coust_full_name, v_coust_acco, 
        v_coust_acco_name, v_pd_status, v_remark_info, v_cost_calc_type, 
        v_risk_free_interest_rate, v_allow_exch, v_borker_no, v_borker_name, 
        v_commis_ratio, v_broker_my_type, v_share_net_total_type 
        from dual 
        where not exists(select * from db_rpts.tb_rpt_productinfo where co_no=v_co_no and pd_no=v_pd_no);
    if v_error_code <> "0" then
                
        SET v_error_code = "rptA.2.19.10002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("产品信息","#",v_mysql_message);
        else
            SET v_error_info = "产品信息";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询行业类别表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Industry;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Industry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_industry_std int,
    IN p_industry_classification int,
    IN p_industry_id int,
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
    declare v_industry_std int;
    declare v_industry_classification int;
    declare v_industry_id int;
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
    SET v_industry_std = p_industry_std;
    SET v_industry_classification = p_industry_classification;
    SET v_industry_id = p_industry_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_行业类别表][字段][(@行业标准# = 0 or {行业标准}=@行业标准#) and (@行业级别# = 0 or {行业级别}=@行业级别#) and (@行业编号# = 0 or {行业编号}=@行业编号#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, industry_id, 
        industry_code, indu_name, industry_classification, parent_industry_id, 
        industry_std, first_indu_code, first_industry_name, second_industry_code, 
        second_industry_name, third_industry_code, third_industry_name, remark_info from db_rpts.tb_sys_industry where (v_industry_std = 0 or industry_std=v_industry_std) and (v_industry_classification = 0 or industry_classification=v_industry_classification) and (v_industry_id = 0 or industry_id=v_industry_id);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, industry_id, 
        industry_code, indu_name, industry_classification, parent_industry_id, 
        industry_std, first_indu_code, first_industry_name, second_industry_code, 
        second_industry_name, third_industry_code, third_industry_name, remark_info from db_rpts.tb_sys_industry where (v_industry_std = 0 or industry_std=v_industry_std) and (v_industry_classification = 0 or industry_classification=v_industry_classification) and (v_industry_id = 0 or industry_id=v_industry_id) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询行业证券表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Industry_Stock;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Industry_Stock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_industry_std int,
    IN p_industry_classification int,
    IN p_industry_id int,
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
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_industry_std int;
    declare v_industry_classification int;
    declare v_industry_id int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_industry_std = p_industry_std;
    SET v_industry_classification = p_industry_classification;
    SET v_industry_id = p_industry_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_行业证券表][字段][(@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and (@资产类型# = 0 or {资产类型}=@资产类型#) and (@行业标准# = 0 or {行业标准}=@行业标准#) and (@行业级别# = 0 or {行业级别}=@行业级别#) and (@行业编号# = 0 or {行业编号}=@行业编号#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code_no, stock_code, stock_name, stock_type, 
        asset_type, industry_std, industry_id, industry_code, 
        indu_name, first_indu_code, first_industry_name, second_industry_code, 
        second_industry_name, third_industry_code, third_industry_name, fourth_industry_code, 
        fourth_industry_name, remark_info from db_rpts.tb_sys_industry_stock where (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_asset_type = 0 or asset_type=v_asset_type) and (v_industry_std = 0 or industry_std=v_industry_std) and (v_industry_classification = 0 or industry_classification=v_industry_classification) and (v_industry_id = 0 or industry_id=v_industry_id);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code_no, stock_code, stock_name, stock_type, 
        asset_type, industry_std, industry_id, industry_code, 
        indu_name, first_indu_code, first_industry_name, second_industry_code, 
        second_industry_name, third_industry_code, third_industry_name, fourth_industry_code, 
        fourth_industry_name, remark_info from db_rpts.tb_sys_industry_stock where (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_asset_type = 0 or asset_type=v_asset_type) and (v_industry_std = 0 or industry_std=v_industry_std) and (v_industry_classification = 0 or industry_classification=v_industry_classification) and (v_industry_id = 0 or industry_id=v_industry_id) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_初始化产品资产表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_Pd_Asset;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_Pd_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_last_init_date int,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_last_init_date int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_last_init_date = p_last_init_date;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @机构编号# = IFNULL(@机构编号#,0); */
    set v_co_no = IFNULL(v_co_no,0);

    /* set @产品编号# = IFNULL(@产品编号#,0); */
    set v_pd_no = IFNULL(v_pd_no,0);
    # part1: 【产品初始化】产品资产表的初始化
    UPDATE tb_rpt_productasset t join tb_rpt_productinfo p on (t.co_no,t.pd_no) = (p.co_no,p.pd_no)

     /* set t.{初始化日期} = f_get_exchs_init_date(p.exchange_permission) */
     set t.init_date = f_get_exchs_init_date(p.exchange_permission)

     /* where (t.{初始化日期} =@上日初始化日期# ) and (@机构编号# = 0 or t.{机构编号}=@机构编号#)
 and (@产品编号# = 0 or t.{产品编号}=@产品编号#); */
     where (t.init_date =v_last_init_date ) and (v_co_no = 0 or t.co_no=v_co_no)
      and (v_pd_no = 0 or t.pd_no=v_pd_no);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_初始化产品持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_Pd_Posi;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_Pd_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_last_init_date int,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_last_init_date int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_last_init_date = p_last_init_date;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @初始化日期# = IFNULL(@初始化日期#,0); */
    set v_init_date = IFNULL(v_init_date,0);

    /* set @机构编号# = IFNULL(@机构编号#,0); */
    set v_co_no = IFNULL(v_co_no,0);

    /* set @产品编号# = IFNULL(@产品编号#,0); */
    set v_pd_no = IFNULL(v_pd_no,0);
    # part1: 【产品初始化】产品持仓的初始化，产品的初始化日期=市场初始化日期，不能多
    UPDATE tb_rpt_productholder t  join tb_rpt_productinfo p on (t.co_no,t.pd_no) = (p.co_no,p.pd_no)

     /* set t.{初始化日期} = f_get_exchs_init_date(p.exchange_permission) */
     set t.init_date = f_get_exchs_init_date(p.exchange_permission)

     /* where (t.{初始化日期} =@上日初始化日期# ) and (@机构编号# = 0 or t.{机构编号}=@机构编号#)
 and (@产品编号# = 0 or t.{产品编号}=@产品编号#); */
     where (t.init_date =v_last_init_date ) and (v_co_no = 0 or t.co_no=v_co_no)
      and (v_pd_no = 0 or t.pd_no=v_pd_no);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_初始化产品自定义资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_Pd_Def_Asset;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_Pd_Def_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_last_init_date int,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_last_init_date int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_last_init_date = p_last_init_date;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @初始化日期# = IFNULL(@初始化日期#,0); */
    set v_init_date = IFNULL(v_init_date,0);

    /* set @机构编号# = IFNULL(@机构编号#,0); */
    set v_co_no = IFNULL(v_co_no,0);

    /* set @产品编号# = IFNULL(@产品编号#,0); */
    set v_pd_no = IFNULL(v_pd_no,0);
    # part1: 【产品初始化】产品持仓的初始化，产品的初始化日期=市场初始化日期，不能多
     UPDATE tb_rpt_pd_def_asset t  join tb_rpt_productinfo p on (t.co_no,t.pd_no) = (p.co_no,p.pd_no)

     /* set t.{初始化日期} = f_get_exchs_init_date(p.exchange_permission) */
     set t.init_date = f_get_exchs_init_date(p.exchange_permission)

     /* where (t.{初始化日期} =@上日初始化日期# ) and (@机构编号# = 0 or t.{机构编号}=@机构编号#)
 and (@产品编号# = 0 or t.{产品编号}=@产品编号#); */
     where (t.init_date =v_last_init_date ) and (v_co_no = 0 or t.co_no=v_co_no)
      and (v_pd_no = 0 or t.pd_no=v_pd_no);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_每日计算产品持仓市值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Calc_Pd_StockValue;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Calc_Pd_StockValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @机构编号# = IFNULL(@机构编号#,0); */
    set v_co_no = IFNULL(v_co_no,0);

    /* set @产品编号# = IFNULL(@产品编号#,0); */
    set v_pd_no = IFNULL(v_pd_no,0);
    #part1: 更新【产品持仓】"最新价"与“证券市值”
    update tb_rpt_productholder t join v_cur_pd_holder_value a on (t.init_date,t.stock_code,t.exch_no) = (a.init_date,a.stock_code,a.exch_no)
     set t.last_price = ifnull(a.last_price,0),t.stock_asset_value = ifnull(a.stock_asset_value,0), t.value_dirty_price = ifnull(a.value_dirty_price,0), t.value_net_price = ifnull(a.value_net_price,0),t.stock_type = a.stock_type,t.asset_kind = a.asset_kind,t.stock_name = a.stock_name,t.asset_type = a.asset_type

     /* where  (@机构编号# = 0 or t.{机构编号}=@机构编号#)
 and (@产品编号# = 0 or t.{产品编号}=@产品编号#); */
     where  (v_co_no = 0 or t.co_no=v_co_no)
      and (v_pd_no = 0 or t.pd_no=v_pd_no);
    #part2: 更新【产品资产】各项资产
    UPDATE db_rpts.tb_rpt_productasset t join v_rpt_pd_holder_asset a on (t.init_date,t.co_no,t.pd_no) = (a.init_date,a.co_no,a.pd_no)
     set t.stock_asset = a.stock_asset,
       t.bond_asset = a.bond_asset,
       t.fund_asset = a.fund_asset,
       t.repo_asset = a.repo_asset,
       t.option_asset = a.option_asset,
       t.warrant_asset = a.warrant_asset,
       t.total_asset = (t.cash_asset + t.total_rece_amt + a.stock_asset+ a.bond_asset+ a.fund_asset+ a.repo_asset+ a.option_asset+ a.warrant_asset),
       t.nav_asset = (t.total_asset - t.total_payab_amt),
       t.unit_nav = ifnull(round(t.nav_asset / t.curr_share,4),0),
       t.total_unit_nav = t.unit_nav,
       t.pre_pd_unit_nav = t.unit_nav

     /* where  (@机构编号# = 0 or t.{机构编号}=@机构编号#)
 and (@产品编号# = 0 or t.{产品编号}=@产品编号#); */
     where  (v_co_no = 0 or t.co_no=v_co_no)
      and (v_pd_no = 0 or t.pd_no=v_pd_no);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_备份数据产品资产表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Backup_Pd_Asset;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Backup_Pd_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_last_init_date int,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_last_init_date int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_last_init_date = p_last_init_date;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @初始化日期# = IFNULL(@初始化日期#,0); */
    set v_init_date = IFNULL(v_init_date,0);

    /* set @机构编号# = IFNULL(@机构编号#,0); */
    set v_co_no = IFNULL(v_co_no,0);

    /* set @产品编号# = IFNULL(@产品编号#,0); */
    set v_pd_no = IFNULL(v_pd_no,0);

    /* [备份_报表_历史数据][报表_报表数据_产品资产表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#)
 and (@产品编号# = 0 or {产品编号}=@产品编号#)][10014]["归档产品_资产表"] */
    /*part1: 删除历史表=初始化日期*/
    delete t from  db_rpts_his.tb_rpt_productasset_his t where (t.co_no,t.init_date) in (select co_no,init_date from db_rpts.tb_rpt_productasset x ) and (v_co_no = 0 or co_no=v_co_no)
     and (v_pd_no = 0 or pd_no=v_pd_no);
    /*part2: 归档到相应历史表*/
    insert into db_rpts_his.tb_rpt_productasset_his(create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, runtime, crncy_type, begin_NAV, 
        nav_asset, total_asset, stock_asset, futu_asset, 
        option_asset, warrant_asset, fund_asset, cash_asset, 
        repo_asset, bond_asset, other_asset, acco_cash, 
        cash_bala, apply_amt, redemp_amt, total_cash_divide, 
        money_fund_asset, unit_nav, pre_pd_unit_nav, total_unit_nav, 
        last_week_pd_nav, last_month_pd_nav, last_quarter_pd_nav, last_year_pd_nav, 
        pd_all_share, curr_share, pre_share, total_payab_amt, 
        total_rece_amt, product_unit_nav_ration, buy_amt, sellout_amt, 
        remark_info) SELECT create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, runtime, crncy_type, begin_NAV, 
        nav_asset, total_asset, stock_asset, futu_asset, 
        option_asset, warrant_asset, fund_asset, cash_asset, 
        repo_asset, bond_asset, other_asset, acco_cash, 
        cash_bala, apply_amt, redemp_amt, total_cash_divide, 
        money_fund_asset, unit_nav, pre_pd_unit_nav, total_unit_nav, 
        last_week_pd_nav, last_month_pd_nav, last_quarter_pd_nav, last_year_pd_nav, 
        pd_all_share, curr_share, pre_share, total_payab_amt, 
        total_rece_amt, product_unit_nav_ration, buy_amt, sellout_amt, 
        remark_info from db_rpts.tb_rpt_productasset t where (v_co_no = 0 or co_no=v_co_no)
     and (v_pd_no = 0 or pd_no=v_pd_no);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_备份数据产品持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Backup_Pd_Posi;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Backup_Pd_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_last_init_date int,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_last_init_date int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_last_init_date = p_last_init_date;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @初始化日期# = IFNULL(@初始化日期#,0); */
    set v_init_date = IFNULL(v_init_date,0);

    /* set @机构编号# = IFNULL(@机构编号#,0); */
    set v_co_no = IFNULL(v_co_no,0);

    /* set @产品编号# = IFNULL(@产品编号#,0); */
    set v_pd_no = IFNULL(v_pd_no,0);

    /* [备份_报表_历史数据][报表_报表数据_产品持仓表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#)
 and (@产品编号# = 0 or {产品编号}=@产品编号#)][10014]["归档产品_持仓表"] */
    /*part1: 删除历史表=初始化日期*/
    delete t from  db_rpts_his.tb_rpt_productholder_his t where (t.co_no,t.init_date) in (select co_no,init_date from db_rpts.tb_rpt_productholder x ) and (v_co_no = 0 or co_no=v_co_no)
     and (v_pd_no = 0 or pd_no=v_pd_no);
    /*part2: 归档到相应历史表*/
    insert into db_rpts_his.tb_rpt_productholder_his(create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, pd_code, pd_name, exch_no, 
        stock_acco_no, stock_code_no, asset_acco, stock_acco, 
        asset_acco_str, stock_acco_str, stock_code, stock_name, 
        invest_type, stock_type, asset_type, asset_kind, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        cost_amt, realize_pandl, intrst_cost_amt, intrst_pandl, 
        last_price, stock_asset_value, value_dirty_price, value_net_price, 
        buy_qty, buy_amt, sell_qty, sellout_amt, 
        record_count, record_remark) SELECT create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, pd_code, pd_name, exch_no, 
        stock_acco_no, stock_code_no, asset_acco, stock_acco, 
        asset_acco_str, stock_acco_str, stock_code, stock_name, 
        invest_type, stock_type, asset_type, asset_kind, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        cost_amt, realize_pandl, intrst_cost_amt, intrst_pandl, 
        last_price, stock_asset_value, value_dirty_price, value_net_price, 
        buy_qty, buy_amt, sell_qty, sellout_amt, 
        record_count, record_remark from db_rpts.tb_rpt_productholder t where (v_co_no = 0 or co_no=v_co_no)
     and (v_pd_no = 0 or pd_no=v_pd_no);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_备份数据产品订单表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Backup_Pd_SecuOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Backup_Pd_SecuOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_last_init_date int,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_last_init_date int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_last_init_date = p_last_init_date;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @初始化日期# = IFNULL(@初始化日期#,0); */
    set v_init_date = IFNULL(v_init_date,0);

    /* set @机构编号# = IFNULL(@机构编号#,0); */
    set v_co_no = IFNULL(v_co_no,0);

    /* set @产品编号# = IFNULL(@产品编号#,0); */
    set v_pd_no = IFNULL(v_pd_no,0);

    /* [备份_报表_历史数据][报表_报表数据_报表委托表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#)
 and (@产品编号# = 0 or {产品编号}=@产品编号#)][10014]["归档报表产品订单表"] */
    /*part1: 删除历史表=初始化日期*/
    delete t from  db_rpts_his.tb_rpt_secu_order_his t where (t.co_no,t.init_date) in (select co_no,init_date from db_rpts.tb_rpt_secu_order x ) and (v_co_no = 0 or co_no=v_co_no)
     and (v_pd_no = 0 or pd_no=v_pd_no);
    /*part2: 归档到相应历史表*/
    insert into db_rpts_his.tb_rpt_secu_order_his(create_date, create_time, update_date, 
        update_time, update_times, init_date, pd_no, 
        co_no, pd_code, pd_name, opor_no, 
        comm_opor, mach_date, external_no, order_batch_no, 
        order_no, comm_id, order_date, order_time, 
        unit_id, part_code, part_name, report_date, 
        report_time, report_no, pass_no, asset_acco, 
        stock_acco, exch_no, invest_type, asset_type, 
        stock_type, stock_code, stock_name, crncy_type, 
        order_dir, price_type, order_price, order_qty, 
        order_status, oper_way, wtdraw_qty, strike_amt, 
        strike_qty, oper_statn, all_fee, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, bond_accr_intrst, net_price_flag, 
        strike_bond_accr_intrst, order_frozen_amt, rsp_info, compli_trig_id, 
        remark_info, bank_ib_member, intrst_days, par_value, 
        bond_rate_type, impawn_ratio, order_frozen_qty, order_oper_way, 
        exter_comm_flag, out_acco, exch_crncy_type, stock_acco_no, 
        stock_code_no, trade_code_no, target_code_no, comm_batch_no, 
        record_valid_flag) SELECT create_date, create_time, update_date, 
        update_time, update_times, init_date, pd_no, 
        co_no, pd_code, pd_name, opor_no, 
        comm_opor, mach_date, external_no, order_batch_no, 
        order_no, comm_id, order_date, order_time, 
        unit_id, part_code, part_name, report_date, 
        report_time, report_no, pass_no, asset_acco, 
        stock_acco, exch_no, invest_type, asset_type, 
        stock_type, stock_code, stock_name, crncy_type, 
        order_dir, price_type, order_price, order_qty, 
        order_status, oper_way, wtdraw_qty, strike_amt, 
        strike_qty, oper_statn, all_fee, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, bond_accr_intrst, net_price_flag, 
        strike_bond_accr_intrst, order_frozen_amt, rsp_info, compli_trig_id, 
        remark_info, bank_ib_member, intrst_days, par_value, 
        bond_rate_type, impawn_ratio, order_frozen_qty, order_oper_way, 
        exter_comm_flag, out_acco, exch_crncy_type, stock_acco_no, 
        stock_code_no, trade_code_no, target_code_no, comm_batch_no, 
        record_valid_flag from db_rpts.tb_rpt_secu_order t where (v_co_no = 0 or co_no=v_co_no)
     and (v_pd_no = 0 or pd_no=v_pd_no);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_备份数据产品成交表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Backup_Pd_SecuExecution;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Backup_Pd_SecuExecution(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_last_init_date int,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_last_init_date int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_last_init_date = p_last_init_date;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @初始化日期# = IFNULL(@初始化日期#,0); */
    set v_init_date = IFNULL(v_init_date,0);

    /* set @机构编号# = IFNULL(@机构编号#,0); */
    set v_co_no = IFNULL(v_co_no,0);

    /* set @产品编号# = IFNULL(@产品编号#,0); */
    set v_pd_no = IFNULL(v_pd_no,0);

    /* [备份_报表_历史数据][报表_报表数据_报表成交表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#)
 and (@产品编号# = 0 or {产品编号}=@产品编号#)][10014]["归档报表产品成交表"] */
    /*part1: 删除历史表=初始化日期*/
    delete t from  db_rpts_his.tb_rpt_secu_execution_his t where (t.co_no,t.init_date) in (select co_no,init_date from db_rpts.tb_rpt_secu_execution x ) and (v_co_no = 0 or co_no=v_co_no)
     and (v_pd_no = 0 or pd_no=v_pd_no);
    /*part2: 归档到相应历史表*/
    insert into db_rpts_his.tb_rpt_secu_execution_his(create_date, create_time, update_date, 
        update_time, update_times, init_date, pd_no, 
        co_no, pd_code, pd_name, opor_no, 
        unit_id, part_code, part_name, report_date, 
        pass_no, comm_id, order_no, order_date, 
        order_time, report_no, asset_acco, stock_acco, 
        exch_no, invest_type, stock_type, stock_code, 
        stock_name, crncy_type, strike_price, order_dir, 
        order_price, order_qty, strike_date, strike_time, 
        strike_no, strike_qty, strike_amt, all_fee, 
        stamp_tax, trans_fee, brkage_fee, SEC_charges, 
        other_fee, trade_commis, other_commis, bond_accr_intrst, 
        net_price_flag, oper_way, bank_ib_member, out_acco, 
        stock_acco_no, stock_code_no, comm_batch_no, order_id, 
        intrst_days, par_value, bond_rate_type, impawn_ratio, 
        trade_code_no, target_code_no, order_oper_way, exter_comm_flag, 
        record_valid_flag) SELECT create_date, create_time, update_date, 
        update_time, update_times, init_date, pd_no, 
        co_no, pd_code, pd_name, opor_no, 
        unit_id, part_code, part_name, report_date, 
        pass_no, comm_id, order_no, order_date, 
        order_time, report_no, asset_acco, stock_acco, 
        exch_no, invest_type, stock_type, stock_code, 
        stock_name, crncy_type, strike_price, order_dir, 
        order_price, order_qty, strike_date, strike_time, 
        strike_no, strike_qty, strike_amt, all_fee, 
        stamp_tax, trans_fee, brkage_fee, SEC_charges, 
        other_fee, trade_commis, other_commis, bond_accr_intrst, 
        net_price_flag, oper_way, bank_ib_member, out_acco, 
        stock_acco_no, stock_code_no, comm_batch_no, order_id, 
        intrst_days, par_value, bond_rate_type, impawn_ratio, 
        trade_code_no, target_code_no, order_oper_way, exter_comm_flag, 
        record_valid_flag from db_rpts.tb_rpt_secu_execution t where (v_co_no = 0 or co_no=v_co_no)
     and (v_pd_no = 0 or pd_no=v_pd_no);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_备份数据产品自定义资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Backup_Pd_Def_Asset;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Backup_Pd_Def_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_last_init_date int,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_last_init_date int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_last_init_date = p_last_init_date;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @初始化日期# = IFNULL(@初始化日期#,0); */
    set v_init_date = IFNULL(v_init_date,0);

    /* set @机构编号# = IFNULL(@机构编号#,0); */
    set v_co_no = IFNULL(v_co_no,0);

    /* set @产品编号# = IFNULL(@产品编号#,0); */
    set v_pd_no = IFNULL(v_pd_no,0);

    /* [备份_报表_历史数据][报表_报表数据_报表产品自定义资产][字段][(@机构编号# = 0 or {机构编号}=@机构编号#)
 and (@产品编号# = 0 or {产品编号}=@产品编号#)][10014]["归档产品_持仓表"] */
    /*part1: 删除历史表=初始化日期*/
    delete t from  db_rpts_his.tb_rpt_pd_def_asset_his t where (t.co_no,t.init_date) in (select co_no,init_date from db_rpts.tb_rpt_pd_def_asset x ) and (v_co_no = 0 or co_no=v_co_no)
     and (v_pd_no = 0 or pd_no=v_pd_no);
    /*part2: 归档到相应历史表*/
    insert into db_rpts_his.tb_rpt_pd_def_asset_his(create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, crncy_type, def_asset_type, def_asset_field, 
        def_type, asset_value) SELECT create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, crncy_type, def_asset_type, def_asset_field, 
        def_type, asset_value from db_rpts.tb_rpt_pd_def_asset t where (v_co_no = 0 or co_no=v_co_no)
     and (v_pd_no = 0 or pd_no=v_pd_no);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询机构自定义资产类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Co_Def_AssetType;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Co_Def_AssetType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_def_type int,
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
    declare v_def_type int;
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
    SET v_def_type = p_def_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @定义类型# = IFNULL(@定义类型#,1); */
    set v_def_type = IFNULL(v_def_type,1);

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_机构资产分类表][字段][({定义类型}=@定义类型#) and ({机构编号}=@操作员机构编号#) order by show_order][@指定行数#]; */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        def_type, def_asset_type, def_asset_type_no, def_asset_name, 
        def_asset_field, parent_def_asset_type, show_order, calc_type, 
        remark_info from db_rpts.tb_rpt_co_def_asset_class where (def_type=v_def_type) and (co_no=v_opor_co_no) order by show_order;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        def_type, def_asset_type, def_asset_type_no, def_asset_name, 
        def_asset_field, parent_def_asset_type, show_order, calc_type, 
        remark_info from db_rpts.tb_rpt_co_def_asset_class where (def_type=v_def_type) and (co_no=v_opor_co_no) order by show_order limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_修改产品自定义资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Modi_Pd_Def_Asset;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Modi_Pd_Def_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_def_asset_type int,
    IN p_def_asset_field int,
    IN p_def_type int,
    IN p_asset_value decimal(18,4),
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
    declare v_input_date int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_def_asset_type int;
    declare v_def_asset_field int;
    declare v_def_type int;
    declare v_asset_value decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);
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
    SET v_input_date = p_input_date;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_def_asset_type = p_def_asset_type;
    SET v_def_asset_field = p_def_asset_field;
    SET v_def_type = p_def_type;
    SET v_asset_value = p_asset_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @本币币种# = 0; */
    set v_crncy_type = 0;

    /* set @定义类型# = IFNULL(@定义类型#,1); */
    set v_def_type = IFNULL(v_def_type,1);
    # select "step1:先判断是否查询历史表" ,@传入日期#,@初始化日期#;

    /* if (@传入日期#=@初始化日期#) then */
    if (v_input_date=v_init_date) then

    /* [删除表记录][报表_报表数据_报表产品自定义资产][{机构编号} = @操作员机构编号# and  {产品编号} = @产品编号# and {初始化日期} = @初始化日期# and {资产定义类型}=@资产定义类型#][10003]["报表_产品_自定义_资产"] */
    delete from db_rpts.tb_rpt_pd_def_asset 
        where co_no = v_opor_co_no and  pd_no = v_pd_no and init_date = v_init_date and def_asset_type=v_def_asset_type;
    if v_error_code = 1 then
                
        SET v_error_code = "rptA.2.62.10003";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("报表_产品_自定义_资产","#",v_mysql_message);
        else
            SET v_error_info = "报表_产品_自定义_资产";
        end if;
        leave label_pro;
    end if;


    /* [插入表记录][报表_报表数据_报表产品自定义资产][字段][字段变量][10002]["报表_产品_自定义_资产"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_pd_def_asset(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, crncy_type, def_asset_type, def_asset_field, 
        def_type, asset_value) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_crncy_type, v_def_asset_type, v_def_asset_field, 
        v_def_type, v_asset_value);
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.62.10002";
        SET v_error_info =  CONCAT("报表_产品_自定义_资产","#",v_mysql_message);
        leave label_pro;
    end if;

    end if;
    # step2:插入历史表

    /* set @初始化日期#=@传入日期#; */
    set v_init_date=v_input_date;

    /* [删除表记录][报表_报表数据_报表产品自定义历史资产][{机构编号} = @操作员机构编号# and  {产品编号} = @产品编号# and {初始化日期} = @初始化日期# and {资产定义类型}=@资产定义类型#][10003]["报表_产品_自定义_资产"] */
    delete from db_rpts.tb_rpt_pd_def_asset_his 
        where co_no = v_opor_co_no and  pd_no = v_pd_no and init_date = v_init_date and def_asset_type=v_def_asset_type;
    if v_error_code = 1 then
                
        SET v_error_code = "rptA.2.62.10003";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("报表_产品_自定义_资产","#",v_mysql_message);
        else
            SET v_error_info = "报表_产品_自定义_资产";
        end if;
        leave label_pro;
    end if;


    /* [插入表记录][报表_报表数据_报表产品自定义历史资产][字段][字段变量][10002]["报表_产品_自定义_资产"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_pd_def_asset_his(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, crncy_type, def_asset_type, def_asset_field, 
        def_type, asset_value) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_crncy_type, v_def_asset_type, v_def_asset_field, 
        v_def_type, v_asset_value);
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.62.10002";
        SET v_error_info =  CONCAT("报表_产品_自定义_资产","#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询产品自定义资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_Def_Asset;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_Def_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_pd_no int,
    IN p_def_asset_type int,
    IN p_def_type int,
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
    declare v_input_date int;
    declare v_pd_no int;
    declare v_def_asset_type int;
    declare v_def_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
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
    SET v_input_date = p_input_date;
    SET v_pd_no = p_pd_no;
    SET v_def_asset_type = p_def_asset_type;
    SET v_def_type = p_def_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @初始化日期# = 0; */
    set v_init_date = 0;

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* if (@传入日期#>=@初始化日期#) then */
    if (v_input_date>=v_init_date) then

    /* [获取表记录][报表_报表数据_报表产品自定义资产][字段][{机构编号} = @操作员机构编号# and (@产品编号#=0 or {产品编号} = @产品编号#) and (@定义类型# = 0 or {定义类型}=@定义类型#) and (@资产定义类型# = 0 or {资产定义类型}=@资产定义类型#) ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, crncy_type, def_asset_type, 
        def_asset_field, def_type, asset_value from db_rpts.tb_rpt_pd_def_asset where co_no = v_opor_co_no and (v_pd_no=0 or pd_no = v_pd_no) and (v_def_type = 0 or def_type=v_def_type) and (v_def_asset_type = 0 or def_asset_type=v_def_asset_type) ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, crncy_type, def_asset_type, 
        def_asset_field, def_type, asset_value from db_rpts.tb_rpt_pd_def_asset where co_no = v_opor_co_no and (v_pd_no=0 or pd_no = v_pd_no) and (v_def_type = 0 or def_type=v_def_type) and (v_def_asset_type = 0 or def_asset_type=v_def_asset_type)  limit v_row_count;
    end if;

    else

    /* set @初始化日期#=@传入日期#; */
    set v_init_date=v_input_date;

    /* [获取表记录][报表_报表数据_报表产品自定义历史资产][字段][{机构编号} = @操作员机构编号# and (@产品编号#=0 or {产品编号} = @产品编号#) and {初始化日期} = @初始化日期# and (@定义类型# = 0 or {定义类型}=@定义类型#) and (@资产定义类型# = 0 or {资产定义类型}=@资产定义类型#) and ({机构编号},{产品编号}) in (select x.{机构编号},x.{产品编号} from ~报表_报表数据_报表产品信息表^ x where x.{产品状态} = 1) ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, crncy_type, def_asset_type, 
        def_asset_field, def_type, asset_value from db_rpts.tb_rpt_pd_def_asset_his where co_no = v_opor_co_no and (v_pd_no=0 or pd_no = v_pd_no) and init_date = v_init_date and (v_def_type = 0 or def_type=v_def_type) and (v_def_asset_type = 0 or def_asset_type=v_def_asset_type) and (co_no,pd_no) in (select x.co_no,x.pd_no from db_rpts.tb_rpt_productinfo x where x.pd_status = 1) ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, crncy_type, def_asset_type, 
        def_asset_field, def_type, asset_value from db_rpts.tb_rpt_pd_def_asset_his where co_no = v_opor_co_no and (v_pd_no=0 or pd_no = v_pd_no) and init_date = v_init_date and (v_def_type = 0 or def_type=v_def_type) and (v_def_asset_type = 0 or def_asset_type=v_def_asset_type) and (co_no,pd_no) in (select x.co_no,x.pd_no from db_rpts.tb_rpt_productinfo x where x.pd_status = 1)  limit v_row_count;
    end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_计算产品自定义资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Calc_Pd_Def_Asset;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Calc_Pd_Def_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_calc_time int,
    IN p_def_asset_type int,
    IN p_def_type int,
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
    declare v_input_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_calc_time int;
    declare v_def_asset_type int;
    declare v_def_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sql_content varchar(10000);
    declare v_exe_sql_result int;
    declare v_sql_grp_no bigint;
    declare v_sql_grp_name varchar(64);
    declare v_exe_seq int;
    declare v_exe_sql_no int;
    declare v_exe_sql_name varchar(64);
    declare v_exe_sql_str varchar(10000);
    declare v_in_params_value varchar(2048);
    declare v_curr_tmstp int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_sql_exe_time decimal(18,4);
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
    SET v_input_date = p_input_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_calc_time = p_calc_time;
    SET v_def_asset_type = p_def_asset_type;
    SET v_def_type = p_def_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sql_content = " ";
    SET v_exe_sql_result = 0;
    SET v_sql_grp_no = 0;
    SET v_sql_grp_name = " ";
    SET v_exe_seq = 0;
    SET v_exe_sql_no = 0;
    SET v_exe_sql_name = " ";
    SET v_exe_sql_str = " ";
    SET v_in_params_value = " ";
    SET v_curr_tmstp = unix_timestamp();
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_sql_exe_time = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @完整语句内容# = " "; */
    set v_sql_content = " ";

    /* set @执行结果# = 0; */
    set v_exe_sql_result = 0;

    /* set @错误信息# = " "; */
    set v_error_info = " ";
    #step1: “执行顺序”获取【基础_执行语句_执行组_执行语句】
    #step2： 【游标】拼接【限定机构、产品】

    /* [声明游标][报表_报表数据_视图机构自定义资产执行SQL][ {机构编号},{组号},{组名},{执行顺序},{执行语句编号},{执行语句名称},{执行语句},{输入参数值}][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@计算时点#=0 or FIND_IN_SET(@计算时点#,calc_times) > 0) and {定义类型}=@定义类型#][cursor_exesqls] */
    cursor_exesqls:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_exesqls CURSOR FOR
        select  co_no,sql_grp_no,sql_grp_name,exe_seq,exe_sql_no,exe_sql_name,exe_sql_str,in_params_value 
        from db_rpts.v_co_def_asset_exe_sql 
        where (v_co_no = 0 or co_no=v_co_no) and (v_calc_time=0 or FIND_IN_SET(v_calc_time,calc_times) > 0) and def_type=v_def_type;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@机构编号#,@组号#,@组名#,@执行顺序#,@执行语句编号#,@执行语句名称#,@执行语句#,@输入参数值#][cursor_exesqls][loop_exesqls] */
    open cursor_exesqls;
    loop_exesqls: LOOP
    fetch cursor_exesqls into v_co_no,v_sql_grp_no,v_sql_grp_name,v_exe_seq,v_exe_sql_no,v_exe_sql_name,v_exe_sql_str,v_in_params_value;
        IF v_cursor_done THEN
            LEAVE loop_exesqls;
        END IF;

    #step3：注意：1.执行sql不能有多个”；“

    /* set @输入参数值# = if(@机构编号# = 0,@输入参数值#,concat(@输入参数值#,',',char(64),'p_co_no:=',@机构编号#)); */
    set v_in_params_value = if(v_co_no = 0,v_in_params_value,concat(v_in_params_value,',',char(64),'p_co_no:=',v_co_no));

    /* set @输入参数值# = if(@产品编号# = 0,@输入参数值#,concat(@输入参数值#,',',char(64),'p_pd_no:=',@产品编号#)); */
    set v_in_params_value = if(v_pd_no = 0,v_in_params_value,concat(v_in_params_value,',',char(64),'p_pd_no:=',v_pd_no));

    /* set @输入参数值# = f_get_param_values(@输入参数值#); */
    set v_in_params_value = f_get_param_values(v_in_params_value);

    /* set @执行语句# = if(trim(@输入参数值#) = '', @执行语句#, REPLACE(@执行语句#,'?',@输入参数值#)); */
    set v_exe_sql_str = if(trim(v_in_params_value) = '', v_exe_sql_str, REPLACE(v_exe_sql_str,'?',v_in_params_value));
    # select @执行语句#,@输入参数值#;

    /* set @当前时间戳# = unix_timestamp(); */
    set v_curr_tmstp = unix_timestamp();

    /* [执行语句][@执行语句#] */
    set @tmp_sql = v_exe_sql_str;
    PREPARE stmt from @tmp_sql;
    EXECUTE stmt;
    set @tmp_sql = '';
    DEALLOCATE PREPARE stmt;

    # [退出循环][cursor_exesqls]
    # leave label_pro;
    #step4：记录执行sql的结果
    # set @执行耗时# = (UNIX_TIMESTAMP(NOW())-@当前时间戳# ),@完整语句内容# = @执行语句#,@执行结果# = v_mysql_sqlstate;

    /* set @创建日期# = date_format(curdate(),'%Y%m%d'),@创建时间# = date_format(curtime(),'%H%i%s'),@更新日期# = date_format(curdate(),'%Y%m%d'),@更新时间# = date_format(curtime(),'%H%i%s'); */
    set v_create_date = date_format(curdate(),'%Y%m%d'),v_create_time = date_format(curtime(),'%H%i%s'),v_update_date = date_format(curdate(),'%Y%m%d'),v_update_time = date_format(curtime(),'%H%i%s');

    /* set @执行耗时# = (UNIX_TIMESTAMP(NOW())-@当前时间戳# ),@完整语句内容# = @执行语句#,@执行结果# = v_mysql_number; */
    set v_sql_exe_time = (UNIX_TIMESTAMP(NOW())-v_curr_tmstp ),v_sql_content = v_exe_sql_str,v_exe_sql_result = v_mysql_number;

    /* [插入表记录][报表_报表数据_基础执行执行语句流水][{创建日期},{创建时间},{更新日期},{更新时间},{组号},{组名},{执行顺序},{执行语句编号},{执行语句名称},{执行耗时},{完整语句内容},{执行结果},{错误信息}][@创建日期#, @创建时间#,@更新日期#,@更新时间#,@组号#,@组名#,@执行顺序#,@执行语句编号#,@执行语句名称#,@执行耗时#,@完整语句内容#,@执行结果#,@错误信息#][10002]["基础_执行_执行语句_流水"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_init_exe_sql_grps_jour(
        create_date,create_time,update_date,update_time,sql_grp_no,sql_grp_name,exe_seq,exe_sql_no,exe_sql_name,sql_exe_time,sql_content,exe_sql_result,error_info) 
    value( 
        v_create_date, v_create_time,v_update_date,v_update_time,v_sql_grp_no,v_sql_grp_name,v_exe_seq,v_exe_sql_no,v_exe_sql_name,v_sql_exe_time,v_sql_content,v_exe_sql_result,v_error_info);
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.64.10002";
        SET v_error_info =  CONCAT("基础_执行_执行语句_流水","#",v_mysql_message);
        close cursor_exesqls;
        leave label_pro;
    end if;


    /* [关闭游标][cursor_exesqls] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_exesqls;
    end cursor_exesqls;

    #更新当前表
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询机构自定义资产字段列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Co_Def_Asset_Fields;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Co_Def_Asset_Fields(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_def_type int,
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
    declare v_def_type int;
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
    SET v_def_type = p_def_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_产品执行SQL
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Pd_Execute_Sql;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Pd_Execute_Sql(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_input_date int,
    IN p_pd_no int,
    IN p_sql_grp_no_str varchar(255),
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
    declare v_input_date int;
    declare v_pd_no int;
    declare v_sql_grp_no_str varchar(255);
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
    SET v_input_date = p_input_date;
    SET v_pd_no = p_pd_no;
    SET v_sql_grp_no_str = p_sql_grp_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询调用命令表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Basic_Cmd;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Basic_Cmd(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_cmd_id int,
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
    declare v_cmd_id int;
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
    SET v_cmd_id = p_cmd_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select * from ~报表_报表数据_调用命令表^ t */
    select * from db_rpts.tb_rpt_basic_cmd t

    /* where (@命令编号# =  0 or {命令编号}=@命令编号#) */
    where (v_cmd_id =  0 or cmd_id=v_cmd_id)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询同步状态表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Basic_SyncInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Basic_SyncInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sync_no int,
    IN p_sync_name varchar(64),
    IN p_target_db_name varchar(64),
    IN p_target_table_name varchar(64),
    IN p_source_db_name varchar(64),
    IN p_source_table_name varchar(64),
    IN p_sync_type int,
    IN p_sync_status int,
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
    declare v_sync_no int;
    declare v_sync_name varchar(64);
    declare v_target_db_name varchar(64);
    declare v_target_table_name varchar(64);
    declare v_source_db_name varchar(64);
    declare v_source_table_name varchar(64);
    declare v_sync_type int;
    declare v_sync_status int;
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
    SET v_sync_no = p_sync_no;
    SET v_sync_name = p_sync_name;
    SET v_target_db_name = p_target_db_name;
    SET v_target_table_name = p_target_table_name;
    SET v_source_db_name = p_source_db_name;
    SET v_source_table_name = p_source_table_name;
    SET v_sync_type = p_sync_type;
    SET v_sync_status = p_sync_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select * from ~报表_报表数据_同步状态表^ t */
    select * from db_rpts.tb_rpt_basic_sync_info t

    /* where (@目标数据表名称# = " " or {目标数据表名称}=@目标数据表名称#) */
    where (v_target_table_name = " " or target_table_name=v_target_table_name)

     /* and (@同步编号# = 0 or {同步编号}=@同步编号#) */
     and (v_sync_no = 0 or sync_no=v_sync_no)

     /* and (@同步名称# = " " or {同步名称}=@同步名称#) */
     and (v_sync_name = " " or sync_name=v_sync_name)

     /* and (@同步类型# = 0 or {同步类型}=@同步类型#) */
     and (v_sync_type = 0 or sync_type=v_sync_type)

     /* and (@同步状态# = 0 or {同步状态}=@同步状态#) */
     and (v_sync_status = 0 or sync_status=v_sync_status)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_修改交易组附加属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Modi_Exgp_Ex_Info;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Modi_Exgp_Ex_Info(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_co_no int,
    IN p_exch_group_no int,
    IN p_first_asset decimal(18,4),
    IN p_first_amt decimal(18,4),
    IN p_curr_share decimal(18,2),
    IN p_strategy_type int,
    IN p_total_pre_fee decimal(18,4),
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
    declare v_pd_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
    declare v_first_asset decimal(18,4);
    declare v_first_amt decimal(18,4);
    declare v_curr_share decimal(18,2);
    declare v_strategy_type int;
    declare v_total_pre_fee decimal(18,4);
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
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_first_asset = p_first_asset;
    SET v_first_amt = p_first_amt;
    SET v_curr_share = p_curr_share;
    SET v_strategy_type = p_strategy_type;
    SET v_total_pre_fee = p_total_pre_fee;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [删除表记录][报表_报表数据_报表交易组附加属性表][{机构编号} = @机构编号# and  {产品编号} = @产品编号#  and {交易组编号} = @交易组编号# ][10003]["报表_交易组_附加属性表"] */
    delete from db_rpts.tb_rpt_exgp_ex_info 
        where co_no = v_co_no and  pd_no = v_pd_no  and exch_group_no = v_exch_group_no ;
    if v_error_code = 1 then
                
        SET v_error_code = "rptA.2.101.10003";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("报表_交易组_附加属性表","#",v_mysql_message);
        else
            SET v_error_info = "报表_交易组_附加属性表";
        end if;
        leave label_pro;
    end if;


    /* [插入表记录][报表_报表数据_报表交易组附加属性表][字段][字段变量][10002]["报表_交易组_附加属性表"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_exgp_ex_info(
        create_date, create_time, update_date, 
        update_time, update_times, pd_no, co_no, 
        exch_group_no, first_asset, first_amt, curr_share, 
        strategy_type, total_pre_fee, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pd_no, v_co_no, 
        v_exch_group_no, v_first_asset, v_first_amt, v_curr_share, 
        v_strategy_type, v_total_pre_fee, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.101.10002";
        SET v_error_info =  CONCAT("报表_交易组_附加属性表","#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询产品区间统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_Region_Stat;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_Region_Stat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_curr_month int,
    IN p_region_type int,
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
    declare v_pd_no int;
    declare v_curr_month int;
    declare v_region_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_curr_month = p_curr_month;
    SET v_region_type = p_region_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_报表产品区间统计][字段][({机构编号}=@操作员机构编号#) and ({产品编号}=@产品编号#) and ({区间类型}=@区间类型#) ][@指定行数#]; */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, curr_month, region_type, 
        region_type_name, begin_date, end_date, stat_days, 
        rise_days, fall_days, max_cont_rise_days, max_cont_fall_days, 
        day_win_ratio, week_cnt, rise_weeks, fall_weeks, 
        week_win_ratio, begin_share_net_total, end_share_net_total from db_rpts.tb_rpt_pd_region_stat where (co_no=v_opor_co_no) and (pd_no=v_pd_no) and (region_type=v_region_type) ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, curr_month, region_type, 
        region_type_name, begin_date, end_date, stat_days, 
        rise_days, fall_days, max_cont_rise_days, max_cont_fall_days, 
        day_win_ratio, week_cnt, rise_weeks, fall_weeks, 
        week_win_ratio, begin_share_net_total, end_share_net_total from db_rpts.tb_rpt_pd_region_stat where (co_no=v_opor_co_no) and (pd_no=v_pd_no) and (region_type=v_region_type)  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询指数区间统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Index_Region_Stat;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Index_Region_Stat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_indicator_id int,
    IN p_curr_month int,
    IN p_region_type int,
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
    declare v_indicator_id int;
    declare v_curr_month int;
    declare v_region_type int;
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
    SET v_indicator_id = p_indicator_id;
    SET v_curr_month = p_curr_month;
    SET v_region_type = p_region_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询产品指数区间统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_Index_Region_Stat;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_Index_Region_Stat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_curr_month int,
    IN p_region_type int,
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
    declare v_pd_no int;
    declare v_curr_month int;
    declare v_region_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_curr_month = p_curr_month;
    SET v_region_type = p_region_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_报表产品区间统计][字段][({机构编号}=@操作员机构编号#) and ({产品编号}=@产品编号#) and ({区间类型}=@区间类型#) ][@指定行数#]; */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, curr_month, region_type, 
        region_type_name, begin_date, end_date, stat_days, 
        rise_days, fall_days, max_cont_rise_days, max_cont_fall_days, 
        day_win_ratio, week_cnt, rise_weeks, fall_weeks, 
        week_win_ratio, begin_share_net_total, end_share_net_total from db_rpts.tb_rpt_pd_region_stat where (co_no=v_opor_co_no) and (pd_no=v_pd_no) and (region_type=v_region_type) ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, curr_month, region_type, 
        region_type_name, begin_date, end_date, stat_days, 
        rise_days, fall_days, max_cont_rise_days, max_cont_fall_days, 
        day_win_ratio, week_cnt, rise_weeks, fall_weeks, 
        week_win_ratio, begin_share_net_total, end_share_net_total from db_rpts.tb_rpt_pd_region_stat where (co_no=v_opor_co_no) and (pd_no=v_pd_no) and (region_type=v_region_type)  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询产品区间指标
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_Region_Indicator;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_Region_Indicator(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_curr_month int,
    IN p_region_type int,
    IN p_indicator_id int,
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
    declare v_pd_no int;
    declare v_curr_month int;
    declare v_region_type int;
    declare v_indicator_id int;
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
    SET v_pd_no = p_pd_no;
    SET v_curr_month = p_curr_month;
    SET v_region_type = p_region_type;
    SET v_indicator_id = p_indicator_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_报表产品区间指标][字段][({机构编号}=@操作员机构编号#) and ({产品编号}=@产品编号#) and ({区间类型}=@区间类型#) and (@指标编号# = 0 or {指标编号}=@指标编号#) ][@指定行数#]; */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, curr_month, region_type, 
        region_type_name, begin_date, end_date, indicator_id, 
        indicator_name, indicator_value, remark_info from db_rpts.tb_rpt_pd_region_indicator where (co_no=v_opor_co_no) and (pd_no=v_pd_no) and (region_type=v_region_type) and (v_indicator_id = 0 or indicator_id=v_indicator_id) ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, curr_month, region_type, 
        region_type_name, begin_date, end_date, indicator_id, 
        indicator_name, indicator_value, remark_info from db_rpts.tb_rpt_pd_region_indicator where (co_no=v_opor_co_no) and (pd_no=v_pd_no) and (region_type=v_region_type) and (v_indicator_id = 0 or indicator_id=v_indicator_id)  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询指数区间指标
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Index_Region_Indicator;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Index_Region_Indicator(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_curr_month int,
    IN p_region_type int,
    IN p_indicator_id int,
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
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_curr_month int;
    declare v_region_type int;
    declare v_indicator_id int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_count int;
    declare v_pd_no int;

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
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_curr_month = p_curr_month;
    SET v_region_type = p_region_type;
    SET v_indicator_id = p_indicator_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;
    SET v_pd_no = 0;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_报表产品区间指标][字段][({机构编号}=@操作员机构编号#) and ({产品编号}=@产品编号#) and ({区间类型}=@区间类型#) and (@指标编号# = 0 or {指标编号}=@指标编号#) ][@指定行数#]; */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, curr_month, region_type, 
        region_type_name, begin_date, end_date, indicator_id, 
        indicator_name, indicator_value, remark_info from db_rpts.tb_rpt_pd_region_indicator where (co_no=v_opor_co_no) and (pd_no=v_pd_no) and (region_type=v_region_type) and (v_indicator_id = 0 or indicator_id=v_indicator_id) ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, curr_month, region_type, 
        region_type_name, begin_date, end_date, indicator_id, 
        indicator_name, indicator_value, remark_info from db_rpts.tb_rpt_pd_region_indicator where (co_no=v_opor_co_no) and (pd_no=v_pd_no) and (region_type=v_region_type) and (v_indicator_id = 0 or indicator_id=v_indicator_id)  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询产品业绩基准区间指标
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_Std_Region_Indicator;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_Std_Region_Indicator(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_curr_month int,
    IN p_region_type int,
    IN p_indicator_id int,
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
    declare v_pd_no int;
    declare v_curr_month int;
    declare v_region_type int;
    declare v_indicator_id int;
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
    SET v_pd_no = p_pd_no;
    SET v_curr_month = p_curr_month;
    SET v_region_type = p_region_type;
    SET v_indicator_id = p_indicator_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_报表产品业绩基准区间指标][字段][({机构编号}=@操作员机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#)  and ( {当前月份} = 0 or {当前月份} = @当前月份#)and (@区间类型# = 0 or {区间类型}=@区间类型#) and (@指标编号# = 0 or {指标编号}=@指标编号#) ][@指定行数#]; */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, curr_month, region_type, region_type_name, 
        begin_date, end_date, indicator_id, indicator_name, 
        indicator_value, remark_info, achi_compa_crite, achi_crite_value, 
        cmp_value, indicator_memo from db_rpts.tb_rpt_pd_std_region_indicator where (co_no=v_opor_co_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and ( curr_month = 0 or curr_month = v_curr_month)and (v_region_type = 0 or region_type=v_region_type) and (v_indicator_id = 0 or indicator_id=v_indicator_id) ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, curr_month, region_type, region_type_name, 
        begin_date, end_date, indicator_id, indicator_name, 
        indicator_value, remark_info, achi_compa_crite, achi_crite_value, 
        cmp_value, indicator_memo from db_rpts.tb_rpt_pd_std_region_indicator where (co_no=v_opor_co_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and ( curr_month = 0 or curr_month = v_curr_month)and (v_region_type = 0 or region_type=v_region_type) and (v_indicator_id = 0 or indicator_id=v_indicator_id)  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_新增产品日净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Add_Pd_Day_Net;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Add_Pd_Day_Net(
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
    IN p_share_net decimal(18,4),
    IN p_last_share_net decimal(18,4),
    IN p_share_net_total decimal(18,4),
    IN p_pre_share_net_total decimal(18,4),
    IN p_net_change decimal(18,4),
    IN p_grp_row bigint,
    IN p_nav_asset decimal(18,4),
    IN p_asset_market_value decimal(18,4),
    IN p_fund_share_total decimal(18,2),
    IN p_fund_asset_net decimal(18,4),
    IN p_pre_fee_share_net_total decimal(18,4),
    IN p_post_fee_share_net_total decimal(18,4),
    IN p_achieve_performance decimal(18,4),
    IN p_recover_param decimal(18,12),
    IN p_last_init_date int,
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
    declare v_share_net decimal(18,4);
    declare v_last_share_net decimal(18,4);
    declare v_share_net_total decimal(18,4);
    declare v_pre_share_net_total decimal(18,4);
    declare v_net_change decimal(18,4);
    declare v_grp_row bigint;
    declare v_nav_asset decimal(18,4);
    declare v_asset_market_value decimal(18,4);
    declare v_fund_share_total decimal(18,2);
    declare v_fund_asset_net decimal(18,4);
    declare v_pre_fee_share_net_total decimal(18,4);
    declare v_post_fee_share_net_total decimal(18,4);
    declare v_achieve_performance decimal(18,4);
    declare v_recover_param decimal(18,12);
    declare v_last_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_net_growth_rate decimal(18,12);
    declare v_pd_nav_day_ratio decimal(18,12);
    declare v_pd_nav_month_ratio decimal(18,12);
    declare v_total_realiz_pandl_ratio decimal(18,12);
    declare v_divi_amt decimal(18,4);
    declare v_divi_share decimal(18,4);
    declare v_share_bonus_amt decimal(18,4);
    declare v_share_bonus_share decimal(18,4);
    declare v_unit_nav_exclude_divi decimal(18,4);
    declare v_unit_nav_exclude_bonus decimal(18,4);
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
    SET v_share_net = p_share_net;
    SET v_last_share_net = p_last_share_net;
    SET v_share_net_total = p_share_net_total;
    SET v_pre_share_net_total = p_pre_share_net_total;
    SET v_net_change = p_net_change;
    SET v_grp_row = p_grp_row;
    SET v_nav_asset = p_nav_asset;
    SET v_asset_market_value = p_asset_market_value;
    SET v_fund_share_total = p_fund_share_total;
    SET v_fund_asset_net = p_fund_asset_net;
    SET v_pre_fee_share_net_total = p_pre_fee_share_net_total;
    SET v_post_fee_share_net_total = p_post_fee_share_net_total;
    SET v_achieve_performance = p_achieve_performance;
    SET v_recover_param = p_recover_param;
    SET v_last_init_date = p_last_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_net_growth_rate = 0;
    SET v_pd_nav_day_ratio = 0;
    SET v_pd_nav_month_ratio = 0;
    SET v_total_realiz_pandl_ratio = 0;
    SET v_divi_amt = 0;
    SET v_divi_share = 0;
    SET v_share_bonus_amt = 0;
    SET v_share_bonus_share = 0;
    SET v_unit_nav_exclude_divi = 0;
    SET v_unit_nav_exclude_bonus = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @净值增长率# = 0; */
    set v_net_growth_rate = 0;

    /* set @日净值增长率# = 0; */
    set v_pd_nav_day_ratio = 0;

    /* set @月净值增长率# = 0; */
    set v_pd_nav_month_ratio = 0;

    /* set @累计收益率# = 0; */
    set v_total_realiz_pandl_ratio = 0;

    /* set @分红金额# = 0; */
    set v_divi_amt = 0;

    /* set @分红份额# = 0; */
    set v_divi_share = 0;

    /* set @业绩提成金额# = 0; */
    set v_share_bonus_amt = 0;

    /* set @业绩提成份额# = 0; */
    set v_share_bonus_share = 0;

    /* set @分红后单位净值# = 0; */
    set v_unit_nav_exclude_divi = 0;

    /* set @业绩提成后单位净值# = 0; */
    set v_unit_nav_exclude_bonus = 0;

    /* [记录不存在插入表记录][报表_报表数据_报表产品日净值][字段][字段变量][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期#][10002]["产品日净值信息"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_pd_day_net (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, share_net, last_share_net, share_net_total, 
        pre_share_net_total, net_change, net_growth_rate, grp_row, 
        nav_asset, asset_market_value, fund_share_total, fund_asset_net, 
        pd_nav_day_ratio, pd_nav_month_ratio, total_realiz_pandl_ratio, divi_amt, 
        divi_share, share_bonus_amt, share_bonus_share, unit_nav_exclude_divi, 
        unit_nav_exclude_bonus, pre_fee_share_net_total, post_fee_share_net_total, achieve_performance, 
        recover_param, last_init_date) 
        select v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_share_net, v_last_share_net, v_share_net_total, 
        v_pre_share_net_total, v_net_change, v_net_growth_rate, v_grp_row, 
        v_nav_asset, v_asset_market_value, v_fund_share_total, v_fund_asset_net, 
        v_pd_nav_day_ratio, v_pd_nav_month_ratio, v_total_realiz_pandl_ratio, v_divi_amt, 
        v_divi_share, v_share_bonus_amt, v_share_bonus_share, v_unit_nav_exclude_divi, 
        v_unit_nav_exclude_bonus, v_pre_fee_share_net_total, v_post_fee_share_net_total, v_achieve_performance, 
        v_recover_param, v_last_init_date 
        from dual 
        where not exists(select * from db_rpts.tb_rpt_pd_day_net where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date);
    if v_error_code <> "0" then
                
        SET v_error_code = "rptA.2.157.10002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("产品日净值信息","#",v_mysql_message);
        else
            SET v_error_info = "产品日净值信息";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_删除产品日净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Del_Pd_Day_Net;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Del_Pd_Day_Net(
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_修改产品日净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Modi_Pd_Day_Net;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Modi_Pd_Day_Net(
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
    IN p_share_net decimal(18,4),
    IN p_last_share_net decimal(18,4),
    IN p_share_net_total decimal(18,4),
    IN p_pre_share_net_total decimal(18,4),
    IN p_net_change decimal(18,4),
    IN p_grp_row bigint,
    IN p_nav_asset decimal(18,4),
    IN p_asset_market_value decimal(18,4),
    IN p_fund_share_total decimal(18,2),
    IN p_fund_asset_net decimal(18,4),
    IN p_pre_fee_share_net_total decimal(18,4),
    IN p_post_fee_share_net_total decimal(18,4),
    IN p_achieve_performance decimal(18,4),
    IN p_recover_param decimal(18,12),
    IN p_last_init_date int,
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
    declare v_share_net decimal(18,4);
    declare v_last_share_net decimal(18,4);
    declare v_share_net_total decimal(18,4);
    declare v_pre_share_net_total decimal(18,4);
    declare v_net_change decimal(18,4);
    declare v_grp_row bigint;
    declare v_nav_asset decimal(18,4);
    declare v_asset_market_value decimal(18,4);
    declare v_fund_share_total decimal(18,2);
    declare v_fund_asset_net decimal(18,4);
    declare v_pre_fee_share_net_total decimal(18,4);
    declare v_post_fee_share_net_total decimal(18,4);
    declare v_achieve_performance decimal(18,4);
    declare v_recover_param decimal(18,12);
    declare v_last_init_date int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_share_net = p_share_net;
    SET v_last_share_net = p_last_share_net;
    SET v_share_net_total = p_share_net_total;
    SET v_pre_share_net_total = p_pre_share_net_total;
    SET v_net_change = p_net_change;
    SET v_grp_row = p_grp_row;
    SET v_nav_asset = p_nav_asset;
    SET v_asset_market_value = p_asset_market_value;
    SET v_fund_share_total = p_fund_share_total;
    SET v_fund_asset_net = p_fund_asset_net;
    SET v_pre_fee_share_net_total = p_pre_fee_share_net_total;
    SET v_post_fee_share_net_total = p_post_fee_share_net_total;
    SET v_achieve_performance = p_achieve_performance;
    SET v_recover_param = p_recover_param;
    SET v_last_init_date = p_last_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询产品日净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_Day_Net;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_Day_Net(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
    IN p_pd_no int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_query_region_type int;
    declare v_pd_no int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_query_region_type = p_query_region_type;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select * from ~报表_报表数据_报表产品日净值^ t */
    select * from db_rpts.tb_rpt_pd_day_net t

    /* where ({机构编号} = @操作员机构编号#)  and (@产品编号# =  0 or {产品编号}=@产品编号#) and ({初始化日期}  between @查询开始日期# and @查询结束日期#) */
    where (co_no = v_opor_co_no)  and (v_pd_no =  0 or pd_no=v_pd_no) and (init_date  between v_qry_begin_date and v_qry_end_date)

    /* order by {产品编号},{初始化日期} */
    order by pd_no,init_date
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_初始化产品日收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_Pd_Day_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_Pd_Day_NAV_Rate(
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_初始化指数日收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_Index_Day_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_Index_Day_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
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
    declare v_stock_code_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_初始化产品周收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_Pd_Week_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_Pd_Week_NAV_Rate(
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_初始化指数周收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_Index_Week_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_Index_Week_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
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
    declare v_stock_code_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_初始化产品月收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_Pd_Month_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_Pd_Month_NAV_Rate(
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_初始化指数月收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_Index_Month_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_Index_Month_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_stock_code_no int,
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
    declare v_stock_code_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询产品日收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_Day_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_Day_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_报表产品日净值][字段][{机构编号} = @操作员机构编号# and (@产品编号#=0 or {产品编号} = @产品编号#) and {初始化日期} between @查询开始日期# and @查询结束日期#  order by {产品编号}, {初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, share_net, last_share_net, 
        share_net_total, pre_share_net_total, net_change, net_growth_rate, 
        grp_row, nav_asset, asset_market_value, fund_share_total, 
        fund_asset_net, pd_nav_day_ratio, pd_nav_month_ratio, total_realiz_pandl_ratio, 
        divi_amt, divi_share, share_bonus_amt, share_bonus_share, 
        unit_nav_exclude_divi, unit_nav_exclude_bonus, pre_fee_share_net_total, post_fee_share_net_total, 
        achieve_performance, recover_param, last_init_date from db_rpts.tb_rpt_pd_day_net where co_no = v_opor_co_no and (v_pd_no=0 or pd_no = v_pd_no) and init_date between v_qry_begin_date and v_qry_end_date  order by pd_no, init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, share_net, last_share_net, 
        share_net_total, pre_share_net_total, net_change, net_growth_rate, 
        grp_row, nav_asset, asset_market_value, fund_share_total, 
        fund_asset_net, pd_nav_day_ratio, pd_nav_month_ratio, total_realiz_pandl_ratio, 
        divi_amt, divi_share, share_bonus_amt, share_bonus_share, 
        unit_nav_exclude_divi, unit_nav_exclude_bonus, pre_fee_share_net_total, post_fee_share_net_total, 
        achieve_performance, recover_param, last_init_date from db_rpts.tb_rpt_pd_day_net where co_no = v_opor_co_no and (v_pd_no=0 or pd_no = v_pd_no) and init_date between v_qry_begin_date and v_qry_end_date  order by pd_no, init_date  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询指数日收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Index_Day_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Index_Day_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_报表指数日行情][字段][ (@证券代码编号#=0 or {证券代码编号} = @证券代码编号#) and {初始化日期} between @查询开始日期# and @查询结束日期#  order by {证券代码编号}, {初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        stock_code_no, stock_code, exch_no, stock_name, 
        today_close_price, pre_close_price, price_change, price_growth_rate, 
        grp_row, last_init_date from db_rpts.tb_rpt_index_day_quota where  (v_stock_code_no=0 or stock_code_no = v_stock_code_no) and init_date between v_qry_begin_date and v_qry_end_date  order by stock_code_no, init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        stock_code_no, stock_code, exch_no, stock_name, 
        today_close_price, pre_close_price, price_change, price_growth_rate, 
        grp_row, last_init_date from db_rpts.tb_rpt_index_day_quota where  (v_stock_code_no=0 or stock_code_no = v_stock_code_no) and init_date between v_qry_begin_date and v_qry_end_date  order by stock_code_no, init_date  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询产品周收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_Week_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_Week_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_报表产品周净值][字段][{机构编号} = @操作员机构编号# and (@产品编号#=0 or {产品编号} = @产品编号#) and {初始化日期} between @查询开始日期# and @查询结束日期#  order by {产品编号}, {初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, curr_year, week_no, 
        share_net, share_net_total, pre_share_net_total, net_change, 
        net_growth_rate, stat_days, begin_date, end_date, 
        grp_row, last_init_date, pre_fee_share_net_total, post_fee_share_net_total from db_rpts.tb_rpt_pd_week_net where co_no = v_opor_co_no and (v_pd_no=0 or pd_no = v_pd_no) and init_date between v_qry_begin_date and v_qry_end_date  order by pd_no, init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, curr_year, week_no, 
        share_net, share_net_total, pre_share_net_total, net_change, 
        net_growth_rate, stat_days, begin_date, end_date, 
        grp_row, last_init_date, pre_fee_share_net_total, post_fee_share_net_total from db_rpts.tb_rpt_pd_week_net where co_no = v_opor_co_no and (v_pd_no=0 or pd_no = v_pd_no) and init_date between v_qry_begin_date and v_qry_end_date  order by pd_no, init_date  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询指数周收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Index_Week_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Index_Week_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_报表指数周行情][字段][ (@证券代码编号#=0 or {证券代码编号} = @证券代码编号#) and {初始化日期} between @查询开始日期# and @查询结束日期#  order by {证券代码编号}, {初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        stock_code_no, stock_code, exch_no, stock_name, 
        curr_year, week_no, today_close_price, pre_close_price, 
        price_change, price_growth_rate, begin_date, end_date, 
        remark_info, grp_row, last_init_date from db_rpts.tb_rpt_index_week_quota where  (v_stock_code_no=0 or stock_code_no = v_stock_code_no) and init_date between v_qry_begin_date and v_qry_end_date  order by stock_code_no, init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        stock_code_no, stock_code, exch_no, stock_name, 
        curr_year, week_no, today_close_price, pre_close_price, 
        price_change, price_growth_rate, begin_date, end_date, 
        remark_info, grp_row, last_init_date from db_rpts.tb_rpt_index_week_quota where  (v_stock_code_no=0 or stock_code_no = v_stock_code_no) and init_date between v_qry_begin_date and v_qry_end_date  order by stock_code_no, init_date  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询产品月收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_Month_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_Month_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_报表产品月净值][字段][{机构编号} = @操作员机构编号# and (@产品编号#=0 or {产品编号} = @产品编号#) and {初始化日期} between @查询开始日期# and @查询结束日期#  order by {产品编号}, {初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, curr_month, share_net, 
        share_net_total, pre_share_net_total, stat_days, rise_days, 
        fall_days, max_cont_rise_days, max_cont_fall_days, net_change, 
        net_growth_rate, begin_date, end_date, remark_info, 
        grp_row, last_init_date, pre_fee_share_net_total, post_fee_share_net_total from db_rpts.tb_rpt_pd_month_net where co_no = v_opor_co_no and (v_pd_no=0 or pd_no = v_pd_no) and init_date between v_qry_begin_date and v_qry_end_date  order by pd_no, init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, curr_month, share_net, 
        share_net_total, pre_share_net_total, stat_days, rise_days, 
        fall_days, max_cont_rise_days, max_cont_fall_days, net_change, 
        net_growth_rate, begin_date, end_date, remark_info, 
        grp_row, last_init_date, pre_fee_share_net_total, post_fee_share_net_total from db_rpts.tb_rpt_pd_month_net where co_no = v_opor_co_no and (v_pd_no=0 or pd_no = v_pd_no) and init_date between v_qry_begin_date and v_qry_end_date  order by pd_no, init_date  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询指数月收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Index_Month_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Index_Month_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_报表指数月行情][字段][ (@证券代码编号#=0 or {证券代码编号} = @证券代码编号#) and {初始化日期} between @查询开始日期# and @查询结束日期#  order by {证券代码编号}, {初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        stock_code_no, stock_code, exch_no, stock_name, 
        curr_month, today_close_price, pre_close_price, stat_days, 
        rise_days, fall_days, max_cont_rise_days, max_cont_fall_days, 
        price_change, price_growth_rate, begin_date, end_date, 
        remark_info, grp_row, last_init_date from db_rpts.tb_rpt_index_month_quota where  (v_stock_code_no=0 or stock_code_no = v_stock_code_no) and init_date between v_qry_begin_date and v_qry_end_date  order by stock_code_no, init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        stock_code_no, stock_code, exch_no, stock_name, 
        curr_month, today_close_price, pre_close_price, stat_days, 
        rise_days, fall_days, max_cont_rise_days, max_cont_fall_days, 
        price_change, price_growth_rate, begin_date, end_date, 
        remark_info, grp_row, last_init_date from db_rpts.tb_rpt_index_month_quota where  (v_stock_code_no=0 or stock_code_no = v_stock_code_no) and init_date between v_qry_begin_date and v_qry_end_date  order by stock_code_no, init_date  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_月报处理产品收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_MonthRpt_Pd_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_MonthRpt_Pd_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_月报处理指数收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_MonthRpt_Index_NAV_Rate;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_MonthRpt_Index_NAV_Rate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_月报处理产品最大回撤
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_MonthRpt_Pd_MaxDrawDown;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_MonthRpt_Pd_MaxDrawDown(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_月报处理指数最大回撤
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_MonthRpt_Index_MaxDrawDown;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_MonthRpt_Index_MaxDrawDown(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_月报处理产品夏普比率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_MonthRpt_Pd_SharpRatio;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_MonthRpt_Pd_SharpRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_月报处理指数夏普比率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_MonthRpt_Index_SharpRatio;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_MonthRpt_Index_SharpRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_月报处理产品日胜率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_MonthRpt_Pd_DayWinRatio;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_MonthRpt_Pd_DayWinRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_月报处理指数日胜率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_MonthRpt_Index_DayWinRatio;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_MonthRpt_Index_DayWinRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_月报处理产品周胜率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_MonthRpt_Pd_WeekWinRatio;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_MonthRpt_Pd_WeekWinRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_月报处理指数周胜率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Init_MonthRpt_Index_WeekWinRatio;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Init_MonthRpt_Index_WeekWinRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_indicator_id int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_curr_month int;
    declare v_indicator_id int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_curr_month = p_curr_month;
    SET v_indicator_id = p_indicator_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询基金经理与交易员关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_Mananger_Trader_Conn;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_Mananger_Trader_Conn(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_fund_manager_no int,
    IN p_trader_no int,
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
    declare v_pd_no int;
    declare v_fund_manager_no int;
    declare v_trader_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_trader_no = p_trader_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select * from ~报表_报表数据_基金经理与交易员关系表^ t */
    select * from db_rpts.tb_rpt_pd_mananger_trader_conn t

    /* where ({机构编号} = @操作员机构编号#)  and (@产品编号# =  0 or {产品编号}=@产品编号#) */
    where (co_no = v_opor_co_no)  and (v_pd_no =  0 or pd_no=v_pd_no)

      /* and (@基金经理编号# =  0 or {基金经理编号}=@基金经理编号#) */
      and (v_fund_manager_no =  0 or fund_manager_no=v_fund_manager_no)

      /* and (@交易员编号# =  0 or {交易员编号}=@交易员编号#) */
      and (v_trader_no =  0 or trader_no=v_trader_no)

      /* and ({机构编号},{产品编号}) in (select {机构编号},{产品编号} from ~报表_报表数据_产品资产表^ opr where opr.{机构编号} = @操作员机构编号#) */
      and (co_no,pd_no) in (select co_no,pd_no from db_rpts.tb_rpt_productasset opr where opr.co_no = v_opor_co_no)

    /* order by {显示顺序} */
    order by show_order
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询产品资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_Asset;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
    IN p_pd_no int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_query_region_type int;
    declare v_pd_no int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_query_region_type = p_query_region_type;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* if (@查询开始日期# = 0) and (@查询结束日期# = 0) then */
    if (v_qry_begin_date = 0) and (v_qry_end_date = 0) then

    /* select t.* from ~报表_报表数据_产品资产表^ t where ({机构编号} = @操作员机构编号#)  and (@产品编号# =  0 or {产品编号}=@产品编号#)  order by {产品编号},{初始化日期}; */
    select t.* from db_rpts.tb_rpt_productasset t where (co_no = v_opor_co_no)  and (v_pd_no =  0 or pd_no=v_pd_no)  order by pd_no,init_date;
    else
    # 查询区间方式:1-从开始日期到结束日期；2-区间的最小日期；3-区间的最大日期；4-区间最小日期与最大日期

    /* if (@查询区间方式# in (2,3,4))  then */
    if (v_query_region_type in (2,3,4))  then

    /* select t.* from ~报表_报表数据_产品资产表历史^ t */
    select t.* from db_rpts.tb_rpt_productasset_his t
    join  (

    /* select {机构编号}, {产品编号}, min({初始化日期}) as {查询开始日期}, max({初始化日期}) as {查询结束日期} */
    select co_no, pd_no, min(init_date) as qry_begin_date, max(init_date) as qry_end_date

    /* from ~报表_报表数据_产品资产表历史^ */
    from db_rpts.tb_rpt_productasset_his

     /* where ({机构编号} = @操作员机构编号#)   and ({初始化日期}  between @查询开始日期# and @查询结束日期#)  and (@产品编号# =  0 or {产品编号}=@产品编号#) */
     where (co_no = v_opor_co_no)   and (init_date  between v_qry_begin_date and v_qry_end_date)  and (v_pd_no =  0 or pd_no=v_pd_no)

    /* group by {机构编号}, {产品编号} */
    group by co_no, pd_no

    /* ) x on (t.{机构编号}, t.{产品编号}) =  (x.{机构编号}, x.{产品编号}) and t.{初始化日期} in (if(@查询区间方式#=3,0,x.{查询开始日期}),  if(@查询区间方式#=2,0, x.{查询结束日期})) */
    ) x on (t.co_no, t.pd_no) =  (x.co_no, x.pd_no) and t.init_date in (if(v_query_region_type=3,0,x.qry_begin_date),  if(v_query_region_type=2,0, x.qry_end_date))

    /* order by t.{产品编号},t.{初始化日期} */
    order by t.pd_no,t.init_date
    ;
    else

    /* select t.* from ~报表_报表数据_产品资产表历史^ t where ({机构编号} = @操作员机构编号#) and ({初始化日期}  between @查询开始日期# and @查询结束日期#) and (@产品编号# =  0 or {产品编号}=@产品编号#)  order by {产品编号},{初始化日期}; */
    select t.* from db_rpts.tb_rpt_productasset_his t where (co_no = v_opor_co_no) and (init_date  between v_qry_begin_date and v_qry_end_date) and (v_pd_no =  0 or pd_no=v_pd_no)  order by pd_no,init_date;
    end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询产品持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_Posi;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
    IN p_pd_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_query_region_type int;
    declare v_pd_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_query_region_type = p_query_region_type;
    SET v_pd_no = p_pd_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* if (@查询开始日期# = 0) and (@查询结束日期# = 0) then */
    if (v_qry_begin_date = 0) and (v_qry_end_date = 0) then

    /* [获取表记录][报表_报表数据_产品持仓表][字段][ ({机构编号} = @操作员机构编号#)  and ({当前数量} <> 0) and (@产品编号# =  0 or {产品编号}=@产品编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and (@资产类型# = 0 or {资产类型}=@资产类型#) order by {产品编号},{初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_code, pd_name, 
        exch_no, stock_acco_no, stock_code_no, asset_acco, 
        stock_acco, asset_acco_str, stock_acco_str, stock_code, 
        stock_name, invest_type, stock_type, asset_type, 
        asset_kind, begin_qty, curr_qty, frozen_qty, 
        unfroz_qty, cost_amt, realize_pandl, intrst_cost_amt, 
        intrst_pandl, last_price, stock_asset_value, value_dirty_price, 
        value_net_price, buy_qty, buy_amt, sell_qty, 
        sellout_amt, record_count, record_remark from db_rpts.tb_rpt_productholder where  (co_no = v_opor_co_no)  and (curr_qty <> 0) and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_asset_type = 0 or asset_type=v_asset_type) order by pd_no,init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_code, pd_name, 
        exch_no, stock_acco_no, stock_code_no, asset_acco, 
        stock_acco, asset_acco_str, stock_acco_str, stock_code, 
        stock_name, invest_type, stock_type, asset_type, 
        asset_kind, begin_qty, curr_qty, frozen_qty, 
        unfroz_qty, cost_amt, realize_pandl, intrst_cost_amt, 
        intrst_pandl, last_price, stock_asset_value, value_dirty_price, 
        value_net_price, buy_qty, buy_amt, sell_qty, 
        sellout_amt, record_count, record_remark from db_rpts.tb_rpt_productholder where  (co_no = v_opor_co_no)  and (curr_qty <> 0) and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_asset_type = 0 or asset_type=v_asset_type) order by pd_no,init_date  limit v_row_count;
    end if;

    else
    # 查询区间方式:1-从开始日期到结束日期；2-区间的最小日期；3-区间的最大日期；4-区间最小日期与最大日期

    /* if (@查询区间方式# in (2,3,4))  then */
    if (v_query_region_type in (2,3,4))  then

    /* select t.* from ~报表_报表数据_产品持仓表历史^ t */
    select t.* from db_rpts.tb_rpt_productholder_his t
    join (

    /* select  {机构编号}, {产品编号}, max({初始化日期}) as {初始化日期} */
    select  co_no, pd_no, max(init_date) as init_date

    /* from ~报表_报表数据_产品持仓表历史^ */
    from db_rpts.tb_rpt_productholder_his

     /* where ({机构编号} = @操作员机构编号#)   and ({产品编号}=@产品编号#)  and ({初始化日期}  < @查询开始日期# ) */
     where (co_no = v_opor_co_no)   and (pd_no=v_pd_no)  and (init_date  < v_qry_begin_date )

    /* and @查询区间方式# in (2,4) */
    and v_query_region_type in (2,4)

    /* group by {机构编号}, {产品编号} */
    group by co_no, pd_no
    union all

    /* select {机构编号}, {产品编号}, max({初始化日期}) as {初始化日期} */
    select co_no, pd_no, max(init_date) as init_date

    /* from ~报表_报表数据_产品持仓表历史^ */
    from db_rpts.tb_rpt_productholder_his

     /* where ({机构编号} = @操作员机构编号#)   and ( {产品编号}=@产品编号#)  and ({初始化日期}  <= @查询结束日期# ) */
     where (co_no = v_opor_co_no)   and ( pd_no=v_pd_no)  and (init_date  <= v_qry_end_date )

    /* and @查询区间方式# in (3,4) */
    and v_query_region_type in (3,4)

    /* group by {机构编号}, {产品编号} */
    group by co_no, pd_no

    /* ) x on (t.{机构编号},t.{产品编号},t.{初始化日期}) =  (x.{机构编号},x.{产品编号},x.{初始化日期}) */
    ) x on (t.co_no,t.pd_no,t.init_date) =  (x.co_no,x.pd_no,x.init_date)

    /* where  (t.{机构编号} = @操作员机构编号#)  and (@产品编号# =  0 or t.{产品编号}=@产品编号#) */
    where  (t.co_no = v_opor_co_no)  and (v_pd_no =  0 or t.pd_no=v_pd_no)

    /* and (@市场编号# = 0 or t.{市场编号}=@市场编号#) and (@证券代码编号# = 0 or t.{证券代码编号}=@证券代码编号#) and (@证券类型# = 0 or t.{证券类型}=@证券类型#) and (@资产类型# = 0 or t.{资产类型}=@资产类型#) */
    and (v_exch_no = 0 or t.exch_no=v_exch_no) and (v_stock_code_no = 0 or t.stock_code_no=v_stock_code_no) and (v_stock_type = 0 or t.stock_type=v_stock_type) and (v_asset_type = 0 or t.asset_type=v_asset_type)

    /* order by t.{产品编号}, t.{初始化日期} */
    order by t.pd_no, t.init_date
    ;
    else

    /* [获取表记录][报表_报表数据_产品持仓表历史][字段][ ({机构编号} = @操作员机构编号#) and ({初始化日期}  between @查询开始日期# and @查询结束日期#)  and (@产品编号# =  0 or {产品编号}=@产品编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and (@资产类型# = 0 or {资产类型}=@资产类型#) order by {产品编号},{初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, stock_code, exch_no, 
        stock_code_no, stock_acco_no, asset_acco, stock_acco, 
        asset_acco_str, stock_acco_str, invest_type, stock_type, 
        asset_type, asset_kind, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, cost_amt, realize_pandl, 
        intrst_cost_amt, intrst_pandl, last_price, stock_asset_value, 
        value_dirty_price, value_net_price, posi_market_value, buy_qty, 
        buy_amt, sell_qty, sellout_amt, record_count, 
        record_remark from db_rpts.tb_rpt_productholder_his where  (co_no = v_opor_co_no) and (init_date  between v_qry_begin_date and v_qry_end_date)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_asset_type = 0 or asset_type=v_asset_type) order by pd_no,init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, stock_code, exch_no, 
        stock_code_no, stock_acco_no, asset_acco, stock_acco, 
        asset_acco_str, stock_acco_str, invest_type, stock_type, 
        asset_type, asset_kind, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, cost_amt, realize_pandl, 
        intrst_cost_amt, intrst_pandl, last_price, stock_asset_value, 
        value_dirty_price, value_net_price, posi_market_value, buy_qty, 
        buy_amt, sell_qty, sellout_amt, record_count, 
        record_remark from db_rpts.tb_rpt_productholder_his where  (co_no = v_opor_co_no) and (init_date  between v_qry_begin_date and v_qry_end_date)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_asset_type = 0 or asset_type=v_asset_type) order by pd_no,init_date  limit v_row_count;
    end if;

    end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询产品行业
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_Industry;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_Industry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
    IN p_industry_std int,
    IN p_industry_classification int,
    IN p_industry_id int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_pd_no int;
    declare v_industry_std int;
    declare v_industry_classification int;
    declare v_industry_id int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_pd_no = p_pd_no;
    SET v_industry_std = p_industry_std;
    SET v_industry_classification = p_industry_classification;
    SET v_industry_id = p_industry_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* if (@查询开始日期# = 0) and (@查询结束日期# = 0) then */
    if (v_qry_begin_date = 0) and (v_qry_end_date = 0) then

    /* [获取表记录][报表_报表数据_报表产品行业市值表][字段][ ({机构编号} = @操作员机构编号#)  and (@产品编号# =  0 or {产品编号}=@产品编号#) and (@行业标准# = 0 or {行业标准}=@行业标准#) and (@行业级别# = 0 or {行业级别}=@行业级别#) and (@行业编号# = 0 or {行业编号}=@行业编号#) order by {产品编号},{初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pd_no, pd_name, co_no, industry_std, 
        industry_classification, industry_id, industry_code, indu_name, 
        basket_qty, cost_amt, posi_market_value, weight_ratio, 
        float_pandl, realize_pandl, buy_amt, sellout_amt, 
        divi_amt, remark_info from db_rpts.tb_rpt_pd_industry where  (co_no = v_opor_co_no)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_industry_std = 0 or industry_std=v_industry_std) and (v_industry_classification = 0 or industry_classification=v_industry_classification) and (v_industry_id = 0 or industry_id=v_industry_id) order by pd_no,init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pd_no, pd_name, co_no, industry_std, 
        industry_classification, industry_id, industry_code, indu_name, 
        basket_qty, cost_amt, posi_market_value, weight_ratio, 
        float_pandl, realize_pandl, buy_amt, sellout_amt, 
        divi_amt, remark_info from db_rpts.tb_rpt_pd_industry where  (co_no = v_opor_co_no)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_industry_std = 0 or industry_std=v_industry_std) and (v_industry_classification = 0 or industry_classification=v_industry_classification) and (v_industry_id = 0 or industry_id=v_industry_id) order by pd_no,init_date  limit v_row_count;
    end if;

    else

    /* [获取表记录][报表_报表数据_报表产品行业市值表][字段][ ({机构编号} = @操作员机构编号#)   and ({初始化日期}  between @查询开始日期# and @查询结束日期#) and (@产品编号# =  0 or {产品编号}=@产品编号#) and (@行业标准# = 0 or {行业标准}=@行业标准#) and (@行业级别# = 0 or {行业级别}=@行业级别#) and (@行业编号# = 0 or {行业编号}=@行业编号#) order by {产品编号},{初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pd_no, pd_name, co_no, industry_std, 
        industry_classification, industry_id, industry_code, indu_name, 
        basket_qty, cost_amt, posi_market_value, weight_ratio, 
        float_pandl, realize_pandl, buy_amt, sellout_amt, 
        divi_amt, remark_info from db_rpts.tb_rpt_pd_industry where  (co_no = v_opor_co_no)   and (init_date  between v_qry_begin_date and v_qry_end_date) and (v_pd_no =  0 or pd_no=v_pd_no) and (v_industry_std = 0 or industry_std=v_industry_std) and (v_industry_classification = 0 or industry_classification=v_industry_classification) and (v_industry_id = 0 or industry_id=v_industry_id) order by pd_no,init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pd_no, pd_name, co_no, industry_std, 
        industry_classification, industry_id, industry_code, indu_name, 
        basket_qty, cost_amt, posi_market_value, weight_ratio, 
        float_pandl, realize_pandl, buy_amt, sellout_amt, 
        divi_amt, remark_info from db_rpts.tb_rpt_pd_industry where  (co_no = v_opor_co_no)   and (init_date  between v_qry_begin_date and v_qry_end_date) and (v_pd_no =  0 or pd_no=v_pd_no) and (v_industry_std = 0 or industry_std=v_industry_std) and (v_industry_classification = 0 or industry_classification=v_industry_classification) and (v_industry_id = 0 or industry_id=v_industry_id) order by pd_no,init_date  limit v_row_count;
    end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询产品行业区间盈亏
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_Industry_inter_pl;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_Industry_inter_pl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
    IN p_industry_std int,
    IN p_industry_classification int,
    IN p_industry_id int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_pd_no int;
    declare v_industry_std int;
    declare v_industry_classification int;
    declare v_industry_id int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_date int;
    declare v_end_date int;

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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_pd_no = p_pd_no;
    SET v_industry_std = p_industry_std;
    SET v_industry_classification = p_industry_classification;
    SET v_industry_id = p_industry_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_end_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* select * from ~报表_报表数据_统计产品行业区间盈亏^ t */
    select * from db_rpts.tb_rpt_stat_month_pd_industry_inter_pl t

    /* where (t.{机构编号} = @操作员机构编号#) and (@产品编号#=0 or t.{产品编号}=@产品编号#) */
    where (t.co_no = v_opor_co_no) and (v_pd_no=0 or t.pd_no=v_pd_no)

    /* and  ({查询开始日期} = @查询开始日期# and {查询结束日期} = @查询结束日期#) */
    and  (qry_begin_date = v_qry_begin_date and qry_end_date = v_qry_end_date)

    /* and (@行业标准# = 0 or t.{行业标准}=@行业标准#) */
    and (v_industry_std = 0 or t.industry_std=v_industry_std)

    /* and (@行业级别# = 0 or t.{行业级别}=@行业级别#) */
    and (v_industry_classification = 0 or t.industry_classification=v_industry_classification)

    /* and (@行业编号# = 0 or t.{行业编号}=@行业编号#) */
    and (v_industry_id = 0 or t.industry_id=v_industry_id)
    ;
    if (FOUND_ROWS() = 0) then

    /* set @开始日期# = 0; */
    set v_begin_date = 0;

    /* set @结束日期# = 0; */
    set v_end_date = 0;
    #step1:开始日期

    /* select t.{初始化日期} as {开始日期},t.{产品编号} */
    select t.init_date as begin_date,t.pd_no

    /* into @开始日期#,@产品编号# */
    into v_begin_date,v_pd_no

    /* from ~报表_报表数据_报表产品行业市值表^ t */
    from db_rpts.tb_rpt_pd_industry t

    /* where {机构编号}=@操作员机构编号# and {产品编号}= @产品编号# and {初始化日期} < @查询开始日期# */
    where co_no=v_opor_co_no and pd_no= v_pd_no and init_date < v_qry_begin_date

    /* order by {初始化日期} desc limit 1; */
    order by init_date desc limit 1;
     select

    /* x.{开始日期} as {开始日期},x.{结束日期} as {结束日期}, */
    x.begin_date as begin_date,x.end_date as end_date,

    /* t.{产品编号},t.{机构编号},t.{行业标准},t.{行业级别},t.{行业编号},t.{行业代码},t.{行业名称}, */
    t.pd_no,t.co_no,t.industry_std,t.industry_classification,t.industry_id,t.industry_code,t.indu_name,

    /* sum(if(t.{初始化日期} = @开始日期#,ifnull(t.{篮子数量},0),0)) as {期初数量}, */
    sum(if(t.init_date = v_begin_date,ifnull(t.basket_qty,0),0)) as begin_qty,

    /* sum(if(t.{初始化日期} = @开始日期#,ifnull(t.{成本金额},0),0)) as {期初成本}, */
    sum(if(t.init_date = v_begin_date,ifnull(t.cost_amt,0),0)) as begin_cost_amt,

    /* sum(if(t.{初始化日期} = @开始日期#,ifnull(t.{持仓市值},0),0)) as {期初持仓市值}, */
    sum(if(t.init_date = v_begin_date,ifnull(t.posi_market_value,0),0)) as begin_posi_market_value,

    /* sum(if(t.{初始化日期} = @开始日期#,ifnull(t.{实现盈亏},0),0)) as {期初实现盈亏}, */
    sum(if(t.init_date = v_begin_date,ifnull(t.realize_pandl,0),0)) as begin_realize_pandl,

    /* sum(if(t.{初始化日期} = x.{结束日期},ifnull(t.{篮子数量},0),0)) as {期末数量}, */
    sum(if(t.init_date = x.end_date,ifnull(t.basket_qty,0),0)) as end_cur_qty,

    /* sum(if(t.{初始化日期} = x.{结束日期},ifnull(t.{成本金额},0),0)) as {期末成本}, */
    sum(if(t.init_date = x.end_date,ifnull(t.cost_amt,0),0)) as end_cost_amt,

    /* sum(if(t.{初始化日期} = x.{结束日期},ifnull(t.{持仓市值},0),0)) as {期末持仓市值}, */
    sum(if(t.init_date = x.end_date,ifnull(t.posi_market_value,0),0)) as end_posi_market_value,

    /* sum(if(t.{初始化日期} = x.{结束日期},ifnull(t.{实现盈亏},0),0)) as {期末实现盈亏}, */
    sum(if(t.init_date = x.end_date,ifnull(t.realize_pandl,0),0)) as end_realize_pandl,

    /* sum(if(t.{初始化日期} = x.{结束日期},1,-1)*(ifnull(t.{持仓市值},0)-ifnull(t.{成本金额},0))) as {浮动盈亏}, */
    sum(if(t.init_date = x.end_date,1,-1)*(ifnull(t.posi_market_value,0)-ifnull(t.cost_amt,0))) as float_pandl,

    /* sum(if(t.{初始化日期} = x.{结束日期},1,-1)*(ifnull(t.{实现盈亏},0))) as {区间实现盈亏}, */
    sum(if(t.init_date = x.end_date,1,-1)*(ifnull(t.realize_pandl,0))) as interval_realize_pandl,
    # sum(if(t.{初始化日期} = x.{结束日期},1,-1)*(ifnull(t.{持仓市值},0)-ifnull(t.{成本金额},0)+ifnull(t.{实现盈亏},0))) as {区间盈亏}

     /* x.{买入金额},  x.{卖出金额}, x.{分红金额}, */
     x.buy_amt,  x.sellout_amt, x.divi_amt,

    /* sum(if(t.{初始化日期} = x.{结束日期},1,-1)*(ifnull(t.{持仓市值},0))) + x.{买入金额} + x.{卖出金额} + x.{分红金额} as {区间盈亏} */
    sum(if(t.init_date = x.end_date,1,-1)*(ifnull(t.posi_market_value,0))) + x.buy_amt + x.sellout_amt + x.divi_amt as interval_pandl

    /* from ~报表_报表数据_报表产品行业市值表^  t */
    from db_rpts.tb_rpt_pd_industry  t

    /* join (select x.{产品编号},x.{机构编号},x.{行业标准},x.{行业级别},x.{行业编号},x.{行业代码},min(x.{初始化日期}) as {开始日期},max(x.{初始化日期}) as {结束日期},sum(if(ifnull(x.{篮子数量},0)>0,1,0)) as {有效记录数} */
    join (select x.pd_no,x.co_no,x.industry_std,x.industry_classification,x.industry_id,x.industry_code,min(x.init_date) as begin_date,max(x.init_date) as end_date,sum(if(ifnull(x.basket_qty,0)>0,1,0)) as valid_cnt

    /* ,sum(x.{买入金额}) as {买入金额},sum(x.{卖出金额}) as {卖出金额},sum(x.{分红金额}) as {分红金额} */
    ,sum(x.buy_amt) as buy_amt,sum(x.sellout_amt) as sellout_amt,sum(x.divi_amt) as divi_amt

    /* from ~报表_报表数据_报表产品行业市值表^ x where x.{初始化日期} > @开始日期# and x.{初始化日期} <= @查询结束日期# */
    from db_rpts.tb_rpt_pd_industry x where x.init_date > v_begin_date and x.init_date <= v_qry_end_date

    /* and (x.{机构编号} = @操作员机构编号#) and (x.{产品编号}=@产品编号#) */
    and (x.co_no = v_opor_co_no) and (x.pd_no=v_pd_no)

    /* group by x.{产品编号},x.{机构编号},x.{行业标准},x.{行业级别},x.{行业编号},x.{行业代码} */
    group by x.pd_no,x.co_no,x.industry_std,x.industry_classification,x.industry_id,x.industry_code

     /* ) x on (t.{产品编号},t.{机构编号},t.{行业标准},t.{行业级别},t.{行业编号},t.{行业代码}) = (x.{产品编号},x.{机构编号},x.{行业标准},x.{行业级别},x.{行业编号},x.{行业代码}) and t.{初始化日期} in (@开始日期#,x.{结束日期}) */
     ) x on (t.pd_no,t.co_no,t.industry_std,t.industry_classification,t.industry_id,t.industry_code) = (x.pd_no,x.co_no,x.industry_std,x.industry_classification,x.industry_id,x.industry_code) and t.init_date in (v_begin_date,x.end_date)

    /* where (x.{有效记录数} > 0) */
    where (x.valid_cnt > 0)

    /* and (t.{机构编号} = @操作员机构编号#) and (t.{产品编号}=@产品编号#) */
    and (t.co_no = v_opor_co_no) and (t.pd_no=v_pd_no)

    /* and (@行业标准# = 0 or t.{行业标准}=@行业标准#) */
    and (v_industry_std = 0 or t.industry_std=v_industry_std)

    /* and (@行业级别# = 0 or t.{行业级别}=@行业级别#) */
    and (v_industry_classification = 0 or t.industry_classification=v_industry_classification)

    /* and (@行业编号# = 0 or t.{行业编号}=@行业编号#) */
    and (v_industry_id = 0 or t.industry_id=v_industry_id)

    /* GROUP BY  t.{产品编号},t.{机构编号},t.{行业标准},t.{行业级别},t.{行业编号},t.{行业代码} */
    GROUP BY  t.pd_no,t.co_no,t.industry_std,t.industry_classification,t.industry_id,t.industry_code
    ;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询汇总机构证券买卖成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Sum_Co_Stock_Buy_Sale_Strike;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Sum_Co_Stock_Buy_Sale_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_pd_no = p_pd_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* if (@查询开始日期# = 0) and (@查询结束日期# = 0) then */
    if (v_qry_begin_date = 0) and (v_qry_end_date = 0) then

    /* [获取表记录][报表_报表数据_报表汇总机构证券买卖成交][字段][ ({机构编号} = @操作员机构编号#)  and (@产品编号# =  0 or {产品编号}=@产品编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and (@资产类型# = 0 or {资产类型}=@资产类型#) order by {产品编号},{初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, exch_no, stock_code_no, stock_code, 
        stock_name, stock_type, asset_type, order_price, 
        order_qty, strike_qty, strike_price, strike_amt, 
        buy_qty, buy_amt, buy_strike_price, sell_qty, 
        sellout_amt, sell_strike_price, diff_qty, buy_begin_time, 
        buy_end_time, sell_begin_time, sell_end_time from db_rpts.tb_rpt_sum_co_stock_buy_sale_strike where  (co_no = v_opor_co_no)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_asset_type = 0 or asset_type=v_asset_type) order by pd_no,init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, exch_no, stock_code_no, stock_code, 
        stock_name, stock_type, asset_type, order_price, 
        order_qty, strike_qty, strike_price, strike_amt, 
        buy_qty, buy_amt, buy_strike_price, sell_qty, 
        sellout_amt, sell_strike_price, diff_qty, buy_begin_time, 
        buy_end_time, sell_begin_time, sell_end_time from db_rpts.tb_rpt_sum_co_stock_buy_sale_strike where  (co_no = v_opor_co_no)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_asset_type = 0 or asset_type=v_asset_type) order by pd_no,init_date  limit v_row_count;
    end if;

    else

    /* [获取历史表记录][报表_报表数据_报表汇总机构证券买卖成交][字段][ ({机构编号} = @操作员机构编号#) and ({初始化日期}  between @查询开始日期# and @查询结束日期#)  and (@产品编号# =  0 or {产品编号}=@产品编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and (@资产类型# = 0 or {资产类型}=@资产类型#) order by {产品编号},{初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, exch_no, stock_code_no, stock_code, 
        stock_name, stock_type, asset_type, order_price, 
        order_qty, strike_qty, strike_price, strike_amt, 
        buy_qty, buy_amt, buy_strike_price, sell_qty, 
        sellout_amt, sell_strike_price, diff_qty, buy_begin_time, 
        buy_end_time, sell_begin_time, sell_end_time from db_rpts_his.tb_rpt_sum_co_stock_buy_sale_strike_his where  (co_no = v_opor_co_no) and (init_date  between v_qry_begin_date and v_qry_end_date)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_asset_type = 0 or asset_type=v_asset_type) order by pd_no,init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, exch_no, stock_code_no, stock_code, 
        stock_name, stock_type, asset_type, order_price, 
        order_qty, strike_qty, strike_price, strike_amt, 
        buy_qty, buy_amt, buy_strike_price, sell_qty, 
        sellout_amt, sell_strike_price, diff_qty, buy_begin_time, 
        buy_end_time, sell_begin_time, sell_end_time from db_rpts_his.tb_rpt_sum_co_stock_buy_sale_strike_his where  (co_no = v_opor_co_no) and (init_date  between v_qry_begin_date and v_qry_end_date)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_asset_type = 0 or asset_type=v_asset_type) order by pd_no,init_date  limit v_row_count;
    end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询汇总产品证券买卖成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Sum_Pd_Stock_Buy_Sale_Strike;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Sum_Pd_Stock_Buy_Sale_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_pd_no = p_pd_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* if (@查询开始日期# = 0) and (@查询结束日期# = 0) then */
    if (v_qry_begin_date = 0) and (v_qry_end_date = 0) then

    /* [获取表记录][报表_报表数据_报表汇总产品证券买卖成交][字段][ ({机构编号} = @操作员机构编号#)  and (@产品编号# =  0 or {产品编号}=@产品编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and (@资产类型# = 0 or {资产类型}=@资产类型#) order by {产品编号},{初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_no, stock_code_no, 
        stock_code, stock_name, stock_type, asset_type, 
        order_price, order_qty, strike_qty, strike_price, 
        strike_amt, buy_qty, buy_amt, buy_strike_price, 
        sell_qty, sellout_amt, sell_strike_price, diff_qty, 
        buy_begin_time, buy_end_time, sell_begin_time, sell_end_time from db_rpts.tb_rpt_sum_pd_stock_buy_sale_strike where  (co_no = v_opor_co_no)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_asset_type = 0 or asset_type=v_asset_type) order by pd_no,init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_no, stock_code_no, 
        stock_code, stock_name, stock_type, asset_type, 
        order_price, order_qty, strike_qty, strike_price, 
        strike_amt, buy_qty, buy_amt, buy_strike_price, 
        sell_qty, sellout_amt, sell_strike_price, diff_qty, 
        buy_begin_time, buy_end_time, sell_begin_time, sell_end_time from db_rpts.tb_rpt_sum_pd_stock_buy_sale_strike where  (co_no = v_opor_co_no)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_asset_type = 0 or asset_type=v_asset_type) order by pd_no,init_date  limit v_row_count;
    end if;

    else

    /* [获取历史表记录][报表_报表数据_报表汇总产品证券买卖成交][字段][ ({机构编号} = @操作员机构编号#)  and (@产品编号# =  0 or {产品编号}=@产品编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and (@资产类型# = 0 or {资产类型}=@资产类型#) order by {产品编号},{初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_no, stock_code_no, 
        stock_code, stock_name, stock_type, asset_type, 
        order_price, order_qty, strike_qty, strike_price, 
        strike_amt, buy_qty, buy_amt, buy_strike_price, 
        sell_qty, sellout_amt, sell_strike_price, diff_qty, 
        buy_begin_time, buy_end_time, sell_begin_time, sell_end_time from db_rpts_his.tb_rpt_sum_pd_stock_buy_sale_strike_his where  (co_no = v_opor_co_no)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_asset_type = 0 or asset_type=v_asset_type) order by pd_no,init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_no, stock_code_no, 
        stock_code, stock_name, stock_type, asset_type, 
        order_price, order_qty, strike_qty, strike_price, 
        strike_amt, buy_qty, buy_amt, buy_strike_price, 
        sell_qty, sellout_amt, sell_strike_price, diff_qty, 
        buy_begin_time, buy_end_time, sell_begin_time, sell_end_time from db_rpts_his.tb_rpt_sum_pd_stock_buy_sale_strike_his where  (co_no = v_opor_co_no)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_asset_type = 0 or asset_type=v_asset_type) order by pd_no,init_date  limit v_row_count;
    end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询汇总产品证券成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Sum_Pd_Stock_Strike;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Sum_Pd_Stock_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_order_dir int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_pd_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_order_dir int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_pd_no = p_pd_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

     /* if (@查询开始日期# = 0) and (@查询结束日期# = 0) then */
     if (v_qry_begin_date = 0) and (v_qry_end_date = 0) then

    /* [获取表记录][报表_报表数据_报表汇总产品证券成交][字段][ ({机构编号} = @操作员机构编号#)  and (@产品编号# =  0 or {产品编号}=@产品编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and (@订单方向# = 0 or {订单方向}=@订单方向#)  order by {产品编号},{初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, stock_code_no, asset_acco, 
        stock_acco, exch_no, invest_type, stock_type, 
        stock_code, stock_name, crncy_type, strike_aver_price, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, bond_accr_intrst, net_price_flag, bank_ib_member, 
        last_price, quot_strike_qty, quot_strike_amt, sum_grp_cnt, 
        sum_grp_str, busi_flag, valid_flag, remark_info, 
        src_data_type from db_rpts.tb_rpt_sum_pd_stock_strike where  (co_no = v_opor_co_no)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_order_dir = 0 or order_dir=v_order_dir)  order by pd_no,init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, stock_code_no, asset_acco, 
        stock_acco, exch_no, invest_type, stock_type, 
        stock_code, stock_name, crncy_type, strike_aver_price, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, bond_accr_intrst, net_price_flag, bank_ib_member, 
        last_price, quot_strike_qty, quot_strike_amt, sum_grp_cnt, 
        sum_grp_str, busi_flag, valid_flag, remark_info, 
        src_data_type from db_rpts.tb_rpt_sum_pd_stock_strike where  (co_no = v_opor_co_no)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_order_dir = 0 or order_dir=v_order_dir)  order by pd_no,init_date  limit v_row_count;
    end if;

     else

    /* [获取历史表记录][报表_报表数据_报表汇总产品证券成交][字段][ ({机构编号} = @操作员机构编号#)   and ({初始化日期}  between @查询开始日期# and @查询结束日期#)  and (@产品编号# =  0 or {产品编号}=@产品编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and (@订单方向# = 0 or {订单方向}=@订单方向#)  order by {产品编号},{初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, stock_code_no, asset_acco, 
        stock_acco, exch_no, invest_type, stock_type, 
        stock_code, stock_name, crncy_type, strike_aver_price, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, bond_accr_intrst, net_price_flag, bank_ib_member, 
        last_price, quot_strike_qty, quot_strike_amt, sum_grp_cnt, 
        sum_grp_str, busi_flag, valid_flag, remark_info, 
        src_data_type from db_rpts_his.tb_rpt_sum_pd_stock_strike_his where  (co_no = v_opor_co_no)   and (init_date  between v_qry_begin_date and v_qry_end_date)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_order_dir = 0 or order_dir=v_order_dir)  order by pd_no,init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, stock_code_no, asset_acco, 
        stock_acco, exch_no, invest_type, stock_type, 
        stock_code, stock_name, crncy_type, strike_aver_price, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, bond_accr_intrst, net_price_flag, bank_ib_member, 
        last_price, quot_strike_qty, quot_strike_amt, sum_grp_cnt, 
        sum_grp_str, busi_flag, valid_flag, remark_info, 
        src_data_type from db_rpts_his.tb_rpt_sum_pd_stock_strike_his where  (co_no = v_opor_co_no)   and (init_date  between v_qry_begin_date and v_qry_end_date)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_order_dir = 0 or order_dir=v_order_dir)  order by pd_no,init_date  limit v_row_count;
    end if;

     end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询区间汇总产品证券成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_RegSum_Pd_Stock_Strike;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_RegSum_Pd_Stock_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_order_dir int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_query_region_type int;
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_order_dir int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_query_region_type = p_query_region_type;
    SET v_pd_no = p_pd_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 查询区间方式:1-从开始日期到结束日期；2-区间的最小日期；3-区间的最大日期；4-区间最小日期与最大日期；5-区间从开始日期(不包括)到结束日期

    /* select min(t.{初始化日期}) as {开始日期},max(t.{初始化日期}) as {结束日期},count(distinct t.{初始化日期}) as {统计天数}, */
    select min(t.init_date) as begin_date,max(t.init_date) as end_date,count(distinct t.init_date) as stat_days,

    /* t.{机构编号},
t.{产品编号},
t.{证券代码编号},
t.{资产账户},
t.{股东代码},
t.{市场编号},
t.{投资类型},
t.{证券类型},
t.{本币币种},
t.{订单方向},
t.{净价标志}, */
    t.co_no,
    t.pd_no,
    t.stock_code_no,
    t.asset_acco,
    t.stock_acco,
    t.exch_no,
    t.invest_type,
    t.stock_type,
    t.crncy_type,
    t.order_dir,
    t.net_price_flag,

    /* sum(t.{成交金额})/sum(t.{成交数量}) as {订单价格},
sum(t.{订单数量}) as {订单数量},
sum(t.{成交数量}) as {成交数量},
sum(t.{成交金额}) as {成交金额},
sum(t.{全部费用}) as {全部费用},
sum(t.{印花税}) as {印花税},
sum(t.{过户费}) as {过户费},
sum(t.{经手费}) as {经手费},
sum(t.{证管费}) as {证管费},
sum(t.{其他费用}) as {其他费用},
sum(t.{交易佣金}) as {交易佣金},
sum(t.{其他佣金}) as {其他佣金},
sum(t.{债券计提利息}) as {债券计提利息},
sum(t.{行情成交数量}) as {行情成交数量},
sum(t.{行情成交金额}) as {行情成交金额} */
    sum(t.strike_amt)/sum(t.strike_qty) as order_price,
    sum(t.order_qty) as order_qty,
    sum(t.strike_qty) as strike_qty,
    sum(t.strike_amt) as strike_amt,
    sum(t.all_fee) as all_fee,
    sum(t.stamp_tax) as stamp_tax,
    sum(t.trans_fee) as trans_fee,
    sum(t.brkage_fee) as brkage_fee,
    sum(t.SEC_charges) as SEC_charges,
    sum(t.other_fee) as other_fee,
    sum(t.trade_commis) as trade_commis,
    sum(t.other_commis) as other_commis,
    sum(t.bond_accr_intrst) as bond_accr_intrst,
    sum(t.quot_strike_qty) as quot_strike_qty,
    sum(t.quot_strike_amt) as quot_strike_amt

    /* from ~历史_报表_报表数据_报表汇总产品证券成交^ t */
    from db_rpts_his.tb_rpt_sum_pd_stock_strike_his t

    /* where ({机构编号} = @操作员机构编号#)   and (@产品编号# =  0 or {产品编号}=@产品编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and (@订单方向# = 0 or {订单方向}=@订单方向#) */
    where (co_no = v_opor_co_no)   and (v_pd_no =  0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_stock_type = 0 or stock_type=v_stock_type) and (v_order_dir = 0 or order_dir=v_order_dir)

    /* and ((case when @查询区间方式# = 5 then ({初始化日期}  > @查询开始日期#) else ({初始化日期}  >= @查询开始日期#) end) */
    and ((case when v_query_region_type = 5 then (init_date  > v_qry_begin_date) else (init_date  >= v_qry_begin_date) end)

    /* and {初始化日期}  <= @查询结束日期#) */
    and init_date  <= v_qry_end_date)

    /* group by t.{机构编号},
t.{产品编号},
t.{证券代码编号},
t.{资产账户},
t.{股东代码},
t.{市场编号},
t.{投资类型},
t.{证券类型},
t.{本币币种},
t.{订单方向} */
    group by t.co_no,
    t.pd_no,
    t.stock_code_no,
    t.asset_acco,
    t.stock_acco,
    t.exch_no,
    t.invest_type,
    t.stock_type,
    t.crncy_type,
    t.order_dir
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询汇总产品资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Sum_Pd_equitiescashoperation;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Sum_Pd_equitiescashoperation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
    IN p_busi_flag int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_pd_no int;
    declare v_busi_flag int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_pd_no = p_pd_no;
    SET v_busi_flag = p_busi_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    select * from db_dc.tb_v1_exgp_sum_day_equitiescashoperation_his t

    /* where  ({机构编号} = @操作员机构编号#)   and ({初始化日期}  between @查询开始日期# and @查询结束日期#)  and (@产品编号# =  0 or {产品编号}=@产品编号#) and (@业务标志# = 0 or {业务标志}=@业务标志#) */
    where  (co_no = v_opor_co_no)   and (init_date  between v_qry_begin_date and v_qry_end_date)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_busi_flag = 0 or busi_flag=v_busi_flag)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询区间汇总产品资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_RegSum_Pd_equitiescashoperation;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_RegSum_Pd_equitiescashoperation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
    IN p_busi_flag int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_pd_no int;
    declare v_busi_flag int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_pd_no = p_pd_no;
    SET v_busi_flag = p_busi_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select min(t.{初始化日期}) as {开始日期},max(t.{初始化日期}) as {结束日期}, */
    select min(t.init_date) as begin_date,max(t.init_date) as end_date,

     /* t.{机构编号},t.{产品编号},t.{业务标志}, */
     t.co_no,t.pd_no,t.busi_flag,

     /* sum(t.{变动金额}) as {变动金额} */
     sum(t.occur_amt) as occur_amt
     from db_dc.tb_v1_exgp_sum_day_equitiescashoperation_his t

    /* where  ({机构编号} = @操作员机构编号#)   and ({初始化日期}  between @查询开始日期# and @查询结束日期#)  and (@产品编号# =  0 or {产品编号}=@产品编号#) and (@业务标志# = 0 or {业务标志}=@业务标志#) */
    where  (co_no = v_opor_co_no)   and (init_date  between v_qry_begin_date and v_qry_end_date)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_busi_flag = 0 or busi_flag=v_busi_flag)

    /* group by t.{机构编号},
t.{产品编号},t.{业务标志} */
    group by t.co_no,
    t.pd_no,t.busi_flag
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询月汇总产品持仓成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_MonthSum_Pd_Posi_Strike;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_MonthSum_Pd_Posi_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_pd_no int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_报表月汇总产品持仓成交][字段][ ({机构编号} = @操作员机构编号#)   and ({当前月份}  between  DATE_FORMAT(@查询开始日期#,'%Y%m') and  DATE_FORMAT(@查询结束日期#,'%Y%m')) and (@产品编号# =  0 or {产品编号}=@产品编号#) order by {产品编号},{当前月份} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, curr_month, 
        co_no, pd_no, pd_code, pd_name, 
        crncy_type, stat_days, begin_NAV, end_nav_asset, 
        avg_nav_asset, avg_total_asset, avg_stock_asset, avg_futu_asset, 
        avg_option_asset, avg_warrant_asset, avg_fund_asset, avg_cash_asset, 
        avg_repo_asset, avg_bond_asset, avg_money_fund_asset, pd_begin_unit_nav, 
        end_unit_nav, avg_pd_all_share, buy_amt, sellout_amt, 
        begin_date, end_date, month_apply_amt, trade_deduct_amt, 
        remark_info, sum_grp_cnt, sum_grp_str, src_data_type from db_rpts.tb_rpt_monthsum_pd_posi_strike where  (co_no = v_opor_co_no)   and (curr_month  between  DATE_FORMAT(v_qry_begin_date,'%Y%m') and  DATE_FORMAT(v_qry_end_date,'%Y%m')) and (v_pd_no =  0 or pd_no=v_pd_no) order by pd_no,curr_month ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, curr_month, 
        co_no, pd_no, pd_code, pd_name, 
        crncy_type, stat_days, begin_NAV, end_nav_asset, 
        avg_nav_asset, avg_total_asset, avg_stock_asset, avg_futu_asset, 
        avg_option_asset, avg_warrant_asset, avg_fund_asset, avg_cash_asset, 
        avg_repo_asset, avg_bond_asset, avg_money_fund_asset, pd_begin_unit_nav, 
        end_unit_nav, avg_pd_all_share, buy_amt, sellout_amt, 
        begin_date, end_date, month_apply_amt, trade_deduct_amt, 
        remark_info, sum_grp_cnt, sum_grp_str, src_data_type from db_rpts.tb_rpt_monthsum_pd_posi_strike where  (co_no = v_opor_co_no)   and (curr_month  between  DATE_FORMAT(v_qry_begin_date,'%Y%m') and  DATE_FORMAT(v_qry_end_date,'%Y%m')) and (v_pd_no =  0 or pd_no=v_pd_no) order by pd_no,curr_month  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询结算提前待入账记录表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_clsest_before_preentry;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_clsest_before_preentry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_busi_flag int,
    IN p_act_record_flag int,
    IN p_acco_entry_flag int,
    IN p_entry_status varchar(2),
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_busi_flag int;
    declare v_act_record_flag int;
    declare v_acco_entry_flag int;
    declare v_entry_status varchar(2);
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_busi_flag = p_busi_flag;
    SET v_act_record_flag = p_act_record_flag;
    SET v_acco_entry_flag = p_acco_entry_flag;
    SET v_entry_status = p_entry_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][报表_报表数据_报表结算提前待入账记录表][字段][ ({机构编号} = @操作员机构编号#)  and ({初始化日期}  between @查询开始日期# and @查询结束日期#)  and (@产品编号# =  0 or {产品编号}=@产品编号#) 
and (@交易组编号# =  0 or {交易组编号}=@交易组编号#) 
and (@证券代码编号# =  0 or {证券代码编号}=@证券代码编号#) 
and (@证券类型# =  0 or {证券类型}=@证券类型#) 
and (@资产类型# =  0 or {资产类型}=@资产类型#) 
and (@业务标志# =  0 or {业务标志}=@业务标志#) 
and (@账户登记标志# =  0 or {账户登记标志}=@账户登记标志#) 
and (@账户入账标志# =  0 or {账户入账标志}=@账户入账标志#) 
and (@入账状态# =  “ ” or {入账状态}=@入账状态#)  order by {产品编号},{初始化日期} ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_name, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        stock_name, asset_acco_no, crncy_type, exch_crncy_type, 
        exch_rate, trade_code_no, target_code_no, stock_type, 
        asset_type, pre_entry_qty, pre_entry_amt, impawn_ratio, 
        bond_accr_intrst, busi_flag, act_record_flag, acco_entry_flag, 
        entry_money_jour_no, entry_status, reg_date, arrive_date, 
        begin_trade_date, remark_info, src_data_type from db_rpts.tb_rpt_clsest_before_preentry where  (co_no = v_opor_co_no)  and (init_date  between v_qry_begin_date and v_qry_end_date)  and (v_pd_no =  0 or pd_no=v_pd_no) 
    and (v_exch_group_no =  0 or exch_group_no=v_exch_group_no) 
    and (v_stock_code_no =  0 or stock_code_no=v_stock_code_no) 
    and (v_stock_type =  0 or stock_type=v_stock_type) 
    and (v_asset_type =  0 or asset_type=v_asset_type) 
    and (v_busi_flag =  0 or busi_flag=v_busi_flag) 
    and (v_act_record_flag =  0 or act_record_flag=v_act_record_flag) 
    and (v_acco_entry_flag =  0 or acco_entry_flag=v_acco_entry_flag) 
    and (v_entry_status =  " " or entry_status=v_entry_status)  order by pd_no,init_date ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_name, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        stock_name, asset_acco_no, crncy_type, exch_crncy_type, 
        exch_rate, trade_code_no, target_code_no, stock_type, 
        asset_type, pre_entry_qty, pre_entry_amt, impawn_ratio, 
        bond_accr_intrst, busi_flag, act_record_flag, acco_entry_flag, 
        entry_money_jour_no, entry_status, reg_date, arrive_date, 
        begin_trade_date, remark_info, src_data_type from db_rpts.tb_rpt_clsest_before_preentry where  (co_no = v_opor_co_no)  and (init_date  between v_qry_begin_date and v_qry_end_date)  and (v_pd_no =  0 or pd_no=v_pd_no) 
    and (v_exch_group_no =  0 or exch_group_no=v_exch_group_no) 
    and (v_stock_code_no =  0 or stock_code_no=v_stock_code_no) 
    and (v_stock_type =  0 or stock_type=v_stock_type) 
    and (v_asset_type =  0 or asset_type=v_asset_type) 
    and (v_busi_flag =  0 or busi_flag=v_busi_flag) 
    and (v_act_record_flag =  0 or act_record_flag=v_act_record_flag) 
    and (v_acco_entry_flag =  0 or acco_entry_flag=v_acco_entry_flag) 
    and (v_entry_status =  " " or entry_status=v_entry_status)  order by pd_no,init_date  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_修改统计基金经理资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Modi_Fund_Mananger_Asset;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Modi_Fund_Mananger_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_fund_manager_no int,
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
    declare v_fund_manager_no int;
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][报表_报表数据_统计基金经理资产][{备注信息}=@备注信息#][{机构编号}=@操作员机构编号# and ({初始化日期}=@初始化日期#) and ({基金经理编号}=@基金经理编号#)  ][14020301][@操作员机构编号#,@基金经理编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rpts.tb_rpt_stat_fund_mananger_asset set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, remark_info=v_remark_info where co_no=v_opor_co_no and (init_date=v_init_date) and (fund_manager_no=v_fund_manager_no)  ;
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.313.14020301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员机构编号=",v_opor_co_no,",","基金经理编号=",v_fund_manager_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员机构编号=",v_opor_co_no,",","基金经理编号=",v_fund_manager_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][历史_报表_报表数据_统计基金经理资产][{备注信息}=@备注信息#][{机构编号}=@操作员机构编号# and ({初始化日期}=@初始化日期#) and ({基金经理编号}=@基金经理编号#)  ][14020301][@操作员机构编号#,@基金经理编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rpts_his.tb_rpt_stat_fund_mananger_asset_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, remark_info=v_remark_info where co_no=v_opor_co_no and (init_date=v_init_date) and (fund_manager_no=v_fund_manager_no)  ;
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.313.14020301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员机构编号=",v_opor_co_no,",","基金经理编号=",v_fund_manager_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员机构编号=",v_opor_co_no,",","基金经理编号=",v_fund_manager_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询统计基金经理资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Fund_Mananger_Asset;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Fund_Mananger_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
    IN p_fund_manager_no int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_query_region_type int;
    declare v_fund_manager_no int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_query_region_type = p_query_region_type;
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if (@查询开始日期# = 0) and (@查询结束日期# = 0) then */
    if (v_qry_begin_date = 0) and (v_qry_end_date = 0) then

    /* select t.* from ~报表_报表数据_统计基金经理资产^ t where ({机构编号} = @操作员机构编号#)  and (@基金经理编号# =  0 or {基金经理编号}=@基金经理编号#) ; */
    select t.* from db_rpts.tb_rpt_stat_fund_mananger_asset t where (co_no = v_opor_co_no)  and (v_fund_manager_no =  0 or fund_manager_no=v_fund_manager_no) ;
    else

    /* select t.* from ~历史_报表_报表数据_统计基金经理资产^ t where ({机构编号} = @操作员机构编号#)  and (@基金经理编号# =  0 or {基金经理编号}=@基金经理编号#) */
    select t.* from db_rpts_his.tb_rpt_stat_fund_mananger_asset_his t where (co_no = v_opor_co_no)  and (v_fund_manager_no =  0 or fund_manager_no=v_fund_manager_no)

     /* and ({初始化日期}  between @查询开始日期# and @查询结束日期#) */
     and (init_date  between v_qry_begin_date and v_qry_end_date)
    ;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_修改统计基金经理持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Modi_Fund_Mananger_Posi;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Modi_Fund_Mananger_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_fund_manager_no int,
    IN p_stock_code_no int,
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
    declare v_fund_manager_no int;
    declare v_stock_code_no int;
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][报表_报表数据_统计基金经理持仓][{备注信息}=@备注信息#][{机构编号}=@操作员机构编号# and ({初始化日期}=@初始化日期#) and ({基金经理编号}=@基金经理编号#)  and ({证券代码编号}=@证券代码编号#) ][14020301][@操作员机构编号#,@基金经理编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rpts.tb_rpt_stat_fund_mananger_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, remark_info=v_remark_info where co_no=v_opor_co_no and (init_date=v_init_date) and (fund_manager_no=v_fund_manager_no)  and (stock_code_no=v_stock_code_no) ;
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.315.14020301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员机构编号=",v_opor_co_no,",","基金经理编号=",v_fund_manager_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员机构编号=",v_opor_co_no,",","基金经理编号=",v_fund_manager_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][历史_报表_报表数据_统计基金经理持仓][{备注信息}=@备注信息#][{机构编号}=@操作员机构编号# and ({初始化日期}=@初始化日期#) and ({基金经理编号}=@基金经理编号#)  and ({证券代码编号}=@证券代码编号#) ][14020301][@操作员机构编号#,@基金经理编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rpts_his.tb_rpt_stat_fund_mananger_posi_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, remark_info=v_remark_info where co_no=v_opor_co_no and (init_date=v_init_date) and (fund_manager_no=v_fund_manager_no)  and (stock_code_no=v_stock_code_no) ;
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.315.14020301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员机构编号=",v_opor_co_no,",","基金经理编号=",v_fund_manager_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员机构编号=",v_opor_co_no,",","基金经理编号=",v_fund_manager_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询统计基金经理持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Fund_Mananger_Posi;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Fund_Mananger_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
    IN p_fund_manager_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_query_region_type int;
    declare v_fund_manager_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_query_region_type = p_query_region_type;
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if (@查询开始日期# = 0) and (@查询结束日期# = 0) then */
    if (v_qry_begin_date = 0) and (v_qry_end_date = 0) then

    /* select t.* from ~报表_报表数据_统计基金经理持仓^ t where ({机构编号} = @操作员机构编号#)  and (@基金经理编号# =  0 or {基金经理编号}=@基金经理编号#) */
    select t.* from db_rpts.tb_rpt_stat_fund_mananger_posi t where (co_no = v_opor_co_no)  and (v_fund_manager_no =  0 or fund_manager_no=v_fund_manager_no)

    /* and (@市场编号# = 0 or t.{市场编号}=@市场编号#) and (@证券代码编号# = 0 or t.{证券代码编号}=@证券代码编号#) and (@证券类型# = 0 or t.{证券类型}=@证券类型#) and (@资产类型# = 0 or t.{资产类型}=@资产类型#) */
    and (v_exch_no = 0 or t.exch_no=v_exch_no) and (v_stock_code_no = 0 or t.stock_code_no=v_stock_code_no) and (v_stock_type = 0 or t.stock_type=v_stock_type) and (v_asset_type = 0 or t.asset_type=v_asset_type)
    ;
    else

    /* select t.* from ~历史_报表_报表数据_统计基金经理持仓^ t where ({机构编号} = @操作员机构编号#)  and (@基金经理编号# =  0 or {基金经理编号}=@基金经理编号#) */
    select t.* from db_rpts_his.tb_rpt_stat_fund_mananger_posi_his t where (co_no = v_opor_co_no)  and (v_fund_manager_no =  0 or fund_manager_no=v_fund_manager_no)

     /* and ({初始化日期}  between @查询开始日期# and @查询结束日期#) */
     and (init_date  between v_qry_begin_date and v_qry_end_date)

    /* and (@市场编号# = 0 or t.{市场编号}=@市场编号#) and (@证券代码编号# = 0 or t.{证券代码编号}=@证券代码编号#) and (@证券类型# = 0 or t.{证券类型}=@证券类型#) and (@资产类型# = 0 or t.{资产类型}=@资产类型#) */
    and (v_exch_no = 0 or t.exch_no=v_exch_no) and (v_stock_code_no = 0 or t.stock_code_no=v_stock_code_no) and (v_stock_type = 0 or t.stock_type=v_stock_type) and (v_asset_type = 0 or t.asset_type=v_asset_type)
    ;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_新增机构业绩报告配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Add_Co_MonthRpt_Config;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Add_Co_MonthRpt_Config(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_config_no bigint,
    IN p_config_name varchar(64),
    IN p_show_order int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_config_no bigint;
    declare v_config_name varchar(64);
    declare v_show_order int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_config_no = p_config_no;
    SET v_config_name = p_config_name;
    SET v_show_order = p_show_order;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [记录不存在插入表记录][报表_报表数据_机构业绩报告配置][字段][字段变量][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {配置编号}=@配置编号#][10002]["机构_业绩报告_配置信息"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_co_month_rpt_config (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        config_no, config_name, show_order, remark_info) 
        select v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_config_no, v_config_name, v_show_order, v_remark_info 
        from dual 
        where not exists(select * from db_rpts.tb_rpt_co_month_rpt_config where co_no=v_co_no and pd_no=v_pd_no and config_no=v_config_no);
    if v_error_code <> "0" then
                
        SET v_error_code = "rptA.2.401.10002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("机构_业绩报告_配置信息","#",v_mysql_message);
        else
            SET v_error_info = "机构_业绩报告_配置信息";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_删除机构业绩报告配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Del_Co_MonthRpt_Config;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Del_Co_MonthRpt_Config(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_config_no bigint,
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
    declare v_config_no bigint;
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
    SET v_config_no = p_config_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_修改机构业绩报告配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Modi_Co_MonthRpt_Config;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Modi_Co_MonthRpt_Config(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_config_no bigint,
    IN p_config_name varchar(64),
    IN p_show_order int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_config_no bigint;
    declare v_config_name varchar(64);
    declare v_show_order int;
    declare v_remark_info varchar(255);
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
    SET v_config_no = p_config_no;
    SET v_config_name = p_config_name;
    SET v_show_order = p_show_order;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询机构业绩报告配置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Co_MonthRpt_Config;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Co_MonthRpt_Config(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_config_no bigint,
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
    declare v_pd_no int;
    declare v_config_no bigint;
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
    SET v_pd_no = p_pd_no;
    SET v_config_no = p_config_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select * from ~报表_报表数据_机构业绩报告配置^ t */
    select * from db_rpts.tb_rpt_co_month_rpt_config t

    /* where ({机构编号} = @操作员机构编号#)  and (@产品编号# =  0 or {产品编号}=@产品编号#) and (@配置编号# =  0 or {配置编号}=@配置编号#) */
    where (co_no = v_opor_co_no)  and (v_pd_no =  0 or pd_no=v_pd_no) and (v_config_no =  0 or config_no=v_config_no)

    /* order by {产品编号},{初始化日期} */
    order by pd_no,init_date
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_新增产品业绩报告附加信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Add_Pd_MonthRpt_AddInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Add_Pd_MonthRpt_AddInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_rpt_add_info varchar(10000),
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
    declare v_rpt_add_info varchar(10000);
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
    SET v_rpt_add_info = p_rpt_add_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [记录不存在插入表记录][报表_报表数据_产品业绩报告附加信息][字段][字段变量][{机构编号}=@机构编号# and {产品编号}=@产品编号# ][10002]["产品_业绩报告_附加信息"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_pd_month_rpt_add_info (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        rpt_add_info) 
        select v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_rpt_add_info 
        from dual 
        where not exists(select * from db_rpts.tb_rpt_pd_month_rpt_add_info where co_no=v_co_no and pd_no=v_pd_no );
    if v_error_code <> "0" then
                
        SET v_error_code = "rptA.2.406.10002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("产品_业绩报告_附加信息","#",v_mysql_message);
        else
            SET v_error_info = "产品_业绩报告_附加信息";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_删除产品业绩报告附加信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Del_Pd_MonthRpt_AddInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Del_Pd_MonthRpt_AddInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_修改产品业绩报告附加信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Modi_Pd_MonthRpt_AddInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Modi_Pd_MonthRpt_AddInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_rpt_add_info varchar(10000),
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
    declare v_rpt_add_info varchar(10000);
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
    SET v_rpt_add_info = p_rpt_add_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询产品业绩报告附加信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_MonthRpt_AddInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_MonthRpt_AddInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
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
    declare v_pd_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select * from ~报表_报表数据_产品业绩报告附加信息^ t */
    select * from db_rpts.tb_rpt_pd_month_rpt_add_info t

    /* where ({机构编号} = @操作员机构编号#)  and (@产品编号# =  0 or {产品编号}=@产品编号#) */
    where (co_no = v_opor_co_no)  and (v_pd_no =  0 or pd_no=v_pd_no)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_新增基金经理信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Add_Fund_Mananger;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Add_Fund_Mananger(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
    IN p_fund_manager_name varchar(32),
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
    declare v_co_no int;
    declare v_fund_manager_no int;
    declare v_fund_manager_name varchar(32);
    declare v_remark_info varchar(255);
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_fund_manager_name = p_fund_manager_name;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_删除基金经理信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Del_Fund_Mananger;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Del_Fund_Mananger(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
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
    declare v_fund_manager_no int;
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_修改基金经理信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Modi_Fund_Mananger;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Modi_Fund_Mananger(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
    IN p_fund_manager_name varchar(32),
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
    declare v_co_no int;
    declare v_fund_manager_no int;
    declare v_fund_manager_name varchar(32);
    declare v_remark_info varchar(255);
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_fund_manager_name = p_fund_manager_name;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询基金经理信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Fund_Mananger;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Fund_Mananger(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
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
    declare v_fund_manager_no int;
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_新增交易员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Add_Trader;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Add_Trader(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
    IN p_fund_manager_name varchar(32),
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
    declare v_co_no int;
    declare v_fund_manager_no int;
    declare v_fund_manager_name varchar(32);
    declare v_remark_info varchar(255);
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_fund_manager_name = p_fund_manager_name;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_删除交易员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Del_Trader;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Del_Trader(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
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
    declare v_fund_manager_no int;
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_修改交易员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Modi_Trader;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Modi_Trader(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
    IN p_fund_manager_name varchar(32),
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
    declare v_co_no int;
    declare v_fund_manager_no int;
    declare v_fund_manager_name varchar(32);
    declare v_remark_info varchar(255);
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_fund_manager_name = p_fund_manager_name;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询交易员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Trader;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Trader(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
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
    declare v_fund_manager_no int;
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_新增产品基金经理与交易员
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Add_Pd_Fund_Mananger_Trader;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Add_Pd_Fund_Mananger_Trader(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_fund_manager_no int,
    IN p_fund_manager_name varchar(32),
    IN p_trader_no int,
    IN p_trader_name varchar(32),
    IN p_show_order int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_fund_manager_no int;
    declare v_fund_manager_name varchar(32);
    declare v_trader_no int;
    declare v_trader_name varchar(32);
    declare v_show_order int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_fund_manager_name = p_fund_manager_name;
    SET v_trader_no = p_trader_no;
    SET v_trader_name = p_trader_name;
    SET v_show_order = p_show_order;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [记录不存在插入表记录][报表_报表数据_基金经理与交易员关系表][字段][字段变量][{机构编号}=@机构编号# and {产品编号}=@产品编号#][10002]["基金经理与交易员信息"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_pd_mananger_trader_conn (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        fund_manager_no, fund_manager_name, trader_no, trader_name, 
        show_order, remark_info) 
        select v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_fund_manager_no, v_fund_manager_name, v_trader_no, v_trader_name, 
        v_show_order, v_remark_info 
        from dual 
        where not exists(select * from db_rpts.tb_rpt_pd_mananger_trader_conn where co_no=v_co_no and pd_no=v_pd_no);
    if v_error_code <> "0" then
                
        SET v_error_code = "rptA.2.421.10002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("基金经理与交易员信息","#",v_mysql_message);
        else
            SET v_error_info = "基金经理与交易员信息";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_删除产品基金经理与交易员
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Del_Pd_Fund_Mananger_Trader;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Del_Pd_Fund_Mananger_Trader(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_row_id = p_row_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][报表_报表数据_基金经理与交易员关系表][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {记录序号}=@记录序号# ][3][@记录序号#] */
    delete from db_rpts.tb_rpt_pd_mananger_trader_conn 
        where co_no=v_co_no and pd_no=v_pd_no and row_id=v_row_id ;
    if v_error_code = 1 then
                
        SET v_error_code = "rptA.2.422.3";
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
use db_rpts;;

# 原子_报表_报表数据_修改产品基金经理与交易员
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Modi_Pd_Fund_Mananger_Trader;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Modi_Pd_Fund_Mananger_Trader(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_fund_manager_no int,
    IN p_fund_manager_name varchar(32),
    IN p_trader_no int,
    IN p_trader_name varchar(32),
    IN p_show_order int,
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
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_fund_manager_no int;
    declare v_fund_manager_name varchar(32);
    declare v_trader_no int;
    declare v_trader_name varchar(32);
    declare v_show_order int;
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
    SET v_row_id = p_row_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_fund_manager_name = p_fund_manager_name;
    SET v_trader_no = p_trader_no;
    SET v_trader_name = p_trader_name;
    SET v_show_order = p_show_order;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][报表_报表数据_基金经理与交易员关系表][{基金经理编号}=@基金经理编号#,{基金经理名称}=@基金经理名称#,{交易员编号}=@交易员编号#,{交易员名称}=@交易员名称#,{显示顺序}=@显示顺序#,{备注信息}=@备注信息#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][14020301][@机构编号#,@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rpts.tb_rpt_pd_mananger_trader_conn set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, fund_manager_no=v_fund_manager_no,fund_manager_name=v_fund_manager_name,trader_no=v_trader_no,trader_name=v_trader_name,show_order=v_show_order,remark_info=v_remark_info where co_no=v_co_no and pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.423.14020301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询产品基金经理与交易员
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_Fund_Mananger_Trader;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_Fund_Mananger_Trader(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_fund_manager_no int,
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
    declare v_fund_manager_no int;
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
    SET v_fund_manager_no = p_fund_manager_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select * from ~报表_报表数据_基金经理与交易员关系表^ t */
    select * from db_rpts.tb_rpt_pd_mananger_trader_conn t

    /* join ~报表_报表数据_产品资产表^ x on (t.{机构编号},t.{产品编号}) =   (x.{机构编号},x.{产品编号}) */
    join db_rpts.tb_rpt_productasset x on (t.co_no,t.pd_no) =   (x.co_no,x.pd_no)

    /* where (@机构编号# =  0 or t.{机构编号}=@机构编号#) */
    where (v_co_no =  0 or t.co_no=v_co_no)

    /* and  (@基金经理编号# =  0 or t.{基金经理编号}=@基金经理编号#) */
    and  (v_fund_manager_no =  0 or t.fund_manager_no=v_fund_manager_no)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_新增产品持仓导入外部交割流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Add_Pd_Out_Deli_Jour;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Add_Pd_Out_Deli_Jour(
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
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_pass_deli_jour_no bigint,
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_num int,
    IN p_entry_end_qty decimal(18,2),
    IN p_entry_end_amt decimal(18,4),
    IN p_out_all_fee decimal(18,4),
    IN p_out_stamp_tax decimal(18,4),
    IN p_out_trans_fee decimal(18,4),
    IN p_out_brkage decimal(18,4),
    IN p_out_SEC_charges decimal(18,4),
    IN p_out_other_fee decimal(18,4),
    IN p_out_brkage_commis decimal(18,4),
    IN p_out_chann_commis decimal(18,4),
    IN p_out_divi_commis decimal(18,4),
    IN p_out_other_commis decimal(18,4),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_pass_deli_jour_no bigint;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_entry_end_qty decimal(18,2);
    declare v_entry_end_amt decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_out_stamp_tax decimal(18,4);
    declare v_out_trans_fee decimal(18,4);
    declare v_out_brkage decimal(18,4);
    declare v_out_SEC_charges decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_chann_commis decimal(18,4);
    declare v_out_divi_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_busi_flag int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_pass_deli_jour_no = p_pass_deli_jour_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_num = p_strike_num;
    SET v_entry_end_qty = p_entry_end_qty;
    SET v_entry_end_amt = p_entry_end_amt;
    SET v_out_all_fee = p_out_all_fee;
    SET v_out_stamp_tax = p_out_stamp_tax;
    SET v_out_trans_fee = p_out_trans_fee;
    SET v_out_brkage = p_out_brkage;
    SET v_out_SEC_charges = p_out_SEC_charges;
    SET v_out_other_fee = p_out_other_fee;
    SET v_out_brkage_commis = p_out_brkage_commis;
    SET v_out_chann_commis = p_out_chann_commis;
    SET v_out_divi_commis = p_out_divi_commis;
    SET v_out_other_commis = p_out_other_commis;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][报表_报表数据_产品持仓导入外部交割流水表][字段][字段变量][10002]["报表_报表数据_产品持仓导入外部交割流水表"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_imp_pd_out_deli_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, pass_deli_jour_no, strike_date, strike_time, 
        strike_no, report_date, report_time, report_no, 
        crncy_type, exch_no, stock_acco, stock_code, 
        order_dir, order_price, order_qty, strike_price, 
        strike_qty, strike_amt, strike_num, entry_end_qty, 
        entry_end_amt, out_all_fee, out_stamp_tax, out_trans_fee, 
        out_brkage, out_SEC_charges, out_other_fee, out_brkage_commis, 
        out_chann_commis, out_divi_commis, out_other_commis, busi_flag, 
        remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_pass_deli_jour_no, v_strike_date, v_strike_time, 
        v_strike_no, v_report_date, v_report_time, v_report_no, 
        v_crncy_type, v_exch_no, v_stock_acco, v_stock_code, 
        v_order_dir, v_order_price, v_order_qty, v_strike_price, 
        v_strike_qty, v_strike_amt, v_strike_num, v_entry_end_qty, 
        v_entry_end_amt, v_out_all_fee, v_out_stamp_tax, v_out_trans_fee, 
        v_out_brkage, v_out_SEC_charges, v_out_other_fee, v_out_brkage_commis, 
        v_out_chann_commis, v_out_divi_commis, v_out_other_commis, v_busi_flag, 
        v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.425.10002";
        SET v_error_info =  CONCAT("报表_报表数据_产品持仓导入外部交割流水表","#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_删除产品持仓导入外部交割流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Del_Pd_Out_Deli_Jour;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Del_Pd_Out_Deli_Jour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_query_region_type int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_query_region_type = p_query_region_type;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* delete t from ~报表_报表数据_产品持仓导入外部交割流水表^ t */
    delete t from db_rpts.tb_rpt_imp_pd_out_deli_jour t

    /* where (@产品编号# =  0 or {产品编号}=@产品编号#) and ({初始化日期}  between @查询开始日期# and @查询结束日期#) */
    where (v_pd_no =  0 or pd_no=v_pd_no) and (init_date  between v_qry_begin_date and v_qry_end_date)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_查询产品持仓导入外部交割流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Qry_Pd_Out_Deli_Jour;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Qry_Pd_Out_Deli_Jour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_query_region_type int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_query_region_type = p_query_region_type;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select * from ~报表_报表数据_产品持仓导入外部交割流水表^ t */
    select * from db_rpts.tb_rpt_imp_pd_out_deli_jour t

    /* where (@产品编号# =  0 or {产品编号}=@产品编号#) and ({初始化日期}  between @查询开始日期# and @查询结束日期#) */
    where (v_pd_no =  0 or pd_no=v_pd_no) and (init_date  between v_qry_begin_date and v_qry_end_date)
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_处理产品持仓导入外部交割流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Set_Pd_Out_Deli_Jour;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Set_Pd_Out_Deli_Jour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_query_region_type int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_query_region_type int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_query_region_type = p_query_region_type;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 1.删除
    DELETE t from tb_rpt_pd_stock_strike_his t

    /* where (@机构编号# =  0 or t.{机构编号}=@机构编号#) */
    where (v_co_no =  0 or t.co_no=v_co_no)

    /* and (@产品编号# =  0 or t.{产品编号}=@产品编号#) and (t.{初始化日期}  between @查询开始日期# and @查询结束日期#) */
    and (v_pd_no =  0 or t.pd_no=v_pd_no) and (t.init_date  between v_qry_begin_date and v_qry_end_date)
    ;
    # 2.插入
    INSERT INTO db_rpts.tb_rpt_pd_stock_strike_his ( create_date,create_time,update_date,update_time,init_date,co_no,pd_no,exch_no,stock_code,order_dir,order_price,order_qty,strike_qty,strike_amt,strike_no)
    SELECT create_date,create_time,update_date,update_time,init_date,co_no,pd_no,exch_no,stock_code,order_dir,order_price,order_qty,strike_qty,strike_amt,strike_no
     FROM db_rpts.tb_rpt_imp_pd_out_deli_jour t

    /* where (@机构编号# =  0 or t.{机构编号}=@机构编号#) */
    where (v_co_no =  0 or t.co_no=v_co_no)

    /* and (@产品编号# =  0 or t.{产品编号}=@产品编号#) and (t.{初始化日期}  between @查询开始日期# and @查询结束日期#) */
    and (v_pd_no =  0 or t.pd_no=v_pd_no) and (t.init_date  between v_qry_begin_date and v_qry_end_date)
    ;
    # 3.更新
    update tb_rpt_pd_stock_strike_his t
             join db_dc.tb_basesedt_stock_code_info x on (t.stock_code) = (x.stock_code) and x.stock_type = 1
     set t.stock_code_no = x.stock_code_no,t.stock_type = x.stock_type,t.exch_no = x.exch_no
    ,t.strike_qty = ABS(t.strike_qty),t.strike_amt = ABS(t.strike_amt)

    /* where (@机构编号# =  0 or t.{机构编号}=@机构编号#) */
    where (v_co_no =  0 or t.co_no=v_co_no)

    /* and (@产品编号# =  0 or t.{产品编号}=@产品编号#) and (t.{初始化日期}  between @查询开始日期# and @查询结束日期#) */
    and (v_pd_no =  0 or t.pd_no=v_pd_no) and (t.init_date  between v_qry_begin_date and v_qry_end_date)
    ;
    update tb_rpt_pd_stock_strike_his t
             join db_dc.tb_basesedt_stock_code_info x on (t.stock_code) = (x.stock_code) and x.stock_type <> 1
     set t.stock_code_no = x.stock_code_no,t.stock_type = x.stock_type,t.exch_no = x.exch_no
    ,t.strike_qty = ABS(t.strike_qty),t.strike_amt = ABS(t.strike_amt)

    /* where (@机构编号# =  0 or t.{机构编号}=@机构编号#) */
    where (v_co_no =  0 or t.co_no=v_co_no)

    /* and (@产品编号# =  0 or t.{产品编号}=@产品编号#) and (t.{初始化日期}  between @查询开始日期# and @查询结束日期#) */
    and (v_pd_no =  0 or t.pd_no=v_pd_no) and (t.init_date  between v_qry_begin_date and v_qry_end_date)
    and t.stock_code_no = 0
    ;
    # 4.汇总-删除

    /* DELETE t from ~历史_报表_报表数据_报表汇总产品证券成交^  t */
    DELETE t from db_rpts_his.tb_rpt_sum_pd_stock_strike_his  t

    /* where (@机构编号# =  0 or t.{机构编号}=@机构编号#) */
    where (v_co_no =  0 or t.co_no=v_co_no)

    /* and (@产品编号# =  0 or t.{产品编号}=@产品编号#) and (t.{初始化日期}  between @查询开始日期# and @查询结束日期#) */
    and (v_pd_no =  0 or t.pd_no=v_pd_no) and (t.init_date  between v_qry_begin_date and v_qry_end_date)
    ;
    # 5.汇总-插入

    /* INSERT INTO  ~历史_报表_报表数据_报表汇总产品证券成交^ ( co_no, pd_no,init_date,stock_code_no,exch_no,stock_type,stock_code,order_dir,order_price,order_qty,strike_qty,strike_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,sum_grp_cnt */
    INSERT INTO  db_rpts_his.tb_rpt_sum_pd_stock_strike_his ( co_no, pd_no,init_date,stock_code_no,exch_no,stock_type,stock_code,order_dir,order_price,order_qty,strike_qty,strike_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,sum_grp_cnt
    )
    SELECT t.co_no,t.pd_no,t.init_date,t.stock_code_no,t.exch_no,t.stock_type,t.stock_code,t.order_dir,
    AVG(t.order_price) as order_price,
    sum(t.order_qty) as order_qty,sum(t.strike_qty) as strike_qty,sum(t.strike_amt) as strike_amt,sum(t.all_fee) as all_fee,sum(t.stamp_tax) as stamp_tax,
    sum(t.trans_fee) as trans_fee,sum(t.brkage_fee) as brkage_fee,sum(t.SEC_charges) as SEC_charges,sum(t.other_fee) as other_fee,sum(t.trade_commis) as trade_commis,
    sum(t.other_commis) as other_commis,sum(t.bond_accr_intrst) as bond_accr_intrst,
    count(*) as sum_grp_cnt
    FROM tb_rpt_pd_stock_strike_his t

    /* where (@机构编号# =  0 or t.{机构编号}=@机构编号#) */
    where (v_co_no =  0 or t.co_no=v_co_no)

    /* and (@产品编号# =  0 or t.{产品编号}=@产品编号#) and (t.{初始化日期}  between @查询开始日期# and @查询结束日期#) */
    and (v_pd_no =  0 or t.pd_no=v_pd_no) and (t.init_date  between v_qry_begin_date and v_qry_end_date)
    and t.stock_code_no <> 0
    GROUP BY t.co_no,t.pd_no,t.init_date,t.stock_code_no,t.exch_no,t.stock_type,t.stock_code,t.order_dir
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_修改月汇总产品持仓成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Modi_MonthSum_Pd_Posi_Strike;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Modi_MonthSum_Pd_Posi_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_curr_month int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_month_apply_amt decimal(18,4),
    IN p_trade_deduct_amt decimal(18,4),
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
    declare v_curr_month int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_month_apply_amt decimal(18,4);
    declare v_trade_deduct_amt decimal(18,4);
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
    SET v_curr_month = p_curr_month;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_month_apply_amt = p_month_apply_amt;
    SET v_trade_deduct_amt = p_trade_deduct_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][报表_报表数据_报表月汇总产品持仓成交][{月净申购金额}=@月净申购金额#,{买卖扣除金额}=@买卖扣除金额#,{备注信息}=@备注信息#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {当前月份}=@当前月份#][14020301][@机构编号#,@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rpts.tb_rpt_monthsum_pd_posi_strike set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, month_apply_amt=v_month_apply_amt,trade_deduct_amt=v_trade_deduct_amt,remark_info=v_remark_info where co_no=v_co_no and pd_no=v_pd_no and curr_month=v_curr_month;
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.431.14020301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_新增汇总产品证券成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Add_Sum_Pd_Stock_Strike;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Add_Sum_Pd_Stock_Strike(
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
    IN p_stock_code_no int,
    IN p_asset_acco varchar(16),
    IN p_stock_acco varchar(16),
    IN p_exch_no int,
    IN p_invest_type int,
    IN p_stock_type int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_crncy_type varchar(3),
    IN p_strike_aver_price decimal(16,9),
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_net_price_flag int,
    IN p_bank_ib_member varchar(255),
    IN p_last_price decimal(16,9),
    IN p_quot_strike_qty decimal(18,2),
    IN p_quot_strike_amt decimal(18,4),
    IN p_sum_grp_cnt int,
    IN p_sum_grp_str varchar(255),
    IN p_busi_flag int,
    IN p_valid_flag int,
    IN p_remark_info varchar(255),
    IN p_src_data_type int,
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
    declare v_stock_code_no int;
    declare v_asset_acco varchar(16);
    declare v_stock_acco varchar(16);
    declare v_exch_no int;
    declare v_invest_type int;
    declare v_stock_type int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_crncy_type varchar(3);
    declare v_strike_aver_price decimal(16,9);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_net_price_flag int;
    declare v_bank_ib_member varchar(255);
    declare v_last_price decimal(16,9);
    declare v_quot_strike_qty decimal(18,2);
    declare v_quot_strike_amt decimal(18,4);
    declare v_sum_grp_cnt int;
    declare v_sum_grp_str varchar(255);
    declare v_busi_flag int;
    declare v_valid_flag int;
    declare v_remark_info varchar(255);
    declare v_src_data_type int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_asset_acco = p_asset_acco;
    SET v_stock_acco = p_stock_acco;
    SET v_exch_no = p_exch_no;
    SET v_invest_type = p_invest_type;
    SET v_stock_type = p_stock_type;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_crncy_type = p_crncy_type;
    SET v_strike_aver_price = p_strike_aver_price;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bank_ib_member = p_bank_ib_member;
    SET v_last_price = p_last_price;
    SET v_quot_strike_qty = p_quot_strike_qty;
    SET v_quot_strike_amt = p_quot_strike_amt;
    SET v_sum_grp_cnt = p_sum_grp_cnt;
    SET v_sum_grp_str = p_sum_grp_str;
    SET v_busi_flag = p_busi_flag;
    SET v_valid_flag = p_valid_flag;
    SET v_remark_info = p_remark_info;
    SET v_src_data_type = p_src_data_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @成交金额# = @成交数量# * @成交均价#; */
    set v_strike_amt = v_strike_qty * v_strike_aver_price;

    /* [插入表记录][历史_报表_报表数据_报表汇总产品证券成交][字段][字段变量][10002]["报表_报表数据_报表汇总产品证券成交"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts_his.tb_rpt_sum_pd_stock_strike_his(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, stock_code_no, asset_acco, stock_acco, 
        exch_no, invest_type, stock_type, stock_code, 
        stock_name, crncy_type, strike_aver_price, order_dir, 
        order_price, order_qty, strike_qty, strike_amt, 
        all_fee, stamp_tax, trans_fee, brkage_fee, 
        SEC_charges, other_fee, trade_commis, other_commis, 
        bond_accr_intrst, net_price_flag, bank_ib_member, last_price, 
        quot_strike_qty, quot_strike_amt, sum_grp_cnt, sum_grp_str, 
        busi_flag, valid_flag, remark_info, src_data_type) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_stock_code_no, v_asset_acco, v_stock_acco, 
        v_exch_no, v_invest_type, v_stock_type, v_stock_code, 
        v_stock_name, v_crncy_type, v_strike_aver_price, v_order_dir, 
        v_order_price, v_order_qty, v_strike_qty, v_strike_amt, 
        v_all_fee, v_stamp_tax, v_trans_fee, v_brkage_fee, 
        v_SEC_charges, v_other_fee, v_trade_commis, v_other_commis, 
        v_bond_accr_intrst, v_net_price_flag, v_bank_ib_member, v_last_price, 
        v_quot_strike_qty, v_quot_strike_amt, v_sum_grp_cnt, v_sum_grp_str, 
        v_busi_flag, v_valid_flag, v_remark_info, v_src_data_type);
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.436.10002";
        SET v_error_info =  CONCAT("报表_报表数据_报表汇总产品证券成交","#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_删除汇总产品证券成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Del_Sum_Pd_Stock_Strike;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Del_Sum_Pd_Stock_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_busi_flag int,
    IN p_valid_flag int,
    IN p_src_data_type int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_busi_flag int;
    declare v_valid_flag int;
    declare v_src_data_type int;
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
    SET v_row_id = p_row_id;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_busi_flag = p_busi_flag;
    SET v_valid_flag = p_valid_flag;
    SET v_src_data_type = p_src_data_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][历史_报表_报表数据_报表汇总产品证券成交][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {初始化日期}=@初始化日期# and {记录序号}=@记录序号# ][3][@记录序号#] */
    delete from db_rpts_his.tb_rpt_sum_pd_stock_strike_his 
        where co_no=v_co_no and pd_no=v_pd_no  and init_date=v_init_date and row_id=v_row_id ;
    if v_error_code = 1 then
                
        SET v_error_code = "rptA.2.437.3";
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
use db_rpts;;

# 原子_报表_报表数据_修改汇总产品证券成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Modi_Sum_Pd_Stock_Strike;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Modi_Sum_Pd_Stock_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_stock_code_no int,
    IN p_asset_acco varchar(16),
    IN p_stock_acco varchar(16),
    IN p_exch_no int,
    IN p_invest_type int,
    IN p_stock_type int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_crncy_type varchar(3),
    IN p_strike_aver_price decimal(16,9),
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_net_price_flag int,
    IN p_bank_ib_member varchar(255),
    IN p_last_price decimal(16,9),
    IN p_quot_strike_qty decimal(18,2),
    IN p_quot_strike_amt decimal(18,4),
    IN p_sum_grp_cnt int,
    IN p_sum_grp_str varchar(255),
    IN p_busi_flag int,
    IN p_valid_flag int,
    IN p_remark_info varchar(255),
    IN p_src_data_type int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_stock_code_no int;
    declare v_asset_acco varchar(16);
    declare v_stock_acco varchar(16);
    declare v_exch_no int;
    declare v_invest_type int;
    declare v_stock_type int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_crncy_type varchar(3);
    declare v_strike_aver_price decimal(16,9);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_net_price_flag int;
    declare v_bank_ib_member varchar(255);
    declare v_last_price decimal(16,9);
    declare v_quot_strike_qty decimal(18,2);
    declare v_quot_strike_amt decimal(18,4);
    declare v_sum_grp_cnt int;
    declare v_sum_grp_str varchar(255);
    declare v_busi_flag int;
    declare v_valid_flag int;
    declare v_remark_info varchar(255);
    declare v_src_data_type int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_asset_acco = p_asset_acco;
    SET v_stock_acco = p_stock_acco;
    SET v_exch_no = p_exch_no;
    SET v_invest_type = p_invest_type;
    SET v_stock_type = p_stock_type;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_crncy_type = p_crncy_type;
    SET v_strike_aver_price = p_strike_aver_price;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bank_ib_member = p_bank_ib_member;
    SET v_last_price = p_last_price;
    SET v_quot_strike_qty = p_quot_strike_qty;
    SET v_quot_strike_amt = p_quot_strike_amt;
    SET v_sum_grp_cnt = p_sum_grp_cnt;
    SET v_sum_grp_str = p_sum_grp_str;
    SET v_busi_flag = p_busi_flag;
    SET v_valid_flag = p_valid_flag;
    SET v_remark_info = p_remark_info;
    SET v_src_data_type = p_src_data_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @成交金额# = @成交数量# * @成交均价#; */
    set v_strike_amt = v_strike_qty * v_strike_aver_price;

    /* [更新表记录][历史_报表_报表数据_报表汇总产品证券成交][{初始化日期}=@初始化日期#,{机构编号}=@机构编号#,{产品编号}=@产品编号#,{证券代码编号}=@证券代码编号#,{资产账户}=@资产账户#,{股东代码}=@股东代码#,{市场编号}=@市场编号#,{投资类型}=@投资类型#,{证券类型}=@证券类型#,{证券代码}=@证券代码#,{证券名称}=@证券名称#,{本币币种}=@本币币种#,{成交均价}=@成交均价#,{订单方向}=@订单方向#,{订单价格}=@订单价格#,{订单数量}=@订单数量#,{成交数量}=@成交数量#,{成交金额}=@成交金额#,{全部费用}=@全部费用#,{印花税}=@印花税#,{过户费}=@过户费#,{经手费}=@经手费#,{证管费}=@证管费#,{其他费用}=@其他费用#,{交易佣金}=@交易佣金#,{其他佣金}=@其他佣金#,{债券计提利息}=@债券计提利息#,{净价标志}=@净价标志#,{交易对手}=@交易对手#,{最新价}=@最新价#,{行情成交数量}=@行情成交数量#,{行情成交金额}=@行情成交金额#,{汇总分组行数}=@汇总分组行数#,{汇总分组内容}=@汇总分组内容#,{业务标志}=@业务标志#,{有效标志}=@有效标志#,{备注信息}=@备注信息#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {初始化日期}=@初始化日期# and {记录序号}=@记录序号#][14020301][@机构编号#,@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rpts_his.tb_rpt_sum_pd_stock_strike_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_init_date,co_no=v_co_no,pd_no=v_pd_no,stock_code_no=v_stock_code_no,asset_acco=v_asset_acco,stock_acco=v_stock_acco,exch_no=v_exch_no,invest_type=v_invest_type,stock_type=v_stock_type,stock_code=v_stock_code,stock_name=v_stock_name,crncy_type=v_crncy_type,strike_aver_price=v_strike_aver_price,order_dir=v_order_dir,order_price=v_order_price,order_qty=v_order_qty,strike_qty=v_strike_qty,strike_amt=v_strike_amt,all_fee=v_all_fee,stamp_tax=v_stamp_tax,trans_fee=v_trans_fee,brkage_fee=v_brkage_fee,SEC_charges=v_SEC_charges,other_fee=v_other_fee,trade_commis=v_trade_commis,other_commis=v_other_commis,bond_accr_intrst=v_bond_accr_intrst,net_price_flag=v_net_price_flag,bank_ib_member=v_bank_ib_member,last_price=v_last_price,quot_strike_qty=v_quot_strike_qty,quot_strike_amt=v_quot_strike_amt,sum_grp_cnt=v_sum_grp_cnt,sum_grp_str=v_sum_grp_str,busi_flag=v_busi_flag,valid_flag=v_valid_flag,remark_info=v_remark_info where co_no=v_co_no and pd_no=v_pd_no  and init_date=v_init_date and row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.438.14020301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_新增结算提前待入账记录表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Add_Pd_clsest_before_preentry;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Add_Pd_clsest_before_preentry(
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
    IN p_pd_name varchar(64),
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_exch_rate decimal(18,12),
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_pre_entry_qty decimal(18,2),
    IN p_pre_entry_amt decimal(18,4),
    IN p_impawn_ratio decimal(18,12),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_busi_flag int,
    IN p_act_record_flag int,
    IN p_acco_entry_flag int,
    IN p_entry_money_jour_no bigint,
    IN p_entry_status varchar(2),
    IN p_reg_date int,
    IN p_arrive_date int,
    IN p_begin_trade_date int,
    IN p_remark_info varchar(255),
    IN p_src_data_type int,
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
    declare v_pd_name varchar(64);
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_busi_flag int;
    declare v_act_record_flag int;
    declare v_acco_entry_flag int;
    declare v_entry_money_jour_no bigint;
    declare v_entry_status varchar(2);
    declare v_reg_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_remark_info varchar(255);
    declare v_src_data_type int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_name = p_pd_name;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_pre_entry_qty = p_pre_entry_qty;
    SET v_pre_entry_amt = p_pre_entry_amt;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_busi_flag = p_busi_flag;
    SET v_act_record_flag = p_act_record_flag;
    SET v_acco_entry_flag = p_acco_entry_flag;
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_status = p_entry_status;
    SET v_reg_date = p_reg_date;
    SET v_arrive_date = p_arrive_date;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_remark_info = p_remark_info;
    SET v_src_data_type = p_src_data_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @入账状态# = 1; */
    set v_entry_status = 1;

    /* [插入表记录][报表_报表数据_报表结算提前待入账记录表][字段][字段变量][10002]["报表_报表数据_报表结算提前待入账记录表"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rpts.tb_rpt_clsest_before_preentry(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, pd_name, exch_group_no, exch_no, 
        stock_acco_no, stock_code_no, stock_code, stock_name, 
        asset_acco_no, crncy_type, exch_crncy_type, exch_rate, 
        trade_code_no, target_code_no, stock_type, asset_type, 
        pre_entry_qty, pre_entry_amt, impawn_ratio, bond_accr_intrst, 
        busi_flag, act_record_flag, acco_entry_flag, entry_money_jour_no, 
        entry_status, reg_date, arrive_date, begin_trade_date, 
        remark_info, src_data_type) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_pd_name, v_exch_group_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_code, v_stock_name, 
        v_asset_acco_no, v_crncy_type, v_exch_crncy_type, v_exch_rate, 
        v_trade_code_no, v_target_code_no, v_stock_type, v_asset_type, 
        v_pre_entry_qty, v_pre_entry_amt, v_impawn_ratio, v_bond_accr_intrst, 
        v_busi_flag, v_act_record_flag, v_acco_entry_flag, v_entry_money_jour_no, 
        v_entry_status, v_reg_date, v_arrive_date, v_begin_trade_date, 
        v_remark_info, v_src_data_type);
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.441.10002";
        SET v_error_info =  CONCAT("报表_报表数据_报表结算提前待入账记录表","#",v_mysql_message);
        leave label_pro;
    end if;


    /* update ~报表_报表数据_报表结算提前待入账记录表^ t */
    update db_rpts.tb_rpt_clsest_before_preentry t

     /* join db_dc.tb_basesedt_stock_code_info x on (t.{证券代码编号}) = (x.{证券代码编号}) */
     join db_dc.tb_basesedt_stock_code_info x on (t.stock_code_no) = (x.stock_code_no)

    /* set t.{证券类型} = x.{证券类型},  t.{资产类型} = x.{资产类型}, t.{证券代码} = x.{证券代码}, t.{证券名称} = x.{证券名称}, t.{市场编号} = x.{市场编号} */
    set t.stock_type = x.stock_type,  t.asset_type = x.asset_type, t.stock_code = x.stock_code, t.stock_name = x.stock_name, t.exch_no = x.exch_no

    /* where t.{机构编号}=@机构编号# and t.{产品编号}=@产品编号#  and t.{初始化日期}=@初始化日期# */
    where t.co_no=v_co_no and t.pd_no=v_pd_no  and t.init_date=v_init_date
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表数据_删除结算提前待入账记录表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Del_Pd_clsest_before_preentry;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Del_Pd_clsest_before_preentry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_busi_flag int,
    IN p_act_record_flag int,
    IN p_src_data_type int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_busi_flag int;
    declare v_act_record_flag int;
    declare v_src_data_type int;
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
    SET v_row_id = p_row_id;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_busi_flag = p_busi_flag;
    SET v_act_record_flag = p_act_record_flag;
    SET v_src_data_type = p_src_data_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][报表_报表数据_报表结算提前待入账记录表][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {初始化日期}=@初始化日期# and {记录序号}=@记录序号# ][3][@记录序号#] */
    delete from db_rpts.tb_rpt_clsest_before_preentry 
        where co_no=v_co_no and pd_no=v_pd_no  and init_date=v_init_date and row_id=v_row_id ;
    if v_error_code = 1 then
                
        SET v_error_code = "rptA.2.442.3";
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
use db_rpts;;

# 原子_报表_报表数据_修改结算提前待入账记录表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptdata_Modi_Pd_clsest_before_preentry;;
DELIMITER ;;
CREATE PROCEDURE pra_rptdata_Modi_Pd_clsest_before_preentry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_name varchar(64),
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_exch_rate decimal(18,12),
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_pre_entry_qty decimal(18,2),
    IN p_pre_entry_amt decimal(18,4),
    IN p_impawn_ratio decimal(18,12),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_busi_flag int,
    IN p_act_record_flag int,
    IN p_acco_entry_flag int,
    IN p_entry_money_jour_no bigint,
    IN p_entry_status varchar(2),
    IN p_reg_date int,
    IN p_arrive_date int,
    IN p_begin_trade_date int,
    IN p_remark_info varchar(255),
    IN p_src_data_type int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_name varchar(64);
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_busi_flag int;
    declare v_act_record_flag int;
    declare v_acco_entry_flag int;
    declare v_entry_money_jour_no bigint;
    declare v_entry_status varchar(2);
    declare v_reg_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_remark_info varchar(255);
    declare v_src_data_type int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_name = p_pd_name;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_pre_entry_qty = p_pre_entry_qty;
    SET v_pre_entry_amt = p_pre_entry_amt;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_busi_flag = p_busi_flag;
    SET v_act_record_flag = p_act_record_flag;
    SET v_acco_entry_flag = p_acco_entry_flag;
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_status = p_entry_status;
    SET v_reg_date = p_reg_date;
    SET v_arrive_date = p_arrive_date;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_remark_info = p_remark_info;
    SET v_src_data_type = p_src_data_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @入账状态# = 1; */
    set v_entry_status = 1;

    /* [更新表记录][报表_报表数据_报表结算提前待入账记录表][{初始化日期}=@初始化日期#,{机构编号}=@机构编号#,{产品编号}=@产品编号#,{产品名称}=@产品名称#,{交易组编号}=@交易组编号#,{市场编号}=@市场编号#,{股东代码编号}=@股东代码编号#,{证券代码编号}=@证券代码编号#,{证券代码}=@证券代码#,{证券名称}=@证券名称#,{资产账户编号}=@资产账户编号#,{本币币种}=@本币币种#,{交易币种}=@交易币种#,{汇率}=@汇率#,{交易代码编号}=@交易代码编号#,{标的代码编号}=@标的代码编号#,{证券类型}=@证券类型#,{资产类型}=@资产类型#,{待入账数量}=@待入账数量#,{待入账金额}=@待入账金额#,{质押比例}=@质押比例#,{债券计提利息}=@债券计提利息#,{业务标志}=@业务标志#,{账户登记标志}=@账户登记标志#,{账户入账标志}=@账户入账标志#,{入账资金流水号}=@入账资金流水号#,{入账状态}=@入账状态#,{登记日期}=@登记日期#,{到账日期}=@到账日期#,{上市日期}=@上市日期#,{备注信息}=@备注信息#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {初始化日期}=@初始化日期# and {记录序号}=@记录序号#][14020301][@机构编号#,@产品编号#,@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rpts.tb_rpt_clsest_before_preentry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_init_date,co_no=v_co_no,pd_no=v_pd_no,pd_name=v_pd_name,exch_group_no=v_exch_group_no,exch_no=v_exch_no,stock_acco_no=v_stock_acco_no,stock_code_no=v_stock_code_no,stock_code=v_stock_code,stock_name=v_stock_name,asset_acco_no=v_asset_acco_no,crncy_type=v_crncy_type,exch_crncy_type=v_exch_crncy_type,exch_rate=v_exch_rate,trade_code_no=v_trade_code_no,target_code_no=v_target_code_no,stock_type=v_stock_type,asset_type=v_asset_type,pre_entry_qty=v_pre_entry_qty,pre_entry_amt=v_pre_entry_amt,impawn_ratio=v_impawn_ratio,bond_accr_intrst=v_bond_accr_intrst,busi_flag=v_busi_flag,act_record_flag=v_act_record_flag,acco_entry_flag=v_acco_entry_flag,entry_money_jour_no=v_entry_money_jour_no,entry_status=v_entry_status,reg_date=v_reg_date,arrive_date=v_arrive_date,begin_trade_date=v_begin_trade_date,remark_info=v_remark_info where co_no=v_co_no and pd_no=v_pd_no  and init_date=v_init_date and row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "rptA.2.443.14020301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* update ~报表_报表数据_报表结算提前待入账记录表^ t */
    update db_rpts.tb_rpt_clsest_before_preentry t

     /* join db_dc.tb_basesedt_stock_code_info x on (t.{证券代码编号}) = (x.{证券代码编号}) */
     join db_dc.tb_basesedt_stock_code_info x on (t.stock_code_no) = (x.stock_code_no)

    /* set t.{证券类型} = x.{证券类型},  t.{资产类型} = x.{资产类型}, t.{证券代码} = x.{证券代码}, t.{证券名称} = x.{证券名称}, t.{市场编号} = x.{市场编号} */
    set t.stock_type = x.stock_type,  t.asset_type = x.asset_type, t.stock_code = x.stock_code, t.stock_name = x.stock_name, t.exch_no = x.exch_no

    /* where t.{机构编号}=@机构编号# and t.{产品编号}=@产品编号#  and t.{初始化日期}=@初始化日期# and t.{记录序号}=@记录序号# */
    where t.co_no=v_co_no and t.pd_no=v_pd_no  and t.init_date=v_init_date and t.row_id=v_row_id
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


