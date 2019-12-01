DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询报表单产品收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QuerySingleProductEarningRate;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QuerySingleProductEarningRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][报表_报表数据_报表单产品收益率历史表][字段][({机构编号}=@机构编号#)  and (@产品编码#=" " or {产品编码}=@产品编码#) and (@开始日期#=0 OR {初始化日期} >= @开始日期#) and (@结束日期#=0 or {初始化日期} <= @结束日期#) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pd_no, co_no, pd_code, pd_name, 
        found_date, runtime, unit_nav, daily_pandl_ratio, 
        daily_pandl_ratio_year, total_unit_nav, total_realiz_pandl_ratio, total_realize_pandl_ratio_year, 
        excess_earning_year, day_retracement, day_continue_retracement from db_rpts.tb_rpt_qry_singleproduct_profit_his where (co_no=v_co_no)  and (v_pd_code=" " or pd_code=v_pd_code) and (v_begin_date=0 OR init_date >= v_begin_date) and (v_end_date=0 or init_date <= v_end_date) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pd_no, co_no, pd_code, pd_name, 
        found_date, runtime, unit_nav, daily_pandl_ratio, 
        daily_pandl_ratio_year, total_unit_nav, total_realiz_pandl_ratio, total_realize_pandl_ratio_year, 
        excess_earning_year, day_retracement, day_continue_retracement from db_rpts.tb_rpt_qry_singleproduct_profit_his where (co_no=v_co_no)  and (v_pd_code=" " or pd_code=v_pd_code) and (v_begin_date=0 OR init_date >= v_begin_date) and (v_end_date=0 or init_date <= v_end_date) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询报表收益率分析
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryEarningRateAnalysis;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryEarningRateAnalysis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][报表_报表数据_报表收益率分析历史表][字段][({机构编号}=@机构编号#)  and (@产品编码#=" " or {产品编码}=@产品编码#) and (@开始日期#=0 OR {初始化日期} >= @开始日期#) and (@结束日期#=0 or {初始化日期} <= @结束日期#) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pd_no, co_no, pd_code, pd_name, 
        unit_nav, daily_pandl_ratio, total_realize_pandl_ratio_year, sharpe_ration, 
        max_retracement, market_value_sh, market_value_avg_sh, sh_remainday_two, 
        sh_remainday_three, sh_remainday_five, market_value_sz, market_value_avg_sz, 
        sz_remainday_two, sz_remainday_three, sz_remainday_five from db_rpts.tb_rpt_qry_profitanalysis_his where (co_no=v_co_no)  and (v_pd_code=" " or pd_code=v_pd_code) and (v_begin_date=0 OR init_date >= v_begin_date) and (v_end_date=0 or init_date <= v_end_date) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pd_no, co_no, pd_code, pd_name, 
        unit_nav, daily_pandl_ratio, total_realize_pandl_ratio_year, sharpe_ration, 
        max_retracement, market_value_sh, market_value_avg_sh, sh_remainday_two, 
        sh_remainday_three, sh_remainday_five, market_value_sz, market_value_avg_sz, 
        sz_remainday_two, sz_remainday_three, sz_remainday_five from db_rpts.tb_rpt_qry_profitanalysis_his where (co_no=v_co_no)  and (v_pd_code=" " or pd_code=v_pd_code) and (v_begin_date=0 OR init_date >= v_begin_date) and (v_end_date=0 or init_date <= v_end_date) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询报表产品资产变化
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryProductAssetChange;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryProductAssetChange(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_crncy_type_str varchar(2048),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_unit_nav decimal(18,4);

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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_unit_nav = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][报表_报表数据_视图产品全资产][{单位净值}][@临时_单位净值#][{初始化日期}>=@开始日期# and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编码#=" " or {产品编码}=@产品编码#) order by {初始化日期}][3]['获取初始单位净值失败'] */
    select unit_nav into v_tmp_unit_nav from db_rpts.v_dt_pd_asset_all where init_date>=v_begin_date and (v_co_no=0 or co_no=v_co_no) and (v_pd_code=" " or pd_code=v_pd_code) order by init_date limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "rptA.3.3.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT('获取初始单位净值失败',"#",v_mysql_message);
        else
            SET v_error_info = '获取初始单位净值失败';
        end if;
        leave label_pro;
    end if;


    /* [获取表记录][报表_报表数据_视图产品全资产][{机构编号},{产品编码},{初始化日期},{本币币种},({单位净值} - @临时_单位净值#)/@临时_单位净值# as {单位净值},{净资产}][({初始化日期}  between @开始日期# and @结束日期#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编码#=" " or {产品编码}=@产品编码#) and (@本币币种串#=" " or instr(@本币币种串#, concat(";",{本币币种},";"))>0)][@指定行数#] */
    if v_row_count = -1 then
        select co_no,pd_code,init_date,crncy_type,(unit_nav - v_tmp_unit_nav)/v_tmp_unit_nav as unit_nav,nav_asset from db_rpts.v_dt_pd_asset_all where (init_date  between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_code=" " or pd_code=v_pd_code) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0);
    else
        select co_no,pd_code,init_date,crncy_type,(unit_nav - v_tmp_unit_nav)/v_tmp_unit_nav as unit_nav,nav_asset from db_rpts.v_dt_pd_asset_all where (init_date  between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_code=" " or pd_code=v_pd_code) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询报表产品净值回报率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryProductNAVReturnRate;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryProductNAVReturnRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_crncy_type_str varchar(2048),
    IN p_std_stock_market int,
    IN p_std_stock_code varchar(6),
    IN p_qry_no int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
    declare v_crncy_type_str varchar(2048);
    declare v_std_stock_market int;
    declare v_std_stock_code varchar(6);
    declare v_qry_no int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_std_stock_market = p_std_stock_market;
    SET v_std_stock_code = p_std_stock_code;
    SET v_qry_no = p_qry_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    SELECT
    t.co_no,
    t.pd_code,
    t.region_no,
    t.region_name,t.qry_begin_date,t.qry_end_date,m.max_unit_nav,a1.unit_nav begin_unit_nav,a2.unit_nav end_unit_nav,b1.last_price begin_price, b2.last_price end_price,
    (a2.unit_nav - a1.unit_nav) / a1.unit_nav as product_return_rate,
    (m.max_unit_nav - a1.unit_nav) / a1.unit_nav as max_product_increase,
    (a2.unit_nav - b2.last_price / b1.last_price ) / (b2.last_price / b1.last_price) as cmp_product_return_rate
    from tb_rpt_qry_region_detail t

    /* left join ~报表_报表数据_视图产品全资产^ a1 on a1.co_no = v_co and a1.pd_code = v_pd_code and a1.init_date = t.qry_begin_date */
    left join db_rpts.v_dt_pd_asset_all a1 on a1.co_no = v_co and a1.pd_code = v_pd_code and a1.init_date = t.qry_begin_date

    /* left join  ~报表_报表数据_视图产品全资产^ a2 on a2.co_no = co_no and a2.pd_code = v_pd_code and a2.init_date = t.qry_end_date */
    left join  db_rpts.v_dt_pd_asset_all a2 on a2.co_no = co_no and a2.pd_code = v_pd_code and a2.init_date = t.qry_end_date
    left join tb_basedt_stock_quot_his b1 on b1.exch_no = v_std_stock_market and b1.stock_code = v_std_stock_code and b1.init_date = t.qry_begin_date
    left join  tb_basedt_stock_quot_his b2 on b2.exch_no = v_std_stock_market  and b2.stock_code = v_std_stock_code and b2.init_date = t.qry_end_date
    LEFT JOIN (SELECT a.region_no,max(t.unit_nav) max_unit_nav from tb_rpt_qry_region_detail a

    /* left join ~报表_报表数据_视图产品全资产^ t on t.init_date BETWEEN a.qry_begin_date and a.qry_end_date and t.co_no = v_co_no and t.pd_code = v_pd_code */
    left join db_rpts.v_dt_pd_asset_all t on t.init_date BETWEEN a.qry_begin_date and a.qry_end_date and t.co_no = v_co_no and t.pd_code = v_pd_code
    group by a.region_no) m on t.region_no = m.region_no

    /* where t.qry_no = @查询序号#; */
    where t.qry_no = v_qry_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_更新查询区间的开始结束日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_AddQryBeginEndDate;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_AddQryBeginEndDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询报表产品资产明细汇总统计历史记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryProductAssetTotalHis;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryProductAssetTotalHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_asset_type_str varchar(64),
    IN p_pd_code varchar(32),
    IN p_crncy_type_str varchar(2048),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_asset_type_str varchar(64);
    declare v_pd_code varchar(32);
    declare v_crncy_type_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_asset_type_str = p_pd_asset_type_str;
    SET v_pd_code = p_pd_code;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取表记录][报表_报表数据_视图产品全持仓][{初始化日期},{机构编号},{产品编码},{产品名称},{市场编号},{证券代码},{证券名称},{本币币种},{最新价},{当前数量},{成本金额},{停牌标志},{流通标志},{最新价}*{当前数量}-{成本金额} as {当日盈亏}][{初始化日期} = @初始化日期# and (@市场编号#=" " or {市场编号}=@市场编号#) and (@本币币种串#=" " or instr(@本币币种串#, concat(";",{本币币种},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) and (@证券代码#=" " or {证券代码}=@证券代码#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select init_date,co_no,pd_code,pd_name,exch_no,stock_code,stock_name,crncy_type,last_price,curr_qty,cost_amt,stop_status,circl_flag,last_price*curr_qty-cost_amt as today_pandl from db_rpts.v_dt_pd_holder_all where init_date = v_init_date and (v_exch_no=" " or exch_no=v_exch_no) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) and (v_stock_code=" " or stock_code=v_stock_code) order by row_id;
    else
        select init_date,co_no,pd_code,pd_name,exch_no,stock_code,stock_name,crncy_type,last_price,curr_qty,cost_amt,stop_status,circl_flag,last_price*curr_qty-cost_amt as today_pandl from db_rpts.v_dt_pd_holder_all where init_date = v_init_date and (v_exch_no=" " or exch_no=v_exch_no) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) and (v_stock_code=" " or stock_code=v_stock_code) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询周净值累变报表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryProductWeekUnitNAV;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryProductWeekUnitNAV(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* SELECT
t.co_no,
t.pd_no,
t.pd_code,
t.pd_name,
t.init_date,
t.total_asset,
t.cash_asset,
t.stock_asset,
t.curr_share,
t.unit_nav,
b.unit_nav AS week_unit_nav,
(t.unit_nav-b.unit_nav) as week_nav_change,
(t.unit_nav-t.pre_pd_unit_nav) as day_nav_change,
round((t.cash_asset / t.total_asset),6) as cash_nav_ratio,
round((t.stock_asset / t.total_asset),6) as stock_asset_ratio
FROM
 ~报表_报表数据_视图产品全资产^ t
INNER JOIN tb_rpt_week_tradeday a ON t.init_date BETWEEN a.curr_week_min_tradeday
AND a.curr_week_max_tradeday
INNER JOIN ~报表_报表数据_视图产品全资产^ b ON b.init_date = a.last_week_max_tradeday 
and ( 0 = @开始日期# or t.init_date >= @开始日期#)
and ( 0 = @结束日期# or t.init_date <= @结束日期#)
and ( 0 = @机构编号# or t.co_no = @机构编号#)
and ( ' ' = @产品编码# or t.pd_code = @产品编码#); */
    SELECT
    t.co_no,
    t.pd_no,
    t.pd_code,
    t.pd_name,
    t.init_date,
    t.total_asset,
    t.cash_asset,
    t.stock_asset,
    t.curr_share,
    t.unit_nav,
    b.unit_nav AS week_unit_nav,
    (t.unit_nav-b.unit_nav) as week_nav_change,
    (t.unit_nav-t.pre_pd_unit_nav) as day_nav_change,
    round((t.cash_asset / t.total_asset),6) as cash_nav_ratio,
    round((t.stock_asset / t.total_asset),6) as stock_asset_ratio
    FROM
     db_rpts.v_dt_pd_asset_all t
    INNER JOIN tb_rpt_week_tradeday a ON t.init_date BETWEEN a.curr_week_min_tradeday
    AND a.curr_week_max_tradeday
    INNER JOIN db_rpts.v_dt_pd_asset_all b ON b.init_date = a.last_week_max_tradeday 
    and ( 0 = v_begin_date or t.init_date >= v_begin_date)
    and ( 0 = v_end_date or t.init_date <= v_end_date)
    and ( 0 = v_co_no or t.co_no = v_co_no)
    and ( ' ' = v_pd_code or t.pd_code = v_pd_code);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品详情信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryProductDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryProductDetail(
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_input_date int;

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_input_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* SELECT IFNULL(max(t.init_date),0) into  @临时_传入日期#  from ~报表_报表数据_视图产品全资产^ t; */
    SELECT IFNULL(max(t.init_date),0) into  v_tmp_input_date  from db_rpts.v_dt_pd_asset_all t;

    /* set @传入日期#=@临时_传入日期#; */
    set v_input_date=v_tmp_input_date;
    SELECT
    t.init_date,
    t.pd_no,
    t.co_no,
    t.pd_code,
    t.pd_name,
    t.unit_nav,
    IFNULL(t.product_unit_nav_ration -1,0) AS daily_pandl_ratio,
    IFNULL((t.product_unit_nav_ration - 1)*250,0) AS daily_pandl_ratio_year,
    IFNULL(t.unit_nav - t.pre_pd_unit_nav,0) as nav_fluct,
    IFNULL(k.max_retracement,0) as max_retracement,
    IFNULL(t.curr_share,0) as curr_share,
    IFNULL(t.total_asset,0) as total_asset
    FROM

     /* ~报表_报表数据_视图产品全资产^ t LEFT JOIN tb_rpt_qry_profitanalysis_his k */
     db_rpts.v_dt_pd_asset_all t LEFT JOIN tb_rpt_qry_profitanalysis_his k
    on t.init_date = k.init_date
    and t.pd_no = k.pd_no

    /* where t.init_date = @传入日期# */
    where t.init_date = v_input_date

    /* and t.pd_no = @产品编号#; */
    and t.pd_no = v_pd_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_计算跟投分析
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_CalcFollowAnalysis;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_CalcFollowAnalysis(
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
    declare v_tmp_last_trade_date int;
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
    SET v_tmp_last_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #获取上一年最后一个交易日

    /* select max({交易日期}) INTO @临时_最后交易日# from ~报表_报表数据_报表交易日信息表^ where {交易日期} < DATE_FORMAT(date_sub(@传入日期#,INTERVAL DAYOFYEAR(now()) - 1 DAY),'%Y%m%d') */
    select max(trade_date) INTO v_tmp_last_trade_date from db_rpts.tb_rpt_tradeday where trade_date < DATE_FORMAT(date_sub(v_input_date,INTERVAL DAYOFYEAR(now()) - 1 DAY),'%Y%m%d')

    /* and {是否交易日} =《是否交易日-是》 and {市场编号} = 《市场编号-上海证券交易所》; */
    and is_open ="1" and exch_no = 1;

    /* insert into ~报表_报表数据_报表跟投分析历史表^({初始化日期},{产品编号},{机构编号},{产品编码},{产品名称},{当日净值表现},{累计单位净值},{市值仓位占比},{产品管理人},{净资产},{现金资产},{当年收益},{当年收益率},{跟投份额},{跟投资产净值},{跟投资产当年损益},{跟投资产总损益},{跟投资产总收益率},{预警值},{止损值},{当前份额},{最大回撤},{成立日期},{上年净值}) */
    insert into db_rpts.tb_rpt_qry_followanalysis_his(init_date,pd_no,co_no,pd_code,pd_name,net_performance,total_unit_nav,market_value_posi_ratio,pd_manager,nav_asset,cash_asset,profit_year,profit_year_ratio,follow_share,follow_nav_asset,follow_income_year,follow_income_total,follow_profit_ratio,warn_value,stop_value,curr_share,max_retracement,found_date,last_year_nav)
    SELECT

    /* @创建日期#,@创建时间#,@更新日期#,@更新时间#,a.init_date,a.pd_no,a.co_no,a.pd_code,a.pd_name, */
    v_create_date,v_create_time,v_update_date,v_update_time,a.init_date,a.pd_no,a.co_no,a.pd_code,a.pd_name,
    ROUND(IFNULL((b.unit_nav - b.pre_pd_unit_nav) / b.pre_pd_unit_nav,0),12) AS net_performance,
    b.unit_nav AS total_unit_nav,
    ROUND(c.market_value/b.total_asset,12) AS market_value_posi_ratio,
    a.pd_manager,b.nav_asset,b.cash_asset,
    a.nav_asset - IFNULL(d.nav_asset,0) AS profit_year,
    ROUND(IFNULL((a.nav_asset - d.nav_asset)/d.nav_asset,0),12) AS profit_year_ratio,
    a.follow_share,
    a.follow_share * b.unit_nav AS daren_nav_asset,
    (a.follow_share * b.unit_nav - ifnull(e.daren_income_total,0)) AS daren_income_year,
    a.follow_share * b.unit_nav - a.follow_share AS daren_income_total,
    b.unit_nav - 1 AS daren_profit_ratio,
    a.warn_value,a.stop_value,a.curr_share,f.max_retracement,a.found_date,d.unit_nav AS last_year_nav

    /* FROM tb_rpt_productinfo_his a, ~报表_报表数据_视图产品全资产^ b,tb_rpt_product_marketvalue c, */
    FROM tb_rpt_productinfo_his a, db_rpts.v_dt_pd_asset_all b,tb_rpt_product_marketvalue c,

    /* (select * from ~报表_报表数据_视图产品全资产^ t where t.init_date = @临时_最后交易日#) d, */
    (select * from db_rpts.v_dt_pd_asset_all t where t.init_date = v_tmp_last_trade_date) d,

    /* (select * from tb_rpt_qry_followanalysis_his where t.init_date = @临时_最后交易日#) e, */
    (select * from tb_rpt_qry_followanalysis_his where t.init_date = v_tmp_last_trade_date) e,
    tb_rpt_qry_profitanalysis_his f
    WHERE a.init_date = b.init_date AND a.pd_no = b.pd_no
    AND a.init_date = c.init_date AND a.pd_no = c.pd_no AND a.pd_no = d.pd_no
    AND a.init_date = b.init_date AND a.pd_no = e.pd_no AND a.pd_no = f.pd_no

    /* AND a.init_date = @传入日期# AND (a.co_no = 0 or a.co_no = @机构编号#) AND (a.pd_code = " " or a.pd_code = @产品编码#); */
    AND a.init_date = v_input_date AND (a.co_no = 0 or a.co_no = v_co_no) AND (a.pd_code = " " or a.pd_code = v_pd_code);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询跟投分析
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryFollowAnalysis;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryFollowAnalysis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][报表_报表数据_报表跟投分析历史表][字段][({机构编号}=@机构编号#)  and (@产品编码#=" " or {产品编码}=@产品编码#) and (@开始日期#=0 OR {初始化日期} >= @开始日期#) and (@结束日期#=0 or {初始化日期} <= @结束日期#) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pd_no, co_no, pd_code, pd_name, 
        net_performance, total_unit_nav, market_value_posi_ratio, pd_manager, 
        nav_asset, cash_asset, profit_year, profit_year_ratio, 
        follow_share, follow_nav_asset, follow_income_year, follow_income_total, 
        follow_profit_ratio, warn_value, stop_value, curr_share, 
        max_retracement, found_date, last_year_nav from db_rpts.tb_rpt_qry_followanalysis_his where (co_no=v_co_no)  and (v_pd_code=" " or pd_code=v_pd_code) and (v_begin_date=0 OR init_date >= v_begin_date) and (v_end_date=0 or init_date <= v_end_date) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pd_no, co_no, pd_code, pd_name, 
        net_performance, total_unit_nav, market_value_posi_ratio, pd_manager, 
        nav_asset, cash_asset, profit_year, profit_year_ratio, 
        follow_share, follow_nav_asset, follow_income_year, follow_income_total, 
        follow_profit_ratio, warn_value, stop_value, curr_share, 
        max_retracement, found_date, last_year_nav from db_rpts.tb_rpt_qry_followanalysis_his where (co_no=v_co_no)  and (v_pd_code=" " or pd_code=v_pd_code) and (v_begin_date=0 OR init_date >= v_begin_date) and (v_end_date=0 or init_date <= v_end_date) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询盈亏分析
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryCauseAnalysis;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryCauseAnalysis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_crncy_type varchar(3),
    IN p_achi_compa_crite int,
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
    declare v_pd_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_crncy_type varchar(3);
    declare v_achi_compa_crite int;
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
    SET v_pd_no = p_pd_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_crncy_type = p_crncy_type;
    SET v_achi_compa_crite = p_achi_compa_crite;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @指定行数# = IF(@指定行数# = -1,99999999,@指定行数# ); */
    set v_row_count = IF(v_row_count = -1,99999999,v_row_count );
    # 表t：查询开始日期产品资产；表t1：查询结束日期产品资产；表x：查询时间开始日期与结束日期

    /* SELECT t.*,(t.product_return_rate - t.standard_return) as cmp_product_return_rate from 
(SELECT t.row_id,
 x.begin_date,
 x.end_date,
 f_get_index_return (@业绩比较基准#, x.begin_date, x.end_date) AS standard_return,
 t.pd_no,
 t.co_no,
 t.pd_code,
 t.pd_name,
 t.nav_asset,
 t.cash_asset,
 t.curr_share,
 t.unit_nav,
 t.total_unit_nav - 1 AS total_realiz_pandl_ratio,
 (
  t.stock_asset + t.fund_asset + t.futu_asset + t.option_asset + t.warrant_asset + t.repo_asset + t.bond_asset
 ) AS posi_market_value,
 ROUND(
  IFNULL(
   (
    t.unit_nav - t1.unit_nav
   ) / t1.unit_nav,
   0
  ),
  12
 ) AS product_return_rate,
 ROUND(t.nav_asset - t1.nav_asset, 12) AS interval_pandl
FROM
 ~报表_报表数据_视图产品全资产^ t
 join ~报表_报表数据_视图产品全资产^ t1 on (t.co_no, t.pd_no) = (t1.co_no, t1.pd_no)
JOIN (
 SELECT
  t.co_no,
  t.pd_no,
  min(t.init_date) AS begin_date,
  max(t.init_date) AS end_date
 FROM
   ~报表_报表数据_视图产品全资产^ t
 WHERE
  t.init_date BETWEEN @开始日期# AND @结束日期# 
 GROUP BY
  t.co_no,
  t.pd_no
) x ON (t.co_no, t.pd_no, t.init_date) = (x.co_no, x.pd_no,x.end_date) and (t1.co_no, t1.pd_no, t1.init_date) = (x.co_no, x.pd_no,x.begin_date) 
WHERE t.co_no =  @操作员机构编号#
AND (
 @产品编号# = 0
 OR t.pd_no = @产品编号#
))t limit @指定行数#; */
    SELECT t.*,(t.product_return_rate - t.standard_return) as cmp_product_return_rate from 
    (SELECT t.row_id,
     x.begin_date,
     x.end_date,
     f_get_index_return (v_achi_compa_crite, x.begin_date, x.end_date) AS standard_return,
     t.pd_no,
     t.co_no,
     t.pd_code,
     t.pd_name,
     t.nav_asset,
     t.cash_asset,
     t.curr_share,
     t.unit_nav,
     t.total_unit_nav - 1 AS total_realiz_pandl_ratio,
     (
      t.stock_asset + t.fund_asset + t.futu_asset + t.option_asset + t.warrant_asset + t.repo_asset + t.bond_asset
     ) AS posi_market_value,
     ROUND(
      IFNULL(
       (
        t.unit_nav - t1.unit_nav
       ) / t1.unit_nav,
       0
      ),
      12
     ) AS product_return_rate,
     ROUND(t.nav_asset - t1.nav_asset, 12) AS interval_pandl
    FROM
     db_rpts.v_dt_pd_asset_all t
     join db_rpts.v_dt_pd_asset_all t1 on (t.co_no, t.pd_no) = (t1.co_no, t1.pd_no)
    JOIN (
     SELECT
      t.co_no,
      t.pd_no,
      min(t.init_date) AS begin_date,
      max(t.init_date) AS end_date
     FROM
       db_rpts.v_dt_pd_asset_all t
     WHERE
      t.init_date BETWEEN v_begin_date AND v_end_date 
     GROUP BY
      t.co_no,
      t.pd_no
    ) x ON (t.co_no, t.pd_no, t.init_date) = (x.co_no, x.pd_no,x.end_date) and (t1.co_no, t1.pd_no, t1.init_date) = (x.co_no, x.pd_no,x.begin_date) 
    WHERE t.co_no =  v_opor_co_no
    AND (
     v_pd_no = 0
     OR t.pd_no = v_pd_no
    ))t limit v_row_count;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询回报统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryReturnAnalysis;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryReturnAnalysis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_crncy_type varchar(3),
    IN p_achi_compa_crite int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_crncy_type varchar(3);
    declare v_achi_compa_crite int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_begin_unit_nav decimal(18,4);
    declare v_last_price decimal(16,9);

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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_crncy_type = p_crncy_type;
    SET v_achi_compa_crite = p_achi_compa_crite;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_begin_unit_nav = 0;
    SET v_last_price = 0;

    
    label_pro:BEGIN
    

    /* set @期初单位净值# = 0; */
    set v_pd_begin_unit_nav = 0;

    /* IF @产品编号# = 0 THEN */
    IF v_pd_no = 0 THEN

          /* [获取表记录变量][报表_报表数据_报表产品信息表][{产品编号}][@产品编号#][{机构编号} = @操作员机构编号# order by {产品编号}][1]["获取产品信息失败"] */
          select pd_no into v_pd_no from db_rpts.tb_rpt_productinfo where co_no = v_opor_co_no order by pd_no limit 1;
          if FOUND_ROWS() = 0 then
                      
              SET v_error_code = "rptA.3.12.1";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT("获取产品信息失败","#",v_mysql_message);
              else
                  SET v_error_info = "获取产品信息失败";
              end if;
              leave label_pro;
          end if;

    END IF ;

    /* [获取表记录变量语句][报表_报表数据_视图产品全资产][min({初始化日期}),max({初始化日期})][@开始日期#,@结束日期#][{初始化日期} between @开始日期# and @结束日期# and {产品编号} = @产品编号#] */
    select min(init_date),max(init_date) into v_begin_date,v_end_date from db_rpts.v_dt_pd_asset_all where init_date between v_begin_date and v_end_date and pd_no = v_pd_no limit 1;

    # part 1: 根据传入日期，获取 [产品] 初始单位净值，真实开始日期

    /* SELECT init_date,t.unit_nav into @开始日期#,@期初单位净值# from ~报表_报表数据_视图产品全资产^ t where t.init_date >= @开始日期# and pd_no =  @产品编号# ORDER BY t.init_date limit 1;
 */
    SELECT init_date,t.unit_nav into v_begin_date,v_pd_begin_unit_nav from db_rpts.v_dt_pd_asset_all t where t.init_date >= v_begin_date and pd_no =  v_pd_no ORDER BY t.init_date limit 1;
    
    # part 2: 根据传入日期，获取 [业绩基准] 初始指数值

    /* SELECT q.last_price into @最新价# from v_dt_index_quot_all q where q.init_date = @开始日期# and q.stock_code =@业绩比较基准# limit 1; */
    SELECT q.last_price into v_last_price from v_dt_index_quot_all q where q.init_date = v_begin_date and q.stock_code =v_achi_compa_crite limit 1;
    # part 3: 查询数据

    /* SELECT
 t.init_date,
 t.pd_no,
 ' ' as pd_name,
 t.total_asset,
 ROUND(
  IFNULL(
   (t.unit_nav - @期初单位净值#) / @期初单位净值#,
   0
  ),
  12
 ) AS product_return_rate,
 ROUND(
  IFNULL(
   (q.last_price - @最新价#) / @最新价#,
   0
  ),
  12
 ) AS standard_return,
 ROUND(((t.unit_nav - @期初单位净值#) / @期初单位净值# - (q.last_price - @最新价#) / @最新价#),12)  as relative_return_rate
FROM
 ~报表_报表数据_视图产品全资产^ t
JOIN v_dt_index_quot_all q ON t.init_date = q.init_date and q.stock_code = @业绩比较基准#
where t.init_date between @开始日期# and @结束日期# and {产品编号} = @产品编号# order by init_date; */
    SELECT
     t.init_date,
     t.pd_no,
     ' ' as pd_name,
     t.total_asset,
     ROUND(
      IFNULL(
       (t.unit_nav - v_pd_begin_unit_nav) / v_pd_begin_unit_nav,
       0
      ),
      12
     ) AS product_return_rate,
     ROUND(
      IFNULL(
       (q.last_price - v_last_price) / v_last_price,
       0
      ),
      12
     ) AS standard_return,
     ROUND(((t.unit_nav - v_pd_begin_unit_nav) / v_pd_begin_unit_nav - (q.last_price - v_last_price) / v_last_price),12)  as relative_return_rate
    FROM
     db_rpts.v_dt_pd_asset_all t
    JOIN v_dt_index_quot_all q ON t.init_date = q.init_date and q.stock_code = v_achi_compa_crite
    where t.init_date between v_begin_date and v_end_date and pd_no = v_pd_no order by init_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询归因分析
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryAttributeAnalysis;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryAttributeAnalysis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_crncy_type varchar(3),
    IN p_cause_type int,
    IN p_achi_compa_crite int,
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
    declare v_pd_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_crncy_type varchar(3);
    declare v_cause_type int;
    declare v_achi_compa_crite int;
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
    SET v_pd_no = p_pd_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_crncy_type = p_crncy_type;
    SET v_cause_type = p_cause_type;
    SET v_achi_compa_crite = p_achi_compa_crite;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][报表_报表数据_视图产品全资产][min({初始化日期}),max({初始化日期})][@开始日期#,@结束日期#][{初始化日期} between @开始日期# and @结束日期#] */
    select min(init_date),max(init_date) into v_begin_date,v_end_date from db_rpts.v_dt_pd_asset_all where init_date between v_begin_date and v_end_date limit 1;


    /* IF @指定行数# = -1 THEN */
    IF v_row_count = -1 THEN
    select a.row_id,c.begin_date,c.end_date,a.pd_no,a.co_no,a.pd_code,a.pd_name,c.asset_market_value,1 as weight_ratio,c.interval_pandl,c.product_return_rate,1 as return_ratio
    from tb_rpt_productinfo a,

    /* (SELECT t.pd_no,min(t.init_date) as begin_date from ~报表_报表数据_视图产品全资产^ t where t.init_date >= @开始日期# and t.co_no = @操作员机构编号# GROUP BY t.pd_no)b, */
    (SELECT t.pd_no,min(t.init_date) as begin_date from db_rpts.v_dt_pd_asset_all t where t.init_date >= v_begin_date and t.co_no = v_opor_co_no GROUP BY t.pd_no)b,

    /* (select t.init_date as begin_date,k.init_date as end_date,t.pd_no,k.nav_asset as asset_market_value,(k.nav_asset - t.nav_asset) as interval_pandl,ROUND(IFNULL((k.unit_nav - t.unit_nav)/t.unit_nav,0),12) as product_return_rate from ~报表_报表数据_视图产品全资产^ t LEFT JOIN ~报表_报表数据_视图产品全资产^ k on k.init_date = @结束日期# and t.pd_no = k.pd_no where t.co_no = @操作员机构编号# and (@产品编号# = 0 or t.pd_no = @产品编号#) and t.init_date BETWEEN @开始日期# and @结束日期#)c */
    (select t.init_date as begin_date,k.init_date as end_date,t.pd_no,k.nav_asset as asset_market_value,(k.nav_asset - t.nav_asset) as interval_pandl,ROUND(IFNULL((k.unit_nav - t.unit_nav)/t.unit_nav,0),12) as product_return_rate from db_rpts.v_dt_pd_asset_all t LEFT JOIN db_rpts.v_dt_pd_asset_all k on k.init_date = v_end_date and t.pd_no = k.pd_no where t.co_no = v_opor_co_no and (v_pd_no = 0 or t.pd_no = v_pd_no) and t.init_date BETWEEN v_begin_date and v_end_date)c
    where a.pd_status = "1" and a.pd_no = b.pd_no and a.pd_no = c.pd_no and b.begin_date = c.begin_date;
    ELSE
    select a.row_id,c.begin_date,c.end_date,a.pd_no,a.co_no,a.pd_code,a.pd_name,c.asset_market_value,1 as weight_ratio,c.interval_pandl,c.product_return_rate,1 as return_ratio
    from tb_rpt_productinfo a,

    /* (SELECT t.pd_no,min(t.init_date) as begin_date from ~报表_报表数据_视图产品全资产^ t where t.init_date >= @开始日期# and t.co_no = @操作员机构编号# GROUP BY t.pd_no)b, */
    (SELECT t.pd_no,min(t.init_date) as begin_date from db_rpts.v_dt_pd_asset_all t where t.init_date >= v_begin_date and t.co_no = v_opor_co_no GROUP BY t.pd_no)b,

    /* (select t.init_date as begin_date,k.init_date as end_date,t.pd_no,k.nav_asset as asset_market_value,(k.nav_asset - t.nav_asset) as interval_pandl,ROUND(IFNULL((k.unit_nav - t.unit_nav)/t.unit_nav,0),12) as product_return_rate from ~报表_报表数据_视图产品全资产^ t LEFT JOIN ~报表_报表数据_视图产品全资产^ k on k.init_date = @结束日期# and t.pd_no = k.pd_no where t.co_no = @操作员机构编号# and (@产品编号# = 0 or t.pd_no = @产品编号#) and t.init_date BETWEEN @开始日期# and @结束日期#)c */
    (select t.init_date as begin_date,k.init_date as end_date,t.pd_no,k.nav_asset as asset_market_value,(k.nav_asset - t.nav_asset) as interval_pandl,ROUND(IFNULL((k.unit_nav - t.unit_nav)/t.unit_nav,0),12) as product_return_rate from db_rpts.v_dt_pd_asset_all t LEFT JOIN db_rpts.v_dt_pd_asset_all k on k.init_date = v_end_date and t.pd_no = k.pd_no where t.co_no = v_opor_co_no and (v_pd_no = 0 or t.pd_no = v_pd_no) and t.init_date BETWEEN v_begin_date and v_end_date)c

    /* where a.pd_no = b.pd_no and a.pd_no = c.pd_no and b.begin_date = c.begin_date limit @指定行数#; */
    where a.pd_no = b.pd_no and a.pd_no = c.pd_no and b.begin_date = c.begin_date limit v_row_count;
    END IF ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询资产分析
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryAssetAnalysis;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryAssetAnalysis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_crncy_type varchar(3),
    IN p_cause_type int,
    IN p_achi_compa_crite int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_crncy_type varchar(3);
    declare v_cause_type int;
    declare v_achi_compa_crite int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_crncy_type = p_crncy_type;
    SET v_cause_type = p_cause_type;
    SET v_achi_compa_crite = p_achi_compa_crite;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* IF @产品编号# = 0 THEN */
    IF v_pd_no = 0 THEN

          /* [获取表记录变量][报表_报表数据_报表产品信息表][{产品编号}][@产品编号#][{机构编号} = @操作员机构编号# order by {产品编号}][1]["获取产品信息失败"] */
          select pd_no into v_pd_no from db_rpts.tb_rpt_productinfo where co_no = v_opor_co_no order by pd_no limit 1;
          if FOUND_ROWS() = 0 then
                      
              SET v_error_code = "rptA.3.14.1";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT("获取产品信息失败","#",v_mysql_message);
              else
                  SET v_error_info = "获取产品信息失败";
              end if;
              leave label_pro;
          end if;

    END IF ;

    /* [获取表记录变量语句][报表_报表数据_视图产品全资产][min({初始化日期}),max({初始化日期})][@开始日期#,@结束日期#][{初始化日期} between @开始日期# and @结束日期# and {产品编号} = @产品编号#] */
    select min(init_date),max(init_date) into v_begin_date,v_end_date from db_rpts.v_dt_pd_asset_all where init_date between v_begin_date and v_end_date and pd_no = v_pd_no limit 1;

    select a.pd_no,a.co_no,a.pd_code,a.pd_name,b.asset_market_value,b.weight_ratio,b.asset_kind,IFNULL(c.float_pandl_sum,0) as interval_pandl from tb_rpt_productinfo a,

    /* (select t.pd_no,t.co_no,t.pd_code,t.cash_asset as asset_market_value,(t.cash_asset/t.nav_asset) as weight_ratio,《资产类别-现金》 as asset_kind from ~报表_报表数据_视图产品全资产^ t where t.init_date = @结束日期# and t.co_no = @操作员机构编号# and t.pd_no = @产品编号# */
    (select t.pd_no,t.co_no,t.pd_code,t.cash_asset as asset_market_value,(t.cash_asset/t.nav_asset) as weight_ratio,1 as asset_kind from db_rpts.v_dt_pd_asset_all t where t.init_date = v_end_date and t.co_no = v_opor_co_no and t.pd_no = v_pd_no
    union all

    /* select t.pd_no,t.co_no,t.pd_code,t.stock_asset as asset_market_value,(t.stock_asset/t.nav_asset) as weight_ratio, 《资产类别-股票》 as asset_kind from ~报表_报表数据_视图产品全资产^ t where t.init_date = @结束日期# and t.co_no = @操作员机构编号# and t.pd_no = @产品编号# */
    select t.pd_no,t.co_no,t.pd_code,t.stock_asset as asset_market_value,(t.stock_asset/t.nav_asset) as weight_ratio, 2 as asset_kind from db_rpts.v_dt_pd_asset_all t where t.init_date = v_end_date and t.co_no = v_opor_co_no and t.pd_no = v_pd_no
    union all

    /* select t.pd_no,t.co_no,t.pd_code,t.futu_asset as asset_market_value,(t.futu_asset/t.nav_asset) as weight_ratio,《资产类别-期货》 as asset_kind from ~报表_报表数据_视图产品全资产^ t where t.init_date = @结束日期# and t.co_no = @操作员机构编号# and t.pd_no = @产品编号# */
    select t.pd_no,t.co_no,t.pd_code,t.futu_asset as asset_market_value,(t.futu_asset/t.nav_asset) as weight_ratio,8 as asset_kind from db_rpts.v_dt_pd_asset_all t where t.init_date = v_end_date and t.co_no = v_opor_co_no and t.pd_no = v_pd_no
    union all

    /* select t.pd_no,t.co_no,t.pd_code,t.option_asset as asset_market_value,(t.option_asset/t.nav_asset) as weight_ratio,《资产类别-期权》 as asset_kind from ~报表_报表数据_视图产品全资产^ t where t.init_date = @结束日期# and t.co_no = @操作员机构编号# and t.pd_no = @产品编号# */
    select t.pd_no,t.co_no,t.pd_code,t.option_asset as asset_market_value,(t.option_asset/t.nav_asset) as weight_ratio,6 as asset_kind from db_rpts.v_dt_pd_asset_all t where t.init_date = v_end_date and t.co_no = v_opor_co_no and t.pd_no = v_pd_no
    union all

    /* select t.pd_no,t.co_no,t.pd_code,t.warrant_asset as asset_market_value,(t.warrant_asset/t.nav_asset) as weight_ratio,《资产类别-权证》 as asset_kind from ~报表_报表数据_视图产品全资产^ t where t.init_date = @结束日期# and t.co_no = @操作员机构编号# and t.pd_no = @产品编号# */
    select t.pd_no,t.co_no,t.pd_code,t.warrant_asset as asset_market_value,(t.warrant_asset/t.nav_asset) as weight_ratio,5 as asset_kind from db_rpts.v_dt_pd_asset_all t where t.init_date = v_end_date and t.co_no = v_opor_co_no and t.pd_no = v_pd_no
    union all

    /* select t.pd_no,t.co_no,t.pd_code,t.fund_asset as asset_market_value,(t.fund_asset/t.nav_asset) as weight_ratio,《资产类别-基金》 as asset_kind from ~报表_报表数据_视图产品全资产^ t where t.init_date = @结束日期# and t.co_no = @操作员机构编号# and t.pd_no = @产品编号# */
    select t.pd_no,t.co_no,t.pd_code,t.fund_asset as asset_market_value,(t.fund_asset/t.nav_asset) as weight_ratio,4 as asset_kind from db_rpts.v_dt_pd_asset_all t where t.init_date = v_end_date and t.co_no = v_opor_co_no and t.pd_no = v_pd_no
    union all

    /* select t.pd_no,t.co_no,t.pd_code,t.repo_asset as asset_market_value,(t.repo_asset/t.nav_asset) as weight_ratio,《资产类别-回购》 as asset_kind from ~报表_报表数据_视图产品全资产^ t where t.init_date = @结束日期# and t.co_no = @操作员机构编号# and t.pd_no = @产品编号# */
    select t.pd_no,t.co_no,t.pd_code,t.repo_asset as asset_market_value,(t.repo_asset/t.nav_asset) as weight_ratio,7 as asset_kind from db_rpts.v_dt_pd_asset_all t where t.init_date = v_end_date and t.co_no = v_opor_co_no and t.pd_no = v_pd_no
    union all

    /* select t.pd_no,t.co_no,t.pd_code,t.bond_asset as asset_market_value,(t.bond_asset/t.nav_asset) as weight_ratio,《资产类别-债券》 as asset_kind from ~报表_报表数据_视图产品全资产^ t where t.init_date = @结束日期# and t.co_no = @操作员机构编号# and t.pd_no = @产品编号# */
    select t.pd_no,t.co_no,t.pd_code,t.bond_asset as asset_market_value,(t.bond_asset/t.nav_asset) as weight_ratio,3 as asset_kind from db_rpts.v_dt_pd_asset_all t where t.init_date = v_end_date and t.co_no = v_opor_co_no and t.pd_no = v_pd_no

    /* )b LEFT JOIN (SELECT t.asset_kind,sum(CASE WHEN m.cost_calc_type = 《成本计算方式-盈亏冲减成本》 AND t.asset_kind <>《资产类别-回购》 THEN(k.stock_asset_value - k.cost_amt - t.stock_asset_value + t.cost_amt)WHEN m.cost_calc_type = 《成本计算方式-盈亏不冲减成本》 AND t.asset_kind <>《资产类别-回购》 THEN(k.stock_asset_value - t.stock_asset_value + k.realize_pandl - t.realize_pandl)ELSE 0 END) AS float_pandl_sum */
    )b LEFT JOIN (SELECT t.asset_kind,sum(CASE WHEN m.cost_calc_type = 1 AND t.asset_kind <>7 THEN(k.stock_asset_value - k.cost_amt - t.stock_asset_value + t.cost_amt)WHEN m.cost_calc_type = 2 AND t.asset_kind <>7 THEN(k.stock_asset_value - t.stock_asset_value + k.realize_pandl - t.realize_pandl)ELSE 0 END) AS float_pandl_sum

    /* FROM tb_rpt_productinfo m, ~报表_报表数据_视图产品全持仓^ t, ~报表_报表数据_视图产品全持仓^ k, (SELECT t.stock_code,t.exch_no,min(t.init_date) AS begin_date FROM ~报表_报表数据_视图产品全持仓^ t WHERE t.pd_no = @产品编号# AND t.co_no = @操作员机构编号# AND t.init_date BETWEEN @开始日期# AND @结束日期# GROUP BY t.stock_code,t.exch_no) n where  t.pd_no = k.pd_no */
    FROM tb_rpt_productinfo m, db_rpts.v_dt_pd_holder_all t, db_rpts.v_dt_pd_holder_all k, (SELECT t.stock_code,t.exch_no,min(t.init_date) AS begin_date FROM db_rpts.v_dt_pd_holder_all t WHERE t.pd_no = v_pd_no AND t.co_no = v_opor_co_no AND t.init_date BETWEEN v_begin_date AND v_end_date GROUP BY t.stock_code,t.exch_no) n where  t.pd_no = k.pd_no

    /* AND t.stock_code = k.stock_code AND t.exch_no = k.exch_no AND k.init_date = @结束日期# AND t.init_date = n.begin_date and t.stock_code = n.stock_code and t.exch_no = n.exch_no AND t.pd_no = m.pd_no AND t.co_no = @操作员机构编号# AND t.pd_no = @产品编号# GROUP BY t.asset_kind */
    AND t.stock_code = k.stock_code AND t.exch_no = k.exch_no AND k.init_date = v_end_date AND t.init_date = n.begin_date and t.stock_code = n.stock_code and t.exch_no = n.exch_no AND t.pd_no = m.pd_no AND t.co_no = v_opor_co_no AND t.pd_no = v_pd_no GROUP BY t.asset_kind
    )c on b.asset_kind = c.asset_kind

    /* where a.pd_no = b.pd_no and a.pd_status = 《产品状态-正常》 order by b.asset_kind; */
    where a.pd_no = b.pd_no and a.pd_status = "1" order by b.asset_kind;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询持仓分析
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryHoldAnalysis;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryHoldAnalysis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_crncy_type varchar(3),
    IN p_cause_type int,
    IN p_asset_kind int,
    IN p_achi_compa_crite int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_crncy_type varchar(3);
    declare v_cause_type int;
    declare v_asset_kind int;
    declare v_achi_compa_crite int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_crncy_type = p_crncy_type;
    SET v_cause_type = p_cause_type;
    SET v_asset_kind = p_asset_kind;
    SET v_achi_compa_crite = p_achi_compa_crite;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][报表_报表数据_视图产品全资产][min({初始化日期}),max({初始化日期})][@开始日期#,@结束日期#][{初始化日期} between @开始日期# and @结束日期#] */
    select min(init_date),max(init_date) into v_begin_date,v_end_date from db_rpts.v_dt_pd_asset_all where init_date between v_begin_date and v_end_date limit 1;

    SELECT b.begin_date,b.end_date,b.pd_no,b.asset_kind,b.stock_code,b.stock_name,b.last_price,b.posi_qty,b.asset_market_value,
    ROUND(b.asset_market_value / c.nav_asset,12) AS weight_ratio,
    b.float_pandl AS interval_pandl,ROUND(b.float_pandl / c.nav_asset,12) AS product_return_rate,
    ROUND(b.float_pandl / d.float_pandl_sum,12) AS return_rate
    FROM
    (SELECT t.init_date AS begin_date,k.init_date AS end_date,t.pd_no,t.asset_kind,t.stock_code,t.stock_name,k.last_price,k.stock_asset_value AS asset_market_value,

    /* (CASE WHEN m.cost_calc_type = 《成本计算方式-盈亏冲减成本》 AND t.asset_kind <>《资产类别-回购》 THEN(k.stock_asset_value - k.cost_amt - t.stock_asset_value + t.cost_amt) */
    (CASE WHEN m.cost_calc_type = 1 AND t.asset_kind <>7 THEN(k.stock_asset_value - k.cost_amt - t.stock_asset_value + t.cost_amt)

    /* WHEN m.cost_calc_type = 《成本计算方式-盈亏不冲减成本》 AND t.asset_kind <>《资产类别-回购》 THEN(k.stock_asset_value - t.stock_asset_value + k.realize_pandl - t.realize_pandl) */
    WHEN m.cost_calc_type = 2 AND t.asset_kind <>7 THEN(k.stock_asset_value - t.stock_asset_value + k.realize_pandl - t.realize_pandl)

    /* ELSE 0 END) AS float_pandl,k.curr_qty AS posi_qty FROM(SELECT t.stock_code,t.exch_no,min(t.init_date) AS begin_date FROM ~报表_报表数据_视图产品全持仓^ t WHERE t.pd_no = @产品编号# AND t.co_no = @操作员机构编号# AND t.init_date BETWEEN @开始日期# AND @结束日期# GROUP BY t.stock_code,t.exch_no) n, */
    ELSE 0 END) AS float_pandl,k.curr_qty AS posi_qty FROM(SELECT t.stock_code,t.exch_no,min(t.init_date) AS begin_date FROM db_rpts.v_dt_pd_holder_all t WHERE t.pd_no = v_pd_no AND t.co_no = v_opor_co_no AND t.init_date BETWEEN v_begin_date AND v_end_date GROUP BY t.stock_code,t.exch_no) n,

    /* tb_rpt_productinfo m, ~报表_报表数据_视图产品全持仓^ t LEFT JOIN ~报表_报表数据_视图产品全持仓^ k ON t.pd_no = k.pd_no AND t.stock_code = k.stock_code */
    tb_rpt_productinfo m, db_rpts.v_dt_pd_holder_all t LEFT JOIN db_rpts.v_dt_pd_holder_all k ON t.pd_no = k.pd_no AND t.stock_code = k.stock_code

    /* AND t.exch_no = k.exch_no AND k.init_date = @结束日期# WHERE t.init_date = n.begin_date AND t.stock_code = n.stock_code AND t.exch_no = n.exch_no AND t.pd_no = m.pd_no AND t.co_no = @操作员机构编号# AND t.pd_no = @产品编号# AND t.asset_kind = @资产类别# */
    AND t.exch_no = k.exch_no AND k.init_date = v_end_date WHERE t.init_date = n.begin_date AND t.stock_code = n.stock_code AND t.exch_no = n.exch_no AND t.pd_no = m.pd_no AND t.co_no = v_opor_co_no AND t.pd_no = v_pd_no AND t.asset_kind = v_asset_kind

    /* ) b, ~报表_报表数据_视图产品全资产^ c, */
    ) b, db_rpts.v_dt_pd_asset_all c,

    /* (SELECT t.pd_no,sum(CASE WHEN m.cost_calc_type = 《成本计算方式-盈亏冲减成本》 AND t.asset_kind <>《资产类别-回购》 THEN (k.stock_asset_value - k.cost_amt - t.stock_asset_value + t.cost_amt)WHEN m.cost_calc_type = 《成本计算方式-盈亏不冲减成本》 AND t.asset_kind <>《资产类别-回购》 THEN(k.stock_asset_value - t.stock_asset_value + k.realize_pandl - t.realize_pandl)ELSE 0 END) AS float_pandl_sum FROM */
    (SELECT t.pd_no,sum(CASE WHEN m.cost_calc_type = 1 AND t.asset_kind <>7 THEN (k.stock_asset_value - k.cost_amt - t.stock_asset_value + t.cost_amt)WHEN m.cost_calc_type = 2 AND t.asset_kind <>7 THEN(k.stock_asset_value - t.stock_asset_value + k.realize_pandl - t.realize_pandl)ELSE 0 END) AS float_pandl_sum FROM

    /* (SELECT t.stock_code,t.exch_no,min(t.init_date) AS begin_date FROM ~报表_报表数据_视图产品全持仓^ t WHERE t.pd_no = @产品编号# AND t.co_no = @操作员机构编号# AND t.init_date BETWEEN @开始日期# AND @结束日期# GROUP BY t.stock_code,t.exch_no) n,tb_rpt_productinfo m, ~报表_报表数据_视图产品全持仓^ t LEFT JOIN ~报表_报表数据_视图产品全持仓^ k ON t.pd_no = k.pd_no */
    (SELECT t.stock_code,t.exch_no,min(t.init_date) AS begin_date FROM db_rpts.v_dt_pd_holder_all t WHERE t.pd_no = v_pd_no AND t.co_no = v_opor_co_no AND t.init_date BETWEEN v_begin_date AND v_end_date GROUP BY t.stock_code,t.exch_no) n,tb_rpt_productinfo m, db_rpts.v_dt_pd_holder_all t LEFT JOIN db_rpts.v_dt_pd_holder_all k ON t.pd_no = k.pd_no

    /* AND t.stock_code = k.stock_code AND t.exch_no = k.exch_no AND k.init_date = @结束日期# WHERE t.init_date = n.begin_date AND t.stock_code = n.stock_code AND t.exch_no = n.exch_no AND t.pd_no = m.pd_no AND t.co_no = @操作员机构编号# AND t.pd_no = @产品编号# AND t.asset_kind = @资产类别# GROUP BY t.pd_no) d */
    AND t.stock_code = k.stock_code AND t.exch_no = k.exch_no AND k.init_date = v_end_date WHERE t.init_date = n.begin_date AND t.stock_code = n.stock_code AND t.exch_no = n.exch_no AND t.pd_no = m.pd_no AND t.co_no = v_opor_co_no AND t.pd_no = v_pd_no AND t.asset_kind = v_asset_kind GROUP BY t.pd_no) d

    /* WHERE b.pd_no = c.pd_no AND b.pd_no = d.pd_no AND c.init_date = @结束日期# AND (b.posi_qty > 0 OR b.float_pandl <> 0); */
    WHERE b.pd_no = c.pd_no AND b.pd_no = d.pd_no AND c.init_date = v_end_date AND (b.posi_qty > 0 OR b.float_pandl <> 0);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询行业分析
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryIndustryAnalysis;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryIndustryAnalysis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_crncy_type varchar(3),
    IN p_cause_type int,
    IN p_asset_kind int,
    IN p_achi_compa_crite int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_crncy_type varchar(3);
    declare v_cause_type int;
    declare v_asset_kind int;
    declare v_achi_compa_crite int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_crncy_type = p_crncy_type;
    SET v_cause_type = p_cause_type;
    SET v_asset_kind = p_asset_kind;
    SET v_achi_compa_crite = p_achi_compa_crite;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* IF @产品编号# = 0 THEN */
    IF v_pd_no = 0 THEN

          /* [获取表记录变量][报表_报表数据_报表产品信息表][{产品编号}][@产品编号#][{机构编号} = @操作员机构编号# order by {产品编号}][1]["获取产品信息失败"] */
          select pd_no into v_pd_no from db_rpts.tb_rpt_productinfo where co_no = v_opor_co_no order by pd_no limit 1;
          if FOUND_ROWS() = 0 then
                      
              SET v_error_code = "rptA.3.16.1";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT("获取产品信息失败","#",v_mysql_message);
              else
                  SET v_error_info = "获取产品信息失败";
              end if;
              leave label_pro;
          end if;

    END IF ;

    /* [获取表记录变量语句][报表_报表数据_视图产品全资产][min({初始化日期}),max({初始化日期})][@开始日期#,@结束日期#][{初始化日期} between @开始日期# and @结束日期# and {产品编号} = @产品编号#] */
    select min(init_date),max(init_date) into v_begin_date,v_end_date from db_rpts.v_dt_pd_asset_all where init_date between v_begin_date and v_end_date and pd_no = v_pd_no limit 1;


    /* IF @开始日期# = @结束日期# THEN */
    IF v_begin_date = v_end_date THEN

           /* [获取表记录变量][报表_报表数据_报表交易日信息表][{上一交易日}][@开始日期#][{交易日期} = @结束日期#][1]["获取上一交易日失败"] */
           select last_tradeday into v_begin_date from db_rpts.tb_rpt_tradeday where trade_date = v_end_date limit 1;
           if FOUND_ROWS() = 0 then
                       
               SET v_error_code = "rptA.3.16.1";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT("获取上一交易日失败","#",v_mysql_message);
               else
                   SET v_error_info = "获取上一交易日失败";
               end if;
               leave label_pro;
           end if;

    END IF ;

    /* select t.pd_no,1 as first_industry_code,t.cash_asset as asset_market_value,ROUND(t.cash_asset/t.nav_asset,12) as weight_ratio,0 as interval_pandl,0 as product_return_rate from ~报表_报表数据_视图产品全资产^ t where t.init_date = @结束日期# and t.pd_no = @产品编号# */
    select t.pd_no,1 as first_industry_code,t.cash_asset as asset_market_value,ROUND(t.cash_asset/t.nav_asset,12) as weight_ratio,0 as interval_pandl,0 as product_return_rate from db_rpts.v_dt_pd_asset_all t where t.init_date = v_end_date and t.pd_no = v_pd_no
    union all
    select b.pd_no,a.first_industry_code as first_industry_code,a.stock_asset_value as asset_market_value,ROUND(a.stock_asset_value/b.nav_asset,12) as weight_ratio,a.float_pandl as interval_pandl,ROUND(a.float_pandl/b.nav_asset,12) as product_return_rate from
    (select sum(k.stock_asset_value) as stock_asset_value,n.first_industry_code,

    /* sum(CASE WHEN j.cost_calc_type = 《成本计算方式-盈亏冲减成本》 AND t.asset_kind <>《资产类别-回购》 THEN (k.stock_asset_value - k.cost_amt - t.stock_asset_value + t.cost_amt) */
    sum(CASE WHEN j.cost_calc_type = 1 AND t.asset_kind <>7 THEN (k.stock_asset_value - k.cost_amt - t.stock_asset_value + t.cost_amt)

    /* WHEN j.cost_calc_type = 《成本计算方式-盈亏不冲减成本》 AND t.asset_kind <>《资产类别-回购》 THEN (k.stock_asset_value - t.stock_asset_value + k.realize_pandl - t.realize_pandl) */
    WHEN j.cost_calc_type = 2 AND t.asset_kind <>7 THEN (k.stock_asset_value - t.stock_asset_value + k.realize_pandl - t.realize_pandl)
    ELSE 0 END) AS float_pandl

    /* from ~报表_报表数据_视图产品全持仓^ t, ~报表_报表数据_视图产品全持仓^ k,tb_sys_industry_stock n,tb_rpt_productinfo j, */
    from db_rpts.v_dt_pd_holder_all t, db_rpts.v_dt_pd_holder_all k,tb_sys_industry_stock n,tb_rpt_productinfo j,

    /* (select t.stock_code,t.exch_no,min(t.init_date) as begin_date from ~报表_报表数据_视图产品全持仓^ t where t.pd_no = @产品编号# and t.co_no = @操作员机构编号# and t.init_date BETWEEN @开始日期# and @结束日期# GROUP BY t.stock_code,t.exch_no)m */
    (select t.stock_code,t.exch_no,min(t.init_date) as begin_date from db_rpts.v_dt_pd_holder_all t where t.pd_no = v_pd_no and t.co_no = v_opor_co_no and t.init_date BETWEEN v_begin_date and v_end_date GROUP BY t.stock_code,t.exch_no)m
    where t.init_date =  m.begin_date and t.stock_code = m.stock_code and t.exch_no = m.exch_no and t.stock_code = k.stock_code and t.exch_no = k.exch_no and t.pd_no = k.pd_no
    and t.stock_code = n.stock_code and t.exch_no = n.exch_no and j.pd_no = t.pd_no

    /* and n.industry_std = @归因类别# and k.init_date = @结束日期# and k.pd_no = @产品编号# */
    and n.industry_std = v_cause_type and k.init_date = v_end_date and k.pd_no = v_pd_no
    GROUP BY n.first_industry_code

    /* )a, ~报表_报表数据_视图产品全资产^ b */
    )a, db_rpts.v_dt_pd_asset_all b

    /* where b.init_date = @结束日期# and b.pd_no = @产品编号# and a.stock_asset_value<>0; */
    where b.init_date = v_end_date and b.pd_no = v_pd_no and a.stock_asset_value<>0;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询行业持仓分析
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryIndustryHoldAnalysis;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryIndustryHoldAnalysis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_crncy_type varchar(3),
    IN p_cause_type int,
    IN p_achi_compa_crite int,
    IN p_first_indu_code varchar(8),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_crncy_type varchar(3);
    declare v_cause_type int;
    declare v_achi_compa_crite int;
    declare v_first_indu_code varchar(8);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_crncy_type = p_crncy_type;
    SET v_cause_type = p_cause_type;
    SET v_achi_compa_crite = p_achi_compa_crite;
    SET v_first_indu_code = p_first_indu_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][报表_报表数据_视图产品全资产][min({初始化日期}),max({初始化日期})][@开始日期#,@结束日期#][{初始化日期} between @开始日期# and @结束日期#] */
    select min(init_date),max(init_date) into v_begin_date,v_end_date from db_rpts.v_dt_pd_asset_all where init_date between v_begin_date and v_end_date limit 1;


    /* IF @开始日期# = @结束日期# THEN */
    IF v_begin_date = v_end_date THEN

           /* [获取表记录变量][报表_报表数据_报表交易日信息表][{上一交易日}][@开始日期#][{交易日期} = @结束日期#][1]["获取上一交易日失败"] */
           select last_tradeday into v_begin_date from db_rpts.tb_rpt_tradeday where trade_date = v_end_date limit 1;
           if FOUND_ROWS() = 0 then
                       
               SET v_error_code = "rptA.3.17.1";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT("获取上一交易日失败","#",v_mysql_message);
               else
                   SET v_error_info = "获取上一交易日失败";
               end if;
               leave label_pro;
           end if;

    END IF ;
    select a.begin_date,a.end_date,a.pd_no,a.stock_code,a.stock_name,a.last_price,a.curr_qty as posi_qty,a.stock_asset_value as asset_market_value,ROUND(a.stock_asset_value/b.nav_asset) as weight_ratio,a.float_pandl as interval_pandl,ROUND(a.float_pandl/b.nav_asset,12) as product_return_rate,ROUND(a.float_pandl/b.float_pandl_sum,12) as return_rate
    from  (select t.init_date as begin_date,k.init_date as end_date,k.pd_no,k.stock_code,k.stock_name,k.last_price,k.curr_qty,k.stock_asset_value as stock_asset_value,

    /* (CASE WHEN j.cost_calc_type = 《成本计算方式-盈亏冲减成本》 AND t.asset_kind <>《资产类别-回购》 THEN (k.stock_asset_value - k.cost_amt - t.stock_asset_value + t.cost_amt) */
    (CASE WHEN j.cost_calc_type = 1 AND t.asset_kind <>7 THEN (k.stock_asset_value - k.cost_amt - t.stock_asset_value + t.cost_amt)

    /* WHEN j.cost_calc_type = 《成本计算方式-盈亏不冲减成本》 AND t.asset_kind <>《资产类别-回购》 THEN (k.stock_asset_value - t.stock_asset_value + k.realize_pandl - t.realize_pandl) */
    WHEN j.cost_calc_type = 2 AND t.asset_kind <>7 THEN (k.stock_asset_value - t.stock_asset_value + k.realize_pandl - t.realize_pandl)
    ELSE 0 END) AS float_pandl

    /* from ~报表_报表数据_视图产品全持仓^ t, ~报表_报表数据_视图产品全持仓^ k,tb_sys_industry_stock n,tb_rpt_productinfo j, */
    from db_rpts.v_dt_pd_holder_all t, db_rpts.v_dt_pd_holder_all k,tb_sys_industry_stock n,tb_rpt_productinfo j,

    /* (select t.stock_code,t.exch_no,min(t.init_date) as begin_date from ~报表_报表数据_视图产品全持仓^ t where t.pd_no = @产品编号# and t.co_no = @操作员机构编号# and t.init_date BETWEEN @开始日期# and @结束日期# GROUP BY t.stock_code,t.exch_no)m */
    (select t.stock_code,t.exch_no,min(t.init_date) as begin_date from db_rpts.v_dt_pd_holder_all t where t.pd_no = v_pd_no and t.co_no = v_opor_co_no and t.init_date BETWEEN v_begin_date and v_end_date GROUP BY t.stock_code,t.exch_no)m
    where t.init_date =  m.begin_date and t.stock_code = m.stock_code and t.exch_no = m.exch_no and t.stock_code = k.stock_code and t.exch_no = k.exch_no and t.pd_no = k.pd_no
    and t.stock_code = n.stock_code and t.exch_no = n.exchange_no and j.pd_no = t.pd_no

    /* and n.industry_std = @归因类别# and n.first_industry_code = @一级行业代码# and k.init_date = @结束日期# and k.pd_no = @产品编号#)a, */
    and n.industry_std = v_cause_type and n.first_industry_code = v_first_indu_code and k.init_date = v_end_date and k.pd_no = v_pd_no)a,

    /* (select t.pd_no ,o.nav_asset,sum(CASE WHEN j.cost_calc_type = 《成本计算方式-盈亏冲减成本》 AND t.asset_kind <>《资产类别-回购》 THEN (k.stock_asset_value - k.cost_amt - t.stock_asset_value + t.cost_amt) */
    (select t.pd_no ,o.nav_asset,sum(CASE WHEN j.cost_calc_type = 1 AND t.asset_kind <>7 THEN (k.stock_asset_value - k.cost_amt - t.stock_asset_value + t.cost_amt)

    /* WHEN j.cost_calc_type = 《成本计算方式-盈亏不冲减成本》 AND t.asset_kind <>《资产类别-回购》 THEN (k.stock_asset_value - t.stock_asset_value + k.realize_pandl - t.realize_pandl) */
    WHEN j.cost_calc_type = 2 AND t.asset_kind <>7 THEN (k.stock_asset_value - t.stock_asset_value + k.realize_pandl - t.realize_pandl)

    /* ELSE 0 END) AS float_pandl_sum from ~报表_报表数据_视图产品全持仓^ t, ~报表_报表数据_视图产品全持仓^ k,tb_rpt_productinfo j, ~报表_报表数据_视图产品全资产^ o, */
    ELSE 0 END) AS float_pandl_sum from db_rpts.v_dt_pd_holder_all t, db_rpts.v_dt_pd_holder_all k,tb_rpt_productinfo j, db_rpts.v_dt_pd_asset_all o,

    /* (select t.stock_code,t.exch_no,min(t.init_date) as begin_date from ~报表_报表数据_视图产品全持仓^ t where t.pd_no = @产品编号# and t.co_no = @操作员机构编号# and t.init_date BETWEEN @开始日期# and @结束日期# GROUP BY t.stock_code,t.exch_no)m */
    (select t.stock_code,t.exch_no,min(t.init_date) as begin_date from db_rpts.v_dt_pd_holder_all t where t.pd_no = v_pd_no and t.co_no = v_opor_co_no and t.init_date BETWEEN v_begin_date and v_end_date GROUP BY t.stock_code,t.exch_no)m

    /* where k.init_date = @结束日期# and t.init_date = m.begin_date and t.stock_code = m.stock_code and t.exch_no = m.exch_no and t.stock_code = k.stock_code and t.exch_no = k.exch_no and t.pd_no = k.pd_no and t.pd_no = j.pd_no and t.pd_no = @产品编号# and o.pd_no = t.pd_no and o.init_date = @结束日期# */
    where k.init_date = v_end_date and t.init_date = m.begin_date and t.stock_code = m.stock_code and t.exch_no = m.exch_no and t.stock_code = k.stock_code and t.exch_no = k.exch_no and t.pd_no = k.pd_no and t.pd_no = j.pd_no and t.pd_no = v_pd_no and o.pd_no = t.pd_no and o.init_date = v_end_date
    )b
    where a.pd_no = b.pd_no and (a.curr_qty>0 or a.float_pandl<>0);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryProductHold;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryProductHold(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
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
    declare v_pd_no int;
    declare v_input_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_last_tradeday int;

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
    SET v_input_date = p_input_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_last_tradeday = 0;

    
    label_pro:BEGIN
    

    /* IF @产品编号# = 0 THEN */
    IF v_pd_no = 0 THEN

          /* [获取表记录变量][报表_报表数据_报表产品信息表][{产品编号}][@产品编号#][{机构编号} = @操作员机构编号# order by {产品编号}][1]["获取产品信息失败"] */
          select pd_no into v_pd_no from db_rpts.tb_rpt_productinfo where co_no = v_opor_co_no order by pd_no limit 1;
          if FOUND_ROWS() = 0 then
                      
              SET v_error_code = "rptA.3.18.1";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT("获取产品信息失败","#",v_mysql_message);
              else
                  SET v_error_info = "获取产品信息失败";
              end if;
              leave label_pro;
          end if;

    END IF ;

    /* [获取表记录变量][报表_报表数据_报表交易日信息表][{上一交易日}][@上一交易日#][{交易日期} = @传入日期#][1]["获取上一交易日失败"] */
    select last_tradeday into v_last_tradeday from db_rpts.tb_rpt_tradeday where trade_date = v_input_date limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "rptA.3.18.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("获取上一交易日失败","#",v_mysql_message);
        else
            SET v_error_info = "获取上一交易日失败";
        end if;
        leave label_pro;
    end if;

    SELECT t.pd_no,t.stock_code,t.stock_name,t.stock_asset_value,ROUND(t.cost_amt / t.curr_qty, 9) AS cost_price,t.curr_qty as posi_qty,t.cost_amt,

    /* (CASE WHEN m.cost_calc_type = 《成本计算方式-盈亏冲减成本》 AND t.asset_kind <> 《资产类别-回购》 THEN(t.stock_asset_value - t.cost_amt - IFNULL(k.stock_asset_value,0) + IFNULL(k.cost_amt,0)) */
    (CASE WHEN m.cost_calc_type = 1 AND t.asset_kind <> 7 THEN(t.stock_asset_value - t.cost_amt - IFNULL(k.stock_asset_value,0) + IFNULL(k.cost_amt,0))

    /* WHEN m.cost_calc_type = 《成本计算方式-盈亏不冲减成本》 AND t.asset_kind <> 《资产类别-回购》 THEN(t.stock_asset_value - IFNULL(k.stock_asset_value,0) + t.realize_pandl - IFNULL(k.realize_pandl,0)) */
    WHEN m.cost_calc_type = 2 AND t.asset_kind <> 7 THEN(t.stock_asset_value - IFNULL(k.stock_asset_value,0) + t.realize_pandl - IFNULL(k.realize_pandl,0))
    ELSE 0 END) AS float_pandl,ROUND(t.stock_asset_value/n.nav_asset,12) AS weight_ratio

    /* FROM tb_rpt_productinfo m, ~报表_报表数据_视图产品全资产^ n, ~报表_报表数据_视图产品全持仓^ t LEFT JOIN ~报表_报表数据_视图产品全持仓^ k */
    FROM tb_rpt_productinfo m, db_rpts.v_dt_pd_asset_all n, db_rpts.v_dt_pd_holder_all t LEFT JOIN db_rpts.v_dt_pd_holder_all k

    /* on t.pd_no = k.pd_no and t.stock_code = k.stock_code and t.exch_no = k.exch_no and k.init_date = @上一交易日# */
    on t.pd_no = k.pd_no and t.stock_code = k.stock_code and t.exch_no = k.exch_no and k.init_date = v_last_tradeday
    where t.pd_no = m.pd_no and t.pd_no = n.pd_no and t.init_date = n.init_date

    /* and t.pd_no = @产品编号# and t.init_date = @传入日期# */
    and t.pd_no = v_pd_no and t.init_date = v_input_date
    and t.curr_qty <>0;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品持仓对比
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryProductHoldCmp;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryProductHoldCmp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][报表_报表数据_视图产品全持仓][min({初始化日期}),max({初始化日期})][@开始日期#,@结束日期#][{初始化日期} between @开始日期# and @结束日期#] */
    select min(init_date),max(init_date) into v_begin_date,v_end_date from db_rpts.v_dt_pd_holder_all where init_date between v_begin_date and v_end_date limit 1;

    select x.stock_code,x.stock_name,x.exch_no,x.last_price,sum(x.curr_qty) as posi_qty,sum(x.stock_asset_value) as stock_asset_value,AVG(x.cost_price) as cost_price,1 as weight_ratio,sum(x.float_pandl) as float_pandl from
    (select a.pd_no,a.exch_no,a.stock_code,a.stock_name,b.last_price,b.curr_qty,b.stock_asset_value,(b.cost_amt/b.curr_qty) as cost_price,
    (CASE

    /* WHEN d.cost_calc_type = 《成本计算方式-盈亏冲减成本》 AND a.asset_kind <> 《资产类别-回购》 THEN (b.stock_asset_value - b.cost_amt - a.stock_asset_value + a.cost_amt) */
    WHEN d.cost_calc_type = 1 AND a.asset_kind <> 7 THEN (b.stock_asset_value - b.cost_amt - a.stock_asset_value + a.cost_amt)

    /* WHEN d.cost_calc_type = 《成本计算方式-盈亏不冲减成本》 AND a.asset_kind <> 《资产类别-回购》 THEN (b.stock_asset_value - a.stock_asset_value + b.realize_pandl - a.realize_pandl) */
    WHEN d.cost_calc_type = 2 AND a.asset_kind <> 7 THEN (b.stock_asset_value - a.stock_asset_value + b.realize_pandl - a.realize_pandl)
    ELSE 0 END) AS float_pandl

    /* from ~报表_报表数据_视图产品全持仓^ a, ~报表_报表数据_视图产品全持仓^ b, */
    from db_rpts.v_dt_pd_holder_all a, db_rpts.v_dt_pd_holder_all b,
    (SELECT t.pd_no,t.exch_no,t.stock_code,min(t.init_date) as begin_date

    /* FROM ~报表_报表数据_视图产品全持仓^ t */
    FROM db_rpts.v_dt_pd_holder_all t

    /* WHERE t.init_date BETWEEN @开始日期# AND @结束日期# AND t.co_no = @操作员机构编号# */
    WHERE t.init_date BETWEEN v_begin_date AND v_end_date AND t.co_no = v_opor_co_no
    GROUP BY t.pd_no,t.exch_no,t.stock_code
    ) c ,tb_rpt_productinfo d
    where a.pd_no = c.pd_no and a.init_date = c.begin_date and a.exch_no = c.exch_no and a.stock_code = c.stock_code

    /* and b.init_date = @结束日期# and a.pd_no = b.pd_no and a.exch_no = b.exch_no and a.stock_code = b.stock_code */
    and b.init_date = v_end_date and a.pd_no = b.pd_no and a.exch_no = b.exch_no and a.stock_code = b.stock_code
    and a.pd_no = d.pd_no) x
    where x.float_pandl <>0 and x.curr_qty <>0
    GROUP BY x.exch_no,x.stock_code;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询持仓证券产品
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_QueryStockHoldProduct;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_QueryStockHoldProduct(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][报表_报表数据_视图产品全持仓][min({初始化日期}),max({初始化日期})][@开始日期#,@结束日期#][{机构编号} = @操作员机构编号# and {初始化日期} between @开始日期# and @结束日期#] */
    select min(init_date),max(init_date) into v_begin_date,v_end_date from db_rpts.v_dt_pd_holder_all where co_no = v_opor_co_no and init_date between v_begin_date and v_end_date limit 1;

    select a.pd_name,a.pd_manager,a.curr_qty as posi_qty,a.stock_asset_value,a.cost_price,ROUND((a.stock_asset_value/stock_asset_value_sum),12) as weight_ratio,a.float_pandl,a.asset_market_value,ROUND(a.stock_asset_value/a.asset_market_value,12) as asset_ratio from
    (select a.pd_no,d.pd_name,d.pd_manager,b.curr_qty,b.stock_asset_value,(b.cost_amt/b.curr_qty) as cost_price,
    (CASE

    /* WHEN d.cost_calc_type = 《成本计算方式-盈亏冲减成本》 AND a.asset_kind <> 《资产类别-回购》 THEN (b.stock_asset_value - b.cost_amt - a.stock_asset_value + a.cost_amt) */
    WHEN d.cost_calc_type = 1 AND a.asset_kind <> 7 THEN (b.stock_asset_value - b.cost_amt - a.stock_asset_value + a.cost_amt)

    /* WHEN d.cost_calc_type = 《成本计算方式-盈亏不冲减成本》 AND a.asset_kind <> 《资产类别-回购》 THEN (b.stock_asset_value - a.stock_asset_value + b.realize_pandl - a.realize_pandl) */
    WHEN d.cost_calc_type = 2 AND a.asset_kind <> 7 THEN (b.stock_asset_value - a.stock_asset_value + b.realize_pandl - a.realize_pandl)
    ELSE 0 END) AS float_pandl,(e.stock_asset + e.fund_asset + e.futu_asset + e.option_asset + e.warrant_asset + e.repo_asset + e.bond_asset) as asset_market_value

    /* from ~报表_报表数据_视图产品全持仓^ a, ~报表_报表数据_视图产品全持仓^ b, */
    from db_rpts.v_dt_pd_holder_all a, db_rpts.v_dt_pd_holder_all b,
    (SELECT t.pd_no,t.exch_no,t.stock_code,min(t.init_date) as begin_date

    /* FROM ~报表_报表数据_视图产品全持仓^ t */
    FROM db_rpts.v_dt_pd_holder_all t

    /* WHERE t.init_date BETWEEN @开始日期# AND @结束日期# */
    WHERE t.init_date BETWEEN v_begin_date AND v_end_date

    /* and t.stock_code = @证券代码# and t.exch_no = @市场编号# and t.co_no = @操作员机构编号# */
    and t.stock_code = v_stock_code and t.exch_no = v_exch_no and t.co_no = v_opor_co_no
    GROUP BY t.pd_no,t.exch_no,t.stock_code

    /* ) c ,tb_rpt_productinfo d, ~报表_报表数据_视图产品全资产^ e */
    ) c ,tb_rpt_productinfo d, db_rpts.v_dt_pd_asset_all e
    where a.pd_no = c.pd_no and a.init_date = c.begin_date and a.exch_no = c.exch_no and a.stock_code = c.stock_code

    /* and b.init_date = @结束日期# and a.pd_no = b.pd_no and a.exch_no = b.exch_no and a.stock_code = b.stock_code */
    and b.init_date = v_end_date and a.pd_no = b.pd_no and a.exch_no = b.exch_no and a.stock_code = b.stock_code

    /* and a.pd_no = d.pd_no and a.pd_no = e.pd_no and e.init_date = @结束日期#)a, */
    and a.pd_no = d.pd_no and a.pd_no = e.pd_no and e.init_date = v_end_date)a,

    /* (select sum(t.stock_asset_value) as stock_asset_value_sum from ~报表_报表数据_视图产品全持仓^ t where t.init_date = @结束日期# */
    (select sum(t.stock_asset_value) as stock_asset_value_sum from db_rpts.v_dt_pd_holder_all t where t.init_date = v_end_date

    /* and t.stock_code = @证券代码# and t.exch_no = @市场编号#)b; */
    and t.stock_code = v_stock_code and t.exch_no = v_exch_no)b;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_持仓分析查询汇总证券代码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Holder_QrySum_By_StockCode;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Holder_QrySum_By_StockCode(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # [创建视图][视图_计算_产品_资金_资产][视图_数据_产品_资金_资产][ifnull(a.{净资产}/a.{产品总份额},0) as {单位净值},ifnull((a.{净资产}/a.{产品总份额}-a.{昨日净值})/a.{昨日净值},0) as {净值波动},ifnull((a.{净资产}/a.{产品总份额}-a.{期初净资产}/a.{昨日份额})*a.{昨日份额},0) as {当日盈亏},ifnull((a.{净资产}/a.{产品总份额}-a.{期初净资产}/a.{昨日份额})*a.{昨日份额}/a.{期初净资产},0) as {当日收益率},ifnull(a.{股票资产}/a.{净资产},0) as {股票资产占比},ifnull((a.{股票资产}+a.{债券资产}+a.{基金资产}+a.{回购资产})/a.{净资产},0) as {证券占比}]
    # [获取表全记录][视图_报表_报表资管_查询产品资产][字段][({机构编号}=@操作员机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) ]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_持仓分析查询汇总市场
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Holder_QrySum_By_ExchNo;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Holder_QrySum_By_ExchNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_持仓分析查询汇总证券类别
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Holder_QrySum_By_StockType;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Holder_QrySum_By_StockType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_持仓分析查询汇总产品汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Holder_QrySum_By_Product;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Holder_QrySum_By_Product(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_持仓分析查询明细持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Holder_QryDetail_Holder;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Holder_QryDetail_Holder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_债券分析查询明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Bond_QryDetail_Detail;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Bond_QryDetail_Detail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_bond_code varchar(6),
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
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_bond_code varchar(6);
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
    SET v_pd_no = p_pd_no;
    SET v_exch_no = p_exch_no;
    SET v_bond_code = p_bond_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @指定行数# = IF(@指定行数# = -1,99999999,@指定行数# ); */
    set v_row_count = IF(v_row_count = -1,99999999,v_row_count );
    # part1: 查询债券信息
    # select * from v_rpt_bond_holder_term t where t.co_no = @操作员机构编号#
    # and (@初始化日期# = date_format(curdate(),'%Y%m%d') or {初始化日期}=@初始化日期#)
    # and (@产品编号# = 0 or {产品编号}=@产品编号#)
    # and (@市场编号# = "" "" or {市场编号}=@市场编号#)
    # and (@债券代码# = "" "" or {债券代码}=@债券代码#)
    # and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号} limit @指定行数#;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_债券分析查询行业权重
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Bond_QryIndustry_Weight;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Bond_QryIndustry_Weight(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_crncy_type varchar(3),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_crncy_type varchar(3);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # part1: 查询债券信息
    # select * from 报表_报表数据_视图债券全部信息 t where t.co_no = @操作员机构编号#
    # and (@产品编号# = 0 or {产品编号}=@产品编号#)
    # and (@开始日期# = date_format(curdate(),'%Y%m%d') or {开始日期}>=@开始日期#)
    # and (@结束日期# = date_format(curdate(),'%Y%m%d') or {结束日期}<=@结束日期#)
    # and (@本币币种# = ""CNY"" or {本币币种}=@本币币种#);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_期货持仓查询明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_FutuHolder_QryDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_FutuHolder_QryDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_期货保证金分析
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Futu_QryDeposit;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Futu_QryDeposit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_期货持仓产品持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_FutuHolder_Pd_Holder;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_FutuHolder_Pd_Holder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_product_id bigint,
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code varchar(6),
    IN p_futu_acco varchar(16),
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
    declare v_co_no int;
    declare v_product_id bigint;
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code varchar(6);
    declare v_futu_acco varchar(16);
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
    SET v_co_no = p_co_no;
    SET v_product_id = p_product_id;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code = p_contrc_code;
    SET v_futu_acco = p_futu_acco;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_期货持仓产品持仓明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_FutuHolder_Pd_HolderDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_FutuHolder_Pd_HolderDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_product_id bigint,
    IN p_part_code varchar(6),
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_type int,
    IN p_futu_acco varchar(16),
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
    declare v_co_no int;
    declare v_product_id bigint;
    declare v_part_code varchar(6);
    declare v_exch_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_futu_acco varchar(16);
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
    SET v_co_no = p_co_no;
    SET v_product_id = p_product_id;
    SET v_part_code = p_part_code;
    SET v_exch_no = p_exch_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_type = p_contrc_type;
    SET v_futu_acco = p_futu_acco;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品风险指标
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_pd_RiskIndex;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_pd_RiskIndex(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_pd_no int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_pd_no int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品归因效应
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_pd_Attr_Effect;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_pd_Attr_Effect(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_pd_no int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_pd_no int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品区间交易统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_pd_Trade_Stat;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_pd_Trade_Stat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_pd_no int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_pd_no int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品债券月度持仓统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_pd_bond_Month_Holder_Stat;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_pd_bond_Month_Holder_Stat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_bond_code varchar(6),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_bond_code varchar(6);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_pd_no = p_pd_no;
    SET v_exch_no = p_exch_no;
    SET v_bond_code = p_bond_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @指定行数# = IF(@指定行数# = -1,99999999,@指定行数# ); */
    set v_row_count = IF(v_row_count = -1,99999999,v_row_count );
    # part1: 临时表-开始结束日期
    drop table if EXISTS tmp_pd_qry_date;

    /* CREATE TEMPORARY TABLE tmp_pd_qry_date as SELECT t.co_no,t.pd_no,MIN(t.init_date) as begin_date,MAX(t.init_date) as end_date,count(distinct t.init_date) as trade_days from v_dt_bond_holder t 
where t.co_no = @操作员机构编号# */
    CREATE TEMPORARY TABLE tmp_pd_qry_date as SELECT t.co_no,t.pd_no,MIN(t.init_date) as begin_date,MAX(t.init_date) as end_date,count(distinct t.init_date) as trade_days from v_dt_bond_holder t 
    where t.co_no = v_opor_co_no

     /* and ({初始化日期}>=@开始日期#)  and ({初始化日期}<=@结束日期#)
 and (@产品编号# = 0 or {产品编号}=@产品编号#) */
     and (init_date>=v_begin_date)  and (init_date<=v_end_date)
      and (v_pd_no = 0 or pd_no=v_pd_no)
    GROUP BY t.co_no,t.pd_no;
    # part2: 根据”开始日期“与”结束日期“查询债券信息
    select t.*,q.trade_days from v_rpt_pd_bond_month_holder_stat  t join tmp_pd_qry_date q on (t.co_no,t.pd_no,t.begin_date,t.end_date) = (q.co_no,q.pd_no,q.begin_date,q.end_date)

    /* where (@市场编号# = 0 or {市场编号}=@市场编号#)  and (@债券代码# = " " or {债券代码}=@债券代码#) */
    where (v_exch_no = 0 or exch_no=v_exch_no)  and (v_bond_code = " " or bond_code=v_bond_code)

     /* and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号} limit @指定行数#; */
     and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品债券月度交易明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_pd_bond_Month_Trade_Detail;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_pd_bond_Month_Trade_Detail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_bond_code varchar(6),
    IN p_bond_type int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_bond_code varchar(6);
    declare v_bond_type int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_pd_no = p_pd_no;
    SET v_exch_no = p_exch_no;
    SET v_bond_code = p_bond_code;
    SET v_bond_type = p_bond_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @指定行数# = IF(@指定行数# = -1,99999999,@指定行数# ); */
    set v_row_count = IF(v_row_count = -1,99999999,v_row_count );
    # part1: 查询债券信息

    /* select * from v_rpt_bond_detail_trade t where t.co_no = @操作员机构编号# */
    select * from v_rpt_bond_detail_trade t where t.co_no = v_opor_co_no

     /* and ({初始化日期}>=@开始日期#)  and ({初始化日期}<=@结束日期#)
 and (@产品编号# = 0 or {产品编号}=@产品编号#)
 and (@市场编号# = 0 or {市场编号}=@市场编号#)
 and (@债券代码# = " " or {债券代码}=@债券代码#) */
     and (init_date>=v_begin_date)  and (init_date<=v_end_date)
      and (v_pd_no = 0 or pd_no=v_pd_no)
      and (v_exch_no = 0 or exch_no=v_exch_no)
      and (v_bond_code = " " or bond_code=v_bond_code)

     /* and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号} limit @指定行数#; */
     and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品债券月度交易汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_pd_bond_Month_Trade_Stat;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_pd_bond_Month_Trade_Stat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_bond_code varchar(6),
    IN p_bond_type int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_bond_code varchar(6);
    declare v_bond_type int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_pd_no = p_pd_no;
    SET v_exch_no = p_exch_no;
    SET v_bond_code = p_bond_code;
    SET v_bond_type = p_bond_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @指定行数# = IF(@指定行数# = -1,99999999,@指定行数# ); */
    set v_row_count = IF(v_row_count = -1,99999999,v_row_count );
    # part1: 查询债券月度交易_汇总

    /* select * from v_rpt_bond_stat_trade t where t.co_no = @操作员机构编号# */
    select * from v_rpt_bond_stat_trade t where t.co_no = v_opor_co_no

     /* and ({初始化日期}>=@开始日期#)  and ({初始化日期}<=@结束日期#)
 and (@产品编号# = 0 or {产品编号}=@产品编号#)
 and (@债券代码# = " " or {债券代码}=@债券代码#) */
     and (init_date>=v_begin_date)  and (init_date<=v_end_date)
      and (v_pd_no = 0 or pd_no=v_pd_no)
      and (v_bond_code = " " or bond_code=v_bond_code)

     /* and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号} limit @指定行数#; */
     and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品债券月度资产统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_pd_bond_Month_Asset_Stat;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_pd_bond_Month_Asset_Stat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_pd_no int,
    IN p_crncy_type varchar(3),
    IN p_achi_compa_crite int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_pd_no int;
    declare v_crncy_type varchar(3);
    declare v_achi_compa_crite int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_pd_no = p_pd_no;
    SET v_crncy_type = p_crncy_type;
    SET v_achi_compa_crite = p_achi_compa_crite;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # part1: 查询债券_月度_资产统计

    /* select * from v_rpt_bond_asset_type t where t.co_no = @操作员机构编号# */
    select * from v_rpt_bond_asset_type t where t.co_no = v_opor_co_no

     /* and ({初始化日期}>=@开始日期#)  and ({初始化日期}<=@结束日期#)
 and (@产品编号# = 0 or {产品编号}=@产品编号#) 
 and (@本币币种# = "CNY" or {本币币种}=@本币币种#)
 and (@业绩比较基准# = 0 or {业绩比较基准}=@业绩比较基准#);
 */
     and (init_date>=v_begin_date)  and (init_date<=v_end_date)
      and (v_pd_no = 0 or pd_no=v_pd_no) 
      and (v_crncy_type = "CNY" or crncy_type=v_crncy_type)
      and (v_achi_compa_crite = 0 or achi_compa_crite=v_achi_compa_crite);
     
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品持仓明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_Pd_Holder_Detail;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_Pd_Holder_Detail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
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
    declare v_pd_no int;
    declare v_input_date int;
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
    SET v_input_date = p_input_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # part1: 查询持仓明细

    /* select * from v_rpt_pd_holder_detail t where t.co_no = @操作员机构编号# */
    select * from v_rpt_pd_holder_detail t where t.co_no = v_opor_co_no

     /* and (@产品编号# = 0 or {产品编号}=@产品编号#) and {初始化日期} = @传入日期# ;
 */
     and (v_pd_no = 0 or pd_no=v_pd_no) and init_date = v_input_date ;
     
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品交易明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_Pd_Trade_Detail;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_Pd_Trade_Detail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
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
    declare v_pd_no int;
    declare v_input_date int;
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
    SET v_input_date = p_input_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # part1: 查询持仓明细

    /* select * from v_rpt_pd_holder_detail t where t.co_no = @操作员机构编号# */
    select * from v_rpt_pd_holder_detail t where t.co_no = v_opor_co_no

     /* and (@产品编号# = 0 or {产品编号}=@产品编号#) and {初始化日期} = @传入日期# ;
 */
     and (v_pd_no = 0 or pd_no=v_pd_no) and init_date = v_input_date ;
     
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品交易汇总方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_Pd_Trade_Sum_Dir;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_Pd_Trade_Sum_Dir(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
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
    declare v_pd_no int;
    declare v_input_date int;
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
    SET v_input_date = p_input_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # part1: 查询持仓明细

    /* select * from v_rpt_pd_holder_detail t where t.co_no = @操作员机构编号# */
    select * from v_rpt_pd_holder_detail t where t.co_no = v_opor_co_no

     /* and (@产品编号# = 0 or {产品编号}=@产品编号#) and {初始化日期} = @传入日期# ;
 */
     and (v_pd_no = 0 or pd_no=v_pd_no) and init_date = v_input_date ;
     
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品交易汇总证券机构
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_Pd_Trade_Sum_Stock_Co;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_Pd_Trade_Sum_Stock_Co(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
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
    declare v_pd_no int;
    declare v_input_date int;
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
    SET v_input_date = p_input_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # part1: 查询持仓明细

    /* select * from v_rpt_pd_holder_detail t where t.co_no = @操作员机构编号# */
    select * from v_rpt_pd_holder_detail t where t.co_no = v_opor_co_no

     /* and (@产品编号# = 0 or {产品编号}=@产品编号#) and {初始化日期} = @传入日期# ;
 */
     and (v_pd_no = 0 or pd_no=v_pd_no) and init_date = v_input_date ;
     
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品持仓汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_Pd_Holder_Sum;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_Pd_Holder_Sum(
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
    
    #part1:查询产品的证券汇总
    SELECT t.*,ifnull(o.today_buy_qty,0) as today_buy_qty,ifnull(o.today_buy_amt,0) as today_buy_amt,ifnull(o.today_sell_qty,0) as today_sell_qty,ifnull(o.today_sell_amt,0) as today_sell_amt
     from v_rpt_pd_holder_sum t left join v_rpt_pd_holder_sum_order o on (t.co_no,t.pd_no,t.exch_no,t.stock_code) = (o.co_no,o.pd_no,o.exch_no,o.stock_code)

    /* where t.co_no = @操作员机构编号# and (@产品编号# = 0 or t.{产品编号}=@产品编号#) ; */
    where t.co_no = v_opor_co_no and (v_pd_no = 0 or t.pd_no=v_pd_no) ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询机构持仓汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_Co_Holder_Sum;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_Co_Holder_Sum(
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
    declare v_nav_asset decimal(18,4);

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
    SET v_nav_asset = 0;

    
    label_pro:BEGIN
    
    #step1:查询机构的“总净值”

    /* SELECT SUM(t.nav_asset) into @净资产# from tb_rpt_productasset t where t.co_no = @操作员机构编号#  ; */
    SELECT SUM(t.nav_asset) into v_nav_asset from tb_rpt_productasset t where t.co_no = v_opor_co_no  ;
    #step2:查询产品的证券汇总

    /* SELECT
 t.*, ifnull(posi_market_value/@净资产#,0) as posi_nav_ratio,
ifnull(o.today_buy_qty,0) as today_buy_qty,ifnull(o.today_buy_amt,0) as today_buy_amt,ifnull(o.today_sell_qty,0) as today_sell_qty,ifnull(o.today_sell_amt,0) as today_sell_amt
 from v_rpt_co_holder_sum t left join v_rpt_co_holder_sum_order o on (t.co_no,t.exch_no,t.stock_code) = (o.co_no,o.exch_no,o.stock_code) */
    SELECT
     t.*, ifnull(posi_market_value/v_nav_asset,0) as posi_nav_ratio,
    ifnull(o.today_buy_qty,0) as today_buy_qty,ifnull(o.today_buy_amt,0) as today_buy_amt,ifnull(o.today_sell_qty,0) as today_sell_qty,ifnull(o.today_sell_amt,0) as today_sell_amt
     from v_rpt_co_holder_sum t left join v_rpt_co_holder_sum_order o on (t.co_no,t.exch_no,t.stock_code) = (o.co_no,o.exch_no,o.stock_code)

    /* where t.co_no = @操作员机构编号# ; */
    where t.co_no = v_opor_co_no ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品持仓交易汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_Pd_Holder_Trade_Sum;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_Pd_Holder_Trade_Sum(
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
    
    #step1:查询产品持仓交易汇总
    SELECT 
     t.pd_no as pd_no,/*产品编号*/
     t.pd_code as pd_code,/*产品编码*/
     t.pd_name as pd_name,/*产品名称*/
     t.exch_no as exch_no,/*市场编号*/
     t.stock_code as stock_code,/*证券代码*/
     t.stock_name as stock_name,/*证券名称*/
     t.stock_type as stock_type,/*证券类型*/
     0 as pre_holding_qty,/*昨日持仓数量*/
     t.curr_qty as posi_qty,/*持仓数量*/
     t.today_close_price as today_close_price,/*今收盘价*/
     t.stock_asset_value as posi_market_value,/*持仓市值*/
     o.today_buy_qty as today_buy_qty,/*当日买入数量*/
     o.today_buy_amt as today_buy_amt,/*当日买入金额*/
     o.today_buy_price as today_buy_price,/*当日买入价格*/
     o.buy_begin_time as buy_begin_time,/*买入开始时间*/
     o.buy_end_time as buy_end_time,/*买入结束时间*/
     o.today_sell_qty as today_sell_qty,/*当日卖出数量*/
     o.today_sell_amt as today_sell_amt,/*当日卖出金额*/
     o.today_sell_price as today_sell_price,/*当日卖出价格*/
     o.sell_begin_time as sell_begin_time,/*卖出开始时间*/
     o.sell_end_time as sell_end_time/*卖出结束时间*/
     from v_cur_pd_holder_value t left join v_rpt_pd_order_sum_cur o on (t.co_no,t.pd_no,t.exch_no,t.stock_code) = (o.co_no,t.pd_no,o.exch_no,o.stock_code)

    /* where t.co_no = @操作员机构编号# and (@产品编号# = 0 or t.{产品编号}=@产品编号#); */
    where t.co_no = v_opor_co_no and (v_pd_no = 0 or t.pd_no=v_pd_no);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询交易组资产持仓附加属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_Exgp_Asset_Posi_ExInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_Exgp_Asset_Posi_ExInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_strategy_type int,
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
    declare v_exch_group_no int;
    declare v_strategy_type int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_strategy_type = p_strategy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # set @策略类型# = ifnull(@策略类型#,0);
    # [获取表全记录][视图_逻辑_交易组_资产_附加信息][字段][({机构编号}=@操作员机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and  (@策略类型#=0 or ifnull({策略类型},0)=@策略类型#) order by {策略类型},{产品编号},{交易组编号} ]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询机构证券持仓成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_Co_Stock_Posi_Strike;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_Co_Stock_Posi_Strike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # [左关联查询][视图_汇总_机构_证券_持仓][视图_汇总_机构_证券_成交][t.{初始化日期},t.{证券代码编号},t.{机构编号},t.{持仓市值},a.{成交金额}][(t.{机构编号},t.{证券代码编号}) = (a.{机构编号},a.{证券代码编号})][(t.{机构编号}=@操作员机构编号#) and (@证券代码编号# = 0 or t.{证券代码编号} = @证券代码编号#) and (t.{持仓市值} <> 0 or a.{成交金额} <> 0) order by {持仓市值} desc ]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询交易组证券持仓明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_Exgp_Stock_Posi_Detail;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_Exgp_Stock_Posi_Detail(
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
    declare v_pd_no int;
    declare v_co_no int;
    declare v_exch_group_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # [左关联查询][视图_数据_交易组_持仓][报表_报表数据_视图交易组资金资产][t.{初始化日期},t.{产品编号},t.{机构编号},t.{交易组编号},t.{证券代码编号},t.{持仓市值},(t.{持仓市值} - t.{成本金额}) as {浮动盈亏},t.{当前数量},t.{成本金额},t.{实现盈亏},(t.{持仓市值} / t.{当前数量}) as {成本价},t.{最新价},t.{持仓市值}/a.{净资产} as {持股比例}][(t.{机构编号},t.{产品编号},t.{交易组编号}) = (a.{机构编号},a.{产品编号},a.{交易组编号})][(t.{当前数量} <> 0) and (t.{机构编号}=@操作员机构编号#) and (@产品编号#=0 or t.{产品编号}=@产品编号#) and (@交易组编号#=0 or t.{交易组编号}=@交易组编号#) and (@证券代码编号# = 0 or t.{证券代码编号} = @证券代码编号#) order by {产品编号},{交易组编号}]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询交易组持仓区间盈亏
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_exgp_posi_value_inter_pl;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_exgp_posi_value_inter_pl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_stock_code_no int,
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_stock_code_no int;
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select * from ~报表_报表数据_统计交易组区间持仓盈亏^ t */
    select * from db_rpts.tb_rpt_stat_exgp_posi_value_inter_pl t

    /* where (t.{机构编号} = @操作员机构编号#) and (@产品编号#=0 or t.{产品编号}=@产品编号#) */
    where (t.co_no = v_opor_co_no) and (v_pd_no=0 or t.pd_no=v_pd_no)

    /* and (@交易组编号#=0 or t.{交易组编号}=@交易组编号#) */
    and (v_exch_group_no=0 or t.exch_group_no=v_exch_group_no)

    /* and  ({查询开始日期} = @查询开始日期# and {查询结束日期} = @查询结束日期#) */
    and  (qry_begin_date = v_qry_begin_date and qry_end_date = v_qry_end_date)

    /* and  (@证券代码编号#=0 or t.{证券代码编号}=@证券代码编号#) */
    and  (v_stock_code_no=0 or t.stock_code_no=v_stock_code_no)

    /* and  (@证券类型#=0 or t.{证券类型}=@证券类型#) */
    and  (v_stock_type=0 or t.stock_type=v_stock_type)

    /* and  (@资产类型#=0 or t.{资产类型}=@资产类型#) */
    and  (v_asset_type=0 or t.asset_type=v_asset_type)
    ;
    if (FOUND_ROWS() = 0) then

    /* insert into ~报表_报表数据_统计交易组区间持仓盈亏^ */
    insert into db_rpts.tb_rpt_stat_exgp_posi_value_inter_pl

     /* select @查询开始日期# as {查询开始日期},@查询结束日期# as {查询结束日期}, */
     select v_qry_begin_date as qry_begin_date,v_qry_end_date as qry_end_date,

    /* x.{开始日期} as {开始日期},x.{结束日期} as {结束日期}, */
    x.begin_date as begin_date,x.end_date as end_date,

    /* t.{机构编号},t.{产品编号},t.{交易组编号},t.{证券代码编号},t.{证券类型},t.{资产类型}, */
    t.co_no,t.pd_no,t.exch_group_no,t.stock_code_no,t.stock_type,t.asset_type,

    /* sum(if(t.{初始化日期} = x.{开始日期},ifnull(t.{最新价},0),0)) as {期初收盘价}, */
    sum(if(t.init_date = x.begin_date,ifnull(t.last_price,0),0)) as begin_close_price,

    /* sum(if(t.{初始化日期} = x.{开始日期},ifnull(t.{当前数量},0),0)) as {期初数量}, */
    sum(if(t.init_date = x.begin_date,ifnull(t.curr_qty,0),0)) as begin_qty,

    /* sum(if(t.{初始化日期} = x.{开始日期},ifnull(t.{成本金额},0),0)) as {期初成本}, */
    sum(if(t.init_date = x.begin_date,ifnull(t.cost_amt,0),0)) as begin_cost_amt,

    /* sum(if(t.{初始化日期} = x.{开始日期},ifnull(t.{持仓市值},0),0)) as {期初持仓市值}, */
    sum(if(t.init_date = x.begin_date,ifnull(t.posi_market_value,0),0)) as begin_posi_market_value,

    /* sum(if(t.{初始化日期} = x.{开始日期},ifnull(t.{实现盈亏},0),0)) as {期初实现盈亏}, */
    sum(if(t.init_date = x.begin_date,ifnull(t.realize_pandl,0),0)) as begin_realize_pandl,

    /* sum(if(t.{初始化日期} = x.{结束日期},ifnull(t.{最新价},0),0)) as {期末收盘价}, */
    sum(if(t.init_date = x.end_date,ifnull(t.last_price,0),0)) as end_close_price,

    /* sum(if(t.{初始化日期} = x.{结束日期},ifnull(t.{当前数量},0),0)) as {期末数量}, */
    sum(if(t.init_date = x.end_date,ifnull(t.curr_qty,0),0)) as end_cur_qty,

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

    /* sum(if(t.{初始化日期} = x.{结束日期},1,-1)*(ifnull(t.{持仓市值},0)-ifnull(t.{成本金额},0)+ifnull(t.{实现盈亏},0))) as {区间盈亏} */
    sum(if(t.init_date = x.end_date,1,-1)*(ifnull(t.posi_market_value,0)-ifnull(t.cost_amt,0)+ifnull(t.realize_pandl,0))) as interval_pandl

    /* from ~报表_报表数据_视图数据交易组持仓历史^  t */
    from db_rpts.vi_dt_exgp_posi_value_his  t

    /* join (select x.{机构编号},x.{产品编号},x.{交易组编号},x.{证券代码编号},@查询开始日期# as {开始日期},max(x.{初始化日期}) as {结束日期},sum(if(ifnull(x.{当前数量},0)>0,1,0)) as {有效记录数} */
    join (select x.co_no,x.pd_no,x.exch_group_no,x.stock_code_no,v_qry_begin_date as begin_date,max(x.init_date) as end_date,sum(if(ifnull(x.curr_qty,0)>0,1,0)) as valid_cnt

    /* from ~报表_报表数据_视图数据交易组持仓历史^ x where x.{初始化日期} between @查询开始日期# and @查询结束日期# */
    from db_rpts.vi_dt_exgp_posi_value_his x where x.init_date between v_qry_begin_date and v_qry_end_date

    /* and (x.{机构编号} = @操作员机构编号#) and (@产品编号#=0 or x.{产品编号}=@产品编号#) and (@交易组编号#=0 or x.{交易组编号}=@交易组编号#) */
    and (x.co_no = v_opor_co_no) and (v_pd_no=0 or x.pd_no=v_pd_no) and (v_exch_group_no=0 or x.exch_group_no=v_exch_group_no)

    /* group by x.{机构编号},x.{产品编号},x.{交易组编号},x.{证券代码编号} */
    group by x.co_no,x.pd_no,x.exch_group_no,x.stock_code_no

     /* ) x on (t.{机构编号},t.{产品编号},t.{交易组编号},t.{证券代码编号}) = (x.{机构编号},x.{产品编号},x.{交易组编号},x.{证券代码编号}) and t.{初始化日期} in (x.{开始日期},x.{结束日期}) */
     ) x on (t.co_no,t.pd_no,t.exch_group_no,t.stock_code_no) = (x.co_no,x.pd_no,x.exch_group_no,x.stock_code_no) and t.init_date in (x.begin_date,x.end_date)

    /* where (x.{有效记录数} > 0) */
    where (x.valid_cnt > 0)

    /* and (t.{机构编号} = @操作员机构编号#) and (@产品编号#=0 or t.{产品编号}=@产品编号#) and (@交易组编号#=0 or t.{交易组编号}=@交易组编号#) */
    and (t.co_no = v_opor_co_no) and (v_pd_no=0 or t.pd_no=v_pd_no) and (v_exch_group_no=0 or t.exch_group_no=v_exch_group_no)

    /* and  (@证券代码编号#=0 or t.{证券代码编号}=@证券代码编号#) */
    and  (v_stock_code_no=0 or t.stock_code_no=v_stock_code_no)

    /* and  (@证券类型#=0 or t.{证券类型}=@证券类型#) */
    and  (v_stock_type=0 or t.stock_type=v_stock_type)

    /* and  (@资产类型#=0 or t.{资产类型}=@资产类型#) */
    and  (v_asset_type=0 or t.asset_type=v_asset_type)

    /* GROUP BY  t.{机构编号},t.{产品编号},t.{交易组编号},t.{证券代码编号} */
    GROUP BY  t.co_no,t.pd_no,t.exch_group_no,t.stock_code_no

     /* order by {产品编号},{交易组编号},{证券代码编号}; */
     order by pd_no,exch_group_no,stock_code_no;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询交易组持仓区间盈亏行业
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_exgp_posi_value_inter_pl_industry;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_exgp_posi_value_inter_pl_industry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_stock_code_no int,
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_sum_type int,
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
    declare v_exch_group_no int;
    declare v_stock_code_no int;
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_sum_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_str text;
    declare v_grp_fields varchar(1024);
    declare v_exe_sql_str varchar(10000);

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
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_sum_type = p_sum_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_str = " ";
    SET v_grp_fields = " ";
    SET v_exe_sql_str = " ";

    
    label_pro:BEGIN
    

    /* set @查询语句# = " "; */
    set v_query_str = " ";
    #step1:建立临时表[临时表_交易组_持仓_区间盈亏]=tmp_exgp_posi_value_inter_pl
    drop table if EXISTS tmp_exgp_posi_value_inter_pl;
    create temporary table tmp_exgp_posi_value_inter_pl
     select

    /* x.{开始日期} as {开始日期},x.{结束日期} as {结束日期}, */
    x.begin_date as begin_date,x.end_date as end_date,

    /* t.{机构编号},t.{产品编号},t.{交易组编号},t.{证券代码编号}, */
    t.co_no,t.pd_no,t.exch_group_no,t.stock_code_no,

    /* sum(if(t.{初始化日期} = x.{开始日期},ifnull(t.{最新价},0),0)) as {期初收盘价}, */
    sum(if(t.init_date = x.begin_date,ifnull(t.last_price,0),0)) as begin_close_price,

    /* sum(if(t.{初始化日期} = x.{开始日期},ifnull(t.{当前数量},0),0)) as {期初数量}, */
    sum(if(t.init_date = x.begin_date,ifnull(t.curr_qty,0),0)) as begin_qty,

    /* sum(if(t.{初始化日期} = x.{开始日期},ifnull(t.{成本金额},0),0)) as {期初成本}, */
    sum(if(t.init_date = x.begin_date,ifnull(t.cost_amt,0),0)) as begin_cost_amt,

    /* sum(if(t.{初始化日期} = x.{开始日期},ifnull(t.{持仓市值},0),0)) as {期初持仓市值}, */
    sum(if(t.init_date = x.begin_date,ifnull(t.posi_market_value,0),0)) as begin_posi_market_value,

    /* sum(if(t.{初始化日期} = x.{开始日期},ifnull(t.{实现盈亏},0),0)) as {期初实现盈亏}, */
    sum(if(t.init_date = x.begin_date,ifnull(t.realize_pandl,0),0)) as begin_realize_pandl,

    /* sum(if(t.{初始化日期} = x.{结束日期},ifnull(t.{最新价},0),0)) as {期末收盘价}, */
    sum(if(t.init_date = x.end_date,ifnull(t.last_price,0),0)) as end_close_price,

    /* sum(if(t.{初始化日期} = x.{结束日期},ifnull(t.{当前数量},0),0)) as {期末数量}, */
    sum(if(t.init_date = x.end_date,ifnull(t.curr_qty,0),0)) as end_cur_qty,

    /* sum(if(t.{初始化日期} = x.{结束日期},ifnull(t.{成本金额},0),0)) as {期末成本}, */
    sum(if(t.init_date = x.end_date,ifnull(t.cost_amt,0),0)) as end_cost_amt,

    /* sum(if(t.{初始化日期} = x.{结束日期},ifnull(t.{持仓市值},0),0)) as {期末持仓市值}, */
    sum(if(t.init_date = x.end_date,ifnull(t.posi_market_value,0),0)) as end_posi_market_value,

    /* sum(if(t.{初始化日期} = x.{结束日期},ifnull(t.{实现盈亏},0),0)) as {期末实现盈亏}, */
    sum(if(t.init_date = x.end_date,ifnull(t.realize_pandl,0),0)) as end_realize_pandl,

    /* sum(if(t.{初始化日期} = x.{结束日期},1,-1)*(ifnull(t.{持仓市值},0))) as {浮动盈亏}, */
    sum(if(t.init_date = x.end_date,1,-1)*(ifnull(t.posi_market_value,0))) as float_pandl,

    /* sum(if(t.{初始化日期} = x.{结束日期},1,-1)*(ifnull(t.{实现盈亏},0))) as {区间实现盈亏}, */
    sum(if(t.init_date = x.end_date,1,-1)*(ifnull(t.realize_pandl,0))) as interval_realize_pandl,

    /* sum(if(t.{初始化日期} = x.{结束日期},1,-1)*(ifnull(t.{持仓市值},0)+ifnull(t.{实现盈亏},0))) as {区间盈亏} */
    sum(if(t.init_date = x.end_date,1,-1)*(ifnull(t.posi_market_value,0)+ifnull(t.realize_pandl,0))) as interval_pandl

    /* from ~报表_报表数据_视图数据交易组持仓历史^ t */
    from db_rpts.vi_dt_exgp_posi_value_his t

    /* join (select x.{机构编号},x.{产品编号},x.{交易组编号},x.{证券代码编号},min(x.{初始化日期}) as {开始日期},max(x.{初始化日期}) as {结束日期},sum(if(ifnull(x.{当前数量},0)>0,1,0)) as {有效记录数} */
    join (select x.co_no,x.pd_no,x.exch_group_no,x.stock_code_no,min(x.init_date) as begin_date,max(x.init_date) as end_date,sum(if(ifnull(x.curr_qty,0)>0,1,0)) as valid_cnt

    /* from ~报表_报表数据_视图数据交易组持仓历史^ x where x.{初始化日期} between @查询开始日期# and @查询结束日期# */
    from db_rpts.vi_dt_exgp_posi_value_his x where x.init_date between v_qry_begin_date and v_qry_end_date

    /* and (x.{机构编号} = @操作员机构编号#) and (@产品编号#=0 or x.{产品编号}=@产品编号#) and (@交易组编号#=0 or x.{交易组编号}=@交易组编号#) */
    and (x.co_no = v_opor_co_no) and (v_pd_no=0 or x.pd_no=v_pd_no) and (v_exch_group_no=0 or x.exch_group_no=v_exch_group_no)

    /* group by x.{机构编号},x.{产品编号},x.{交易组编号},x.{证券代码编号} */
    group by x.co_no,x.pd_no,x.exch_group_no,x.stock_code_no

     /* ) x on (t.{机构编号},t.{产品编号},t.{交易组编号},t.{证券代码编号}) = (x.{机构编号},x.{产品编号},x.{交易组编号},x.{证券代码编号}) and t.{初始化日期} in (x.{开始日期},x.{结束日期}) */
     ) x on (t.co_no,t.pd_no,t.exch_group_no,t.stock_code_no) = (x.co_no,x.pd_no,x.exch_group_no,x.stock_code_no) and t.init_date in (x.begin_date,x.end_date)

    /* where (x.{有效记录数} > 0) */
    where (x.valid_cnt > 0)

    /* and (t.{机构编号} = @操作员机构编号#) and (@产品编号#=0 or t.{产品编号}=@产品编号#) and (@交易组编号#=0 or t.{交易组编号}=@交易组编号#) */
    and (t.co_no = v_opor_co_no) and (v_pd_no=0 or t.pd_no=v_pd_no) and (v_exch_group_no=0 or t.exch_group_no=v_exch_group_no)

    /* and  (@证券代码编号#=0 or t.{证券代码编号}=@证券代码编号#) */
    and  (v_stock_code_no=0 or t.stock_code_no=v_stock_code_no)

    /* GROUP BY  t.{机构编号},t.{产品编号},t.{交易组编号},t.{证券代码编号}; */
    GROUP BY  t.co_no,t.pd_no,t.exch_group_no,t.stock_code_no;

    /* set @查询语句# = concat(ifnull(@查询语句#,""),", sum(ifnull(t.{期初成本},0)) as {期初成本},
sum(ifnull(t.{期初持仓市值},0)) as {期初持仓市值},
sum(ifnull(t.{期初实现盈亏},0)) as {期初实现盈亏},
sum(ifnull(t.{期末成本},0)) as {期末成本},
sum(ifnull(t.{期末持仓市值},0)) as {期末持仓市值},
sum(ifnull(t.{期末实现盈亏},0)) as {期末实现盈亏},
sum(ifnull(t.{浮动盈亏},0)) as {浮动盈亏},
sum(ifnull(t.{区间实现盈亏},0)) as {区间实现盈亏},
sum(ifnull(t.{区间盈亏},0)) as {区间盈亏}"); */
    set v_query_str = concat(ifnull(v_query_str,""),", sum(ifnull(t.begin_cost_amt,0)) as begin_cost_amt,
    sum(ifnull(t.begin_posi_market_value,0)) as begin_posi_market_value,
    sum(ifnull(t.begin_realize_pandl,0)) as begin_realize_pandl,
    sum(ifnull(t.end_cost_amt,0)) as end_cost_amt,
    sum(ifnull(t.end_posi_market_value,0)) as end_posi_market_value,
    sum(ifnull(t.end_realize_pandl,0)) as end_realize_pandl,
    sum(ifnull(t.float_pandl,0)) as float_pandl,
    sum(ifnull(t.interval_realize_pandl,0)) as interval_realize_pandl,
    sum(ifnull(t.interval_pandl,0)) as interval_pandl");

    /* set @查询语句# = concat(ifnull(@查询语句#,""),", round(sum(ifnull(t.{期末持仓市值},0))/b.{净资产},6) as {权重比例}"); */
    set v_query_str = concat(ifnull(v_query_str,""),", round(sum(ifnull(t.end_posi_market_value,0))/b.nav_asset,6) as weight_ratio");

    /* set @查询语句# = concat(ifnull(@查询语句#,"")," from tmp_exgp_posi_value_inter_pl t join  tb_sys_industry_stock a ON t.stock_code_no = a.stock_code_no "); */
    set v_query_str = concat(ifnull(v_query_str,"")," from tmp_exgp_posi_value_inter_pl t join  tb_sys_industry_stock a ON t.stock_code_no = a.stock_code_no ");
    # set @查询语句# = concat(ifnull(@查询语句#,"")," join ~报表_报表数据_视图交易组资金资产^ b on (t.{机构编号},t.{产品编号},t.{交易组编号}) =  (b.{机构编号},b.{产品编号},b.{交易组编号})");

    /* set @汇总分组字段# = ",t.{机构编号},t.{产品编号},t.{交易组编号}"; */
    set v_grp_fields = ",t.co_no,t.pd_no,t.exch_group_no";

    /* if @汇总方式# = 2 then */
    if v_sum_type = 2 then

    /* set @汇总分组字段# = concat("a.second_industry_code,a.second_industry_name",@汇总分组字段#); */
    set v_grp_fields = concat("a.second_industry_code,a.second_industry_name",v_grp_fields);

    /* elseif @汇总方式# = 3 then */
    elseif v_sum_type = 3 then

    /* set @汇总分组字段# = concat("a.third_industry_code,a.third_industry_name",@汇总分组字段#); */
    set v_grp_fields = concat("a.third_industry_code,a.third_industry_name",v_grp_fields);

    /* elseif @汇总方式# = 4 then */
    elseif v_sum_type = 4 then

    /* set @汇总分组字段# = concat("a.fourth_industry_code,a.fourth_industry_name",@汇总分组字段#); */
    set v_grp_fields = concat("a.fourth_industry_code,a.fourth_industry_name",v_grp_fields);
    else

    /* set @汇总分组字段# = concat("a.first_industry_code,a.first_industry_name",@汇总分组字段#); */
    set v_grp_fields = concat("a.first_industry_code,a.first_industry_name",v_grp_fields);
    end if;

    /* set @执行语句#= concat("select ",@汇总分组字段#, @查询语句#," group by ",@汇总分组字段#); */
    set v_exe_sql_str= concat("select ",v_grp_fields, v_query_str," group by ",v_grp_fields);

    /* [执行语句][@执行语句#] */
    set @tmp_sql = v_exe_sql_str;
    PREPARE stmt from @tmp_sql;
    EXECUTE stmt;
    set @tmp_sql = '';
    DEALLOCATE PREPARE stmt;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询产品持仓区间盈亏
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_Pd_posi_value_inter_pl;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_Pd_posi_value_inter_pl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_stock_code_no int,
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
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
    declare v_pd_no int;
    declare v_stock_code_no int;
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select * from ~报表_报表数据_统计产品月盈亏^ t */
    select * from db_rpts.tb_rpt_stat_month_pd_posi t

    /* where (t.{机构编号} = @操作员机构编号#) and (@产品编号#=0 or t.{产品编号}=@产品编号#) */
    where (t.co_no = v_opor_co_no) and (v_pd_no=0 or t.pd_no=v_pd_no)

    /* and  ({查询开始日期} = @查询开始日期# and {查询结束日期} = @查询结束日期#) */
    and  (qry_begin_date = v_qry_begin_date and qry_end_date = v_qry_end_date)

    /* and  (@证券代码编号#=0 or t.{证券代码编号}=@证券代码编号#) */
    and  (v_stock_code_no=0 or t.stock_code_no=v_stock_code_no)

    /* and  (@证券类型#=0 or t.{证券类型}=@证券类型#) */
    and  (v_stock_type=0 or t.stock_type=v_stock_type)

    /* and  (@资产类型#=0 or t.{资产类型}=@资产类型#) */
    and  (v_asset_type=0 or t.asset_type=v_asset_type)
    ;
    if (FOUND_ROWS() = 0) then

    /* insert into ~报表_报表数据_统计产品月盈亏^ */
    insert into db_rpts.tb_rpt_stat_month_pd_posi

    /* ({查询开始日期},{查询结束日期},{开始日期},{结束日期},{产品编号},{机构编号},{证券代码编号},{证券类型},{资产类型},{期初收盘价},{期初数量},{期初成本},{期初持仓市值},{期初实现盈亏},{期末收盘价},{期末数量},{期末成本},{期末持仓市值},{期末实现盈亏},{浮动盈亏},{区间实现盈亏},{区间盈亏},{最大持仓市值}) */
    (qry_begin_date,qry_end_date,begin_date,end_date,pd_no,co_no,stock_code_no,stock_type,asset_type,begin_close_price,begin_qty,begin_cost_amt,begin_posi_market_value,begin_realize_pandl,end_close_price,end_cur_qty,end_cost_amt,end_posi_market_value,end_realize_pandl,float_pandl,interval_realize_pandl,interval_pandl,max_posi_market_value)

     /* select @查询开始日期# as {查询开始日期},@查询结束日期# as {查询结束日期}, */
     select v_qry_begin_date as qry_begin_date,v_qry_end_date as qry_end_date,

    /* x.{开始日期} as {开始日期},x.{结束日期} as {结束日期}, */
    x.begin_date as begin_date,x.end_date as end_date,

    /* t.{产品编号},t.{机构编号},t.{证券代码编号},t.{证券类型},t.{资产类型}, */
    t.pd_no,t.co_no,t.stock_code_no,t.stock_type,t.asset_type,

    /* sum(if(t.{初始化日期} = x.{开始日期},ifnull(t.{最新价},0),0)) as {期初收盘价}, */
    sum(if(t.init_date = x.begin_date,ifnull(t.last_price,0),0)) as begin_close_price,

    /* sum(if(t.{初始化日期} = x.{开始日期},ifnull(t.{当前数量},0),0)) as {期初数量}, */
    sum(if(t.init_date = x.begin_date,ifnull(t.curr_qty,0),0)) as begin_qty,

    /* sum(if(t.{初始化日期} = x.{开始日期},ifnull(t.{成本金额},0),0)) as {期初成本}, */
    sum(if(t.init_date = x.begin_date,ifnull(t.cost_amt,0),0)) as begin_cost_amt,

    /* sum(if(t.{初始化日期} = x.{开始日期},ifnull(t.{持仓市值},0),0)) as {期初持仓市值}, */
    sum(if(t.init_date = x.begin_date,ifnull(t.posi_market_value,0),0)) as begin_posi_market_value,

    /* sum(if(t.{初始化日期} = x.{开始日期},ifnull(t.{实现盈亏},0),0)) as {期初实现盈亏}, */
    sum(if(t.init_date = x.begin_date,ifnull(t.realize_pandl,0),0)) as begin_realize_pandl,

    /* sum(if(t.{初始化日期} = x.{结束日期},ifnull(t.{最新价},0),0)) as {期末收盘价}, */
    sum(if(t.init_date = x.end_date,ifnull(t.last_price,0),0)) as end_close_price,

    /* sum(if(t.{初始化日期} = x.{结束日期},ifnull(t.{当前数量},0),0)) as {期末数量}, */
    sum(if(t.init_date = x.end_date,ifnull(t.curr_qty,0),0)) as end_cur_qty,

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
    #sum(if(t.{初始化日期} = x.{结束日期},1,-1)*(ifnull(t.{持仓市值},0)-ifnull(t.{成本金额},0)+ifnull(t.{实现盈亏},0))) as {区间盈亏},

    /* 0 as {区间盈亏}, */
    0 as interval_pandl,

    /* x.{最大持仓市值} */
    x.max_posi_market_value
    from tb_rpt_productholder_his  t

    /* join (select x.{机构编号},x.{产品编号},x.{证券代码编号},min(x.{初始化日期})as {开始日期},max(x.{初始化日期}) as {结束日期},sum(if(ifnull(x.{当前数量},0)>0,1,0)) as {有效记录数},max(x.{持仓市值}) as {最大持仓市值} */
    join (select x.co_no,x.pd_no,x.stock_code_no,min(x.init_date)as begin_date,max(x.init_date) as end_date,sum(if(ifnull(x.curr_qty,0)>0,1,0)) as valid_cnt,max(x.posi_market_value) as max_posi_market_value

    /* from tb_rpt_productholder_his x where x.{初始化日期} between @查询开始日期# and @查询结束日期# */
    from tb_rpt_productholder_his x where x.init_date between v_qry_begin_date and v_qry_end_date

    /* and (x.{机构编号} = @操作员机构编号#) and (@产品编号#=0 or x.{产品编号}=@产品编号#) */
    and (x.co_no = v_opor_co_no) and (v_pd_no=0 or x.pd_no=v_pd_no)

    /* group by x.{机构编号},x.{产品编号},x.{证券代码编号} */
    group by x.co_no,x.pd_no,x.stock_code_no

     /* ) x on (t.{机构编号},t.{产品编号},t.{证券代码编号}) = (x.{机构编号},x.{产品编号},x.{证券代码编号}) and t.{初始化日期} in (x.{开始日期},x.{结束日期}) */
     ) x on (t.co_no,t.pd_no,t.stock_code_no) = (x.co_no,x.pd_no,x.stock_code_no) and t.init_date in (x.begin_date,x.end_date)

    /* where (x.{有效记录数} > 0) */
    where (x.valid_cnt > 0)

    /* and (t.{机构编号} = @操作员机构编号#) and (@产品编号#=0 or t.{产品编号}=@产品编号#) */
    and (t.co_no = v_opor_co_no) and (v_pd_no=0 or t.pd_no=v_pd_no)

    /* and  (@证券代码编号#=0 or t.{证券代码编号}=@证券代码编号#) */
    and  (v_stock_code_no=0 or t.stock_code_no=v_stock_code_no)

    /* and  (@证券类型#=0 or t.{证券类型}=@证券类型#) */
    and  (v_stock_type=0 or t.stock_type=v_stock_type)

    /* and  (@资产类型#=0 or t.{资产类型}=@资产类型#) */
    and  (v_asset_type=0 or t.asset_type=v_asset_type)

    /* GROUP BY  t.{机构编号},t.{产品编号},t.{证券代码编号} */
    GROUP BY  t.co_no,t.pd_no,t.stock_code_no
    ;

    /* update ~报表_报表数据_统计产品月盈亏^ x */
    update db_rpts.tb_rpt_stat_month_pd_posi x
    join (

     /* select @查询开始日期# as {查询开始日期},@查询结束日期# as {查询结束日期}, */
     select v_qry_begin_date as qry_begin_date,v_qry_end_date as qry_end_date,

    /* t.{机构编号},t.{产品编号},t.{证券代码编号}, */
    t.co_no,t.pd_no,t.stock_code_no,

    /* SUM((case when t.{订单方向} = 1 then 1  else 0 end)*t.{成交金额}) as {买入金额}, */
    SUM((case when t.order_dir = 1 then 1  else 0 end)*t.strike_amt) as buy_amt,

    /* SUM((case when t.{订单方向} = 2 then 1  else 0 end)*t.{成交金额}) as {销售金额} */
    SUM((case when t.order_dir = 2 then 1  else 0 end)*t.strike_amt) as sell_amt

    /* from  ~报表_报表数据_报表汇总产品证券成交^ t */
    from  db_rpts.tb_rpt_sum_pd_stock_strike t

    /* where t.{初始化日期} between @查询开始日期# and @查询结束日期# */
    where t.init_date between v_qry_begin_date and v_qry_end_date

    /* and (t.{机构编号} = @操作员机构编号#) and (@产品编号#=0 or t.{产品编号}=@产品编号#) */
    and (t.co_no = v_opor_co_no) and (v_pd_no=0 or t.pd_no=v_pd_no)

    /* GROUP BY  t.{机构编号},t.{产品编号},t.{证券代码编号} */
    GROUP BY  t.co_no,t.pd_no,t.stock_code_no

    /* ) t on ( t.{机构编号},t.{产品编号},t.{证券代码编号},t.{查询开始日期},t.{查询结束日期}) = ( x.{机构编号},x.{产品编号},x.{证券代码编号},t.{查询开始日期},t.{查询结束日期}) */
    ) t on ( t.co_no,t.pd_no,t.stock_code_no,t.qry_begin_date,t.qry_end_date) = ( x.co_no,x.pd_no,x.stock_code_no,t.qry_begin_date,t.qry_end_date)

    /* set x.{区间盈亏} = (x.{期末持仓市值} - x.{期初持仓市值}) +  (t.{销售金额} - t.{买入金额}) */
    set x.interval_pandl = (x.end_posi_market_value - x.begin_posi_market_value) +  (t.sell_amt - t.buy_amt)
    ;

    /* select * from ~报表_报表数据_统计产品月盈亏^ t */
    select * from db_rpts.tb_rpt_stat_month_pd_posi t

    /* where (t.{机构编号} = @操作员机构编号#) and (@产品编号#=0 or t.{产品编号}=@产品编号#) */
    where (t.co_no = v_opor_co_no) and (v_pd_no=0 or t.pd_no=v_pd_no)

    /* and  ({查询开始日期} = @查询开始日期# and {查询结束日期} = @查询结束日期#) */
    and  (qry_begin_date = v_qry_begin_date and qry_end_date = v_qry_end_date)

    /* and  (@证券代码编号#=0 or t.{证券代码编号}=@证券代码编号#) */
    and  (v_stock_code_no=0 or t.stock_code_no=v_stock_code_no)

    /* and  (@证券类型#=0 or t.{证券类型}=@证券类型#) */
    and  (v_stock_type=0 or t.stock_type=v_stock_type)

    /* and  (@资产类型#=0 or t.{资产类型}=@资产类型#) */
    and  (v_asset_type=0 or t.asset_type=v_asset_type)
    ;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询平台产品夏普比率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_pf_pd_SharpeRatio;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_pf_pd_SharpeRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_stock_code_no int,
    IN p_risk_free_interest_rate decimal(18,12),
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_stock_code_no int;
    declare v_risk_free_interest_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_share_net_total decimal(18,4);
    declare v_annual_yield decimal(18,12);
    declare v_stat_days int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_tmp_share_net decimal(18,4);
    declare v_tmp_share_net_total decimal(18,4);
    declare v_share_net decimal(18,4);
    declare v_tmp_last_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_max_retracement decimal(18,12);
    declare v_query_str text;
    declare v_tmp_end_date int;
    declare v_achi_compa_pandl_ratio decimal(18,12);
    declare v_profit_year_ratio decimal(18,12);
    declare v_exe_sql_str varchar(10000);

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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_stock_code_no = p_stock_code_no;
    SET v_risk_free_interest_rate = p_risk_free_interest_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_share_net_total = 0;
    SET v_annual_yield = 0;
    SET v_stat_days = 0;
    SET v_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_end_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_share_net = 0;
    SET v_tmp_share_net_total = 0;
    SET v_share_net = 0;
    SET v_tmp_last_price = 0;
    SET v_last_price = 0;
    SET v_max_retracement = 0;
    SET v_query_str = " ";
    SET v_tmp_end_date = date_format(curdate(),'%Y%m%d');
    SET v_achi_compa_pandl_ratio = 0;
    SET v_profit_year_ratio = 0;
    SET v_exe_sql_str = " ";

    
    label_pro:BEGIN
    

    /* set @份额累计净值# =0; */
    set v_share_net_total =0;

    /* set @年化收益率# = 0; */
    set v_annual_yield = 0;

    /* set @份额累计净值# = 0; */
    set v_share_net_total = 0;

    /* set @统计天数# = 252; */
    set v_stat_days = 252;

    /* set @开始日期# = 0; */
    set v_begin_date = 0;

    /* set @结束日期# = 0; */
    set v_end_date = 0;
    #step1:产品净值-开始日期

    /* select t.{初始化日期} as {开始日期},t.{产品编号},ifnull(t.{份额净值},0) as {份额净值},ifnull(t.{份额累计净值},0) as {份额累计净值} */
    select t.init_date as begin_date,t.pd_no,ifnull(t.share_net,0) as share_net,ifnull(t.share_net_total,0) as share_net_total

    /* into @开始日期#,@产品编号#,@临时_份额净值#,@临时_份额累计净值# */
    into v_begin_date,v_pd_no,v_tmp_share_net,v_tmp_share_net_total

    /* from ~报表_报表数据_报表产品日净值^ t */
    from db_rpts.tb_rpt_pd_day_net t

    /* where {机构编号}=@操作员机构编号# and {产品编号}= @产品编号# and {初始化日期} < @查询开始日期# */
    where co_no=v_opor_co_no and pd_no= v_pd_no and init_date < v_qry_begin_date

    /* order by {初始化日期} desc limit 1; */
    order by init_date desc limit 1;
    #step1.1:产品当年成立

    /* if (ifnull(@开始日期#,0) = 0) then */
    if (ifnull(v_begin_date,0) = 0) then

    /* select t.{初始化日期} as {开始日期},t.{产品编号},ifnull(t.{份额净值},0) as {份额净值},ifnull(t.{份额累计净值},0) as {份额累计净值} */
    select t.init_date as begin_date,t.pd_no,ifnull(t.share_net,0) as share_net,ifnull(t.share_net_total,0) as share_net_total

    /* into @开始日期#,@产品编号#,@临时_份额净值#,@临时_份额累计净值# */
    into v_begin_date,v_pd_no,v_tmp_share_net,v_tmp_share_net_total

    /* from ~报表_报表数据_报表产品日净值^ t */
    from db_rpts.tb_rpt_pd_day_net t

    /* where {机构编号}=@操作员机构编号# and {产品编号}= @产品编号# and {初始化日期} >= @查询开始日期#  and {初始化日期} <= @查询结束日期# */
    where co_no=v_opor_co_no and pd_no= v_pd_no and init_date >= v_qry_begin_date  and init_date <= v_qry_end_date

    /* order by {初始化日期} limit 1; */
    order by init_date limit 1;
    end if;
    #step2:产品净值-结束日期

    /* select t.{初始化日期} as {结束日期},t.{产品编号},ifnull(t.{份额净值},0) as {份额净值},ifnull(t.{份额累计净值},0) as {份额累计净值} */
    select t.init_date as end_date,t.pd_no,ifnull(t.share_net,0) as share_net,ifnull(t.share_net_total,0) as share_net_total

    /* into @结束日期#,@产品编号#,@份额净值#,@份额累计净值# */
    into v_end_date,v_pd_no,v_share_net,v_share_net_total

    /* from ~报表_报表数据_报表产品日净值^ t */
    from db_rpts.tb_rpt_pd_day_net t

    /* where {机构编号}=@操作员机构编号# and {产品编号}= @产品编号# and {初始化日期} >= @查询开始日期#  and {初始化日期} <= @查询结束日期# */
    where co_no=v_opor_co_no and pd_no= v_pd_no and init_date >= v_qry_begin_date  and init_date <= v_qry_end_date

    /* order by {初始化日期} desc limit 1; */
    order by init_date desc limit 1;

    /* if (@结束日期# = 0 ) then */
    if (v_end_date = 0 ) then
    #不返回数据

    /* select * from ~报表_报表数据_报表产品年夏普比率^ t; */
    select * from db_rpts.tb_rpt_pd_year_sharperatio t;
    else
    #step3:业绩基准-开始日期

    /* select {最新价} into @临时_最新价# from ~报表_报表数据_指数行情表历史^ where {证券代码编号} = @证券代码编号# and {初始化日期}>=@开始日期# and {初始化日期}<=@结束日期# order by {初始化日期}  limit 1; */
    select last_price into v_tmp_last_price from db_rpts.tb_basesedt_index_quot_his where stock_code_no = v_stock_code_no and init_date>=v_begin_date and init_date<=v_end_date order by init_date  limit 1;

    /* set @临时_最新价# = ifnull(@临时_最新价#,0); */
    set v_tmp_last_price = ifnull(v_tmp_last_price,0);
    #step4:业绩基准-结束日期

    /* select {最新价} into @最新价# from ~报表_报表数据_指数行情表历史^ where  {证券代码编号} = @证券代码编号# and {初始化日期}>=@开始日期# and {初始化日期}<=@结束日期# order by {初始化日期}  desc limit 1; */
    select last_price into v_last_price from db_rpts.tb_basesedt_index_quot_his where  stock_code_no = v_stock_code_no and init_date>=v_begin_date and init_date<=v_end_date order by init_date  desc limit 1;

    /* set @最新价# = ifnull(@最新价#,0); */
    set v_last_price = ifnull(v_last_price,0);
    #step5:最大回撤

    /* SELECT max((t.{份额累计净值} - x.{份额累计净值}) / t.{份额累计净值}) as {最大回撤} */
    SELECT max((t.share_net_total - x.share_net_total) / t.share_net_total) as max_retracement

    /* into @最大回撤# */
    into v_max_retracement

    /* FROM ~报表_报表数据_报表产品日净值^ t join ~报表_报表数据_报表产品日净值^ x on (t.{机构编号},t.{产品编号}) = (x.{机构编号},x.{产品编号}) and t.{初始化日期} <= x.{初始化日期} */
    FROM db_rpts.tb_rpt_pd_day_net t join db_rpts.tb_rpt_pd_day_net x on (t.co_no,t.pd_no) = (x.co_no,x.pd_no) and t.init_date <= x.init_date

    /* where t.{机构编号}=@操作员机构编号# and t.{产品编号}= @产品编号# and t.{初始化日期} >= @查询开始日期#  and t.{初始化日期} <= @查询结束日期# and x.{初始化日期} >= @查询开始日期#  and x.{初始化日期} <= @查询结束日期#; */
    where t.co_no=v_opor_co_no and t.pd_no= v_pd_no and t.init_date >= v_qry_begin_date  and t.init_date <= v_qry_end_date and x.init_date >= v_qry_begin_date  and x.init_date <= v_qry_end_date;

    /* set @最大回撤# = ifnull(@最大回撤#,0); */
    set v_max_retracement = ifnull(v_max_retracement,0);
    #step6:收益率、业绩基准

    /* set @查询语句# = ""; */
    set v_query_str = "";

    /* set @查询语句# = concat(@查询语句#, " t.{初始化日期},t.{份额净值},t.{份额累计净值}"); */
    set v_query_str = concat(v_query_str, " t.init_date,t.share_net,t.share_net_total");

    /* set @查询语句# = concat(@查询语句#, ",IF(t.{份额累计净值} <= ",char(64),"{昨日份额累计净值},(",char(64),"{历史最高单位净值}:=GREATEST(",char(64),"{昨日份额累计净值},",char(64),"{历史最高单位净值})),(",char(64),"{历史最高单位净值}:=0))"); */
    set v_query_str = concat(v_query_str, ",IF(t.share_net_total <= ",char(64),"pre_share_net_total,(",char(64),"his_max_per_nav:=GREATEST(",char(64),"pre_share_net_total,",char(64),"his_max_per_nav)),(",char(64),"his_max_per_nav:=0))");

    /* set @查询语句# = concat(@查询语句#, ",IF(t.{份额累计净值} <= ",char(64),"{昨日份额累计净值},(",char(64),"{连续回撤幅度} := ",char(64),"{昨日份额累计净值} - t.{份额累计净值} + ",char(64),"{连续回撤幅度}),(",char(64),"{连续回撤幅度} :=0))"); */
    set v_query_str = concat(v_query_str, ",IF(t.share_net_total <= ",char(64),"pre_share_net_total,(",char(64),"day_continue_retracement := ",char(64),"pre_share_net_total - t.share_net_total + ",char(64),"day_continue_retracement),(",char(64),"day_continue_retracement :=0))");

    /* set @查询语句# = concat(@查询语句#, ",ifnull(",char(64),"{连续回撤幅度}/",char(64),"{历史最高单位净值},0) as {最大回撤}"); */
    set v_query_str = concat(v_query_str, ",ifnull(",char(64),"day_continue_retracement/",char(64),"his_max_per_nav,0) as max_retracement");

    /* set @查询语句# = concat(@查询语句#, ",ifnull((t.{份额累计净值} - ",char(64),"{昨日份额累计净值})/",char(64),"{昨日份额累计净值},0) as {日净值增长率},(",char(64),"{昨日份额累计净值}:={份额累计净值}) as {昨日份额累计净值}"); */
    set v_query_str = concat(v_query_str, ",ifnull((t.share_net_total - ",char(64),"pre_share_net_total)/",char(64),"pre_share_net_total,0) as pd_nav_day_ratio,(",char(64),"pre_share_net_total:=share_net_total) as pre_share_net_total");

    /* set @查询语句# = concat("select ",@查询语句#, " from ", "","~报表_报表数据_报表产品日净值^ t "); */
    set v_query_str = concat("select ",v_query_str, " from ", "","db_rpts.tb_rpt_pd_day_net t ");

    /* set @查询语句# = concat(@查询语句#, ",(SELECT ",char(64),"{连续回撤幅度} := 0,",char(64),"{历史最高单位净值} := 0,",char(64),"{昨日份额累计净值}:=0) as px "); */
    set v_query_str = concat(v_query_str, ",(SELECT ",char(64),"day_continue_retracement := 0,",char(64),"his_max_per_nav := 0,",char(64),"pre_share_net_total:=0) as px ");

    /* set @查询语句# = concat(@查询语句#, " where {机构编号}=",@操作员机构编号#," and {产品编号}=",@产品编号#," and {初始化日期} between ",ifnull(@开始日期#,0), " and ", ifnull(@结束日期#,0)); */
    set v_query_str = concat(v_query_str, " where co_no=",v_opor_co_no," and pd_no=",v_pd_no," and init_date between ",ifnull(v_begin_date,0), " and ", ifnull(v_end_date,0));

    /* set @查询语句# = concat(@查询语句#, " order by {初始化日期}" ); */
    set v_query_str = concat(v_query_str, " order by init_date" );
    #step8:最后交易日

    /* SELECT MAX(t.trade_date) INTO @临时_结束日期# from ~报表_报表数据_交易日期表^ t where DATE_FORMAT(t.trade_date,'%Y') = DATE_FORMAT(@结束日期#,'%Y') and t.is_open = 1; */
    SELECT MAX(t.trade_date) INTO v_tmp_end_date from db_rpts.tb_rpt_trade_date t where DATE_FORMAT(t.trade_date,'%Y') = DATE_FORMAT(v_end_date,'%Y') and t.is_open = 1;
    #step7:收益率(年化)，两个特殊情况：1.成立年；2.当前年
    #if (DATE_FORMAT(@开始日期#,'%Y')  = DATE_FORMAT(@结束日期#,'%Y')) or ( @结束日期#  < @临时_结束日期#  ) then
    #set @年化收益率# = round(ifnull((@份额累计净值# - @临时_份额累计净值#)/@临时_份额累计净值#,0),6) / DATEDIFF(@结束日期#,@开始日期#) * 365;
    #set @业绩比较基准收益率# = (@最新价# - @临时_最新价#)/@临时_最新价# / DATEDIFF(@结束日期#,@开始日期#) * 365;
    #else
    # 年化收益率 改为 绝对收益率

    /* set @年化收益率# = round(ifnull((@份额累计净值# - @临时_份额累计净值#)/@临时_份额累计净值#,0),6) ; */
    set v_annual_yield = round(ifnull((v_share_net_total - v_tmp_share_net_total)/v_tmp_share_net_total,0),6) ;

    /* set @业绩比较基准收益率# = (@最新价# - @临时_最新价#)/@临时_最新价#; */
    set v_achi_compa_pandl_ratio = (v_last_price - v_tmp_last_price)/v_tmp_last_price;
    #end if;

    /* set @年化收益率# = ifnull(@年化收益率#,0); */
    set v_annual_yield = ifnull(v_annual_yield,0);

    /* set @当年收益率# = ifnull(round(ifnull((@份额累计净值# - @临时_份额累计净值#)/@临时_份额累计净值#,0),6),0); */
    set v_profit_year_ratio = ifnull(round(ifnull((v_share_net_total - v_tmp_share_net_total)/v_tmp_share_net_total,0),6),0);

    /* set @执行语句# = concat(ifnull(@开始日期#,0)," as {开始日期},",ifnull(@结束日期#,0)," as {结束日期},",ifnull(@产品编号#,0)," as {产品编号},",ifnull(@份额净值#,0)," as {份额净值},",ifnull(@份额累计净值#,0)," as {份额累计净值},",@年化收益率#," as {年化收益率}"); */
    set v_exe_sql_str = concat(ifnull(v_begin_date,0)," as begin_date,",ifnull(v_end_date,0)," as end_date,",ifnull(v_pd_no,0)," as pd_no,",ifnull(v_share_net,0)," as share_net,",ifnull(v_share_net_total,0)," as share_net_total,",v_annual_yield," as annual_yield");

    /* set @执行语句# = concat(@执行语句#,",", round(ifnull(@业绩比较基准收益率#,0),6) ," as {业绩比较基准收益率}"); */
    set v_exe_sql_str = concat(v_exe_sql_str,",", round(ifnull(v_achi_compa_pandl_ratio,0),6) ," as achi_compa_pandl_ratio");

    /* set @执行语句# = concat(@执行语句#,“,”,ifnull(@最大回撤#,0)," as {最大回撤}"); */
    set v_exe_sql_str = concat(v_exe_sql_str,",",ifnull(v_max_retracement,0)," as max_retracement");

    /* set @执行语句# = concat(@执行语句#,",STDDEV_SAMP({日净值增长率}) as {净值增长率标准差}"); */
    set v_exe_sql_str = concat(v_exe_sql_str,",STDDEV_SAMP(pd_nav_day_ratio) as net_growth_rate_stdev");

    /* set @执行语句# = concat(@执行语句#,",",ifnull(@当年收益率# ,0)," as {当年收益率}"); */
    set v_exe_sql_str = concat(v_exe_sql_str,",",ifnull(v_profit_year_ratio ,0)," as profit_year_ratio");
    #step8:年化收益率，往年直接取，当年*250的天数

    /* if (DATE_FORMAT(@开始日期#,'%Y')  = DATE_FORMAT(@结束日期#,'%Y')) or ( @结束日期#  < @临时_结束日期#  ) then */
    if (DATE_FORMAT(v_begin_date,'%Y')  = DATE_FORMAT(v_end_date,'%Y')) or ( v_end_date  < v_tmp_end_date  ) then

    /* set @执行语句# = concat(@执行语句#,",(",ifnull((@份额累计净值# - @临时_份额累计净值#)/@临时_份额累计净值#,0),"/count(*)*",@统计天数#," - ",@无风险利率#,") / STDDEV_SAMP({日净值增长率}) / SQRT(",@统计天数#,")AS {夏普比率}"); */
    set v_exe_sql_str = concat(v_exe_sql_str,",(",ifnull((v_share_net_total - v_tmp_share_net_total)/v_tmp_share_net_total,0),"/count(*)*",v_stat_days," - ",v_risk_free_interest_rate,") / STDDEV_SAMP(pd_nav_day_ratio) / SQRT(",v_stat_days,")AS sharpe_ration");
    else

    /* set @执行语句# = concat(@执行语句#,",(",ifnull((@份额累计净值# - @临时_份额累计净值#)/@临时_份额累计净值#,0)," - ",@无风险利率#,") / STDDEV_SAMP({日净值增长率}) / SQRT(",@统计天数#,") AS {夏普比率}"); */
    set v_exe_sql_str = concat(v_exe_sql_str,",(",ifnull((v_share_net_total - v_tmp_share_net_total)/v_tmp_share_net_total,0)," - ",v_risk_free_interest_rate,") / STDDEV_SAMP(pd_nav_day_ratio) / SQRT(",v_stat_days,") AS sharpe_ration");
    end if;

    /* set @执行语句# = concat("select ",@执行语句#," from (",@查询语句#,") t"); */
    set v_exe_sql_str = concat("select ",v_exe_sql_str," from (",v_query_str,") t");

    /* [执行语句][@执行语句#] */
    set @tmp_sql = v_exe_sql_str;
    PREPARE stmt from @tmp_sql;
    EXECUTE stmt;
    set @tmp_sql = '';
    DEALLOCATE PREPARE stmt;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_报表查询_查询平台产品月收益率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rpt_Qry_pf_pd_monthRatio;;
DELIMITER ;;
CREATE PROCEDURE pra_rpt_Qry_pf_pd_monthRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* SELECT a.{产品编号},c.{初始化日期},{业务日期},a.{份额累计净值},b.{份额累计净值} AS {昨日净值},(a.{份额累计净值}-b.{份额累计净值})/b.{份额累计净值} AS {一个月收益率}  FROM ~报表_报表数据_报表产品日净值^ a,~报表_报表数据_报表产品日净值^ b, */
    SELECT a.pd_no,c.init_date,busin_date,a.share_net_total,b.share_net_total AS pre_nav,(a.share_net_total-b.share_net_total)/b.share_net_total AS return_ratio_in_single_month  FROM db_rpts.tb_rpt_pd_day_net a,db_rpts.tb_rpt_pd_day_net b,

        /* (SELECT a.{机构编号},a.{产品编号},MAX(b.{初始化日期}) AS {初始化日期},MAX(a.{初始化日期}) AS {业务日期} FROM ~报表_报表数据_报表产品日净值^ a, ~报表_报表数据_报表产品日净值^ b */
        (SELECT a.co_no,a.pd_no,MAX(b.init_date) AS init_date,MAX(a.init_date) AS busin_date FROM db_rpts.tb_rpt_pd_day_net a, db_rpts.tb_rpt_pd_day_net b

                    /* WHERE a.{机构编号} = @机构编号# AND a.{产品编号} = @产品编号# AND  a.{机构编号}=b.{机构编号} AND a.{产品编号}=b.{产品编号} AND LEFT(a.{初始化日期},6)<LEFT(b.{初始化日期},6) */
                    WHERE a.co_no = v_co_no AND a.pd_no = v_pd_no AND  a.co_no=b.co_no AND a.pd_no=b.pd_no AND LEFT(a.init_date,6)<LEFT(b.init_date,6)

                    /* GROUP BY LEFT(b.{初始化日期},6))c */
                    GROUP BY LEFT(b.init_date,6))c

                    /* WHERE a.{机构编号}=b.{机构编号} AND a.{机构编号}=c.{机构编号} AND a.{产品编号}=b.{产品编号} AND a.{产品编号}=c.{产品编号} AND a.{初始化日期}=c.{初始化日期} AND b.{初始化日期}=c.{业务日期} */
                    WHERE a.co_no=b.co_no AND a.co_no=c.co_no AND a.pd_no=b.pd_no AND a.pd_no=c.pd_no AND a.init_date=c.init_date AND b.init_date=c.busin_date

                    /* AND a.{机构编号}= @机构编号# AND a.{产品编号}=@产品编号# and a.{初始化日期} between @查询开始日期# and @查询结束日期#; */
                    AND a.co_no= v_co_no AND a.pd_no=v_pd_no and a.init_date between v_qry_begin_date and v_qry_end_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


